import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final _formKey = GlobalKey<FormState>();

  List<String> names = ["John", "Sarah", "Michael", "Emily", "David", "Alice"];
  List<String> additionalInfo = [
    "Spesialis dalam pengembangan perangkat lunak dengan fokus pada aplikasi web. Memiliki keahlian dalam bahasa pemrograman seperti JavaScript, Python, dan Ruby on Rails.",
    "Ahli dalam analisis data dan kecerdasan buatan. Berpengalaman dalam menggunakan algoritma machine learning untuk memecahkan masalah kompleks dalam berbagai industri.",
    "Pakar keamanan cyber dengan pemahaman mendalam tentang serangan siber dan teknik pertahanan. Berdedikasi untuk menjaga keamanan data dan sistem informasi.",
    "Ahli jaringan komputer dengan pengalaman dalam merancang dan mengelola infrastruktur TI skala besar. Mengutamakan kinerja dan kehandalan dalam setiap implementasi.",
    "Spesialis UX/UI dengan fokus pada pengalaman pengguna yang intuitif dan menarik. Memiliki keahlian dalam desain antarmuka untuk aplikasi web dan mobile.",
    "Pengembang permainan dan aplikasi multimedia dengan visi kreatif yang unik. Menggabungkan teknologi informatika dengan seni untuk menciptakan pengalaman yang menarik."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          "About Us",
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  "${names[index]}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  "${additionalInfo[index]}\n",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
