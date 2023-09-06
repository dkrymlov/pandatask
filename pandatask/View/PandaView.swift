//
//  PandaView.swift
//  pandatask
//
//  Created by Даниил Крымлов on 06.09.2023.
//

import SwiftUI

struct PandaView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
    
        let cornerRadius : CGFloat = 50
        let btnFill : Color = Color.gray
        let btnWidth : CGFloat = 32
        let btnPadding : CGFloat = 20
        
        let btnAssetName : String = "xmark"
        let pandaAssetName : String = "panda"
        
        GeometryReader{ geo in
            ZStack{
                Image(uiImage: UIImage(named: pandaAssetName)!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: .infinity, alignment: .leading)
                    .ignoresSafeArea()
                VStack{ //Button Alignment
                    HStack{
                        Spacer() //Margin from the left
                        Button(action: {
                            self.isPresented.toggle()
                        }, label: {
                            Image(systemName: btnAssetName)
                                .padding(btnPadding)
                                .foregroundColor(.white)
                                .background{
                                    RoundedRectangle(cornerRadius: cornerRadius).fill(btnFill).frame(width: btnWidth, height: btnWidth)
                                }
                        })
                    }
                Spacer() // Margin from bottom
                }
            }.transition(.move(edge: .top))
        }
        
    }
    
    struct PandaView_Previews: PreviewProvider {
        static var previews: some View {
            PandaView(isPresented: .constant(true))
        }
    }
}
