library(rJava)
# Load RJDBC library
library(RJDBC)


# Create connection driver and open connection
jdbcDriver <- JDBC(driverClass="oracle.jdbc.OracleDriver", classPath="/scripts/ojdbc6.jar")
jdbcConnection <- dbConnect(jdbcDriver, "jdbc:oracle:thin:@//<host>:<port>/<service>", "<username>", "<password>")

# Query on the Oracle instance name.
instanceName <- dbGetQuery(jdbcConnection, "SELECT * FROM OSB_CHERWELL_JSON_DATA")
print(instanceName)

# Close connection
dbDisconnect(jdbcConnection)
