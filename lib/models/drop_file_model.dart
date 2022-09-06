/// Model for Drop file feature
class FileDataModel{

  FileDataModel({required this.name,required this.mime,required this.bytes, required this.url});
  final String name;
  final String mime;
  final int bytes;
  final String url;

  String get size{
    final double kb = bytes / 1024;
    final double mb = kb / 1024;

    return mb > 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
  }

}