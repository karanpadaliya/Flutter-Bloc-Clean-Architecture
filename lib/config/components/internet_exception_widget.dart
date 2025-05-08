import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;

  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * .15),
        Icon(Icons.cloud_off, color: Colors.red, size: 50),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            "We're unable to show result. \nPlease check your data\nconnection.",
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.displayMedium!.copyWith(fontSize: 18),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .05),
        ElevatedButton(
          onPressed: widget.onPress,
          child: Center(
            child: Text('Retry', style: Theme.of(context).textTheme.bodySmall),
          ),
        ),
      ],
    );
  }
}
