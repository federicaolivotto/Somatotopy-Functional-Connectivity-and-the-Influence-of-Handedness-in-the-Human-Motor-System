% --- Script Parametrico per la Stampa di Vettori di Contrasto per SPM ---

% =========================================================================
%   1. IMPOSTAZIONI DEI PARAMETRI (MODIFICA QUESTI VALORI PER OGNI SOGGETTO)
% =========================================================================

% Numero di regressori di rumore (es. movimento + outlier) per ogni sessione
R_test = 9-1;   % Numero di regressori TEST (lasciate -1)
R_retest = 26-1; % Numero di regressori RETEST (lasciate -1)

% =========================================================================
%   2. DEFINIZIONE DELLE MATRICI "FIXED" E DEI NOMI DEI CONTRASTI
% =========================================================================

% Nomi dei contrasti (in un cell array, per la stampa)
contrast_names = {
    'Finger_Activation', ...
    'Foot_Activation', ...
    'Lips_Activation', ...
    'Motor_Activation_General', ...
    'Finger_vs_Others', ...
    'Foot_vs_Others', ...
    'Lips_vs_Others', ...
    'F-contrast row 1 (Effects of Interest)', ...
    'F-contrast row 2 (Effects of Interest)', ...
    'F-contrast row 3 (Effects of Interest)', ...
    'F-contrast row 4 (Effects of Interest)', ...
    'F-contrast row 5 (Effects of Interest)', ...
    'F-contrast row 6 (Effects of Interest)'
};


% Matrice "fixed" per la sessione TEST (13 righe, 3 colonne per i task)
fixed_test = [
    0.5,    0,      0;       % Finger_Activation
    0,      0.5,    0;       % Foot_Activation
    0,      0,      0.5;     % Lips_Activation
    1/6,    1/6,    1/6;     % Motor_Activation_General (usiamo la frazione per precisione)
    0.5,   -0.25,  -0.25;   % Finger_vs_Others
   -0.25,   0.5,   -0.25;   % Foot_vs_Others
   -0.25,  -0.25,   0.5;    % Lips_vs_Others
    1,      0,      0;       % F-contrast riga 1
    0,      1,      0;       % F-contrast riga 2
    0,      0,      1;       % F-contrast riga 3
    0,      0,      0;       % F-contrast riga 4 (zero per questa sessione)
    0,      0,      0;       % F-contrast riga 5 (zero per questa sessione)
    0,      0,      0;       % F-contrast riga 6 (zero per questa sessione)
];

% Matrice "fixed" per la sessione RETEST (13 righe, 3 colonne per i task)
fixed_retest = [
    0.5,    0,      0;       % Finger_Activation
    0,      0.5,    0;       % Foot_Activation
    0,      0,      0.5;     % Lips_Activation
    1/6,    1/6,    1/6;     % Motor_Activation_General
    0.5,   -0.25,  -0.25;   % Finger_vs_Others
   -0.25,   0.5,   -0.25;   % Foot_vs_Others
   -0.25,  -0.25,   0.5;    % Lips_vs_Others
    0,      0,      0;       % F-contrast riga 1 (zero per questa sessione)
    0,      0,      0;       % F-contrast riga 2 (zero per questa sessione)
    0,      0,      0;       % F-contrast riga 3 (zero per questa sessione)
    1,      0,      0;       % F-contrast riga 4
    0,      1,      0;       % F-contrast riga 5
    0,      0,      1;       % F-contrast riga 6
];

% =========================================================================
%   3. CREAZIONE DELLA MATRICE COMPLETA (COME PRIMA)
% =========================================================================

num_contrasts = size(fixed_test, 1);
regressor_test = zeros(num_contrasts, R_test);
regressor_retest = zeros(num_contrasts, R_retest);
constants_matrix = zeros(num_contrasts, 2);
const_test_col = constants_matrix(:, 1);
const_retest_col = constants_matrix(:, 2);

contrast_matrix_final = [fixed_test, regressor_test, const_test_col, fixed_retest, regressor_retest, const_retest_col];

% =========================================================================
%   4. STAMPA DEI SINGOLI VETTORI DI CONTRASTO
% =========================================================================

fprintf('--- Vettori di Contrasto per SPM (pronti per il copia-incolla) ---\n\n');

for i = 1:num_contrasts
    % Prende il nome del contrasto corrente
    current_name = contrast_names{i};
    
    % Prende la riga della matrice corrispondente (il vettore di contrasto)
    current_vector = contrast_matrix_final(i, :);
    
    % Stampa il nome del contrasto
    fprintf('Contrasto %d: %s\n', i, current_name);
    
    % Converte il vettore in una stringa di testo, formattata per SPM
    % (con parentesi quadre e spazi)
    vector_string = ['[' num2str(current_vector) ']'];
    
    % Stampa il vettore formattato
    fprintf('%s\n\n', vector_string);
end

fprintf('--- Fine dei Vettori di Contrasto ---\n');