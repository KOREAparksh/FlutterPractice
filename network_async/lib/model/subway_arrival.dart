class SubwayArrival {
  int _rowNum;
  String _subwayID;
  String _trainLineNm;
  String _subwayHeading;
  String _arvlMsg2;

  SubwayArrival(this._rowNum, this._subwayID, this._trainLineNm,
      this._subwayHeading, this._arvlMsg2);

  String get arvlMsg2 => _arvlMsg2;
  String get subwayHeading => _subwayHeading;
  String get trainLineNm => _trainLineNm;
  String get subwayID => _subwayID;
  int get rowNum => _rowNum;
}
