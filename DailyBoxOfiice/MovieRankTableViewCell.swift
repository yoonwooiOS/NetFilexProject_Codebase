//
//  MovieRankTableViewCell.swift
//  NetFilexProject_Codebase
//
//  Created by 김윤우 on 6/7/24.
//

import UIKit
import SnapKit

class MovieRankTableViewCell: UITableViewCell {

    static let identifier = "MovieRankTableViewCell"
    let rankLabel = UILabel()
    let movieTitle = UILabel()
    let dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        
        contentView.addSubview(rankLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(movieTitle)
       
        
    }
    
    func configureLayout() {
        
        rankLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            make.width.equalTo(30)
            
        }
        
        movieTitle.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            make.leading.equalTo(rankLabel.snp.trailing).offset(16)
           
            
            
        }
        dateLabel.snp.makeConstraints { make in
           
            make.top.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            make.leading.equalTo(movieTitle.snp.trailing).offset(16)
            make.width.equalTo(80)
            
        }
        
        
    }
    func configureUI() {
        
        contentView.backgroundColor = .black
        rankLabel.dbPrimaryLabel( textAlignment: .center, fontSize: 14, textColor: .black, backgourndColor: .clear)
        rankLabel.backgroundColor = .white
        movieTitle.dbPrimaryLabel(textAlignment: .left, fontSize: 14, textColor: .white, backgourndColor: .clear)
        dateLabel.dbPrimaryLabel(textAlignment: .center, fontSize: 12, textColor: .systemGray5, backgourndColor: .clear)
        
        
       }
}

