import 'package:appjam_29th/core/utils/theme/icon.dart';
import 'package:appjam_29th/presentation/views/auth/auth_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  );

  late final CurvedAnimation _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCirc,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
    Future.delayed(
      Duration(milliseconds: 950),
      () => Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => AuthPage(),
          transitionsBuilder: (_, a, __, c) => FadeTransition(
            opacity: a,
            child: c,
          ),
          transitionDuration: Duration(milliseconds: 1000),
        ),
        (_) => false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, build) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Transform.translate(
              offset: Offset(0, -80 + 80 * _animation.value),
              child: Opacity(
                opacity: _controller.value,
                child: Hero(
                  tag: 'logo',
                  child: AppIcon.logo(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
