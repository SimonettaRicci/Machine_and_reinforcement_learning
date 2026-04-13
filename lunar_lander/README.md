# Lunar Lander: Reinforcement Learning Control

## Descrizione del progetto
Questo repository contiene lo sviluppo e l’analisi di un agente di **Reinforcement Learning** in grado di pilotare autonomamente un lander lunare.

L’obiettivo è ottenere un atterraggio sicuro sulla piattaforma, gestendo correttamente gravità, inerzia e consumo di carburante.

---

## Obiettivo

Progettare un sistema di controllo intelligente che permetta al lander di:
- stabilizzare la discesa
- controllare assetto e velocità
- atterrare senza collisioni
- massimizzare il reward cumulativo

---

## Ambiente

### Stato (State Space)
Lo stato è rappresentato da un vettore a 8 dimensioni:

- posizione: (x, y)
- velocità: (vₓ, vᵧ)
- angolo di inclinazione
- velocità angolare
- contatto gambe di atterraggio (dx, sx)

---

### Spazio delle azioni

L’agente può scegliere tra 4 azioni discrete:

- 0 → Idle (nessuna azione)
- 1 → Motore sinistro
- 2 → Motore principale
- 3 → Motore destro

---

## Sistema di reward

- +100 → atterraggio sicuro
- -100 → schianto
- penalità per consumo carburante: -0.03 per frame
- bonus/malus per stabilità (velocità e inclinazione)
- episodio risolto se reward ≥ 200

---

## Algoritmi utilizzati

### Sarsa(λ)
- algoritmo on-policy
- utilizza trace di eleggibilità
- apprendimento incrementale basato su esperienza

---

### True Online TD(λ)
- versione ottimizzata per approssimazione lineare
- aggiornamenti più stabili e efficienti
- adatto a spazi di stato complessi

---

## Tecniche di rappresentazione

### Tile Coding
Per gestire lo spazio continuo, viene utilizzata la discretizzazione tramite tile coding:

- trasformazione dello stato in feature discrete
- combinazione di più griglie sovrapposte
- approssimazione della funzione valore

---

## Parametri di simulazione

- Episodi: 120.000
- Epsilon (ε): 0.8 con decadimento β
- Gamma (γ): 0.8
- Tile Coding:
  - M = 5 (celle)
  - N = 6 (griglie)

---

## Risultati

### Configurazione ridotta (3 variabili)
- stato semplificato (solo posizione e angolo)
- apprendimento non stabile
- frequenti schianti anche dopo 150.000 episodi

---

### Configurazione completa
- stato completo con velocità e angolo
- apprendimento più stabile
- atterraggi riusciti dopo ~120.000 episodi
- miglioramento progressivo delle performance

---

## Conclusioni

Il progetto evidenzia come la qualità della rappresentazione dello stato sia fondamentale nel Reinforcement Learning, e come tecniche di approssimazione come tile coding permettano di gestire ambienti complessi.

---

## Autore
Simonetta Ricci, Silvio Valentino

---

## Note
Progetto sviluppato nell’ambito dello studio di **Reinforcement Learning con approssimazione della funzione valore e controllo continuo**.

