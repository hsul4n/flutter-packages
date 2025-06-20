import 'dart:io';

import 'package:clip/l10n/clip_localizations.dart';
import 'package:flutter/material.dart';
import 'package:clip/clip.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        ClipLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ar'),
        const Locale('fr'),
      ],
      title: 'Flutter Clipy Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _clipKey = GlobalKey<FormState>();

  final _user = User(
    id: 1,
    name: 'User 01',
    avatar: 'https://avatars2.githubusercontent.com/u/4195236?v=3',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Clipy Demo Home Page'),
      ),
      body: Form(
        key: _clipKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // ImageClipField(
              //   key: ValueKey('avatar'),
              //   initialValue: _user.avatar,
              //   quality: 50,
              //   maxHeight: 1024,
              //   decoration: InputDecoration(
              //     helperText: 'Avatar',
              //   ),
              //   validator: (pickedFile) =>
              //       pickedFile == null ? 'Please upload attachment' : null,
              //   builder: (context, pickedFile) {
              //     return CircleAvatar(
              //       radius: 56,
              //       child: pickedFile != null
              //           ? null
              //           : Center(
              //               child: Icon(
              //                 Icons.add_a_photo_outlined,
              //                 size: 28,
              //                 color: Colors.white,
              //               ),
              //             ),
              //       backgroundImage: pickedFile != null
              //           ? FileImage(File(pickedFile.path))
              //           : null,
              //     );
              //   },
              //   onSaved: (avatar) {
              //     print(avatar);
              //   },
              // ),
              // ClipGridView(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   key: const ValueKey('avatars'),
              //   initialValues: <String?>[
              //     _user.avatar,
              //   ],
              //   quality: 20,
              //   maxHeight: 1024,
              //   decoration: InputDecoration(
              //     helperText: 'Please pick images',
              //   ),
              //   validator: (a) => a!.isEmpty ? 'aa' : null,
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   emptyBuilder: (context) {
              //     return CircleAvatar(
              //       radius: 56,
              //       child: Center(
              //         child: Icon(
              //           Icons.add_a_photo_outlined,
              //           size: 28,
              //           color: Colors.white,
              //         ),
              //       ),
              //     );
              //   },
              //   itemBuilder: (context, xFile, index) {
              //     return Card(
              //       child: CircleAvatar(
              //         radius: 56,
              //         backgroundImage: FileImage(File(xFile.path)),
              //       ),
              //     );
              //   },
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 3,
              //   ),
              // ),
              SizedBox(
                height: 156,
                child: ClipListView(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8.0),
                  key: const ValueKey('avatars'),
                  initialValues: <String>[
                    _user.avatar!,
                    _user.avatar!,
                    //   _user.avatar!,
                    //   _user.avatar!,
                    //   _user.avatar!,
                    //   _user.avatar!,
                    //   _user.avatar!,
                    //   _user.avatar!,
                  ],
                  quality: 20,
                  maxHeight: 1024,
                  validator: (a) => 'aa',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  header: (context) {
                    return AspectRatio(
                      aspectRatio: 1,
                      child: CircleAvatar(
                        radius: 56,
                        child: Center(
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                  itemBuilder: (context, file, index) {
                    return AspectRatio(
                      aspectRatio: 1,
                      child: Card(
                        margin: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 56,
                          backgroundImage: FileImage(File(file.path)),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submit,
        tooltip: 'Save',
        child: Icon(Icons.done),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _submit() {
    if (_clipKey.currentState!.validate()) {
      _clipKey.currentState!.save();

      print('Done || Done');
    }
  }
}
