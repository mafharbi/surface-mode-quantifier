classdef SurfaceModeQuantifier < matlab.apps.AppBase

% Properties that correspond to app components
properties (Access = public)
    UIFigure      matlab.ui.Figure
    Label         matlab.ui.control.Label
    UploadButton  matlab.ui.control.Button
    UIAxes2       matlab.ui.control.UIAxes
    UIAxes        matlab.ui.control.UIAxes
end


methods (Access = private)
    
    function BW = C2B(app, X)
        X = imadjust(X);
        BW = imbinarize(X);
    end
end


% Callbacks that handle component events
methods (Access = private)

     % Button pushed function: UploadButton
    function UploadButtonPushed(app, event)
         [filename, pathname] = uigetfile({'*.png;*.jpg;*.jpeg;*.bmp', 'Image Files (*.png, *.jpg, *.jpeg, *.bmp)'}, 'Select an Image File');

        % Check if the user clicked Cancel
        if isequal(filename, 0) || isequal(pathname, 0)
            return;
        end

        % Read the selected image file
        fullFilePath = fullfile(pathname, filename);
        img = imread(fullFilePath);

        % Get the size of the original image
        [height, width, ~] = size(img);

        if height < 1000 || width < 1000
            % Display an error message
            errordlg('Image dimensions must be at least 1000x1000 pixels.', 'Image Size Error');
            return;  % Abort further processing
        end

        % Change backgroound color of Axes component
        app.UIAxes.Color = [0.7, 0.7, 0.7];
        app.UIAxes2.Color = [0.7, 0.7, 0.7];

        % Display the image on the Axes component
        imshow(img, 'Parent', app.UIAxes);
        sqr=[400,400,1000,1000]

        % Draw the square on the original image
        rectangle('Position', sqr, 'EdgeColor', 'r', 'LineWidth', 2, 'Parent', app.UIAxes);

        A = imadjust(rgb2gray(img)); % Change the image to grayscale
        I1 = imcrop(A,sqr); % Crop the image 
        BW1 = app.C2B(I1);  
        IMG1 = (sum(BW1,'all')/(1001^2)) * 100

        IMG1 = sprintf('%.2f', IMG1); % Round IMG1 to two decimal places

        % Concatenate the string and number
        combinedText = ['Ductile Removal: ', IMG1, '%'];

        app.Label.Text = combinedText;
        imshow(BW1, 'Parent', app.UIAxes2);
    end
end

% Component initialization
methods (Access = private)

    % Create UIFigure and components
function createComponents(app)

        % Create UIFigure and hide until all components are created
        app.UIFigure = uifigure('Visible', 'off');
        app.UIFigure.Position = [100 100 861 649];
        app.UIFigure.Name = 'MATLAB App';

        % Create UIAxes
        app.UIAxes = uiaxes(app.UIFigure);
        zlabel(app.UIAxes, 'Z')
        app.UIAxes.TickLabelInterpreter = 'none';
        app.UIAxes.Position = [3 165 424 381];

        % Create UIAxes2
        app.UIAxes2 = uiaxes(app.UIFigure);
        zlabel(app.UIAxes2, 'Z')
        app.UIAxes2.Position = [427 165 424 381];

        % Create UploadButton
        app.UploadButton = uibutton(app.UIFigure, 'push');
        app.UploadButton.ButtonPushedFcn = createCallbackFcn(app, @UploadButtonPushed, true);
        app.UploadButton.Position = [370 110 124 38];
        app.UploadButton.Text = 'Upload';

        % Create Label
        app.Label = uilabel(app.UIFigure);
        app.Label.HorizontalAlignment = 'center';
        app.Label.FontSize = 24;
        app.Label.FontWeight = 'bold';
        app.Label.Position = [35 28 794 63];
        app.Label.Text = '';

        % Show the figure after all components are created
        app.UIFigure.Visible = 'on';
    end
end

% App creation and deletion
methods (Access = public)

    % Construct app
    function app = SurfaceModeQuantifier

        % Create UIFigure and components
        createComponents(app)

        % Register the app with App Designer
        registerApp(app, app.UIFigure)

        if nargout == 0
            clear app
        end
    end

    % Code that executes before app deletion
    function delete(app)

        % Delete UIFigure when app is deleted
        delete(app.UIFigure)
    end
end
end

