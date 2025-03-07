//
//  SearchView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 24.02.2025.
//

import SwiftUI

struct SearchView: View {
    
    @State private var router = SearchNavigationRouter()
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ScrollView {
                LazyVStack(spacing: Constants.lazyVSpacing) {
                    ForEach(User.MOCK_USERS) { user in
                            HStack {
                                ProfileImageView(image: user.profileImageURL ?? "")
                                    .frame(
                                        width: Constants.Icon.width,
                                        height: Constants.Icon.height
                                    )
                                
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
                .padding(.top, Constants.lazyVPadding)
                .searchable(text: $searchText)
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: User.self) { user in
                router.buildView(for: user)
            }
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
