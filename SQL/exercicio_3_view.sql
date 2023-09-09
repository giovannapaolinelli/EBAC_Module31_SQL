CREATE VIEW Actor_120Films as
SELECT
    act.actorName,
    count(fa.film_id) numberOfFilms
FROM film_actor fa
    LEFT JOIN (
        SELECT
            actor.actor_id,
            concat(
                actor.first_name,
                ' ',
                actor.last_name
            ) actorName
        FROM actor
    ) act ON act.actor_id = fa.actor_id
    INNER JOIN (
        SELECT
            film.length,
            film.film_id
        FROM film
        WHERE
            film.length >= 120
    ) f ON f.film_id = fa.film_id
GROUP BY fa.actor_id
ORDER BY numberOfFilms DESC

SELECT count(actorName) FROM Actor_120Films