//
//  NewPlanView.swift
//  Go!
//
//  Created by 蔡蔡 on 2020-08-29.
//  Copyright © 2020 蔡蔡. All rights reserved.
//

import SwiftUI

// The page for users to create new plans. This page will show when users tap on the add button.
struct NewPlanView: View {
    
    @Binding var newPageShown: Bool
    
//    @State var cover = Image("placeholder")
    
    @State var title = ""
    
    // Update to use picker to choose from existing genres, and add new genres later
    var tagList = ["None", "👣Travel", "🏂Sports"]
    @State var selectedTagIndex = 0
    
    var statusList = ["Planning", "Ongoing", "Completed"]
    @State var selectedStatusIndex = 0
    
    @State var rating = 0.0
    @State var location = ""
    @State var startDate = Date()
//    @State var showDatePicker = false
//    @State var date = Date()
    @State var endDate = Date()
    @State var content = ""

    let onComplete: (String, String, Double, String, String, Date, Date, String) -> Void

    
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
                        
                        Picker(selection: self.$selectedTagIndex, label: Text("Tag: ")) {
                            ForEach(0 ..< self.tagList.count) {
                            Text(self.tagList[$0])
                            }
                        }
                        
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

                        MultilineTextField(txt: self.$content)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(height: g.size.height / 3)

                    }
                }
            }
            .navigationBarTitle("New Plan", displayMode: .inline)
            .navigationBarItems(
                trailing:
                Button(action: savePlan) {
                    Text("Save")
            })
//            }scrollview
        
        }
//        .edgesIgnoringSafeArea(.all)
    }
    
    private func savePlan() {
        onComplete(
        title.isEmpty ? "" : title,
        statusList[selectedStatusIndex],
        rating,
        location.isEmpty ? "" : location,
        tagList[selectedTagIndex],
        startDate,
        endDate,
        content.isEmpty ? "" : content)
    }
}


// Code from https://kavsoft.tech/Swift/Todo/
struct MultilineTextField : UIViewRepresentable {
    
    
    @Binding var txt : String
    
    func makeCoordinator() -> MultilineTextField.Coordinator {
        
        return MultilineTextField.Coordinator(parent1: self)
        
    }
    func makeUIView(context: UIViewRepresentableContext<MultilineTextField>) -> UITextView{
        
        let textview = UITextView()
        textview.font = .systemFont(ofSize: 18)
        textview.delegate = context.coordinator
        return textview
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultilineTextField>) {
        
        uiView.text = txt
    }
    
    class Coordinator : NSObject,UITextViewDelegate{
        
        var parent : MultilineTextField
        
        init(parent1 : MultilineTextField) {
            
            parent = parent1
        }
        
        func textViewDidChange(_ textView: UITextView) {
            
            self.parent.txt = textView.text
        }
    }
}



//struct NewPlanView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPlanView()
//    }
//}
