class SetArgs {
  late String _firstName;
  late String _imageUrl;

  setFirstName(firstName) {
    _firstName = firstName;
  }

  String get getFirstName {
    return _firstName;
  }

  setImageUrl(imageUrl) {
    _imageUrl = imageUrl;
  }

  String get getImageUrl {
    return _imageUrl;
  }
}
