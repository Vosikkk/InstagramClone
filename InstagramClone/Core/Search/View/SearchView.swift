//
//  SearchView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 24.02.2025.
//

import SwiftUI

struct SearchView: View {
    
    @State private var router = SearchNavigationRouter()
    @State private var searchVM = SearchViewModel()
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ScrollView {
                LazyVStack(spacing: lazyVSpacing) {
                    ForEach(searchVM.users) { user in
                            HStack {
                                CircuralProfileImageView(profileImageURL: user.profileImageURL, size: .xSmall)
                                
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    
                                    Text(user.fullname ?? "")
                                }
                                .font(.footnote)
                                
                                Spacer()
                            }
                            .contentShape(Rectangle())
                            .padding(.horizontal)
                            .onTapGesture {
                                router.navigateTo(user)
                            }
                        }
                }
                .padding(.top, lazyVPadding)
                .searchable(text: $searchText)
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: User.self) { user in
                router.buildView(for: user)
            }
        }
    }
    
    private let lazyVSpacing: CGFloat = 12
    private let lazyVPadding: CGFloat = 8
}


#Preview {
    SearchView()
}
