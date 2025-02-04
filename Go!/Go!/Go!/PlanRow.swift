//
//  GoRow.swift
//  Go!
//
//  Created by 蔡蔡 on 2020-08-25.
//  Copyright © 2020 蔡蔡. All rights reserved.
//
import SwiftUI

// A struct for each plan row, showing in the list in main page.
struct PlanRow: View {
    
    let plan: Plan
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()

    var body: some View {
//        VStack(alignment: .leading) {

            HStack {
                // Add image box here
                Image("placeholder").resizable().scaledToFit().frame(width: 88)

                VStack(alignment: .leading) {
                    plan.title.map(Text.init)
                        .font(.title)

                    Group {
                        plan.tag.map(Text.init)
                        Text("\(plan.rating, specifier: "%.1f")")
                        plan.startDate.map {
                            Text(PlanRow.self.dateFormatter.string(from: $0))
                        }
//                            +
//                            Text(" - ") +
                        plan.endDate.map {
                            Text(PlanRow.self.dateFormatter.string(from: $0))
                        }
                    }
                    .font(.caption)

                }
            }
//        }
    }
}

// For testing preview

//    var body: some View {
//
//        HStack {
//            // Add image box here
//
//            Image("placeholder").resizable().scaledToFit().frame(width: 80)
//
//            VStack(alignment: .leading) {
//                Text("Title")
//                    .font(.title)
//
//                Group {
//                    Text("Travel")
//                    Text("\(4.500, specifier: "%.1f")")
//                    (Text(PlanRow.self.dateFormatter.string(from: Date())) +
//                        Text(" - ") +
//                        Text(PlanRow.self.dateFormatter.string(from: Date())))
//                }
//
//
//            }
//        }
//    }
//}
//
//
//struct PlanRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanRow()
//    }
//}
