import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor DBank {
  stable var currentValue: Float = 300;
  // currentValue := 300;

  stable var startTime = Time.now();
  // startTime := Time.now();

  Debug.print(debug_show(startTime));

  let id = 1234567890;

  // Debug.print("Hello");
  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));

  public func topUp(amount: Float){
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };

  // topUp();

  public func withdrawal(amount: Float){
    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0){
      currentValue-=amount;
      Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("Amount too large. No withdrawal");
    }
  };

  // read only type (much faster than above update functions)
  public query func checkBalance(): async Float{
    return currentValue;
  };

  // calculating compound interest
  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNs = currentTime - startTime;    // nano-second
    let timeElapsedS = timeElapsedNs / 1000000000;  // second

    // compound interest formula : A = P(1 + r/n)^(nt)
    currentValue := currentValue * ((1 + 0.01) ** Float.fromInt(timeElapsedS));

    // update the start time of compound interest for further compounding
    startTime := currentTime;
  };

}