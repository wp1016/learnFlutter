class FunctionLearn {
  // 方法的构成
  // 返回值类型 + 方法名 + 参数
  // 返回值类型可缺省，也可为 voiid或具体的类型
  // 方法名：匿名方法不需要方法名
  // 参数：参数类型和参数名，参数类型可缺省

  int sum(int val1, int val2) {
    return val1 + val2;
  }

  // 私有方法：
  // 通过_开头命名的方法
  // 作用域为当前文件
  // _learn() {
  //   print('私有方法');
  // }

  anonymousFunction() {
    var list = ['私有方法', '匿名方法'];
    list.forEach((index) {
      print(list.indexOf(index).toString() + ':' + index);
    });
  }
}

class TestFunction {
  FunctionLearn functionLearn = FunctionLearn();
  void start() {
    print(functionLearn.sum(1, 2));
    functionLearn.anonymousFunction();
  }
}
