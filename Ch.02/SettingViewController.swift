//
//  SettingViewController.swift
//  Ch.02
//
//  Created by hklife_mo on 2021/09/14.
//

import UIKit

protocol LEDChangeDelegate: AnyObject {
    func transData(text: String?, textColor: UIColor, background: UIColor)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    
    weak var delegate: LEDChangeDelegate?
    var currentTextColor: UIColor = .yellow
    var currentBackgroundColor: UIColor = .black
    var titleName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSetting()
    }
    
    private func initSetting(){
        if let name = titleName {
            self.titleText.text = name
        }
        
        self.changeTextColor(color: self.currentTextColor)
        self.changeBackgroundColor(color: self.currentBackgroundColor)
    }
    
    @IBAction func tapTextColorChangeBtn(_ sender: UIButton) {
        if sender == yellowButton {
            changeTextColor(color: .yellow)
            self.currentTextColor = .yellow
        } else if sender == purpleButton {
            changeTextColor(color: .purple)
            self.currentTextColor = .purple
        } else {
            changeTextColor(color: .green)
            self.currentTextColor = .green
        }
    }
    
    @IBAction func tapBackgroundColorChangeBtn(_ sender: UIButton) {
        if sender == blackButton {
            changeBackgroundColor(color: .black)
            self.currentBackgroundColor = .black
        }else if sender == orangeButton {
            changeBackgroundColor(color: .orange)
            self.currentBackgroundColor = .orange
        }else{
            changeBackgroundColor(color: .blue)
            self.currentBackgroundColor = .blue
        }
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        
        if let text = self.titleText.text {
            print("\(text)")
            print("\(currentTextColor)")
            print("\(currentBackgroundColor)")
            self.delegate?.transData(text: text, textColor: currentTextColor, background: currentBackgroundColor)
        }

        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    private func changeTextColor(color: UIColor){
        self.yellowButton.alpha = color == .yellow ? 1 : 0.2
        self.purpleButton.alpha = color == .purple ? 1 : 0.2
        self.greenButton.alpha = color == .green ? 1 : 0.2
    }
    
    private func changeBackgroundColor(color: UIColor){
        self.blackButton.alpha = color == .black ? 1 : 0.2
        self.orangeButton.alpha = color == .orange ? 1 : 0.2
        self.blueButton.alpha = color == .blue ? 1 : 0.2
    }
    
}
