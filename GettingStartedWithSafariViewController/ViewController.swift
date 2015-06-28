//
//  ViewController.swift
//  GettingStartedWithSafariViewController
//
//  Created by Jordan Morgan on 6/25/15.
//  Copyright © 2015 Jordan Morgan. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate
{
    private var urlString:String = "https://google.com"

    //MARK: Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Web Content Presenting
    @IBAction func openInSafari(sender: AnyObject)
    {
        let url = NSURL(string: self.urlString)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    @IBAction func openWithSafariVC(sender: AnyObject)
    {
        let svc = SFSafariViewController(URL: NSURL(string: self.urlString)!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let navVC = segue.destinationViewController as? UINavigationController
        {
            let cwvc = navVC.topViewController as! CustomWebViewController
            cwvc.urlString = self.urlString
        }
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
