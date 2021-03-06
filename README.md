# unified star schema in dbt
This is a demo project building out a a unified star schema in dbt

# References
All the work for setting up the DBT from https://www.startdataengineering.com/post/
All the work for the unified star schema comes from Francesco Puppini
I have simply joined these two projects together.


# Replicating the DBT part

This is the code repo for dbt tutorial at https://www.startdataengineering.com/post/
dbt-data-build-tool-tutorial

### Prerequisites

1. [Docker](https://docs.docker.com/get-docker/) and [Docker compose](https://docs.docker.com/compose/install/)
2. [dbt](https://docs.getdbt.com/dbt-cli/installation/)
2.1 [dbt_utils](https://hub.getdbt.com/dbt-labs/dbt_utils/latest/)
3. [pgcli](https://www.pgcli.com/install)
4. [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

Clone the git repo and start the data warehouse docker container

```bash
git clone https://github.com/josephmachado/simple_dbt_project.git
docker compose up -d
```

## Run dbt 

```bash
export DBT_PROFILES_DIR=$(pwd)
cd uss_dbt_tutorial
dbt run
dbt test
dbt docs generate
dbt docs serve
```

Insert updates into source customer table, to demonstrate snapshot

```bash
pgcli -h localhost -U dbt -p 5432 -d dbt
# password is password1234
COPY warehouse.customers(customer_id, zipcode, city, state_code, datetime_created, datetime_updated) FROM '/input_data/customer_new.csv' DELIMITER ',' CSV HEADER;
\q
```

Run snapshot and create models again.

```
dbt snapshot
dbt run
```

You can log into the data warehouse to see the models.

```bash
pgcli -h localhost -U dbt -p 5432 -d dbt
# password is password1234
select * from warehouse.customer_orders limit 3;
\q
```

## Stop docker container

```bash
cd ..
docker compose down
```