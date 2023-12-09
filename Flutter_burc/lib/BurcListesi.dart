import 'package:burclar/burc.dart';
import 'package:burclar/burclisttt.dart';
import 'package:burclar/burcozellik.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> burclar = veriKaynaginiHazirla();
  burclistesi() {
    burclar = veriKaynaginiHazirla();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade500,
        title: Text('Burçlar Listesi'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Burclist(listelenenBurc: burclar[index]);
          },
          itemCount: burclar.length,
        ),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];

    for (int i = 0; i < 12; i++) {
      var burcAdi = BurcOzellik.Burc_ad[i];
      var burcTarih = BurcOzellik.Burc_tarih[i];
      var burcDetay = BurcOzellik.Burc_ozellik[i];
      var burcKucukResim = BurcOzellik.Burc_resim[i];
      var burcBuyukResim = BurcOzellik.Burc_resim[i];
      Burc eklenecekBurc = Burc(burcAdi, burcTarih, burcDetay, burcKucukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
