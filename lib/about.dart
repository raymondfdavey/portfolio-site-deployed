import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key, this.scrollTo, this.scrollDown, this.scrollToSection})
      : super(key: key);
  final scrollDown;
  final scrollTo;
  final scrollToSection;
  @override
  Widget build(BuildContext context) {
    bool isScreenMedium = MediaQuery.of(context).size.width < 1300;
    bool isScreenSmall = MediaQuery.of(context).size.width < 850;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(20.0))),
          margin: EdgeInsets.only(
              top: 50,
              bottom: 30,
              left: isScreenSmall ? 20 : 100,
              right: isScreenSmall ? 20 : 100),
          padding: EdgeInsets.all(30),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <
                  Widget>[
            if (isScreenSmall == false)
              Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    "about me",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Colors.black, width: 0.5))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "i am a relative newcomer to computing but i've found i like to code because it is a way of solving almost any problem. there is so much to learn - it is an incredible area to be working in today\n ",
                          style: TextStyle(
                              color: Colors.green.shade700,
                              fontSize:
                                  isScreenSmall || isScreenMedium ? 14 : 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                            "before getting into coding i worked for the ambulance service as a technician and then a paramedic. that job involved a lot of problem solving too. there is such broad scope for technology to help in that environment, i would love to use my new skills to contribute to the NHS one day\n",
                            style: TextStyle(
                                color: Colors.green.shade700,
                                fontSize:
                                    isScreenSmall || isScreenMedium ? 14 : 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        child: Text(
                            "i also have a long-term interest in human, animal and machine intelligence: what it is and how it works\n",
                            style: TextStyle(
                                color: Colors.green.shade700,
                                fontSize:
                                    isScreenSmall || isScreenMedium ? 14 : 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        child: Text(
                            "most especially i am interested in how information is represented in systems - particularly the brain. my background is in philosophy so it is cool to be learning to work with huge amounts of data, and to be learning and thinking about different deep-learning models. it is such a mind-blowing area, and one i think will shed light on some of the questions that have bothered all us philosphizers since people first started asking them",
                            style: TextStyle(
                                color: Colors.green.shade700,
                                fontSize:
                                    isScreenSmall || isScreenMedium ? 14 : 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(
                                  top: 20, bottom: 10, left: 2.5, right: 2.5),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('/images/brain.png'),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20)))),
                          Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(
                                  top: 20, bottom: 20, left: 2.5, right: 2.5),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('/images/thought.png'),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20)))),
                          Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(
                                  top: 20, bottom: 20, left: 2.5, right: 2.5),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('/images/question.png'),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20)))),
                          Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(
                                  top: 20, bottom: 20, left: 2.5, right: 2.5),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('/images/shrug.png'),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20)))),
                        ],
                      ),
                    ],
                  )),
            )
          ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: IconButton(
                icon: Icon(Icons.arrow_circle_up),
                iconSize: 40,
                color: Colors.deepOrangeAccent,
                onPressed: () {
                  scrollTo(0);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: IconButton(
                icon: Icon(Icons.arrow_circle_down),
                iconSize: 40,
                color: Colors.deepOrangeAccent,
                onPressed: () {
                  scrollToSection("work");
                },
              ),
            )
          ],
        )
      ],
    );
  }
}