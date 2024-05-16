//
//  HomeView.swift
//  MarkdownNote
//
//  Created by Home on 15/5/2024.
//

import SwiftUI

struct HomeView: View {
    
    //Showing Card colors on Button click
    @State var showColors = false
    
    //Button animation
    @State var animateButotn = false
    
    var body: some View {
        HStack(spacing: 0) {
            if Device.hasMacOS {
                Group {
                    sideBar()
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 1)
                }
            }
            // Main Content
            mainContent()
        }
        #if os(macOS)
        .ignoresSafeArea()
        #endif
        .frame(width: Device.hasMacOS ? Device.screenWidth / 1.7 : nil,
               height: Device.hasMacOS ? Device.screenHeight - 180 : nil,
               alignment: .leading)
        .background(Color(.background).ignoresSafeArea())
        #if os(iOS)
        .overlay(alignment: .center) {
            sideBar()
        }
        #endif
        .preferredColorScheme(.light)
    }
}

#Preview {
    HomeView()
}



extension HomeView {
    
    @ViewBuilder
    func sideBar() -> some View {
        VStack {
            
            if Device.hasMacOS {
                Text("Pocket")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            //Add Button
            if Device.hasMacOS {
                addButton()
                    .zIndex(1)
            }
            
            VStack(spacing: 15){
                //colors
                let colors = [
                    Color(.blue),
                    Color(.green),
                    Color(.orange),
                    Color(.purple),
                    Color(.skin)
                ]
                
                ForEach(colors, id: \.self) { color in
                    Circle()
                        .fill(color)
                        .frame(width: Device.hasMacOS ?  20 : 25, height: Device.hasMacOS ?  20 : 25)
                }
                
            }
            
            .padding(.top, 30)
            .frame(height: showColors ? nil : 0)
            .opacity(showColors ? 1 : 0)
            .zIndex(0)
                        
            if !Device.hasMacOS {
                addButton()
                    .zIndex(1)
            }
        }
#if os(macOS)
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.vertical)
        .padding(.horizontal, 22)
        .padding(.top, 35)
#else
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .padding()
        .background(BlurView(style: .systemUltraThinMaterialDark)
            .opacity(showColors ? 1 : 0)
            .ignoresSafeArea())

#endif


    }
    
    @ViewBuilder
    func addButton() -> some View {
        Button(action: {
            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                showColors.toggle()
                animateButotn.toggle()
            }
            
            //resetting the button
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.spring()) {
                    animateButotn.toggle()
                }
            }
        }) {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundStyle(.white)
                .scaleEffect(showColors ? 1.1 : 1)
                .padding(Device.hasMacOS ? 12 : 15)
                .background(Color.black)
                .clipShape(Circle())
        }
        .rotationEffect(.init(degrees: showColors ? 45 : 0))
        .scaleEffect(showColors ? 1.1 : 1)
        .padding(.top, 30)
    }
    
    @ViewBuilder
    func cardView(note: Note) -> some View {
        VStack {
            Text(note.note)
                .font(Device.hasMacOS ? .title3 : .body)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Text(note.date, style: .date)
                    .foregroundStyle(.black)
                    .opacity(0.8)
                
                Spacer(minLength: 0)
                
                //Edit button
                Button(action: {}) {
                    Image(systemName: "pencil")
                        .font(.system(size: 15, weight: .bold))
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(Color(.black))
                        .clipShape(Circle())
                }
            }
            .padding(.top, 55)
        }
        .padding()
        .background(note.cardColor)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
    
    @ViewBuilder
    func mainContent() -> some View {
        VStack(spacing: 6) {
            
            //Search bar
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundStyle(.gray)
                
                TextField("Search", text: .constant(""))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, Device.hasMacOS ? 0 : 10)
            .overlay(alignment: .bottom) {
                Rectangle()
                    .fill(Color.gray.opacity(0.15))
                    .frame(height: 1)
                    .padding(.horizontal, -25)
                // Moving offset 6...
                    .offset(y: 6)
            }
            
            
            
            ScrollView(.vertical) {
                VStack(spacing: 15) {
                    Text("Notes")
                        .font(Device.hasMacOS ?
                            .system(size: 33, weight: .bold) :
                            .largeTitle.bold())
                    
                    // columns
                    let columns = Array(repeating: GridItem(.flexible(), spacing: Device.hasMacOS ? 15 : 25),
                                        count: Device.hasMacOS ? 3 : 1)
                    
                    LazyVGrid(columns: columns, spacing: 25) {
                        // Notes
                        ForEach(notes) { note in
                            cardView(note: note)
                        }
                    }
                }
                .padding(.top, Device.hasMacOS ? 45 : 30)
            }.scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.top, Device.hasMacOS ? 40 : 15)
        .padding(.horizontal, 25)
    }
}

//Hiding focus ring
#if os(macOS)
extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get{.none}
        set{}
    }
}
#endif
