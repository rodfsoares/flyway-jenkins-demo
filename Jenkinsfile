pipeline {
    agent any
    
    environment { 
        DATABASE = "flyway-jenkins-demo"
        PATH = "/usr/local/Cellar:$PATH"
    }

    stages {
        stage('build') {
            environment { 
                DEV = "dev"
            }

            steps {
                sh "printenv | sort"
                //sh label: 'Build on Dev', script: "bash ./build.sh -db $DATABASE -env $DEV"
                sh "bash ./build.sh -db $DATABASE -env $DEV"
            }
        }

        stage('stg') {
            environment { 
                STG = "stg"
            }

            steps {
                //sh label: 'Deploy to Staging environment', script: "bash ./deploy_to_stg.sh -db $DATABASE -env $STG"
                sh "bash ./deploy_to_stg.sh -db $DATABASE -env $STG"
            }
        }

        stage('qa') {
            environment { 
                QA = "qa"
            }

            steps {
                //sh label: 'Deploy to QA environment', script: "./deploy_to_qa.sh -db $DATABASE -env $QA"
                sh "./deploy_to_qa.sh -db $DATABASE -env $QA"
            }
        }

        stage('prd') {
            environment { 
                PRD = "prd"
            }

            steps {
                //sh label: 'Deploy to Production environment', script: "deploy_to_prd.sh -db $DATABASE -env $PRD"
                sh "deploy_to_prd.sh -db $DATABASE -env $PRD"
            }
        }
    }
}