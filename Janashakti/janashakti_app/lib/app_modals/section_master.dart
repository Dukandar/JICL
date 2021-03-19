
class SectionMaster {

  int _sectionId;
  String _sectionName;

  SectionMaster(this._sectionId, this._sectionName);

  int get id => _sectionId;
  String get name => _sectionName;

  set sectionId(int newId) {
    if (newId >= 0) {
      this._sectionId = newId;
    }
  }

  set sectionName(String name) {
    if (name.length <= 255) {
      this._sectionName = name;
    }
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['sectionId'] = _sectionId;
    }
    map['sectionName'] = _sectionName;

    return map;
  }

  // Extract a Note object from a Map object
  SectionMaster.fromMapObject(Map<String, dynamic> map) {
    this._sectionId = map['sectionId'];
    this._sectionName = map['sectionName'];
  }
}