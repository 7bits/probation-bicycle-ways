package likebike

import groovy.sql.Sql

class FileService {

    def dataSource

    def getNext() {
        Sql sql = new groovy.sql.Sql(dataSource)
        return sql.firstRow('select * from file limit 1')
    }

}
