//
//  JudgeViewController.swift
//  TradeShow
//
//  Created by Guannan Yao on 9/09/2015.
//  Copyright (c) 2015 University of Wollongong. All rights reserved.
//

import UIKit

class JudgeViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var btnAction: UIButton!
    
    @IBOutlet weak var imgQRCode: UIImageView!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var qrcodeImage: CIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.revealViewController() != nil{
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func performButtonAction(sender:AnyObject){
        if qrcodeImage == nil{
            if textField.text == "" {
                return
            }
            let data = textField.text.dataUsingEncoding(NSISOLatin1StringEncoding, allowLossyConversion: false)
            
            let filter = CIFilter(name: "CIQRCodeGenerator")
            
            filter.setValue(data, forKey: "inputMessage")
            filter.setValue("H", forKey: "inputCorrectionLevel")
            
            qrcodeImage = filter.outputImage
            
            imgQRCode.image = UIImage(CIImage: qrcodeImage)
            
            textField.resignFirstResponder()
        }
    }
    
    @IBAction func changeImageViewScale(sender:AnyObject){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
