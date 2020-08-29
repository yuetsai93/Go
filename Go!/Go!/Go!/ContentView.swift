//
//  ContentView.swift
//  Go!
//
//  Created by 蔡蔡 on 2020-08-23.
//  Copyright © 2020 蔡蔡. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // state variable to control whether the side menu is showing
    @State var menuShown = false
    
    var body: some View {
        
//        let tapToClose = DragGesture()
//            .onEnded{
//                if $0.translation.width < -100 {
//                    self.menuShown = false
//                }
//            }
        
        return ZStack(alignment: .top) {
            NavigationView {
                GeometryReader { g in
                ZStack(alignment: .leading) {
                    MainView(menuShowed: self.$menuShown)
                        .frame(width: g.size.width, height: g.size.height)
                        .offset(x: self.menuShown ? g.size.width / 1.6 : 0)
    //                    .disabled(self.menuShown ? true : false)
                    if self.menuShown {
                        SideMenuView()
                            .frame(width: g.size.width/1.6)
                            .transition(.move(edge: .leading))
                    }
                }
    //        .gesture(tapToClose)
                   
            }
    //        .navigationBarTitleView(Image("goIcon"))
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading:
                HStack {
                    Button(action: {withAnimation {
                        self.menuShown.toggle()
                        }
                    }) {
                        Image(systemName: "list.dash").foregroundColor(MyColors.greengray)
                    }
                }
    //            , trailing:
    //            HStack {
    //                Image("goIcon").resizable().frame(width: 40, height: 40)
    //            }
            )
            }
            
            HStack {
                // TODO: hardcoded frame for now, change it after finishing the logics
                Image("goIcon").resizable().scaledToFit().frame(width:40, height:40)
                Text("Go!").font(.title)
            }
        }
    }
}

// The main screen of Go!
struct MainView: View {
    
    @Binding var menuShowed: Bool
    var body: some View {
        VStack {
            GeometryReader { g in
                HStack(alignment: .center) {
                    Image("goIcon").resizable().scaledToFit().frame(width: g.size.width/6, height: g.size.height/15)
                    Text("Go!").font(.title).fontWeight(.black).foregroundColor(MyColors.greengray)
                }
                .frame(width: g.size.width)
                .background(MyColors.lightgrey)
//                .edgesIgnoringSafeArea()
                
//                RoundedRectangle(cornerRadius: 10).frame(width: g.size.width + 10, height: g.size.width/150).offset(y: g.size.height/15)
                
//                Spacer()
//                HStack {
                     Button(action: {
                        withAnimation {
                            self.menuShowed.toggle()
                        }
                        print("Menu pressed!")
                        }) {
                            Image("menuIcon").resizable().scaledToFit().padding(10)
                                .frame(width: g.size.width/6, height: g.size.height/10)
    //                            .foregroundColor(Color.white)
                    }
                    .clipShape(Circle())
                    .overlay(Circle().stroke(MyColors.greengray, lineWidth: g.size.width/150))
                    .padding(.leading)
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
                    .padding(.leading)
                        .padding(.bottom)
                    .offset(x: g.size.width/1000, y: g.size.height - g.size.height/10)


                    // AddPlan button
//                    Spacer()
                    Button(action: {
                        print("New Plan!")
                        }) {
                            Image("newIcon").resizable().scaledToFit().padding()
                                .frame(width: g.size.width/6, height: g.size.height/10)
                                .foregroundColor(Color.white)
                                .background(MyColors.greengray)
                            .clipShape(Circle())
                    }
                    .offset(x: g.size.width - g.size.width/5, y: g.size.height - g.size.height/10)
                    .padding(.trailing)
                    .padding(.bottom)

//                }
                
            }
        }
        .edgesIgnoringSafeArea(.all)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
