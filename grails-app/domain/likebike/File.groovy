package likebike

/**
 * Created by roman on 05.08.14.
 */

class File {
    static final def PROCESSED_WITH_SUCCESS = 2;
    static final def PROCESSED_WITH_ERROR = 1;
    static final def NOT_PROCESSED = 0;
    User user
    String file_name
    boolean user_alert
    int processed
}
