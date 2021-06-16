/**

                            Online Swift Compiler.
                Code, Compile, Run and Debug Swift script online.
Write your code in this editor and press "Run" button to execute it.

*/


//Final Project


import Foundation
import Glibc
 // Creating a class for StockHolding details

 class StockHolding{
     var purchaseSharePrice:Float 
     var currentSharePrice:Float
     var numberOfShares:Int
     var companyName:String
     
     init(_ purchaseSharePrice:Float,_ currentSharePrice:Float, _ numberOfShares:Int,_ companyName:String){
         self.purchaseSharePrice = purchaseSharePrice
         self.currentSharePrice = currentSharePrice
         self.numberOfShares = numberOfShares
         self.companyName = companyName
     }
     
     func costInDollars()-> Float{
         return Float(numberOfShares) * purchaseSharePrice
     }
     
      func valueInDollars()-> Float{
         return Float(numberOfShares) * currentSharePrice
     }
 }
 
// Creating a class of  ForeignStockHolding which inherites the properties from StockHolding 

 class ForeignStockHolding:StockHolding {
     var conversionRate:Float
     
     init(_ purchaseSharePrice:Float,_ currentSharePrice:Float, _ numberOfShares:Int,_ companyName:String, _ conversionRate:Float){
        self.conversionRate = conversionRate
        super.init(purchaseSharePrice, currentSharePrice, numberOfShares, companyName)
     }
     
     override func costInDollars()-> Float{
         return Float(numberOfShares) * purchaseSharePrice * conversionRate
     }
     
      override func valueInDollars()-> Float{
         return Float(numberOfShares) * currentSharePrice * conversionRate
     }
     
 }
 


 
 var facebookStock = StockHolding(25.0, 50.0, 4, "Facebook")
 
 print(facebookStock.costInDollars())
 var youtubeStock = StockHolding(25.0, 40.0, 2, "Youtube")
 var googleStock = StockHolding(20.5, 60.0, 5, "Google")
 
 var stockList : [StockHolding] =  [facebookStock, youtubeStock, googleStock]
 
stockList.sort(by: { $0.companyName < $1.companyName } )

 
for i in stockList{
    print(i.companyName)
}
 
 
var ablibabaStock = ForeignStockHolding(35.0, 13.5, 4, "Alibaba", 2.5) 

var amazonStock = ForeignStockHolding(45.0, 16.5, 6, "Amazon", 3.5)

print(ablibabaStock.costInDollars())

stockList  += [ablibabaStock,amazonStock]

stockList.sort(by: { $0.companyName > $1.companyName } )
for i in stockList{
    print(i.companyName)
}
//--------------------------------------------------

//Decleration of functions required in the program using protocol


protocol requiredFunctions{
    func numberOfStocks()
    func typeOfStock()
    func quantityOfStock()
    func priceOfStock()
    func conversionRateOfStock()
    func stockOfCompany()
    func lowestStockValue()
    func highestStockValue()
    func mostProfitableStock()
    func leastProfitableStock()
    func sortByName()
    func lowToHighStockValue()
    func menu()
}

func numberOfStocks() -> Int{
    var stocknumber: Int = 0
        print("Please enter the number of stocks you want to purchase")
        
        if let input1 = readLine(){
            print(" Entered value is \(input1) ")
            
            if let input1 = Int(input1)  {
                stocknumber = input1 > 0 && input1 < 9 ? input1 : 0
            }
        }
        
        if stocknumber <= 0  {
            
            print(" please enter a value between 1 and 8 ")
            stocknumber = numberOfStocks()
        }
        else{
           
            return stocknumber
        }
        
    return stocknumber
}  
    

func typeOfStock() -> Int {
    var valueOfStock : Int = 0
         print("\n Choose the type of stock 1. for Local Stocks \n 2. Foreign Stock   ")
        if let input1 = readLine(){
            print(" Entered value is \(input1) ")
            if let input1 = Int(input1) {
                valueOfStock = [1,2].contains(input1) ? input1 : 0
            }
        }
        if valueOfStock <= 0{
            print(" enter a valid Number ")
            valueOfStock = typeOfStock()
        }else{
           
            return valueOfStock
        }
    return valueOfStock
}


