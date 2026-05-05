% --- Script Parametrico per la Stampa di Vettori di Contrasto per SPM ---

% =========================================================================
%   1. IMPOSTAZIONI DEI PARAMETRI (MODIFICA QUESTI VALORI PER OGNI SOGGETTO)
% =========================================================================

% Numero di regressori di rumore (es. movimento + outlier) per ogni sessione
R_test = 7;   % Numero di regressori di rumore per la sessione TEST
R_retest = 16; % Numero di regressori di rumore per la sessione RETEST


% =========================================================================
%   2. DEFINIZIONE DELLE MATRICI "FIXED" E DEI NOMI DEI CONTRASTI
% =========================================================================

% Nomi dei contrasti (in un cell array, per la stampa)
contrast_names = {
    'PPI_contrast'
};


% Matrice "fixed" per la sessione TEST (13 righe, 3 colonne per i task)
fixed_test = [
    0.5,    0,      0;      
];

% Matrice "fixed" per la sessione RETEST (13 righe, 3 colonne per i task)
fixed_retest = [
    0.5,    0,      0;   
];

% =========================================================================
%   3. CREAZIONE DELLA MATRICE COMPLETA (COME PRIMA)
% =========================================================================

num_contrasts = size(fixed_test, 1);
regressor_test = zeros(num_contrasts, R_test);
regressor_retest = zeros(num_contrasts, R_retest);
constants_matrix = zeros(num_contrasts, 2);

contrast_matrix_final = [regressor_test, fixed_test, regressor_retest, fixed_retest, constants_matrix];

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
disp(size(contrast_matrix_final));
