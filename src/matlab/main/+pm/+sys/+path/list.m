function namelist = list(path)
    %
    %   Return a cell vector of MATLAB string values each of which
    %   corresponds to one non-default file or folder path
    %   in the specified input directory path.
    %
    %   \note
    %
    %       The primary use of this function is to create a list of items
    %       in a given folder while excluding the default system items
    %       which includes the current and parent directories.
    %
    %   Parameters
    %   ----------
    %
    %       path
    %
    %           The input scalar MATLAB string or character containing the path to an
    %           existing directory whose file and folder contents should be listed,
    %           excluding the default ``"."`` and ``".."`` system paths.
    %           (**optional**, default = ``"."``)
    %
    %   Returns
    %   -------
    %
    %       namelist
    %
    %           A MATLAB cell vector, each element of which corresponds to an existing
    %           non-default file or folder in the specified input directory path.
    %           If the input path contains a base directory name, the name
    %           will be prefixed to each item in the output ``namelist``.
    %           If the input `path` is not a directory or is empty,
    %           the output `namelist` will be empty.
    %
    %   Interface
    %   ---------
    %
    %       namelist = pm.sys.path.list()
    %       namelist = pm.sys.path.list(path)
    %
    %   LICENSE
    %   -------
    %
    %       https://github.com/cdslaborg/paramonte/blob/main/LICENSE.md
    %
    if nargin < 1
        path = ".";
    end
    namelist = [];
    if  isfolder(path)
        [dirname, ~, ~] = fileparts(path);
        fileSpecList = dir(path);
        namelistRaw = string({fileSpecList.name});
        namelistLen = length(namelistRaw);
        cleanListLen = namelistLen - (any(strcmp(namelistRaw, ".")) + any(strcmp(namelistRaw, "..")));
        if cleanListLen == namelistLen
            namelist = fullfile(dirname, namelistRaw);
        else
            namelist = strings([cleanListLen, 1]);
            counter = 0;
            for i = 1 : namelistLen
                if ~(strcmp(namelistRaw(i), ".") || strcmp(namelistRaw(i), ".."))
                    counter = counter + 1;
                    namelist(counter) = fullfile(dirname, namelistRaw(i));
                end
            end
        end
    end
end