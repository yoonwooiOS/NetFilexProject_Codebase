//
//  LotteryViewController.swift
//  NetFilexProject_Codebase
//
//  Created by 김윤우 on 6/6/24.
//

import UIKit
import SnapKit
import Alamofire






class LotteryViewController: UIViewController {
    
    let lottoNumberTextfield = UITextField()
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
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(52)
            make.height.equalTo(48)
        }
        winningNumberGuideLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoNumberTextfield.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(52)
        }
        dataLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoNumberTextfield.snp.bottom).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(52)
        }
        customShadowImage.snp.makeConstraints { make in
            make.top.equalTo(winningNumberGuideLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(52)
            make.height.equalTo(1)
        }
        lottoRoundLabel.snp.makeConstraints { make in
            make.top.equalTo(customShadowImage.snp.bottom).offset(16)
            make.centerX.equalTo(view.safeAreaLayoutGuide).inset(52)
            make.height.equalTo(40)
        }
        firstWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(52)
        }
        secondWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(16)
            make.leading.equalTo(firstWinningNumberLabel.snp.trailing).offset(16)
        }
        thirdinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(16)
            make.leading.equalTo(secondWinningNumberLabel.snp.trailing).offset(16)
        }
        fourthWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(16)
            make.leading.equalTo(thirdinningNumberLabel.snp.trailing).offset(16)
        }
        fifthWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(16)
            make.leading.equalTo(fourthWinningNumberLabel.snp.trailing).offset(16)
        }
        sixthtWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(16)
            make.leading.equalTo(fifthWinningNumberLabel.snp.trailing).offset(16)
        }
        plustBonusImage.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(16)
            make.leading.equalTo(sixthtWinningNumberLabel.snp.trailing).offset(16)
            
        }
        bonustWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundLabel.snp.bottom).offset(16)
            make.leading.equalTo(plustBonusImage.snp.trailing).offset(16)
        }
        
        bonusLabel.snp.makeConstraints { make in
            make.top.equalTo(bonustWinningNumberLabel.snp.bottom).offset(2)
            make.centerX.equalTo(bonustWinningNumberLabel)
        }
    }
    
    func configureUI() {
        
        navigationItem.title = "Lotto"
        lottoNumberTextfield.backgroundColor = .lightGray
        lottoNumberTextfield.addTarget(self, action: #selector(selectedLottoRound), for: .touchDown)
        lottoNumberTextfield.textAlignment = .center
       
        winningNumberGuideLabel.text = "당첨번호 안내"
        customShadowImage.backgroundColor = .systemGray5
        
        
        plustBonusImage.image = UIImage(systemName: "plus")
        plustBonusImage.tintColor = .black
        bonusLabel.font = .systemFont(ofSize: 8)
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
        @objc func selectedLottoRound() {
            
           
        }
            
            
            
        
        
    }
  

extension LotteryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
   
    func configurePickerView() {
        
        lottoNumberTextfield.inputView = pickerView
        
        pickerView.delegate = self
        pickerView.dataSource = self
       
        
    }
    // pickerView Compoents 개수
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
        Lotto.drwNo = roundList[row]
        requireLottoApi()
    }
    
}







