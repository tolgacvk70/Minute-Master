import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bouncing_widget.dart';

class StartScreen extends StatefulWidget {
  final VoidCallback onStartPressed;

  const StartScreen({
    super.key,
    required this.onStartPressed,
  });

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _sparkleController;
  late AnimationController _shapeController;
  late Animation<double> _titleAnimation;

  // Color palette
  static const Color primaryCoral = Color(0xFFFF6F61);
  static const Color secondaryViolet = Color(0xFF6B5B95);
  static const Color accentYellow = Color(0xFFFFD700);
  static const Color accentMint = Color(0xFF3DDC97);
  static const Color bgBlue = Color(0xFF1E90FF);
  static const Color bgCyan = Color(0xFF3DDCFF);

  @override
  void initState() {
    super.initState();
    
    // Title bounce animation
    _titleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _titleAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _titleController, curve: Curves.easeInOut),
    );

    // Sparkle animation
    _sparkleController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    // Floating shapes animation
    _shapeController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _sparkleController.dispose();
    _shapeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [bgBlue, bgCyan],
              ),
            ),
          ),

          // Floating abstract shapes
          ..._buildFloatingShapes(),

          // Sparkles/confetti effect
          ..._buildSparkles(),

          // Main content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),

                  // App Title with multi-color outline effect
                  AnimatedBuilder(
                    animation: _titleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _titleAnimation.value,
                        child: child,
                      );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Outer glow
                        Text(
                          'MINUTE\nMASTER',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.righteous(
                            fontSize: 68,
                            fontWeight: FontWeight.w900,
                            height: 1.1,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 15
                              ..color = primaryCoral.withValues(alpha: _titleAnimation.value * 0.5),
                            shadows: [
                              Shadow(
                                color: primaryCoral.withValues(alpha: _titleAnimation.value),
                                blurRadius: 40,
                              ),
                              Shadow(
                                color: accentYellow.withValues(alpha: _titleAnimation.value * 0.7),
                                blurRadius: 60,
                              ),
                            ],
                          ),
                        ),
                        // Stroke
                        Text(
                          'MINUTE\nMASTER',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.righteous(
                            fontSize: 68,
                            fontWeight: FontWeight.w900,
                            height: 1.1,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = accentYellow,
                          ),
                        ),
                        // Fill
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              Colors.white,
                              accentYellow,
                              Colors.white,
                            ],
                          ).createShader(bounds),
                          child: Text(
                            'MINUTE\nMASTER',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.righteous(
                              fontSize: 68,
                              fontWeight: FontWeight.w900,
                              height: 1.1,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Subtext - größer und deutlicher
                  Text(
                    '60 Sekunden.\nEine Aufgabe.\n100% Chaos.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.5,
                      letterSpacing: 0.3,
                      shadows: [
                        Shadow(
                          offset: const Offset(2, 2),
                          blurRadius: 8,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                        Shadow(
                          offset: const Offset(0, 0),
                          blurRadius: 4,
                          color: Colors.black.withValues(alpha: 0.3),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(flex: 4),

                  // Primary Button
                  BouncingWidget(
                    child: Container(
                      width: 220,
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [accentYellow, Color(0xFFFFC700)],
                        ),
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                            color: accentYellow.withValues(alpha: 0.6),
                            blurRadius: 25,
                            offset: const Offset(0, 12),
                            spreadRadius: -5,
                          ),
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(35),
                          onTap: widget.onStartPressed,
                          child: Center(
                            child: Text(
                              'Spiel starten',
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(1, 1),
                                    blurRadius: 3,
                                    color: Colors.black.withValues(alpha: 0.2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Footer links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          // TODO: Navigate to rules
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white70,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                        child: Text(
                          'Regeln',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Text(
                        '•',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO: Navigate to settings
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white70,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                        child: Text(
                          'Einstellungen',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFloatingShapes() {
    return List.generate(6, (index) {
      final random = Random(index);
      final size = 60.0 + random.nextDouble() * 60;
      final colors = [primaryCoral, secondaryViolet, accentMint, accentYellow];
      final color = colors[index % colors.length].withValues(alpha: 0.25);

      return AnimatedBuilder(
        animation: _shapeController,
        builder: (context, child) {
          final progress = (_shapeController.value + index * 0.2) % 1.0;
          final angle = progress * 2 * pi;
          
          // Circular motion
          final x = 0.5 + 0.3 * cos(angle + index * pi / 3);
          final y = 0.5 + 0.3 * sin(angle + index * pi / 3);
          
          return Positioned(
            left: MediaQuery.of(context).size.width * x - size / 2,
            top: MediaQuery.of(context).size.height * y - size / 2,
            child: Transform.rotate(
              angle: progress * 2 * pi,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: color,
                  shape: index % 3 == 0 
                      ? BoxShape.circle 
                      : BoxShape.rectangle,
                  borderRadius: index % 3 != 0 
                      ? BorderRadius.circular(8) 
                      : null,
                ),
              ),
            ),
          );
        },
      );
    });
  }

  List<Widget> _buildSparkles() {
    return List.generate(20, (index) {
      final random = Random(index);
      final size = 6.0 + random.nextDouble() * 10;
      
      return AnimatedBuilder(
        animation: _sparkleController,
        builder: (context, child) {
          final progress = (_sparkleController.value + index * 0.1) % 1.0;
          final opacity = sin(progress * pi);
          
          final x = random.nextDouble();
          final y = random.nextDouble();
          
          // Abwechselnde Farben für mehr Sichtbarkeit
          final sparkleColors = [accentYellow, accentMint, Colors.white];
          final sparkleColor = sparkleColors[index % sparkleColors.length];
          
          return Positioned(
            left: MediaQuery.of(context).size.width * x,
            top: MediaQuery.of(context).size.height * y,
            child: Opacity(
              opacity: opacity * 0.9,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: sparkleColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: sparkleColor.withValues(alpha: 1.0),
                      blurRadius: 12,
                      spreadRadius: 3,
                    ),
                    BoxShadow(
                      color: sparkleColor.withValues(alpha: 0.6),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
