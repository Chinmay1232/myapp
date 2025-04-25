import 'package:flutter/material.dart';
// Import necessary packages for authentication (e.g., firebase_auth, google_sign_in)

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final List<String> textToType = [
    "Love at First Bite",
    "Food for thought",
    "Feed your soul",
    "Savor every bite",
    "Eat well, live well"
  ];

  String animatedText = "";
  int index = 0;
  bool isPresented = false;
  // Replace with your actual AuthenticationViewModel
  // AuthenticationViewModel viewModel = AuthenticationViewModel(); 
  bool showAnimation = true;


  // Replace with your actual authentication methods
  Future<bool> signInWithEmailPassword() async {
    // Implement your email/password sign-in logic here
    return true; // Replace with actual result
  }

  Future<bool> signInWithGoogle() async {
    // Implement your Google sign-in logic here
    return true; // Replace with actual result
  }

  @override
  void initState() {
    super.initState();
    animateText();
  }
  
  @override
  void dispose() {
    showAnimation = false;
    super.dispose();
  }

  void animateText() {
    if (!showAnimation) return;

    for (var i = 0; i < textToType[index].length; i++) {
      if (!showAnimation) return;

      Future.delayed(Duration(milliseconds: (40 * i).toInt()), () {
        setState(() {
          animatedText += textToType[index][i];
        });

        // Haptic feedback (replace with your actual implementation)
        // HapticManager.instance.impact(type: .light);

        if (animatedText.length == textToType[index].length) {
          Future.delayed(const Duration(seconds: 2), () {
            retractText();
          });
        }
      });
    }
  }

  void retractText() {
    if (!showAnimation) return;

    setState(() {
      index = (index + 1) % textToType.length;
    });

    for (var i = 0; i < animatedText.length; i++) {
      if (!showAnimation) return;

      Future.delayed(Duration(milliseconds: (60 * i).toInt()), () {
        setState(() {
          animatedText = animatedText.substring(0, animatedText.length - 1);
        });
        // Haptic feedback
        // HapticManager.instance.impact(type: .light);

        if (animatedText.isEmpty) {
          Future.delayed(const Duration(seconds: 1), () {
            animateText();
          });
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final List<Color> backgroundColors = [
      const Color(0xFFFF40FF), // Replace with your color values
      const Color(0xFF407640),
      const Color(0xFFFF7C77),
      const Color(0xFF009091),
      const Color(0xFF005491),
    ];

    final List<Color> textColors = [
      Colors.black, // Replace with your color values
      const Color(0xFFFF8A91),
      const Color(0xFF0530FF),
      const Color(0xFFFFD67A),
      const Color(0xFF8EEB00),
    ];

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: backgroundColors[index]),
          child: Stack(
            children: [
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(animatedText,style: TextStyle(color: textColors[index],fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 32)),
                      const SizedBox(height: 10,),
                      
                      // ...rest of your UI code
                    ],
                  )
              ),
              Positioned(bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.black, borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          ElevatedButton(onPressed: (){
                            //viewModel.handleSignInWithAppleRequest(request);
                            //viewModel.handleSignInWithAppleCompletion(result);
                          }, child: const Text("Sign in with apple")),
                          ElevatedButton(onPressed: (){
                            signInWithGoogle();
                          }, child: const Text("Sign in with Google")),
                          // other buttons
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
    );
  }
}
