import 'package:burclar/burcdetay.dart';
import 'package:flutter/material.dart';
import 'burc.dart';
import 'burcozellik.dart';

class Burclist extends StatelessWidget {
  final Burc listelenenBurc;
  const Burclist({required this.listelenenBurc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Colors.pink.shade100,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => burcdetay(secilenBurc: listelenenBurc),
                ),
              );
            },
            leading: Image.asset(
              "image/" + listelenenBurc.resim,
            ),
            title: Text(
              listelenenBurc.burcadi,
              style: myTextStyle.headline5,
            ),
            subtitle: Text(
              listelenenBurc.burctarihi,
              style: myTextStyle.subtitle1,
            ),
            trailing: Icon(
              Icons.arrow_circle_right,
              color: Colors.pinkAccent,
            ),
          ),
        ),
      ),
    );
  }
}
