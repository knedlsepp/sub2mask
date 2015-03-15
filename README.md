# sub2mask
MATLAB helper for combining linear and logical indexing

## Principle:
Have you ever had the inconvenience of manipulating 3D or nD arrays with logical indexing?
```
>>A = rand(10,10,3,3);
>>mask = eye(10)==1;
>>A(mask,3,:) %errors:
  Index exceeds matrix dimensions.
```

This offers the alternative:
```
A(sub2mask(size(A),mask,3,:))
% OR
I = @(A,varargin) sub2mask(size(A),varargin{:});
A(I(A,mask,3,:))

