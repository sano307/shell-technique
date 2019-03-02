INSERT INTO materials_tmp (
  name, description, quantity, created_at, updated_at
)
SELECT
  name, description, quantity, created_at, updated_at
FROM
  materials
WHERE
  created_at BETWEEN '&START_DATE' AND '&END_DATE'
