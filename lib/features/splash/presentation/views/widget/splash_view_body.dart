import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
    required this.slideController,
  });

  final Animation<Offset> slideController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffFDB7F2),
            Color(0xff94DDD6),
            Color(0xffA2C9F6),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: AnimatedBuilder(
            animation: slideController,
            builder: (context, _) {
              return SlideTransition(
                position: slideController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/splash.png',
                    ),
                    Text(
                      'Differnt World',
                      style: GoogleFonts.montserrat(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Autism children',
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
