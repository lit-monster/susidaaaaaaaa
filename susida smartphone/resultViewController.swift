//
//  resultViewController.swift
//  
//
//  Created by 中村太紀 on 2020/11/08.
//

import UIKit

class resultViewController: UIViewController {
    
    var count: Float = 0
    
    @IBOutlet var labell: UILabel!
    @IBOutlet var switchimage: UIImageView!
    @IBOutlet var smartphoneimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchimage.image = UIImage(named:"switch.png")?.rotatedBy(degree: 30)
        
        
        
        
        
        labell.text = String(count)
    }
    
    @IBAction func back() {self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


extension UIImage {
    
    
    func rotatedBy(degree: CGFloat) -> UIImage {
        let radian = -degree * CGFloat.pi / 180
        UIGraphicsBeginImageContext(self.size)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: self.size.width / 2, y: self.size.height / 2)
        context.scaleBy(x: 1.0, y: -1.0)
        
        context.rotate(by: radian)
        context.draw(self.cgImage!, in: CGRect(x: -(self.size.width / 2), y: -(self.size.height / 2), width: self.size.width, height: self.size.height))
        
        let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return rotatedImage
    }
    
}
