//
//  ViewController.swift
//  PickerView
//
//  Created by 503-03 on 2018. 11. 6..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit

//연관된 데이터를 2개의 열에 출력  ﻿
class ViewController: UIViewController{
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    //데이터를 저장하는 배열
    var mainData : [String] = [String]()
    var subData : [[String]] = [[String]]()
    
    //첫번째 열에서 선택한 행 번호 저장하는 변수 선언
    //첫번째 열에서 선택한 행에 따라 두번째 열의 행 개수가 변화하기 때문에
    var selectedRow : Int = 0
    
    @IBAction func pick(_ sender: Any) {
        //피커뷰에서 두번째 열에 선택된 행 번호 찾아오기
        let row = pickerView.selectedRow(inComponent: 1)
        print(mainData[selectedRow] + ":" + subData[selectedRow][row])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainData.append("프로그래밍 언어")
        mainData.append("데이터 베이스")
        
        subData.append(["Java", "Python", "Kotlin", "Swift", "C++", "C#", "JavaScript"])
        subData.append(["Oracle", "MySQL", "MSSQL", "SQLite"])
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
}
extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    //열의 개수를 리턴하는 메소드
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 2
    }
    //열 별 행의 개수를 리턴하는 메소드
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        if component == 0 {
            return mainData.count
        }else {
            return subData[selectedRow].count
        }
        
    }
    //PickerView에 출력할 문잘열을 설정하는 메소드
    //return 하는 문자열이 피커뷰에 출력
    //row가 행번호이고 component가 열번호
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        if component == 0 {
            return mainData[row]
        }else{
            return subData[selectedRow][row]
        }
    }
    //선택한 후 때 호출되는 메소드
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if component == 0 {
            //첫번째 열에서 선택한 행 번호 저장하는 변수에 선택한 행 번호 저장
            selectedRow = row
            //피커 뷰의 두번째 열로 데이터 출력하게 설정
            pickerView.reloadComponent(1)
        }
    }
}
/*
class ViewController: UIViewController{

    @IBOutlet weak var pickerView: UIPickerView!
    
    //데이터를 저장하는 배열
    var ar : [String] = [String]()
    
    @IBAction func pick(_ sender: Any) {
        //피커뷰에서 선택된 행 번호 찾아오기
        let row : Int = pickerView.selectedRow(inComponent: 0)
        print(ar[row])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ar.append("마르코 반바스텐")
        ar.append("루드 굴리트")
        ar.append("조지 웨아")
        ar.append("요한 크루이프")
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }

}
//PickerView 출력을 위한 extension
extension ViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    //열의 개수를 리턴하는 메소드
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    //열 별 행의 개수를 리턴하는 메소드
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return ar.count
    }
    //PickerView에 출력할 문잘열을 설정하는 메소드
    //return 하는 문자열이 피커뷰에 출력
    //row가 행번호이고 component가 열번호
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return ar[row]
    }
}
*/

