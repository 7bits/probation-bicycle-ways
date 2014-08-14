package likebike

import groovy.sql.Sql
import org.xml.sax.SAXParseException

class FileProcessingJob {
    static triggers = {
        simple repeatInterval: 3000l // execute job once in 5 seconds
    }

    def concurrent = false
    def fileService
    def routeService

    def execute() {
        def row = fileService.getNext();
        if (row != null) {
            File file = File.get(row['id']);
            if (file != null) {
                try {
                    String xmlData = new java.io.File("userfiles/" + file.id + ".userfile").text
                    def file_user = file.user;
                    routeService.loadFromFile(xmlData, User.get(file.user.id))
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
            return
        }
        return
    }
}
