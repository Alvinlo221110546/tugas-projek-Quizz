import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/page/Mainmenu.dart';
import 'package:quizz/page/provider/providerUser.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeCamera();
    });
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final XFile? picture = await _controller?.takePicture();
      if (picture != null) {
        final bytes = await picture.readAsBytes();
        final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
        profileProvider.changeProfilePicture(0, bytes);
      }
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);
      _controller = CameraController(
        frontCamera,
        ResolutionPreset.medium,
        enableAudio: false,
      );
      _initializeControllerFuture = _controller?.initialize();
      setState(() {});
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          iconSize: 40, 
          icon: Icon(Icons.close, color: Colors.white), 
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CameraPreview(_controller!),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Container(
        width: 80, 
        height: 80, 
        child: FloatingActionButton(
          onPressed: () async {
            await _takePicture();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainMenu()));
          },
          backgroundColor: Colors.purple, 
          child: Icon(Icons.camera_alt, size: 50, color: Colors.white), 
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}