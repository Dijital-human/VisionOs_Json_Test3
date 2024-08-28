//
//  ContentView.swift
//  Json_Api_Third
//
//  Created by Famil Mustafayev on 20.06.24.
//

import SwiftUI
struct ContentView: View {

    @ObservedObject var vm = ViewModel(service: WebJsonService())
    var body: some View {
        
        NavigationSplitView {
            List{
                ForEach(vm.data){model in
                    
                    NavigationLink {
                        VStack{
                                AsyncImage(url: URL(string: model.thumbnailUrl)) { img in
                                    img.resizable().frame(width: 300, height: 300).clipShape(Circle())
                                } placeholder: {
                                    ProgressView()
                                }
                            HStack{
                                Text("\(model.albumId)").padding().overlay(Circle().stroke(.red))
                                
                                Text(model.title).padding().overlay(alignment: .center) {
                                    Circle().stroke(.orange)
                                }
                            }

                        }
                    } label: {
                        HStack(alignment:.center, spacing: 10.0){
                            Text("\(model.id)").padding().overlay{
                                Circle().stroke(.red)
                            }
                            Text(model.title).lineLimit(1)
                        }
                    }

                }
            }
            .onAppear(){
                if vm.data.isEmpty{
                    Task{
                        await vm.fetchData()
                    }
                }
            }
            .navigationTitle("Json Data")
        } detail: {
            
        }

    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
