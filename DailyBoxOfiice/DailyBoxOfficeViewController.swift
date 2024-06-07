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
    let customShadowImage = UIImageView()
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
        view.addSubview(customShadowImage)
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
        customShadowImage.snp.makeConstraints { make in
            make.top.equalTo(userTextfield.snp.bottom).offset(4)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(searchButton.snp.leading).offset(-8)
            make.height.equalTo(3)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(customShadowImage.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
    }
    
    func configureUI() {
        view.backgroundColor = .black
        navigationItem.title = "일간 박스 오피스"
        navigationItem.titleView?.tintColor = .white
        userTextfield.backgroundColor = .gray
        searchButton.backgroundColor = .blue
        customShadowImage.backgroundColor = .white
        tableView.backgroundColor = .brown
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
                print(value.boxOfficeResult.dailyBoxOfficeList)
                self.dailyMovieList = value.boxOfficeResult.dailyBoxOfficeList
            case .failure(let error):
                print(error)
                
            }
        }
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
        cell.dateLabel.text = data.movieCd 
        return cell
    }
    

    
}
