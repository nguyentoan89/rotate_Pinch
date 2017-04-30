//
//  Item.swift
//  Noel
//
//  Created by Nguyen Cong Toan on 4/8/17.
//  Copyright © 2017 mr.t. All rights reserved.
//

import UIKit
class Item: UIImageView, UIGestureRecognizerDelegate
{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    // function cai dat da cham
    func setup()
    {
        self.isUserInteractionEnabled = true // khoi tao da cham
        self.isMultipleTouchEnabled = true
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        self.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchPhoto))
        self.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotatePhoto))
        rotateGesture.delegate = self
        self.addGestureRecognizer(rotateGesture)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    func pinchPhoto(pinchGesture: UIPinchGestureRecognizer)
    {
        if let view = pinchGesture.view
        {
            view.transform = view.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
            pinchGesture.scale = 1
        }
    }
    
    
    func rotatePhoto(rotateGesture: UIRotationGestureRecognizer)
    {
        if let view = rotateGesture.view
        {
            view.transform  = CGAffineTransform(rotationAngle: rotateGesture.rotation)
            rotateGesture.rotation = 0
        }
    }
    
    
    func onPan(panGesture: UIPanGestureRecognizer)
    {
        if (panGesture.state == .began || panGesture.state == .changed)
        {
            let point = panGesture.location(in: self.superview)// lay toa do cua anh khi di chuyen so voi view chinh
            self.center = point
        }
       
    }
}
