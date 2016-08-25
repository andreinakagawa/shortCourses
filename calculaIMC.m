% Isto � um coment�rio
% Calculadora de IMC
% Este programa recebe a altura(m) e o peso (kg) e
% retorna o valor do IMC
% Classifica��o
% - Abaixo de 18.5: Abaixo do peso
% - Entre 18.6 e 24.9: Peso ideal
% - Entre 25 e 29.9: Levemente acima do peso
% - Entre 30 e 34.9: Obesidade Grau I
% - Entre 35 e 39.9: Obesidade Grau II
% - Acima de 40: Obesidade Grau III

%1 - Receber o valor da altura
altura = input('Entre com a sua altura (m): ');
%2 - Receber o valor do peso
peso = input('Entre o seu peso (kg): ');
%3 - Calcular o IMC
[imc,classe] = getIMC(peso,altura);
%4 - Mostrar o valor na tela 
%num2str: Converte uma vari�vel num�rica em uma string (texto)
disp(['O seu IMC �: ', num2str(imc)]);
disp(['Classifica��o: ', classe]);
    

