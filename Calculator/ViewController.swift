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
    
    @IBAction func addButton(_ sender: UIButton) {
        self.operation(operation: .Add)
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        self.operation(operation: .Multiply)
    }
    
    @IBAction func substractButton(_ sender: UIButton) {
        self.operation(operation: .Substract)
    }
    
    @IBAction func divideButton(_ sender: UIButton) {
        self.operation(operation: .Divide)
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        self.operation(operation: self.currentOperation)
    }
    
    private func operation(operation : Operation) {
        // 이미 연산자를 클릭했다면, 첫번째 피연산자 값이 있다는 것
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {
                self.sencondOperand = self.displayNumber
                self.displayNumber = ""
                
                //소수값 일수 있으니 Double타입으로 형변환
                guard let firstOperation = Double(self.firstOperand) else {return}
                guard let secondOperation =
                        Double(self.sencondOperand) else {return}
                switch self.currentOperation{
                case .Add :
                    self.result = "\(firstOperation + secondOperation)"
                default:
                    break
                }
                self.firstOperand = self.result
                self.numberOutPutLabel.text = self.result
            }
            self.currentOperation = operation
        }else {
            // 연산자 클릭하기 전이니깐 첫번째 피연산자에 값추가
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
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
    

    
    // TODO[x] - 점 연산자
    @IBAction func dotButton(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0.":"."
            self.numberOutPutLabel.text = self.displayNumber
        }
    }
    
}

