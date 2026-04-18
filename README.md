# Knowledge Engine - Naruto Dataset

## Descrição do Projeto
> Aluno: Gabriel Chaves Aguiar

Projeto realizado para a disciplina de Matemática Discreta, ministrada pelo professor **Raul Ikeda**. O objetivo é criar um motor de inferência utilizando a linguagem de programaç


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

## Query 1 - Episódios com nota maior que 8 ( Pergunta simples ) 

```prolog
?- high_rated(Title, Rate).
```

**Resultado:**

```

T = 'Homecoming',
R = 8.2 

```
### Ao executar a query, retorna o título de um epssódio e sua nota ( se ela for maior que 8). Para obter mais resultados, basta pressionar a tecla `;` no terminal do Prolog.
---

## Query 2 - Melhor episódio ( Pergunta simples ) 

```prolog
?- best_episode(Title, Rate).
```

**Resultado:**

```

Title = 'Homecoming',
Rate = 8.2 

```
### Ao executar a query, retorna o título do episódio com a maior nota e sua respectiva nota.
---

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



## Tecnologias Utilizadas

* **Python** → ETL (extração e conversão do CSV para Prolog)
* **SWI-Prolog** → base de conhecimento e inferência lógica

---

## Referências e materiais de estudo 

- https://www.swi-prolog.org/
- https://stackoverflow.com/questions/63424113/proper-definition-of-atom-in-prolog-and-logic-programming

