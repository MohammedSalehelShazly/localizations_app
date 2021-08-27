import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'localization/languageClass.dart';
import 'localization/language_constants.dart';
import 'settingsProv.dart';

class ChangeLangWidget extends StatelessWidget {

  SettingsProv settingsProvWrite;
  bool first = true;

  @override
  Widget build(BuildContext context) {
    if(first){
      settingsProvWrite = Provider.of<SettingsProv>(context ,listen: false);
    }
    return CupertinoAlertDialog(
      title: Text(getTranslated(context, 'Language')),
      content: Column(children:
        Language.languageList().map((e) =>
            Material(
              child: ListTile(
                title: Text( e.name ),
                trailing: Text( e.flag ),
                onTap: ()=> settingsProvWrite.setLang(context ,e.languageCode),
              ),
            )
        ).toList()

      ),
    );
  }
}
