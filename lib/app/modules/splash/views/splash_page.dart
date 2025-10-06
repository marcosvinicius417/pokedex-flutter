import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/themes/color_theme.dart';
import '../controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  final SplashController controller = Modular.get<SplashController>();
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    controller.initApp();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ColorsTheme.pokeballRed, ColorsTheme.pokeballWhite],
              ),
            ),
          ),

          Center(
            child: Opacity(
              opacity: 0.15,
              child: Transform.scale(
                scale: 3,
                child: SvgPicture.asset(
                  'assets/images/pokeball.svg',
                  colorFilter: ColorFilter.mode(
                    ColorsTheme.pokeballRed.withAlpha(38),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedBuilder(
                  animation: animationController,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: animationController.value * 2 * math.pi,
                      child: child,
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/images/pokeball.svg',
                    height: size.width * 0.35,
                    colorFilter: const ColorFilter.mode(
                      ColorsTheme.pokeballRed,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    ColorsTheme.pokeballRed,
                  ),
                  strokeWidth: 4,
                ),
                const SizedBox(height: 20),
                Text(
                  'Carregando Pokédex...',
                  style: TextStyle(
                    color: ColorsTheme.primaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
