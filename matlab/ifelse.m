clc;
x = 10;
inicio = 15;
fim = 20;

%Vou testar se x est� dentro de um intervalo
%O operador '&&' permite fazer mais de um teste
if(x >= inicio && x <= fim)
    disp('x � v�lido!');
else
    disp('x � inv�lido!');
end
