import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class TorchOnOff extends StatefulWidget {
  const TorchOnOff({super.key});

  @override
  State<TorchOnOff> createState() => _TorchOnOffState();
}

class _TorchOnOffState extends State<TorchOnOff> {
  final bgColor = const Color(0xff2c3333);
  final textColor = const Color(0xffE7F6F2);
  var isActive = false;
  var controller = TorchController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("TorchLight"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    isActive ? 'assets/torch_on1.png' : 'assets/torch_off.png',
                    width: 250,
                    height: 250,
                    color: isActive ? null : textColor.withOpacity(0.2),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  CircleAvatar(
                    minRadius: 30,
                    maxRadius: 40,
                    child: Transform.scale(
                      scale: 1.5,
                      child: IconButton(
                        icon: const Icon(Icons.power_settings_new),
                        onPressed: () {
                          controller.toggle();
                          isActive = !isActive;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            'Developed By Manish Sharma',
            style: TextStyle(color: textColor),
          ),
          SizedBox(
            height: size.height * 0.05,
          )
        ],
      ),
    );
  }
}
