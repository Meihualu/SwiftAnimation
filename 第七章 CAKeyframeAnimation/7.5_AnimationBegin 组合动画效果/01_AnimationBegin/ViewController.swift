//
//  ViewController.swift
//  01_AnimationBegin
//
//  Created by 张丁豪 on 2017/3/1.
//  Copyright © 2017年 张丁豪. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var loginButton:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 登录按钮
        loginButton = UIButton(frame: CGRect(x:20,y:230,width:self.view.frame.width-20*2,height:50))
        loginButton!.backgroundColor = UIColor(red: 50/255.0,green: 185/255.0, blue: 170/255.0, alpha: 1.0)
        loginButton!.setTitle("登陆", for:UIControlState.normal)
        self.view.addSubview(loginButton!)
        
        
        let rotate:CABasicAnimation = CABasicAnimation()
        rotate.keyPath = "transform.rotation"
        rotate.toValue = M_PI
        
        let scale:CABasicAnimation = CABasicAnimation()
        scale.keyPath = "transform.scale"
        scale.toValue = 0.0
        
        let move:CABasicAnimation = CABasicAnimation()
        move.keyPath = "transform.translation"
        move.toValue = NSValue(cgPoint:CGPoint(x:217,y:-230))
        
        let animationGroup:CAAnimationGroup = CAAnimationGroup()
        animationGroup.animations = [rotate,scale,move];
        animationGroup.duration = 2.0;
        animationGroup.fillMode = kCAFillModeForwards;
        animationGroup.isRemovedOnCompletion = false
        loginButton?.layer.add(animationGroup, forKey:nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //位置
        let animation:CABasicAnimation = CABasicAnimation()
        animation.keyPath = "position"
        let positionX:CGFloat = loginButton!.frame.origin.x+0.5*loginButton!.frame.size.width;
        let positionY:CGFloat = loginButton!.frame.origin.y+0.5*loginButton!.frame.size.height+100;
        animation.toValue = NSValue(cgPoint: CGPoint(x:positionX,y: positionY))
        animation.byValue = NSValue(cgPoint:CGPoint(x:-20,y:100))
        animation.duration = 2.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        loginButton?.layer.add(animation, forKey: nil)
        
        
    }
}

