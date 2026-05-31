# Prisma/MySQL Naming Migration Plan

This guide assumes:
- you want clean, consistent table and column names
- you must keep existing data
- you can test in `docker-compose-dev`
- you have a `.sql` backup from production

## Goal

Move from the current inconsistent schema to a clean new schema without losing data.

## Recommended strategy

Do **not** rewrite the backup with search-and-replace.
Instead:
1. restore the old backup into a temporary database
2. create the new schema in a fresh empty database
3. copy data from old tables into new tables with a one-time migration script
4. verify everything in dev/staging
5. repeat the same process on production

## Step by step

### 1. Freeze the current schema

Stop changing the schema until the migration is complete.
Make a list of every rename you want:
- table names
- column names
- enum names and values
- relation tables
- index and foreign key names

Keep this list as the source of truth.

### 2. Take a full backup

Export the current production database to `.sql`.
Keep this file unchanged.
This is your rollback point.

### 3. Create a staging copy

Use `docker-compose-dev` and a second MySQL database.

Flow:
1. start the dev stack
2. create an empty staging DB
3. import the production backup into a temporary source DB
4. point the app to the staging DB

This lets you test the migration without touching production.

### 4. Design the new schema first

Edit `prisma/schema.prisma` to the final names you want.

Use one naming convention everywhere, usually:
- tables: `snake_case`, plural
- columns: `snake_case`
- enums: consistent lowercase or PascalCase, but pick one style

Also fix typos now:
- `SistemLog` -> `system_logs`
- `actionTipe` -> `action_type`
- `proffesor_suplent` -> `professor_supplement`
- mixed `camelCase`, `snake_case`, and bad spelling should all be normalized

### 5. Decide how data will move

Use one of these two options:

#### Option A: SQL rename migration

Best when you want the same physical tables, just with better names.

Use:
- `RENAME TABLE`
- `ALTER TABLE ... RENAME COLUMN`

This is good if the data model stays mostly the same.

#### Option B: copy-into-new-schema migration

Best when names, types, or structure are messy enough that a clean rebuild is easier.

Use a script to:
1. read old rows
2. transform field names and values
3. insert into new tables

This is usually safer for a big cleanup like yours.

### 6. Create the new schema in a fresh database

In dev/staging:
1. create an empty database
2. run the new Prisma migration there
3. confirm the new tables exist exactly as intended

Do not apply this directly to production yet.

### 7. Write the one-time migration script

The script should:
- read from the old DB
- map old table names to new table names
- map old column names to new column names
- fix enum values if needed
- preserve IDs and relations
- insert rows in dependency order

Recommended order:
1. lookup tables / enums
2. parent tables
3. child tables
4. join tables
5. relation-dependent tables

### 8. Migrate in a fresh dev database

Run the script against the staging DB.

Then verify:
- row counts match
- foreign keys resolve
- important records still exist
- timestamps and enums look correct
- the app can start and query data

### 9. Fix schema mismatches before production

If something fails in staging:
- update the migration script
- update the Prisma schema
- rerun the staging database from scratch

Do not patch production first.

### 10. Repeat the same process on production

When staging is clean:
1. take a fresh production backup
2. create the new empty production schema
3. run the same migration script
4. validate the live app

### 11. Keep the old backup

Do not delete the old `.sql` backup.
Keep it until you have used the new system in production safely.

## What not to do

- do not run `prisma migrate reset` on production
- do not edit old applied migrations
- do not use blind global find-and-replace on the SQL dump
- do not rename only in Prisma while leaving the database messy if you want clean DB names

## Practical recommendation for your case

Because your names are inconsistent in many ways, the best path is:

1. clean the Prisma schema
2. create a fresh new database schema
3. migrate data with a script
4. test in `docker-compose-dev`
5. apply the same process to production

That gives you the cleanest final result with the least risk.
