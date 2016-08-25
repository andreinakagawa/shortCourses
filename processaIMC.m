%Objetivo: Calcular o IMC de todos os volunt�rios do estudo
%1 - Carregar o arquivo de dados
meusDados = load('dados.txt');
%2 - Percorrer a matriz (tabela) de dados e
%para cada par (altura,peso), calcular o IMC
%e armazenar em uma nova matriz de resposta
%Quantas linhas tem a matriz?
numeroVoluntarios = size(meusDados,1); 
%Quantas colunas tem a matriz?
numeroCampos = size(meusDados,2);
%Outra forma
[numeroVoluntarios,numeroCampos] = size(meusDados);
%Criando a matriz de resposta
matrizIMC = zeros(numeroVoluntarios,1);
%Percorrer a tabela
%Como eu preciso pegar o valor de altura e peso
%de cada volunt�rio, vou fazer um la�o que vai
%de um at� o n�mero de volunt�rios
for i=1:numeroVoluntarios
    altura = meusDados(i,2); %Segunda coluna � altura
    peso = meusDados(i,3); %Terceira coluna � peso
    matrizIMC(i) = getIMC(peso,altura);
end

%Gr�ficos
figure(); %Cria uma nova figura
bar(matrizIMC); %Cria um gr�fico de barras
title('Gr�fico de barras - Valor do IMC'); %T�tulo
xlabel('ID do volunt�rio'); %T�tulo do eixo X
ylabel('Valor do IMC'); %T�tulo do eixo Y
%Determina os limites do eixo X do gr�fico
%Passar entre colchetes: 1� valor: M�nimo - 2� valor: M�ximo
xlim([0 numeroVoluntarios]);

%Rela��o entre peso e altura
figure();
todasIdades = meusDados(:,1);
todasAlturas = meusDados(:,2);
todosPesos = meusDados(:,3);
%Subplot me permite plotar v�rios gr�ficos numa
%mesma figura
%1�: N�mero de linhas, 2�: Nro de colunas, 3�: Indice do gr�fico
%o 'k' indica a cor preta, o '*' indica o s�mbolo dos pontos
subplot(3,1,1);
scatter(todasIdades,todasAlturas,'k*');
subplot(3,1,2);
scatter(todasIdades,todosPesos,'k*');
subplot(3,1,3);
scatter(todasAlturas,todosPesos,'k*');


