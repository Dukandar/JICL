import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/APIRequest/APIManager.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/DocumentDirectory.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';


class BusinessDocumentView extends StatefulWidget{
final object;
BusinessDocumentView(this.object);
   @override
  State<StatefulWidget> createState(){
    return BusinessDocumentViewState();
  }
}

 class BusinessDocumentViewState extends State<BusinessDocumentView>{
   String filePath = "";
    @override
    void initState () {
      super.initState();
      checkPDFPath();
    }

   checkPDFPath() async {
      String path = await DocumentDirectory().checkFilePath("${((widget.object["cardDetails"] as HeaderSectionFields).webRefNumber)}/${((widget.object["cardDetails"] as HeaderSectionFields).fieldValue)}.pdf");
      if (path.length > 0){
         filePath = path;
         setState(() {
         });
        //downloadPDF(widget.object["cardDetails"] as HeaderSectionFields);
      }else{
         downloadPDF(widget.object["cardDetails"] as HeaderSectionFields);
      }
    }

    void downloadPDF(HeaderSectionFields _headerSectionFields){
      Utility().activity(context);
      Future.delayed(const Duration(milliseconds: 600), () async { 
        String response =  await APIManager().encryptionWithData(_headerSectionFields.fieldValue);
        if (response.length > 0){
            final  encryptionString = jsonDecode(response);
              Uint8List pDFresponse =  await APIManager().viewPDFWithData(encryptionString);
              if (pDFresponse.length > 0){
                  final documentsDirectory = await getApplicationDocumentsDirectory();
                  String _path = (documentsDirectory.path) + '/' + _headerSectionFields.webRefNumber + '/' + _headerSectionFields.fieldValue + ".pdf";
                   bool response =  await DocumentDirectory().writeFileWithPath(_path, pDFresponse);
                    if (response){
                       Navigator.pop(context);       
                       checkPDFPath(); 
                    }
              }
        }
    });
    }

  //MARK:-
  Widget build(BuildContext context){
     return new WillPopScope(
       onWillPop: () async => false,
       child:  MaterialApp(
      home: new Container(
        decoration: BoxDecoration(
          image:Utility().returnBackgroundImage()
        ),
        child: new Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title:Text((widget.object["cardDetails"] as HeaderSectionFields).fieldValue),
            backgroundColor: Utility().returnThemColorWithIndex(Utility().returnThemColorIndex()
            ),
            leading:IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () => {
                Navigator.of(context).pop()
              },
            ),
            actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        sendEmail(widget.object["cardDetails"] as HeaderSectionFields,context);
                      },
                      child: Icon(
                        Icons.mail,
                        size: 26.0,
                      ),
                    )
                  ),
            ],
          ),
          body: Center(
          child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: (filePath.length > 0) ? PdfViewer(
                    filePath: filePath,
                  ) : Container()
                )
          ),
        ),
        ),
      ),
     );
  }

  void sendEmail(HeaderSectionFields _headerSectionFields,BuildContext context){
    Utility().activity(context);
    Future.delayed(const Duration(milliseconds: 600), () async { 
        String encrResponse =  await APIManager().encryptionWithData(_headerSectionFields.fieldValue);
        if (encrResponse.length > 0){
        final  encryptionString = jsonDecode(encrResponse);
          String mailResponse =  await APIManager().sendEmailWithData(encryptionString);
            if (mailResponse.length > 0){
            final mailData = jsonEncode(mailResponse);
             Navigator.pop(context);
            Utility().alertDialog(context, LabelConstant.kEmailSent,0);
           }else{
              Navigator.pop(context);
           }
        }
    });
  }
}
