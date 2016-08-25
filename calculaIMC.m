% Isto é um comentário
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
%num2str: Converte uma variável numérica em uma string (texto)
disp(['O seu IMC é: ', num2str(imc)]);