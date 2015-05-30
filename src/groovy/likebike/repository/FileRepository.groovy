package likebike.repository

import likebike.File

/**
 * Responsible for work with files status in database.
 */
class FileRepository {

    /**
     * Get next file to process
     * @return 1 row which is file to process
     */
    def fetchNext() {
        return File.findByProcessed(File.NOT_PROCESSED)
    }

    /**
     * Get all processed files for user's id
     * @param id user id whose files to check
     * @return list of rows which are user's files. User doesn't know these files status yet.
     */
    def fetchProcessed(id) {
        File.findAllByProcessedNotEqualAndUserAndUserAlert(File.NOT_PROCESSED, id, false)
    }

}
