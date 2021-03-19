import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/APIRequest/APIManager.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_modals/MasterModals.dart';
import 'package:jiclapp/app_util/Utility.dart';

void minMaxMultiples(
    String _value,
    int _riderIndex,
    int _index,
    BuildContext _context,
    String _webRefNumber,
    Map _subSectionDetails,
    Map<String, dynamic> _riderMastersDetails,
    int _currentPage,
    Map<int, dynamic> _benifitOverViewDetails,
    dynamic _formatNumber,
    dynamic _benefitSectionSubSection) {
  if ((_value.replaceAll(RegExp(','), '')).length >= 6 &&
      _riderIndex == 0 &&
      _index == 0) {
    FocusScope.of(_context).unfocus();
    Utility().activity(_context);
    Timer.run(() async {
      List<ServiceResponseID> serviceResponseID =
          await DBHelper().getServiceResponseIDWith(_webRefNumber);
      if (serviceResponseID.length > 0) {
        final contactID = serviceResponseID[0].contactID;
        String response = await APIManager().getRiderMaxMinLimitsWithValue(
            _subSectionDetails,
            _value,
            _riderMastersDetails,
            _currentPage,
            int.parse(contactID));
        if (response.length > 0) {
          final maxMinLimitsDetails = jsonDecode(response);
          List<dynamic> benefitOverView =
              maxMinLimitsDetails["LstBenefitOverView"];
          for (int i = 0; i < _benifitOverViewDetails.length; i++) {
            var tempBenefitOverViewDetails = _benifitOverViewDetails[i];
            for (final item in benefitOverView) {
              if (tempBenefitOverViewDetails[item["BenifitCode"]] != null) {
                var premiumDetails =
                    tempBenefitOverViewDetails[item["BenifitCode"]]
                        as PremiumDetails;
                premiumDetails.min = (item["MinSumInsured"] == null)
                    ? "0"
                    : (_formatNumber(double.parse(item["MinSumInsured"])
                        .round()
                        .toString()));
                premiumDetails.max = (item["MaxSumInsured"] == null)
                    ? "0"
                    : (_formatNumber(double.parse(item["MaxSumInsured"])
                        .round()
                        .toString()));
                premiumDetails.multiple =
                    (item["Multiple"] == null) ? "0" : item["Multiple"];
                premiumDetails.minTextEditingController.text =
                    premiumDetails.min;
                premiumDetails.maxTextEditingController.text =
                    premiumDetails.max;
                premiumDetails.multipleTextEditingController.text =
                    premiumDetails.multiple;
                premiumDetails.sumAssured = (item["BenifitCode"] == "BSA")
                    ? _value
                    : premiumDetails.sumAssured;
              }
            }
          }
        }
        //Update Spouse BSA
        if (_benifitOverViewDetails.length >= 1) {
          if (_benifitOverViewDetails.length >= 2) {
            var tempSpouseOverViewDetails = _benifitOverViewDetails[1];
            if (tempSpouseOverViewDetails["BSA"] != null) {
              var spousePremiumDetails =
                  tempSpouseOverViewDetails["BSA"] as PremiumDetails;
              spousePremiumDetails.sumAssured = _value;
              spousePremiumDetails.sumAssuredTextEditingController.text =
                  _value;
            }
          }
        }
      }
      Navigator.pop(_context);
    });
  } else {
    var tempBenefitOverViewDetails = _benifitOverViewDetails[_currentPage];
    final benifitCode =
        (tempBenefitOverViewDetails.keys).elementAt(_riderIndex);
    //Update CIA
    if (benifitCode == "CIC" && _index == 0) {
      for (int i = 1; i < _benefitSectionSubSection.length; i++) {
        var tempBenefitOverViewDetails = _benifitOverViewDetails[i];
        if (tempBenefitOverViewDetails["CIC"] != null) {
          var premiumDetails =
              tempBenefitOverViewDetails["CIC"] as PremiumDetails;
          premiumDetails.sumAssured = _value;
          premiumDetails.sumAssuredTextEditingController.text = _value;
        }
      }
    } else if (benifitCode == "PAC" && _index == 0) {
      if (_benifitOverViewDetails.length > 1) {
        var tempBenefitOverViewDetails = _benifitOverViewDetails[1];
        if (tempBenefitOverViewDetails["PAC"] != null) {
          var premiumDetails =
              tempBenefitOverViewDetails["PAC"] as PremiumDetails;
          premiumDetails.sumAssured = _value;
          premiumDetails.sumAssuredTextEditingController.text = _value;
        }
      }
    }
    if (_currentPage == 0) {
      updateMinMaxValues(
          _riderIndex, _value, _benifitOverViewDetails, _currentPage);
    } else {
      var premiumDetails =
          tempBenefitOverViewDetails[benifitCode] as PremiumDetails;
      premiumDetails.sumAssured = _value;
      //premiumDetails.sumAssuredTextEditingController.text = value;
    }
  }
}

//MARK:- Service integration
updateMinMaxValues(int riderIndex, String value, Map _benifitOverViewDetails,
    int _currentPage) {
  final keys = _benifitOverViewDetails.keys;
  var tempBenefitOverViewDetails = _benifitOverViewDetails[_currentPage];
  final benifitCode = (tempBenefitOverViewDetails.keys).elementAt(riderIndex);
  var page = 0;
  for (final key in keys) {
    final benifitOverViewDetail = _benifitOverViewDetails[key] as Map;
    final benifitCodes = benifitOverViewDetail.keys;
    for (final benfitKey in benifitCodes) {
      final premiumDetails = benifitOverViewDetail[benfitKey] as PremiumDetails;
      if (benfitKey == benifitCode) {
        if (page == _currentPage) {
          premiumDetails.sumAssured = value;
        } else if (page != 0) {
          premiumDetails.max = value;
          premiumDetails.maxTextEditingController.text = value;
        }
      }
    }
    page = page + 1;
  }
}