func quantityOfStock() -> Int {
    var valueOfStockQuantity : Int = 0
         print("\n Enter the number of Stock")
        if let input1 = readLine(){
            print(" Enter value is \(input1) ")
            if let input1 = Int(input1) {
                valueOfStockQuantity = input1 > 0 ? input1 : 0
            }
        }
        if valueOfStockQuantity <= 0{
            print(" enter a valid number ")
            valueOfStockQuantity = quantityOfStock()
        }else{
            return valueOfStockQuantity
        }
    return valueOfStockQuantity
}


func priceOfStock(_ stock:String) -> Float {
    var stockPrice : Float = 0.0
         print("\n Enter  \(stock) Stock price  ")
        if let input1 = readLine(){
            print(" Enter value is \(input1) ")
            if let input1 = Float(input1) {
                stockPrice = input1 > 0.0 ? input1 : 0.0
            }
        }
        if stockPrice <= 0.0{
            print(" Enter a valid price ")
            stockPrice = priceOfStock(stock)
        }else{
            return stockPrice
        }
    
    return stockPrice
}





func stockOfCompany() -> String {
    var companyName : String = ""
         print("\n Enter the Name of  Company ")
        if let input1 = readLine(){
            print(" Enter value is \(input1) ")
            if !input1.contains("\"") && !input1.isEmpty {
                companyName = (input1 != "") ? input1 : ""
            }
        }
        if companyName <= ""{
            
            print(" please enter a valid Company Name ")
            companyName = stockOfCompany()
        }else{
            return companyName
        }
    return companyName
}

func conversionRateOfStock() -> Float {
    var conversionRate : Float = 0.0
         print("\n Enter the  Stock conversion rate  ")
        if let input1 = readLine(){
            print(" Enter value is \(input1) ")
            if let input1 = Float(input1) {
                conversionRate = input1 > 0.0 ? input1 : 0.0
            }
        }
        if conversionRate <= 0.0{
            conversionRate = conversionRateOfStock()
            print(" please enter a valid rate ")
        }else{
            return conversionRate
        }
    return conversionRate
}

var stocknumber: Int = 0
stocknumber = numberOfStocks()


var listOfStockadded : [StockHolding] = []

for i in 1...stocknumber{
    print("\n \nEnter the details of the \(i) stock ")
    var valueOfStock : Int 
    valueOfStock = typeOfStock()
    
    
    var stockPurchaseValue : Float
    stockPurchaseValue = priceOfStock("Purchase")
    
    
    var stockCurrentValue : Float
    stockCurrentValue = priceOfStock("Current")
    

    var valueOfStockQuantity : Int 
    valueOfStockQuantity = quantityOfStock()
    
    
    var companyName : String 
    companyName = stockOfCompany()
   
    
    if valueOfStock == 1 {
        let stock = StockHolding(stockPurchaseValue,stockCurrentValue,valueOfStockQuantity,companyName)
        listOfStockadded.append(stock)
        print("Stock \(i) value been added")
    } 
    if valueOfStock == 2 {
        
        var conversionRate : Float 
        conversionRate = conversionRateOfStock()
        print(conversionRate)
   
        let stock = ForeignStockHolding(stockPurchaseValue,stockCurrentValue,valueOfStockQuantity,companyName,conversionRate )
        listOfStockadded.append(stock)
        print("Stock of \(i) has added")
    }
}

func lowestStockValue(){
    let stock = listOfStockadded.min(by : {$0.currentSharePrice < $1.currentSharePrice})
    
    if let stock = stock{
        print("\n\n The Lowest Current Value stock is  \((stock.companyName).uppercased())  \n\t brought at \(stock.purchaseSharePrice) \n\t in Quantity \(stock.numberOfShares) \n\tis current price : \(stock.currentSharePrice)\n")
    }
}


