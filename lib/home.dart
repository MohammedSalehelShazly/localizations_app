import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'changeLangWidget.dart';
import 'localization/language_constants.dart';
import 'settingsProv.dart';



class Home extends StatelessWidget {
  bool first = true;
  SettingsProv settingsProv;
  SettingsProv settingsProvWrite;


  @override
  Widget build(BuildContext context) {
    if(first){
      settingsProv = Provider.of<SettingsProv>(context);
      settingsProvWrite = Provider.of<SettingsProv>(context, listen: false);
      settingsProv.getLang();
      first = false;
    }
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(100),
        child: InkWell(
          onTap: (){
            showDialog(context: context, builder: (_)=>
              ChangeLangWidget()
            );
          },
            child: Text(getTranslated(context, 'Hello') ,style: TextStyle(fontSize: 50),)),
      ),
    );
  }
}
