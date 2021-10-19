function s = setsubfield(s, fullfield, val)
%SETSUBFIELD Matlab Function
%
% R. Guicherd - Oct 2020
%% Function source code
% Split field into cell array of sub-fields
if ischar(fullfield)
    fullfield = regexp(fullfield, '\.', 'split');
end

% Check length of subfields
if length(fullfield) == 1
    s.(fullfield{1}) = val;
else
    try
        subfield = s.(fullfield{1});
    catch
        subfield = struct();
    end
    % Recursive call of setsubfield
    s.(fullfield{1}) = setsubfield(subfield, fullfield(2:end), val);
end

end
%%%% End of setsubfield function %%%%