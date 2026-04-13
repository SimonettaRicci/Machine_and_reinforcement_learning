%caso deterministico e stazionario
clear all
close all
clc

rng(1) % set the random seed

A = 5; % dimension action space
c = 1; % exploration rate
lengthEpisode = 100000; % number of actions to take

Q = ones(A, 1); % estimate of the value of actions
N = zeros(A, 1); % number of times we take each action

% save history of Q and N
historyQ = zeros(A, lengthEpisode);
historyN = zeros(A, lengthEpisode);

for i = 1:lengthEpisode
    player_2 = randi(A);
    Qext = Q + c*sqrt(log(i)./(N+1)); % extended value function
    a = find(Qext == max(Qext), 1, "first"); % to break parity
    r = rock_paper_d_s(a, player_2); 
    N(a) = N(a) + 1; % increment the counter for the actions taken
    Q(a) = Q(a) + 1/N(a)*(r - Q(a));

    % save the history
    historyQ(:,i) = Q;
    historyN(:, i) = N;
end

%% plots

% plot the history of Q
figure()
plot(historyQ','LineWidth',2)

% plot the history of N
figure()
plot(historyN','LineWidth',2)