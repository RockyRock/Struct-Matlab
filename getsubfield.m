function out = getsubfield(s, fullfield)
%GETSUBFIELD Matlab Function
%
% R. Guicherd - Oct 2020
%% Function source code
% Split field into cell array of sub-fields
if ischar(fullfield)
    fullfield = regexp(fullfield, '\.', 'split');
end

% Check length of fullfield
if length(fullfield) == 1
   % Access subfield of s and return
   out = s.(fullfield{1});
else
    % Check that first part of fullfield is a subfield of s
    if isfield(s, fullfield{1})
        % Recurive call of getsubfield
        out = getsubfield(s.(fullfield{1}), fullfield(2:end));
    else
        % Return an error is the full field is not valid
        error('The fullfield is not correct!')
    end
end

end
%%%% End of getsubfield function %%%%