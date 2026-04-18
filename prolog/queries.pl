/* episódios com nota > 8 */
high_rated(Title, Rate) :-
    episode(_, _, Title, _, _, Rate, _, _, _),
    Rate > 8.

/* melhor episódio */
best_episode(Title, Rate) :-
    findall(Rate-Title, episode(_, _, Title, _, _, Rate, _, _, _), List),
    max_member(Rate-Title, List).


/* média por saga */
avg_rating_saga(Saga, Avg) :-
    findall(R, episode(_, _, _, _, _, R, _, Saga, _), Rates),
    sum_list(Rates, Sum),
    length(Rates, Count),
    Count > 0,
    Avg is Sum / Count.


/* lista de sagas com média */
sagas_avg(List) :-
    findall(Saga, episode(_, _, _, _, _, _, _, Saga, _), Raw),
    sort(Raw, Sagas),
    findall(Saga-Avg,
        (
            member(Saga, Sagas),
            avg_rating_saga(Saga, Avg)
        ),
    List).