### SLAVE DATABASE

1. Copy file from docker back to local machine

```
docker cp [container_id]:/etc/my.cnf ./mysql/master
```

2. Change command network

```
docker network ls
docker inspect mysql8-master
```

172.20.0.2 -> master

- Copy this copy & paste to slave db

  CHANGE MASTER TO
  MASTER_HOST='172.20.0.2',
  MASTER_PORT=3306,
  MASTER_USER='root',
  MASTER_PASSWORD='abcd1234',
  master_log_file='mysql-bin.000005',
  master_log_pos=157,
  master_connect_retry=60,
  GET_MASTER_PUBLIC_KEY=1;

3. Start slave

```
start slave;
show slave status\G;
```

4. Start replica

```
start replica;
show replica status\G;
```

---

### MASTER DATABASE

```sql
create database test default charset utf8mb4;

create table user (
  id int auto_increment primary key,
  username varchar(255) not null
)
```
