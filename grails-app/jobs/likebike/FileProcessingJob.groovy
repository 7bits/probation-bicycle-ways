package likebike

import grails.util.Holders
import org.xml.sax.SAXParseException

/**
 * Handles deferred file processing
 */
class FileProcessingJob {

    def fileRepository
    def grailsCacheManager
    def routeService

    static triggers = {
        simple repeatInterval: 3000l // execute job once in 5 seconds
    }

    def concurrent = false

    /**
     * Takes next loaded non-processed file and tries to process it.
     */
    def execute() {
        def row = fileRepository.fetchNext();
        if (row != null) {
            File file = File.get(row['id']);
            if (file != null) {
                try {
                    String xmlData = new java.io.File(Holders.config.pathToUsersFiles + file.id + ".userfile").text
                    def processed = routeService.loadFromFile(xmlData, User.get(file.user.id))
                    if(processed) {
                        grailsCacheManager.getCache('routes')?.clear()
                        file.processed = File.PROCESSED_WITH_SUCCESS;
                    }
                    else{
                        file.processed = File.PROCESSED_WITH_ERROR;
                    }
                }
                catch (SAXParseException ex) {
                    file.processed = File.PROCESSED_WITH_ERROR;
                }
                catch (Exception ex) {
                    file.processed = File.PROCESSED_WITH_ERROR;
                }
                finally {
                    file.save(flush: true);
                }
            }
        }
        if(!grailsCacheManager.cacheExists('routes') && (row == null)) {
            routeService.fetchRoute()
        }
        return
    }
}
