//
//  GridView.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/31/22.
//

import SwiftUI

/**
  createas a grid view based ont he contents and size of icon
 
 - Parameter size - size of list
 - Parameter padding - padding between grid
 - Parameter inf - when false grid will be contained in screen size when true grid will be infinely long
 - Parameter rowCount -  number of row in grid when null number of row decided by length of grid
 - Parameter content  - content of grid
*/
struct GridView<Content: View>: View {
    let size: Int
    var padding: CGFloat = 4.0
    var inf: Bool = false
    var rowCount: Int? = nil
    @ViewBuilder let  content: (Int) -> Content
    
    init(
        size: Int,
        padding: CGFloat = 4.0,
        inf: Bool = false,
        rowCount: Int? = nil,
        @ViewBuilder content: @escaping (Int) -> Content
    ) {
        self.size = size
        self.padding = padding
        self.inf = inf
        self.rowCount = rowCount
        self.content = content
        
        UIScrollView.appearance().bounces = inf
    }
    
    var body: some View {
        GeometryReader{ reader in
            self.createView(reader: reader)
        }
    }
    
    func createView(reader: GeometryProxy) -> some View {
        let cw = reader.size.width
        let ch = reader.size.height
        let ratio = cw/ch
        var (row, column) = getRowColumn(length: size, ratio: ratio, range: 0.4, inf: inf && rowCount != nil)
        row  = rowCount ?? row
        if rowCount != nil {
            column = Int(ceilf(Float(size) / Float(row)))
        }
        
        return ScrollView(showsIndicators: false){
            LazyVGrid(
                columns: Array(repeating: .init(.flexible()), count: row),
                alignment: .center,
                spacing: 0
            ) {
                let width = cw / CGFloat(row)
                
                let length = width * CGFloat(column) > ch && !inf ?
                                ch / CGFloat(column) : width
                
                ForEach(0..<size) { it in
                    content(it)
                        .padding(.all, padding)
                        .frame(
                            width: length,
                            height: length)
                }
            }
        }
    }
    
    /**
     - Parameter length - total length of grid
     - Parameter ratio - ratio of container w / h
     - Parameter range -acceptable error range
     - Parameter inf - when false grid will be contained in screen siez when true grid will be infinitely long
     */
    func getRowColumn(length: Int, ratio: CGFloat, range: CGFloat, inf: Bool = false) -> (Int,Int) {
        var row = 1
        var col = length
        if inf { return (1, length) }
        var diff = abs(CGFloat(row) / CGFloat(col) - ratio)
        var i = 1
        //get every combination of eow col of length
        //finds the closes combination with ratio closes to ratio passed in
        while CGFloat(i) < sqrt(CGFloat(length)) {
            if length % i == 0 {
                if length / i != i {
                    let tempCol = length / i
                    let neww = abs(CGFloat(i) / CGFloat(tempCol) - ratio)
                    if neww < diff {
                        diff = neww
                        row = i
                        col = tempCol
                    }
                }
            }
            i += 1
        }
        if diff < range {
            return (row, col)
        }
        return getRowColumn(length: length + 1, ratio: ratio, range: range)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(size: 12) { it in
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
