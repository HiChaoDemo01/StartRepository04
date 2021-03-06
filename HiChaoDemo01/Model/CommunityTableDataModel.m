//
//  CommunityTableDataModel.m
//  HiChaoDemo01
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 surker. All rights reserved.
//

#import "CommunityTableDataModel.h"


@implementation CommunityTableDataModel
-(instancetype)initWithNSDictionary:(NSDictionary *)dic
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dic];
        
    }
    return self;
}
+(instancetype)CreateCommunityTableDataModel:(NSDictionary *)dic
{
    return [[self alloc]initWithNSDictionary:dic];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{}
-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"user"]) {
        self.avatarModel=[CommunityHeadPicModel createCommunityHeadPicModelWithDic:value];
    }
    else if ([key isEqualToString:@"tags"]) {
        self.tags=[NSMutableArray new];
        for (int i=0; i<[(NSArray*)value count]; i++) {            
            [self.tags addObject:[CommunityTagsModel createCommunityTagsModelWithDic:value[i]]];
        }
    }
    else if([key isEqualToString:@"users"])
    {
        self.users=[NSMutableArray new];
        for (int i=0; i<[(NSArray *)value count]; i++) {
            [self.users addObject:[CommunitySupportUsersModel createCommunitySupportUsersModel:value[i]]];
        }
    }
    else if ([key isEqualToString:@"comments"])
    {
        self.comments=[NSMutableArray new];
        for (int i=0; i<[(NSArray *)value count]; i++) {
            [self.comments addObject:[CommunityCommentsModel createCommunityCommentsModelWith:value[i]]];
        }
    }
    else if ([key isEqualToString:@"shareAction"])
    {
        self.shareModel=[CommunityShareModel createCommunityShareModelWith:value[@"share"]];
    }
    else if ([key isEqualToString:@"focus_users"])
    {
        self.focus_users=[NSMutableArray new];
        for (int i=0; i<[(NSArray *)value count]; i++) {
            NSDictionary *tempDic=value[i];
            [self.focus_users addObject:[StarModel createStarDesriptionModel:tempDic]];
        
        
        }
        NSLog(@"self.focus_users--count:%ld",self.focus_users.count);
    }
      else
    {
        [super setValue:value forKey:key];
    }
}

@end
