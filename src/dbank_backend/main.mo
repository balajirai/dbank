import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor DBank {
  var currentValue: Nat = 300;
  currentValue := 100;

  let id = 1234567890;

  // Debug.print("Hello");
  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));

  public func topUp(amount: Nat){
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };

  // topUp();

  public func withdrawal(amount: Nat){
    let tempValue: Int = currentValue - amount;
    if(tempValue >= 0){
      currentValue-=amount;
      Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("Amount too large. No withdrawal");
    }
  };

  // read only type (much faster than above update functions)
  public query func checkBalance(): async Nat{
    return currentValue;
  }

}
