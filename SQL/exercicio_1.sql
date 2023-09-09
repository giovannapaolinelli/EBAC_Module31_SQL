SELECT
    f.title, 
    category.name
FROM film f
    INNER JOIN (
        SELECT
            film_category.film_id,
            film_category.category_id
        FROM film_category ) fc ON f.film_id = fc.film_id 
        LEFT JOIN category ON category.category_id = fc.category_id