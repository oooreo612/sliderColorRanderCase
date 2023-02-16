//
//  ViewController.swift
//  slidercase
//
//  Created by iroda on 2023/1/31.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var cheongsamImageView: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alpheSlider: UISlider!
    
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var alpheSwitch: UISwitch!
    @IBOutlet weak var gradualViewChange: UISwitch!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alpheLabel: UILabel!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var prevPage: UIButton!
    
    @IBOutlet weak var randerColorButton: UIButton!
    @IBOutlet weak var gradientColor: UIButton!
    
    @IBOutlet weak var backgroundImagePage: UIPageControl!
    
    var slectbackgroundView : Int = 0
    let backgroundViewSlect = ["Material_1" , "Material_2" , "Material_3" , "Material_4" , "Material_5" , "Material_6"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 圖騰材質選擇
    func slectChangeback(){
        backgroundImageView.image = UIImage(named: backgroundViewSlect[slectbackgroundView])
        backgroundImagePage.currentPage = slectbackgroundView
    }
    
    
    // 中國服背景顏色
    func clothingColorChange(){
        backgroundImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alpheSlider.value))
    }
    
    // Slider文字改變
    func colorTextLabel(){
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        alpheLabel.text = String(format: "%.2f", alpheSlider.value)
    }
    
 
    //漸層圖層
    func gradualViewChangefunction(){
        let backgroundImageViewLayer = CAGradientLayer()
        backgroundImageViewLayer.frame = backgroundImageView.bounds
        backgroundImageViewLayer.colors = [UIColor.init(displayP3Red: CGFloat(redSlider.value), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: 1).cgColor, UIColor.init(displayP3Red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(blueSlider.value), alpha: 1).cgColor]
        backgroundImageViewLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        backgroundImageViewLayer.endPoint = CGPoint(x: 1, y: 0.5)
        backgroundImageViewLayer.locations = [0,1]
        backgroundImageView.layer.addSublayer(backgroundImageViewLayer)
        clothingColorChange()
    }
 
    
    // 右選圖騰
    @IBAction func nextPageControl(_ sender: Any) {
        if slectbackgroundView == backgroundViewSlect.count-1{
            slectbackgroundView = 0
        }else{
            slectbackgroundView += 1
        }
        slectChangeback()
      
    }
    
    //左選圖騰
    @IBAction func prevPageControl(_ sender: Any) {
        if slectbackgroundView == 0{
            slectbackgroundView = backgroundViewSlect.count-1
        }else{
            slectbackgroundView -= 1
        }
        slectChangeback()
    }
    
   
    
    @IBAction func switchChangeChoose(_ sender: UISwitch) {
        if redSwitch.isOn{
            redSlider.isEnabled = true
        }else{
            redSlider.isEnabled = false
        }
        if greenSwitch.isOn{
            greenSlider.isEnabled = true
        }else{
            greenSlider.isEnabled = false
        }
        if blueSwitch.isOn{
            blueSlider.isEnabled = true
        }else{
            blueSlider.isEnabled = false
        }
        if alpheSwitch.isOn{
            alpheSlider.isEnabled = true
        }else{
            alpheSlider.isEnabled = false
        }
        
    }
    
    
    @IBAction func sliderControl(_ sender: UISlider) {
        backgroundImageView.image = UIImage(named: "")
        colorTextLabel()
        clothingColorChange()
        
    }
    
    
    @IBAction func rangerColorControl(_ sender: Any) {
        backgroundImageView.image = UIImage(named: "")
        randerColorButton.isEnabled = true
        if gradualViewChange.isOn{
            alpheSlider.value = 1
            alpheLabel.text = "1.00"
            greenSwitch.isOn = false
            greenSlider.isEnabled = false
            gradualViewChangefunction()
        }else{
            backgroundImageView.layer.sublayers?.removeAll()
            redSwitch.isOn = true
            greenSwitch.isOn = true
            blueSwitch.isOn = true
            alpheSwitch.isOn = true
            greenSlider.isEnabled = true
            if ((redSwitch.isOn) && (greenSwitch.isOn) && (blueSwitch.isOn) && (alpheSwitch.isOn)){
                clothingColorChange()
                redSlider.value = .random(in: 0...1)
                greenSlider.value = .random(in: 0...1)
                blueSlider.value = .random(in: 0...1)
                alpheSlider.value = .random(in: 0...1)
                clothingColorChange()
                colorTextLabel()
            }else {
                redSlider.value = .random(in: 0...1)
                greenSlider.value = .random(in: 0...1)
                blueSlider.value = .random(in: 0...1)
                alpheSlider.value = .random(in: 0...1)
                clothingColorChange()
                colorTextLabel()
            }
        }
        colorTextLabel()
    }
    
    
    
    
    
   
    
    

}

