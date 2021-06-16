/**

                            Online Swift Compiler.
                Code, Compile, Run and Debug Swift script online.
Write your code in this editor and press "Run" button to execute it.

*/


print("Hello World")
//Lab Test code



 
 // Creating the wheels details 
 

enum Colour{
     case black, blue, white, green, yellow
 }
struct SurWheel{
    var surColour:Colour
    var surYear:Int
    var surManufactory:String
    
    init(_ surYear:Int, _ surManufactory:String, _ surColour:Colour){
        self.surYear = surYear
        self.surManufactory = surManufactory
        self.surColour = surColour
    }
    
    func wheelDetails()-> String{
       return " The properties of SurWheels are \(surColour), \(surYear), \(surManufactory) "
    }
}    
    extension SurWheel:CustomStringConvertible{
            var description : String {
            let string =  wheelDetails()
            return string
        }
    }

// Creating the wheels of four types

var wheel1 = SurWheel(2020, "MRF", Colour.black)
var wheel2 = SurWheel(2020, "MRF", Colour.black)
var wheel3 = SurWheel(2020, "MRF", Colour.black)
var wheel4 = SurWheel(2020, "MRF", Colour.black)



print(wheel1)


// creating a strcture that contains the Surcar details
struct SurCar{
   var surColour:Colour
   var surYear:Int
   var surManufactory:String
   var surWheels = [SurWheel]()

   init(_ surColour:Colour, _ surYear:Int, _ surManufactory:String, _ surWheels:[SurWheel]) {
       self.surColour = surColour
       self.surYear = surYear
       self.surManufactory = surManufactory
       self.surWheels = surWheels
   }

  mutating func addsurWheel(_ oneWheel:SurWheel){
       surWheels.append(oneWheel)

   }
   
   mutating func removeWheel(index: Int){
       surWheels.remove(at : index)
   }
   
   func getNumberofsurWheels()-> Int{
       return surWheels.count
   }
   
  func carInfo() -> String{
        var cardetails = "The Features of SurCar is \(surColour), \(surYear), \(surManufactory)  "
       for wheel in surWheels{
            cardetails += (  "\n " + wheel.wheelDetails())
        }
        
        return cardetails   
    }
}

// Creating an instance of surCar with the required properties

var surCar = SurCar(Colour.blue,  2020, "Honda", [wheel1, wheel2, wheel3])
surCar.addsurWheel(wheel4)
surCar.removeWheel(index: 0)
print(surCar.getNumberofsurWheels())
print(surCar.carInfo())















































































