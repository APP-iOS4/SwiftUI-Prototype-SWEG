//
//  Writing.swift
//  Sweg
//
//  Created by 심소영 on 2/20/24.
//

import SwiftUI

struct Writing: View {
    @State private var content: String = ""
    
    var body: some View {
        NavigationView(content: {
            NavigationLink(destination: Text("Destination")) { Text("글글글") }
        })
    }
}
#Preview {
    Writing()
}
