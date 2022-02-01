//
//  GridView.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/31/22.
//

import SwiftUI

struct GridView<Content: View>: View {
    let size: Int
    var padding: CGFloat = 4.0
    var inf: Bool = false
    var rowCount: Int? = nil
    @ViewBuilder let  content: (Int) -> Content
    
    var body: some View {
        GeometryReader{ reader in
            self.createView(reader: reader)
        }
    }
    
    func createView(reader: GeometryProxy) -> some View {
        let cw = reader.size.width
        let ch = reader.size.height
        let ratio = cw/ch
        var (row, column) = getRowColumn(length: size, ratio: ratio, grace: 0.4,inf: inf && rowCount != nil)
        row  = rowCount ?? row
        if rowCount != nil {
            column = Int(ceilf(Float(size) / Float(row)))
        }
        
        return ScrollView{
            LazyVGrid(
                columns: Array(repeating: .init(.flexible()), count: row),
                alignment: .center,
                spacing: 0
            ){
        
                let w = cw / CGFloat(row)
                
                let s = { () -> CGFloat in
                    if w * CGFloat(column) > ch && !inf {
                        return ch / CGFloat(column)
                    }
                    else {
                        return cw / CGFloat(row)
                    }
                }()
                ForEach(0..<size) { it in
                    content(it)
                        .padding(.all, padding)
                        .frame(
                            width: s,
                            height: s
                        )
                }
            }
            }.disabled(!inf)
    }
    
    func getRowColumn(length: Int, ratio: CGFloat, grace: CGFloat, inf: Bool = false) -> (Int,Int){
        if inf {
            return (1,length)
        }
        var diff: CGFloat = .infinity
        var row = 1
        var col = length
        var i = 1
        
        while CGFloat(i) < sqrt(CGFloat(length)) {
            if length % i == 0 {
                if length / i != i {
                    col = length / i
                    let neww = abs(CGFloat(i) / CGFloat(col) - ratio)
                    if neww < diff {
                        diff = neww
                        row = i
                    }
                }
            }
            i += 1
        }
        if diff < grace {
            return (row,col)
        }
        return getRowColumn(length: length + 1, ratio: ratio, grace: grace)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(size: 12){ it in
            OptionContentView(
                backgroundColor: .clear,
                tint: Color(UIColor.label),
                onClick: {},
                onHold: {},
                content: {
                    OptionImageView(
                        icon: "ic_brain",
                        tint: Color(UIColor.label)
                    )
                }
            )
        }
    }
}
