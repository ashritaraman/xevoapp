//
//  ConsultantVC.swift
//  Xevo
//
//  Created by Aditya Saxena on 15/05/18.
//  Copyright © 2018 aditya saxena. All rights reserved.
//

import UIKit

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

var fName: String!
var fBio: String!

class ConsultantVC: UIViewController {

    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var first: UITextField!
    
    @IBOutlet weak var second: UITextField!
    
    @IBOutlet weak var third: UITextField!
    
    @IBAction func justg(_ sender: Any) {
        performSegue(withIdentifier: "gobacktob", sender: nil)
    }
    
    var placeholderLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // textView.layer.borderWidth = 0
        //textView.layer.borderColor = (UIColor.lightGray as! CGColor)
        //textView.delegate = self
        //textView.text = ""
       // textView.text = "Bio (Ex:- Sophomore at Stanford with 2 years of work experience at Airbnb)"
        //textView.layer.cornerRadius = 7
        //textView.layer.borderColor =  UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0).cgColor
        //textView.layer.borderWidth = 1
      // textView.delegate = self
        //textView.textColor = UIColor.lightGray
        /*
        placeholderLabel = UILabel()
        placeholderLabel.text = "Enter your bio"
        placeholderLabel.font = UIFont(name: "Avenir Book", size: 16)
        placeholderLabel.sizeToFit()
        textView.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (textView.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !textView.text.isEmpty
        */
        // Do any additional setup after loading the view.
        
        //fullname.setBottomBorder()
        //first.setBottomBorder()
        //second.setBottomBorder()
        //third.setBottomBorder()
        
        fullname.layer.borderWidth = 1
        fullname.layer.borderColor = UIColor.white.cgColor
        
        first.layer.borderWidth = 1
        first.layer.borderColor = UIColor.white.cgColor
        
        second.layer.borderWidth = 1
        second.layer.borderColor = UIColor.white.cgColor
        
        third.layer.borderWidth = 1
        third.layer.borderColor = UIColor.white.cgColor
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeaction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeaction1(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(rightSwipe)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
    }
    
    override func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @objc func swipeaction1(swipe: UISwipeGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   /* @IBAction func Nextbtn(_ sender: Any) {
        if (textView.text == "") {
            textView.layer.borderColor =  UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0).cgColor
        } else {
             performSegue(withIdentifier: "gotonext", sender: self)
        }
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotonext" {
        let sc = segue.destination as! ConsultVC
        sc.name = ""
        sc.bio = ""
      }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func swipeaction(swipe: UISwipeGestureRecognizer) {
        fName = fullname.text
        fBio = first.text! + second.text! + third.text!
        performSegue(withIdentifier: "gotonext", sender: self)
    }

}
