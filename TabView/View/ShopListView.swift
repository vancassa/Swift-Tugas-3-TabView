//
//  ShopListView.swift
//  CoffeeShop
//
//  Created by Vanessa Cassandra on 26/11/22.
//

import SwiftUI
import ActivityView

struct ShopListView: View {
    // MARK: - PROPERTIES
    @State private var data = CoffeeshopProvider.all()
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List() {
                ForEach(data) { shop in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: ShopDetailView(shopDetail: shop)) {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        ShopRow(shop: shop)
                    }
                }
                .onDelete { indexSet in
                    data.remove(atOffsets: indexSet)
                }
            }
            
            .listStyle(PlainListStyle())
            .navigationTitle("Coffeeshop")
        }
    }
}

struct ShopListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopListView()
    }
}

struct ShopRow: View {
    @State var shop: Coffeeshop
    @State private var item: ActivityItem?
    @State private var isAlertShown: Bool = false
    
    var body: some View {
        HStack {
            Image(shop.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(shop.name)
                    .fontWeight(.bold)
                
                Text(shop.location)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
        }//: HSTACK
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button {
                shop.isFavourite.toggle()
            } label: {
                Image(systemName: shop.isFavourite ?  "heart.slash" : "heart")
            }
            .tint(.green)
            
            Button {
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            .tint(.indigo)
            
        }
        .contextMenu {
            Button {
                isAlertShown = true
            } label: {
                HStack {
                    Text("Pin this location")
                    Image(systemName: "pin")
                }
            }
            
            Button {
                shop.isFavourite.toggle()
            } label: {
                HStack {
                    Text(shop.isFavourite ? "Remove from favourite": "Mark as favourite")
                    Image(systemName: shop.isFavourite ? "heart.slash" :"heart")
                }
            }
            
            Button {
                item = ActivityItem(items: "\(shop.name) will be shared")
            } label: {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
            
        }
        .alert("Not available yet", isPresented: $isAlertShown) {
            Button {
            } label: {
                Text("🆗 Buddy 👌")
            }
        } message: {
            Text( "This feature is not available yet 🙏")
        }
        .activitySheet($item)
        
    }
}
