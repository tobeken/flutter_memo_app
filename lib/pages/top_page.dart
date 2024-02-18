import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memoapp/model/memo.dart';
import 'package:memoapp/pages/add_memo_page.dart';
import 'package:memoapp/pages/memo_detail_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final memoCollection = FirebaseFirestore.instance.collection("memo");
  // List<Memo> memoList = [];

  // Future<void> fetchMemo() async {
  //   final memoCollection =
  //       await FirebaseFirestore.instance.collection('memo').get();
  //   final docs = memoCollection.docs;
  //   for (var doc in docs) {
  //     Memo fetchMemo = Memo(
  //       title: doc.data()['title'],
  //       detail: doc.data()['detail'],
  //       createdDate: doc.data()['createdDate'],
  //     );
  //     memoList.add(fetchMemo);
  //   }
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   fetchMemo();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("hello world"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: memoCollection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (!snapshot.hasData) {
              return const Center(child: Text("データがありません"));
            }
            final docs = snapshot.data!.docs;

            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data =
                      docs[index].data() as Map<String, dynamic>;
                  final Memo fetchMemo = Memo(
                      title: data['title'],
                      detail: data['detail'],
                      createdDate: data['createdDate'],
                      updateDate: data['updateDate']);

                  return ListTile(
                    title: Text(fetchMemo.title),
                    trailing: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SafeArea(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      onTap: () {},
                                      leading: const Icon(Icons.edit),
                                      title: const Text("edit"),
                                    ),
                                    ListTile(
                                      onTap: () {},
                                      leading: const Icon(Icons.delete),
                                      title: const Text("delete"),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MemoDetailPage(fetchMemo)));
                    },
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddMemoPage()));
        },
        tooltip: "increment",
        child: const Icon(Icons.add),
      ),
    );
  }
}
