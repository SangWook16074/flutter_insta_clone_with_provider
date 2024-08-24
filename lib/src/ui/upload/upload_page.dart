import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone_with_provider/src/ui/upload/upload_view.dart';
import 'package:flutter_instagram_clone_with_provider/src/ui/upload/upload_view_model.dart';
import 'package:provider/provider.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UploadViewModel(),
      child: const UploadView(),
    );
  }
}
