// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
    const Home(),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PermissionStatus location = PermissionStatus.denied;
  PermissionStatus camera = PermissionStatus.denied;
  PermissionStatus wifi = PermissionStatus.denied;
  PermissionStatus notification = PermissionStatus.denied;
  PermissionStatus storage = PermissionStatus.denied;
  PermissionStatus audio = PermissionStatus.denied;
  PermissionStatus sms = PermissionStatus.denied;
  PermissionStatus contacts = PermissionStatus.denied;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Permission"),
        leading: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("check your permission Status"),
                      content: SizedBox(
                        height: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            checkPermission(
                                name: "location", permissionStatus: location),
                            checkPermission(
                                name: "camera", permissionStatus: camera),
                            checkPermission(
                                name: "wifi", permissionStatus: wifi),
                            checkPermission(
                                name: "notification",
                                permissionStatus: notification),
                            checkPermission(
                                name: "storage", permissionStatus: storage),
                            checkPermission(
                                name: "audio", permissionStatus: audio),
                            checkPermission(name: "sms", permissionStatus: sms),
                            checkPermission(
                                name: "contacts", permissionStatus: contacts),
                          ],
                        ),
                      ),
                    );
                  });
            },
            icon: const Icon(Icons.checklist)),
        actions: [
          IconButton(
            onPressed: () async {
              await openAppSettings();
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                location = await Permission.location.request();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("$location"),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: CupertinoColors.systemGreen),
                );

                if (location == PermissionStatus.granted) {
                  log("Go to next page");
                } else {
                  log("try again...");
                }
              },
              child: const Text("Location"),
            ),
            ElevatedButton(
              onPressed: () async {
                camera = await Permission.camera.request();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("$camera"),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: CupertinoColors.systemGreen),
                );

                if (camera == PermissionStatus.granted) {
                  log("Go to next page");
                } else {
                  log("try again...");
                }
              },
              child: const Text("camara"),
            ),
            ElevatedButton(
              onPressed: () async {
                wifi = await Permission.nearbyWifiDevices.request();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("$wifi"),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: CupertinoColors.systemGreen),
                );

                if (wifi == PermissionStatus.granted) {
                  log("Go to next page");
                } else {
                  log("try again...");
                }
              },
              child: const Text("wifi"),
            ),
            ElevatedButton(
              onPressed: () async {
                notification = await Permission.notification.request();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("$notification"),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: CupertinoColors.systemGreen),
                );

                if (notification == PermissionStatus.granted) {
                  log("Go to next page");
                } else {
                  log("try again...");
                }
              },
              child: const Text("notification"),
            ),
            ElevatedButton(
              onPressed: () async {
                storage = await Permission.storage.request();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("$storage"),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: CupertinoColors.systemGreen),
                );

                if (storage == PermissionStatus.granted) {
                  log("Go to next page");
                } else {
                  log("try again...");
                }
              },
              child: const Text("storage"),
            ),
            ElevatedButton(
              onPressed: () async {
                audio = await Permission.audio.request();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("$audio"),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: CupertinoColors.systemGreen),
                );

                if (audio == PermissionStatus.granted) {
                  log("Go to next page");
                } else {
                  log("try again...");
                }
              },
              child: const Text("Audio"),
            ),
            ElevatedButton(
              onPressed: () async {
                sms = await Permission.sms.request();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("$sms"),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: CupertinoColors.systemGreen),
                );

                if (sms == PermissionStatus.granted) {
                  log("Go to next page");
                } else {
                  log("try again...");
                }
              },
              child: const Text("sms"),
            ),
            ElevatedButton(
              onPressed: () async {
                contacts = await Permission.phone.request();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("$contacts"),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: CupertinoColors.systemGreen),
                );

                if (contacts == PermissionStatus.granted) {
                  log("Go to next page");
                } else {
                  log("try again...");
                }
              },
              child: const Text("phone"),
            ),
          ],
        ),
      ),
    );
  }

  Widget checkPermission(
      {required name, required PermissionStatus permissionStatus}) {
    return Row(
      children: [
        Text(name),
        const Spacer(),
        (permissionStatus.isGranted)
            ? const Icon(
                Icons.done_outline,
                color: Colors.green,
              )
            : const Icon(
                Icons.do_not_disturb,
                color: Colors.red,
              )
      ],
    );
  }
}
