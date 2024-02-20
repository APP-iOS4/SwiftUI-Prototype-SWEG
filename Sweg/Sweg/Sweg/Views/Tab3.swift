//
//  Tab3.swift
//  Sweg
//
//  Created by 심소영 on 2/20/24.
//

import SwiftUI

struct Tab3: View {
    @EnvironmentObject var board: BoardModel
    
    var body: some View {
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
        }
        NavigationView(content: {
            NavigationLink(destination: Writing()) { Image(systemName: "square.and.pencil") }
        })
    }
}

    #Preview {
        Tab3()
    }
