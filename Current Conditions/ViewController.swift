//
//  ViewController.swift
//  Current Conditions
//
//  Created by Jorge Gallardo on 8/3/15.
//  Copyright © 2015 Jorge Gallardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var enterCityLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* download content from a site and do something with it
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
        if let urlContent = data {
        let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
        self.webView.loadHTMLString(String(webContent!), baseURL: nil)
        })
        } else {
        //show error message
        }
        }
        task.resume()*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //allow user to close the keyboard by tapping outside of the keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //allow user to close the keyboard by pressing the return key
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        cityText.resignFirstResponder() //close the keyboard
        return true
    }

    @IBAction func changeCity(sender: AnyObject) {
        let userInput = cityText.text
        let city = "http://www.weather-forecast.com/locations/" + userInput! + "/forecasts/latest"
        
        if let url = NSURL(string: city) {
            enterCityLabel.text = "Cool! Now try another city!"
            webView.loadRequest(NSURLRequest(URL: url)) // simple way to display a website
        } else {
            enterCityLabel.text = "Invalid City. Try again."
        }

        cityText.resignFirstResponder() //close the keyboard
    }
}