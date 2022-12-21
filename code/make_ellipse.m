function H = make_ellipse(varargin)
    XR = varargin{1};
    YR = varargin{2};
    X = varargin{3};
    Y = varargin{4};
    [XX, YY] = meshgrid(1:X, 1:Y);
    H = ((XX - floor(X/2) - 1) ./ XR).^2 + ((YY - floor(Y/2) - 1) ./ YR).^2 > 1.0;
end
