import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_kelas_pintar_mobile/shared/theme.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Widget kotakImage() {
      if (image != null) {
        Container(
          margin: EdgeInsets.only(
              top: defaultMargin + 1,
              right: defaultMargin + 1,
              left: defaultMargin + 1),
          width: screenWidth,
          height: 343,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(defaultMargin)),
          child: Image.file(
            image!,
            width: screenWidth,
            height: 343,
          ),
        );
        return Image.file(
          image!,
          width: screenWidth,
          height: 343,
        );
      }
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin + 1,
            right: defaultMargin + 1,
            left: defaultMargin + 1),
        width: screenWidth,
        height: 343,
        decoration: BoxDecoration(
            color: kGreyColor,
            borderRadius: BorderRadius.circular(defaultMargin)),
      );
    }

    Widget buttonGalery() {
      return Container(
        margin: EdgeInsets.only(
            top: 16, right: defaultMargin + 2, left: defaultMargin + 2),
        width: screenWidth,
        height: 40,
        child: TextButton(
          onPressed: () => pickImage(ImageSource.gallery),
          style: TextButton.styleFrom(
              backgroundColor: kGreenColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius))),
          child: Text(
            'Ambil dari Gallery',
            style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
          ),
        ),
      );
    }

    Widget buttonCamera() {
      return Container(
        margin: EdgeInsets.only(
            top: 34, right: defaultMargin + 2, left: defaultMargin + 2),
        width: screenWidth,
        height: 40,
        child: TextButton(
          onPressed: () => pickImage(ImageSource.camera),
          style: TextButton.styleFrom(
              backgroundColor: kGreenColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius))),
          child: Text(
            'Ambil dari Camera',
            style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
          ),
        ),
      );
    }

    Widget buttonSimpan() {
      return Container(
        width: screenWidth,
        height: 40,
        child: TextButton(
          onPressed: null,
          style: TextButton.styleFrom(
            backgroundColor: image == null ? kGreyColor : kGreenColor,
          ),
          child: Text(
            'Simpan',
            style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: AppBar(
            title: Text('Ganti Foto Profil',
                style: whiteTextStyle.copyWith(fontSize: 24, fontWeight: bold)),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset('assets/icons/Vector.svg')),
          ),
        ),
        body: ListView(
          children: [
            kotakImage(),
            buttonCamera(),
            buttonGalery(),
            SizedBox(
              height: 190,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: buttonSimpan(),
            )
          ],
        ));
  }
}
