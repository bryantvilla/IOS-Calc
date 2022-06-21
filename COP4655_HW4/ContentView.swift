//=============================================================================
//PROGRAMMER:   Bryant Villarreal
// PANTHER ID:  6365 0700 0315 2799
// CLASS:       COP4655
// SECTION:     RVCC 1215
// SEMESTER:    Summer 2020
//
// CERTIFICATION: I certify that this work is my own and that
//                none of it is the work of any other person.
//=============================================================================

import SwiftUI

struct ContentView: View {
    
    @State var displayText:String = "0"
    @State var firstValue:String = ""
    @State var secondValue:String = ""
    @State var mathOperator:String = ""
    @State var calculationString = ""
    
    @State var scrollDisplay: [String] = []
    
    @State var firstNum = 0
    @State var secondNum = 0
    @State var firstNeg = false
    @State var secondNeg = false

    @State var isFirstValueSet = false
    @State var isSecondValueSet = false
    @State var isDotSet = false

    @State var isEqualSet = false
    @State var isValidOperation = false
    

    
    @State var resultValue:Double = 0.0
    
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                Text(displayText)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.center)
                    .padding([.top, .bottom, .trailing])
                    .frame(width: 350, height: 80, alignment: .trailing)
                    .background(Color(UIColor(red: 0.9,green: 0.9, blue: 0.7, alpha: 1)))
                    .border(Color.black)
                    .font(.largeTitle)
                
                HStack{
                    Button(action: {
                        
                        ac()
                        
                    }, label: {
                        Image("AC")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    Button(action: {
                        
                        if(Int(displayText) != nil){
                    
                                if(displayText == firstValue){
                                    firstValue = String(Int(firstValue)! * -1)
                                    firstNeg = true
                                    calculationString = firstValue
                                }
                                else if( displayText == secondValue){
                                    secondValue = String(Int(secondValue)! * -1)
                                    secondNeg = true
                                }

                            if(secondNeg || firstNeg ){
                                displayText = String(Int(displayText)! * -1)
                                calculationString = firstValue + " " + mathOperator + " " + secondValue
                            }
                            
                            
                        }
                        else if(Double(displayText) != nil){
                    
                                if(displayText == firstValue){
                                    firstValue = String(Double(firstValue)! * -1)
                                    firstNeg = true
                                    calculationString = firstValue
                                }
                                else if( displayText == secondValue){
                                    secondValue = String(Double(secondValue)! * -1)
                                    secondNeg = true
                                }

                            if(secondNeg || firstNeg ){
                                displayText = String(Double(displayText)! * -1)
                                calculationString = firstValue + " " + mathOperator + " " + secondValue
                            }
                            
                            
                        }
                        
                    }, label: {
                        Image("+-")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    Button(action: {
                        operation(type: "%")
                    }, label: {
                        Image("%")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    Button(action: {
                        operation(type: "/")
                    }, label: {
                        Image("div")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    
                }// end Hstack
                HStack{
                    Button(action: {
                        number(num: 7)
                    }, label: {
                        Image("7")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    Button(action: {
                        number(num: 8)
                    }, label: {
                        Image("8")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    Button(action: {
                        number(num: 9)
                    }, label: {
                        Image("9")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    Button(action: {
                        operation(type: "*")
                    }, label: {
                        Image("X")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    
                }// end Hstack
                HStack{
                    Button(action: {
                        number(num: 4)
                    }, label: {
                        Image("4")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    Button(action: {
                        number(num: 5)
                    }, label: {
                        Image("5")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    Button(action: {
                        number(num: 6)
                    }, label: {
                        Image("6")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    Button(action: {
                        operation(type: "-")
                    }, label: {
                        Image("-")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    
                }// end Hstack
                HStack{
                    Button(action: {
                        
                        number(num: 3)
                        
                    }, label: {
                        Image("3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    Button(action: {
                        
                        number(num: 2)
                    }, label: {
                        Image("2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    Button(action: {
                        number(num: 1)
                    }, label: {
                        Image("1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    Button(action: {
                        operation(type:"+")
                    }, label: {
                        Image("+")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    
                }// end Hstack
                HStack{
                    Button(action: {
                        number(num: 0)
                    }, label: {
                        Image("0")
                            .resizable()
                            .frame(width: 170, height: 60)
                    })
                    Button(action: {
                        
                        dot()
                        
                    }, label: {
                        Image("dot")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    Button(action: {
                        equal()
                    }, label: {
                        Image("=")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    })
                    
                }// end Hstack
                Spacer()
                Text(calculationString)
                    .padding(.all)
                    .frame(width: 350, height: 50, alignment: .leading)
                    .border(Color.black, width: 1)
                HStack{
                        ScrollView{
                            
                            ForEach((0..<scrollDisplay.count).reversed(), id:\.self){ index in
                                Text("[\(index + 1)]: \(scrollDisplay[index])").frame(width: 200 , alignment: .leading)
                            }
                        
                        }.frame(width: 350, height: 200, alignment: .leading)
                }//end Hstack
            Spacer()
            }// end Vstack
            
            
            .navigationTitle("Simple Calculator")
            .navigationBarTitleDisplayMode(.automatic)
        }// end NavigationView
        
        
    } // end body
    
    
    /// Function that adds decimal to current value
    func dot () -> Void{
        
        let occurences = calculationString.components(separatedBy: ".") // counts number of . in equation
        
            if (!isDotSet){
                
                //if calculationString is empty. adds 0. to string
                if(calculationString == ""){
                    
                    calculationString = "0."
                    
                }
                //if there are less than 2 decimal points, adds the second decimal
                else if(occurences.count - 1 < 2 && (Int(displayText) != nil || Double(displayText) != nil)){
                    calculationString += "."
                }
                //if the displayed text is
                if(displayText == "0"){
                    displayText = "0."
                }
                else if(Int(displayText) != nil){
                    displayText += "."
                }
                else{
                    return
                }
                
                if(!isFirstValueSet){
                    if( firstValue == "0"){
                        firstValue = "0."
                    }
                    else{
                        firstValue += "."
                    }
                }
                else{
                    
                    if( secondValue == "0"){
                        secondValue = "0."
                    }
                    else{
                        secondValue += "."
                    }
                }
        }// end if
        
        isDotSet = true
    } // end dot func
    
    /// Function that adds operand value(+ , - , *, etc) to caluclator
    func operation(type:String) -> Void{
        
        if(mathOperator == "" && calculationString != ""){
            
            calculationString += " " + type + " "
            mathOperator = type
            displayText = type
            isFirstValueSet = true
            isDotSet = false
            
        }// end if
    }//end plus func
    
    /// Function that determines answer to equation
    func equal() -> Void{
        
        if(!isEqualSet && secondValue != ""){
           
            isEqualSet = true
            
            switch mathOperator {
            
            //adds the first and second values
            case "+":
                
                //calculates the result based on the operand
                resultValue = Double(firstValue)! + Double(secondValue)!
                //rounds the result to fit onto the display screen
                resultValue = round(resultValue * 100_000_000_000)/100_000_000_000
                
                //displays the result on the secondary screen below the calculator
                calculationString = String(resultValue)
                
                //appends equation to the end of the array to be displayed layer
                scrollDisplay.append(firstValue + " + " + secondValue + " = " + calculationString)
                
                //displays result on calculator display screen
                displayText = String(resultValue)
                
                //used to validate that equation was calculated
                isValidOperation = true
                
            case "-":
                resultValue = Double(firstValue)! - Double(secondValue)!
                resultValue = round(resultValue * 100_000_000)/100_000_000
                calculationString = String(resultValue)
                scrollDisplay.append(firstValue + " - " + secondValue + " = " + calculationString)
                displayText = String(resultValue)
                
                isValidOperation = true
            case "*":
                resultValue = Double(firstValue)! * Double(secondValue)!
                resultValue = round(resultValue * 100_000_000_000)/100_000_000_000
                calculationString = String(resultValue)
                scrollDisplay.append(firstValue + " * " + secondValue + " = " + calculationString)
                displayText = String(resultValue)
                
                isValidOperation = true
            case "/":
                resultValue = Double(firstValue)! / Double(secondValue)!
                resultValue = round(resultValue * 100_000_000_000)/100_000_000_000
                calculationString = String(resultValue)
                scrollDisplay.append(firstValue + " / " + secondValue + " = " + calculationString)
                displayText = String(resultValue)
                
                isValidOperation = true
            case "%":
                
                if (Int(firstValue) != nil && Int(secondValue) != nil){
                    resultValue = Double(Int(firstValue)! % Int(secondValue)!)
                }
                else if (Int(firstValue) != nil && Double(secondValue) != nil){
                    
                    resultValue = Double(Double(Int(firstValue)!).truncatingRemainder(dividingBy: Double(secondValue)!))
                    resultValue = round(resultValue * 100_000_000_000)/100_000_000_000
                    
                }
                else if (Double(firstValue) != nil && Double(secondValue) != nil){
                    
                    resultValue = Double(firstValue)!.truncatingRemainder(dividingBy: Double(secondValue)!)
                    resultValue = round(resultValue * 100_000_000_000)/100_000_000_000
                }
                
                calculationString = String(resultValue)
                displayText = String(resultValue)
                scrollDisplay.append(firstValue + " % " + secondValue + " = " + calculationString)
                isValidOperation = true
                
            default:
                print("No operation executed")
                isEqualSet = false
            } // end switch
            
            //if the equation was calculated, resets everything to default values
            if(isValidOperation){
                
                firstValue = String(resultValue)
                secondValue = ""
                
                isFirstValueSet = true
                isSecondValueSet = false
                mathOperator = ""
            
                isEqualSet = false
                isDotSet = true
                
                firstNeg = false
                secondNeg = false
               
            }
        }// end if
        
    }// end equal func
    
    /// Clears and resets everything to default value
    func ac() -> Void{
        
        //sets the calculator display to 0
        displayText = "0"
        //empties the calculationString
        calculationString = ""
        
        //appends to scrollDisplay array so it can be displayed later
        scrollDisplay.append("AC -> 0")
        
        isDotSet = false
        
        // clears first and second values
        firstValue = ""
        secondValue = ""
   
        //sets both first and secondvalues to false
        isFirstValueSet = false
        isSecondValueSet = false
     
        //empties mathOperator and sets equal check to false
        mathOperator = ""
        isEqualSet = false
        
    }// end ac func
    
    /// function used to show numbers on display
    func number(num:Int) -> Void{
        
        // displays number selected on the bottom display of the calculator
        if(displayText.count < 14){
            calculationString += String(num)
        }
        //if the display has an operand, displays the number selected instead
        if(displayText == "0" || displayText == "+"
            || displayText == "-" || displayText == "*"
            || displayText == "/" || displayText == "%"  ){
            displayText = String(num)
        }
        // else displays number
        else if(displayText.count < 14){
            displayText += String(num)
        }// end if else
        
        //if the firstValue is not set, sets first value equal to the number selected
        if(!isFirstValueSet && displayText.count < 14){
            firstValue += String(num)
        }
        //otherwise, sets the secondValue to the number input
        else if (!isSecondValueSet && displayText.count < 14){
            secondValue += String(num)
        }// end if else
        
        
    }
    
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
