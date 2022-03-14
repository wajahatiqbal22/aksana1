import 'package:bullshit/routes/routes.dart';

import 'package:flutter/material.dart';

class BullShit extends StatelessWidget {
  const BullShit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: Routes.routes,
    );
  }
}
