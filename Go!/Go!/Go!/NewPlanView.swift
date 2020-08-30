//
//  NewPlanView.swift
//  Go!
//
//  Created by 蔡蔡 on 2020-08-29.
//  Copyright © 2020 蔡蔡. All rights reserved.
//

import SwiftUI

struct NewPlanView: View {
    
    @State var title: String = ""
    @State var content: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                GeometryReader { g in
                    VStack(alignment: .center) {
                        Image("placeholder")
                            .resizable()
                            .scaledToFill()
                            .frame(width: g.size.width/2)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 3))
                            .shadow(radius: 10)
                        TextField("Title", text: self.$title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Text("\(self.title)").font(.title)
                        TextField("Content", text: self.$content)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Text("\(self.content)")
                    }
                }
            }
        }
        .navigationBarTitle("New Plan", displayMode: .inline)
        .edgesIgnoringSafeArea(.all)
    }
}

struct NewPlanView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlanView()
    }
}
