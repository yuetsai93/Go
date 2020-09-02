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
    
    var statusList = ["Planning", "Ongoing", "Completed"]
    @State var selectedStatusIndex = 0
    
    @State var rating = 0.0
    @State var location: String = ""
    @State var startDate = Date()
//    @State var showDatePicker = false
//    @State var date = Date()
    @State var endDate = Date()
    @State var content: String = ""

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
//            ScrollView(.vertical, showsIndicators: true) {
            GeometryReader { g in
                    VStack(alignment: .center) {
                        Form {
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
                        
                            TextField("Title", text: self.$title)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .padding(.leading)
//                                .padding(.trailing)
//                                .padding(.bottom)
                            
                            Picker(selection: self.$selectedStatusIndex, label: Text("Status: ")) {
                                ForEach(0 ..< self.statusList.count) {
                                Text(self.statusList[$0])
                                }
                            }
                                
                            Stepper(value: self.$rating, in: 0...5, step: 0.5) {
                                Text("Rating: \(self.rating, specifier: "%.1f")")
                            }
                            TextField("Location", text: self.$location)
//                                .modifier(TextFieldModifier())
                            
                            DatePicker("Start Date: ", selection: self.$startDate, displayedComponents: .date)
                            DatePicker("End Date: ", selection: self.$endDate, displayedComponents: .date)
                            // Connect textfield with datepicker
//                            TextField("Start Date", text: self.$startDate, onEditingChanged: { (editting) in
//                            self.showDatePicker = editting
//                                print("\(editting)")
//                            })
//                            {
//
//                        }
//                            .modifier(TextFieldModifier())
//
//                        if self.showDatePicker {
//                            DatePicker("", selection: self.$date, displayedComponents: .date)
//                        }

                            multiline(txt: self.$content)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(height: g.size.height / 3)

                        }
                            
                        
                    }
                }
//            }scrollview
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


// Code from https://kavsoft.tech/Swift/Todo/
struct multiline : UIViewRepresentable {
    
    
    @Binding var txt : String
    
    func makeCoordinator() -> multiline.Coordinator {
        
        return multiline.Coordinator(parent1: self)
        
    }
    func makeUIView(context: UIViewRepresentableContext<multiline>) -> UITextView{
        
        let textview = UITextView()
        textview.font = .systemFont(ofSize: 18)
        textview.delegate = context.coordinator
        return textview
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<multiline>) {
        
        uiView.text = txt
    }
    
    class Coordinator : NSObject,UITextViewDelegate{
        
        var parent : multiline
        
        init(parent1 : multiline) {
            
            parent = parent1
        }
        
        func textViewDidChange(_ textView: UITextView) {
            
            self.parent.txt = textView.text
        }
    }
}



struct NewPlanView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlanView()
    }
}
