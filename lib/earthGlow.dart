import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_engine.dart';
import 'package:particles_flutter/component/particle/particle.dart';

class EarthGlowWidget extends StatefulWidget {
  @override
  _EarthGlowWidgetState createState() => _EarthGlowWidgetState();
}

class _EarthGlowWidgetState extends State<EarthGlowWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            // borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 9, 10, 25),
                blurRadius: 50,
                spreadRadius: 10,
                blurStyle: BlurStyle.normal,
              ),
            ],
          ),
          child: Stack(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: Image.asset(
                    'assets/images/earth_two.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Particles(
                connectDots: true,
                particles: [
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(2, 5)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(1, 3)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(5, 5)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(6, 4)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(2, 5)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(3, 3)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(7, 5)),
                  Particle(
                    color: Colors.cyan,
                    size: 5,
                    velocity: Offset(0.4, 4),
                  ),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(5, 5)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(6, 4)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(2, 5)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(3, 3)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(7, 5)),
                  Particle(
                    color: Colors.cyan,
                    size: 5,
                    velocity: Offset(-0.4, 4),
                  ),
                  Particle(
                    color: Colors.cyan,
                    size: 5,
                    velocity: Offset(10, -5),
                  ),
                  Particle(
                    color: Colors.cyan,
                    size: 5,
                    velocity: Offset(11, 3),
                  ),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(8, 5)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(6, 4)),
                  Particle(
                    color: Colors.cyan,
                    size: 5,
                    velocity: Offset(20, 5),
                  ),

                  Particle(
                    color: const Color.fromARGB(255, 0, 81, 212),
                    size: 5,
                    velocity: Offset(2, 5),
                  ),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(1, 3)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(5, 5)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(6, 4)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(2, 5)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(3, 3)),
                  Particle(color: Colors.cyan, size: 5, velocity: Offset(7, 5)),
                ],

                height: 300,
                width: 350,
                enableHover: true,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: Image.asset(
                    'assets/images/earth_three.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
