class SectionMaster {
  int sectionID;
  String sectionName;

  SectionMaster(
      this.sectionID,
      this.sectionName);

  SectionMaster.fromList(List<String> items) : this(
      int.parse(items[0]),
      items[2]
  );

  @override
  String toString() {
    return 'sectionID: $sectionID, sectionName: $sectionName}';
  }
}