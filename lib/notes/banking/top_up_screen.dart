import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_button.dart';
import 'package:mylearning/notes/banking/transfer_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MoneyTransferScreen(),
    );
  }
}

class MoneyTransferScreen extends StatefulWidget {
  @override
  _MoneyTransferScreenState createState() => _MoneyTransferScreenState();
}

class _MoneyTransferScreenState extends State<MoneyTransferScreen> {
  TextEditingController _amountController = TextEditingController();

  void _onKeypadTap(String value) {
    setState(() {
      if (value == 'Delete') {
        if (_amountController.text.isNotEmpty) {
          _amountController.text = _amountController.text
              .substring(0, _amountController.text.length - 1);
        }
      } else if (value.isNotEmpty) {
        _amountController.text += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> keys = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "",
      "0",
      "Del"
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildUserInfo(),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 0.7,
                    )),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 0.7,
                    )),
                prefixText: 'R',
              ),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: keys.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (keys[index].isEmpty) {
                    return Container(); // Return an empty container for the blank space
                  }
                  return GestureDetector(
                    onTap: () => _onKeypadTap(keys[index]),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(keys[index],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  );
                },
              ),
            ),
            LongButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentSuccessScreen()),
                  );
                },
                title: "Top up",
                isLoading: false),
          ],
        ),
      ),
    );
  }

  Widget buildUserInfo() {
    return const Row(
      children: <Widget>[
        Icon(Icons.person),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Jane Doe",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "****** ****** 9880",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Icon(Icons.check_circle, color: Colors.green),
      ],
    );
  }
}

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _opacityAnimation;
  Animation<Offset>? _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeIn,
      ),
    );

    _positionAnimation = Tween<Offset>(
      begin: Offset(0, 0.05), // slight vertical offset
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeOut,
      ),
    );

    _controller!.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          StarryBackground(),
          FadeTransition(
            opacity: _opacityAnimation!,
            child: SlideTransition(
              position: _positionAnimation!,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Spacer(),
                  const Icon(Icons.check_circle_outline,
                      size: 100, color: Colors.greenAccent),
                  const SizedBox(height: 20),
                  const Text(
                    "Payment success!!",
                    style: TextStyle(
                        // color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Your account has been successfully topped up.",
                    style: TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: LongButton(
                      ///we send them to the home screen insted over here
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransferSuccessScreen()),
                        );
                      },
                      title: "Done",
                      isLoading: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
