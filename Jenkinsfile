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

			dir("docker") {
				stash includes: "*", name: 'docker'
			}
			dir("target") {
				stash includes: "*${env.BUILD_NUMBER}", name: 'jars'
			}
		}

		stage('Build & Tag Docker Image') {
			
			dir("docker")
			{
				sh "ls -la ${pwd()}"
				deleteDir()
				unstash 'docker'
				unstash 'jars'
				sh "ls -la ${pwd()}"
				sh "docker build -t javarestgreeting:latest ."
			}			
		}
	}
}
