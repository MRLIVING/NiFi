# NiFi

## Installation 
### Prerequisite
* Open JDK 1.8.0 or above

### [Download](https://nifi.apache.org/download.html)
* [release archives](https://archive.apache.org/dist/nifi/) are available for [wget](https://www.digitalocean.com/community/tutorials/how-to-use-wget-to-download-files-and-interact-with-rest-apis)


## Pop commands

### [Start up](https://nifi.apache.org/docs/nifi-docs/html/getting-started.html#for-linuxmacos-users)
`./nifi.sh start`

### [Change the Username/Password for Single User login](https://nifi.apache.org/docs/nifi-docs/html/administration-guide.html#single_user_identity_provider)
`./nifi.sh set-single-user-credentials ${user} ${passwd}`

## [Terminology](https://nifi.apache.org/docs/nifi-docs/html/user-guide.html#terminology)
* [FlowFile](https://nifi.apache.org/docs/nifi-docs/html/user-guide.html#terminology)
* [Processor](https://nifi.apache.org/docs/nifi-docs/html/getting-started.html#what-processors-are-available) 
* [Controller Service](https://nifi.apache.org/docs/nifi-docs/html/user-guide.html#Controller_Services)  
  * [DBCPConnectionPool](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-dbcp-service-nar/1.17.0/org.apache.nifi.dbcp.DBCPConnectionPool/index.html)
  * [GCPCredentialsControllerService](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi/nifi-gcp-nar/1.17.0/org.apache.nifi.processors.gcp.credentials.service.GCPCredentialsControllerService/index.html)
* [Templates](https://nifi.apache.org/docs.html)

### GCPCredentialsControllerService
TODO...

## TODO ...
* Jolt  
* Schedule run

## Reference
* [Transformer - Getting to know JOLT](https://intercom.help/godigibee/en/articles/4044359-transformer-getting-to-know-jolt)
* [Nifi - Using Jolt Transform Json to prepare your Big Data](https://www.youtube.com/watch?v=yEE7Tgc4bh8)
* [Optimized ETL's with QueryDatabaseTable and PutDatabaseRecord](https://www.youtube.com/watch?v=9X8DJGXMra4)




