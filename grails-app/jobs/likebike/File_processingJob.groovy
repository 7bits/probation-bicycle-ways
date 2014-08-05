package likebike



class File_processingJob {
    static triggers = {
      simple repeatInterval: 10000l // execute job once in 5 seconds
    }

    def execute() {
        SomeClass classy = new SomeClass();
        classy.i = 1;
        classy.save();
    }
}
