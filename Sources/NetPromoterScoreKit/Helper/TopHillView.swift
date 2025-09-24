//
//  TopHill.swift
//  NetPromoterScoreKit
//
//  Created by Maziar Saadatfar on 9/24/25.
//
import UIKit
class TopHillView: UIView {
    var hillHeight: CGFloat = 12 {
        didSet { setNeedsDisplay() }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    var fillColor: UIColor = .white {
        didSet { setNeedsDisplay() }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        let w = rect.width
        let h = rect.height
        let baseY = hillHeight
        let peakY: CGFloat = 0
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: baseY))
        
        // left radius
        path.addCurve(
            to: CGPoint(x: w/2, y: peakY),
            controlPoint1: CGPoint(x: w * 0.18, y: baseY),
            controlPoint2: CGPoint(x: w * 0.32, y: peakY)
        )
        
        // right radius
        path.addCurve(
            to: CGPoint(x: w, y: baseY),
            controlPoint1: CGPoint(x: w * 0.68, y: peakY),
            controlPoint2: CGPoint(x: w * 0.82, y: baseY)
        )
        
        path.addLine(to: CGPoint(x: w, y: h))
        path.addLine(to: CGPoint(x: 0, y: h))
        path.close()
        
        fillColor.setFill()
        path.fill()
    }
    
}
