%Fun��o para o c�lculo do IMC
%Descri��o: Esta fun��o retorna o valor do IMC
%e a sua classifica��o de acordo com o peso e
%altura informados
%Argumentos: 
%   Altura (m)
%   Peso (kg)
%Sa�das:
%   IMC: Vari�vel num�rica
%   classe: String contendo a classifica��o do IMC

function [IMC,classe] = getIMC(peso,altura)
    IMC = peso / (altura * altura); %C�lculo do IMC
    if(IMC < 18.5) %Classifica��o
        classe = 'Abaixo do peso'; %Abaixo do peso
    else
        if(IMC > 18.5 && IMC < 25) 
            classe = 'Peso ideal'; %Peso ideal
        else
            classe = 'Outra'; %Terminar as outras classes!
        end
    end
end

