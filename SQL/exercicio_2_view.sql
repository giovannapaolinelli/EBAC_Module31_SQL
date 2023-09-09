CREATE VIEW Actor_Films as
SELECT
    concat( actor.first_name, ' ', actor.last_name),
    fa.filmNumber as numberOfFilms
FROM actor
    INNER JOIN (
        SELECT
            count(film_actor.film_id) as filmNumber,
            film_actor.actor_id
        FROM film_actor
        GROUP BY
            film_actor.actor_id
    ) fa ON fa.actor_id = actor.actor_id
ORDER BY numberOfFilms DESC

SELECT count(numberOfFilms) FROM Actor_Films