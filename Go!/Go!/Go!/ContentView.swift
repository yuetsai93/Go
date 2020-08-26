//
//  ContentView.swift
//  Go!
//
//  Created by 蔡蔡 on 2020-08-23.
//  Copyright © 2020 蔡蔡. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { g in
//                    Image("goIcon").resizable().scaledToFit().padding(10)
               
                
                Text("Go!")
                        .font(.largeTitle).fontWeight(.black).foregroundColor(MyColors.greengray)
                    .frame(width: g.size.width/6, height: g.size.height/10)
                    .offset(x: g.size.width/2, y: 0)
                

                
//                Spacer()
//                HStack {
                     Button(action: {
                        print("Menu pressed!")
                        }) {
                            Image("menuIcon").resizable().scaledToFit().padding(10)
                                .frame(width: g.size.width/6, height: g.size.height/10)
    //                            .foregroundColor(Color.white)
                    }
                    .clipShape(Circle())
                    .overlay(Circle().stroke(MyColors.greengray, lineWidth: g.size.width/150))
//                    .padding(.leading)
                     .offset(x: g.size.width/1000, y: g.size.height - 2.125 * (g.size.height/10))
//                    Spacer()
//                }
                
                // Bottom row
//                HStack {
                    // Settings button
                    Button(action: {
                        print("Settiings pressed!")
                        }) {
                            Image("settingsIcon").resizable().scaledToFit().padding()
                                .frame(width: g.size.width/6, height: g.size.height/10)
                    }
                    .clipShape(Circle())
                    .overlay(Circle().stroke(MyColors.greengray, lineWidth: g.size.width/150))
//                    .background(Capsule().stroke(MyColors.greengray, lineWidth: 3))
//                    .padding(.leading)
                    .offset(x: g.size.width/1000, y: g.size.height - g.size.height/10)


                    // AddPlan button
//                    Spacer()
                    Button(action: {
                        print("New Plan!")
                        }) {
                            Image("newIcon").resizable().scaledToFit().padding(30)
                                .frame(width: g.size.width/6, height: g.size.height/10)
                                .foregroundColor(Color.white)
                                .background(MyColors.greengray)
                            .clipShape(Circle())
                    }
//                    .padding(.trailing)
                    .offset(x: g.size.width - g.size.width/6, y: g.size.height - g.size.height/10)

//                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
