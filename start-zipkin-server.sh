#!/bin/bash
# author Juan Calvopina

clear

printf "\n===================================================================================================="
printf "\n#################################                                   ################################"
printf "\n################################# ZIPKIN SERVER WITH BASIC SECURITY ################################"
printf "\n#################################                                   ################################"
printf "\n====================================================================================================\n"

printf "\n### Looking for credentials..."
printf "======================================================================\n"

ZUSER=zipkin
ZPASS=pipkin

if [ -z $1 ] || [ -z $2 ]
then
    echo '#### no complete arguments supplied. Applying custom credentials: [USER:'$ZUSER ' PASS:'$ZPASS ']'
else
    ZUSER=$1
    ZPASS=$2
    echo 'Applying custom credentials: [USER:'$ZUSER ' PASS:'$ZPASS ']' 
fi

function f_compile_security_module() {
    printf "\n### Compiling security module..."
    printf "====================================================================\n"

    rm -rf exec
    mkdir exec

    cd zipkin-security-module
    ./mvnw clean package -q
    cp -r target/sample-zipkin-security-module.jar ../exec/security.jar
    cd ..
    echo '#### finished...'
}

function f_download_zipkin() {
    printf "\n### Downloading zipkin server 2.12.0:"
    printf "===============================================================\n"
    
    cd exec
    curl -s https://repo1.maven.org/maven2/io/zipkin/java/zipkin-server/2.12.0/zipkin-server-2.12.0-exec.jar --output ./zipkin.jar
    echo '#### downloaded...'
}

function f_run_zipkin_security() {
    printf "\n### Starting zipkin..."
    printf "======================================================================\n"
    java -Dloader.path='security.jar,security.jar!/lib' -cp zipkin.jar  org.springframework.boot.loader.PropertiesLauncher --spring.security.user.name=$ZUSER --spring.security.user.password=$ZPASS &
    start http://localhost:9411/
}

f_compile_security_module
f_download_zipkin
f_run_zipkin_security
