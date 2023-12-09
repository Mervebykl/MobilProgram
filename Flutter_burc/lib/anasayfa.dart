import 'package:burclar/BurcListesi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:burclar/yorumlar.dart';
import 'package:burclar/burcozellik.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var url = Uri.parse(
      "https://www.ntv.com.tr/galeri/astroloji-ve-burclar/gunluk-burc-yorumlari-13-aralik-2022,JGh_5iLwcUy6ITBgiAeBtQ/Mq-J5Xl5MEm1BB3m4E3b1Q");
  List<Yorumlar> yorumlar = [];
  bool isLoading = false;
  Future getData() async {
    setState(() {
      isLoading = true;
    });
    var res = await http.get(url);
    final body = res.body;
    final document = parser.parse(body);
    var response = document
        .getElementsByClassName("category-detail-left")[0]
        .getElementsByClassName("card card--gallery category-detail-large-card")
        .forEach((element) {
      setState(() {
        yorumlar.add(
          Yorumlar(
            yorum: element.children[1].text.toString(),
          ),
        );
      });
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  final sayfalar = [
    BurcListesi(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('             GÜNLÜK BURÇ YORUMLARI'),
        backgroundColor: Colors.pink.shade500,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3),
                itemCount: yorumlar.length,
                itemBuilder: (context, index) => Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 3,
                  color: Colors.pink.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          " ${yorumlar[index].yorum}",
                          style: _style,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  final TextStyle _style = const TextStyle(color: Colors.white, fontSize: 15);
}
