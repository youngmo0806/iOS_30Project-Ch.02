//
//  ViewController.swift
//  Ch.02
//
//  Created by hklife_mo on 2021/09/13.
//

import UIKit

class ViewController: UIViewController, LEDChangeDelegate {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
        
        if let settingViewController = segue.destination as? SettingViewController  {
            settingViewController.delegate = self
            settingViewController.titleName = self.textLabel.text
            settingViewController.currentTextColor = self.textLabel.textColor
            settingViewController.currentBackgroundColor = self.view.backgroundColor ?? .black
        }
    }
    
    
    func transData(text: String?, textColor: UIColor, background: UIColor) {
            
        if let title = text {
            self.textLabel.text = title
        }

        self.textLabel.textColor = textColor
        self.view.backgroundColor = background
        
    }
}

