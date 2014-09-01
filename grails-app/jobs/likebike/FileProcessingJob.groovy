package likebike

import groovy.sql.Sql
import org.xml.sax.SAXParseException

class FileProcessingJob {

    def fileService
    def grailsCacheManager
    def routeService

    static triggers = {
        simple repeatInterval: 3000l // execute job once in 5 seconds
    }

    def concurrent = false


    def execute() {
        def row = fileService.getNext();
        if (row != null) {
            File file = File.get(row['id']);
            if (file != null) {
                try {
                    String xmlData = new java.io.File("userfiles/" + file.id + ".userfile").text
                    def file_user = file.user;
                    routeService.loadFromFile(xmlData, User.get(file.user.id))
                    grailsCacheManager.getCache('routes')?.clear()
                    file.processed = File.PROCESSED_WITH_SUCCESS;
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
            routeService.getRoute()
        }
        return
    }
}
