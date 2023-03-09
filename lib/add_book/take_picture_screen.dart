import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({super.key});

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  final _titleappBar = 'tomar foto del libro';
  late CameraController _controllerCamera;
  Future<void> _initializeCamera() async {
    var cameraList = await availableCameras();
    _controllerCamera = CameraController(
      cameraList.first,
      ResolutionPreset.high,
    );
    return _controllerCamera.initialize();
  }

  @override
  void dispose() {
    _controllerCamera.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_titleappBar)),
        body: FutureBuilder<void>(
          future: _initializeCamera(),
          builder: (context, snapshot) => (snapshot.hasError)
              ? Center(
                  child: Text('ocurrió un error. ERROR: ${snapshot.error}'),
                )
              : snapshot.connectionState == ConnectionState.done
                  ? Container(
                      color: Colors.black,
                      child: Center(child: CameraPreview(_controllerCamera)))
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //TODO: take photo
          },
          child: const Icon(Icons.camera_alt),
        ));
  }
}
