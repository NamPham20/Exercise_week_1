class Customer{
  String _userName;
  bool _isVip;
  double _money;

  Customer(this._userName, this._isVip, this._money);

  double get money => _money;

  set money(double value) {
    _money = value;
  }

  bool get isVip => _isVip;

  set isVip(bool value) {
    _isVip = value;
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }
}
