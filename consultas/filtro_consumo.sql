-- PROJETO DE APRENDIZAGEM DE SQL
-- Exploração de dados de estudantes no SQLite, usando DBeaver.
-- Cada consulta termina com ponto e vírgula (;).


-- 1. CONTAR TODOS OS REGISTROS DE CADA TABELA
-- SELECT: define o que será apresentado no resultado.
-- COUNT(*): conta todas as linhas.
-- FROM: indica a tabela consultada.
-- m e p: apelidos das tabelas, opcionais nestas consultas.

SELECT COUNT(*) FROM Maths m;
SELECT COUNT(*) FROM Portuguese p;


-- 2. VISUALIZAR ATÉ 10 REGISTROS DE MATHS
-- O * depois de SELECT mostra todas as colunas.
-- LIMIT 10 restringe o resultado a até 10 linhas.
-- Não apaga registros nem altera a tabela.
-- Sem ORDER BY, não há garantia de quais linhas aparecerão.

SELECT *
FROM Maths
LIMIT 10;


-- 3. ESCOLHER QUAIS COLUNAS MOSTRAR
-- school: escola; age: idade.
-- A vírgula separa as colunas selecionadas.
-- Mostra até 10 registros, somente com essas duas colunas.

SELECT school, age
FROM Maths
LIMIT 10;


-- 4. CONTAR OS REGISTROS DE MENORES DE 18 ANOS
-- WHERE filtra as linhas antes da contagem.
-- < significa "menor que": quem tem exatamente 18 não entra.

SELECT COUNT(*)
FROM Maths
WHERE age < 18;


-- 5. CONTAR OS REGISTROS DE PESSOAS COM 18 ANOS OU MAIS
-- >= significa "maior ou igual a", incluindo a idade 18.

SELECT COUNT(*)
FROM Maths
WHERE age >= 18;


-- 6. LISTAR ESCOLA E IDADE DE QUEM TEM 18 ANOS OU MAIS
-- ORDER BY age organiza o resultado pela idade.
-- DESC indica ordem decrescente: da maior para a menor.

SELECT school, age
FROM Maths
WHERE age >= 18
ORDER BY age DESC;


-- 7. OBSERVAR IDADE E NÍVEIS DE CONSUMO DE ÁLCOOL
-- Dalc: nível de consumo nos dias úteis.
-- Walc: nível de consumo no fim de semana.
-- A escala vai de 1 (muito baixo) a 5 (muito alto).
-- Os valores representam níveis, não quantidades de copos.
-- ORDER BY Walc DESC coloca os maiores níveis no topo.
-- Sem LIMIT, a consulta inclui todos os registros da tabela.

SELECT age, Dalc, Walc
FROM Maths
ORDER BY Walc DESC;


-- 8. CONTAR MENORES DE 18 COM WALC IGUAL A 5
-- AND exige que as duas condições sejam verdadeiras
-- na mesma linha: idade abaixo de 18 E Walc igual a 5.
-- = testa igualdade.

SELECT COUNT(*)
FROM Maths
WHERE age < 18 AND Walc = 5;


-- 9. CONTAR MENORES DE 18 EM CADA NÍVEL DE WALC
-- WHERE seleciona os menores de 18.
-- GROUP BY Walc reúne as linhas por nível de consumo.
-- COUNT(*) conta os registros dentro de cada grupo.
-- AS quantidade dá um nome à coluna da contagem.
-- ORDER BY Walc ordena os níveis do menor para o maior:
-- a ordem crescente (ASC) é o padrão.

SELECT Walc, COUNT(*) AS quantidade
FROM Maths
WHERE age < 18
GROUP BY Walc
ORDER BY Walc;


-- 10. LISTAR REGISTROS COM OS DOIS NÍVEIS A PARTIR DE 3
-- Exige Walc >= 3 E Dalc >= 3 ao mesmo tempo.
-- Inclui qualquer idade, pois não há filtro de idade.
-- SELECT * mostra todas as colunas dos registros filtrados.

SELECT *
FROM Maths
WHERE Walc >= 3 AND Dalc >= 3;


-- 11. ESCOLHER COLUNAS PARA EXPLORAR O GRUPO FILTRADO
-- Mantém os mesmos critérios de consumo da consulta anterior.
-- Mostra apenas as colunas escolhidas, na ordem indicada.
--
-- sex: sexo registrado.
-- age: idade em anos.
-- studytime: faixa de tempo semanal de estudo:
--   1 = menos de 2 horas; 2 = de 2 a 5 horas;
--   3 = de 5 a 10 horas; 4 = mais de 10 horas.
-- failures: registro de reprovações anteriores.
-- schoolsup: recebe apoio educacional extra.
-- famsup: recebe apoio educacional da família.
-- higher: deseja cursar ensino superior.
-- internet: tem acesso à internet em casa.
-- Nas colunas de sim/não, yes = sim e no = não.
--
-- Esta consulta não define uma ordem para o resultado.
-- Para ordenar por Walc do maior para o menor, acrescente
-- ORDER BY Walc DESC antes do ponto e vírgula final.

SELECT sex, Walc, Dalc, age, studytime, failures,
       schoolsup, famsup, higher, internet
FROM Maths
WHERE Walc >= 3 AND Dalc >= 3;
```
