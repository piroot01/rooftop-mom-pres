clc; clearvars;

function export_fig_to_tikz(figFile)
% EXPORT_FIG_TO_TIKZ  Load a .fig and print all line data in TikZ format.
%
%   export_fig_to_tikz('myFigure.fig')
%
% Output is printed to the Command Window. To save to a file, redirect:
%   export_fig_to_tikz('myFigure.fig') > data_coords.txt

    %--- 1) Open the figure (invisible) -------------------------
    hFig = openfig(figFile);
    
    %--- 2) Find all the line objects in all axes -------------
    axesObjs = findall(hFig, 'Type', 'axes');
    lineObjs = findall(axesObjs, 'Type', 'line');
    
    %--- 3) Loop through each line and print TikZ coords ------
    for k = 1:numel(lineObjs)
        x = get(lineObjs(k), 'XData');
        y = get(lineObjs(k), 'YData');
        
        fprintf('%% --- Line %d (%d points) ---\n', k, numel(x));
        for i = 1:numel(x)
            % here you can adjust %g to %.6f if you want fixed decimals
            fprintf('(%g, %g)\n', x(i), y(i));
        end
        fprintf('\n');
    end
    
    %--- 4) Clean up --------------------------------------------
    close(hFig);
end

%export_fig_to_tikz(['Fig_RCS_comparison.fig'])
export_fig_to_tikz(['new/Fig_2Drect_RCS.fig'])
%export_fig_to_tikz('new/Fig_2Drect_compTime.fig')

%openfig('new/Fig_2Drect_RCS.fig');

%load RCS_AToM_ka_0p1_20_31samples.mat

%load new/RCS_Rec2D_ka_0p1_1e3_251samples_tol1em7.mat



