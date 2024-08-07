%>  \brief
%>  This is the base class for generating objects
%>  that contain the contents of a sample/chain file
%>  generated by a ParaMonte sampler.<br>
%>  This class is meant to be primarily internally
%>  used by the ParaMonte MATLAB library samplers.<br>
%>  See the documentation of the class constructor.
%>
%>  \note
%>  See below for information on the attributes (properties).
%>
%>  \note
%>  See below for information on the methods.
%>
%>  \return
%>  An object of class ``pm.sampling.FileContentsSample``.
%>
%>  \interface{FileContentsSample}
%>  \code{.m}
%>
%>      contents = pm.sampling.FileContentsSample(file)
%>      contents = pm.sampling.FileContentsSample(file, [])
%>      contents = pm.sampling.FileContentsSample(file, silent)
%>      contents = pm.sampling.FileContentsSample(file, [], sep)
%>      contents = pm.sampling.FileContentsSample(file, silent, sep)
%>
%>  \endcode
%>  \final{FileContentsSample}
%>
%>  \author
%>  \JoshuaOsborne, May 21 2024, 3:32 AM, University of Texas at Arlington<br>
%>  \FatemehBagheri, May 20 2024, 1:25 PM, NASA Goddard Space Flight Center, Washington, D.C.<br>
%>  \AmirShahmoradi, May 16 2016, 9:03 AM, Oden Institute for Computational Engineering and Sciences (ICES), UT Austin<br>
classdef FileContentsSample < pm.io.FileContentsTabular

    properties(Access = public)
        %>
        %>  \param[in]  stats                   :   The scalar MATLAB object containing the set of
        %>                                          computed properties of the contents of the file.
        %>
        stats = [];
        %>
        %>  \param[in]  ndim                    :   The scalar MATLAB integer representing the number of
        %>                                          dimensions of the domain of the objective function sampled.
        %>                                          This integer is also the number of columns in the file that
        %>                                          correspond that contain the sampled states from the domain
        %>                                          of the mathematical objective function.
        %>
        ndim = 0;
        %>
        %>  \param[in]  sampleLogFuncColIndex   :   The scalar MATLAB integer representing the column
        %>                                          index of the dataframe component ``df`` that contains
        %>                                          the natural logarithm of the objective function values
        %>                                          corresponding to the sampled states next to this column,
        %>                                          such that,<br>
        %>                                              FileContentsSample.ndim =
        %>                                              FileContentsSample.ncol -
        %>                                              FileContentsSample.sampleLogFuncColIndex<br>
        %>                                          holds. While this column index can be readily inferred by exploring
        %>                                          the contents of the dataframe component, this column index is also
        %>                                          computed and explicitly offered to conveniently slice the values of
        %>                                          the sampled states and their corresponding log-function values.
        %>
        sampleLogFuncColIndex = 0;
    end

    properties(Hidden)
        %>
        %>  \param[in]  sampleLogFuncColName    :   The scalar MATLAB string representing the column
        %>                                          name of the dataframe component ``df`` that contains
        %>                                          the natural logarithm of the objective function values
        %>                                          corresponding to the sampled states next to this column.
        %>
        sampleLogFuncColName = "sampleLogFunc";
    end

    methods(Access = public)

        %>  \brief
        %>  Return a scalar object of class ``pm.sampling.FileContentsSample``.<br>
        %>  This is the constructor of the class ``pm.sampling.FileContentsSample``.
        %>
        %>  \param[in]  file    :   The input scalar MATLAB string
        %>                          containing the path to an external file.
        %>
        %>  \param[in]  silent  :   See the corresponding argument of ``pm.sampling.FileContentsRestart`` class.
        %>                          (**optional**. The default is set by ``pm.sampling.FileContentsRestart``.)
        %>
        %>  \param[in]  sep     :   The input scalar MATLAB string
        %>                          containing the field separator used in the file.
        %>                          (**optional**, default = ``","``)
        %>
        %>  \return
        %>  `self`              :   The output scalar object of class ``pm.sampling.FileContentsSample``.
        %>
        %>  \interface{FileContentsSample}
        %>  \code{.m}
        %>
        %>      contents = pm.sampling.FileContentsSample(file)
        %>      contents = pm.sampling.FileContentsSample(file, [])
        %>      contents = pm.sampling.FileContentsSample(file, silent)
        %>      contents = pm.sampling.FileContentsSample(file, [], [])
        %>      contents = pm.sampling.FileContentsSample(file, [], sep)
        %>      contents = pm.sampling.FileContentsSample(file, silent, [])
        %>      contents = pm.sampling.FileContentsSample(file, silent, sep)
        %>
        %>  \endcode
        %>  \final{FileContentsSample}
        %>
        %>  \author
        %>  \JoshuaOsborne, May 21 2024, 3:36 AM, University of Texas at Arlington<br>
        %>  \FatemehBagheri, May 20 2024, 1:25 PM, NASA Goddard Space Flight Center, Washington, D.C.<br>
        %>  \AmirShahmoradi, May 16 2016, 9:03 AM, Oden Institute for Computational Engineering and Sciences (ICES), UT Austin<br>
        function self = FileContentsSample(file, silent, sep)
            if nargin < 3
                sep = [];
            end
            if nargin < 2
                silent = [];
            end
            self = self@pm.io.FileContentsTabular(file, silent, sep);

            for icol = 1 : self.ncol
                if strcmpi(self.df.Properties.VariableNames{icol}, self.sampleLogFuncColName)
                    break;
                end
            end
            self.sampleLogFuncColIndex = icol;
            self.ndim = self.ncol - self.sampleLogFuncColIndex;
            if  self.nrow <= self.ndim
                warning ( newline ...
                        + "There are insufficient number of states in the specified file:" + newline ...
                        + newline ...
                        + pm.io.tab() + self.file + newline ...
                        + newline ...
                        + "for computing the covariance/correlation matrices. Skipping..." + newline ...
                        + newline ...
                        );
                return;
            end

            %%%%
            %%%% statistics
            %%%%

            self.stats = struct();

            %%%% Add chain cormat.

            self.checkpoint("computing the sample correlation matrix...", false);
            self.stats.cor = pm.stats.Cor(self.df(:, self.sampleLogFuncColIndex + 1 : end));
            self.checkpoint();

            %%%% Add chain covmat.

            self.checkpoint("computing the sample covariance matrix...", false);
            self.stats.cov = pm.stats.Cov(self.df(:, self.sampleLogFuncColIndex + 1 : end));
            self.checkpoint();

            %%%% Add chain acf.

            self.checkpoint("computing the sample autocorrelation...", false);
            self.stats.acf = pm.stats.AutoCorr(self.df(:, self.sampleLogFuncColIndex : end));
            self.checkpoint();

            self.stats.max = struct("val", [], "loc", []);
            self.stats.min = struct("val", [], "loc", []);

            %%%% The `{:,:}` slice is essential in MATLAB ~2020a.

            [self.stats.max.val, self.stats.max.loc] = max(self.df{:,:});
            [self.stats.min.val, self.stats.min.loc] = min(self.df{:,:});
            self.stats.avg = mean(self.df{:,:});
            self.stats.std = std(self.df{:,:});

        end

    end

end
