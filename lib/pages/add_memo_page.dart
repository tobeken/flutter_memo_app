import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memoapp/pages/top_page.dart';

class AddMemoPage extends StatefulWidget {
  const AddMemoPage({super.key});

  @override
  State<AddMemoPage> createState() => _AddMemoPageState();
}

class _AddMemoPageState extends State<AddMemoPage> {
  //inputの状態管理
  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();

//memoの追加
  Future<void> createMemo() async {
    final memoCollection = FirebaseFirestore.instance.collection('memo');
    memoCollection.add({
      'title': titleController.text,
      'detail': detailController.text,
      'createdDate': Timestamp.now()
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("memo add"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text('Title'),
            const SizedBox(
              height: 20,
            ),
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10)),
                )),
            //detail
            const SizedBox(
              height: 20,
            ),
            const Text('Detail'),
            const SizedBox(
              height: 20,
            ),
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: detailController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10)),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () async {
                    //memo add function
                    await createMemo();
                    Navigator.pop(context);
                  },
                  child: const Text("Add")),
            )
          ],
        ),
      ),
    );
  }
}
