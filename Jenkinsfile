#!/usr/bin/env groovy

timestamps {

	node ('mavenbuild') {	

		stage('Checkout') {	

			step([$class: 'WsCleanup'])	

			checkout scm

			sh "ls -la ${pwd()}"

			stash includes: "**/*", name: 'src'
		}

		stage('Build & Store') {

			unstash 'src'

			sh "ls -la ${pwd()}"

			sh "mvn -f pom.xml clean deploy -DskipTests -Dbuild.number=${env.BUILD_NUMBER}"

			stash includes: "Dockerfile", name: 'docker'

			dir("target") {
				stash includes: "*.jar", name: 'jars'
			}
		}

		stage('Build & Tag Docker Image') {

			unstash 'docker'
			unstash 'jars'
			sh "ls -la ${pwd()}"
			sh "docker build -t javarestgreeting:latest ."

			//sh "docker tag 192.168.0.38:8083/javarestgreeting:GET VERSION FROM MAVEN PROPERTIES"
			//sh "docker tag 192.168.0.38:8083/javarestgreeting:latest"
		}

		stage('Push Docker Image to Nexus (:latest') {
			
			sh "docker push 192.168.0.38:8083/javarestgreeting:latest"
		}		
	}
}
