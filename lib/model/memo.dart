import 'package:cloud_firestore/cloud_firestore.dart';

class Memo {
  String title;
  String detail;
  Timestamp createdDate;
  Timestamp? updateDate;

  Memo({
    required this.title,
    required this.detail,
    required this.createdDate,
    this.updateDate,
  });
}

// void test() {
//   Memo newMemo = Memo(
//       title: "new memo", detail: "go shopping", createdDate: DateTime.now());
//}
