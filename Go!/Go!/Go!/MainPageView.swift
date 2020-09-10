//
//  MainPageView.swift
//  Go!
//
//  Created by 蔡蔡 on 2020-08-29.
//  Copyright © 2020 蔡蔡. All rights reserved.
//

import SwiftUI

// The home page of ths app. Users will see this page after the launch screen.
struct MainPageView: View {
    @State var plans: [Plan] = []
    @State var newPageShown = false
    @Binding var menuShown: Bool
    
    
    var body: some View {
        // The main screen of Go!
        
        return NavigationView {
            ZStack {
                List {
                    ForEach(plans, id: \.title) {
                      PlanRow(plan: $0)
                    }
                    .onDelete(perform: deletePlan)
               }
              .sheet(isPresented: $newPageShown) {
                  NewPlanView(newPageShown: self.$newPageShown) { title, tag, status, rating, location, startDate, endDate, content in
                    self.newPlan(title: title, tag: tag, status: status, rating: rating,
                                   location: location, startDate: startDate,
                                   endDate: endDate, content: content)
                      self.newPageShown = false
                    }
               }
                
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Button(action: { self.newPageShown.toggle() }) {
                                            Image("newIcon")
                                                .resizable()
                                                .scaledToFit()
                                                .padding()
                                                // change to not using hardcoded values later
                                                .frame(width: 80, height: 80)
                                                .foregroundColor(Color.white)
                                                .background(MyColors.greengray)
                                                .clipShape(Circle())
                                                .shadow(color: MyColors.greengray.opacity(0.4), radius: 5, x: 5, y: 5)
                        }.padding(.trailing)
                    }
                }
            }
              .navigationBarTitle(Text("Plans"))
        .navigationBarHidden(true)
        }
        
        
        //hereeee
//        return VStack {
//            GeometryReader { g in
        //to hereeee
                
//                HStack(alignment: .center) {
//                    Image("goIcon").resizable().scaledToFit().frame(width: g.size.width/6, height: g.size.height/15)
//                    Text("Go!").font(.title).fontWeight(.black).foregroundColor(MyColors.greengray)
//                }
//                .frame(width: g.size.width)
//                .background(MyColors.lightgrey)
////                .edgesIgnoringSafeArea()
//
//                RoundedRectangle(cornerRadius: 10).frame(width: g.size.width + 10, height: g.size.width/150).offset(y: g.size.height/15)
                
//                Spacer()
//                HStack {
//                     Button(action: {
//                        withAnimation {
//                            self.menuShown.toggle()
//                        }
//                        print("Menu pressed!")
//                        }) {
//                            Image("menuIcon").resizable().scaledToFit().padding(10)
//                                .frame(width: g.size.width/6, height: g.size.height/10)
////            //                            .foregroundColor(Color.white)
////                            }
//                    .clipShape(Circle())
//                    .overlay(Circle().stroke(MyColors.greengray, lineWidth: g.size.width/150))
//                    .padding(.leading)
//                     .offset(x: g.size.width/1000, y: g.size.height - 2.125 * (g.size.height/10))
//                    Spacer()
//                }
                
                // Bottom row
//                HStack {
                    // Settings button
//                    Button(action: {
//                        print("Settiings pressed!")
//                        }) {
//                            Image("settingsIcon").resizable().scaledToFit().padding()
//                                .frame(width: g.size.width/6, height: g.size.height/10)
//                    }
//                    .clipShape(Circle())
//                    .overlay(Circle().stroke(MyColors.greengray, lineWidth: g.size.width/150))
////                    .background(Capsule().stroke(MyColors.greengray, lineWidth: 3))
//                    .padding(.leading)
//                        .padding(.bottom)
//                    .offset(x: g.size.width/1000, y: g.size.height - g.size.height/10)


                    // AddPlan button
//                    Spacer()
        
        
        //hereeeeee
//                NavigationLink(destination: NewPlanView(newPageShown: self.$newPageShown)) {
//                    Image("newIcon")
//                        .resizable()
//                        .scaledToFit()
//                        .padding()
//                        .foregroundColor(Color.white)
//                        .background(MyColors.greengray)
//                    .clipShape(Circle())
//                }
//                .frame(width: g.size.width/5, height: g.size.height/8)
//                .offset(x: g.size.width - g.size.width / 6 * 1.5, y: g.size.height - g.size.width / 5 * 1.5)
        //to hereeeee

//                    Button(action: {
//                        print("New Plan!")
//                        }) {
//                            Image("newIcon").resizable().scaledToFit().padding()
//                                .frame(width: g.size.width/6, height: g.size.height/10)
//                                .foregroundColor(Color.white)
//                                .background(MyColors.greengray)
//                            .clipShape(Circle())
//                    }
//                    .offset(x: g.size.width - g.size.width/5, y: g.size.height - g.size.height/10)
//                    .padding(.trailing)
//                    .padding(.bottom)

//                }
                
        //hereeee
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
        //to hereeee

    }
    
    func deletePlan(at offsets: IndexSet) {
        plans.remove(atOffsets: offsets)
    }
    
    func newPlan(title: String, tag: String, status: String, rating: Double,
                 location: String, startDate: Date,
                 endDate: Date, content: String) {
        
        let newPlan = Plan(title: title, tag: tag, status: status, rating: rating,
                           location: location, startDate: startDate,
                           endDate: endDate, content: content)
        plans.append(newPlan)
        
    }
    
}

    

struct MainPageView_Previews: PreviewProvider {
    
    @State static var show = true
    
    static var previews: some View {
        MainPageView(menuShown: $show)
    }
}
