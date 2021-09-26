//
//  ActivityView.swift
//  Activity
//
//  Created by Mithat Uçar on 22.09.2021.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var activity:ApiCall
    var body: some View {
        VStack{
            HStack{
                Text(activity.data.activity)
                Spacer()
            }.padding()
            HStack{
                Label("\(activity.data.participants)", systemImage: "person.2.fill").font(.title)
                Spacer()
            }.padding()
            HStack{
                Text("💰  % \(Int(activity.data.price * 100))").font(.title)
                Spacer()
            }.padding()
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activity: ApiCall())
    }
}
