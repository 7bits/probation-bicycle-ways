package likebike

import groovy.sql.Sql

class FileService {

    def dataSource

    def getNext() {
        Sql sql = new groovy.sql.Sql(dataSource)
        return sql.firstRow('select * from file where file.processed = false limit 1;')
    }

    def getProcessed(User user) {
        Sql sql = new groovy.sql.Sql(dataSource)
        return sql.rows('select * from file where file.processed = true;')
    }

    void markProcessed() {
        Sql sql = new groovy.sql.Sql(dataSource)
        sql.executeUpdate('update file set processed = true where processed = false limit 1;')
    }
}
