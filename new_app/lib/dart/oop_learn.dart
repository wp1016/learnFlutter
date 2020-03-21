// 定义一个 Dart 类，所有的类都继承自Object
class Person {
  String name;
  int age;
  Person(this.name, this.age);
  // 重写父类方法
  @override
  String toString() {
    return 'name:$name, age:$age';
  }
}

class Student extends Person {
  String _school; // 通过下划线来标识私有属性
  String city;
  String country;
  String name;
  // 构造方法:
  // 通过this._school初始化自有参数
  // name,age交给父类进行初始化
  // city为可选参数
  // country默认参数
  Student(name, age, this._school, {this.city, this.country = 'China'})
      :
        // 初始化列表：除了调用父类构造器，在子类构造器方法体之前，你也可以初始化实例变量，不同的初始化变量之间用 , 分隔
        name = '$country.$city $name',
        // 如果父类没有默认构造方法(无参的构造方法)，则需要在初始化列表中调用父类构造方法进行初始化
        super(name, age) {
    print('构造方法体不是必须的');
  }

  @override
  String toString() {
    return 'name:$name,school:${this._school},city:$city,country:$country ${super.toString()}';
  }

  String get school => _school;
  set school(String value) {
    _school = value;
  }

  // 静态方法
  static doPrint(String str) {
    print('doPrint:$str');
  }

  // 命名构造方法：[类名+.+方法名]
  // 使用命名构造方法为类实现多个构造方法
  Student.cover(Student stu) : super(stu.name, stu.age) {
    print('命名构造方法');
  }

  // 命名工厂构造方法：factory [类名+.+方法名]
  // 他可以有返回值，而且不需要将类的 final 变量作为参数，是提供一种灵活获取类对象的方式。
  factory Student.stu(Student stu) {
    return Student(stu.name, stu.age, stu._school);
  }
}

// 工厂构造方法：
// 不仅仅是构造方法，更是一种模式
// 有时候为了返回一个之前已经创建的缓存对象，原始的构造方法已经不能满足要求

class Logger {
  static Logger _cache;
  factory Logger() {
    if (_cache == null) {
      _cache = Logger._internal();
    }
    return _cache;
  }

  Logger._internal();
}

// 使用abstract 修饰符来定义一个抽象类，该类不能被实例化。抽象类在定义接口时非常有用，实际上抽象中也包含一些实现
abstract class Study {
  void study();
}

// 继承抽象类要实现它的抽象方法，否则也需要
class StudyFlutter extends Study {
  @override
  void study() {
    print('Learning Flutter');
  }
}

// 为类添加特性：mixins
// mixins 是在多个类层次结构中重用代码的一种方式
// 要使用mixins，在with关键字后面跟上一个或多个mixin 的名字 （用逗号分隔），并且with要用在extend之后
// minxins的特征：实现 mixin，就创建一个继承Object类的子类（不能继承其他类），不声明任何构造函数，不调用super

class Test extends Person with Study {
  Test(String name, int age) : super(name, age);

  @override
  void study(){
    // Todo implement
  }
}
