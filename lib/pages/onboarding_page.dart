import "package:flutter/material.dart";
import "package:netflix/pages/signing_page.dart";
import "package:netflix/widget/onboarding.dart";

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        leading: const Image(image: AssetImage("assets/images/symbol.png")),
        actions: [
          TextButton(
            onPressed: (){}, 
            child: const Text(
              "CONDITIONS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
          TextButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SigningPage()
                )
              );
            }, 
            child: const Text(
              "SE CONNECTER",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          )
        ],
      ),

      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: const [
              Onboarding(
                title: "Films et séries illimités et encore plus",
                subTitle: "Stream oû tu veux. Résilie quand tu veux",
                image: "assets/images/ob1.jpg",
              ),
              Onboarding(
                title: "Il y a un service pour chaque fan",
                subTitle: "Servce allant de 2.99€ / month",
                image: "assets/images/ob2.jpg",
              ),
              Onboarding(
                title: "Résilie quand tu veux",
                subTitle: "Rejoins nous aujourd'hui, pas de raison d'attendre",
                image: "assets/images/ob3.jpg",
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3, 
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 5),
                      height: 10 ,
                      width: _currentPage == index ? 20 : 10,
                      decoration: BoxDecoration(
                        color: _currentPage == index ? Colors.red : Colors.grey,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      )
                    ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)
                      )
                    ),
                    child: const Text("Get Started")
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