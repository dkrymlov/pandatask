//
//  Panda.swift
//  pandatask
//
//  Created by Даниил Крымлов on 06.09.2023.
//

import SwiftUI

struct Panda: View {
    
    // Function to get styled button with changable props
    private func getStyledButton(_ text: String,
                                 height: CGFloat = 56,
                                 edgeInsets: EdgeInsets = EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5),
                                 foregroundColor: Color = Color.white,
                                 backgroundColor : Color = Color.blue,
                                 strokeColor: Color = Color.indigo,
                                 stroke : CGFloat = 3,
                                 cornerRadius: CGFloat = 18) -> some View{
        return Text(text)
            .frame(maxWidth: .infinity, maxHeight: height)
            .padding(edgeInsets)
            .foregroundColor(foregroundColor)
            .background(
                RoundedRectangle(
                    cornerRadius: cornerRadius,
                    style: .continuous
                )
                .fill(backgroundColor)
            )
            .overlay {
                RoundedRectangle(
                    cornerRadius: cornerRadius,
                    style: .continuous
                )
                .stroke(strokeColor, lineWidth: stroke)
            }
    }
    
    @State
    private var isPresented = false
    
    @State
    private var locked : Bool = false
    
    var body: some View {
        
        let heightRatio : CGFloat = 0.3
        let imageWidth : CGFloat = 150
        
        GeometryReader{ geo in
        ZStack{
                VStack{
                    HStack{ //Image HStack
                        Spacer()
                        Image(uiImage: UIImage(named: "panda")!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageWidth, height: geo.size.height * heightRatio, alignment: .leading)
                            .clipped()
                        Spacer()
                    }
                    HStack{ //Buttons HStack
                        Spacer(minLength: 20)
                        getStyledButton(locked ? "Unlock" : "Lock").onTapGesture {
                            withAnimation(Animation.easeInOut.speed(0.8)) {
                                self.locked.toggle()
                            }
                        }
                        Spacer(minLength: 20)
                        getStyledButton("Open from top").onTapGesture {
                            withAnimation(Animation.easeInOut.speed(0.8)) {
                                self.isPresented = true
                            }
                        }
                        .disabled(locked)
                        .opacity(locked ? 0.5 : 1)
                        Spacer(minLength: 20)
                    }
                    Spacer()
                    Button(action: {
                        //?? Unknown logic
                    }, label: {
                        getStyledButton("Open full").padding(20)
                    }).disabled(true)
                    
                }.overlayFromTop(isPresented: $isPresented, content: {
                    PandaView(isPresented: $isPresented)
                })
        }
        
        }
    }
}

struct Panda_Previews: PreviewProvider {
    static var previews: some View {
        Panda()
    }
}
