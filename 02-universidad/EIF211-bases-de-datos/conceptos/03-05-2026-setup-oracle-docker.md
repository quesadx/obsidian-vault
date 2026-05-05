---
Fecha: 03-05-2026
moc: "[[moc-bases-de-datos]]"
---
# Oracle Free Docker Setup

## 1. Connect to Oracle inside Docker

```bash
docker exec -it oracle_una sqlplus sys/1234@FREEPDB1 as sysdba
```

---

## 2. Create User

```sql
create user una identified by "una";
```

---

## 3. Grant Basic Privileges

```sql
grant create session to una;
grant create table to una;
grant create sequence to una;
grant create procedure to una;
```

---

## 4. Allow Storage in Default USERS Tablespace

```sql
alter user una quota unlimited on users;
```

---

## 5. Create Custom Tablespace

```sql
create tablespace una_ts
datafile '/opt/oracle/oradata/FREE/una_ts.dbf'
size 100M
autoextend on next 10M
maxsize 1G;
```

---

## 6. Assign Custom Tablespace to User

```sql
alter user una default tablespace una_ts;
```

---

## 7. Grant Quota on Custom Tablespace

```sql
alter user una quota unlimited on una_ts;
```

---

## 8. Verify Default Tablespace

```sql
select username, default_tablespace
from dba_users
where username = 'UNA';
```

### Output

```text
USERNAME    DEFAULT_TABLESPACE
--------    ------------------
UNA         UNA_TS
```

---

## 9. Test as User

Connect:

```bash
docker exec -it oracle_una sqlplus una/una@FREEPDB1
```

Create test table:

```sql
create table prueba (
    id number primary key,
    nombre varchar2(50)
);
```

Verify storage location:

```sql
select table_name, tablespace_name
from user_tables;
```

Expected:

```text
PRUEBA    UNA_TS
```

---

## Final Result

Configured Oracle Free in Docker with:

- User `UNA`
- Required privileges
- Custom tablespace `UNA_TS`
- User assigned to custom tablespace
- Verified object storage inside assigned tablespace



