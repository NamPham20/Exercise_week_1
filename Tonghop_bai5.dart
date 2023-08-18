void main() {
  var classInformation = {
    "id": 12,
    "name": "Công ty cổ phần Lumi Việt Nam",
    "description":
        "Showroom Lumi số 38 Đỗ Đức Dục, Nam Từ Liêm, Hà Nội. Hotline: 09034989191"
  };

  dynamic description = classInformation["description"];
  String hotline = extractHotline(description);

  print("Hotline: $hotline");
}

String extractHotline(String description) {
  int startIndex = description.indexOf("Hotline: ") + "Hotline: ".length;
  String hotline = description.substring(startIndex);

  return hotline;
}
