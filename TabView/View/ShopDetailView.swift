//
//  ShopDetailView.swift
//  CoffeeShop
//
//  Created by Vanessa Cassandra on 26/11/22.
//

import SwiftUI

struct ShopDetailView: View {
    // MARK: - PROPERTIES
    let shopDetail: Coffeeshop
    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.white, .white, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                Image(shopDetail.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                    .clipShape(Circle())
                    .overlay {
                        ZStack {
                            Circle().opacity(0.4)
                            VStack {
                                Image(systemName: "person.crop.circle.fill.badge.plus")
                                    .renderingMode(.original)
                                    .foregroundColor(.blue)
                                    .font(.system(size: 50))
                                
                                Text("\(shopDetail.name)")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .font(.title2)
                                    .frame(maxWidth: 200)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                
                Text("\(shopDetail.review)")
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 45)
                    .padding(.vertical, 20)
                
                HStack {
                    
                    ZStack {
                        Circle()
                            .opacity(0.1)
                            .frame(width: 30)
                        Image(systemName: "pin")
                    }
                    
                    
                    Text("\(shopDetail.location)")
                } .foregroundColor(.red)
                
                Spacer()
            } //: Vstack
        }
    }
}


// MARK: - PREVIEW
struct ShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailView(
            shopDetail:  Coffeeshop(
                image: "bojaeatery",
                name: "Boja Eatery",
                location: "Jl. Sumatera No. 21, Kota Bandung",
                review: "The food is delicious, cooked just right.  Friendly service.  Cozy atmosphere with floral decorations.  There is a ~robot~ that sends the dish.  Prices are reasonable for a restaurant of its class",
                isFavourite: false
            )
        )
    }
}
