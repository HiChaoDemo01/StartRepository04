//
//  SQSSpeciaItems.h
//
//  Created by Mac  on 16/7/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SQSSpeciaComponent;

@interface SQSSpeciaItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) SQSSpeciaComponent *component;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
