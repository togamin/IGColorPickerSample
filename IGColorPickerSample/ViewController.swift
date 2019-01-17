//
//  ViewController.swift
//  IGColorPickerSample
//
//  Created by Togami Yuki on 2019/01/15.
//  Copyright © 2019 Togami Yuki. All rights reserved.
//

import UIKit
import IGColorPicker

class ViewController: UIViewController {

    //カラーピッカーViewを格納するための変数宣言.
    var colorPickerView: ColorPickerView!
    let margin:CGFloat = 3
    
    //スクリーンのサイズ
    var screenWidth = UIScreen.main.bounds.size.width
    var screenHeight = UIScreen.main.bounds.size.height
    
    //色を入れる配列
    var colorList:[UIColor] = []
    var colorList2:[UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorPickerView = ColorPickerView(frame: CGRect(x: 0.0, y: 100.0, width: screenWidth, height: screenHeight*3/4))
        
        colorPickerView.delegate = self
        colorPickerView.layoutDelegate = self
        
        colorPickerView.style = .circle
        
        //colorPickerView.colors = [UIColor.red, UIColor.yellow, UIColor.green, UIColor.black]

        
        for R in 0...5{
            for G in 0...5{
                for B in 0...5{
                    let floatR:CGFloat = CGFloat(R)/5
                    let floatG:CGFloat = CGFloat(G)/5
                    let floatB:CGFloat = CGFloat(B)/5
                    print("RGB",floatR,floatG,floatB)
                    let color = UIColor(red: floatR, green: floatG, blue: floatB, alpha: 1)
                    let color2 = UIColor(red: floatR, green: floatG, blue: floatB, alpha: 0.4)
                    colorList.append(color)
                    colorList2.append(color2)
                }
            }
        }
        
        colorPickerView.colors = colorList
        view.addSubview(colorPickerView)
    }
}


extension ViewController: ColorPickerViewDelegate,ColorPickerViewDelegateFlowLayout {
    
    //色選択後
    func colorPickerView(_ colorPickerView: ColorPickerView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        print(colorPickerView.colors[indexPath.row])
        colorPickerView.backgroundColor = colorList2[indexPath.row]
    }
    
    //色非選択後
    func colorPickerView(_ colorPickerView: ColorPickerView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    func colorPickerView(_ colorPickerView: ColorPickerView, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellRowNum:CGFloat = 4
        let screenWidth = UIScreen.main.bounds.size.width
        let cellSize:CGFloat = (screenWidth - margin * (cellRowNum + 1))/cellRowNum
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Space between cells
        return 0
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // Space between rows
        return 0
    }
    
    func colorPickerView(_ colorPickerView: ColorPickerView, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 3, left: 3, bottom: 3, right: 3)
    }
    
}
