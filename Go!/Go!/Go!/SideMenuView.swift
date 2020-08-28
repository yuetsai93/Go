//
//  SideMenuView.swift
//  Go!
//
//  Created by 蔡蔡 on 2020-08-28.
//  Copyright © 2020 蔡蔡. All rights reserved.
//

import SwiftUI

struct SideMenuView: View {
    
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
                    HStack {
                        Image(systemName: "house.fill").foregroundColor(MyColors.greengray).padding(.leading)
                        Text("Menu").modifier(TitleStyle())
                        Spacer()
                    }
                    Spacer()
                    Button(action: {
                        print("Settiings pressed!")
                        }) {
                            HStack {
                                Image("settingsIcon").resizable().scaledToFit().padding(5)
                                .frame(width: g.size.width/6, height: g.size.height/10).foregroundColor(MyColors.greengray)
                                Text("Settings").modifier(TitleStyle())
                            }
                            .frame(width: g.size.width, height: g.size.height/10)
                            .background(MyColors.lightgrey)
    //                        .buttonStyle(PlainButtonStyle())
                    }
            }
        }
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
