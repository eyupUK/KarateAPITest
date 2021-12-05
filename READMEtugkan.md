# API Automation Framework:

## Description:

This framework uses powerful opensource apis like Selenium,Rest Assured,Karate,etc to automate API calls and give us report and logs.

## Pre-requisites

* [Maven 3.8+](https://maven.apache.org/download.cgi)
* [Java 1.8+](https://www.oracle.com/java/technologies/javase-jdk15-downloads.html)
* IDE - [Preferably IntelliJ IDEA](https://www.jetbrains.com/idea/download/#section=mac)


### Libraries

This framework contains the below core features/libraries:

* [Karate](https://github.com/karatelabs/karate)
* [RestAssured](https://rest-assured.io/)
* [karate-junit4](https://github.com/karatelabs/karate/tree/master/karate-junit4)
* [java faker](https://github.com/DiUS/java-faker)
* [Jackson-core](https://github.com/FasterXML/jackson-core)
* [JSON Schema Validator](	https://github.com/box-metadata/json-schema-validator)
* [cucumber-reporting](https://github.com/damianszczepanik/cucumber-reporting)

## Setup:
1. Ensure your target machine has all prerequisites listed in this README file.
2. Clone this repository.


## Features

This framework implements a simple approach to make API calls and return a response Object.
The BDD syntax popularized by Cucumber is language-neutral, and easy for even non-programmers. 
Assertions and HTML reports are built-in, and you can run tests in parallel for speed.
There's also a cross-platform stand-alone executable for teams not comfortable with Java. 
You don't have to compile code. Just write tests in a simple, readable syntax - carefully designed for HTTP, JSON, GraphQL and XML. 
And you can mix API and UI test-automation within the same test script.



## For API Testing ->

[![image.png](https://github.com/karatelabs/karate/raw/master/karate-demo/src/test/resources/karate-hello-world.jpg)](https://github.com/karatelabs/karate/raw/master/karate-demo/src/test/resources/karate-hello-world.jpg)
```
If you are familiar with Cucumber / Gherkin, the big difference here is that you don't need to write extra "glue" code or Java "step definitions" !
```
It is worth pointing out that JSON is a 'first class citizen' of the syntax such that you can express payload and expected data without having to use double-quotes and without having to enclose JSON field names in quotes. There is no need to 'escape' characters like you would have had to in Java or other programming languages.


### 



## Sample Tests:

Sample tests can be found in the below classes:

* AddGame


## Reporting:

* Karate generates a json file containing the test output which can be used to generate a report using any reporting library. 

* Cucumber html reports are generated in /cucumber-html-reports/. 
  Also Surefire reports are generated in /surefire-reports/karate-summary/
  *(Cucumber html reports only available with parallel testing)
## Docker run
We can run the test with `docker image` 

```bash
> docker build --rm -t sbgtest .
```

When it finishes, you will get the images:
```bash
> docker images
REPOSITORY                         TAG                 IMAGE ID            CREATED             
sbgtest                           latest              351893694953        About an hour ago    
ngr05/sbg-gaming-seit-tech-test   latest              d9c48619f8aa        15 months ago        
```

To run the tests with the image:
```bash
> docker run --rm -v $PWD:/sbgtest sbgtest bash -c "mvn clean test"
```

## Framework Structure:

**src\main\java\framework**

This directory should contain all core classes responsible for pulling data from Making API calls, performing assertions , reporting etc.

**src\main\java\{packageName}**

This directory should contain all page classes with functions related to test cases which will be called by test classes.

**src\test\java\{test packages\test classes}**

This directory should contain all test classes with test functions which will consume functions written in page classes and add assertions if needed.

##Some important classes/files and their role ->

**Data**

This class should be used to execute any common setup and tear down steps for all tests within the project.All test classes should extent this class either directly of indirectly.

**GameGenerator**

This class is responsible to provide game object while creating new game with api call

**JSONSchemaValidation**

This class is responsible to validate given api call with relevant schema 

**Utilities**

This class is responsible to hold any common reusable functions 

**PropertiesLoader**

This class is responsible for reading the contents of the **config.properties** file in the repository and storing the read data into the Properties object.

**Pom.xml**

The pom.xml file found in the project contains all the dependencies that are required to compile the project. 



**configuration.properties**

The properties file is used for storage of configuration data, for example environment data values.

To create a new property, create the property and provide a value for the property in the configuration.properties file, then create a corresponding variable in the PropertiesConfiguration object for the new property. A getter method will be generated by the ConfigurationReader.


## Troubleshooting:

1. Ensure the maven-compiler-plugin has been installed within the IntelliJ IDEA IDE to compile the source code of a Maven project.
```
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
                <configuration>
                    <encoding>UTF-8</encoding>
                    <source>1.8</source>
                    <target>1.8</target>
                    <compilerArgument>-Werror</compilerArgument>
                </configuration>
            </plugin>
   ```
2. Ensure maven-surefire-plugin has been installed within the IntelliJ IDEA IDE to execute the unit tests of an application.
```
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
                <configuration>
                    <encoding>UTF-8</encoding>
                    <source>1.8</source>
                    <target>1.8</target>
                    <compilerArgument>-Werror</compilerArgument>
                </configuration>
            </plugin>
```
3. If a dependency has been added and is not available on the local/target machine, the project can be built using the "clean" Maven task or by running the following commands from a terminal:

Command:
```
mvn clean
```

## Running test cases command:

### To run APItest grouped test methods
```
mvn test -Dcucumber.options="--tags '@APItest'"
```
### To run all test methods
```
mvn clean test
```
### To run parallel testing
```
mvn test -Dtest=ParallelRunner
```

## Accessing Reports and Logs:
###Cucumber html reports
Go to cucumber-html-reports -> Right click html file and open with any browser. By default all logs will surely come into extent report.*(Only available with parallel testing)
###Surefire reports
Go to surfire-html -> Right click html file and open with any browser. By default all logs will surely come into extent report.
###Logs
Go to logs -> Right click and open html log with any browser. or double click D360.log file to see logs.

