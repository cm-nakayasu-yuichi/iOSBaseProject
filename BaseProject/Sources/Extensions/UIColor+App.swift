//
//  Copyright (C) Nakayasu Yuichi All rights reserved.
//
import UIKit

extension UIColor {
    
    /// 0〜255のRGBA整数値からUIColorを生成する
    ///
    /// - Parameters:
    ///   - r: R値(0-255)
    ///   - g: G値(0-255)
    ///   - b: B値(0-255)
    ///   - a: アルファ値(0-255)
    convenience init(_ r: Int, _ g: Int, _ b: Int, _ a: Int = 255) {
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(a)/255.0)
    }
    
    /// RGB値の整数からUIColorを生成する
    ///
    /// - Parameter rgb: RGB値 (例: red = 0xFF0000)
    convenience init(rgb: Int) {
        let r: CGFloat = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g: CGFloat = CGFloat((rgb & 0x00FF00) >>  8) / 255.0
        let b: CGFloat = CGFloat( rgb & 0x0000FF       ) / 255.0
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    /// RGB値の整数
    var rgb: Int {
        let i = self.intValues
        return (i.red * 0x010000) + (i.green * 0x000100) + i.blue
    }
    
    
    
    
    
//    convenience init?(colorCode: String) {
//        guard let hex = UIColor.colorCodeToHex(colorCode) else { return nil }
//        self.init(rgba: hex)
//    }

    var rgbString: String {
        var r:CGFloat = -1, g:CGFloat = -1, b:CGFloat = -1, a:CGFloat = -1
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return "\(toHex(r))\(toHex(g))\(toHex(b))"
    }
    
    /// アルファ値を指定した新しいUIColorを生成して取得する
    /// - Note:
    /// このメソッドはwithAlphaComponent:のラッパメソッドです
    /// - Parameter alpha: アルファ値(0.0 - 1.0)
    /// - Returns: アルファ値を指定した新しいUIColor
    func alpha(_ alpha: CGFloat) -> UIColor {
        return self.withAlphaComponent(alpha)
    }
    
    /// 各コンポーネントのCGFloat値をタプルで返却する
    var floatValues: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r:CGFloat = -1, g:CGFloat = -1, b:CGFloat = -1, a:CGFloat = -1
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r, g, b, a)
    }
    
    /// 各コンポーネントの0〜255の整数値をタプルで返却する
    var intValues: (red: Int, green: Int, blue: Int, alpha: Int) {
        let f = self.floatValues
        return (
            red:   self.intByCGFloat(f.red),
            green: self.intByCGFloat(f.green),
            blue:  self.intByCGFloat(f.blue),
            alpha: self.intByCGFloat(f.alpha)
        )
    }
    
//    private func hexInt(colorCode: String) -> Int {
//        var code = colorCode
//        if code.hasPrefix("#") {
//            
//        }
//    }
    
    /*
    class func colorCodeToHex(var colorCode: String) -> UInt32? {
        if colorCode.hasPrefix("#") {
            colorCode = colorCode.substringWithRange(fromIndex: 1)
        }
        
        switch colorCode.length {
        case 8:
            break
        case 6:
            colorCode += "FF"
        case 4:
            let r = colorCode.substringWithRange(0, length: 1)
            let g = colorCode.substringWithRange(1, length: 1)
            let b = colorCode.substringWithRange(2, length: 1)
            let a = colorCode.substringWithRange(3, length: 1)
            colorCode = "\(r)\(r)\(g)\(g)\(b)\(b)\(a)\(a)"
        case 3:
            let r = colorCode.substringWithRange(0, length: 1)
            let g = colorCode.substringWithRange(1, length: 1)
            let b = colorCode.substringWithRange(2, length: 1)
            colorCode = "\(r)\(r)\(g)\(g)\(b)\(b)FF"
        default: return nil
        }
        
        if !colorCode.isMatchedRegularExpression("^[a-fA-F0-9]+$") {
            return nil
        }
        var ret: UInt32 = 0x0
        NSScanner(string: colorCode).scanHexInt(&ret)
        return ret
    }
    */
    
    private func intByCGFloat(_ floatValue: CGFloat) -> Int {
        return Int(round(floatValue * 255))
    }
    
    private func toHex(_ floatValue: CGFloat) -> String {
        let n = self.intByCGFloat(floatValue)
        return NSString(format: "%02X", n) as String
    }
}
