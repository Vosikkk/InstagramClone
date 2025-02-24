//
//  SearchView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 24.02.2025.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: Constants.lazyVSpacing) {
                    ForEach(0...15, id: \.self) { user in
                        HStack {
                            ProfileImageView(image: "Icon")
                                .frame(
                                    width: Constants.Icon.width,
                                    height: Constants.Icon.height
                                )
                            
                            VStack(alignment: .leading) {
                                Text("venom")
                                    .fontWeight(.semibold)
                                
                                Text("Venom Venom")
                            }
                            .font(.footnote)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, Constants.lazyVPadding)
                .searchable(text: $searchText)
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private extension SearchView {
    
    struct Constants {
        
        static let lazyVSpacing: CGFloat = 12
        static let lazyVPadding: CGFloat = 8
        
        struct Icon {
            static let width: CGFloat = 40
            static let height: CGFloat = 40
        }
        
    }
    
}

#Preview {
    SearchView()
}
