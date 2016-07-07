//
//  StarModel.h
//  HiChaoDemo01
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 surker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StarModel : NSObject
@property(copy,nonatomic)NSString *focusCount,*starDescription,*title,*picUrl;

-(instancetype)initWithNSDictionary:(NSDictionary *)dic;
+(instancetype)createStarDesriptionModel:(NSDictionary *)dic;
@end
