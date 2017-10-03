#!/usr/bin/env groovy

timestamps {
	node ('mavenbuild') {	

		stage('Checkout') {	

			step([$class: 'WsCleanup'])	

			checkout scm

			sh "ls -la ${pwd()}"

			sh "mvn -f pom.xml clean install -DskipTests -Dbuild.number=${buildNumber}"
		}

	}
}
