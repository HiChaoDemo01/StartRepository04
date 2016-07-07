//
//  SQSCustomTableViewCell.h
//  HiChaoDemo01
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 surker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SQSCustomTableViewCell : UITableViewCell
@property (nonatomic,strong)SQSSpeciaComponent *specialModle;


- (void)solveReuseCell;
@end
