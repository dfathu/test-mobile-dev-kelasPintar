import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_kelas_pintar_mobile/shared/theme.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 16, left: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kShadowColor.withOpacity(0.25),
                      offset: const Offset(
                        2.0,
                        2.0,
                      ),
                      blurRadius: 5.0,
                    ),
                  ],
                  color: kGreyColor,
                  borderRadius: BorderRadius.circular(defaultRadius)),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/camera');
                },
                icon: SvgPicture.asset('assets/icons/icon-camera.svg'),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'John Doe',
                style: blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Kelas 10 IPA 8',
                style:
                    blackTextStyle.copyWith(fontSize: 12, fontWeight: regular),
              ),
            ])
          ],
        ),
      );
    }

    Widget component() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin + 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: kPrimaryColor,
        ),
        height: 196,
        width: MediaQuery.of(context).size.width,
      );
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: AppBar(
            title: Text('Profile',
                style: GoogleFonts.nunito(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w700)),
            leading: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/Vector.svg')),
          ),
        ),
        body: ListView(
          children: [
            header(),
            SizedBox(height: 16),
            component(),
            SizedBox(height: 16),
            component(),
            SizedBox(height: 16),
            component(),
            SizedBox(height: 16),
            component(),
            SizedBox(height: 16),
          ],
        ));
  }
}
