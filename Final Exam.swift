//Final Exam

import Foundation

print("Hello World")
import Foundation
import Glibc

enum Colour{
    case black, blue, red, white, yellow
}

// Creating the class for MotorVehicle


 class SurMotorVehicle:CustomStringConvertible{
     var surYear:Int
     var surColour:Colour
     
     init(_ surYear:Int,_ surColour:Colour) {
         self.surYear = surYear
         self.surColour = surColour
     }
     
     var description : String{
         return "motor year: \(surYear), colour:\(surColour):"
     }
     
     func surCalculateOilFee()-> Int {
         return 0
     }
 }
 
// Inheriting the properties and methods of  SurMotorVehicle to Surboat 

 class Surboat : SurMotorVehicle{
     var surquantInfo : String
     var surboatPrice : Double
     var surboatFrequency : Int
     
     init(_ surYear:Int, _ surColour:Colour, surquantInfo:String, surboatPrice : Double, surboatFrequency : Int){
         self.surquantInfo=surquantInfo
         self.surboatPrice=surboatPrice
         self.surboatFrequency=surboatFrequency
         super.init(surYear,surColour)
         
     }
     
     override var description: String{
         return "quant:\(surquantInfo),surboatFrequency:\(surboatFrequency), boat oil Fee\(surCalculateOilFee()) "
     }
     
     override func surCalculateOilFee()-> Int{
         let result:Int = Int(surboatPrice) * (surboatFrequency)
         return result
     }
     
 }
 
 //Create protocol  streetLegal, which has three method xxxsignalStop.  xxxsignalLeftTurn, xxxsignalRightTurn. 
  

 protocol streetLegal:CustomStringConvertible{
     func sursignalStop()
     func sursignalLeftTrun()
     func sursignalRightTurn()
 }
 
 //Creating car class which is the subclass of SurMotorVehicle and defining the car details like properities surwheelInfo,surcarPrice,surcarFrequency, description and calculation of Oil fee and also printing the car operation at the signal using the three different functions
 
 class SurCar : SurMotorVehicle,streetLegal {
     var surwheelInfo : String
     var surcarPrice : Double
     var surcarFrequency : Int
     
     init(surYear:Int, surColour:Colour, surwheelInfo:String, surcarPrice : Double, surcarFrequency : Int){
         
         self.surwheelInfo=surwheelInfo
         self.surcarPrice=surcarPrice
         self.surcarFrequency=surcarFrequency
         super.init(surYear,surColour)
         
     }
     
     override var description: String{
         return "wheelInfo:\(surwheelInfo),surcarFrequency:\(surcarFrequency), car oil Fee\(surCalculateOilFee()) "
     }
     
     override func surCalculateOilFee()-> Int{
         let result:Int = Int(surcarPrice) * (surcarFrequency)
         return result
     }
     func sursignalStop(){
         print("Car Stop")
     }
     func sursignalLeftTrun(){
         print("Car makes left turn")
     }
     func sursignalRightTurn(){
         print("Car makes right turn")
     }
 }
 

 
 class SurBicycle : streetLegal{
     var surBrandName : String
     var description:String{
        return "brand name:\(surBrandName)"
     }
     
     init (surBrandName:String){
         self.surBrandName = surBrandName
     }
     
     func sursignalStop(){
         print("Bicycle stops at the signal")
     }
     
     func sursignalLeftTrun(){
         print("Bicycle makes left turn")
     }
     
     func sursignalRightTurn(){
         print("Bicycle makes right turn")
     }
 }
 
 class SurPedestrain : streetLegal{
     var surName:String
     var description:String{
         return "Name of the person: \(surName)"
     }
     
     init(surName:String){
         self.surName = surName
     }
     func sursignalStop(){
         print("pedestrain stops at the signal")
     }
     
     func sursignalLeftTrun(){
         print("pedestrain makes left turn")
     }
     
     func sursignalRightTurn(){
         print("pedestrain makes right turn")
     }
 }
 
 
 
 var mortorvehicle:SurMotorVehicle =  SurMotorVehicle( 2020,  Colour.black )
 //print(mortorvehicle.description)
 
 var surboat = Surboat(2019, Colour.blue, surquantInfo:"Wooden deck", surboatPrice : 50.0, surboatFrequency : 5)
 //print(surboat.description)
 
 
 var surcar = SurCar(surYear:2013 , surColour:Colour.white, surwheelInfo:"steel wheels", surcarPrice : 25.5, surcarFrequency : 5)
 //print(surcar.description)
 //surcar.sursignalLeftTrun()
 var vehiclesList: [SurMotorVehicle] = [mortorvehicle, surboat, surcar]
 
 for i in vehiclesList{
     print(i)
 }
 
 var surBicycle = SurBicycle(surBrandName: "Atlas")
 
 var surPedestrain = SurPedestrain(surName:"Suresh")
 
 
 var cycleDetails : [streetLegal] = [surBicycle, surPedestrain] 
 
 for i in cycleDetails{
     print(i)
 }
 
 
 
 
 
 
 
 
 
 
 