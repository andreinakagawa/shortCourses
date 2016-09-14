%Função para o cálculo do IMC
%Descrição: Esta função retorna o valor do IMC
%e a sua classificação de acordo com o peso e
%altura informados
%Argumentos: 
%   Altura (m)
%   Peso (kg)
%Saídas:
%   IMC: Variável numérica
%   classe: String contendo a classificação do IMC

function [IMC,classe] = getIMC(peso,altura)
    IMC = peso / (altura * altura); %Cálculo do IMC
    if(IMC < 18.5) %Classificação
        classe = 'Abaixo do peso'; %Abaixo do peso
    else
        if(IMC > 18.5 && IMC < 25) 
            classe = 'Peso ideal'; %Peso ideal
        else
            classe = 'Outra'; %Terminar as outras classes!
        end
    end
end

