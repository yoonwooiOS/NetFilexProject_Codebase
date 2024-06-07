//
//  DailyBoxOfficeViewController.swift
//  NetFilexProject_Codebase
//
//  Created by 김윤우 on 6/7/24.
//

import UIKit
import SnapKit
import Alamofire



class DailyBoxOfficeViewController: UIViewController {
    
    let userTextfield = UITextField()
    let searchButton = UIButton()
    let customshadowView = UIView()
    let tableView = UITableView()
    var dailyMovieList:[BoxOfficeResult] = [] {
        
        didSet {
            
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requireLottoApi()
        configureHierarchy()
        configureLayout()
        configureUI()
        configureTableView()
        
    }
    
    func configureHierarchy() {
        view.addSubview(userTextfield)
        view.addSubview(searchButton)
        view.addSubview(customshadowView)
        view.addSubview(tableView)
        
    }
    
    func configureLayout() {
        userTextfield.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(searchButton.snp.leading).offset(-8)
            make.height.equalTo(36)
        }
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(2)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.width.equalTo(64)
            make.height.equalTo(48)
        }
        customshadowView.snp.makeConstraints { make in
            make.top.equalTo(userTextfield.snp.bottom).offset(4)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(searchButton.snp.leading).offset(-8)
            make.height.equalTo(3)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(customshadowView.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
    }
    
    func configureUI() {
        
        view.backgroundColor = .black
        navigationItem.title = "일간 박스 오피스"
        navigationItem.titleView?.tintColor = .white
        
       
        customshadowView.backgroundColor = .white
        
        userTextfield.text = "20200401"
        userTextfield.primaryTextfield(placeholderText: "궁금하신 날짜를 입력해주세요", textAlignment: .left)
        userTextfield.keyboardType = .numberPad
        
        searchButton.dbPrimaryButton(buttonTitle: "검색", titleColor: .black, fontSize: 14, backgroundColor: .white, cornerRadius: 0)
        searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
    }
    
    func configureTableView() {
        
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieRankTableViewCell.self, forCellReuseIdentifier: MovieRankTableViewCell.identifier)
        
    }
    
    func requireLottoApi() {
        
        
        let url = "\(APIURL.dailyBoxOffice)\(DailyBoxOfficeData.showRange)"
        AF.request(url).responseDecodable(of: BoxOfficeData.self) { response in
            switch response.result {
            case .success(let value):
//                print(value.boxOfficeResult.dailyBoxOfficeList)
                self.dailyMovieList = value.boxOfficeResult.dailyBoxOfficeList
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    @objc func searchButtonClicked() {
        
        guard let text = userTextfield.text, text.count == 8 else {
            userTextfield.text = nil
            return userTextfield.placeholder = "양식에 맞게 써주세요. ex) 20240604"
        }
        
        DailyBoxOfficeData.showRange = text
        requireLottoApi()
        userTextfield.resignFirstResponder()
        
    }
    
}

extension DailyBoxOfficeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyMovieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieRankTableViewCell.identifier, for: indexPath) as! MovieRankTableViewCell
        
        let data = dailyMovieList[indexPath.row]
        
        cell.movieTitle.text = data.movieNm
        cell.rankLabel.text = data.rank
        cell.dateLabel.text = data.openDt
        
        return cell
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable_DBVC: UIViewControllerRepresentable {
   
func updateUIViewController(_ uiView: UIViewController,context: Context) {
    // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
    DailyBoxOfficeViewController()
  }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_DBVC_PreviewProvider: PreviewProvider {
  static var previews: some View {
    Group {
      ViewControllerRepresentable_DBVC()
        .ignoresSafeArea()
        .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
    }
     
  }
} #endif
