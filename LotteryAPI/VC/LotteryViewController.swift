//
//  LotteryViewController.swift
//  NetFilexProject_Codebase
//
//  Created by 김윤우 on 6/6/24.
//

import UIKit
import SnapKit
import Alamofire

class LotteryViewController: UIViewController, UITextFieldDelegate {
    
    var lottoNumberTextfield = UITextField()
    let winningNumberGuideLabel = UILabel()
    let dataLabel = UILabel()
    let customShadowImage = UIView()
    let lottoRoundLabel = UILabel()
    let firstWinningNumberLabel = UILabel()
    let secondWinningNumberLabel = UILabel()
    let thirdinningNumberLabel = UILabel()
    let fourthWinningNumberLabel = UILabel()
    let fifthWinningNumberLabel = UILabel()
    let sixthtWinningNumberLabel = UILabel()
    let plustBonusImage = UIImageView()
    let bonustWinningNumberLabel = UILabel()
    let bonusLabel = UILabel()
    let pickerView = UIPickerView()
    let rounds = Array(900...999)
    var roundList: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundList.append(contentsOf: rounds)
        view.backgroundColor = .white
        
        requireLottoApi()
        configurePickerView()
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    func configureHierarchy() {
        view.addSubview(lottoNumberTextfield)
        view.addSubview(winningNumberGuideLabel)
        view.addSubview(dataLabel)
        view.addSubview(customShadowImage)
        view.addSubview(lottoRoundLabel)
        view.addSubview(firstWinningNumberLabel)
        view.addSubview(secondWinningNumberLabel)
        view.addSubview(thirdinningNumberLabel)
        view.addSubview(fourthWinningNumberLabel)
        view.addSubview(fifthWinningNumberLabel)
        view.addSubview(sixthtWinningNumberLabel)
        view.addSubview(plustBonusImage)
        view.addSubview(bonustWinningNumberLabel)
        view.addSubview(bonusLabel)
        
        
    }
    
