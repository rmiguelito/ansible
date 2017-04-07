embed-host-controller --domain-config=domain.xml
batch
module add --name=org.postgresql --resources=/tmp/postgresql-9.4.1209.jre7.jar --dependencies=javax.api,javax.transaction.api
/profile=default/subsystem=datasources/jdbc-driver=postgresql:add(driver-name=postgresql,driver-module-name=org.postgresql,driver-xa-datasource-class-name=org.postgresql.xa.PGXADataSource)
module add --name=com.oracle --resources=/tmp/ojdbc7.jar --dependencies=javax.api,javax.transaction.api
/profile=default/subsystem=datasources/jdbc-driver=oracle:add(driver-name=oracle,driver-module-name=com.oracle,driver-xa-datasource-class-name=oracle.jdbc.xa.client.OracleXADataSource)
/profile=default/subsystem=undertow/server=default-server/ajp-listener=ajp:add(socket-binding=ajp,scheme=http,enabled=true)
run-batch
