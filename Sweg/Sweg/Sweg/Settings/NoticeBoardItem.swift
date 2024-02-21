//
//  NoticeBoardItem.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/21/24.
//

import SwiftUI

struct NoticeBoardItem: View {
    var notice: DummyNoticeModel
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(notice.dateString)")
                        .font(.subheadline)
                        .foregroundStyle(.gray.opacity(0.5))
                    Text("\(notice.title)")
                        .font(.title3)
                }
                
                Spacer()
                
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                
                
            }
            .padding()
            .onTapGesture {
                isExpanded.toggle()
            }
            
            if isExpanded {
                Text("\(notice.content)")
                    .padding()
                    .background(.gray.opacity(0.05))
            }
            
            Rectangle()
                .foregroundStyle(.gray.opacity(0.2))
                .frame(maxWidth: .infinity, maxHeight: 1)
        }
    }
}

#Preview {
    NoticeBoardItem(notice: dummyNotice.first!)
}
