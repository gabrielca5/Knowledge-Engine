/* episódios com nota > 8 */
high_rated_episode(Title, Rate, Votes, Saga) :-
    episode(_, _, Title, _, _, Rate, Votes, Saga, _),
    Rate > 8.

/* entre os episódios com rate > 8, pega o que tem mais votos - Sofisticada */
best_high_rated_votes(Title, Votes) :-
    findall(Votes-Title,
        high_rated_episode(Title, _, Votes, _),
        List),
    max_member(Votes-Title, List).

/* melhor episódio - Simples */
best_episode(Title, Rate) :-
    findall(Rate-Title, episode(_, _, Title, _, _, Rate, _, _, _), List),
    max_member(Rate-Title, List).

/* média por saga - Simples */
avg_rating_saga(Saga, Avg) :-
    findall(R, episode(_, _, _, _, _, R, _, Saga, _), Rates),
    sum_list(Rates, Sum),
    length(Rates, Count),
    Count > 0,
    Avg is Sum / Count.

/* lista de sagas com média - Sofisticada (Utiliza função externa) */
sagas_avg(List) :-
    findall(Saga, episode(_, _, _, _, _, _, _, Saga, _), Raw),
    sort(Raw, Sagas),
    findall(Saga-Avg,
        (
            member(Saga, Sagas),
            avg_rating_saga(Saga, Avg)
        ),
    List).

/* conta quantos episódios com rate > 8 uma saga tem */
high_rated_count_by_saga(Saga, Count) :-
    episode(_, _, _, _, _, _, _, Saga, _),
    findall(1, high_rated_episode(_, _, _, Saga), Ones),
    length(Ones, Count).

/* saga com mais episódios acima de 8 */
best_saga_high_rated(Saga, Count) :-
    findall(Saga,
        high_rated_episode(_, _, _, Saga),
        RawSagas),
    sort(RawSagas, Sagas),
    findall(Count-Saga,
        (
            member(Saga, Sagas),
            findall(1, high_rated_episode(_, _, _, Saga), Ones),
            length(Ones, Count)
        ),
        Pairs),
    max_member(Count-Saga, Pairs).

/* estatísticas de uma saga: média + quantidade de episódios acima de 8 */
saga_stats(Saga, Avg, HighCount) :-
    avg_rating_saga(Saga, Avg),
    high_rated_count_by_saga(Saga, HighCount).

/* lista de estatísticas de todas as sagas */
sagas_stats_list(List) :-
    findall(Saga,
        episode(_, _, _, _, _, _, _, Saga, _),
        RawSagas),
    sort(RawSagas, Sagas),
    findall(Avg-HighCount-Saga,
        (
            member(Saga, Sagas),
            saga_stats(Saga, Avg, HighCount)
        ),
        List).

/* saga “final” mais forte: maior média */
best_saga_overall(Saga, Avg, HighCount) :-
    sagas_stats_list(List),
    max_member(Avg-HighCount-Saga, List).