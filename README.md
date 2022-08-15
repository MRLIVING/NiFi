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
* [Templates](https://nifi.apache.org/docs.html)
