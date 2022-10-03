//
//  ViewController.swift
//  Calculator
//
//  Created by donghun on 2022/09/29.
//

import UIKit

// 연산자 열거형
enum Operation {
    case Add
    case Substract
    case Multiply
    case Divide
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutPutLabel: UILabel!
    
    // numberOutputLabel에 표시할 값
    var displayNumber = ""
    // 첫번째 피연산자
    var firstOperand = ""
    // 두번째 피연산자
    var sencondOperand = ""
    // 현재 연산자
    var currentOperation: Operation = .unknown
    // 결과값
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // TODO [done] - 숫자 키패드 눌렀을 때[피연산]
    @IBAction func numberActionButton(_ sender: UIButton) {
        //옵셔널 처리
        guard let numberValue = sender.title(for: .normal) else { return}
        //숫자 9자리까니만 디스플레이에 보이게 함
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutPutLabel.text = self.displayNumber
        }
    }
    
    // TODO [x] - 계산기 초기화
    @IBAction func initializeButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.numberOutPutLabel.text = "0"
        self.firstOperand = ""
        self.sencondOperand = ""
        self.currentOperation = .unknown
        self.result = ""
    }
    
    // TODO[x] - 연산 기능
    @IBAction func calculateButton(_ sender: UIButton) {
        
    }
    
    // TODO[x] - 점 연산자
    @IBAction func dotButton(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0.":"."
            self.numberOutPutLabel.text = self.displayNumber
        }
    }
    
}

