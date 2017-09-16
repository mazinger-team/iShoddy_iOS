//
//  Dialog.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 10/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit


public class Dialog : UIViewController{
    
    
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    
    @IBOutlet weak var labelMessage: UILabel!
    
    @IBAction func onClose(_ sender: Any) {
         removeAnimate()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.popUpView.layer.cornerRadius = 5
        self.popUpView.layer.shadowOpacity = 0.8
        self.popUpView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
    }
    
    func showInView(_ aView: UIView!, withImage image : UIImage!,withTitle title: String, withMessage message: String!, animated: Bool)
    {
        self.view.translatesAutoresizingMaskIntoConstraints = true
        self.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.frame = aView.bounds
 
         aView.addSubview(self.view)
         self.labelTitle.text = title
         self.labelMessage.text = message
       
       if animated
        {
            self.showAnimate()
        }
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
}
