import 'package:flutter/material.dart';
import '../../widgets/afc_equipment_view.dart';
import '../../widgets/component/header.dart';
import '../../widgets/component/footer.dart';

// AFC Equipments
class SubProduct1Screen extends StatelessWidget {
  const SubProduct1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // Header (Includes navigation bar)
          Header(),

          // Main content (About Us View)
          Expanded(
            child: AfcEquipmentView(), // Integrate the AboutUsView here
          ),

          // Footer
          Footer(),
        ],
      ),
    );
  }
}
