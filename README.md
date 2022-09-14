# TOC
* [Installation](#installation)
* [Concept and Terminology](#concept-and-terminology)
* [Reference](#reference)


# [NiFi](https://nifi.apache.org/)

## Installation 
### Prerequisite
* Open JDK 1.8.0 or above

### [Download](https://nifi.apache.org/download.html)
* [release archives](https://archive.apache.org/dist/nifi/) are available for [wget](https://www.digitalocean.com/community/tutorials/how-to-use-wget-to-download-files-and-interact-with-rest-apis)

### Pop commands
* list options  
`nifi.sh`

* [Start up Nifi](https://nifi.apache.org/docs/nifi-docs/html/getting-started.html#for-linuxmacos-users), web user interface >> `https://${HOST}:8443/nifi/`
  * `nifi.sh start`, to run NiFi in the background
  * `nifi.sh run`, to run NiFi in the foreground
  * `nifi.sh install ${service name}`, [installing as a Service](https://nifi.apache.org/docs/nifi-docs/html/getting-started.html#installing-as-a-service)

* [Change the Username/Password for Single User login](https://nifi.apache.org/docs/nifi-docs/html/administration-guide.html#single_user_identity_provider)  
`./nifi.sh set-single-user-credentials ${user} ${passwd}`

### Folders
* bin/, nifi command script 

* [logs/](https://www.tutorialspoint.com/apache_nifi/apache_nifi_logging.htm)

* conf/, [nifi.properties](https://nifi.apache.org/docs/nifi-docs/html/administration-guide.html#nifi)

* lib/, lib directory that stores the common package and customized require drivers 

### Drivers and BigQuery Credential
* [Microsoft JDBC Driver for SQL Server](https://docs.microsoft.com/en-us/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server?view=sql-server-ver16)
* [MySQL Connector](https://dev.mysql.com/downloads/connector/j/)
* [JDBC drivers for BigQuery](https://cloud.google.com/bigquery/docs/reference/odbc-jdbc-drivers)
* [GCP service account for Nifi](https://console.cloud.google.com/iam-admin/serviceaccounts?project=czechrepublic-290206&supportedpurview=project)
  * [credential key](https://console.cloud.google.com/iam-admin/serviceaccounts/details/106493155598502974057/keys?project=czechrepublic-290206&supportedpurview=project)
  * [IAM](https://console.cloud.google.com/iam-admin/iam?project=czechrepublic-290206&supportedpurview=project)

### [Authentication](https://nifi.apache.org/docs/nifi-docs/html/administration-guide.html#user_authentication)
* [OpenId Connect](https://nifi.apache.org/docs/nifi-docs/html/administration-guide.html#openid_connect)
TODO ...


## Concept and [Terminology](https://nifi.apache.org/docs/nifi-docs/html/user-guide.html#terminology)
* [FlowFile](https://nifi.apache.org/docs/nifi-docs/html/user-guide.html#terminology)
* [Processor](https://nifi.apache.org/docs/nifi-docs/html/getting-started.html#what-processors-are-available) 
  * pipeline - SQL Server to MySQL
    * [ExecuteSQL](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.17.0/org.apache.nifi.processors.standard.ExecuteSQL/index.html)
    * [ConvertAvroToJSON](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-avro-nar/1.17.0/org.apache.nifi.processors.avro.ConvertAvroToJSON/index.html)
    * [ConvertJSONToSQL](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.17.0/org.apache.nifi.processors.standard.ConvertJSONToSQL/index.html)
    * [PutSQL](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.17.0/org.apache.nifi.processors.standard.PutSQL/index.html)

  * pipeline - SQL Server to BigQuery  
    <img src="https://user-images.githubusercontent.com/3777869/188355669-9a061a61-55c5-4bfb-8474-77de62da5d14.png" height="36" width="48">
    * [ExecuteSQL](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.17.0/org.apache.nifi.processors.standard.ExecuteSQL/index.html)  
      <img src="https://user-images.githubusercontent.com/3777869/188353444-316b6e0e-a8b2-40fd-8016-e54ac3bd332f.png" height="36" width="48">
      <img src="https://user-images.githubusercontent.com/3777869/188353686-a538d0ec-4309-473f-8a38-3fee9a11bf8b.png" height="36" width="48">
    * [PutBigQueryStreaming](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-gcp-nar/1.15.3/org.apache.nifi.processors.gcp.bigquery.PutBigQueryStreaming/index.html)  
      <img src="https://user-images.githubusercontent.com/3777869/188356088-984f6708-61be-46c7-a8f0-02bea434eb59.png" height="36" width="48">
      <img src="https://user-images.githubusercontent.com/3777869/188355858-6fdb8f52-35a7-4b29-ba59-4a48799a83bb.png" height="36" width="48">

  * pipline - 
    * [ExecuteSQL](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.17.0/org.apache.nifi.processors.standard.ExecuteSQL/index.html)
    * [QueryRecord](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.6.0/org.apache.nifi.processors.standard.QueryRecord/index.html)
    * [UpdateRecord](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.17.0/org.apache.nifi.processors.standard.UpdateRecord/index.html)
      * [Nifi RecordPath](https://nifi.apache.org/docs/nifi-docs/html/record-path-guide.html)
      * [NiFi Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html)
      
  * pipline - tt_JOLT
    * [GenerateFlowFile](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.11.4/org.apache.nifi.processors.standard.GenerateFlowFile/index.html)
    * [JoltTransformJSON](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-standard-nar/1.17.0/org.apache.nifi.processors.standard.JoltTransformJSON/index.html)
      * [Jolt Transform Demo](https://jolt-demo.appspot.com/#inception)
      * [Getting to know JOLT](https://intercom.help/godigibee/en/articles/4044359-transformer-getting-to-know-jolt) 
      
  * Processor Configuration
    * [Scheduling Tab](https://nifi.apache.org/docs/nifi-docs/html/user-guide.html#scheduling-tab)  
* [Controller Service](https://nifi.apache.org/docs/nifi-docs/html/user-guide.html#Controller_Services)  
  <img src="https://user-images.githubusercontent.com/3777869/190074417-b5005ec4-51d8-4de9-b878-9a8809ef6977.png" height="36" width="48">
  <img src="https://user-images.githubusercontent.com/3777869/190075853-b17c3ad5-e070-4f6c-906b-8e8834a666b2.png" height="36" width="48">

  * [DBCPConnectionPool](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-dbcp-service-nar/1.17.0/org.apache.nifi.dbcp.DBCPConnectionPool/index.html), MSSQL
    <img src="https://user-images.githubusercontent.com/3777869/190076558-6e0ca142-7455-45e0-8ef8-7cff53c20912.png" height="36" width="48">
    <img src="https://user-images.githubusercontent.com/3777869/190076990-1a84ac0f-2716-421f-b0fa-07270b02006c.png" height="36" width="48">
  
  * [DBCPConnectionPool](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-dbcp-service-nar/1.17.0/org.apache.nifi.dbcp.DBCPConnectionPool/index.html), MySQL  
    <img src="https://user-images.githubusercontent.com/3777869/190081641-52960811-2272-47bc-a4ec-b0355ec5dbd6.png" height="36" width="48">
    <img src="https://user-images.githubusercontent.com/3777869/190081032-b76fa0e9-09e5-4632-b649-a6fe888924e2.png" height="36" width="48">
  
  * [GCPCredentialsControllerService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-gcp-nar/1.17.0/org.apache.nifi.processors.gcp.credentials.service.GCPCredentialsControllerService/index.html)  
    <img src="https://user-images.githubusercontent.com/3777869/190077834-a4687e0e-2f88-4038-9bd7-4d511af2fbba.png" height="36" width="48">
    <img src="https://user-images.githubusercontent.com/3777869/190078125-0cfdc1dd-df61-4d18-8f39-40f241f453ca.png" height="36" width="48">    
  
* [Templates](https://nifi.apache.org/docs.html)



## Reference
* [Transformer - Getting to know JOLT](https://intercom.help/godigibee/en/articles/4044359-transformer-getting-to-know-jolt)
* [Nifi - Using Jolt Transform Json to prepare your Big Data](https://www.youtube.com/watch?v=yEE7Tgc4bh8)
* [Optimized ETL's with QueryDatabaseTable and PutDatabaseRecord](https://www.youtube.com/watch?v=9X8DJGXMra4)
* [Apache NiFi - 讓你輕鬆設計 Data Pipeline 系列](https://ithelp.ithome.com.tw/users/20140257/ironman/4025)



