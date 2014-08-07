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
        def row = fileService.getNext()
        if(row != null) {
            String xmlData = new java.io.File(row['id']+".userfile").text
            try {
                routeService.loadFromFile(xmlData, User.get(row['user_id']))
            }
            catch(SAXParseException ex){
                fileService.markProcessed()
            }
        }
        return
    }
}
