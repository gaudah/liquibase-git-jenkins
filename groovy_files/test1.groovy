databaseChangeLog() {
  changeSet(id:'monkey', author: 'tlberglund') {
    sqlFile(path: 'test.sql')
  }
}

