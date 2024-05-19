import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Quiz Score', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Score :',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            FaqItem(question: "Computer & IT", answers: [
              ScoreInfoItem(
                icon: Icons.not_interested,
                label: 'No Quiz Were Made ',
                value: '',
              ),
            ]),
            FaqItem(question: "Mathematic", answers: [
              ScoreInfoItem(
                icon: Icons.onetwothree,
                label: 'Linear - Zero to God',
                value: '75 / 100',
              ),
              ScoreInfoItem(
                icon: Icons.onetwothree,
                label: 'Perhitungan Bangun Ruang',
                value: '100 / 100',
              )
            ]),
            FaqItem(question: "Science", answers: [
              ScoreInfoItem(
                icon: Icons.science,
                label: 'Biology Advance - Human to God',
                value: '45 / 100',
              ),
              ScoreInfoItem(
                icon: Icons.science,
                label: 'Pengetahuan Umum Science',
                value: '60 / 100',
              ),
            ]),
            FaqItem(question: "English", answers: [
              ScoreInfoItem(
                icon: Icons.book,
                label: 'English - Elementry Level',
                value: '95 / 100',
              ),
              ScoreInfoItem(
                icon: Icons.book,
                label: 'C1 English Quiz',
                value: '100 / 100',
              ),
            ]),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ScoreInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ScoreInfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30.0,
            color: Colors.purple,
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FaqItem extends StatefulWidget {
  final String question;
  final List<Widget> answers; // Accepts a list of Widgets

  const FaqItem({
    Key? key,
    required this.question,
    required this.answers,
  }) : super(key: key);

  @override
  _FaqItemState createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.answers.map((answer) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: answer,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
