class LoadMastersForQuote {
  dynamic objProductDetials;
  LoadMastersForQuote({this.objProductDetials});
  LoadMastersForQuote.fromJSON(String _planName) {
    objProductDetials = ObjProductDetials.fromJSON(_planName);
  }
  Map toJson() => {"objProductDetials": objProductDetials.toJson()};
}

class ObjProductDetials {
  String plan;
  ObjProductDetials({this.plan});

  ObjProductDetials.fromJSON(String _planName) {
    plan = _planName;
  }

  Map toJson() => {"Plan": this.plan};
}
