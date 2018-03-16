% This routine shows the surprising behaviour of a random Fibonacci sequences.
% As reported by Divakar Viswanath - "RANDOM FIBONACCI SEQUENCES
% AND THE NUMBER 1:13198824..." - in MATHEMATICS OF COMPUTATION, 1999;
% 69(231): 1131-1155:
% "For the familiar Fibonacci sequence (defined by f1 = f2 = 1, and fn = fn1
% + fn2 for n > 2), fn increases exponentially with n at a rate given by the
% golden ratio (1 + sqrt(5))/2 = 1:61803398.... But for a simple
% modification with both additions and subtractions - the random Fibonacci
% sequences defined by t1 = t2 = 1, and for n > 2, tn = ±tn-1 ±tn-2, where
% each ± sign is independent and either + or - with probability 1/2 - it is
% not even obvious if |tn| should increase with n. Our main result is that:
% |tn|^(1/n) -> 1:13198824... as n->Inf 
% with probability 1."
% 
% Example rndfibseq shows two plots:
% the first one is a semilog plot of |ti| and a red dashed line of equation
% y=1.13198824^n;
% the second one is a plot of |ti|^(1/n) and a red dashed line of equation
% y=1.13198824
% 
%           Created by Giuseppe Cardillo
%           giuseppe.cardillo-edta@poste.it
% 
% To cite this file, this would be an appropriate format:
% Cardillo G. (2007) Random Fibonacci Sequences: the surprising behaviour
% of a random Fibonacci sequences. 
% http://www.mathworks.com/matlabcentral/fileexchange/14568

c=1.13198824; %Viswanath's constant
o=[-1 1]; %Head and tail...
l=5e3; %5000 coin launchs simulation
t=ones(1,l); z=t; %vectors preallocations
s1=o(ceil(2.*rand(1,l))); %random sign of term 1
s2=o(ceil(2.*rand(1,l)));%random sign of term 2
for i=3:l
    t(i)=s1(i)*t(i-1)+s2(i)*t(i-2); %generation of the random Fibonacci sequences
    z(i)=abs(t(i))^(1/i); %n-th root of |s(i)|
end
%plots of the results
hFig=figure; %Create a maximized figure window
set(hFig,'units','normalized','outerposition',[0 0 1 1]);
set(hFig, 'Color', 'white'); % sets the color to white
subplot(1,2,1); 
    semilogy(1:1:l,abs(t),'b-',[1 l],[c^1 c^l],'r--'); 
    xlabel('n'); 
    ylabel('|ti|'); 
    title('Random Fibonacci Sequences'); 
    text(1000,10^25,'y=1.13198824^n');
subplot(1,2,2); 
    plot(1:1:l,z,'b-',[1 l],[c c],'r--'); 
    xlabel('n'); 
    ylabel('|ti|^1^/^n'); 
    title('Random Fibonacci Sequences'); 
    text(3000,1.15,'y=1.13198824')
