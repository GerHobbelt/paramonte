function sampleList = readSample(self, pattern, sep)
    %
    %   Return a list of objects of class ``pm.sampling.FileContentsSample``
    %   containing the content(s) of the ParaMonte simulation output sample
    %   file(s) whose path(s) match the specified input ``pattern`` or the
    %   simulation specification ``sampler.spec.outputFileName``.
    %
    %   \warning
    %
    %       This method is to be only used for post-processing of the output
    %       sample file(s) of an already finished simulation. Although possible,
    %       this method is NOT meant to be called by all processes
    %       in MPI-parallel simulations.
    %
    %   Parameters
    %   ----------
    %
    %       pattern
    %
    %           The input scalar MATLAB string containing the pattern matching
    %           the desired sample file(s) whose contents is to be read.
    %           The specified ``pattern`` only needs to partially identify
    %           the name of the simulation to which the sample file belongs.
    %           For example, specifying ``"./mydir/mysim"`` as input will
    %           lead to a search for file(s) beginning with "mysim" and
    %           ending with ``"_sample.txt"`` inside the directory ``"./mydir/"``.
    %
    %           If there are multiple files matching in the input ``pattern``,
    %           then all such files will be read and returned as elements of a list.
    %
    %           If the specified pattern is a valid existing URL, the file will be
    %           downloaded as a temporary file to the local system, its contents
    %           shall be parsed and the file will be subsequently removed.
    %
    %           If the input ``pattern`` is empty, then the method will search
    %           for any possible candidate files with the appropriate suffix
    %           in the current working directory.
    %
    %           (optional, default = ``sampler.spec.outputFileName`` or ``"./"``)
    %
    %       sep
    %
    %           The input MATLAB string containing the field separator used in the file(s).
    %           (optional, default = ``sampler.spec.outputSeparator`` or automatically inferred.)
    %
    %   Returns
    %   -------
    %
    %       sampleList
    %
    %           The output MATLAB cell array of objects
    %           of class ``pm.sampling.FileContentsSample``,
    %           each of which corresponds to the contents
    %           of a unique sample file.
    %
    %   Interface
    %   ---------
    %
    %       sampler = pm.sampling.Sampler();
    %       sampleList = sampler.readSample();
    %       sampleList = sampler.readSample([]);
    %       sampleList = sampler.readSample([], []);
    %       sampleList = sampler.readSample(pattern);
    %       sampleList = sampler.readSample([], sep);
    %       sampleList = sampler.readSample(pattern, sep);
    %
    %   LICENSE
    %   -------
    %
    %       https://github.com/cdslaborg/paramonte/blob/main/LICENSE.md
    %
    %   Example
    %   -------
    %
    %       sampler.readSample("./out/test_run_");
    %
    %       sampler.spec.outputFileName = "./out/test_run_";
    %       sampler.readSample();
    %
    %       sampler.readSample("./out/test_run_", ",");
    %
    %       sampler.spec.outputSeparator = ",";
    %       sampler.readSample("./out/test_run_");
    %
    %       sampler.spec.outputFileName = "./out/test_run_";
    %       sampler.spec.outputSeparator = ",";
    %       sampler.readSample();
    %
    if nargin < 3
        if 0 < pm.array.len(self.spec.outputSeparator)
            sep = string(self.spec.outputSeparator);
        else
            sep = [];
        end
    end
    if nargin < 2
        if 0 < pm.array.len(self.spec.outputFileName)
            pattern = string(self.spec.outputFileName);
        else
            pattern = [];
        end
    end
    ftype = "sample";
    pathList = self.findfile(ftype, pattern);
    sampleList = cell(length(pathList), 1);
    for ifile = length(pathList) : -1 : 1
        if ~self.silent
            disp("processing file: """ + pathList(ifile) + """");
        end
        sampleList{ifile} = pm.sampling.FileContentsSample(pathList(ifile), self.silent, sep);
    end
end
