//
//  SwiftCircularIconButtonWithProgressBar.swift
//  SwiftCircularIconButtonWithProgressBar
//
//  Created by Alankar Avinash Misra on 6/1/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

@IBDesignable
public class SwiftCircularIconButtonWithProgressBar: UIButton {
// MARK: PUBLIC INTERFACE

// MARK: - Public Properties
    
/**
    Color for the progress line.
     
    Defaults to black.
 */
    @IBInspectable public var progressColor:UIColor {
        get {
            return UIColor(CGColor: progressLayer.strokeColor!)
        }
        
        set {
            progressLayer.strokeColor = newValue.CGColor
        }
    }

/**
     Color for the bar line.
     
     Defaults to a light shade of gray.
 */
    @IBInspectable public var barColor:UIColor {
        get {
            return UIColor(CGColor: barLayer.strokeColor!)
        }
        
        set {
            barLayer.strokeColor = newValue.CGColor
        }
    }
    
/**
     Line width for progress and bar lines.
     
     Defaults to 15.
 */
    @IBInspectable public var lineWidth:CGFloat {
        get {
            return progressLayer.lineWidth
        }
        
        set {
            progressLayer.lineWidth = newValue
            barLayer.lineWidth = newValue
        }
    }
    
/**
     Progress value with a normalized range [0,1].
     
     Defaults to 0.25 in Interface Builder, 0.0 in running code.
*/
    @IBInspectable public var progress:CGFloat {
        get {
            return progressLayer.strokeEnd
        }
        set {
            if newValue > 1 {
                progressLayer.strokeEnd = 1
            } else if newValue < 0 {
                progressLayer.strokeEnd = 0
            } else {
                progressLayer.strokeEnd = newValue
            }
        }
    }
    
/**
     lineCap settings for the progress line.
     
     Valid values are `"Butt"`, `"Round"` and `"Square"`
     
     Defaults to `"Butt"`.
*/
    @IBInspectable public var lineCap:String {
        get {
            var ret:String
            
            switch progressLayer.lineCap {
            case kCALineCapButt:
                ret = "Butt"
            case kCALineCapRound:
                ret = "Round"
            case kCALineCapSquare:
                ret = "Square"
            default:
                ret = "Butt"
            }
            
            return ret
        }
        
        set {
            switch newValue {
            case "Butt":
                progressLayer.lineCap = kCALineCapButt
            case "Round":
                progressLayer.lineCap = kCALineCapRound
            case "Square":
                progressLayer.lineCap = kCALineCapSquare
            default:
                break
            }
        }
    }

/**
    Optional button icon.
*/
    @IBInspectable public var icon:UIImage? {
        set {
            iconLayer.contents = newValue?.CGImage
        }
        
        get {
            return iconLayer.contents != nil ? UIImage(CGImage: (iconLayer.contents as! CGImage)) : nil
        }
    }

/**
     Icon inset as percentage of the button bounds. Typical values lie in the range [0, 0.5].
    
     Defaults to 0.35, an empirically tested number. Your mileage may vary.
     
     ## Note
     While playing with this value, keep an eye out on the Project Status. You might see an error
     that states 
     
     `Failed to render instance of SwiftCircularIconButtonWithProgressBar: The agent threw an exception.`
     
     This probably means you've set the value too high. The icon should have disappeared from view by now. Just
     set the value back to something smaller and the error should disappear. 
     
*/
    @IBInspectable public var iconInset:CGFloat = 0.35 {
        didSet {
            iconLayer.frame = CGRectOffset(CGRectInset(bounds, bounds.width*iconInset, bounds.height*iconInset), iconXOffset, iconYOffset)
        }
    }
    
/**
     Offsets the icon on the x-axis.
     
     The icon offset properties may come in handy where an icon is visually heavier on one side.
     As a consequence it doesn't look visually centered even though it is mathematically centered.
        
     An alternative would be to pad the icon images with space to achieve visual balance.
     
     Defaults to 0.
     
*/
    @IBInspectable public var iconXOffset:CGFloat = 0.0 {
        didSet {
            setIconFrame()
        }
    }

/**
     Offset the icon on the y-axis.
     
     The icon offset properties may come in handy where an icon is visually heavier on one side.
     As a consequence it doesn't look visually centered even though it is mathematically centered.
     
     An alternative would be to pad the icon images with space to achieve visual balance.
*/
    @IBInspectable public var iconYOffset:CGFloat = 0.0 {
        didSet {
            setIconFrame()
        }
    }
    
/**
    Animating offsets might not be desirable under all circumstances. 
    
    Try both options to determine what's best for your visual taste.
     
    
    `false` by default.
*/
    @IBInspectable public var animatesOffsets:Bool = false

// MARK: - Public Methods

/**
        
     Resets the progress to 0 without animating the transition.
     
     To animate the transition, set the progress property to 0.
     
*/
    public func resetProgress() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        self.progress = 0
        CATransaction.commit()
    }


// MARK: PRIVATE PROPERTIES AND METHODS

// MARK: - Variable definitions
    private var progressLayer = CAShapeLayer()
    private var barLayer = CAShapeLayer()
    private var iconLayer = CALayer()
    
// MARK: - Initializers
    override init(frame:CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
// MARK: - Workhorse functions
    private func configure() {
        #if !TARGET_INTERFACE_BUILDER
            progress = 0
        #else
            progress = 0.25
        #endif
        
        setTitle("", forState: .Normal)
        
        /* 
            We want the fill to start at 12 o'clock, so we just do an affine transform.
            One could technically also use UIBezierPath(bezierPathWithArcCenter:...)
            to specify angles but then we have to convert the progress into angles
            and muck around with radians which isn't how I want my life to be.
        */
        progressLayer.transform = CATransform3DMakeRotation(CGFloat(-90.0 / 180.0 * M_PI), 0.0, 0.0, 1.0);
        progressLayer.lineWidth = 15
        progressLayer.fillColor = UIColor.clearColor().CGColor
        progressLayer.strokeColor = UIColor.blackColor().CGColor
        progressLayer.lineCap = kCALineCapButt
        
        barLayer.lineWidth = 15
        barLayer.fillColor = UIColor.clearColor().CGColor
        barLayer.strokeColor = UIColor(colorLiteralRed: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1.0).CGColor
        barLayer.strokeEnd = 1.0
        
        layer.addSublayer(iconLayer)
        layer.addSublayer(barLayer)
        layer.addSublayer(progressLayer)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.width != bounds.height {
            let side = min(bounds.width, bounds.height)
            bounds = CGRectMake(0, 0, side, side)
        }
        
        progressLayer.frame = bounds
        progressLayer.path = circlePath().CGPath
        
        barLayer.frame = bounds
        barLayer.path = circlePath().CGPath
        
        iconLayer.frame = CGRectOffset(CGRectInset(bounds, bounds.width*iconInset, bounds.height*iconInset), iconXOffset, iconYOffset)
    }
    
// MARK: - Convenience functions
    private func circlePath() -> UIBezierPath {
        return UIBezierPath(ovalInRect: CGRectInset(bounds, lineWidth/2.0, lineWidth/2.0))
    }
    
    private func setIconFrame() {
        if animatesOffsets {
            iconLayer.frame = CGRectOffset(CGRectInset(bounds, bounds.width*iconInset, bounds.height*iconInset), iconXOffset, iconYOffset)
        } else {
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            iconLayer.frame = CGRectOffset(CGRectInset(bounds, bounds.width*iconInset, bounds.height*iconInset), iconXOffset, iconYOffset)
            CATransaction.commit()
        }
    }

}
