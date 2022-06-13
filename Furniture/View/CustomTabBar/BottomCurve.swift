//
//  BottomCurve.swift
//  MaterialCurvedTabBar
//
//  Created by Sopnil Sohan on 12/6/22.
//

import SwiftUI

struct BottomCurve: Shape {
    
    var currentXValue: CGFloat
    
    //animating curve...
    //it won't work preview
    var animatableData: CGFloat {
        get{currentXValue}
        set{currentXValue = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let mid = currentXValue
            path.move(to: CGPoint(x: mid - 50, y: 0))
            
            let to1 = CGPoint(x: mid, y: 35)
            let controll1 = CGPoint(x: mid - 25, y: 0)
            let controll2 = CGPoint(x: mid - 25, y: 35)
            
            path.addCurve(to: to1, control1: controll1, control2: controll2)
            
            let to2 = CGPoint(x: mid + 50, y: 0)
            let controll3 = CGPoint(x: mid + 25, y: 35)
            let controll4 = CGPoint(x: mid + 25, y: 0)
            
            path.addCurve(to: to2, control1: controll3, control2: controll4)
        }
    }
}

struct CustomTabBarShape_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
