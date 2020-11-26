function b = issubfield(s, fullfield)
%ISSUBFIELD Matlab Function
%
% R. Guicherd - Oct 2020
%% Function source code
% Split field into cell array of sub-fields
if ischar(fullfield)
    fullfield = regexp(fullfield, '\.', 'split');
end

% Check length of fullfield
if length(fullfield) == 1
    % Check if fullfield is a subfield
    b = isfield(s, fullfield{1});
else
    % If first part of fullfield is a field of s
    if isfield(s, fullfield{1})
        % Recursive call to issubfield
        b = issubfield(s.(fullfield{1}), fullfield(2:end));
    else
        % Return false
        b = false;
    end
end

end
%%%% End of issubfield function %%%%