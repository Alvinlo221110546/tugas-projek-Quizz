import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class DataCourse extends StatefulWidget {
  @override
  _DataCourseState createState() => _DataCourseState();
}


class _DataCourseState extends State {

  final String downloadLink = "https://UPPSKILL.com";

  void _shareLink() async {
    try {
      String message = 'Download our app using this link: $downloadLink';
      await Share.share(message);
    } catch (error) {
      print('Error sharing link: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sharing link: $error')),
      );
    }
  }

  void _copyLink() {
    Clipboard.setData(ClipboardData(text: downloadLink));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Download link copied to clipboard!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.purple,
        title: Text('Data Analysis Course', style: TextStyle(color: Colors.white)),
      actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              switch (result) {
                case 'Copy Link':
                  _copyLink();
                  break;
                case 'Share Link':
                  _shareLink();
                  break;
                
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Copy Link',
                child: ListTile(
                  leading: Icon(Icons.copy),
                  title: Text('Copy Link'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Share Link',
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Share Link'),
                ),
              ),
              
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              YoutubePlayerWidget('https://www.youtube.com/watch?v=CaqJ65CIoMw'),
              SizedBox(height: 20),
              EpisodeListItem(
                episodeTitle: 'Episode 1: Introduction to Data Analysis',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => YoutubePlayerWidget('https://www.youtube.com/watch?v=yZvFH7B6gKI')));
                },
              ),
              EpisodeListItem(
                episodeTitle: 'Episode 2: Scrapping Data Using Python',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => YoutubePlayerWidget('https://www.youtube.com/watch?v=aClnnoQK9G0&list=PLQOGKy2nPhxnJ6bOB9ELnEev91K6Lcix6')));
                },
              ),
              EpisodeListItem(
                episodeTitle: 'Episode 3: Data Cleaning and Analysis',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => YoutubePlayerWidget('https://www.youtube.com/watch?v=jxq4-KSB_OA')));
                },
              ),
              SizedBox(height: 20),
              Text(
                'User Reviews   (237)',
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

class YoutubePlayerWidget extends StatelessWidget {
  final String url;

  YoutubePlayerWidget(this.url);

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId(url);

    if (videoId == null) {
      return Text('Invalid YouTube URL');
    }

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: videoId,
          flags: YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        ),
        showVideoProgressIndicator: true,
      ),
      builder: (context, player) {
        return Column(
          children: [
            player,
          ],
        );
      },
    );
  }
}
