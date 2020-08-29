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
                        MainPageView(menuShown: self.$menuShown)
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
