//
//  ToDoListView.swift
//  Activity
//
//  Created by Mithat Uçar on 23.09.2021.
//

import SwiftUI

struct ToDoListView: View {
    @ObservedObject var data:ApiCall
    var body: some View {
        NavigationView{
            List{
                ForEach(data.listData.indices , id:\.self) { activity in
                    HStack{
                        if let type = data.type[data.listData[activity].type]{
                            Text("\(type) \(data.listData[activity].activity)")
                        }
                        else{
                            Text("\(data.listData[activity].activity)")
                        }
                    }
                }
                .onDelete(perform: data.removeRows)
                .onMove(perform: data.move)
            }
            
            .navigationBarItems(leading: Button(action:{
                data.isPresented = false
            },
            label:
                {
                    Label("", systemImage: "arrow.backward")
                }))
            .toolbar { EditButton() }
            .navigationTitle("Todo List📝")
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(data: ApiCall())
    }
}
