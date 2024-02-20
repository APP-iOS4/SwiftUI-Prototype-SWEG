//
//  Tab3.swift
//  Sweg
//
//  Created by 심소영 on 2/20/24.
//

import SwiftUI

struct Tab3: View {
    @EnvironmentObject var board: BoardModel
    
    @State private var isNavigationDestination: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                List {
                    VStack(alignment:.leading) {
                        Text("\(board.title)")
                        HStack {
                            Text("\(board.date)")
                            Spacer()
                            HStack {
                                Image(systemName:"eyes")
                                Text("\(board.hits)")
                            }
                            Text("---님")
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Text("  핵꿀팁게시판")
                            .font(.title3)
                    }
                }
                .navigationDestination(isPresented: $isNavigationDestination) {
                    Writing()
                }
            }
            
            VStack(alignment: .trailing) {
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "pencil")
                        .foregroundStyle(.white)
                        .frame(minWidth: 50, minHeight: 50)
                        .background(.accent)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                .frame(minWidth: 50, minHeight: 50)
                .onTapGesture {
                    isNavigationDestination.toggle()
                }
            }
            .padding()
            
        }
        //        NavigationView(content: {
        //            NavigationLink(destination: Writing()) { Image(systemName: "square.and.pencil") }
        //        })
    }
}

#Preview {
    Tab3()
}
