node {
stage('Checkout') {
    echo 'Checkout Code Started...'
    git url: 'https://github.com/gaudah/liquibase-git-jenkins.git', credentialsId: '30a90c33-83ea-4aaf-a196-5a256e11c60a', branch: 'master'
    echo 'Checkout Completed...'
}
 
stage('Update') {
    echo 'Updation Started...'
    liquibaseUpdate changeLogFile: 'liquibase-changelog.xml',url: 'jdbc:postgresql://localhost/postgres?user=postgres&password=iauro100&ssl=false', databaseEngine: 'PostgreSQL'
    echo 'Updation Completed...'
}

stage('Rollback') {
    echo 'Rollback Started...'
    liquibaseRollback changeLogFile: 'liquibase-changelog.xml',url: 'jdbc:postgresql://localhost/postgres?user=postgres&password=iauro100&ssl=false', databaseEngine: 'PostgreSQL', rollbackCount: 1
    echo 'Rollback Completed...'
}
stage('DB verify') {
    echo 'Verification Started...'
    liquibaseUpdate changeLogFile: 'liquibase-select.xml',url: 'jdbc:postgresql://localhost/postgres?user=postgres&password=iauro100&ssl=false', databaseEngine: 'PostgreSQL'
    echo 'Verification Completed...'
}
/*stage('liquibaseDbDoc') {
    echo 'liquibaseDbDoc Started...'
    liquibaseDbDoc changeLogFile: 'liquibase-changelog.xml',url: 'jdbc:postgresql://localhost/postgres?user=postgres&password=iauro100&ssl=false', databaseEngine: 'PostgreSQL', outputDirectory:'/var/lib/jenkins/workspace'
    //liquibaseDbDoc changeLogFile: 'liquibase-changelog.xml',url: 'jdbc:postgresql://localhost/postgres?user=postgres&password=iauro100&ssl=false', databaseEngine: 'PostgreSQL', outputDirectory:'/home/aishu/QUICK_SCAN/'
    //liquibaseDbDoc changeLogFile: 'liquibase-changelog.xml',url: 'jdbc:postgresql://localhost/postgres?user=postgres&password=iauro100&ssl=false', databaseEngine: 'PostgreSQL', outputDirectory:'/var/lib/jenkins/workspace/dbdocs'
    echo 'liquibaseDbDoc Completed...'
    
}*/

/*stage('Create directory') {
    echo 'creating directory...'
    sh 'ls -l'
    dir ('dbdocs') {
        writeFile file:'dummy', text:''
    }
    sh 'ls -l'
    echo 'created directory...'
}*/


}
