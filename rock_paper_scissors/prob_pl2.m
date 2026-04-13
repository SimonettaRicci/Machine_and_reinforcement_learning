function action = prob_pl2(~)
    prob = [0.05, 0.05, 0.05, 0.05, 0.8];
    % Verifica che il vettore di probabilità sia corretto
    assert(length(prob) == 5, 'Il vettore di probabilità deve avere lunghezza 5.');
    assert(all(prob >= 0), 'Le probabilità devono essere non negative.');
    assert(abs(sum(prob) - 1) < eps, 'La somma delle probabilità deve essere 1.');

    % Genera un numero casuale tra 0 e 1
    num_casuale = rand();

    % Calcola l'intervallo per ciascuna azione basato sulle probabilità
    intervallo = cumsum(prob);

    % Determina l'azione scelta
    if num_casuale <= intervallo(1)
        action = 1;
    elseif num_casuale <= intervallo(2)
        action = 2;
    elseif num_casuale <= intervallo(3)
        action = 3;
    elseif num_casuale <= intervallo(4)
        action = 4;
    else
        action = 5;
    end
end