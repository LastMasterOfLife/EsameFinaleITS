import 'package:esame_mad_flutter_23_25/colors.dart';
import 'package:flutter/material.dart';


class NeuBox extends StatelessWidget {
  final Widget child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bianco,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
                color: primary.withOpacity(0.2), //Colors.grey.shade500,
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(5, 10)
            ),
            BoxShadow(
                color:terziario.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(-2, -3)
            ),
          ]
      ),
      padding: const EdgeInsets.all(5),
      child: child,
    );
  }
}