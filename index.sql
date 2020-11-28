# Without index
DROP INDEX Idx on Review;

# With index
CREATE INDEX Idx on Review (Stars);


EXPLAIN
SELECT *
FROM Review
WHERE Stars = 5;
