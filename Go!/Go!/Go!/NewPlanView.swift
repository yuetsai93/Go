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
    @State var location: String = ""
    @State var content: String = ""
    @State var startDate = ""
    @State var showDatePicker = false
    @State var date = Date()
    @State var endDate = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    struct TextFieldModifier: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                GeometryReader { g in
                    VStack(alignment: .center) {
                        ZStack(alignment: .top) {
                            Image("worldmap")
                                .resizable()
                                .scaledToFit()
                            Image("placeholder")
                                .resizable()
                                .scaledToFill()
                                .padding(.top)
                                .frame(width: g.size.width/2)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                                .shadow(radius: 10)
                        }
                        
                        Group {
                            TextField("Title", text: self.$title)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading)
                                .padding(.trailing)
                                .padding(.bottom)
                            
                            TextField("Start Date", text: self.$startDate, onEditingChanged: { (editting) in
                            self.showDatePicker = editting
                        }) {

                        }
                            .modifier(TextFieldModifier())

                        if self.showDatePicker {
                            DatePicker("", selection: self.$date, displayedComponents: .date)
//                            self.$startDate = Text("\(self.$date, formatter: dateFormatter)")
                        }
                        
                            TextField("Location", text: self.$content)
                                .modifier(TextFieldModifier())
                            Text("\(self.location)")
                            
                            TextField("Content", text: self.$content)
                                .modifier(TextFieldModifier())
                            Text("\(self.content)")
                        }
                    }
                }
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(
            trailing:
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Save")
            }
        )
//        .edgesIgnoringSafeArea(.all)
    }
}

struct NewPlanView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlanView()
    }
}
