//
//  Copyright (C) Nakayasu Yuichi All rights reserved.
//
import UIKit

extension Int {
    
    /// 金額表示用の文字列
    /// - Note:
    /// 12000.currency => "12,000"
    var currency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        return formatter.string(for: self)!
    }
    
    /// 指定した範囲の中から乱数を取得する
    /// - Note:
    /// 最小値は0を下回ってはいけません。また、最小値は最大値を上回ってはいけません
    /// - Parameters:
    ///   - min: 最小値
    ///   - max: 最大値
    /// - Returns: 乱数
    static func random(min: Int, max: Int) -> Int {
        let minn = min < 0 ? 0 : min
        let maxn = max + 1
        let x = UInt32(maxn < minn ? 0 : maxn - minn)
        let r = Int(arc4random_uniform(x))
        return minn + r
    }
    
    /// CGFloatにキャストした値
    public var f: CGFloat {
        return CGFloat(self)
    }
    
    /// 文字列にキャストした値
    public var string: String {
        return "\(self)"
    }
}

extension Bool {
    
    /// Intにキャストした値
    var int: Int {
        return self ? 1 : 0
    }
    
    /// 文字列にキャストした値
    var string: String {
        return self ? "true" : "false"
    }
    
    /// 真偽反対の値
    var reversed: Bool {
        return self ? false : true
    }
    
    /// 真偽を反対にする
    mutating func reverse() {
        self = self ? false : true
    }
}

extension Float {
    
    /// CGFloatにキャストした値
    var f: CGFloat {
        return CGFloat(self)
    }
    
    /// 文字列にキャストした値
    var string: String {
        return "\(self)"
    }
}

extension Double {
    
    /// CGFloatにキャストした値
    var f: CGFloat {
        return CGFloat(self)
    }
    
    /// 文字列にキャストした値
    var string: String {
        return "\(self)"
    }
}

extension CGFloat {
    
    /// Intにキャストした値
    public var int: Int {
        return Int(self)
    }
    
    /// Floatにキャストした値
    public var float: Float {
        return Float(self)
    }
    
    /// Doubleにキャストした値
    public var double: Double {
        return Double(self)
    }
    
    /// 文字列にキャストした値
    public var string: String {
        return "\(self)"
    }
}
