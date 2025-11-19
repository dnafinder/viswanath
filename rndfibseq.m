function rndfibseq(n, seed)
%RNDFIBSEQ Random Fibonacci sequences and Viswanath's constant
%   RNDFIBSEQ(N, SEED) simulates a random Fibonacci sequence of length N
%   and produces two plots illustrating the exponential growth rate
%   described by Viswanath's constant.
%
%   The random Fibonacci sequence is defined by
%       t1 = t2 = 1
%       tn = ±tn-1 ±tn-2   (n > 2)
%   where each ± sign is chosen independently to be +1 or -1 with
%   probability 1/2.
%
%   INPUT
%     N    - Number of terms in the sequence (scalar positive integer).
%            Default: 5000.
%
%     SEED - Optional integer seed for RNG (for reproducible runs).
%            If omitted or empty, the current RNG state is used.
%
%   OUTPUT
%     T    - Row vector (1 x N) containing the random Fibonacci sequence.
%     Z    - Row vector (1 x N) where
%              Z(n) = |T(n)|^(1/n)
%            for n >= 3; entries 1 and 2 are set to NaN.
%
%   PLOTS
%     The function opens a figure with two subplots:
%
%       1) Semilog plot of |t_n| vs n with a red dashed line
%          corresponding to y = c^n, where c ≈ 1.13198824 is
%          Viswanath's constant.
%
%       2) Plot of |t_n|^(1/n) vs n with a red dashed horizontal line
%          at y = c.
%
%   VISWANATH'S CONSTANT
%     As reported by Divakar Viswanath in:
%       Viswanath D. "Random Fibonacci sequences and the number
%       1.13198824...", Mathematics of Computation, 1999; 69(231):1131–1155.
%
%     For the random Fibonacci sequence tn, the main result is that
%       |tn|^(1/n) -> 1.13198824...  as n -> Inf   (with probability 1).
%
%   EXAMPLES
%     % Default length (N = 5000), non-reproducible
%     rndfibseq;
%
%     % Shorter sequence (N = 1000)
%     rndfibseq(1000);
%
%     % Reproducible sequence with fixed RNG seed
%     [t, z] = rndfibseq(5000, 123);
%
%   ------------------------------------------------------------------
%   Author and citation:
%   ------------------------------------------------------------------
%   Created by:  Giuseppe Cardillo
%   E-mail:      giuseppe.cardillo.75@gmail.com
%
%   To cite this file:
%   Cardillo G. (2007). rndfibseq.m – Random Fibonacci sequences:
%   the surprising behaviour of a random Fibonacci sequence.
%
%   GitHub repository:
%   https://github.com/dnafinder/viswanath
%   ------------------------------------------------------------------

% ------------------------- Input handling ----------------------------
if nargin < 1 || isempty(n)
    n = 5000;
end
validateattributes(n, {'numeric'}, ...
    {'scalar','real','finite','integer','nonnan','positive'});

if nargin >= 2 && ~isempty(seed)
    % Optional reproducible RNG seed
    rng(seed);
end

% ------------------------- Constants --------------------------------
c = 1.13198824;  % Viswanath's constant

% ------------------------- Sequence generation ----------------------
% Preallocate sequence and nth-root vector
t = ones(1, n);      % t1 = t2 = 1 by definition
z = NaN(1, n);       % nth-root |t_n|^(1/n); NaN for n=1,2

% Random signs for each step:
% s1 and s2 are in { -1, +1 } with equal probability.
s1 = randi([0 1], 1, n) * 2 - 1;  % converts 0/1 → -1/+1
s2 = randi([0 1], 1, n) * 2 - 1;

for k = 3:n
    % Random Fibonacci recurrence:
    % t(k) = ±t(k-1) ± t(k-2)
    t(k) = s1(k) * t(k-1) + s2(k) * t(k-2);

    % nth-root of absolute value
    z(k) = abs(t(k))^(1 / k);
end

% ------------------------- Plotting ---------------------------------
hFig = figure;
set(hFig, 'Units', 'normalized', 'OuterPosition', [0 0 1 1], ...
          'Color', 'w');

idx = 1:n;

% --- First subplot: semilog plot of |t_n| and c^n ---
subplot(1, 2, 1);
semilogy(idx, abs(t), 'b-', 'LineWidth', 1.2);
hold on;
% Exponential reference line y = c^n
semilogy(idx, c.^idx, 'r--', 'LineWidth', 1.2);
grid on;
xlabel('n');
ylabel('|t_n|');
title('Random Fibonacci Sequences');
legend({'|t_n|', 'y = 1.13198824^n'}, 'Location', 'SouthEast');

% Place annotation text roughly in upper-left region
text(round(0.1 * n), max(abs(t)) * 1e-2, 'y = 1.13198824^n', ...
     'Color', 'r', 'FontSize', 10);

% --- Second subplot: plot of |t_n|^{1/n} and constant line c ---
subplot(1, 2, 2);
plot(idx, z, 'b-', 'LineWidth', 1.2);
hold on;
plot(idx, c * ones(size(idx)), 'r--', 'LineWidth', 1.2);
grid on;
xlabel('n');
ylabel('|t_n|^{1/n}');
title('Random Fibonacci Sequences – nth roots');
legend({'|t_n|^{1/n}', 'y = 1.13198824'}, 'Location', 'SouthEast');

% Place annotation text near the reference line
text(round(0.6 * n), c + 0.01, 'y = 1.13198824', ...
     'Color', 'r', 'FontSize', 10);

end
