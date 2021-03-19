import 'package:jiclapp/app_util/Constant.dart';
import 'package:jiclapp/app_util/UserManager.dart';

class SaveSuspect{
    String username;
    String name;
    String lastName;
    String mobile;
    String email;
    dynamic work;
    dynamic home;
    dynamic message;
    int contactId;
    dynamic allocationType;
    dynamic decision;
    dynamic report;
    String mobileCountryCode;
    String homeCountryCode;
    String workCountryCode;
    dynamic lstCountryCode;
    SaveSuspect({
        this.username,
        this.name,
        this.lastName,
        this.mobile,
        this.email,
        this.work,
        this.home,
        this.message,
        this.contactId,
        this.allocationType,
        this.decision,
        this.report,
        this.mobileCountryCode,
        this.homeCountryCode,
        this.workCountryCode,
        this.lstCountryCode,
    });

    SaveSuspect.fromJson(_subSectionDetails){
        username = UserManager().userID;
        name = ((_subSectionDetails[1000] as List)[1] as SectionSubSection).fieldValue;
        lastName = ((_subSectionDetails[1000] as List)[2] as SectionSubSection).fieldValue;
        mobile = (((_subSectionDetails[1000] as List)[3] as SectionSubSection).fieldValue.length > 0) ? (((_subSectionDetails[1000] as List)[3] as SectionSubSection).fieldValue.split("@")[1])  : null;
        email =  ((_subSectionDetails[1000] as List)[6] as SectionSubSection).fieldValue;
        work = (((_subSectionDetails[1000] as List)[5] as SectionSubSection).fieldValue.length > 0) ? (((_subSectionDetails[1000] as List)[5] as SectionSubSection).fieldValue.split("@")[1])  : null;
        home = (((_subSectionDetails[1000] as List)[4] as SectionSubSection).fieldValue.length > 0) ? (((_subSectionDetails[1000] as List)[4] as SectionSubSection).fieldValue.split("@")[1])  : null;
        message = null;
        contactId = null;
        allocationType = null;
        decision =  null;
        report =  null;
        mobileCountryCode =  (((_subSectionDetails[1000] as List)[3] as SectionSubSection).fieldValue.length > 0) ? (((_subSectionDetails[1000] as List)[3] as SectionSubSection).fieldValue.split("@")[2]).toLowerCase()  : "lk";
        homeCountryCode = (((_subSectionDetails[1000] as List)[4] as SectionSubSection).fieldValue.length > 0) ? (((_subSectionDetails[1000] as List)[4] as SectionSubSection).fieldValue.split("@")[2]).toLowerCase()  : "lk";
        workCountryCode = (((_subSectionDetails[1000] as List)[5] as SectionSubSection).fieldValue.length > 0) ? (((_subSectionDetails[1000] as List)[5] as SectionSubSection).fieldValue.split("@")[2]).toLowerCase()  : "lk";
        lstCountryCode = null;
    }

     Map toJson()=>{
        "Username": username,
        "Name": name,
        "LastName": lastName,
        "Mobile": mobile,
        "Email": email,
        "Work": work,
        "Home": home,
        "Message": message,
        "ContactID": contactId,
        "AllocationType": allocationType,
        "Decision": decision,
        "Report": report,
        "MobileCountryCode": mobileCountryCode,
        "HomeCountryCode": homeCountryCode,
        "WorkCountryCode": workCountryCode,
        "LstCountryCode": lstCountryCode,
     };
}