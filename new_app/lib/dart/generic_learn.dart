import 'package:new_app/dart/oop_learn.dart';

class TestGeneric {
  void start() {
    Cache<String> cache1 = Cache();
    cache1.setItem('cache1', '11'); // 泛型作用:类型检查约束类比:List<String>
    String string1 = cache1.getItem('cache1');
    print(string1);

    Member<Student>member = Member(Student('', 16, ''));

    print(member.fixedName());
  }
}

// 泛型:
// 泛型类
// 作用:提高代码的复用度
class Cache<T> {
  static final Map<String, Object> _cached = Map();
  // 泛型方法
  void setItem(String key, T value) {
    _cached[key] = value;
  }

  T getItem(String key) {
    return _cached[key];
  }
}

class Member<T extends Person> {
  T _person;

  // 泛型作用:约束参数类型
  Member(this._person);

  String fixedName() {
    return 'fixed:${_person.name}';
  }
}