    func configureLayout() {
        lottoNumberTextfield.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(32)
            make.height.equalTo(48)
        }
        winningNumberGuideLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoNumberTextfield.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(32)
        }
        dataLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoNumberTextfield.snp.bottom).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(32)
        }
        customShadowImage.snp.makeConstraints { make in
            make.top.equalTo(winningNumberGuideLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(32)
            make.height.equalTo(1)
        }
        lottoRoundLabel.snp.makeConstraints { make in
            make.top.equalTo(customShadowImage.snp.bottom).offset(16)
            make.centerX.equalTo(view.safeAreaLayoutGuide).inset(32)
            make.height.equalTo(40)
        }
        firstWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(28)
            make.size.equalTo(40)
        }
        secondWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(16)
            make.leading.equalTo(firstWinningNumberLabel.snp.trailing).offset(8)
            make.size.equalTo(40)

        }
        thirdinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(16)
            make.leading.equalTo(secondWinningNumberLabel.snp.trailing).offset(4)
            make.size.equalTo(40)

        }
        fourthWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(16)
            make.leading.equalTo(thirdinningNumberLabel.snp.trailing).offset(4)
            make.size.equalTo(40)

        }
        fifthWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(16)
            make.leading.equalTo(fourthWinningNumberLabel.snp.trailing).offset(4)
            make.size.equalTo(40)

        }
        sixthtWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(16)
            make.leading.equalTo(fifthWinningNumberLabel.snp.trailing).offset(4)
            make.size.equalTo(40)

        }
        plustBonusImage.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(24)
            make.leading.equalTo(sixthtWinningNumberLabel.snp.trailing).offset(8)
            
        }
        bonustWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(16)
            make.leading.equalTo(plustBonusImage.snp.trailing).offset(8)
            make.size.equalTo(40)

        }
        
        bonusLabel.snp.makeConstraints { make in
            make.top.equalTo(bonustWinningNumberLabel.snp.bottom).offset(2)
            make.centerX.equalTo(bonustWinningNumberLabel)
        }
    }
    
    func configureUI() {
        
        navigationItem.title = "Lottery"
        
        lottoNumberTextfield.primaryTextfield(placeholderText: "궁금하신 로또 회차를 입력해주세요", textAlignment: .left)
       
        firstWinningNumberLabel.primarySubtitleLabel(fontSize: 14, backgroundColor: .systemYellow)
        secondWinningNumberLabel.primarySubtitleLabel(fontSize: 14, backgroundColor: .systemBlue)
        thirdinningNumberLabel.primarySubtitleLabel(fontSize: 14, backgroundColor: .systemBlue)
        fourthWinningNumberLabel.primarySubtitleLabel(fontSize: 14, backgroundColor: .systemRed)
        fifthWinningNumberLabel.primarySubtitleLabel(fontSize: 14, backgroundColor: .systemRed)
        sixthtWinningNumberLabel.primarySubtitleLabel(fontSize: 14, backgroundColor: .systemGray)
        bonustWinningNumberLabel.primarySubtitleLabel(fontSize: 14, backgroundColor: .systemGray)
        winningNumberGuideLabel.primaryTitleLabel(labelText: "당첨번호 안내", textAlignment: .left, fontSize: 14, textColor: .black)
        bonusLabel.primarySubTitleLabel(labelText: "보너스", textAlignment: .center, fontSize: 10, textColor: .systemGray, backgourndColor: .clear)
       
        customShadowImage.backgroundColor = .systemGray5
        
        plustBonusImage.image = UIImage(systemName: "plus")
        plustBonusImage.tintColor = .black
       
        dataLabel.font = .systemFont(ofSize: 10)
        dataLabel.textColor = .systemGray
    }
    func requireLottoApi() {
        
        
        let url = "\(APIURL.lottoURL)\(Lotto.drwNo)"
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                
                print(value)
                self.firstWinningNumberLabel.text = "\(value.drwtNo1)"
                self.secondWinningNumberLabel.text = "\(value.drwtNo2)"
                self.thirdinningNumberLabel.text = "\(value.drwtNo3)"
                self.fourthWinningNumberLabel.text = "\(value.drwtNo4)"
                self.fifthWinningNumberLabel.text = "\(value.drwtNo5)"
                self.sixthtWinningNumberLabel.text = "\(value.drwtNo6)"
                self.bonustWinningNumberLabel.text = "\(value.bnusNo)"
                self.lottoNumberTextfield.text = "\(Lotto.drwNo)"
                self.lottoRoundLabel.text = "\(Lotto.drwNo)회 당첨결과"
                self.dataLabel.text = "\(value.drwNoDate) 추첨"
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
}


extension LotteryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func configureToolbar() {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        // 반투명효과
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(donePicker))
        // 툴바 옵션에는 left,rightBarButtonItem이 없기 때문에 공간을 줘서 위치를 잡음
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cacelPicker))
        
        toolBar.setItems([cancelButton,flexibleSpace,doneButton], animated: false)
        // 뷰의 터치 이벤트 처리, 기본은 true, false로 되어 있으면 취소 | 완료 BarButton을 누를 수 없음
        toolBar.isUserInteractionEnabled = true
        
        lottoNumberTextfield.inputAccessoryView = toolBar
    }
    
    func configurePickerView() {
        
        lottoNumberTextfield.inputView = pickerView
        configureToolbar()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        
    }
    
    @objc func donePicker() {
        
        let row = pickerView.selectedRow(inComponent: 0)
        pickerView.selectRow(row, inComponent: 0, animated: false)
        lottoNumberTextfield.text = "\(roundList[row])"
        // 툴바 내림 메서드
        lottoNumberTextfield.resignFirstResponder()
        
        Lotto.drwNo = roundList[row]
        requireLottoApi()
        
    }
    @objc func cacelPicker() {
        
        lottoNumberTextfield.text = nil
        lottoNumberTextfield.resignFirstResponder()
        
    }
    
    // Components - tableView의 Section
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return roundList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      
            return String(roundList[row])
    
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        lottoNumberTextfield.text = String(roundList[row])
        
    }
}




extension UILabel {
    
    func primarySubtitleLabel(fontSize size: CGFloat , backgroundColor bcColor: UIColor) {
        
        self.font = .systemFont(ofSize: size)
        self.textColor = .white
        self.textAlignment = .center
        self.backgroundColor = bcColor
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        
    }
    
}
