clc;
x = 10;
inicio = 15;
fim = 20;

%Vou testar se x está dentro de um intervalo
%O operador '&&' permite fazer mais de um teste
if(x >= inicio && x <= fim)
    disp('x é válido!');
else
    disp('x é inválido!');
end
