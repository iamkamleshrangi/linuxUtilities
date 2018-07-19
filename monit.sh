# Setting file for monit
check process mongos
  with pidfile /data_storages/data/mongod.lock
  start program = "/bin/bash -c 'sudo mongos --logpath /data_storages/log/mongod.log --keyFile /data_storages/keys/sharding_access --pidfilepath /data_storages/data/mongod.lock --bind_ip 0.0.0.0 --configdb ConfigServer/172.30.0.30:57040,172.30.0.183:57041,172.30.0.149:57042'"
  stop program = "/bin/bash -c 'while read line
  do
  echo $line
  sudo kill -9 $line
  done < /data_storages/data/mongod.lock'"
  if totalmem > 29000 MB for 5 cycles then restart

# Template 

set mailserver smtp.gmail.com port 587 username "abc@gmail.com" password "abc@123" using tlsv1 with timeout 30 seconds
set alert abc@kamlesh.com
set alert kamlesh@kamlesh.com

set mail-format {
   from:    monit@$HOST
   subject: ServerName -- $EVENT $SERVICE
   message: $EVENT Service $SERVICE
                 Date:        $DATE
                 Action:      $ACTION
                 Host:        $HOST
                 Description: $DESCRIPTION
                 Type: Production
                 

            Your faithful employee,
            Production Server
 }
