// ignore_for_file: file_names


validInput(String val, int min, int max, String type, ) {
  if (val.isEmpty) {
   
    if (type=="select") {
      return "Please select data";
    }
  
    return "Please enter the filed data";
  } 
  
}
