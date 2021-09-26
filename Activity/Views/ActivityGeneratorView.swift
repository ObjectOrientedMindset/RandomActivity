//
//  ActivityGeneratorView.swift
//  Activity
//
//  Created by Mithat Uçar on 22.09.2021.
//

import SwiftUI

struct ActivityGeneratorView: View {
    @StateObject var activity:ApiCall = ApiCall()
    var body: some View {
        NavigationView{
            VStack {
                ActivityView(activity: activity)
                Spacer()
                HStack{
                    Button(action: {
                        activity.listData.append(activity.data)
                    }, label: {
                        ButtonView(buttonText: "AddToList")
                    }).padding(.vertical)
                    Button(action: {
                        activity.generateActivity()
                    }, label: {
                        ButtonView(buttonText: "Generate")
                    }).padding(.vertical)
                    .navigationBarItems(trailing: Button(action: {
                        activity.isPresented = true
                    },label:
                    {
                        Label("", systemImage: "arrow.forward")
                    }))
                    .fullScreenCover(isPresented: $activity.isPresented, content: {
                            ToDoListView(data: activity)
                    })
                }
                .navigationTitle("ActivityGenerator\(activity.type[activity.data.type]!)")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    struct ButtonView: View{
        let buttonText:String
        let buttoncolor = Color("ButtonColor")
        var body: some View{
            ZStack{
                RoundedRectangle(cornerRadius: 5.0)
                    .frame(width:150, height: 55)
                    .foregroundColor(buttoncolor)
                Text(buttonText).bold().foregroundColor(Color(UIColor.secondarySystemBackground))
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ActivityGeneratorView()
        }
    }
}
