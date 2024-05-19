
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class OfficeCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.purple,      
        title: Text('Office Course',style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<String?>(
                future: Future.value(YoutubePlayer.convertUrlToId(
                    'https://youtu.be/gPBhGkBN30s?si=VEEenM8DGvL05X73')), //Link Video course youtube
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
              // Bagian Daftar Episode
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      'Episode 1: Introduction to Office Tools',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        print('https://www.youtube.com/watch?v=ighIUg4WfTA&pp=ygUdbWlrcm9zb2Z0IG9mZmljZSBpbnRyb2R1Y3Rpb24%3D');
                      },
                      child: Text('Watch Now',
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                    ),
                  ),
                  Divider(),
                  
                  ListTile(
                    title: Text(
                      'Episode 2: Excel Basics',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        print('https://www.youtube.com/watch?v=6WgvzCU3TI8');
                      },
                      child: Text('Watch Now',
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                    ),
                  ),
                  Divider(),
                      ListTile(
                    title: Text(
                      'Episode 3: Word Formatting',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        print('https://www.youtube.com/watch?v=Fvrtt0h84Mg');
                      },
                      child: Text('Watch Now',
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                  'User Reviews   (653)',
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
                  review: 'This is so cool, maybe could use some improvements.',
                ),
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
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: () {
            String review = _controller.text.trim();
            if (review.isNotEmpty) {
              print('Review submitted: $review');
              _controller.clear();
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text('Please write your review before submitting.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
          child: Text('Submit Review',
              style: TextStyle(fontSize: 14, color: Colors.white)),
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


