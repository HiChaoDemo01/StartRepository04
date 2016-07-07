//
//  QHJCusTableViewCell.h
//  HiChaoDemo01
//
//  Created by Mac on 16/7/5.
//  Copyright © 2016年 surker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommunityTableDataModel.h"
#import "CommunityTagsModel.h"
#import "CommunityHeadPicModel.h"
#import "CommunityCommentsModel.h"
@interface QHJCusTableViewCell : UITableViewCell
@property(strong,nonatomic)CommunityTableDataModel *model;
@property(assign,nonatomic)CGFloat rowHeight;
@property(assign,nonatomic)NSInteger whichClickBtn;
-(void)removeView;
@end
