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
            try {
                String xmlData = new java.io.File("userfiles/" + row['id']+".userfile").text
                routeService.loadFromFile(xmlData, User.get(row['user_id']))
            }
            catch(SAXParseException ex){
            }
            catch(Exception ex){
            }
            finally{
                fileService.markProcessed()
            }
        }
        return
    }
}
