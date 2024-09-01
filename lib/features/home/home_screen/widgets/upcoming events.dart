import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("action")));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 120,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.grey,
                //boxShadow: ,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(20)),
            height: 100,
            width: 370,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 2,
                        height: 60,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text("My Todo"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("09:00 - 10:30"),
                        ],
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_right,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
