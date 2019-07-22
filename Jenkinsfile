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

stage('liquibaseDbDoc New') {
    echo 'liquibaseDbDoc New Started...'

    liquibaseDbDoc( changeLogFile: 'liquibase-changelog.xml',   // same basic configuration parameters
                   url: 'jdbc:postgresql://localhost/postgres?user=postgres&password=iauro100&ssl=false',
                   driverClassname: 'org.postgresql.Driver',
                   outputDirectory: 'dbdoclatestgauddoc17')


    /*liquibaseDbDoc( changeLogFile: 'liquibase-changelog.xml',   // same basic configuration parameters
                   url: 'jdbc:postgresql://localhost/postgres?user=postgres&password=iauro100&ssl=false',
                   classpath: ':/usr/share/java/postgresql-42.2.6.jar',
                   databaseEngine: 'PostgreSQL',
                   driverClassname: 'org.postgresql.Driver',
                   defaultSchemaName: 'public',
                   outputDirectory: 'dbdoclatestgauddoc17') */


    echo 'liquibaseDbDoc New Completed...'

}


}
