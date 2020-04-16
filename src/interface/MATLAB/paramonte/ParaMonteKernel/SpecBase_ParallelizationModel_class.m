classdef SpecBase_ParallelizationModel_class < handle

    properties (Constant)
        CLASS_NAME                      = "@SpecBase_ParallelizationModel_class"
        MAX_LEN_PARALLELIZATION_MODEL   = 63
    end

    properties
        isSinglChain                    = []
        isMultiChain                    = []
        multiChain                      = []
        singlChain                      = []
        def                             = []
        val                             = ''
        desc                            = []
    end

%***********************************************************************************************************************************
%***********************************************************************************************************************************

    methods (Access = public)

    %*******************************************************************************************************************************
    %*******************************************************************************************************************************

        function self = SpecBase_ParallelizationModel_class(methodName)
            self.isSinglChain   = false;
            self.isMultiChain   = false;
            self.singlChain     = "singleChain";
            self.multiChain     = "multiChain";
            self.def            = self.singlChain;
            self.desc           = "parallelizationModel is a string variable that represents the parallelization method to be used in " + methodName + ". " ...
                                + "The string value must be enclosed by either single or double quotation marks when provided as input. "                   ...
                                ;
            if methodName == Constants.PMSM.ParaDRAM
                self.desc   = self.desc                                                                                                                     ...
                            + "Two options are currently supported:" + newline + newline                                                                    ...
                            + "    parallelizationModel = '" + self.multiChain + "'" + newline + newline                                                    ...
                            + "            This method uses the Embarrassingly Parallel scheme, in which, multiple MCMC chains are generated "              ...
                            + "independently of each other. In this case, multiple output MCMC chain files will also be generated." + newline + newline     ...
                            + "    parallelizationModel = '" + self.singlChain + "'" + newline + newline                                                    ...
                            + "            This method uses the fork-style parallelization scheme. "                                                        ...
                            + "A single MCMC chain file will be generated in this case. At each MCMC step multiple proposal steps "                         ...
                            + "will be checked in parallel until one proposal is accepted." + newline + newline                                             ...
                            + "Note that in serial mode, there is no parallelism. Therefore, this option does not affect non-parallel simulations "         ...
                            + "and its value is ignored. The serial mode is equivalent to either of the parallelism methods with only one simulation "      ...
                            + "image (processor, core, or thread). "                                                                                        ...
                            + "The default value is parallelizationModel = '" + self.def + "'. "                                                            ...
                            + "Note that the input values are case-insensitive and white-space characters are ignored."                                     ...
                            ;
            else
                Err = Err_class();
                Err.occurred    = true;
                Err.msg         = self.CLASS_NAME + ": Catastrophic internal error occurred. The simulation method name is not recognized.";
                Err.abort([], [], 1);
            end
        end

    %*******************************************************************************************************************************
    %*******************************************************************************************************************************

        function set(self, parallelizationModel)
            if isempty(parallelizationModel)
                self.val = strtrim(self.def);
            else 
                self.val = strtrim(strrep(parallelizationModel," ", ""));
            end
            if lower(self.val) == lower(self.singlChain), self.isSinglChain = true; end
            if lower(self.val) == lower(self.multiChain), self.isMultiChain = true; end
        end

    %*******************************************************************************************************************************
    %*******************************************************************************************************************************

        function Err = checkForSanity(self, Err, methodName)
            FUNCTION_NAME = "@checkForSanity()";
            if ~(self.isSinglChain || self.isMultiChain)
                Err.occurred    = true;
                Err.msg         = Err.msg                                                                                   ...
                                + self.CLASS_NAME + FUNCTION_NAME + ": Error occurred. "                                    ...
                                + "The input requested parallelization method (" + self.val                                 ...
                                + ") represented by variable parallelizationModel cannot be set to anything other than "    ...
                                + "'singleChain' or 'multiChain'. If you don't know an appropriate value "                  ...
                                + "for ParallelizationModel, drop it from the input list. " + methodName                    ...
                                + " will automatically assign an appropriate value to it." + newline + newline              ...
                                ;
            end
        end

    %*******************************************************************************************************************************
    %*******************************************************************************************************************************

    end

%***********************************************************************************************************************************
%***********************************************************************************************************************************

end