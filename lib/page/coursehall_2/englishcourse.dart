import 'package:flutter/material.dart';
import 'package:quizz/page/coursehall_2/accounting.dart';
import 'package:quizz/page/link.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EnglishCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.purple,      
        title: Text('English Course',style: TextStyle(color: Colors.white)),actions: [IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LinkPage()));}, icon: Icon(Icons.share))]
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                FutureBuilder<String?>(
                  future: Future.value(YoutubePlayer.convertUrlToId(
                      'https://youtu.be/lhFU5H5KPFE?si=ET7Sm1guFwdSHN58')),
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
                SizedBox(height: 20),
              
                EpisodeListItem(
                  episodeTitle: 'Episode 1: Introduction to Grammar',
                  onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => YoutubePlayerWidget('https://www.youtube.com/watch?v=O-6q-siuMik')));
                  },
                ),
                EpisodeListItem(
                  episodeTitle: 'Episode 2: Simple Present Tense',
                  onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => YoutubePlayerWidget('https://www.youtube.com/watch?v=i4rv6dgh_nY')));
                  },
                ),
                EpisodeListItem(
                  episodeTitle: 'Episode 3: Past Tense',
                  onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => YoutubePlayerWidget('https://www.youtube.com/watch?v=CApPEgntWag')));
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'User Reviews   (347)',
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

class EpisodeListItem extends StatelessWidget {
  final String episodeTitle;
  final VoidCallback onPressed;

  const EpisodeListItem({
    Key? key,
    required this.episodeTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.play_arrow),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                episodeTitle,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
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
                style: TextStyle(fontWeight: FontWeight.bold),
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
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
          onPressed: () {
            String review = _controller.text;
            print('Review submitted: $review');
            
            _controller.clear();
          },
          child: Text('Submit Review', style: TextStyle(color: Colors.white)),
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
