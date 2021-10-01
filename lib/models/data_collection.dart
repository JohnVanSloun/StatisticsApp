import './form_data.dart';

class DataCollection {
  static List<FormData> dataList = [];

  static void addData(FormData data) {
    dataList.add(data);
  }

  static void removeData(index) {
    dataList.removeAt(index);
  }
}
