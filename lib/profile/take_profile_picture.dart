import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pizza_delivery/camera_manager.dart';
import 'package:pizza_delivery/l10n/pizza_delivery_localizations.dart';
import 'package:provider/provider.dart';

class TakeProfilePictureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CameraDescription>(
      builder: (context, camera, child) => TakeProfilePicture(camera: camera),
    );
  }
}

class TakeProfilePicture extends StatefulWidget {
  final CameraDescription camera;

  TakeProfilePicture({
    Key key,
    this.camera,
  }) : super(key: key);

  @override
  _TakeProfilePictureState createState() => _TakeProfilePictureState();
}

class _TakeProfilePictureState extends State<TakeProfilePicture> {
  Future<void> _initializeControllerFuture;
  CameraManager cameraManager;

  void initState() {
    super.initState();

    cameraManager = CameraManager(camera: widget.camera);

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = cameraManager.initialize();
  }

  @override
  void dispose() {
    cameraManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PizzaDeliveryLocalizations.of(context).takeAPicture),
      ),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(cameraManager.cameraController);
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Construct the path where the image should be saved using the
            // pattern package.
            final path = join(
              // Store the picture in the temp directory.
              // Find the temp directory using the `path_provider` plugin.
              (await getApplicationDocumentsDirectory()).path,
              'profilePicture.png',
            );
            final file = File(path);
            if (file.existsSync()) {
              file.deleteSync();
            }
            // Attempt to take a picture and log where it's been saved.
            await cameraManager.cameraController.takePicture(path);

            // If the picture was taken, display it on a new screen.
            Navigator.pop(context, file);
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
      ),
    );
  }
}
