clc
clear all
close all

%imgfiles = dir('map daily COVID19 (Final)');

% 
% %% Step 1: read image data
% [X,cmap] = imread('C:\Users\mxv17\OneDrive\Desktop\write_to_file\COVID Cumulative 2021-06-19.png');
% 
% imshow(X,cmap)
% 
% imgdata = 255-double(rgb2gray(X));
% 
% % crop the image matrix
% colsum = sum(imgdata);
% rowsum = sum(imgdata,2);
% 
% nonzero_col = find(colsum~=0);
% nonzero_row = find(rowsum~=0);
% imgdata = imgdata(nonzero_row(1):nonzero_row(end),nonzero_col(1):nonzero_col(end));
% %imgdata(:,518:end)=[];
% imgdata(imgdata<25) = 0;
% X = X(nonzero_row(1):nonzero_row(end),nonzero_col(1):nonzero_col(end),:);
% 
% %% Step 2: Sampling
% % Draw samples
% start_time = tic;
% num_samples = 10000;
% [row,col] = imgiidsampling(((imgdata)),num_samples);
% 
% %
% elapsed_time = toc(start_time);
% fprintf('Time Elapsed for Sampling: %5.4f seconds\n',elapsed_time)
% 
% % Visualization
% fh = figure('color','w','InnerPosition',[0 0 2000 300]);
% fh.WindowState = 'maximized';
% %figure('color','w','Position',[0 0 2000 600])
% %subplot(1,2,1)
% subplot('Position',[0.05 0.3 0.4 0.4])
% imshow(X)
% 
% %contourf(imgdata,150,'linecolor','none')
% x_lim = xlim();    %sets the x-axis limits for the current axes or chart. Specify limits as a two-element vector of the form [xmin xmax],
% y_lim = ylim();    % sets the y-axis limits for the current axes or chart. 
% colormap jet
% %axis equal off;
% title('Arbitrary Distribution')
% set(gca,'xtick',[],'ytick',[],'YTickLabel',[],'XTickLabel',[],'LineWidth',2)
% %
% %subplot(1,2,2)
% subplot('Position',[0.55 0.3 0.4 0.4])
% %plot(row,col,'.','color','k','markersize',1)
% %gca.XAxis.Visible='off';
% %gca.YAxis.Visible='off';
% % Set color of X and Y axes to background color (white)
% set(gca,'XColor',[1 1 1])
% set(gca,'YColor',[1 1 1])
% 
% 
% 
% set(gca, 'YDir','reverse')
% xlim(x_lim)
% ylim(y_lim)
% title(strcat(num2str(num_samples),' Samples'))
% set(gca,'xtick',[],'ytick',[],'YTickLabel',[],'XTickLabel',[],'LineWidth',2,'box','off')
% 
% h = animatedline(Color="k",Marker=".",MarkerSize=1,LineStyle="none");
% for k=1:length(row)
%     addpoints(h,row(k),col(k));
%     drawnow limitrate
% end
% drawnow
% 
% %% Step 3: Gaussian Mixture Fit 
% numofclusters = 3;
% GMModel = fitgmdist([row,col],numofclusters);  %GMModel is a matrix. fitgmdist(X,k), the 'X' is the [row,col] and k is 'numofclusters'
% features_i = [GMModel.mu reshape(GMModel.Sigma(:),4,[])'];
% features_i(:,4) = features_i(:,6);
% features_i(:,6) = [];
% features_i = features_i';
% features_i = features_i(:)';
% 
% % Visualize your results
% %drawnow
% %figure
% 
% w = waitforbuttonpress;
% fh = figure('color','w');
% fh.WindowState = 'maximized';
% %plot(row,col,'.','color','k','markersize',1)
% 
% h = animatedline(Color="k",Marker=".",MarkerSize=1,LineStyle="none");
% for k=1:length(row)
%     addpoints(h,row(k),col(k));
%     drawnow limitrate
% end
% drawnow
% 
% set(gca, 'YDir','reverse')
% xlim(x_lim)
% ylim(y_lim)
% title(strcat(num2str(num_samples),' Samples'))
% set(gca,'xtick',[],'ytick',[],'YTickLabel',[],'XTickLabel',[],'LineWidth',2)
% hold on
% 
% %h = scatter(row,col,2,'filled'); % 5 is dot size
% gmPDF = @(x,y) arrayfun(@(x0,y0) pdf(GMModel,[x0 y0]),x,y);  % 2 functions: arrayfun() which has 3 values (and within that, has another function '@x0,y0). The part 'pdf(GMMmodel, [x0,y0),x,y), is also a function, where pdf(GMMmodel,[x0,y0]) is also is a value and fed into @x0,y0., andn what we are passing through it
% g = gca;
% fcontour(gmPDF,[g.XLim g.YLim])
% for ii = 1:numofclusters
%     text(features_i(1+(ii-1)*5),features_i(2+(ii-1)*5),strcat('GM',num2str(ii)),'FontWeight','bold')
% end
% title('{\bf Scatter Plot and Fitted Gaussian Mixture Contours}')
% 
% %legend(h,'Kernel 1','Kernel 2')
% 
% axis equal off;
% hold off;legend off;
% set(gca,'xtick',[],'ytick',[],'YTickLabel',[],'XTickLabel',[],'LineWidth',2)
% 



%GMM model selection with AIC
% AIC = zeros(1,40);
% GMModels = cell(1,40);
% options = statset('MaxIter',500);
% for k = 1:length(AIC)
%     GMModels{k} = fitgmdist([row,col],k,'Options',options,'CovarianceType','full');
%     AIC(k)= GMModels{k}.AIC;
%     %drawnow;
%     %pause(2);
% end


% figure
% plot(AIC,'-bo','LineWidth',1.5);
% xlabel('Number of Gaussian Mixtures');
% ylabel('AIC');
% set(gca,'LineWidth',1.5, 'FontSize', 10, 'FontWEight', 'bold');





% h=animatedline;
% axis([0 4+pi -1 1])
% x=linspace(0,4*pi,10000);
% y=sin(x);
% 
% for k=1:length(x)
%     addpoints(h,x(k),y(k));
%     drawnow limitrate
% end
% drawnow

%% ---------------------------------------------------------------- 
% Run Sequentially

%imgfiles = dir('map daily COVID19 (Final)');

%RootDirectory = 'C:\Users\mxv17\OneDrive\Desktop\write_to_file\map daily COVID19 (Final)';

RootDirectory = 'C:\Users\mxv17\OneDrive\Desktop\write_to_file\map daily COVID19-expon_moving_avg_span_14_logmax';
RootFolderList = dir(strcat(RootDirectory,'\COVID*.png'));%'InitialRunGuess\IDG\IDG*.mat'));
numMATs = size(RootFolderList,1);
features = [];   %zeros(1,25);
timestamp = [];

