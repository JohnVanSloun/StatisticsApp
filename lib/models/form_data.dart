class FormData {
  String? title;
  String? xValues;
  String? yValues;

  FormData({this.title, this.xValues, this.yValues});

  List mapXValues() {
    return this.xValues!.split(',');
  }

  List mapYValues() {
    return this.yValues!.split(',');
  }
}
