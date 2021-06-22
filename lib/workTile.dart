import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/expandedInfo.dart';
import 'package:url_launcher/url_launcher.dart';
import "projectsData.dart" as projects;

class WorkTile extends StatefulWidget {
  const WorkTile(
      {Key? key,
      required this.textColor,
      required this.backgroundColor,
      required this.projectName})
      : super(key: key);
  final Color backgroundColor;
  final Color textColor;
  final String projectName;

  @override
  _WorkTileState createState() => _WorkTileState();
}

class _WorkTileState extends State<WorkTile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    bool isScreenMedium = MediaQuery.of(context).size.width < 1300;
    bool isScreenSmall = MediaQuery.of(context).size.width < 850;
    bool isScreenInbetween = MediaQuery.of(context).size.width < 1050;

    return Container(
      margin: EdgeInsets.only(
        top: 50,
        bottom: 20,
        left: isScreenSmall || isScreenInbetween
            ? 20
            : isScreenMedium
                ? 100
                : 200,
        right: isScreenSmall || isScreenInbetween
            ? 20
            : isScreenMedium
                ? 100
                : 200,
      ),
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0))),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Flex(
                direction: isScreenSmall ? Axis.vertical : Axis.horizontal,
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 150,
                            width: 150,
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('/images/commons.jpg'),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20)))),
                        Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: widget.textColor, width: 0.5))),
                            padding: EdgeInsets.only(right: 12, left: 20),
                            child: Column(
                              children: [
                                Text(
                                  widget.projectName,
                                  style: TextStyle(
                                      color: widget.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: isScreenSmall ? 15 : 18),
                                ),
                                Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 12),
                                          child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  style: TextStyle(
                                                      color:
                                                          Colors.blue.shade700,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  text: "GitHub",
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () async {
                                                          var url =
                                                              "https://github.com/raymondfdavey/reg-interests-flutter-via-node";
                                                          if (await canLaunch(
                                                              url)) {
                                                            await launch(url);
                                                          } else {
                                                            throw 'Could not launch $url';
                                                          }
                                                        }),
                                            ]),
                                          ),

                                          // Text("GitHub",
                                          //     style: TextStyle(
                                          //         color: Colors.deepOrangeAccent,
                                          //         fontSize: 15))
                                        ),
                                        Container(
                                          child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  style: TextStyle(
                                                      color:
                                                          Colors.blue.shade700,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  text: "LIVE",
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () async {
                                                          var url =
                                                              "https://registeredinterests.azurewebsites.net/#/";
                                                          if (await canLaunch(
                                                              url)) {
                                                            await launch(url);
                                                          } else {
                                                            throw 'Could not launch $url';
                                                          }
                                                        }),
                                            ]),
                                          ),

                                          // Text("GitHub",
                                          //     style: TextStyle(
                                          //         color: Colors.deepOrangeAccent,
                                          //         fontSize: 15))
                                        ),
                                      ],
                                    ))
                              ],
                            )),
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, bottom: 20, top: 20),
                        decoration: isScreenSmall
                            ? BoxDecoration(
                                border: Border(
                                top: BorderSide(
                                    color: widget.textColor, width: 0.1),
                              ))
                            : BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: widget.textColor, width: 0.5))),
                        child: Theme(
                          data: theme,
                          child: ExpansionTile(
                            onExpansionChanged: (onExpansionChanged) {
                              print("CHANGING EXPANSESION");

                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            title: Text(
                              projects.info[widget.projectName]["title"],
                              style: TextStyle(
                                  color: widget.textColor, fontSize: 20),
                            ),
                          ),
                        )

                        // Text(
                        //   'HI',
                        //   style: TextStyle(
                        //       color: Colors.deepOrangeAccent, fontSize: 20),
                        // )

                        ),
                  )
                ]),
          ),
          if (isExpanded == true)
            ExpandedInfo(
                project: widget.projectName, textColor: widget.textColor),
        ],
      ),
    );
  }
}
