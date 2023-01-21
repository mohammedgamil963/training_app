import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:training_app/modules/login_screen/login_screen.dart';
import 'package:training_app/shared/components/components.dart';
import 'package:training_app/shared/network/local/cash_helper.dart';
class OnBoardingModel{
  String imagePath;
  String title;
  String body;
  OnBoardingModel({required this.imagePath,required this.title,required this.body,});
}
class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  //const Boarding_Screen({Key? key}) : super(key: key);
  List<OnBoardingModel> boarding=[
    OnBoardingModel(imagePath: 'assets/images/order.png', title: "Online Order", body: "Make ordering your favourite food much easier and faster"),
    OnBoardingModel(imagePath: 'assets/images/payment.png', title: "Easy Payment", body: "Pay in easier way and faster"),
    OnBoardingModel(imagePath: 'assets/images/delivery.png', title: "Faster Delivery", body: "Get Your food Faster"),

  ];

  var boardingController=PageController();

  bool isLast=false;

  void submit(){
    CashHelper.saveData(key: 'onBoarding', value: true).then((value){
      if(value){
        navigateWithoutArrowBack(context: context, newScreen:  const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: (){
                submit();
              },
              child: const Text(
                "SKIP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.orange,
                ),
              ),
          ),
        ],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                  controller: boardingController,
                  onPageChanged: (int index){
                      if(index==boarding.length -1){
                        setState(() {
                          isLast=true;
                        });
                      }
                      else{
                        setState(() {
                          isLast=false;
                        });
                      }
                  },
                  itemBuilder: (context,index)=>boardingModel(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            Row(
              children:  [
                SmoothPageIndicator(
                    controller: boardingController,
                    count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 15,
                    dotWidth: 15,
                    spacing: 10,
                    activeDotColor: Colors.orange,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.orange,
                    onPressed: (){
                      if(isLast){
                        submit();
                      }
                      else {
                        boardingController.nextPage(duration: const Duration(milliseconds: 750), curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                  child: const Icon(Icons.arrow_forward_ios,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


Widget boardingModel(OnBoardingModel model)=> Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children:  [
    Expanded(
      flex: 3,
      child: Image(
        image: AssetImage(model.imagePath),
      ),
    ),
    Expanded(
      flex: 2,
      child: Column(
        children: [
          Center(
            child: Text(
              textAlign: TextAlign.center,
              model.title,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 3.0,),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              model.body,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    ),
    const SizedBox(height: 50.0,),

  ],
);