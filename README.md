# Knowledge Engine - Naruto Dataset

## Descrição do Projeto

> Aluno: Gabriel Chaves Aguiar

Projeto realizado para a disciplina de Matemática Discreta, ministrada pelo professor **Raul Ikeda**. O objetivo é criar um motor de inferência utilizando a linguagem de programação Prolog, utilizando um dataset de episódios de Naruto.

---

## ▶️ Como Executar

### 1. Gerar a base Prolog com Python

```bash
python python/generate.py
```

Isso irá gerar o arquivo:

```
prolog/episodes.pl
```

---

### 2. Abrir o SWI-Prolog

```bash
swipl
```

---

### 3. Navegar até a pasta do projeto

```prolog
?- working_directory(_, 'seu-caminho/Knowledge-Engine').
```

---

### 4. Carregar os arquivos

```prolog
?- consult('prolog/episodes.pl').
?- consult('prolog/queries.pl').
```

---

## Query 1 - Episódios com nota maior que 8 

```prolog
?- high_rated(Title, Rate).
```

**Resultado:**

```
T = 'Homecoming',
R = 8.2 
```

### Ao executar a query, retorna o título de um episódio e sua nota (se ela for maior que 8). Para obter mais resultados, basta pressionar `;` no terminal.

---

## Query 2 - Melhor episódio 

```prolog
?- best_episode(Title, Rate).
```

**Resultado:**

```
Title = 'Homecoming',
Rate = 8.2 
```

### Retorna o episódio com maior nota e sua respectiva avaliação.

---

# Pergunta 1: Qual é a média de notas por Saga/Arco?
## Query 3 - Média de notas por saga ( Pergunta Sofisticada ) 

```prolog
?- sagas_avg(List).
```

**Resultado:**

```
List = ['s1 Kazekage Rescue'-7.9875, 's10 The Gathering of the Five Kage'-7.736000000000001, 's11 Paradise On The Ship'-5.876190476190477, 's12 Nine-Tailed Fox Taming And Karmic Encounters'-7.612121212121212, 's13 The Seven Shinobi Swordsmen'-6.8549999999999995, 's14 The Fourth Great Ninja War - Assailants From Afar'-6.699999999999999, 's15 The Fourth Great Ninja War - Sasuke And Itachi'-8.178571428571429, 's16 Kakashi: Shadow Of The Anbu Black Ops'-7.553846153846153, … - …|…].

```
### Ao executar a query, retorna uma lista de sagas e suas respectivas médias de notas.

---


# Pergunta 2: Dentre os episódios com nota acima de oito, quais são os que tiveram um maior número de votos?
## Query 4 - Episódio mais votado entre os com nota > 8 

```prolog
?- best_high_rated_votes(Title, Votes).
```

**Resultado:**

```
Title = 'Naruto and Sasuke',
Votes = 2780.
```

### Esta query:

* filtra episódios com nota maior que 8
* compara o número de votos
* retorna o episódio mais popular entre os melhor avaliados

---

# Pergunta 3: Qual Saga teve a maior quantidade de episódios com nota acima de 8?
## Query 5 - Saga com mais episódios acima de 8 

```prolog
?- best_saga_high_rated(Saga, Count).
```

**Resultado:**

```
Saga = 's20 Infinite Tsukuyomi: The Invocation',
Count = 27.
```

### Esta query:

* utiliza um predicado auxiliar (`high_rated_episode`)
* conta quantos episódios de cada saga têm nota > 8
* retorna a saga com maior quantidade
---

# Pergunta 4: Qual foi a melhor saga em geral? (Média de notas dos episódios e quantidade de eps com nota acima de 8 )  
## Query 6 - Melhor saga geral 

```prolog
?- best_saga_overall(Saga, Avg, HighCount).
```

**Resultado:**

```
Saga = 's17 The Fourth Great Ninja War - The Return Of Squad Seven',
Avg = 8.518181818181818,
HighCount = 11.
```

Esta query:
* utiliza composição de regras (avg_rating_saga + high_rated_count_by_saga)
* combina média de notas com quantidade de episódios acima de 8
* usa comparação com max_member

---

## Query Auxiliar - Estatísticas de uma saga

```prolog
    ?- sagas_stats_list(List).
```

**Resultado:**

```
List = [7.98-15-'s1 Kazekage Rescue', ...].
```

### Esta query:

* Retorna uma lista no formato:
__Média - Quantidade - Saga__

* Pode ser usada para análise geral ou debug

##  Tecnologias Utilizadas

* **Python** → ETL (extração e conversão do CSV para Prolog)
* **SWI-Prolog** → base de conhecimento e inferência lógica

---

## Referências e materiais de estudo 

- https://www.swi-prolog.org/
- https://stackoverflow.com/questions/63424113/proper-definition-of-atom-in-prolog-and-logic-programming


## Dataset Utilizado
- https://www.kaggle.com/datasets/alisson987/naruto-shippuden-rate

### Formato do Dataset
| ID | Num_episode | Title                          | Type                 | Year_launch | Rate | Votes | Saga                  | Airdate    |
|----|------------|--------------------------------|----------------------|-------------|------|-------|-----------------------|------------|
| 1  | 1          | Homecoming                     | Mixed Canon/Filler   | 2007        | 8.2  | 728   | s1 Kazekage Rescue    | 2007-02-15 |
| 2  | 2          | The Akatsuki Makes Its Move    | Mixed Canon/Filler   | 2007        | 8    | 575   | s1 Kazekage Rescue    | 2007-02-15 |
| 3  | 3          | The Results of Training        | Mixed Canon/Filler   | 2007        | 8    | 508   | s1 Kazekage Rescue    | 2007-02-22 |
| 4  | 4          | The Jinchuriki of the Sand     | Mixed Canon/Filler   | 2007        | 8.2  | 517   | s1 Kazekage Rescue    | 2007-03-01 |

> O dataset original não possui a tabela "ID", e sim uma tabela vazia, podendo ser interpretada como o ID

Formato de cada elemento em Prolog:

```episode(1, 1, 'Homecoming', 'Mixed Canon/Filler', 2007, 8.2, 728, 's1 Kazekage Rescue', '2007-02-15').```
