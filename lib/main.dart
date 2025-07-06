import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: '2B Uzam', home: const MyMapWidget());
  }
}

// StatefulWidget kullanarak ekran güncellemelerini kontrol ediyoruz
class MyMapWidget extends StatefulWidget {
  const MyMapWidget({super.key});

  @override
  State<MyMapWidget> createState() => _MyMapWidgetState();
}

class _MyMapWidgetState extends State<MyMapWidget> {
  // Her kutunun rengini tutan değişkenler
  Color okulRengi = Colors.blue;
  Color kutuphaneRengi = Colors.red;
  Color yemekhaneRengi = Colors.yellow;

  // Okul kutusuna tıklanınca çalışan fonksiyon
  void okulTikladi() {
    print("Okula tıkladın!");

    // Açıklama kutusu (popup) göster
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Okul"),
          content: const Text(
            "Bu binanın içinde sınıflar ve öğretmenler odası vardır.",
          ),
          actions: [
            TextButton(
              child: const Text("Kapat"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );

    // Rengi değiştir (mavi ↔ gri)
    setState(() {
      okulRengi = okulRengi == Colors.blue ? Colors.grey : Colors.blue;
    });
  }

  // Kütüphane kutusuna tıklanınca çalışan fonksiyon
  void kutuphaneTikladi() {
    print("Kütüphaneye tıkladın!");

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Kütüphane"),
          content: const Text("Burada öğrenciler sessizce ders çalışır."),
          actions: [
            TextButton(
              child: const Text("Kapat"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );

    setState(() {
      kutuphaneRengi = kutuphaneRengi == Colors.red ? Colors.grey : Colors.red;
    });
  }

  // Yemekhane kutusuna tıklanınca çalışan fonksiyon
  void yemekhaneTikladi() {
    print("Yemekhaneye tıkladın!");

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Yemekhane"),
          content: const Text("Burada öğretmenler ve öğrenciler yemek yer."),
          actions: [
            TextButton(
              child: const Text("Kapat"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );

    setState(() {
      yemekhaneRengi = yemekhaneRengi == Colors.yellow
          ? Colors.grey
          : Colors.yellow;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ekranın genişlik ve yüksekliğini al
    final ekran = MediaQuery.of(context).size;
    final genislik = ekran.width;
    final yukseklik = ekran.height;

    return Scaffold(
      body: Stack(
        children: [
          // Zemin (arka plan)
          Container(color: Colors.green[100]),

          // Okul kutusu – sol üst
          Positioned(
            left: genislik * 0.1,
            top: yukseklik * 0.1,
            child: GestureDetector(
              onTap: okulTikladi,
              child: Container(
                width: genislik * 0.3,
                height: yukseklik * 0.4,
                color: okulRengi,
                child: const Center(
                  child: Text("Okul", style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ),

          // Kütüphane kutusu – sağ alt
          Positioned(
            left: genislik * 0.5,
            top: yukseklik * 0.7,
            child: GestureDetector(
              onTap: kutuphaneTikladi,
              child: Container(
                width: genislik * 0.4,
                height: yukseklik * 0.15,
                color: kutuphaneRengi,
                child: const Center(
                  child: Text("Kütüphane", style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ),

          // Yemekhane kutusu – sağ orta
          Positioned(
            left: genislik * 0.6,
            top: yukseklik * 0.3,
            child: GestureDetector(
              onTap: yemekhaneTikladi,
              child: Container(
                width: genislik * 0.25,
                height: yukseklik * 0.4,
                color: yemekhaneRengi,
                child: const Center(
                  child: Text("Yemekhane", style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
