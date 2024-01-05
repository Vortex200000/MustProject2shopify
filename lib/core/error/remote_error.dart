abstract class Failures{

  String message;

  Failures(this.message);

  String toString(){
    return message;
  }
}

class RemoteFailures extends Failures{
  RemoteFailures(super.message);


}

class LocalFailures extends Failures{
  LocalFailures(super.message);


}