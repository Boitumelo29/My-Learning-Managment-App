import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_button.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/notes/banking/home_screen.dart';
import 'package:mylearning/util/validation/validation.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TransferPage(),
    );
  }
}

class TransferPage extends StatefulWidget {
  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final _formKey = GlobalKey<FormState>();
  List<String> banks = ['FNB', 'Standard Bank', 'ABSA', 'Nedbank'];
  String? selectedBank;
  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController beneficiaryReferenceController =
      TextEditingController();
  TextEditingController myReferenceController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Amount: R ####",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.green, // Default border color
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.green,
                      // Border color when the field is focused
                      width: 2.0,
                    ),
                  ),
                  labelText: 'Bank',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.green, // Default border color
                      width: 1.0,
                    ),
                  ),
                ),
                value: selectedBank,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedBank = newValue!;
                  });
                },
                items: banks.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) =>
                    value == null ? 'Please select a bank' : null,
              ),
              const SizedBox(height: 20),
              LongTextFieldForm(
                controller: accountNameController,
                hintText: "Account Name",
                labelText: "Account Name",
                showPrefixIcon: false,
                onChanged: (value) {},
                validator: (value) {
                  return Validation.textValidation(value);
                },
                showSuffixIcon: false,
                obsureText: false,
                isRed: true,
              ),
              const SizedBox(height: 20),
              LongTextFieldForm(
                controller: accountNumberController,
                hintText: 'Account Number',
                labelText: 'Account Number',
                showPrefixIcon: false,
                onChanged: (value) {},
                validator: (value) {
                  return Validation.textValidation(value);
                },
                showSuffixIcon: false,
                obsureText: false,
                isRed: true,
              ),
              const SizedBox(height: 20),
              LongTextFieldForm(
                controller: beneficiaryReferenceController,
                hintText: 'Beneficiary Reference',
                labelText: 'Beneficiary Reference',
                showPrefixIcon: false,
                onChanged: (value) {},
                validator: (value) {
                  return Validation.textValidation(value);
                },
                showSuffixIcon: false,
                obsureText: false,
                isRed: true,
              ),
              const SizedBox(height: 20),
              LongTextFieldForm(
                controller: myReferenceController,
                hintText: 'My Reference',
                labelText: 'My Reference',
                showPrefixIcon: false,
                onChanged: (value) {},
                validator: (value) {
                  return Validation.textValidation(value);
                },
                showSuffixIcon: false,
                obsureText: false,
                isRed: true,
              ),
              const SizedBox(height: 20),

              ///todo you can not transfer anything about the amout so I need to do a check here
              LongTextFieldForm(
                controller: amountController,
                hintText: 'Amount',
                labelText: 'Amount',
                showPrefixIcon: false,
                onChanged: (value) {},
                validator: (value) {
                  return Validation.textValidation(value);
                },
                showSuffixIcon: false,
                obsureText: false,
                isRed: true,
              ),

              ///todo you need to use the number textfield or creat a custome textfield
              const SizedBox(height: 20),
              LongButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuccessScreen()),
                  );
                  // if (_formKey.currentState!.validate()) {
                  //   // Here you would usually send the data to the backend or your database
                  //   showDialog(
                  //     context: context,
                  //     builder: (context) => AlertDialog(
                  //       title: Text('Success'),
                  //       content: Text('Transfer initiated successfully'),
                  //       actions: <Widget>[
                  //         TextButton(
                  //           onPressed: () {
                  //             Navigator.of(context).pop();
                  //           },
                  //           child: Text('OK'),
                  //         ),
                  //       ],
                  //     ),
                  //   );
                  // }
                },
                title: "Transfer",
                isLoading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class TransferSuccessScreen extends StatelessWidget {
//   const TransferSuccessScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.blueGrey[900],
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Spacer(),
//             const Icon(Icons.check_circle_outline,
//                 size: 100, color: Colors.greenAccent),
//             const SizedBox(height: 20),
//             const Text(
//               "Transfer success!!",
//               style: TextStyle(
//                   // color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               "You transferred €900 to Brooklyn Simmons.",
//               style: TextStyle(fontSize: 18),
//             ),
//             const Text(
//               "Find the details in transactions page.",
//               style: TextStyle(fontSize: 16),
//             ),
//             const Spacer(),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: LongButton(
//                 ///we send them to the home screen insted over here
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Container()),
//                   );
//                 },
//                 title: "Done",
//                 isLoading: false,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen>
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
                      size: 100, color: Colors.green),
                  const SizedBox(height: 20),
                  const Text(
                    "Transfer success!!",
                    style: TextStyle(
                        // color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // const Text(
                  //   "You transferred €900 to Brooklyn Simmons.",
                  //   style: TextStyle(fontSize: 18),
                  // ),
                  const Text(
                    "Find the details in transactions page.",
                    style: TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: LongButton(
                      ///we send them to the home screen insted over here
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreenEG()),
                              (Route<dynamic> route) => false,  // This predicate will always return false, removing all routes
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

class StarryBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StarPainter(),
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
    );
  }
}

class StarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.green;
    var rng = Random();

    for (int i = 0; i < 100; i++) {
      var x = rng.nextDouble() * size.width;
      var y = rng.nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), rng.nextDouble() * 2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

//
// class SuccessScreen extends StatefulWidget {
//   @override
//   _SuccessScreenState createState() => _SuccessScreenState();
// }
//
// class _SuccessScreenState extends State<SuccessScreen> with SingleTickerProviderStateMixin {
//   AnimationController? _controller;
//   Animation<double>? _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller!)
//       ..addListener(() {
//         setState(() {});
//       });
//     _controller!.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.deepPurple[900],
//       body: Stack(
//         children: <Widget>[
//           StarryBackground(),  // Custom widget for drawing stars
//            Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Spacer(),
//               const Icon(Icons.check_circle_outline,
//                   size: 100, color: Colors.greenAccent),
//               const SizedBox(height: 20),
//               const Text(
//                 "Transfer success!!",
//                 style: TextStyle(
//                   // color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               // const Text(
//               //   "You transferred €900 to Brooklyn Simmons.",
//               //   style: TextStyle(fontSize: 18),
//               // ),
//               const Text(
//                 "Find the details in transactions page.",
//                 style: TextStyle(fontSize: 16),
//               ),
//               const Spacer(),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: LongButton(
//                   ///we send them to the home screen insted over here
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => TransferSuccessScreen()),
//                     );
//                   },
//                   title: "Done",
//                   isLoading: false,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class StarryBackground extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: StarPainter(),
//       size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
//     );
//   }
// }
//
// class StarPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()..color = Colors.green.withAlpha(100);
//     var rng = Random();
//
//     for (int i = 0; i < 100; i++) {
//       var x = rng.nextDouble() * size.width;
//       var y = rng.nextDouble() * size.height;
//       canvas.drawCircle(Offset(x, y), rng.nextDouble() * 2, paint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
//
//
//
