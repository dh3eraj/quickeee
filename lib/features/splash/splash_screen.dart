import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:quickeee/configs/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.flashDrop,
          (routes) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            'Quickeee',
            style: GoogleFonts.lato(
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
