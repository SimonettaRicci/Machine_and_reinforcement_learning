clear all
close all
clc

rng(1) % set the random seed

A = 5; % dimension action space
epsilon = 0.3; % probability we take a random action  
% con questo vettore di probabilità prob = [0.05, 0.05, 0.05, 0.05, 0.8] e
% epsilon 0.3 in effetti sono portato a giocare la prima e la terza azione,
% con più frequenza, il che è giusto perchè sono i casi in cui vincerei
% contro lizard. Comunque esplora un bel po' e non so interpretare i
% grafici

%con questo numero di episodi sono portata a scegliere più frequentemente
%l'azione 2 ma aumentando il numero di episodi la scelta diventa
%visibilmente casuale. Ne deduco che in questo contesto non impara davvero
%a giocare.
lengthEpisode = 200000; % number of actions to take

Q = ones(A, 1); % estimate of the value of actions
N = zeros(A, 1); % number of times we take each action

% save history of Q and N
historyQ = zeros(A, lengthEpisode);
historyN = zeros(A, lengthEpisode);

for i = 1:lengthEpisode
    %qui il giocatore 2 sceglie le azioni secondo una certa distribuzione
    %di probabilità
    player_2 = prob_pl2(A); %il giocatore 2 sceglie sempre un'azione con una certa probabilità
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