

import UIKit

private var bottomLineColorAssociatedKey : UIColor = .black
private var topLineColorAssociatedKey : UIColor = .black
private var rightLineColorAssociatedKey : UIColor = .black
private var leftLineColorAssociatedKey : UIColor = .black


extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    class func fromNib<T : UIView>() -> T {
            return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.6
        layer.shadowRadius = 3.0
        layer.shadowColor = UIColor.lightGray.cgColor
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

    //Individual Lines
    @IBInspectable var bottomLineColor: UIColor {
        get {
            if let color = objc_getAssociatedObject(self, &bottomLineColorAssociatedKey) as? UIColor {
                return color
            } else {
                return .black
            }
        } set {
            objc_setAssociatedObject(self, &bottomLineColorAssociatedKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    @IBInspectable var bottomLineWidth: CGFloat {
        get {
            return self.bottomLineWidth
        }
        set {
            DispatchQueue.main.async {
                self.addBottomBorderWithColor(color: self.bottomLineColor, width: newValue)
            }
        }
    }
    @IBInspectable var topLineColor: UIColor {
        get {
            if let color = objc_getAssociatedObject(self, &topLineColorAssociatedKey) as? UIColor {
                return color
            } else {
                return .black
            }
        } set {
            objc_setAssociatedObject(self, &topLineColorAssociatedKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    @IBInspectable var topLineWidth: CGFloat {
        get {
            return self.topLineWidth
        }
        set {
            DispatchQueue.main.async {
                self.addTopBorderWithColor(color: self.topLineColor, width: newValue)
            }
        }
    }
    @IBInspectable var rightLineColor: UIColor {
        get {
            if let color = objc_getAssociatedObject(self, &rightLineColorAssociatedKey) as? UIColor {
                return color
            } else {
                return .black
            }
        } set {
            objc_setAssociatedObject(self, &rightLineColorAssociatedKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    @IBInspectable var rightLineWidth: CGFloat {
        get {
            return self.rightLineWidth
        }
        set {
            DispatchQueue.main.async {
                self.addRightBorderWithColor(color: self.rightLineColor, width: newValue)
            }
        }
    }
    @IBInspectable var leftLineColor: UIColor {
        get {
            if let color = objc_getAssociatedObject(self, &leftLineColorAssociatedKey) as? UIColor {
                return color
            } else {
                return .black
            }
        } set {
            objc_setAssociatedObject(self, &leftLineColorAssociatedKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    @IBInspectable var leftLineWidth: CGFloat {
        get {
            return self.leftLineWidth
        }
        set {
            DispatchQueue.main.async {
                self.addLeftBorderWithColor(color: self.leftLineColor, width: newValue)
            }
        }
    }
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.name = "topBorderLayer"
        removePreviouslyAddedLayer(name: border.name ?? "")
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y : 0,width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.name = "rightBorderLayer"
        removePreviouslyAddedLayer(name: border.name ?? "")
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width : width, height :self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.name = "bottomBorderLayer"
        removePreviouslyAddedLayer(name: border.name ?? "")
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,width : self.frame.size.width,height: width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.name = "leftBorderLayer"
        removePreviouslyAddedLayer(name: border.name ?? "")
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0, y:0,width : width, height : self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func removePreviouslyAddedLayer(name : String) {
        if self.layer.sublayers?.count ?? 0 > 0 {
            self.layer.sublayers?.forEach {
                if $0.name == name {
                    $0.removeFromSuperlayer()
                }
            }
        }
    }
}

