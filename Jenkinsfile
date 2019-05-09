#!/usr/bin/env groovy

pipeline {

    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'Success in build'
            }
        }

        stage('Run') {
            steps {
                echo 'Running...'
                sh 'liquibase  --changeLogFile=liquibase-changelog.xml --defaultsFile=liquibase.properites --classpath=./lib/postgresql-42.2.5.jar --url=jdbc:postgresql://localhost/aishu update'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing Success...'
                sh 'echo success'
            }
        }
    }
}
