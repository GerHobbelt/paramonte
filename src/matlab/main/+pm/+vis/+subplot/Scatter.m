classdef Scatter < pm.vis.subplot.Subplot
    %
    %   This is the Scatter class for generating
    %   instances of 2-dimensional Scatter plots
    %   based on the relevant MATLAB
    %   intrinsic functions.
    %
    %   Parameters
    %   ----------
    %
    %       dfref
    %
    %           See the documentation of the corresponding input
    %           argument of the superclass ``pm.vis.subplot.Subplot``.
    %
    %   Attributes
    %   ----------
    %
    %       See the documentation of the attributes
    %       of the superclass ``pm.vis.subplot.Subplot``.
    %
    %   Returns
    %   -------
    %
    %       An object of ``Scatter`` class.
    %
    %   Interface
    %   ---------
    %
    %       s = pm.vis.subplot.Scatter(dfref);
    %       s = pm.vis.subplot.Scatter(dfref, varargin);
    %
    %   LICENSE
    %   -------
    %
    %       https://github.com/cdslaborg/paramonte/blob/main/LICENSE.md
    %
    methods(Access = public)
        function self = Scatter(dfref, varargin)
            if nargin < 1
                dfref = [];
            end
            self = self@pm.vis.subplot.Subplot("Scatter", dfref, varargin{:});
        end
    end
end