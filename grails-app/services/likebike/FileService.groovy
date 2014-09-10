package likebike

import groovy.sql.Sql

class FileService {

    def dataSource

    def getNext() {
        Sql sql = new groovy.sql.Sql(dataSource)
        return sql.firstRow('select * from file where file.processed = ? limit 1;', [File.NOT_PROCESSED])
    }

    def getProcessed(id) {
        Sql sql = new groovy.sql.Sql(dataSource)
        return sql.rows('select * from file where user_alert=false and not file.processed = ? and user_id = ?;', [File.NOT_PROCESSED, id])
    }

    void markProcessed() {
        Sql sql = new groovy.sql.Sql(dataSource)
        sql.executeUpdate('update file set processed = true where processed = false limit 1;')
    }

    void setAlert(id) {
        Sql sql = new groovy.sql.Sql(dataSource)
        sql.executeUpdate('update file set user_alert = true where id = ?;', [id])
    }
}
