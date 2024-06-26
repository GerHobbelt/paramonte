function [pathList, isdirList] = webglob(pattern, anycase)
    %
    %   Return a scalar MATLAB string or vector of MATLAB strings
    %   containing the fully-resolved paths matching the input pattern.
    %
    %   This function is very similar to ``pm.sys.path.glob()``.
    %   However, unlike ``pm.sys.path.glob()``, if the input
    %   pattern matches a World Wide Web link, it will also
    %   download the file to a temporary path on the system
    %   and the temporary download path as the output.
    %
    %   Parameters
    %   ----------
    %
    %       pattern
    %
    %           The input scalar MATLAB string containing either:
    %
    %               1.  the pattern to search for paths on the current system.
    %                   Wildcards may be used for basenames and for the directory parts.
    %                   If pattern contains directory parts, then these will
    %                   be included in the output ``pathList``.
    %
    %                   Following wildcards can be used:
    %                       *        match zero or more characters
    %                       ?        match any single character
    %                       [ab12]   match one of the specified characters
    %                       [^ab12]  match none of the specified characters
    %                       [a-z]    match one character in range of characters
    %                       {a,b,c}  matches any one of strings a, b or c
    %                       All above wildcards do not match a file separator.
    %                       **       match zero or more characters including file separators.
    %                                This can be used to match zero or more directory parts
    %                                and will recursively list matching names.
    %
    %                   \warning
    %                       Symbolic linked directories or junctions may
    %                       cause an infinite loop when using the ``**``.
    %
    %               2.  the weblink to download and save locally on the system temporary folder.
    %
    %       anycase
    %
    %           The input scalar MATLAB logical.
    %           If ``true``, the search will be case-sensitive.
    %           If ``false``, the search will be case-insensitive.
    %           On Windows, ``anycase`` is always reset to ``true`` even if user-specified.
    %           (**optional**. default = ``false`` on Unix and ``true`` on Windows.)
    %
    %   Returns
    %   -------
    %
    %       pathList
    %
    %           The output MATLAB cell array of strings containing the files
    %           or directories that match the path specified by string ``pattern``.
    %
    %       isdirList
    %
    %           The output MATLAB cell array of the same size as ``pathList``,
    %           each element of which is a MATLAB logical value that is ``true`` if
    %           and only if the corresponding element of ``pathList`` is a directory.
    %
    %   Interface
    %   ---------
    %
    %       [pathList, isdirList] = pm.sys.path.webglob(pattern)
    %       [pathList, isdirList] = pm.sys.path.webglob(pattern, anycase)
    %
    %   LICENSE
    %   -------
    %
    %       https://github.com/cdslaborg/paramonte/blob/main/LICENSE.md
    %
    if nargin < 2
        anycase = [];
    end
    [pathList, isdirList] = pm.sys.path.glob(pattern, anycase);
    if isempty(pathList)
        % check if the input path is a weblink.
        if pm.web.isurl(pattern)
            % Extract the weblink file name.
            parts = split(pattern, "/");
            if parts(end) ~= ""
                pathtmp = fullfile(tempdir(), parts(end));
            else
                pathtmp = tempname();
            end
            pathList = [string(websave(pathtmp, pattern))];
        end
    end
end