pipeline {
    agent any
    
    environment { 
        DATABASE = "flyway-jenkins-demo"
    }

    stages {
        stage('build') {
            environment { 
                DEV = "dev"
            }

            steps {
                //sh label: 'Build on Dev', script: "bash ./build.sh -db $DATABASE -env $DEV"
                sh "bash ./build.sh -db $DATABASE -env $DEV"
            }
        }

        stage('stg') {
            environment { 
                STG = "stg"
            }

            steps {
                sh label: 'Deploy to Staging environment', script: "bash ./deploy_to_stg.sh -db $DATABASE -env $STG"
            }
        }

        stage('qa') {
            environment { 
                QA = "qa"
            }

            steps {
                sh label: 'Deploy to QA environment', script: "./deploy_to_qa.sh -db $DATABASE -env $QA"
            }
        }

        stage('prd') {
            environment { 
                PRD = "prd"
            }

            steps {
                sh label: 'Deploy to Production environment', script: "deploy_to_prd.sh -db $DATABASE -env $PRD"
            }
        }
    }
}