%>  \brief
%>  This is the base class for generating objects
%>  that contain the contents of a restart file
%>  generated by a ParaMonte sampler.<br>
%>  This class is meant to be primarily internally
%>  used by the ParaMonte MATLAB library samplers.
%>
%>  \warning
%>  The attributes of this class are considered
%>  internal implementation of the ParaMonte library.
%>  As such, the interface of this class may change over time.
%>
%>  \brief
%>  See the documentation of the class constructor.
%>
%>  \note
%>  See below for information on the attributes (properties).
%>
%>  \note
%>  See below for information on the methods.
%>
%>  \return
%>  An object of class ``pm.sampling.FileContentsRestartDRAM``.
%>
%>  \interface{FileContentsRestartDRAM}
%>  \code{.m}
%>
%>      contents = pm.sampling.FileContentsRestartDRAM(file)
%>      contents = pm.sampling.FileContentsRestartDRAM(file, [])
%>      contents = pm.sampling.FileContentsRestartDRAM(file, silent)
%>
%>  \endcode
%>  \final{FileContentsRestartDRAM}
%>
%>  \author
%>  \JoshuaOsborne, May 21 2024, 3:26 AM, University of Texas at Arlington<br>
%>  \FatemehBagheri, May 20 2024, 1:25 PM, NASA Goddard Space Flight Center, Washington, D.C.<br>
%>  \AmirShahmoradi, May 16 2016, 9:03 AM, Oden Institute for Computational Engineering and Sciences (ICES), UT Austin<br>
classdef FileContentsRestartDRAM < pm.sampling.FileContentsRestart

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    properties(Access = public)
        %>
        %>  \param[in]  meanAcceptanceRateSinceStart    :   The real-valued MATLAB array of rank ``1`` of
        %>                                                  shape ``(1:self.count)`` containing the set of
        %>                                                  average MCMC acceptance rates of the sampler proposal
        %>                                                  distribution over the course of the simulation.
        %>
        meanAcceptanceRateSinceStart = [];
        %
        %   \param[in]  proposalAdaptiveScaleSq         :   The real-valued MATLAB array of rank ``1`` of
        %                                                   shape ``(1:self.count)`` containing the set of
        %                                                   adaptive squared scale factors of the sampler proposal
        %                                                   distribution over the course of the simulation.
        %
        proposalAdaptiveScaleSq = [];
        %
        %   \param[in]  proposalCor                     :   The real-valued MATLAB array of rank ``3`` of
        %                                                   shape ``(self.ndim, self.ndim, self.count)`` containing
        %                                                   the set of correlation matrices of the proposal distribution
        %                                                   of the sampler, representing the evolution of the proposal
        %                                                   correlation matrix over the course of the simulation.
        %
        proposalCor = [];
        %
        %   \param[in]  proposalCov                     :   The real-valued MATLAB array of rank ``3`` of
        %                                                   shape ``(1:self.ndim, 1:self.ndim, 1:self.count)`` containing
        %                                                   the set of covariance matrices of the proposal distribution
        %                                                   of the sampler, representing the evolution of the proposal
        %                                                   covariance matrix over the course of the simulation.
        %
        proposalCov = [];
        %
        %   \param[in]  proposalLogVolume               :   The real-valued MATLAB array of rank ``1`` of
        %                                                   shape ``(1:self.count)`` containing the set of
        %                                                   ``log(determinant(covmat))`` of the proposal distribution
        %                                                   representing the evolution of mean of proposal distribution
        %                                                   over the course of the simulation.
        %
        proposalLogVolume = [];
        %
        %   \param[in]  proposalMean                    :   The real-valued MATLAB array of rank ``2`` of
        %                                                   shape ``(1:self.ndim, 1:self.count)`` containing
        %                                                   the set of mean vectors of the proposal distribution
        %                                                   of the sampler, representing the evolution of the proposal
        %                                                   mean over the course of the simulation.
        %
        proposalMean = [];
        %
        %   \param[in]  uniqueStateVisitCount           :   The scalar MATLAB integer containing the number of
        %                                                   states uniquely visited within the domain of the
        %                                                   objective function up to the stage specified
        %                                                   within the specified restart file.
        %
        uniqueStateVisitCount = [];
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    methods(Access = public)

        %>  \brief
        %>  Return a scalar object of class ``pm.sampling.FileContentsRestartDRAM``.
        %>
        %>  This is the constructor of the class ``pm.sampling.FileContentsRestartDRAM``.
        %>
        %>  \param[in]  file    :   The input scalar MATLAB string
        %>                          containing the path to an external report file.
        %>
        %>  \param[in]  silent  :   See the corresponding argument of ``pm.sampling.FileContentsRestart`` class.
        %>                          (**optional**. The default is set by ``pm.sampling.FileContentsRestart``.)
        %>
        %>  \return
        %>  `self`              :   The output scalar object of class ``pm.sampling.FileContentsRestartDRAM``.
        %>
        %>  \interface{FileContentsRestartDRAM}
        %>  \code{.m}
        %>
        %>      contents = pm.sampling.FileContentsRestartDRAM(file)
        %>      contents = pm.sampling.FileContentsRestartDRAM(file, [])
        %>      contents = pm.sampling.FileContentsRestartDRAM(file, silent)
        %>      contents = pm.sampling.FileContentsRestartDRAM(file, [], [])
        %>      contents = pm.sampling.FileContentsRestartDRAM(file, silent, [])
        %>      contents = pm.sampling.FileContentsRestartDRAM(file, silent, method)
        %>
        %>  \endcode
        %>  \final{FileContentsRestartDRAM}
        %>
        %>  \author
        %>  \JoshuaOsborne, May 21 2024, 3:31 AM, University of Texas at Arlington<br>
        %>  \FatemehBagheri, May 20 2024, 1:25 PM, NASA Goddard Space Flight Center, Washington, D.C.<br>
        %>  \AmirShahmoradi, May 16 2016, 9:03 AM, Oden Institute for Computational Engineering and Sciences (ICES), UT Austin<br>
        function self = FileContentsRestartDRAM(file, silent)
            if  nargin < 2
                silent = [];
            end
            self = self@pm.sampling.FileContentsRestart(file, silent, "ParaDRAM");

            %%%%
            %%%% find the update count in the file.
            %%%%

            self.count = count(self.contents, 'uniqueStateVisitCount');

            %%%%
            %%%% Parse the restart file contents.
            %%%%

            cholupp = zeros(self.ndim, self.ndim);
            self.meanAcceptanceRateSinceStart   = zeros(self.count, 1);
            self.proposalAdaptiveScaleSq        = zeros(self.count, 1);
            self.proposalLogVolume              = zeros(self.count, 1);
            self.proposalMean                   = zeros(self.ndim, self.count);
            self.proposalCov                    = zeros(self.ndim, self.ndim, self.count);
            self.proposalCor                    = zeros(self.ndim, self.ndim, self.count);
            self.uniqueStateVisitCount          = zeros(self.count, 1);
            skip = 10 + self.ndim * (self.ndim + 3) / 2;
            icount = 0;
            istart = 1;

            while istart < length(self.lineList) - skip

                if ~strcmp(self.lineList{self.ilast + istart}, self.lineList{self.ilast + istart + 2})
                    icount = icount + 1;
                    if mod(icount, 10) == 0
                        self.spinner.spin(icount / self.count);
                    end
                    self.meanAcceptanceRateSinceStart   (icount) = str2double(self.lineList(self.ilast + istart + 1));
                    self.uniqueStateVisitCount          (icount) = str2double(self.lineList(self.ilast + istart + 3));
                    self.proposalAdaptiveScaleSq        (icount) = str2double(self.lineList(self.ilast + istart + 5));
                    self.proposalLogVolume              (icount) = str2double(self.lineList(self.ilast + istart + 7));
                    istart = istart + 9;
                    iend = istart + self.ndim;
                    self.proposalMean(1 : self.ndim, icount) = str2double(self.lineList(self.ilast + istart : self.ilast + iend - 1));
                    for idim = 1 : self.ndim % covmat
                        istart = iend + 1;
                        iend = iend + idim;
                        cholupp(1 : idim, idim) = str2double(self.lineList(self.ilast + istart : self.ilast + iend)); % This is the upper Cholesky.
                    end
                    self.proposalCov(:, :, icount) = cholupp' * cholupp;
                    istart = iend + 1;
                else
                    istart = istart + 2;
                end

            end

            %%%%
            %%%% Ensure the instrinc ``corrcov`` is installed.
            %%%%

            try

                for icount = 1 : size(self.proposalCov, 3)
                    self.proposalCor(:, :, icount) = corrcov(squeeze(self.proposalCov(:, :, icount)));
                end

            catch me

                self.proposalCor = self.proposalCov;
                warning ( newline ...
                        + string(me.identifier) + " : " + string(me.message) + newline ...
                        + "The component ``proposalCor`` will be set to the same values as the component ``proposalCov``." + newline ...
                        + newline ...
                        );

            end

            self.spinner.spin(1);
            self.checkpoint([]);

        end % constructor

    end % methods(Access = public)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    methods(Access = public, Hidden)

        function warn(self)
            warning ( newline ...
                    + "The structure of the file:" + newline ...
                    + newline ...
                    + pm.io.tab + self.file + newline ...
                    + newline ...
                    + "does not match a DRAM-class restart file." + newline ...
                    + "The contents of the file may have been compromised." + newline ...
                    + "Verify the integrity of the file contents before attempting a reread." + newline ...
                    );
        end

    end % methods(Access = Hidden)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end % classdef
