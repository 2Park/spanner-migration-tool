# Autopay fork of spanner-migration-tool

This is the Autopay fork of the spanner-migration-tool repository. It contains some necessary changes/fixes for our needs.
For a list of changes that have been made see the commits in the following PRs:

* https://github.com/2Park/spanner-migration-tool/pull/1

If all these issues are resolved upstream, it is a stated goal to delete this fork and use the upstream version instead.

To build the binary locally, follow these steps, adapted from the "Documentation" section of the normal README:

* You need Go 1.24.10 installed and available in path.
* Normal C build dependencies should be available as well: gcc, g++
* Run:

```bash
  go build -o spanner-migration-tool
```

# Import
The tables MUST be setup prior to running the import tool. Either by running liquibase or using the "Copy DDL" button from an equivalent database.

The ./run-import script shows one way to batch import tables. The spanner-migration-tool can also be run manually on individual tables (again, see run-import.sh for example use).

Normal README to follow:

# Spanner migration tool: Spanner Evaluation and Migration

[![integration-tests-against-emulator](https://github.com/GoogleCloudPlatform/spanner-migration-tool/actions/workflows/integration-tests-against-emulator.yaml/badge.svg)](https://github.com/GoogleCloudPlatform/spanner-migration-tool/actions/workflows/integration-tests-against-emulator.yaml) [![code-coverage-check](https://github.com/GoogleCloudPlatform/spanner-migration-tool/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/GoogleCloudPlatform/spanner-migration-tool/actions/workflows/test-coverage.yaml) [![codecov](https://codecov.io/gh/GoogleCloudPlatform/spanner-migration-tool/graph/badge.svg?token=HY9RCUlxzm)](https://codecov.io/gh/GoogleCloudPlatform/spanner-migration-tool)


> [!IMPORTANT]
> We have changed architecture of the minimal downtime migration and added Pub/Sub notifications component. There are some changes in required permissions because of the new component. Please go through [Permissions page](https://googlecloudplatform.github.io/spanner-migration-tool/permissions.html) and [design page](https://googlecloudplatform.github.io/spanner-migration-tool/minimal) of the documentation.


## Overview

Spanner migration tool is a stand-alone open source tool for Cloud Spanner evaluation and
migration, using data from an existing PostgreSQL, MySQL, SQL Server, Oracle or DynamoDB database.
The tool ingests schema and data from either a pg_dump/mysqldump file or directly
from the source database, and supports both schema and data migration. For schema
migration, Spanner migration tool automatically builds a Spanner schema from the schema
of the source database. This schema can be customized using the Spanner migration tool schema assistant and
a new Spanner database is created using the Spanner schema built.

## Installation

Installation instructions for Spanner migration tool are available [here](https://googlecloudplatform.github.io/spanner-migration-tool/install.html#installing-spanner-migration-tool).

## Documentation

Detailed documentation on how to use spanner-migration-tool is available at: <https://googlecloudplatform.github.io/spanner-migration-tool>
