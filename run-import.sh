#!/usr/bin/env zsh

tables=(
    #table1
    #table2
)

PROJECT="PROJECT_ID"
INSTANCE="INSTANCE_ID"
DATABASE="DATABASE_ID"
                                                                             #instance-database
BUCKET_BASE_URI="gs://{PROJECT_ID}-backup-{SCHEDULE}-spanner/backups/{DATE}/{INSTANCE_ID}-{DATABASE_ID}"

for table in "${tables[@]}"; do
    echo "Processing table: $table"

    ./spanner-migration-tool import \
        -project "$PROJECT" \
        -instance "$INSTANCE" \
        -database "$DATABASE" \
        -source-format="csv" \
        -source-uri="${BUCKET_BASE_URI}-${table}-00000-of-00001.csv" \
        -schema-uri="${BUCKET_BASE_URI}-${table}_SCHEMA.json" \
        -table-name="$table" \
        -log-level DEBUG

    if [ $? -eq 0 ]; then
        echo "Successfully imported $table"
    else
        echo "Failed to import $table"
    fi
    echo "---"
done
