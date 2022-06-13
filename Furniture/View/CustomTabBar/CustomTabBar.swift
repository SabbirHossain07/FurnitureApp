//
//  CustomTabBar.swift
//  MaterialCurvedTabBar
//
//  Created by Sopnil Sohan on 12/6/22.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var currentTab: Tab
    var animation: Namespace.ID
    //current tab XValue
    @State var currentXValue: CGFloat = 0
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                TabButton(tab: tab)
                    .overlay {
                        Text(tab.rawValue)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color("Black"))
                            .offset(y: currentTab == tab ? 15 : 100)
                    }
            }
        }
        .padding(.top)
        .padding(.bottom, getSafeArea().bottom == 0 ? 15 : 10)
        .background(
            Color.white
                .shadow(color: Color("Black").opacity(0.8), radius: 5, x: 0, y: -5)
                .clipShape(BottomCurve(currentXValue: currentXValue))
                .ignoresSafeArea(.container, edges: .bottom)
        )
    }
    
    //MARK: Tab Button
    @ViewBuilder
    func TabButton(tab: Tab)->some View {
      //scince we need XAxis value for curve..
        GeometryReader { proxy in
            Button {
                withAnimation(.easeInOut) {
                    currentTab = tab
                    //updating value
                    currentXValue = proxy.frame(in: .global).midX
                }
            } label: {
                //Moving button up for current tab
                Image(tab.rawValue)
                //scince we need perfect value for curve..
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(currentTab == tab ? .white : .gray.opacity(0.8))
                    .padding(currentTab == tab ? 15 : 0)
                    .contentShape(Rectangle())
                    .background(
                        ZStack {
                            if currentTab == tab {
                              Circle()
                                    .fill(Color("Orange"))
                                    .shadow(color: Color("Black").opacity(0.1), radius: 8, x: 5, y: 5)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                    )
                    .offset(y: currentTab == tab ? -50 : 0)
            }
            .onAppear {
                if tab == Tab.allCases.first && currentXValue == 0 {
                    currentXValue = proxy.frame(in: .global).midX
                }
            }
        }
        .frame(height: 30)
    }
}

//MARK: Tab
enum Tab: String,CaseIterable {
    case home = "Home"
    case cart = "Cart"
    case favourite = "Star"
    case profile = "Profile"
}

//Getting safe Area...
extension View {
    func getSafeArea()-> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}
