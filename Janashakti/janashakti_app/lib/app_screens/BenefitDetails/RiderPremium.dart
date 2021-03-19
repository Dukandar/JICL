import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/APIRequest/APIManager.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Utility.dart';

void riderPremium(BuildContext _context,String _webRefNumber,Map _subSectionDetails, 
Map<int, dynamic> _benifitOverViewDetails,Map<String, dynamic> _riderMastersDetails,int _currentPage){
  Utility().activity(_context);
    FocusScope.of(_context).unfocus();
    Timer.run(() async {
      List<ServiceResponseID> serviceResponseID =
          await DBHelper().getServiceResponseIDWith(_webRefNumber);
      if (serviceResponseID.length > 0) {
        final contactID = serviceResponseID[0].contactID;
        String response = await APIManager().calculatePremium(
            _subSectionDetails,
            _benifitOverViewDetails,
            _riderMastersDetails,
            _currentPage,
            int.parse(contactID));
        if (response.length > 0) {
          final premiumDetails = jsonDecode(response);
          if (premiumDetails["Message"] == null) {
            await DBHelper().insertJsonObject(
                _webRefNumber, response, "premiumObject");
            List<dynamic> benefitOverView =
                premiumDetails["LstBenefitOverView"];
            var tempBenefitOverViewDetails =
                _benifitOverViewDetails[_currentPage];
            var modePremiumTxt = (((tempBenefitOverViewDetails["BSA"] != null)
                    ? tempBenefitOverViewDetails["BSA"]
                    : tempBenefitOverViewDetails["FE"]) as PremiumDetails)
                .modePremiumTextEditingController;
            //PreimumDetails
            var premiumBenefitOverViewDetails = _benifitOverViewDetails[0];
            var totalModePremiumTxt =
                (premiumBenefitOverViewDetails["BSA"] as PremiumDetails)
                    .totalModeTextEditingController;
            var annualPremiumTxt =
                (premiumBenefitOverViewDetails["BSA"] as PremiumDetails)
                    .annualTextEditingController;
            var halfYearlyPremiumTxt =
                (premiumBenefitOverViewDetails["BSA"] as PremiumDetails)
                    .halfYearlyTextEditingController;
            var quaterlyPremiumTxt =
                (premiumBenefitOverViewDetails["BSA"] as PremiumDetails)
                    .quaterlyTextEditingController;
            var monthlyPremiumTxt =
                (premiumBenefitOverViewDetails["BSA"] as PremiumDetails)
                    .monthlyTextEditingController;
            var modePremium = 0.0;
            for (final item in benefitOverView) {
              final objBenefitMemberRelationship =
                  item["objBenefitMemberRelationship"][_currentPage];
              var benfitDetails =
                  tempBenefitOverViewDetails[item["BenifitCode"]]
                      as PremiumDetails;
              if (benfitDetails != null) {
                if (objBenefitMemberRelationship["Rider_Premium"] == null ||
                    objBenefitMemberRelationship["Rider_Premium"].length == 0) {
                  benfitDetails.premiumTextEditingController.text = "0";
                } else {
                  benfitDetails.premiumTextEditingController.text =
                      objBenefitMemberRelationship["Rider_Premium"];
                  benfitDetails.premiumm =
                      objBenefitMemberRelationship["Rider_Premium"];
                  modePremium = modePremium +
                      double.parse(
                          (objBenefitMemberRelationship["Rider_Premium"])
                              .replaceAll(RegExp(','), ''));
                }
              }
            }
            modePremiumTxt.text = (modePremium.round()).toString();
            //BasicPremium
            if (premiumDetails["BasicPremium"] != null) {
              totalModePremiumTxt.text =
                  (premiumDetails["BasicPremium"].length > 0)
                      ? premiumDetails["BasicPremium"]
                      : "0";
              annualPremiumTxt.text =
                  (premiumDetails["AnnualPremium"].length > 0)
                      ? premiumDetails["AnnualPremium"]
                      : "0";
              halfYearlyPremiumTxt.text =
                  (premiumDetails["HalfYearlyPremium"].length > 0)
                      ? premiumDetails["HalfYearlyPremium"]
                      : "0";
              quaterlyPremiumTxt.text =
                  (premiumDetails["QuaterlyPremium"].length > 0)
                      ? premiumDetails["QuaterlyPremium"]
                      : "0";
              monthlyPremiumTxt.text =
                  (premiumDetails["MonthlyPremium"].length > 0)
                      ? premiumDetails["MonthlyPremium"]
                      : "0";
            }
          } else {
            Utility().showToastMessage(premiumDetails["Message"]);
          }
          Navigator.pop(_context);
        }
      }
    });
}