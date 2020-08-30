//
//  SideMenuView.swift
//  Go!
//
//  Created by 蔡蔡 on 2020-08-28.
//  Copyright © 2020 蔡蔡. All rights reserved.
//

import SwiftUI

struct SideMenuView: View {
    
    // a state variable limiting the side menu not to slide over the whole screen
//    @State var size = UIScreen.main.bounds.width / 1.6
    
    // a ViewModifier for title texts
    struct TitleStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 25))
                .foregroundColor(MyColors.greengray)
        }
    }
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            return content.shadow(color: .black, radius: 5, x: 2, y: 2)

        }
    }
    
    var body: some View {
        
        GeometryReader { g in
            VStack {
                // Top row
                HStack {
                    Image(systemName: "house.fill").foregroundColor(MyColors.greengray).padding(.leading)
                    Text("All").modifier(TitleStyle())
                    Spacer()
//                    Button(action: {
//                        self.size = 10
//                    }) {
//                        Text("Close").foregroundColor(MyColors.greengray)
//                        Image(systemName: "xmark")
//                    }
                }.frame(width: g.size.width)
                
                Spacer()
                
                // Bottom row
                Button(action: {
                    print("Settiings pressed!")
                    }) {
                        HStack {
                            Image("settingsIcon").resizable().scaledToFit().padding(5)
                            .frame(width: g.size.width/6, height: g.size.height/10).foregroundColor(MyColors.greengray)
                            Text("Settings").modifier(TitleStyle())
                        }                        .frame(width: g.size.width, height: g.size.height/10)
                        .background(MyColors.lightgrey)
                        .cornerRadius(40)
//                        .buttonStyle(PlainButtonStyle())
                }
            }
        }.frame(width: UIScreen.main.bounds.width / 1.6)
//        .navigationBarTitle("Menu")
//        .navigationBarItems(leading: Button(action: {
//                self.size = 10
//        }, label: {
//            Image("goIcon").resizable().frame(width:20, height:20)
//        }).foregroundColor(.black))
        
    }
            
//            ) {
//                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
//            })
        
}

//struct menu: View {
//
//    @Binding var size: CGFloat
//
//
//
//    var body: some View {
//
//    }
//}
struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
