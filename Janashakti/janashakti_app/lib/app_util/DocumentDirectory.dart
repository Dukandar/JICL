import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DocumentDirectory{
  static DocumentDirectory _shareInstance;
  factory DocumentDirectory()=> _shareInstance??= DocumentDirectory._();
  DocumentDirectory._();
  String filePath = "";
  Future<bool> writeFileWithPath(String _path,dynamic _data) async {
      final File file = File(_path);
      file.writeAsBytesSync(_data);
      return true;
  }

   Future<String> checkFilePath(String path) async {
     filePath = path;
     bool isFileExist = await existsFile();
      if (isFileExist){
         filePath = (await _localFile).path;
        return filePath;
      }else{
       return "";
      }
   }

   Future<String> get _localPath async {
      final directory = await getApplicationDocumentsDirectory();
      return directory.path;
    }
  
    Future<File> get _localFile async {
        final path = await _localPath;
        return File(path + "/"+ filePath);
    }

    Future<bool> existsFile() async {
      final file = await _localFile;
      return file.exists();
    }

    //Create a image directory
  Future<void> createImageDirectory(String webRefNumber) async {
  if (webRefNumber.length > 0){
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    new Directory(appDocDirectory.path+'/' + '$webRefNumber').create()
    // The created directory is returned as a Future.
    .then((Directory directory) {
      print(directory.path);
  });
  } 
}

}