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
      currentValue-=amount;
      Debug.print(debug_show(currentValue));
  };
  
}
