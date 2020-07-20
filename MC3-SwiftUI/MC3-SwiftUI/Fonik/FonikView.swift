//
//  SwiftUIView.swift
//  MC3-SwiftUI
//
//  Created by Reyhan Rifqi on 18/07/20.
//  Copyright © 2020 Poppy. All rights reserved.
//

import SwiftUI

struct FonikView: View {
    
    @State var buttonStyle = SelectableButtonStyle()

 
    @State private var gambar = "Gambar Anggur"
    @State private var gambarDesc = "Anggur"
    @State private var title = "Aa"
    @State private var subTitle = "a..a..a.."
    @State private var sound = "Sound"



    fileprivate func scrollViewItem() -> some View {
        return ForEach(listOfFonik, id: \.alfabet){ fonik in
            Button(action: {
                self.buttonStyle.isSelected = !self.buttonStyle.isSelected
                self.gambarDesc = "\(fonik.alfabet)"
                self.gambar = "\(fonik.gambar)"
                self.title = "\(fonik.title)"
                self.subTitle = "\(fonik.subTitle)"
                self.sound = "\(fonik.sound)"
                
            }) {
                Text("\(fonik.alfabet)")
                    .font(.system(size: 30, weight: .medium, design: .default))
                
            }
                
            .buttonStyle(self.buttonStyle)
            .padding(.top, 5)
            .padding(.bottom, 3)
            .padding(.leading, 10)
            .padding(.trailing,10)
        }
        .padding()
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color(red: 1, green: 0.81, blue: 0.42))
            VStack{
                Text("Fonik")
                HStack{
                    VStack{
                        Text("Fonik")
                        ScrollView() {
                            scrollViewItem()

                        }
                        .background(Color.white)
                            .frame(width: 70, height: 400, alignment: .center)
                            .cornerRadius(10)
                            
                    }.padding(.leading, 100)

                    Spacer()
                    ZStack{
                        Rectangle()
                        .frame(width: 300, height: 500, alignment: .center)
                        .cornerRadius(50)
                        .foregroundColor(Color.white)
                        VStack{
                            Text("\(gambar)")
                            Text("\(gambarDesc)")
                            .font(.system(size: 34, weight: .bold, design: .default))
                        }
                        
                    }
                    Spacer()
                    VStack{
                        Text("\(title)")
                        .font(.system(size: 90, weight: .bold, design: .default))
                        Text("\(subTitle)")
                        .font(.system(size: 25, weight: .medium, design: .default))
                        Text("\(sound)")
                        
                    }.padding(.trailing, 100)
                }
            }
        }
    
    }
}

struct FonikView_Previews: PreviewProvider {
    static var previews: some View {
        FonikView()
    }
}

struct SelectableButtonStyle: ButtonStyle {

    var isSelected = false
    let color = Color(red: 0.60, green: 0.60, blue: 0.60)
    let color2 = Color(red: 0.79, green: 0.26, blue: 0.00)
    
    func makeBody(configuration: Self.Configuration) -> some View {
        
        configuration.label
            .frame(width: 20.0, height: 20.0, alignment: .center)
            .padding()
            //.foregroundColor(configuration.isPressed ? Color.red : Color.white)

            .background(configuration.isPressed ?  color2 : color)
            .clipShape(RoundedRectangle(cornerRadius: isSelected ? 16.0 : 0.0))
            //.overlay(RoundedRectangle(cornerRadius: isSelected ? 16.0 : 0.0).stroke(lineWidth: isSelected ? 2.0 : 0.0).foregroundColor(Color.pink))
            .animation(.linear(duration: 0.1))
            .cornerRadius(15)
    }
}