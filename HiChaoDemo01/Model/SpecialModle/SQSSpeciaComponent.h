//
//  SQSSpeciaComponent.h
//
//  Created by Mac  on 16/7/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SQSSpeciaTagAction, SQSSpeciaAction;

@interface SQSSpeciaComponent : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *componentIdentifier;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *componentDescription;
@property (nonatomic, strong) NSString *topPicUrl;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) SQSSpeciaTagAction *tagAction;
@property (nonatomic, strong) NSString *weekDay;
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *collectionType;
@property (nonatomic, strong) NSString *componentType;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) SQSSpeciaAction *action;
@property (nonatomic, strong) NSString *unixtime;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *collectionCount;
@property (nonatomic, strong) NSString *month;
@property (nonatomic, strong) NSString *commentCount;
@property (nonatomic, strong) NSString *v;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
