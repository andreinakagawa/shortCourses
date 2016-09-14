%Exercício
%Analisar os dados contidos no arquivo 
%"basedadosIMC.txt" 
%Estratégia de análise
% -> Selecionar apenas voluntários entre 18 e 25 anos
% -> Separar em dois grupos: Homens e Mulheres
% -> Para cada grupo:
%   - Calcular a média da idade, da altura e do peso
%   - Calcular o desvio padrão das mesmas variáveis
%   - Calcular o IMC de cada indivíduo
%   - Classificar os indivíduos em:
%       - Abaixo do peso, peso normal, acima do peso
%   - Quantificar a % da população dentro de cada classe
%   - Gerar os gráficos adequados para análise
%   - Analisar os dados

%Como fazer?
% 1: Carregar o arquivo -> usar a função "load"
%       Colunas: Idade, Sexo, Altura, Peso
meusDados = load('basedadosIMC.txt');

% 2: Recuperar os voluntários entre 18 e 25 anos
%       Usem o find e a condição >= 18 & <= 25
voluntariosSelecionados = find(meusDados(:,1) >= 18 ...
    & meusDados(:,1) <= 25);
%Encontrando a nova tabela
tabelaSelecionados = meusDados(voluntariosSelecionados,:);

% 3: Separar em homens e mulheres
%       Usem o find ("0" é homem, "1" é mulher)
vHomens = find(tabelaSelecionados(:,2) == 0);
vMulheres = find(tabelaSelecionados(:,2) == 1);

%Dados dos homens
tabHomens = tabelaSelecionados(vHomens,:);
%Dados das mulheres
tabMulheres = tabelaSelecionados(vMulheres,:);

% 4: Calcular a média, desvio padrão 
%       Usem "mean" e "std"
mediasHomens = mean(tabHomens);
mediasMulheres = mean(tabMulheres);
desvioHomens = std(tabHomens);
desvioMulheres = std(tabMulheres);

% 5: Calcular o IMC
%      Usem o método getIMC e façam um laço para
%       percorrer os indivíduos
numHomens = size(tabHomens,1); %Quantos homens
numMulheres = size(tabMulheres,1); %Quantas mulheres
imcHomens = zeros(numHomens,1);
imcMulheres = zeros(numMulheres,1);
%3 colunas: Quantidade abaixo do peso, peso normal e acima do peso
classeHomens = zeros(1,3); 
classeMulheres = zeros(1,3);
%Percorrer a tabela dos homens
for i=1:numHomens
    peso = tabHomens(i,4);
    altura = tabHomens(i,3);
    imcHomens(i) = getIMC(peso,altura);
    if(imcHomens(i) < 18.5) %Abaixo do peso
        classeHomens(1) = classeHomens(1) + 1;
    else if(imcHomens(i) > 18.5 && imcHomens(i) < 25)
            classeHomens(2) = classeHomens(2) + 1;
        else
            classeHomens(3) = classeHomens(3) + 1;
        end
    end 
end
%Percorrer a tabela das mulheres
for i=1:numMulheres
    peso = tabMulheres(i,4);
    altura = tabMulheres(i,3);
    imcMulheres(i) = getIMC(peso,altura);
    if(imcMulheres(i) < 18.5) %Abaixo do peso
        classeMulheres(1) = classeMulheres(1) + 1;
    else if(imcMulheres(i) > 18.5 && imcMulheres(i) < 25)
            classeMulheres(2) = classeMulheres(2) + 1;
        else
            classeMulheres(3) = classeMulheres(3) + 1;
        end
    end 
end

classeHomens = (classeHomens ./ numHomens) * 100;
classeMulheres = (classeMulheres ./ numMulheres) * 100;

%Gráficos
figure();
bar(classeHomens);

figure();
bar(classeMulheres);