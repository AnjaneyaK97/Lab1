FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY . /app
RUN javac Hello.java
CMD ["java","Hello"]






























1st prgm

FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY . /app
RUN javac Hello.java
CMD ["java","Hello"]

public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}

docker build -t  image-name .
docker run image-name

2nd prgm 

pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'Docker-credentials'
        IMAGE_NAME = 'poorvipurvi/new_docker_image'
    }

    stages {

        stage('Build Java Application') {
            steps {
                bat 'javac Hello.java'
            }
        }

        stage('Run Java Program') {
            steps {
                bat 'java Hello'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME%:latest .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                credentialsId: 'Docker-credentials',//give your credentials mentioned above
                usernameVariable: 'USER',
                passwordVariable: 'PASS')]) {

                    bat 'echo %PASS%| docker login -u %USER% --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push %IMAGE_NAME%:latest'
            }
        }
    }
}


3rd prgm 

(java file)
import java.io.FileReader;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class thoju {

    public static void main(String[] args) {

        JSONParser p = new JSONParser();

        try {

            Object obj = p.parse(new FileReader("san.json"));

            JSONObject jo = (JSONObject) obj;

            String fname = (String) jo.get("fname");
            String lname = (String) jo.get("lname");

            System.out.println("Fname : " + fname);
            System.out.println("lname : " + lname);

        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
(json file)
{
 "fname" : "poorvi",
 "lname" : "malavade"
}

MAVEN PROJECT:
Step1:
Open Eclipse
File -> new-> maven project ->next
Choose maven-archetype-quickstart -> version 1.1 or 1.4
Group id nd artifact id anything, Artifact nd package name should be same
In chrome, search maven repository
Search json simple
1st json.simple
Click the one which has more usages. 1.1.1
In the maven u will have, there will be dependency code
pom.xml paste the dependency code
Right click on package -> new -> file -> filename: any.json
Code to put in .json file: 
Right click on src/test/java
New-> class -> Demo.java
Code to put in Demo.java:
import java.io.FileReader;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class thoju {

    public static void main(String[] args) {

        JSONParser p = new JSONParser();

        try {

            Object obj = p.parse(new FileReader("san.json"));

            JSONObject jo = (JSONObject) obj;

            String fname = (String) jo.get("fname");
            String lname = (String) jo.get("lname");

            System.out.println("Fname : " + fname);
            System.out.println("lname : " + lname);

        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}

Save and run





