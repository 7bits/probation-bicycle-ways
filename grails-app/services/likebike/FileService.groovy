package likebike

import groovy.sql.Sql

class FileService {

    def dataSource

    def getNext() {
        Sql sql = new groovy.sql.Sql(dataSource)
        return sql.firstRow('select * from file where file.processed = false limit 1;')
    }

    def getProcessed(id) {
        Sql sql = new groovy.sql.Sql(dataSource)
        String query = 'select * from file where user_alert=false and not file.processed = ' + File.NOT_PROCESSED + ' and user_id ='+ id +';'
        return sql.rows(query)
    }

    void markProcessed() {
        Sql sql = new groovy.sql.Sql(dataSource)
        sql.executeUpdate('update file set processed = true where processed = false limit 1;')
    }

    void setAlert(id) {
        Sql sql = new groovy.sql.Sql(dataSource)
        String query = 'update file set user_alert = true where id ='+ id +';';
        sql.executeUpdate(query)
    }
}
