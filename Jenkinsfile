pipeline {
    agent any
    environment {
        SVC_ACCOUNT_KEY = credentials('oauth')
    }
    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {

        stage('Checkout') {
            steps {
              checkout scm
              sh 'mkdir -p creds'
              sh 'echo $SVC_ACCOUNT_KEY | certutil -decode > ./creds/serviceaccount.json'
              load "$WORKSPACE/pipeline-vars.groovy"
            }
        }

        stage('Build') {
            steps {
                script {
                    run("build")
                }
            }
        }

        stage('Validate') {
            steps {
                script {
                   run("validate")
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    run("deploy")
                }
            }
        }
    }
}

def run(command) {
    PIPELINE_STEPS.each{ name, script ->
        if (name.toLowerCase().contains(command)) {
            sh script
        }
    }
}
