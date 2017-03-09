function [pd1,pd2,pd3] = createFit(arg_1,arg_2,arg_3)
%CREATEFIT    Create plot of datasets and fits
%   [PD1,PD2,PD3] = CREATEFIT(ARG_1,ARG_2,ARG_3)
%   Creates a plot, similar to the plot in the main distribution fitting
%   window, using the data that you provide as input.  You can
%   apply this function to the same data you used with dfittool
%   or with different data.  You may want to edit the function to
%   customize the code and this help message.
%
%   Number of datasets:  3
%   Number of fits:  3
%
%   See also FITDIST.

% This function was automatically generated on 08-Mar-2017 17:49:43

% Output fitted probablility distributions: PD1,PD2,PD3

% Data from dataset "del_q_v(1,:) data":
%    Y = arg_1 (originally del_q_v(1,:))

% Data from dataset "del_q_v(2,:) data":
%    Y = arg_2 (originally del_q_v(2,:))

% Data from dataset "del_q_v(3,:) data":
%    Y = arg_3 (originally del_q_v(3,:))

% Force all inputs to be column vectors
arg_1 = arg_1(:);
arg_2 = arg_2(:);
arg_3 = arg_3(:);

% Prepare figure
clf;
hold on;
LegHandles1 = []; LegText1 = {};
LegHandles2 = []; LegText2 = {};
LegHandles3 = []; LegText3 = {};

% --- Plot data originally in dataset "del_q_v(1,:) data"

subplot(3,1,1);
[CdfF,CdfX] = ecdf(arg_1,'Function','cdf');  % compute empirical cdf
BinInfo.rule = 1;
[~,BinEdge] = internal.stats.histbins(arg_1,[],[],BinInfo,CdfF,CdfX);
[BinHeight,BinCenter] = ecdfhist(CdfF,CdfX,'edges',BinEdge);
hLine = bar(BinCenter,BinHeight,'hist');
set(hLine,'FaceColor','none','EdgeColor',[0.333333 0 0.666667],...
    'LineStyle','-', 'LineWidth',1);
xlabel('Data');
ylabel('Density')
LegHandles1(end+1) = hLine;
LegText1{end+1} = 'err_1';

% Adjust figure
box on;
grid on;
hold on;

% Create grid where function will be computed
XLim = get(gca,'XLim');
XLim = XLim + [-1 1] * 0.01 * diff(XLim);
XGrid = linspace(XLim(1),XLim(2),100);

% --- Create fit "fit1"

% Fit this distribution to get parameter values
% To use parameter estimates from the original fit:
%     pd1 = ProbDistUnivParam('normal',[ -0.002619315811788, 0.0127314041953])
pd1 = fitdist(arg_1, 'normal');
YPlot = pdf(pd1,XGrid);
hLine = plot(XGrid,YPlot,'Color',[1 0 0],...
    'LineStyle','-', 'LineWidth',2,...
    'Marker','none', 'MarkerSize',6);
LegHandles1(end+1) = hLine;
LegText1{end+1} = 'norm_1';

hLegend1 = legend(LegText1);
set(hLegend1,'Interpreter','none');


% --- Plot data originally in dataset "del_q_v(2,:) data"
subplot(3,1,2);
[CdfF,CdfX] = ecdf(arg_2,'Function','cdf');  % compute empirical cdf
BinInfo.rule = 1;
[~,BinEdge] = internal.stats.histbins(arg_2,[],[],BinInfo,CdfF,CdfX);
[BinHeight,BinCenter] = ecdfhist(CdfF,CdfX,'edges',BinEdge);
hLine = bar(BinCenter,BinHeight,'hist');
set(hLine,'FaceColor','none','EdgeColor',[0.333333 0.666667 0],...
    'LineStyle','-', 'LineWidth',1);
xlabel('Data');
ylabel('Density')
LegHandles2(end+1) = hLine;
LegText2{end+1} = 'err_2';

% Adjust figure
box on;
grid on;
hold on;

% Create grid where function will be computed
XLim = get(gca,'XLim');
XLim = XLim + [-1 1] * 0.01 * diff(XLim);
XGrid = linspace(XLim(1),XLim(2),100);


% --- Create fit "fit2"

% Fit this distribution to get parameter values
% To use parameter estimates from the original fit:
%     pd2 = ProbDistUnivParam('normal',[ 0.002342849922014, 0.009068924784892])
pd2 = fitdist(arg_2, 'normal');
YPlot = pdf(pd2,XGrid);
hLine = plot(XGrid,YPlot,'Color',[0 0 1],...
    'LineStyle','-', 'LineWidth',2,...
    'Marker','none', 'MarkerSize',6);
LegHandles2(end+1) = hLine;
LegText2{end+1} = 'norm_2';

hLegend2 = legend(LegHandles2,LegText2,'Orientation', 'vertical', 'FontSize', 9, 'Location', 'northeast');
set(hLegend2,'Interpreter','none');

% --- Plot data originally in dataset "del_q_v(3,:) data"
subplot(3,1,3);
[CdfF,CdfX] = ecdf(arg_3,'Function','cdf');  % compute empirical cdf
BinInfo.rule = 1;
[~,BinEdge] = internal.stats.histbins(arg_3,[],[],BinInfo,CdfF,CdfX);
[BinHeight,BinCenter] = ecdfhist(CdfF,CdfX,'edges',BinEdge);
hLine = bar(BinCenter,BinHeight,'hist');
set(hLine,'FaceColor','none','EdgeColor',[0 0 0],...
    'LineStyle','-', 'LineWidth',1);
xlabel('Data');
ylabel('Density')
LegHandles3(end+1) = hLine;
LegText3{end+1} = 'err_3';
% Adjust figure
box on;
grid on;
hold on;

% Create grid where function will be computed
XLim = get(gca,'XLim');
XLim = XLim + [-1 1] * 0.01 * diff(XLim);
XGrid = linspace(XLim(1),XLim(2),100);
% --- Create fit "fit3"

% Fit this distribution to get parameter values
% To use parameter estimates from the original fit:
%     pd3 = ProbDistUnivParam('normal',[ -0.0008694116604437, 0.008026767527539])
pd3 = fitdist(arg_3, 'normal');
YPlot = pdf(pd3,XGrid);
hLine = plot(XGrid,YPlot,'Color',[0.666667 0.333333 0],...
    'LineStyle','-', 'LineWidth',2,...
    'Marker','none', 'MarkerSize',6);
LegHandles3(end+1) = hLine;
LegText3{end+1} = 'norm_3';

hLegend3 = legend(LegHandles3,LegText3,'Orientation', 'vertical', 'FontSize', 9, 'Location', 'northeast');
set(hLegend3,'Interpreter','none');





