import 'package:flutter/material.dart';
import 'package:despicable_me_ui/styleguide.dart';
import 'package:despicable_me_ui/widgets/character_widget.dart';
import 'package:despicable_me_ui/models/character.dart';

class CharacterListingScreen extends StatefulWidget {
  @override
  _CharacterListingScreenState createState() => _CharacterListingScreenState();
}

class _CharacterListingScreenState extends State<CharacterListingScreen> {
  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 1.0,
      keepPage: false
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios, color: Colors.black,),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 8.0),
                child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Despicable Me", style: AppTheme.display1),
                        TextSpan(text: "\n"),
                        TextSpan(text: "Character", style: AppTheme.display2),
                      ]
                    )
                ),
              ),
              Expanded(
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                      children: <Widget>[
                        for(var i=0; i < characters.length; i++)
                          CharacterWidget(character: characters[i], pageController: _pageController, currentPage: i)
                      ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
