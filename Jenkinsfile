node {
stage('Checkout') {
echo 'checkout code...'
git url: 'https://github.com/gaudah/liquibase-git-jenkins.git', credentialsId: '30a90c33-83ea-4aaf-a196-5a256e11c60a', branch: 'master'
}
 
stage('Update') {
    echo 'Updation Started...'
    liquibaseUpdate changeLogFile: 'liquibase-changelog.xml',url: 'jdbc:postgresql://localhost/postgres?user=postgres&password=iauro100&ssl=false', databaseEngine: 'PostgreSQL'
    echo 'Updation Completed...'
}

stage('Rollback') {
    echo 'Rollback Started...'
    liquibaseRollback changeLogFile: 'liquibase-changelog.xml',url: 'jdbc:postgresql://localhost/postgres?user=postgres&password=iauro100&ssl=false', databaseEngine: 'PostgreSQL', rollbackCount: 2
    echo 'Rollback Completed...'
}

}
