% Isto � um coment�rio
% Calculadora de IMC
% Este programa recebe a altura(m) e o peso (kg) e
% retorna o valor do IMC

%1 - Receber o valor da altura
altura = input('Entre com a sua altura (m): ');
%2 - Receber o valor do peso
peso = input('Entre o seu peso (kg): ');
%3 - Calcular o IMC
imc = peso / (altura * altura); %Outra forma: altura^2
%4 - Mostrar o valor na tela 
%num2str: Converte uma vari�vel num�rica em uma string (texto)
disp(['O seu IMC �: ', num2str(imc)]);