import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F6E3),
        title: Image.asset(
          'assets/UPSKILL.png',
          width: 150, // Atur lebar gambar UPSKILL pada app bar
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/Mentor.jpg'), // Gunakan gambar sebagai latar belakang
            fit: BoxFit.cover, // Sesuaikan gambar agar terisi seluruh layar
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20), // Spasi antara gambar dan container
                Container(
                  padding: EdgeInsets.all(
                      20), // Padding untuk konten dalam container
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEDEB), // Memberi warna latar belakang
                    borderRadius: BorderRadius.circular(
                        10), // Mengatur radius border container
                  ),
                  width: 500, // Lebar container
                  height: 500, // Tinggi container
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ola!',
                        style: TextStyle(
                          fontSize: 50, // Ukuran font teks
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Tidak ada batasan untuk apa yang dapat kamu capai ketika kamu berani belajar dengan tekun dan semangat yang tak tergoyahkan. Setiap kata, setiap halaman, dan setiap tantangan adalah langkah maju menuju versi terbaik dari dirimu. ',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20), // Spasi antara teks dan field input
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Username', // Label untuk input username
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ), // Mengatur border input
                        ),
                      ),
                      SizedBox(
                          height:
                              20), // Spasi antara input username dan password
                      TextField(
                        obscureText: true, // Untuk menyembunyikan teks password
                        decoration: InputDecoration(
                          labelText: 'Password', // Label untuk input password
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ), // Mengatur border input
                        ),
                      ),
                      SizedBox(
                          height:
                              20), // Spasi antara input password dan tombol login
                      ElevatedButton(
                        onPressed: () {
                          // Tindakan ketika tombol login ditekan
                          // Misalnya, verifikasi username dan password
                        },
                        child: Text('Login'), // Teks pada tombol login
                      ),
                      SizedBox(height: 50),
                      Divider(
                        color: Colors.grey, // Warna garis horizontal
                        thickness: 1, // Ketebalan garis horizontal
                      ),

                      // Spasi antara tombol login dan tombol sign up
                      ElevatedButton(
                        onPressed: () {
                          // Tindakan ketika tombol sign up ditekan
                          // Misalnya, navigasi ke halaman pendaftaran
                        },
                        child: Text('Sign Up'), // Teks pada tombol sign up
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ));
}