rng(3)
s = rng


for i = 1:5
    %% Step 1: read image data
    [X,cmap] = imread(strcat(strcat(RootFolderList(i).folder,'\'),RootFolderList(i).name));
    imgdata = 255-double(rgb2gray(X));
    timestamp = [timestamp;RootFolderList(i).name(18:27)];
        
    % crop the image matrix
    colsum = sum(imgdata);rowsum = sum(imgdata,2);
    nonzero_col = find(colsum~=0);
    nonzero_row = find(rowsum~=0);  % find all nonzero columns, find all nonzero rows
    imgdata = imgdata(nonzero_row(1):nonzero_row(end),nonzero_col(1):nonzero_col(end)); %imgdata(), has all nonzero rows and nonzero colums- right?
    colsum = sum(imgdata);
    rowsum = sum(imgdata,2);


    imgdata(:,518:end)=[];
    imgdata(imgdata<25) = 0;
    X = X(nonzero_row(1):nonzero_row(end),nonzero_col(1):nonzero_col(end),:);
    
    %% Step 2: Sampling
    % Draw samples
    start_time = tic;
    num_samples = 5000;
    if nnz(imgdata)==0
        
        continue
    end
    [row,col] = imgiidsampling(((imgdata))/255,num_samples);
    %
    elapsed_time = toc(start_time);
    fprintf('Time Elapsed for Sampling: %5.4f seconds\n',elapsed_time);
    
    %% Step 3: Gaussian Mixture Fit 
    
    numofclusters = 20;
    GMModel = fitgmdist([row,col],numofclusters);
    features_i = [GMModel.mu reshape(GMModel.Sigma(:),4,[])'];
    features_i = features_i';
    features_i = features_i(:)';
    features = [features;features_i];
    i
    % Visualization
    w = waitforbuttonpress;
    fh = figure('color','w');
    fh.WindowState = 'maximized';
    %figure('color','w','Position',[0 0 1500 400])
    %subplot(1,2,1)
    subplot('Position',[0.05 0.3 0.4 0.4])
    imshow(X)
    
   
    %contourf(imgdata,150,'linecolor','none')
    x_lim = xlim();    %sets the x-axis limits for the current axes or chart. Specify limits as a two-element vector of the form [xmin xmax],
    y_lim = ylim();    % sets the y-axis limits for the current axes or chart. 
    colormap jet
    %axis equal off;
    title('Arbitrary Distribution')
    set(gca,'xtick',[],'ytick',[],'YTickLabel',[],'XTickLabel',[],'LineWidth',2)
    %
    
    
    %subplot(1,2,2)
    subplot('Position',[0.55 0.3 0.4 0.4])
    %plot(row,col,'.','color','k','markersize',1)
    
    set(gca,'XColor',[1 1 1])
    set(gca,'YColor',[1 1 1])
    
    set(gca, 'YDir','reverse')
    xlim(x_lim)
    ylim(y_lim)
    title(strcat(num2str(num_samples),' Samples'))
    set(gca,'xtick',[],'ytick',[],'YTickLabel',[],'XTickLabel',[],'LineWidth',2)
    
    h = animatedline(Color="k",Marker=".",MarkerSize=1,LineStyle="none");
    for k=1:length(row)
    addpoints(h,row(k),col(k));
    drawnow limitrate
    end
    drawnow
    %animatedline(x,y,Color="red",Marker="o") 
    
    %drawnow
    
   %subplot(1,1,1)
%     figure
%     plot(row,col,'.','color','k','markersize',1)
%     set(gca, 'YDir','reverse')
%     xlim(x_lim)
%     ylim(y_lim)
%     title(strcat(num2str(num_samples),' Samples'))
%     set(gca,'xtick',[],'ytick',[],'YTickLabel',[],'XTickLabel',[],'LineWidth',2)

    
    % Visualize your results
    w = waitforbuttonpress;
    fh = figure('color','w');
    fh.WindowState = 'maximized';
    %figure
    %plot(row,col,'.','color','k','markersize',1)
    set(gca,'XColor',[1 1 1])
    set(gca,'YColor',[1 1 1])
    
    set(gca, 'YDir','reverse')
    xlim(x_lim)
    ylim(y_lim)
    title(strcat(num2str(num_samples),' Samples'))
    set(gca,'xtick',[],'ytick',[],'YTickLabel',[],'XTickLabel',[],'LineWidth',2)
    hold on
    
    h = animatedline(Color="k",Marker=".",MarkerSize=1,LineStyle="none");
    for k=1:length(row)
    addpoints(h,row(k),col(k));
    drawnow limitrate
    end
    drawnow
    
    %h = scatter(row,col,2,'filled'); % 5 is dot size
    gmPDF = @(x,y) arrayfun(@(x0,y0) pdf(GMModel,[x0 y0]),x,y);  % 2 functions: arrayfun() which has 3 values (and within that, has another function '@x0,y0). The part 'pdf(GMMmodel, [x0,y0),x,y), is also a function, where pdf(GMMmodel,[x0,y0]) is also is a value and fed into @x0,y0., andn what we are passing through it
    g = gca;
    fcontour(gmPDF,[g.XLim g.YLim])
    for ii = 1:numofclusters
    text(features_i(1+(ii-1)*6),features_i(2+(ii-1)*6),strcat('GM',num2str(ii)),'FontWeight','bold')
    end
    title('{\bf Scatter Plot and Fitted Gaussian Mixture Contours}')

    %legend(h,'Kernel 1','Kernel 2')

    axis equal off;
    hold off;legend off;
    set(gca,'xtick',[],'ytick',[],'YTickLabel',[],'XTickLabel',[],'LineWidth',2)
    %drawnow
end


%baseFileName = sprintf('my new image.png'); % Whatever....
%fullFileName = fullfile('C:\Users\mxv17\OneDrive\Desktop\write_to_file\NEW_IMAGE', baseFileName);
%imwrite(r, fullFileName);

%% Step 4: Collect features into a table
size(features)

tbl = table(timestamp,features(:,1),features(:,2),features(:,3),features(:,6),features(:,5),...
    features(:,7),features(:,8),features(:,9),features(:,12),features(:,11),...
    features(:,13),features(:,14),features(:,15),features(:,18),features(:,17),...
    features(:,19),features(:,20),features(:,21),features(:,24),features(:,23),...
    features(:,25),features(:,26),features(:,27),features(:,30),features(:,29));
    
tbl = renamevars(tbl,["Var2","Var3","Var4","Var5","Var6","Var7","Var8","Var9","Var10","Var11","Var12","Var13","Var14","Var15","Var16", "Var17","Var18","Var19","Var20","Var21","Var22","Var23","Var24","Var25","Var26"],...
    ["GP1-mu_x","GP1-mu_y","GP1-sigma_x","GP1-sigma_y","GP1-rho_xy","GP2-mu_x","GP2-mu_y","GP2-sigma_x","GP2-sigma_y","GP2-rho_xy",...
    "GP3-mu_x","GP3-mu_y","GP3-sigma_x","GP3-sigma_y","GP3-rho_xy",...
    "GP4-mu_x","GP4-mu_y","GP4-sigma_x","GP4-sigma_y","GP4-rho_xy",...
    "GP5-mu_x","GP5-mu_y","GP5-sigma_x","GP5-sigma_y","GP5-rho_xy"])

writetable(tbl,'C:\Users\mxv17\OneDrive\Desktop\write_to_file\GMMfeatures.csv')

%% ----------------------------------------------------------------
function [row,col] = imgiidsampling(img,num_samples)
% img is input image
% num_samples is the number of samples you wish to draw

    cdf = cumsum(img(:))/sum(img(:));
    rns = rand(num_samples,1);
    idx = discretize(rns,cdf);

    [col,row] = ind2sub(size(img),idx);
    
end