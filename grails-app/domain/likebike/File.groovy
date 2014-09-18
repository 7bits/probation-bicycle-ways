package likebike

/**
 * Stores information about files in file system and theirs status
 */
class File {
    static final int PROCESSED_WITH_SUCCESS = 2;
    static final int PROCESSED_WITH_ERROR = 1;
    static final int NOT_PROCESSED = 0;
    User user
    String file_name
    boolean user_alert
    int processed
}
