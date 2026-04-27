---
name: data-sample
description: Fetch small, safe Databricks dataset extracts for model design and implementation handoffs
compatibility: opencode
metadata:
  domain: machine-learning
  datasource: databricks
  safety: select-only-sql
---

## What I do

Use this skill when a user names one or more Databricks datasets and wants a small representative extract for ML design or implementation.

The goal is to produce a compact, safe sample that helps with:
- understanding schema and feature types
- identifying likely target columns and join keys
- spotting missing values, cardinality issues, and timestamp fields
- giving `data-scientist` and `ml-engineer` enough context to choose and implement the model

## Preferred tools and order

Prefer the Databricks CLI.

Use these approaches in order:

1. `databricks tables get ...`
2. `databricks api post /api/2.0/sql/statements ...` only when SQL is necessary

Prefer direct table metadata access first. Use SQL only when you need a controlled row sample, limited profiling query, or a simple join preview.

## Security rules

If you use `databricks api post /api/2.0/sql/statements`, the SQL must be read-only and must be a `SELECT` statement.

Hard requirements:
- Only execute a single `SELECT` statement
- Reject anything that is not clearly `SELECT`
- Do not run `INSERT`, `UPDATE`, `DELETE`, `MERGE`, `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, `COPY`, `GRANT`, `REVOKE`, `USE`, or multiple statements
- Do not allow semicolon-separated statements
- Do not use SQL comments that could hide extra commands
- Prefer parameterized queries where possible
- Always keep result size small with `LIMIT` or `row_limit`

Before running SQL:
- Normalize leading whitespace
- Verify the statement begins with `SELECT` after normalization
- Refuse the query if it contains `;`, `--`, or `/*`
- Refuse the query if it is not obviously read-only

If there is any doubt, do not run the SQL. Ask the user for a safer, narrower query shape or fall back to metadata-only inspection.

## Sampling rules

Keep extracts intentionally small.

Default targets:
- 20 to 100 rows for a preview
- only the columns needed to understand the dataset
- one small sample per dataset unless more is justified

Prefer:
- schema inspection first
- then a small row sample
- then a very small aggregate query if needed to understand nulls, class balance, or value ranges

Avoid heavy scans or broad `SELECT *` queries on very wide tables unless the table is already known to be small.

## Workflow

1. Identify each dataset the user wants to use.
2. Determine whether metadata alone is enough.
3. If rows are needed, fetch a small extract safely through the Databricks CLI.
4. Summarize what matters for modeling.
5. Preserve enough raw sample detail for `ml-engineer` to inspect.

## Expected output

Return a structured summary with:
- Dataset names
- Access method used
- Row count sampled and any limits applied
- Key columns
- Likely target column if known
- Likely join keys if multiple datasets are involved
- Important feature types
- Missing-value or quality concerns
- A compact raw extract or excerpt
- Notes for `data-scientist` or `ml-engineer`

## SQL patterns

Safe row sample pattern:

```sql
SELECT col1, col2, col3
FROM catalog.schema.table
LIMIT 50
```

Safe lightweight profiling pattern:

```sql
SELECT
  COUNT(*) AS n_rows,
  COUNT(target) AS n_target_non_null
FROM catalog.schema.table
```

Safe join preview pattern:

```sql
SELECT a.id, a.feature_1, b.feature_2, b.target
FROM catalog.schema.dataset_a AS a
JOIN catalog.schema.dataset_b AS b
  ON a.id = b.id
LIMIT 50
```

## Do not do this

- Do not fetch large extracts
- Do not expose tokens, credentials, or presigned URLs
- Do not use external result links unless there is a clear need
- Do not include authorization headers when downloading external links
- Do not assume the target column if the user has not provided enough context

## When to ask questions

Ask a short clarifying question if any of these are missing:
- dataset identifiers or table names
- catalog or schema
- join relationship between datasets
- target definition
- Databricks profile or warehouse context when SQL execution requires it

If enough information is present, proceed directly.
