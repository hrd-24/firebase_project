class AppImage {
  static const String _basePath = 'assets/images';
  static const String _baseIconPath = 'assets/icons';

  static String _imagePath(String fileName) => '$_basePath/$fileName';
  static String _imageIconPath(String fileName) => '$_baseIconPath/$fileName';

  //image
  static final kLogoPNG = _imagePath('icon.jpg');

  //icon
  static final kBackIcon = _imageIconPath('back-button.svg');
}
