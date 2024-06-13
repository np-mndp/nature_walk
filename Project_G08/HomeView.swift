//
//  HomeScreen.swift
//  Project_G08
//
//  Created by Mandeep Neupane on 2024-06-12.
//

import Foundation


import SwiftUI

struct HomeView: View {
    @State private var showSheet = false
    @State private var searchTerm = ""
    
    @StateObject var sessions:SessionData = SessionData()
    var body: some View {
        NavigationStack{
            
            VStack{
                List{
                    ForEach (sessions.sessionList){ session in
                        NavigationLink{
                            SessionDetails(session: session)
                        }label:{
                            
                            HStack{
                                AsyncImage(url: URL(string: session.images.first!)){ image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 70)
                                        .clipped()
                                } placeholder: {
                                    ProgressView()
                                }
                                .padding(.trailing, 5)
                                VStack(alignment: .leading, spacing: 15){
                                    Text(session.title)
                                        .font(.title3)
                                        .bold()
                                    
                                    HStack{
                                        
                                        Text("CAD $ \(String(format: "%.2f", session.price))")}
                                }//VStack
                            }
                        }.foregroundColor(Color("app_color"))
                    }
                }
                
            }
            .navigationTitle("Nature Walk")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Menu{
                        Button{
                            #function
                        }label: {
                            Text("Log Out")
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .foregroundStyle(Color(.red))
                        }
                    }
                label: {
                    Image(systemName: "person.fill")
                    
                    
                }
                .foregroundColor(Color("app_color"))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
