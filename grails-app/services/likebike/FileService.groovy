package likebike

import groovy.sql.Sql

/**
 * Responsible for work with files status in database.
 */
class FileService {

    def dataSource

    /**
     * Get next file to process
     * @return 1 row which is file to process
     */
    def fetchNext = {
        Sql sql = new groovy.sql.Sql(dataSource)
        return sql.firstRow('select * from file where file.processed = ? limit 1;', [File.NOT_PROCESSED])
    }

    /**
     * Get all processed files for user's id
     * @param id user id whose files to check
     * @return list of rows which are user's files. User doesn't know these files status yet.
     */
    def fetchProcessed(id) {
        Sql sql = new groovy.sql.Sql(dataSource)
        return sql.rows('select * from file where user_alert=false and not file.processed = ? and user_id = ?;', [File.NOT_PROCESSED, id])
    }

}
