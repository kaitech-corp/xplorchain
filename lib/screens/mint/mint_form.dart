import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/drop_file_model.dart';
import '../../services/drop_zone/drop_file_widget.dart';
import '../../services/drop_zone/drop_zone_widget.dart';

/// Form for minting
class MintForm extends StatefulWidget {

  const MintForm({Key? key}) : super(key: key);

  @override
  State<MintForm> createState() => _MintFormState();
}

class _MintFormState extends State<MintForm> {

  final _formKey = GlobalKey<FormState>();
  ValueNotifier<FileDataModel?> file = ValueNotifier(null);

  String _selection = 'Keychain';
  List<String> mintType = ['Keychain', 'Experience', 'Event'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Row(
          children: [
            Text('Mint type: ',style: Theme.of(context).textTheme.headline5,),
            DropdownButton<String>(
              value: _selection,
              style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.blueAccent),
              items: mintType.map<DropdownMenuItem<String>>((String value) => DropdownMenuItem(child: Text(value), value: value,)).toList(),
              onChanged: (String? val){
                setState(() {
                  _selection = val!;
                });
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Get started by minting a new $_selection',style: Theme.of(context).textTheme.subtitle1?.copyWith(fontStyle: FontStyle.italic)),
        ),
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
                          if (value?.isEmpty ?? true){
                            return 'Please enter an item name.';
                          } else {

                          }
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
                        labelText: 'Link',
                      ),
                      // ignore: missing_return
                      validator: (value) {
                        if ((value?.isEmpty ?? true)){
                          return Intl.message('Please enter a valid link with including https.');
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
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white30, width: 1.0),
                        ),
                        labelText:  Intl.message('Quantity'),
                      ),
                      // ignore: missing_return
                      validator: (value) {
                        if ((value?.isEmpty ?? true)){
                          return Intl.message('Please enter a quantity.');
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
                      maxLines: 10,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white30, width: 1.0),
                          ),
                          border: const OutlineInputBorder(),
                          hintText: Intl.message('Provide a detailed description.'),
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