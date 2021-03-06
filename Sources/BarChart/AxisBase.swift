//
//  AxisBase.swift
//  BarChart
//
//  Copyright (c) 2020 Roman Baitaliuk
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.

import SwiftUI

public class AxisBase: ObservableObject {
    @Published public var labelsColor: Color = .black
    @Published public var ticksColor: Color = .black
    @Published public var ticksDash: [CGFloat] =  [5, 10]
    @Published public var labelsCTFont: CTFont = CTFontCreateWithName(("SFProText-Regular" as CFString), 12, nil)
    
    var labelsUIFont: UIFont {
        return UIFont(name: CTFontCopyPostScriptName(self.labelsCTFont) as String,
                      size: CTFontGetSize(self.labelsCTFont))!
    }
    
    var labelsFont: Font {
        return Font(self.labelsCTFont)
    }
    
    var maxLabelWidth: CGFloat {
        return self.formattedLabels().map { $0.width(font: self.labelsUIFont) }.max() ?? 0
    }
    
    func formattedLabels() -> [String] {
        fatalError("Needs to be overridden")
    }
}