func highestStockValue(){
    let stock = listOfStockadded.min(by : {$0.currentSharePrice > $1.currentSharePrice})
    
    if let stock = stock{
        print("\n\n The Highest Current Value stock is  \(((stock.companyName).uppercased()))  \n brought at \(stock.purchaseSharePrice) \n Quantity of \(stock.numberOfShares) \n current price : \(stock.currentSharePrice)\n")
    }
}


func mostProfitableStock(){
    let stock = listOfStockadded.min(by : { ($0.currentSharePrice - $0.purchaseSharePrice)/$0.purchaseSharePrice > ($1.currentSharePrice - $1.purchaseSharePrice)/$1.purchaseSharePrice  })
    
    if let stock = stock{
        let profit = ((stock.currentSharePrice - stock.purchaseSharePrice)/stock.purchaseSharePrice * 100).rounded()
        
        print("\n\n The Most Profitable stock is  \((stock.companyName).uppercased())  \n brought at \(stock.purchaseSharePrice) \n Quantity of \(stock.numberOfShares) \n current price : \(stock.currentSharePrice)\n\t and Profit percentage is \(profit) \n ")
    }
}



func leastProfitableStock(){
    let stock = listOfStockadded.min(by : { ($0.currentSharePrice - $0.purchaseSharePrice)/$0.purchaseSharePrice < ($1.currentSharePrice - $1.purchaseSharePrice)/$1.purchaseSharePrice  })
    
    if let stock = stock{
        let profit = ((stock.currentSharePrice - stock.purchaseSharePrice)/stock.purchaseSharePrice * 100)
        
        print("\n\n The Most Profitable stock is \" \((stock.companyName).uppercased()) \n brought at \(stock.purchaseSharePrice) \n  Quantity of \(stock.numberOfShares) \n current price : \(stock.currentSharePrice)\n\t and Profit percentage is \(profit) \n ")
    }
}


func sortByName(){
    let sortedstocks = listOfStockadded.sorted(by : {$0.companyName < $1.companyName})
    
    print(" Displaying the stocks in an alphebetical order  based on company name \n")
    
    for stock in sortedstocks{
        print("\t--> The stock is  \((stock.companyName).uppercased())  \n brought at \(stock.purchaseSharePrice) \t in Quantity \(stock.numberOfShares) \tis current price : \(stock.currentSharePrice)")
    }
}


func lowToHighStockValue(){
    let sortedstocks = listOfStockadded.sorted(by : {$0.currentSharePrice < $1.currentSharePrice})
    
    print(" Displaying the stocks from lowest to highest based on Stocks Current value  \n")
    
    for stock in sortedstocks{
        print("\t--> The stock is \((stock.companyName).uppercased()) \n brought at \(stock.purchaseSharePrice) \n  Quantity of \(stock.numberOfShares) \n current price : \(stock.currentSharePrice)")
    }
}


// Creating  menu for the user view


func menu(){
    print("\n \n Select From  The Following Options from 1 to 7  To Continue")
    print("\n1. Display stock information with the lowest value. \n\n2.Display stock with the highest value.\n\n3.Display the most profitable stock.\n\n4.Display the least profitable stock.\n\n5.List all stocks sorted by company name (A-Z)\n\n6.List all stocks sorted from the lowest value to the highest value\n\n7.Exit\n")
    
    var enteredValue : Int = 0
    
    print("\n Choose an option to continue")
    if let input1 = readLine(){
        print(" Entered value is \(input1) ")
        if let input1 = Int(input1) {
            enteredValue = input1 > 0 && input1 < 8 ? input1 : 0
        }
        
    }
    
    switch enteredValue {
    case 1:
        lowestStockValue()
		menu()
    case 2:
        highestStockValue()
		menu()
	case 3:
        mostProfitableStock()
		menu()
	case 4:
        leastProfitableStock()
    	menu()
	case 5:
        sortByName()
    	menu()
	case 6:
        lowToHighStockValue()
		menu()
    case 7:
        print("Exiting the menu and program ..... ")
        return
    
    default:
        print("Please enter a valid option")
        menu()
    }

    
}

menu()



 
 
 
 
 
 
 
 
 
 