%Objetivo: Calcular o IMC de todos os voluntários do estudo
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
%de cada voluntário, vou fazer um laço que vai
%de um até o número de voluntários
for i=1:numeroVoluntarios
    altura = meusDados(i,2); %Segunda coluna é altura
    peso = meusDados(i,3); %Terceira coluna é peso
    matrizIMC(i) = getIMC(peso,altura);
end

%Gráficos
figure(); %Cria uma nova figura
bar(matrizIMC); %Cria um gráfico de barras
title('Gráfico de barras - Valor do IMC'); %Título
xlabel('ID do voluntário'); %Título do eixo X
ylabel('Valor do IMC'); %Título do eixo Y
%Determina os limites do eixo X do gráfico
%Passar entre colchetes: 1º valor: Mínimo - 2º valor: Máximo
xlim([0 numeroVoluntarios]);

%Relação entre peso e altura
figure();
todasIdades = meusDados(:,1);
todasAlturas = meusDados(:,2);
todosPesos = meusDados(:,3);
%Subplot me permite plotar vários gráficos numa
%mesma figura
%1º: Número de linhas, 2º: Nro de colunas, 3º: Indice do gráfico
%o 'k' indica a cor preta, o '*' indica o símbolo dos pontos
subplot(3,1,1);
scatter(todasIdades,todasAlturas,'k*');
subplot(3,1,2);
scatter(todasIdades,todosPesos,'k*');
subplot(3,1,3);
scatter(todasAlturas,todosPesos,'k*');


