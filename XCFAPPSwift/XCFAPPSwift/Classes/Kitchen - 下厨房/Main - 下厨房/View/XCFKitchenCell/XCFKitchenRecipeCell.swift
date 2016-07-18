//
//  XCFKitchenRecipeCell.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/15.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFKitchenRecipeCell: UITableViewCell {

    @IBOutlet weak var whisperLable: UILabel!
    @IBOutlet weak var bigImageV: UIImageView!
    @IBOutlet weak var videoBtn: UIButton!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var imageDetaileTitle: UILabel!

    @IBOutlet weak var authorBtn: XCFKitchenNavBtn!
    @IBOutlet weak var bottomTitle: UILabel!
    @IBOutlet weak var bottomDetaileTitle: UILabel!
    
    @IBOutlet weak var bottomPeopleCount: UILabel!
    @IBOutlet weak var scoreTitle: UILabel!
    //约束
    @IBOutlet weak var bigImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
    @IBOutlet weak var cellMarginTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var cellMarginView: UIView!
    
    //lable间距
    @IBOutlet weak var bottomTitle1Margin: NSLayoutConstraint!
    
    @IBOutlet weak var bottomTitle2Margin: NSLayoutConstraint!
    
    @IBOutlet weak var bottomTitle3Margin: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellMarginView.backgroundColor = UIColor.colorWithHexString(XCFCellMarginColor)
        imageTitle.preferredMaxLayoutWidth = XCFRecipeCellLableMaxWidth
        imageDetaileTitle.preferredMaxLayoutWidth = XCFRecipeCellLableMaxWidth
        bottomTitle.preferredMaxLayoutWidth = XCFRecipeCellLableMaxWidth
        bottomDetaileTitle.preferredMaxLayoutWidth = XCFRecipeCellLableMaxWidth
    }

    var kitchenItemsModel:XCFKitchenItems?{
        didSet{
            let kitchenContentsModel = kitchenItemsModel?.contents
            let url:String = (kitchenContentsModel!.image?.url)!
            bigImageV.sd_setImageWithURL(NSURL.init(string: url), placeholderImage: placeholderImage)
            bigImageViewHeight.constant = CGFloat((kitchenContentsModel!.image?.height)!)
            //隐藏控件
            videoBtn.hidden = true
            authorBtn.hidden = true
            
            //顶部View
            imageTitle.text = kitchenContentsModel!.title
            imageDetaileTitle.text = kitchenContentsModel?.desc

            videoBtn.hidden = (kitchenContentsModel?.video_url == nil)
            whisperLable.text = kitchenContentsModel?.whisper
            //底部
            if (kitchenContentsModel?.n_cooked != nil) {
                bottomPeopleCount.text = "· \(kitchenContentsModel!.n_cooked!)人做过"
            }else{
                bottomPeopleCount.text = ""
            }
            if (kitchenContentsModel?.score != nil) {
                scoreTitle.text = String(format: "%.2f分",kitchenContentsModel!.score!.floatValue)//"\(kitchenContentsModel!.score!)分"
            }else{
                scoreTitle.text = ""
            }
            if (kitchenContentsModel?.author?.photo != nil && kitchenContentsModel?.author?.photo != "") {
                authorBtn.hidden = false
                authorBtn.setHeaderWithURL((kitchenContentsModel?.author?.photo)!)
                authorBtn.setTitle((kitchenContentsModel?.author?.name)!, forState: UIControlState.Normal)
            }
            if kitchenContentsModel?.title_1st != nil {
                bottomTitle.text = kitchenContentsModel?.title_1st
            }else{
                bottomTitle.text = ""
            }
            if kitchenContentsModel?.title_2nd != nil {
                bottomDetaileTitle.text = kitchenContentsModel?.title_2nd
            }else{
                bottomDetaileTitle.text = ""
            }
            //如果没有赋值的lable那么它的margin也应该去掉
            self.layoutIfNeeded()
            if (bottomTitle.height != 0) {
                bottomTitle1Margin.constant = 20
            }else{
                bottomTitle1Margin.constant = 0
            }
            if (bottomDetaileTitle.height != 0) {
                bottomTitle2Margin.constant = 10
            }else{
                bottomTitle2Margin.constant = 0
            }
            if (scoreTitle.height != 0 || bottomPeopleCount.height != 0) {
                bottomTitle3Margin.constant = 5
            }else{
                bottomTitle3Margin.constant = 0
            }
            self.layoutIfNeeded()
            bottomViewHeight.constant = scoreTitle.bottom
            //如果底部的view高度为0,bottomViewHeight就不应该加10
            if (bottomViewHeight.constant == 0) {
                bottomViewHeight.constant = 0
            }else{
                bottomViewHeight.constant += 10
            }
        }
    }
    
    func cellHeightWithModel(model:XCFKitchenItems) -> CGFloat {
        if (model.cellHeight == nil) {
            self.kitchenItemsModel = model
            self.layoutIfNeeded()
            model.cellHeight = cellMarginView.bottom
            return model.cellHeight!
        }else{
            return (model.cellHeight)!
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
