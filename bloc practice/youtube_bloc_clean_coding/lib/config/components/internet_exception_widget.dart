import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({Key? key, required this.onPress}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
        const Icon(Icons.cloud_off, color: Colors.red, size: 58),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              "We're unable to show results.\nPlease check your data\nconnection",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(fontSize: 20),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.15,
        ),
        ElevatedButton(onPressed: onPress,
            child: Text(
              'RETRY',
            style: Theme.of(context).textTheme.bodySmall,))
      ],
    );
  }
}
