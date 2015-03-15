function mask = sub2mask(siz,varargin)
mask = true;
d = 1;
for k = 1:numel(varargin)
    if isequal(varargin{k},':')
        varargin{k} = true(siz(d),1);
    elseif ~islogical(varargin{k})
        varargin{k} = accumarray(varargin{k}(:),1,[siz(d),1]);
    end
    mask = bsxfun(@and, mask, reshape(varargin{k},[ones(1,d-1), size(varargin{k})]));
    d = d + numDims(varargin{k});
end
end

function d = numDims(A)
% Returns number of dimensions, treats 1-by-n or n-by-1 arrays as vectors
if isrow(A) || iscolumn(A)
    d = 1;
else
    d = numel(size(A));
end
end