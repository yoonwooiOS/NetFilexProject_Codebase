//
//  NetfliexMainViewController.swift
//  NetFilexProject_Codebase
//
//  Created by 김윤우 on 6/4/24.
//

import UIKit
import SnapKit

class NetfliexMainViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    let titleLabel = UILabel()
    let mainImageView = UIImageView()
    let playButton = UIButton()
    let describeLable = UILabel()
    let myBookmarkListButton = UIButton()
    let nowPopularContentsLabel = UILabel()
    let firstPopularImage = UIImageView()
    let secondPopularImage = UIImageView()
    let thirdPopularImage = UIImageView()
    let top10Image = UIImageView()
    let nowWatchingImage = UIImageView()
    let newSeriesImage = UIImageView()
    let netflixLogo = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configureHierarchy() {
        
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(mainImageView)
        view.addSubview(playButton)
        view.addSubview(describeLable)
        view.addSubview(myBookmarkListButton)
        view.addSubview(nowPopularContentsLabel)
        view.addSubview(firstPopularImage)
        view.addSubview(secondPopularImage)
        view.addSubview(thirdPopularImage)
        view.addSubview(top10Image)
        view.addSubview(nowWatchingImage)
        view.addSubview(newSeriesImage)
        view.addSubview(netflixLogo)
        
        
    }
    
    func configureLayout() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.width.equalTo(350)
            make.height.equalTo(450)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            
        }
        describeLable.snp.makeConstraints { make in
            make.bottom.equalTo(mainImageView.snp.bottom).offset(-84)
            make.centerX.equalTo(mainImageView)
            
        }
        playButton.snp.makeConstraints { make in
            make.leading.equalTo(mainImageView.snp.leading).offset(16)
            make.bottom.equalTo(mainImageView.snp.bottom).offset(-24)
            make.height.equalTo(40)
            make.width.equalTo(155)
           
           
            
        }
        myBookmarkListButton.snp.makeConstraints { make in
            make.trailing.equalTo(mainImageView.snp.trailing).offset(-16)
            make.bottom.equalTo(mainImageView.snp.bottom).offset(-24)
            make.height.equalTo(40)
            make.width.equalTo(155)
        }
        nowPopularContentsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        firstPopularImage.snp.makeConstraints { make in
            make.top.equalTo(nowPopularContentsLabel.snp.bottom).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(145)
            make.width.equalTo(105)
        }
        secondPopularImage.snp.makeConstraints { make in
            make.top.equalTo(nowPopularContentsLabel.snp.bottom).offset(8)
            make.leading.equalTo(firstPopularImage.snp.trailing).offset(16)
            make.height.equalTo(145)
            make.width.equalTo(105)
        }
        thirdPopularImage.snp.makeConstraints { make in
            make.top.equalTo(nowPopularContentsLabel.snp.bottom).offset(8)
            make.leading.equalTo(secondPopularImage.snp.trailing).offset(16)
            make.height.equalTo(145)
            make.width.equalTo(105)
        }
        top10Image.snp.makeConstraints { make in
            make.top.equalTo(secondPopularImage.snp.top)
            make.trailing.equalTo(secondPopularImage.snp.trailing)
        }
        nowWatchingImage.snp.makeConstraints { make in
            make.centerX.equalTo(secondPopularImage)
            make.bottom.equalTo(secondPopularImage.snp.bottom)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }
        newSeriesImage.snp.makeConstraints { make in
            make.centerX.equalTo(thirdPopularImage)
            make.bottom.equalTo(thirdPopularImage.snp.bottom)
            make.height.equalTo(20)
            make.width.equalTo(68)
        }
        netflixLogo.snp.makeConstraints { make in
            make.leading.equalTo(thirdPopularImage.snp.leading).offset(4)
            make.top.equalTo(thirdPopularImage.snp.top).offset(4)
           
        }
    }
    
    func configureUI() {
       
        backgroundImageView.primaryImageView(assetName: "background", contendMode: .scaleToFill, cornerRadius: 0)
        mainImageView.primaryImageView(assetName: "명량", contendMode: .scaleToFill, cornerRadius: 10)
        firstPopularImage.primaryImageView(assetName: "구미호뎐", contendMode: .scaleToFill, cornerRadius: 0)
        secondPopularImage.primaryImageView(assetName: "비질란테", contendMode: .scaleToFill, cornerRadius: 0)
        thirdPopularImage.primaryImageView(assetName: "마스크걸", contendMode: .scaleToFill, cornerRadius: 0)
        top10Image.primaryImageView(assetName: "top10 badge", contendMode: .scaleToFill, cornerRadius: 0)
        nowWatchingImage.primaryImageView(assetName: "새로운에피소드지금시청하기", contendMode: .scaleToFill, cornerRadius: 7)
        newSeriesImage.primaryImageView(assetName: "새로운시리즈", contendMode: .scaleToFill, cornerRadius: 7)
        netflixLogo.primaryImageView(assetName: "single-small", contendMode: .scaleAspectFill, cornerRadius: 0)
        
        titleLabel.primaryTitleLabel(labelText: "고래밥님", textAlignment: .center, fontSize: 20, textColor: .white)
        describeLable.primarySubTitleLabel(labelText: "응원하고픈 · 흥미진진 · 사극 전투 · 한국 작품", textAlignment: .center, fontSize: 14, textColor: .white)
        
        nowPopularContentsLabel.primarySubTitleLabel(labelText: "지금 뜨는 콘텐츠", textAlignment: .left, fontSize: 14, textColor: .white)
       
        playButton.primaryButton(buttonTitle: "", titleColor: .clear, fontSize: 0, backgroundColor: .clear, cornerRadius: 10, assetImageName: "play_normal")
        playButton.contentVerticalAlignment = .fill
        playButton.contentHorizontalAlignment = .fill
        playButton.configuration?.imagePadding = 2
        
        myBookmarkListButton.primaryButton(buttonTitle: "+ 내가 찜한 리스트", titleColor: .white, fontSize: 14, backgroundColor: .darkGray, cornerRadius: 10, assetImageName: "")
       
      
    }
}
