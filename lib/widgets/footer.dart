import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(24.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Siam Infinity Solution CO., LTD. ( SIS )',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '111/2 Soi Ramkhamhaeng 94\nSaphan Sung, Bangkok 10240 Thailand',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Contact Us',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.email, color: Colors.white),
                  SizedBox(width: 8),
                  Text('sale@sissolution.co.th',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.white),
                  SizedBox(width: 8),
                  Text('02-001-0518', style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
