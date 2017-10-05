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

			stash includes: "target/**/*", name: 'target'

		}
	}
}
