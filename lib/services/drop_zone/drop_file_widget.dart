import 'package:flutter/material.dart';

import '../../models/drop_file_model.dart';
import '../../widgets/gradient_icon.dart';
import '../size_config/size_config.dart';

/// Dropped file widget
class DroppedFileWidget extends StatefulWidget {
  const DroppedFileWidget({required this.file, Key? key}) : super(key: key);

  final ValueNotifier<FileDataModel?> file;

  @override
  State<DroppedFileWidget> createState() => _DroppedFileWidgetState();
}

class _DroppedFileWidgetState extends State<DroppedFileWidget> {
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: buildImage(context)),
      ],
    );
  }

  Widget buildImage(BuildContext context){
    if(widget.file.value == null) return buildEmptyFile('');
    return Center(
      child: Stack(
        children: [
          // if(file != null) buildFileDetail(file),
          Image.network(widget.file.value!.url,
            width: SizeConfig.screenWidth*.35,
            height: SizeConfig.screenWidth*.35,
            fit: BoxFit.fill,
            errorBuilder:(BuildContext context,Object error,_)=>buildEmptyFile('No Preview'),
          ),
          IconButton(
            onPressed: (){
              widget.file.value = null;
            },
            icon: const GradientIcon(icon: Icons.close, size: 30),
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget buildEmptyFile(String text){
    return Center(child: Text(text));
  }

  Widget buildFileDetail(FileDataModel? file) {
    const  TextStyle style =  TextStyle( fontSize: 20);
    return Container(
      margin: const EdgeInsets.only(left: 24),
      child: Column(
        children: [
          const Text('Selected File Preview ',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
          // Text('Name: ${file?.name}',style: const TextStyle(fontWeight: FontWeight.w800,fontSize: 22),),
          // const SizedBox(height: 10,),
          Text('Type: ${file?.mime}',style: style),
          const SizedBox(height: 10,),
          Text('Size: ${file?.size}',style: style),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}