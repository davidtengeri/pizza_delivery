import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pizza_delivery/profile/profile_repository.dart';
import 'package:pizza_delivery/profile/take_profile_picture.dart';
import 'package:provider/provider.dart';

class ProfilePicture extends StatefulWidget {
  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  File image;

  @override
  void initState() {
    super.initState();
    initImage();
  }

  Future<void> initImage() async {
    final path = join(
      // Store the picture in the temp directory.
      // Find the temp directory using the `path_provider` plugin.
      (await getApplicationDocumentsDirectory()).path,
      'profilePicture.png',
    );
    final file = File(path);
    if (file.existsSync()) {
      setState(() {
        image = file;
      });
    }
  }

  void setImage(File newImage) {
    setState(() {
      image = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('building');
    print(image?.path);
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            color: Theme.of(context).primaryColor,
          ),
          child: CircleAvatar(
              radius: 70,
              backgroundImage: image?.existsSync() == true
                  ? Image.memory(
                      image.readAsBytesSync(),
                      fit: BoxFit.fill,
                    ).image
                  : null,
              child: image?.existsSync() != true
                  ? SvgPicture.asset(
                      'images/unknown.svg',
                      fit: BoxFit.fill,
                    )
                  : null),
        ),
        Positioned(
          child: GestureDetector(
            child: Icon(Icons.photo_camera),
            onTap: () async {
              File newImage = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TakeProfilePictureScreen(),
                ),
              );
              setImage(newImage);
            },
          ),
          right: 0,
          bottom: 0,
        ),
      ],
    );
  }
}
