  class UploadMedia{
    dynamic objDoc;
    UploadMedia({
      this.objDoc
    });

    UploadMedia.fromJson(List files){
      objDoc =  ObjDoc.fromJson(files);
    }

    Map toJson()=>{
      "objDoc" : objDoc
    };
  }

//MARK: objDoc
class ObjDoc{
   List docinfo;
   ObjDoc({
      this.docinfo,
   });
   ObjDoc.fromJson(List files){
        docinfo = List<LstUploadFile>.from(returnUploadFiles(files).map((e) => LstUploadFile.formJson(e)));
   }
    Map toJson()=>{
      "lstUploadFile" : List<dynamic>.from(docinfo.map((e) => e.toJson())),
    };
}

  returnUploadFiles(List files){
     List _mediaFilesList = [];
      for (final item in files) {
          final Map<String,dynamic> details ={
            "contactId" : item["contactId"],
            "fileName" : item["fileName"],
            "bytes" : item["bytes"]
          };
          _mediaFilesList.add(details);
      }
      return _mediaFilesList;
  }

class LstUploadFile{
  String contactId;
  String fileName;
  dynamic bytes;
  LstUploadFile({
    this.contactId,
    this.fileName,
    this.bytes
  });
  LstUploadFile.formJson(Map _details){
    contactId = _details["contactId"];
    fileName = _details["fileName"];
    bytes = _details["bytes"];
  }

  Map toJson()=>{
    "contactId"  : contactId,
    "fileName" : fileName,
    "bytes" : bytes
  };
}
