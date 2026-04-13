%caso deterministico e stazionario: ad ogni istante di tempo quando il
%giocatore_1 sceglie la sua azione, otteniamo esattamente il valore
%dell'azione, il reward è deterministico

clear all
close all
clc

rng(1) % set the random seed

A = 5; % dimension action space
epsilon = 0.005; % probability we take a random action

%con questo numero di episodi sono portata a scegliere più frequentemente
%l'azione 2 ma aumentando il numero di episodi la scelta diventa
%visibilmente casuale. Ne deduco che in questo contesto non impara davvero
%a giocare.
lengthEpisode = 10000; % number of actions to take

Q = ones(A, 1); % estimate of the value of actions
N = zeros(A, 1); % number of times we take each action

% save history of Q and N
historyQ = zeros(A, lengthEpisode);
historyN = zeros(A, lengthEpisode);

for i = 1:lengthEpisode
    player_2 = randi(A); %il giocatore 2 sceglie sempre un'azione casuale
    if rand < epsilon
        a = randi(A); % we take a random action
        
    else
        % to break parity
        a = find(Q == max(Q), 1, 'first');  % either we take the one with lower index
        % a = find(Q == max(Q)); % list all optimal actions;
        % a = a(randi(length(a))); % take a random action among the optimal ones
    end
    r = rock_paper_d_s(a, player_2); 
    N(a) = N(a) + 1; % increment the counter for the actions taken
    Q(a) = Q(a) + 1/N(a)*(r - Q(a)); %stima dell'azione corrisponente

    % save the history
    historyQ(:,i) = Q;
    historyN(:, i) = N;
end

%% plots

% plot the history of Q
figure()
plot(historyQ')

% plot the history of N
figure()
plot(historyN')
