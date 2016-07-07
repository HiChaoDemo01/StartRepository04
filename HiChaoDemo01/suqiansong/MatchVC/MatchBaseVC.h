//
//  MatchBaseVC.h
//  HiChaoDemo01
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 surker. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef void(^matchBlock)(void);
typedef void(^specialBlock)(void);

@interface MatchBaseVC : UIViewController

- (void)matchCallBackBtnClick:(matchBlock)callBack;
- (void)specialCallBackBtnClick:(specialBlock)callBack;
@property (nonatomic,copy)matchBlock matchCallBack;
@property (nonatomic,copy)specialBlock specialCallBack;

@end
