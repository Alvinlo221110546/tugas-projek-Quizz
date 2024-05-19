import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xE2F4C5),
          title: Row(
            children: [
              Image.asset(
                'assets/UPSKILL.png',
                width: 120, // Adjust the image size accordingly
                height: 190,
              ),
              SizedBox(
                width: 20, // Adding some space between the image and text
              ),
              Text(
                'Kategori',
                style: TextStyle(fontSize: 15),
              ), // Text widget for the title
            ],
          ),
          actions: [
            Builder(
              builder: (context) => Row(
                children: [
                  Container(
                    width: 700,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20, // Adding some space between the text and icon
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman "Perpustakaan saya"
                    },
                    child: Text(
                      'Perpustakaan saya',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 20, // Adding some space between the text and icon
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman "Mengajar di UPSKILL"
                    },
                    child: Text(
                      'Mengajar di UPSKILL',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 20, // Adding some space between the text and icon
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle navigation to favorite page
                    },
                    icon: Icon(Icons.favorite, color: Colors.black),
                  ),
                  SizedBox(
                    width:
                        20, // Adding some space between the icon and other icons
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle navigation to shopping cart page
                    },
                    icon: Icon(Icons.shopping_cart, color: Colors.black),
                  ),
                  SizedBox(
                    width:
                        20, // Adding some space between the icon and other icons
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle navigation to notifications page
                    },
                    icon: Icon(Icons.notifications, color: Colors.black),
                  ),
                  SizedBox(
                    width:
                        20, // Adding some space between the icon and other icons
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle navigation to profile page
                    },
                    icon: Icon(Icons.person, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xA8CD9F),
                  height: 50,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Bisnis"
                          },
                          child: Text("Bisnis"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Keuangan & Akuntansi"
                          },
                          child: Text("Keuangan & Akuntansi"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Komputer & IT"
                          },
                          child: Text("Komputer & IT"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Sistem Perkantoran"
                          },
                          child: Text("Sistem Perkantoran"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Pengembangan Diri"
                          },
                          child: Text("Pengembangan Diri"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Desain"
                          },
                          child: Text("Desain"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Marketing"
                          },
                          child: Text("Marketing"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Kesehatan & Fitness"
                          },
                          child: Text("Kesehatan & Fitness"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Musik"
                          },
                          child: Text("Musik"),
                        ),
                      ],
                    ),
                  ),
                ),
                //video course
                SizedBox(height: 20),
                FutureBuilder<String?>(
                  future: Future.value(YoutubePlayer.convertUrlToId(
                      'https://www.youtube.com/live/nkNHn0VqVBA?si=WjM6KD1sxtIbxUYF')), //Link Video course youtube
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final videoId = snapshot.data;
                      if (videoId != null && videoId.isNotEmpty) {
                        return YoutubePlayer(
                          controller: YoutubePlayerController(
                            initialVideoId: videoId,
                            flags: YoutubePlayerFlags(
                              autoPlay: false,
                              mute: false,
                            ),
                          ),
                          showVideoProgressIndicator: true,
                        );
                      } else {
                        return Text('Invalid YouTube URL');
                      }
                    }
                  },
                ),
                // bagian episode
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Nonton Video',
                          style: TextStyle(
                              fontSize:
                                  20), // Ubah ukuran teks menjadi lebih besar
                        ),
                        Spacer(), // Widget Spacer untuk mengisi ruang kosong
                        ElevatedButton(
                          onPressed: () {
                            // Logika ketika tombol 'Nonton Video' ditekan
                          },
                          child: Text('here'),
                        ),
                      ],
                    ),
                    Divider(), // Garis pembatas
                    Row(
                      children: [
                        Text(
                          'Kuis',
                          style: TextStyle(
                              fontSize:
                                  20), // Ubah ukuran teks menjadi lebih besar
                        ),
                        Spacer(), // Widget Spacer untuk mengisi ruang kosong
                        ElevatedButton(
                          onPressed: () {
                            // Logika ketika tombol 'Kuis' ditekan
                          },
                          child: Text('here'),
                        ),
                      ],
                    ),

                    //user review
                    SizedBox(height: 20),
                    Text(
                      'User Reviews   (767)',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    UserReview(
                      username: 'John Doe',
                      rating: 4,
                      review: 'Thanks Bud, very useful!',
                    ),
                    UserReview(
                      username: 'Alice Smith',
                      rating: 5,
                      review: 'Excellent experience, highly recommend!',
                    ),
                    UserReview(
                      username: 'Bob Johnson',
                      rating: 3,
                      review:
                          'this so cool maybe, could use some improvements.',
                    ),
                    // Textbox untuk menulis review
                    SizedBox(height: 20),
                    Text(
                      'Write your review:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ReviewTextBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserReview extends StatelessWidget {
  final String username;
  final int rating;
  final String review;

  const UserReview({
    Key? key,
    required this.username,
    required this.rating,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                // Icon pengguna berbentuk lingkaran
                child: Icon(Icons.person),
              ),
              SizedBox(width: 10),
              Text(
                username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.yellow,
              ),
            ),
          ),
          //review
          SizedBox(height: 5),
          Text(review),
        ],
      ),
    );
  }
}

class ReviewTextBox extends StatefulWidget {
  @override
  _ReviewTextBoxState createState() => _ReviewTextBoxState();
}

class _ReviewTextBoxState extends State<ReviewTextBox> {
  final TextEditingController _controller = TextEditingController();

//Bagian Review
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'Write your review here...',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            String review = _controller.text;
            print('Review submitted: $review');
            // Implement your logic here to handle the submitted review
            // For example, you can send the review to a server or save it locally.
            _controller.clear();
          },
          child: Text('Submit Review'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
