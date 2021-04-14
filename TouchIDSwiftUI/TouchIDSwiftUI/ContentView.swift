//
//  ContentView.swift
//  TouchIDSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 14/04/21.
//  The App Wizard
//  Instagram : theappwizard2408

import SwiftUI

private let gradient = AngularGradient(
    gradient: Gradient(colors: [Color("blueCol"), Color("cyanCol")]),
    center: .center,
    startAngle: .degrees(180),
    endAngle: .degrees(0))



struct ContentView: View {
    var body: some View {
        FinalView()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


























struct FinalView: View {
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        FingerprintView()
            
            VStack{
                
                HStack{
                Text("Hello Shreyas,")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    Spacer()
                }.frame(width: 350, height: 50, alignment: .center)
                
                
                Text("Use touch ID to login to bank account")
                    .font(.title2)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                
                
               
                Spacer().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 500, alignment: .center)
                
                
                Rectangle()
                    .frame(width: 350, height: 2, alignment: .center)
                    .foregroundColor(.white).opacity(0.5)
                    .padding()
                
                
                HStack{
                Text("or just use password instead.")
                    .font(.title2)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white).opacity(0.8)
                    Spacer()
                }.frame(width: 350, height: 20, alignment: .center)
                
                HStack{
               
                    RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.clear)
                    .frame(width: 280, height: 65, alignment: .center)
                        .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.white, lineWidth: 1))
                    
                    
                    ZStack{
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 65, height: 65, alignment: .center)
                        
                        
                        Image(systemName: "chevron.forward")
                            .resizable()
                            .frame(width: 20, height: 30, alignment: .center)
                    }
                }.padding()
            }
        }
    }
}


struct FingerprintView: View {
    
    @State private var touch = false
    @State private var touchopacity = false
    @State private var tickcircle = false
    
    
    @State private var borderanim : CGFloat = 0.0
   
    
    let timer = Timer.publish(every: 3.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            
            
            
            
            
            Button(action: {
                self.touch.toggle()
                        }) {
                            Image("fingerw")
                                    .resizable()
                                    .frame(width: 130, height: 130, alignment: .center)
                                    .opacity(0.8)
                            }
            if touch {
                ZStack{
                    Image("fingerg")
                            .resizable()
                            .frame(width: 130, height: 130, alignment: .center)
                            .opacity(touchopacity ? 1 : 0)
                            .shadow(color: .blue, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                            .animation(Animation.easeInOut(duration: 2))
                                        .onAppear() {
                                            self.touchopacity.toggle()
                                        }
                           
                    Circle()
                           .trim( from: 0, to: self.borderanim)
                           .stroke(gradient, lineWidth: 5)
                           .frame(width: 220, height: 220, alignment: .center)
                            .rotationEffect(.degrees(-90))
                           .onReceive(timer) { _ in
                                withAnimation {
                                    guard self.borderanim < 1 else { return }
                                                        self.borderanim += 1
                                        }
                            }
                    
                    
                    Circle()
                        .foregroundColor(.black).opacity(0.3)
                        .frame(width: 200, height: 200, alignment: .center)
                        .blur(radius: 3.0)
                        .scaleEffect(tickcircle ? 0 : 1)
                        .animation(Animation.easeInOut(duration: 5))
                                    .onAppear() {
                                        self.tickcircle.toggle()
                                    }
                   
                
                }
            }
        }.offset(x: 0, y: -45)
   }
}
