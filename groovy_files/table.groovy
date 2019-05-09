databaseChangeLog = {
   changeSet(author: '...', id: '...') {

      grailsChange {
         init {
             // arbitrary initialization code; note that no
             // database or connection is available
         }

         validate {
            // can call warn(String message) to log a warning
            // or error(String message) to stop processing
         }

         change {
            // arbitrary code; make changes directly and/or return a
            // SqlStatement using the sqlStatement(SqlStatement sqlStatement)
            // method or multiple with sqlStatements(List sqlStatements)

            confirm 'change confirmation message'
         }

         rollback {
            // arbitrary code; make rollback changes directly and/or
            // return a SqlStatement using the sqlStatement(SqlStatement sqlStatement)
            // method or multiple with sqlStatements(List sqlStatements)

            confirm 'rollback confirmation message'
         }

         confirm 'confirmation message'

         checkSum 'override value for checksum'
      }

   }
}
