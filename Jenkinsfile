pipeline {
    agent any
    
    environment { 
        DATABASE = "flyway_jenkins_demo"
        PATH = "/usr/local/Cellar/postgresql/11.5_1/bin:/usr/local/Cellar/flyway/6.0.8/bin:$PATH"
    }

    stages {
        stage('build') {
            environment { 
                DEV = "dev"
            }

            steps {
                //sh "printenv | sort"
                //sh label: 'Build on Dev', script: "bash ./build.sh -db $DATABASE -env $DEV"
                sh script: "./build.sh -d $DATABASE -e $DEV", label: 'Build on Dev'
            }
        }

        stage('stg') {
            environment { 
                STG = "stg"
            }

            steps {
                //sh label: 'Deploy to Staging environment', script: "bash ./deploy_to_stg.sh -db $DATABASE -env $STG"
                sh script: "./deploy_to_stg.sh -d $DATABASE -e $STG", label: 'Deploy to STG environment'
            }
        }

        stage('qa') {
            environment { 
                QA = "qa"
            }

            steps {
                //sh label: 'Deploy to QA environment', script: "./deploy_to_qa.sh -db $DATABASE -env $QA"
                sh script: "./deploy_to_qa.sh -d $DATABASE -e $QA", label: 'Deploy to QA environment'
            }
        }

        stage('prd') {
            environment { 
                PRD = "prd"
            }

            steps {
                //sh label: 'Deploy to Production environment', script: "deploy_to_prd.sh -db $DATABASE -env $PRD"
                sh script: "./deploy_to_prd.sh -d $DATABASE -e $PRD", label: 'Deploy to PRD environment'
            }
        }
    }
}