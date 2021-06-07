//
//  HudView.swift
//  MyLocations
//
//  Created by Manu Safarov on 28.05.2021.
//

import UIKit

class HudView: UIView {
    var text = ""
    
    class func hud(inView view: UIView, animated: Bool) -> HudView {
        let hudView = HudView(frame: view.bounds)
        hudView.isOpaque = false
        
        view.addSubview(hudView)
        view.isUserInteractionEnabled = false
        
        hudView.show(animated: animated)
        return hudView
    }
    
    override func draw(_ rect: CGRect) {
        let boxWidth: CGFloat = 96
        let boxHeight: CGFloat = 96
        
        let boxRect = CGRect(x: round((bounds.size.width - boxWidth) / 2),
                             y: round((bounds.size.height - boxHeight) / 2),
                             width: boxWidth, height: boxHeight)
        
        let roundedRect = UIBezierPath(roundedRect: boxRect, cornerRadius: 30)
        UIColor(named: "hudColor")!.setFill()
        roundedRect.fill()
        
        // Draw checkmark
        guard let image = UIImage(named: "hudCheckIcon") else { return }
        let imagePoint = CGPoint(x: center.x - round(image.size.width / 2),
                                 y: center.y - round(image.size.height / 2) - boxHeight / 8)
        
        image.draw(at: imagePoint)
        
        // Draw the text
        let attribs = [NSAttributedString.Key.font: UIFont(name: "Rubik-Medium", size: 16),
                       NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let textSize = text.size(withAttributes: attribs as [NSAttributedString.Key : Any])
        
        let textPoint = CGPoint(x: center.x - round(textSize.width / 2),
                                y: center.y - round(textSize.height / 2) + boxHeight / 6)
        
        text.draw(at: textPoint, withAttributes: attribs as [NSAttributedString.Key : Any])
    }
    
    // MARK: - Helper methods
    func show(animated: Bool) {
        if animated {
            alpha = 0
            transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            
            UIView.animate(
                withDuration: 0.3,
                delay: 0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 0.5,
                options: [],
                animations: {
                    self.alpha = 1
                    self.transform = CGAffineTransform.identity
                }, completion: nil)
        }
    }
    
    func hide() {
        superview?.isUserInteractionEnabled = true
        removeFromSuperview()
    }
}
