import 'package:dio/dio.dart';
import 'package:first_flutter_app/forgot_password_page.dart';
import 'package:first_flutter_app/home.dart';
import 'package:first_flutter_app/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sizer/sizer.dart';
final storage = new FlutterSecureStorage();
void main() {
  // runApp(const MyApp());
  runApp(
    ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          // ... your MaterialApp configuration ...
          home: MyApp(), // Your home screen widget
        );
      },
    ),
  );
}

void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> fetchTokenData() async {
    const url = "https://accounts.spotify.com/api/token";
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded"
    };
    try {
      var response = await Dio()
          .request<Map<String, dynamic>>(url, // Specify the response type
              queryParameters: <String, dynamic>{
                'grant_type': 'client_credentials',
                'client_id': 'a2ac1b4ab4cf43b094a2dd288b37a907',
                'client_secret': '6772d3b47f2f414eb81397dfd7532de0'
              },
              options: Options(method: "POST", headers: headers));

      if (response.statusCode == 200) {
        String accessToken = response.data?["access_token"] ??
            ""; // Access token with null check
        print(">>>>>>>>>>>>>>>>>> SUCESS >>> $accessToken");
        await storage.write(key: 'token', value: accessToken);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        print(
            ">>>>>>>>>>>>>>>>>>FAIL ${response.statusCode}"); // Print status code on failure
      }
    } catch (e) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>> CATCH $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final myTextEditingController = TextEditingController(text: '');
    final myPasswordTextEditingController = TextEditingController(text: '');
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      /* appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),*/
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(
                    top: 18, left: 18, right: 18, bottom: 18),
                child: const Text('Login',
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 1,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'RobotoSerif-Italic'))),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 18, left: 18, right: 18),
              child: const Text('UserName',
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'RobotoSerif-Medium')),
            ),
            Card.outlined(
              color: Colors.white,
              elevation: 1,
              margin: const EdgeInsets.only(left: 18, right: 18, top: 12),
              child: Container(
                margin: const EdgeInsets.only(
                    left: 12, right: 6, top: 3, bottom: 3),
                child: TextField(
                  style: const TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Colors.black,
                      fontFamily: 'RobotoSerif-Regular'),
                  controller: myTextEditingController,
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(
                          fontSize: 16,
                          letterSpacing: 1,
                          color: Colors.grey,
                          fontFamily: 'RobotoSerif-Regular'),
                      hintText: 'Username',
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.account_circle_outlined,
                        size: 24,
                      ),
                      iconColor: Colors.black),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 12, left: 18, right: 18),
              child: const Text('Password',
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'RobotoSerif-Medium')),
            ),
            Card.outlined(
              color: Colors.white,
              elevation: 1,
              margin: const EdgeInsets.only(left: 18, right: 18, top: 12),
              child: Container(
                margin: const EdgeInsets.only(
                    left: 12, right: 6, top: 3, bottom: 3),
                child: TextField(
                  obscureText: true,
                  style: const TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Colors.black,
                      fontFamily: 'RobotoSerif-Regular'),
                  controller: myPasswordTextEditingController,
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(
                          fontSize: 16,
                          letterSpacing: 1,
                          color: Colors.grey,
                          fontFamily: 'RobotoSerif-Regular'),
                      hintText: 'Password',
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.lock_outline,
                        size: 24,
                      ),
                      iconColor: Colors.black),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 6, right: 18),
              child: GestureDetector(
                onTap: () {
                  hideKeyboard();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage()));
                },
                child: const Text('Forgot Password?',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0000EE),
                        letterSpacing: 1,
                        fontFamily: 'RobotoSerif-Regular')),
              ),
            ),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 18, right: 6, top: 12, bottom: 12),
                      child: GestureDetector(
                          onTap: () {
                            // todo google login
                          },
                          child: Card.outlined(
                              color: Colors.white,
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 12, right: 12, top: 12, bottom: 12),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/images/google.png',
                                          width: 24, height: 24),
                                      Container(
                                        margin: const EdgeInsets.only(left: 12),
                                        child: const Text('Google',
                                            style: TextStyle(
                                                fontSize: 16,
                                                letterSpacing: 1,
                                                color: Colors.black,
                                                fontFamily:
                                                    'RobotoSerif-Medium')),
                                      )
                                    ],
                                  )))),
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 6, right: 18, top: 12, bottom: 12),
                      child: GestureDetector(
                          onTap: () {
                            // todo facebook login
                          },
                          child: Card.outlined(
                              color: Colors.white,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 12, bottom: 12, left: 12, right: 12),
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/facebook.png',
                                        width: 24, height: 24),
                                    Container(
                                      margin: const EdgeInsets.only(left: 12),
                                      child: const Text('Facebook',
                                          style: TextStyle(
                                              fontSize: 16,
                                              letterSpacing: 1,
                                              color: Colors.black,
                                              fontFamily:
                                                  'RobotoSerif-Medium')),
                                    )
                                  ],
                                ),
                              ))),
                    ))
              ],
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 12, left: 18, right: 18),
              child: ElevatedButton(
                  onPressed: () {
                    // todo on submit
                    fetchTokenData();
                    hideKeyboard();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple)),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'RobotoSerif-Medium',
                        letterSpacing: 1),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 18, left: 18, right: 18, bottom: 30),
              alignment: Alignment.bottomCenter,
              child: Text.rich(
                TextSpan(text: 'Do not have account? ', children: <InlineSpan>[
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // todo open signup page
                          hideKeyboard();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupPage()));
                        },
                      text: 'Signup',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0000EE),
                          letterSpacing: 1,
                          fontFamily: 'RobotoSerif-Regular'))
                ]),
              ),
            )
          ],
        )),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
