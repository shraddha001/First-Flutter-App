import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeContentState();
  }
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              RawMaterialButton(
                constraints: const BoxConstraints(minHeight: 36, minWidth: 36),
                onPressed: () {},
                shape: const CircleBorder(
                  side: BorderSide(color: Colors.white, width: 2)
                ),
                fillColor: Colors.deepPurple,
                child: const Text(
                  'S',
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Suse-Medium'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
