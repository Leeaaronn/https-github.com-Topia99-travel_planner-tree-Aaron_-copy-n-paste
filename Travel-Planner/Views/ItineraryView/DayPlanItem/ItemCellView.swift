//
//  ItemFoodCellView.swift
//  Travel-Planner
//
//  Created by Jason Zeng on 10/2/24.
//

import SwiftUI

struct ItemCellView: View {
    
    var item: Item
    
    
    var body: some View {
        VStack (alignment: .leading){
            HStack() {
                
                ItemIconView(imageName: ItemTypeUtilities.iconName(for: item.type),
                             color: ItemTypeUtilities.iconColor(for: item.type))
                
                // Activity Title
                Text(item.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.leading, 3)
                
                Spacer()
                
                if let time = item.time {
                    Text(time, style: .time)
                        .font(.headline)
                }
            }
            
            
            VStack (alignment: .leading) {
                if let location = item.location{
                    Text("📍\(location)")
                        .font(.subheadline)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                if let description = item.description {
                    Text(description)
                        .font(.body)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 2)
                }
            }
        }
        .padding()
        .frame(width: 350)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .opacity(0.5)
                .shadow(radius: 2)
        )
    }
}

struct ItemIconView: View {
    
    let imageName: String
    let color: Color
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .symbolRenderingMode(.palette)
            .foregroundStyle(.white, color)
            .frame(width: 30, height: 30)
    }
}
