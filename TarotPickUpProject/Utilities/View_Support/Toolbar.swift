//
//  Toolbar.swift
//  DraftProject_ProblemSloving_SwiftUI
//
//  Created by Admin on 08/03/2023.
//

import SwiftUI

struct Toolbar: View {
    @State var title: String = ""
    @State var iconBack: String = "ic_back"
    
    let onClickBack: () -> Void
    
    var body: some View {
        ZStack {
            
            HStack {
                
                Spacer()
                
                Text(title)
                    .font(.custom(FontType.SemiBold.rawValue, size: 20))
                    .foregroundColor(Color.black)
                
                Spacer()
            }
            
            HStack {
                Image(iconBack)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32, alignment: .center)
                
                Spacer()
            }
        }
    }
}
