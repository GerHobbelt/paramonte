function failed = rmfile(file, desc)
    %
    %   Return a scalar MATLAB logical that is ``true`` if and
    %   only if the deletion of the input file fails,
    %   otherwise, return ``false``.
    %
    %   This function is a simple wrapper around the MATLAB function ``delete()``
    %   It is primarily meant to bring consistency to messaging file deletions
    %   if they fail. Such consistency is particularly required on Windows
    %   systems as the OS tends to lock file ownership to one application
    %   causing deletions to fail frequently.
    %
    %   Parameters
    %   ----------
    %
    %       file
    %
    %           The input scalar MATLAB string,
    %           containing the file path to be deleted.
    %
    %       desc
    %
    %           The input scalar MATLAB string, containing a descriptive message
    %           to be printed on the MATLAB command line if the deletion task fails.
    %           The input ``desc``, if not empty, will be added to the following template
    %           before being displayed:
    %
    %               "Failed to delete <desc> from the local disk. File may be protected."
    %
    %           If the input ``desc`` is empty ``[]`` or empty string ``""``, a default
    %           value ``"the requested file"`` for ``desc`` will be added to the template.
    %
    %           (**optional**. If missing, no warning will be displayed upon failure.)
    %
    %   Returns
    %   -------
    %
    %       failed
    %
    %           The output scalar MATLAB logical that is ``true`` if and
    %           only if the deletion of the input file fails,
    %           otherwise, return ``false``.
    %
    %   Interface
    %   ---------
    %
    %       failed = pm.sys.path.rmfile(file)
    %       failed = pm.sys.path.rmfile(file, desc)
    %
    %   LICENSE
    %   -------
    %
    %       https://github.com/cdslaborg/paramonte/blob/main/LICENSE.md
    %
    try
        delete(file);
    catch
        if nargin == 2
            if isempty(desc) || desc == ""
                desc = "the requested file";
            end
            warning ( newline ...
                    + "Failed to delete " + string(desc) + " from the local disk." + newline ...
                    + "An application may possess the file ownership, particularly on Windows." + newline ...
                    + "You can try manually deleting it at:" + newline ...
                    + newline ...
                    + pm.io.tab + string(file) + newline ...
                    + newline ...
                    );
        end
    end
end