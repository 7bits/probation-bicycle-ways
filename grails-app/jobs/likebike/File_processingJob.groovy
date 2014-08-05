package likebike

import groovy.sql.Sql
import org.xml.sax.SAXParseException

class File_processingJob {
    static triggers = {
        simple repeatInterval: 3000l // execute job once in 5 seconds
    }

    def concurrent = false
    def fileService
    def routeService

    def execute() {
        try {
            def row = fileService.getNext()
            if(row != null) {
                String xmlData = new java.io.File(row['id']+".userfile").text
                routeService.loadFromFile(xmlData, User.get(row['user_id']))
                fileService.markProcessed()
                return
            }
        }
        catch (Exception ex) {
            log.info(ex.message)
        }
        return
    }
}
