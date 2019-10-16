class AsyncAction {
  
  //Also not allowed :(
 AsyncAction() {
    var onReady = new Future(() {
      // Do Stuff
      Future.delayed(Duration(seconds: 2));
      print("teste");
    });
    print("teste 2");    
  }
}