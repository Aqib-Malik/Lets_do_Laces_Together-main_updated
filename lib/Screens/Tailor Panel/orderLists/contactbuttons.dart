import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ContactButtons extends StatefulWidget {
  final String phoneNumber;
  final String messageText;
  final String whatsAppMessageText;

  const ContactButtons({
    Key? key,
    required this.phoneNumber,
    this.messageText = '',
    this.whatsAppMessageText = '',
  }) : super(key: key);

  @override
  _ContactButtonsState createState() => _ContactButtonsState();
}

class _ContactButtonsState extends State<ContactButtons>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 500),
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  bool _isExpanded = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        NeumorphicButton(
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
              _isExpanded ? _controller.forward() : _controller.reverse();
            });
          },
          style: NeumorphicStyle(
            color: Colors.white,
            depth: 5,
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(20),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.message, size: 32, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                'Contact',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              RotationTransition(
                turns: Tween(begin: 0.0, end: 0.5).animate(_animation),
                child: Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.blue),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        SizeTransition(
          axisAlignment: 1.0,
          sizeFactor: _animation,
          child: Neumorphic(
            style: NeumorphicStyle(
              color: Colors.white,
              depth: 5,
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(20),
              ),
            ),
            child: Column(
              children: [
                NeumorphicButton(
                  onPressed: () {
                    launch('sms:${widget.phoneNumber}?body=${widget.messageText}');
                  },
                  style: NeumorphicStyle(
                    color: Colors.blue,
                    depth: -5,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(20),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.sms, size: 32, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'SMS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
            NeumorphicButton(
              onPressed: () {
                launch(
                    'whatsapp://send?phone=${widget.phoneNumber}&text=${widget.whatsAppMessageText}');
              },
              style: NeumorphicStyle(
                color: Color(0xff25d366),
                depth: -5,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(20),
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.phone, size: 32, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'WhatsApp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            NeumorphicButton(
  onPressed: () {
    launch('tel:${widget.phoneNumber}');
  },
  style: NeumorphicStyle(
    color: Colors.green,
    depth: -5,
    boxShape: NeumorphicBoxShape.roundRect(
      BorderRadius.circular(20),
    ),
  ),
  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.phone, size: 32, color: Colors.white),
      SizedBox(width: 8),
      Text(
        'Call',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
),
SizedBox(height: 20,)
          ],
        ),
      ),
    ),
  ],
);
  }}