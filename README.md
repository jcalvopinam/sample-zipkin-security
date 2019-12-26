# Getting Started

### Info
This library adds Basic Authentication to an existing Zipkin server

#### This configuration works with the following versions: 
```
spring boot starter: 2.1.1.RELEASE
spring security: 5.1.2.RELEASE
zipkin server: 2.12.0
```

### How to run?
Open git terminal and clone the repository with following command:
```
git clone https://github.com/juanca87/sample-zipkin-security.git
```
Launch zipkin server:
```
./start-zipkin-server.sh
```
That will start zipkin server with default credentials:
```
USER: zipkin
PASS: pipkin
```

To start zipkin with custom credentials:
```
./start-zipkin-server.sh <user> <pass>
```
For instance:
```
./start-zipkin-server.sh juan 123
```

When it finishes loading the zipkin server, it will launch the zipkin UI
```
http://localhost:9411
```

And it will be asking for credentials

* [Reference Guide](https://github.com/openzipkin/zipkin/issues/782#issuecomment-433306013)

