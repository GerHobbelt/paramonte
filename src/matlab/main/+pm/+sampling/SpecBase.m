%>  \brief
%>  This is the base class for the ParaMonte sampler basic specifications.<br>
%>
%>  \details
%>  This is a low-level class that is not meant to be used by the user.<br>
%>
%>  \note
%>  See the documentation of the class constructor.<br>
%>
%>  \note
%>  All class attributes can be set after constructing an instance of this class.<br>
%>
%>  \note
%>  See below for information on the methods.<br>
%>
%>  \see
%>  [ParaDRAM simulation specifications listing](\pmdoc_usage_sampling/paradram/specifications/)<br>
%>
%>  \final{SpecBase}
%>
%>  \author
%>  \JoshuaOsborne, May 21 2024, 3:38 AM, University of Texas at Arlington<br>
%>  \FatemehBagheri, May 20 2024, 1:25 PM, NASA Goddard Space Flight Center (GSFC), Washington, D.C.<br>
%>  \AmirShahmoradi, May 16 2016, 9:03 AM, Oden Institute for Computational Engineering and Sciences (ICES), UT Austin<br>
classdef SpecBase < pm.matlab.Handle

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    properties
        %> \specdram{description}
        description = [];
        %> \specdram{domain}
        domain = [];
        %> \specdram{domainaxisname}
        domainAxisName = [];
        %> \specdram{domainballavg}
        domainBallAvg = [];
        %> \specdram{domainballcor}
        domainBallCor = [];
        %> \specdram{domainballcov}
        domainBallCov = [];
        %> \specdram{domainballstd}
        domainBallStd = [];
        %> \specdram{domaincubelimitlower}
        domainCubeLimitLower = [];
        %> \specdram{domaincubelimitupper}
        domainCubeLimitUpper = [];
        %> \specdram{domainerrcount}
        domainErrCount = [];
        %> \specdram{domainerrcountmax}
        domainErrCountMax = [];
        %> \specdram{outputchainfileformat}
        outputChainFileFormat = [];
        %> \specdram{outputcolumnwidth}
        outputColumnWidth = [];
        %> \specdram{outputfilename}
        outputFileName = [];
        %> \specdram{outputstatus}
        outputStatus = [];
        %> \specdram{outputprecision}
        outputPrecision = [];
        %> \specdram{outputreportperiod}
        outputReportPeriod = [];
        %> \specdram{outputrestartfileformat}
        outputRestartFileFormat = [];
        %> \specdram{outputsamplesize}
        outputSampleSize = [];
        %> \specdram{outputseparator}
        outputSeparator = [];
        %> \specdram{outputsplashmode}
        outputSplashMode = [];
        %> \specdram{parallelism}
        parallelism = [];
        %> \specdram{parallelismmpifinalizeenabled}
        parallelismMpiFinalizeEnabled = [];
        %> \specdram{parallelismnumthread}
        parallelismNumThread = [];
        %> \specdram{randomseed}
        randomSeed = [];
        %> \specdram{targetacceptancerate}
        targetAcceptanceRate = [];
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    properties(Hidden, Access = protected)
        url = "https://www.cdslab.org/paramonte/generic/" + pm.lib.version("generic", "major") + "/usage/sampling/paradram/specifications/";
        method = "sampler";
        silent = false;
        nmlsep = " ";
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    methods(Access = public)

        %>  \brief
        %>  Construct and return an object of class [pm.sampling.SpecBase](@ref SpecBase).
        %>
        %>  \param[in]  method  :   The input scalar MATLAB string containing
        %>                          the name of the specific ParaMonte sampler
        %>                          whose simulation specifications are to be
        %>                          stored in the output of this constructor.<br>
        %>  \param[in]  silent  :   The input scalar MATLAB logical.<br>
        %>                          If ``true``, all descriptive messages on
        %>                          the MATLAB command line will be suppressed.<br>
        %>                          (**optional**, default = ``false``)
        %>
        %>  \return
        %>  The output scalar object of class [pm.sampling.SpecBase](@ref SpecBase).<br>
        %>
        %>  \see
        %>  [ParaDRAM simulation specifications listing](\pmdoc_usage_sampling/paradram/specifications/)<br>
        %>
        %>  \interface{SpecBase}
        %>  \code{.m}
        %>
        %>      spec = pm.sampling.SpecBase()
        %>      spec = pm.sampling.SpecBase([])
        %>      spec = pm.sampling.SpecBase([], [])
        %>      spec = pm.sampling.SpecBase(method)
        %>      spec = pm.sampling.SpecBase(method, [])
        %>      spec = pm.sampling.SpecBase([], silent)
        %>      spec = pm.sampling.SpecBase(method, silent)
        %>
        %>  \endcode
        %>
        %>  \final{SpecBase}
        %>
        %>  \author
        %>  \JoshuaOsborne, May 21 2024, 3:40 AM, University of Texas at Arlington<br>
        %>  \FatemehBagheri, May 20 2024, 1:25 PM, NASA Goddard Space Flight Center (GSFC), Washington, D.C.<br>
        %>  \AmirShahmoradi, May 16 2016, 9:03 AM, Oden Institute for Computational Engineering and Sciences (ICES), UT Austin<br>
        function self = SpecBase(method, silent)
            if  nargin < 2
                silent = [];
            end
            if  nargin < 1
                method = [];
            end
            if ~isempty(silent)
                self.silent = silent;
            end
            if ~isempty(method)
                self.method = method;
            end
            %self.ndim = ndim;
            %valid = false;
            %if isa(ndim, "real") || isa(ndim, "int32")
            %    if rem(ndim, 1) == 0
            %        self.ndim = ndim;
            %        valid = true;
            %    end
            %end
            %if ~valid
            %    disp("ndim = ");
            %    disp(ndim);
            %    error   ( newline ...
            %            + "The specified input value for ``ndim`` (" + string(ndim) + ") must be a whole number (integer)." + newline ...
            %            + "The variable ``ndim`` represents the number of dimensions of the domain" + newline ...
            %            + "of the object function that is to be explored." + newline ...
            %            + newline ...
            %            );
            %end
        end

        %>  \brief
        %>  Return documentation help for the input simulation specification name.<br>
        %>
        %>  \details
        %>  Otherwise, return documentation help for all simulation specifications
        %>  if the input ``specification`` argument is missing.<br>
        %>
        %>  \devnote
        %>  The underlying reason for unifying documentation of object attributes
        %>  within a single online page is to significantly reduce duplication and
        %>  work required for generating and maintaining such documentation across
        %>  all supported programming language environments.<br>
        %>
        %>  \param[in]  self            :   The input parent object of class [pm.sampling.SpecBase](@ref SpecBase)
        %>                                  which is **implicitly** passed to this dynamic method (not by the user).<br>
        %>  \param[in]  specification   :   The input scalar MATLAB string containing the
        %>                                  name of a simulation specification corresponding
        %>                                  an attribute of the parent object.<br>
        %>
        %>  \return
        %>  ``weblink``                 :   The output scalar MATLAB string containing the web address
        %>                                  for the documentation of the requested simulation specification.<br>
        %>
        %>  \interface{doc}
        %>  \code{.m}
        %>
        %>      weblink = self.doc()
        %>      weblink = self.doc(specification)
        %>
        %>  \endcode
        %>  \example{doc}
        %>  \code{.m}
        %>
        %>      spec = pm.sampling.SpecBase();
        %>
        %>      spec.doc()                 % return help for all specifications.
        %>      spec.doc("outputFileName") % return help for the specification ``outputFileName``.
        %>
        %>  \endcode
        %>
        %>  \final{doc}
        %>
        %>  \author
        %>  \JoshuaOsborne, May 21 2024, 3:42 AM, University of Texas at Arlington<br>
        %>  \FatemehBagheri, May 20 2024, 1:25 PM, NASA Goddard Space Flight Center (GSFC), Washington, D.C.<br>
        %>  \AmirShahmoradi, May 16 2016, 9:03 AM, Oden Institute for Computational Engineering and Sciences (ICES), UT Austin<br>
        function weblink = doc(self, specification)

            if  nargin < 2
                weblink = pm.web.href(self.url);
            else
                if isstring(specification) || ischar(specification)
                    specList = properties(self);
                    specListLen = length(specList);
                    for i = 1 : specListLen
                        if strcmpi(specList{i}, specification)
                            specLower = "#" + lower(specification);
                            weblink = pm.web.href(self.url + specLower);
                            return;
                        end
                    end
                    error   ( newline ...
                            + "The input specification must be a string or char vector " + newline ...
                            + "whose value is the name of one of the specification properties" + newline ...
                            + "of the sampler as specified in the ``spec`` component." + newline ...
                            + "Example usage:" + newline ...
                            + newline ...
                            + pm.io.tab() + "doc()" + newline ...
                            + pm.io.tab() + "doc(""chainSize"")" + newline ...
                            + newline ...
                            );
                end
            end
        end

    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    methods(Hidden)

        %>  \brief
        %>  Ensure all specification properties of the parent object are sensible.<br>
        %>  This is a dynamic method of the class [pm.sampling.SpecBase](@ref SpecBase).<br>
        %>
        %>  \param[inout]   self        :   The input/output parent object of class [pm.sampling.SpecBase](@ref SpecBase)
        %>                                  which is **implicitly** passed to this dynamic method (not by the user).<br>
        %>  \param[in]      ndim        :   The input scalar MATLAB integer containing
        %>                                  the number of dimensions of the domain of the
        %>                                  object function that is to be explored.<br>
        %>
        %>  \return
        %>  ``entries``                 :   The output scalar MATLAB string containing
        %>                                  the simulation specifications converted to
        %>                                  a Fortran-namelist-compatible entry.<br>
        %>
        %>  \interface{getEntriesNML}
        %>  \code{.m}
        %>
        %>      entries = self.getEntriesNML(ndim)
        %>
        %>  \endcode
        %>
        %>  \final{getEntriesNML}
        %>
        %>  \author
        %>  \JoshuaOsborne, May 21 2024, 3:43 AM, University of Texas at Arlington<br>
        %>  \FatemehBagheri, May 20 2024, 1:25 PM, NASA Goddard Space Flight Center (GSFC), Washington, D.C.<br>
        %>  \AmirShahmoradi, May 16 2016, 9:03 AM, Oden Institute for Computational Engineering and Sciences (ICES), UT Austin<br>
        function entries = getEntriesNML(self, ndim)
            if  isempty(self.outputFileName)
                % First define ``outputFileName`` if it is empty.
                self.outputFileName = fullfile(string(pwd), pm.io.getFileName(self.method));
            elseif pm.introspection.verified(self.outputFileName, "string", 1)
                if ~self.silent && contains(self.outputFileName, " ")
                    warning ( newline ...
                            + "The specified simulation specification ``outputFileName`` contains whitespace characters(s)." + newline ...
                            + "Blanks are infamous for causing software crashes and failures." + newline ...
                            + "Best is to blanks and special characters in paths." + newline ...
                            + newline ...
                            );
                end
                if  endsWith(self.outputFileName, "\") || endsWith(self.outputFileName, "/")
                    self.outputFileName = fullfile(string(pm.sys.path.abs(self.outputFileName, "lean")), pm.io.getFileName(self.method));
                end
            end
            entries = "plang=""Version " + string(version()) + """";
            if  ~isempty(self.description                   ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("description                  ", self.description                     , "string" , 1); end
            if  ~isempty(self.domain                        ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("domain                       ", self.domain                          , "string" , 1); end
            if  ~isempty(self.domainAxisName                ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("domainAxisName               ", self.domainAxisName                  , "string" , ndim); end
            if  ~isempty(self.domainBallAvg                 ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("domainBallAvg                ", self.domainBallAvg                   , "real"   , ndim); end
            if  ~isempty(self.domainBallCor                 ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("domainBallCor                ", self.domainBallCor                   , "real"   , ndim^2); end
            if  ~isempty(self.domainBallCov                 ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("domainBallCov                ", self.domainBallCov                   , "real"   , ndim^2); end
            if  ~isempty(self.domainBallStd                 ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("domainBallStd                ", self.domainBallStd                   , "real"   , ndim); end
            if  ~isempty(self.domainCubeLimitLower          ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("domainCubeLimitLower         ", self.domainCubeLimitLower            , "real"   , ndim); end
            if  ~isempty(self.domainCubeLimitUpper          ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("domainCubeLimitUpper         ", self.domainCubeLimitUpper            , "real"   , ndim); end
            if  ~isempty(self.domainErrCount                ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("domainErrCount               ", self.domainErrCount                  , "integer", 1); end
            if  ~isempty(self.domainErrCountMax             ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("domainErrCountMax            ", self.domainErrCountMax               , "integer", 1); end
            if  ~isempty(self.outputChainFileFormat         ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("outputChainFileFormat        ", self.outputChainFileFormat           , "string" , 1); end
            if  ~isempty(self.outputColumnWidth             ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("outputColumnWidth            ", self.outputColumnWidth               , "integer", 1); end
            if  ~isempty(self.outputFileName                ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("outputFileName               ", self.outputFileName                  , "string" , 1); end
            if  ~isempty(self.outputStatus                  ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("outputStatus                 ", self.outputStatus                    , "string" , 1); end
            if  ~isempty(self.outputPrecision               ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("outputPrecision              ", self.outputPrecision                 , "integer", 1); end
            if  ~isempty(self.outputReportPeriod            ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("outputReportPeriod           ", self.outputReportPeriod              , "integer", 1); end
            if  ~isempty(self.outputRestartFileFormat       ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("outputRestartFileFormat      ", self.outputRestartFileFormat         , "string" , 1); end
            if  ~isempty(self.outputSampleSize              ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("outputSampleSize             ", self.outputSampleSize                , "integer", 1); end
            if  ~isempty(self.outputSeparator               ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("outputSeparator              ", self.outputSeparator                 , "string" , 1); end
            if  ~isempty(self.outputSplashMode              ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("outputSplashMode             ", self.outputSplashMode                , "string" , 1); end
            if  ~isempty(self.parallelism                   ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("parallelism                  ", self.parallelism                     , "string" , 1); end
            if  ~isempty(self.parallelismMpiFinalizeEnabled ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("parallelismMpiFinalizeEnabled", self.parallelismMpiFinalizeEnabled   , "logical", 1); end
            if  ~isempty(self.parallelismNumThread          ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("parallelismNumThread         ", self.parallelismNumThread            , "integer", 1); end
            if  ~isempty(self.randomSeed                    ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("randomSeed                   ", self.randomSeed                      , "integer", 1); end
            if  ~isempty(self.targetAcceptanceRate          ); entries = entries + self.nmlsep + pm.fortran.getEntryNML("targetAcceptanceRate         ", self.targetAcceptanceRate            , "real"   , 2); end
        end
        %    % These methods have been implemented to override the default 'handle' class methods,
        %    % so that they will not pop-up after pressing 'Tab' button.
        %    function addlistener    (self)  end
        %    function delete         (self)  end
        %    function findobj        (self)  end
        %    function findprop       (self)  end
        %    function valid          (self)  end
        %    function listener       (self)  end
        %    function notify         (self)  end
    end

end