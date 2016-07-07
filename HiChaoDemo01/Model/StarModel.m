//
//  StarModel.m
//  HiChaoDemo01
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 surker. All rights reserved.
//

#import "StarModel.h"

@implementation StarModel
-(instancetype)initWithNSDictionary:(NSDictionary *)dic
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+(instancetype)createStarDesriptionModel:(NSDictionary *)dic
{
    return  [[self alloc]initWithNSDictionary:dic];
}
-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"description"]) {
        self.starDescription=value;
    }
    if ([key isEqualToString:@"component"]) {
        self.title=value[@"title"];
        self.picUrl=value[@"picUrl"];
    }
    else{
        [super setValue:value forKey:key];
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{}
@end
