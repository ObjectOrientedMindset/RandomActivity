//
//  ActivityGenerator.swift
//  Activity
//
//  Created by Mithat Uçar on 22.09.2021.
//

import SwiftUI

class ApiCall : ObservableObject{
    @Published var data:Data = Data()
    @Published var listData:[Data] = [] {
        didSet{
            saveList()
        }
    }
    @Published var isPresented:Bool = false
    let listKey:String = "activity_list"
    
    
    let type:[String:String] = ["recreational":"🧩", "education":"📚" ,"social":"👭",
                                "diy":"🔨","charity":"🎗","cooking":"🍳","relaxation":"🧘","music":"🎧","busywork":"🧰","":""]
    
    init(){
        loadList()
        generateActivity()
    }
    
    func generateActivity(){
        guard let url = URL(string: "https://www.boredapi.com/api/activity") else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { wrappedData, _, error in
            if let data = wrappedData{
                let jsonData = try! JSONDecoder().decode(Data.self, from:data)
                DispatchQueue.main.async {
                    self.data = jsonData
                }
            }
            else {
                print("data is nill")
            }
        }
        .resume()
    }
    
    func saveList(){
        if let encodedData = try? JSONEncoder().encode(listData){
            UserDefaults.standard.set(encodedData, forKey: listKey)
        }
    }
    
    func loadList(){
        guard
            let data = UserDefaults.standard.data(forKey: listKey),
            let savedItems = try? JSONDecoder().decode([Data].self, from: data)
        else { return }
        listData = savedItems
    }
    
    func removeRows(at offsets: IndexSet) {
        listData.remove(atOffsets: offsets)
    }
    func move(from source: IndexSet, to destination: Int) {
        listData.move(fromOffsets: source, toOffset: destination)
    }
}

