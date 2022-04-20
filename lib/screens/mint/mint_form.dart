import 'package:flutter/material.dart';

import '../../models/drop_file_model.dart';
import '../../services/drop_zone/drop_file_widget.dart';
import '../../services/drop_zone/drop_zone_widget.dart';

/// Form for minting screening
class MintForm extends StatefulWidget {

  const MintForm({Key? key}) : super(key: key);

  @override
  State<MintForm> createState() => _MintFormState();
}

class _MintFormState extends State<MintForm> {

  final _formKey = GlobalKey<FormState>();
  ValueNotifier<FileDataModel?> file = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: file,
          builder: (BuildContext context, FileDataModel? _file, Widget? child){
            return Column(
              children: [
                if(file.value == null) SizedBox(
                  height: 300,
                  child: DropZoneWidget(
                    onDroppedFile: (file) {
                      setState(() {
                        this.file.value = file;
                      });
                    } ,
                  ),
                ),
                const SizedBox(height: 20,),
                DroppedFileWidget(file:file),
              ],
            );
          }),
        const SizedBox(height: 20,),
        Builder(
            builder: (context)=> Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        enableInteractiveSelection: true,
                        // textCapitalization: TextCapitalization.words,
                        initialValue: '',
                        decoration:
                        const InputDecoration(
                            labelText: 'Item name',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white30, width: 1.0),
                            ),
                        ),
                        // ignore: missing_return
                        validator: (value) {

                        },
                        onChanged: (val) =>
                        {

                        }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (val){

                      },
                      enableInteractiveSelection: true,
                      // maxLines: 2,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30, width: 1.0),
                        ),
                        labelText: "Link",
                      ),
                      // ignore: missing_return
                      validator: (value) {
                        //TODO add validator functions
                        if ((value?.isNotEmpty ?? false)){
                          return 'Please enter a valid link with including https.';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (val){

                      },
                      enableInteractiveSelection: true,
                      // maxLines: 2,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30, width: 1.0),
                        ),
                        labelText: "Quantity",
                      ),
                      // ignore: missing_return
                      validator: (value) {
                        //TODO add validator functions
                        if ((value?.isNotEmpty ?? false)){
                          return 'Please enter a quantity.';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      enableInteractiveSelection: true,
                      textCapitalization: TextCapitalization.sentences,
                      cursorColor: Colors.grey,
                      maxLines: 15,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white30, width: 1.0),
                          ),
                          border: const OutlineInputBorder(),
                          hintText: 'Provide a detailed description.',
                          hintStyle: Theme.of(context).textTheme.subtitle1
                      ),
                      style: Theme.of(context).textTheme.subtitle1,
                      onChanged: (val){

                      },
                    ),
                  ),
                ],
              ),
            )
        ),
      ],
    );
  }
}