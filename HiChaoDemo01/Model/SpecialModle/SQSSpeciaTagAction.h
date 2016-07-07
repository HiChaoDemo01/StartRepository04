//
//  SQSSpeciaTagAction.h
//
//  Created by Mac  on 16/7/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SQSSpeciaTagAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *tagActionIdentifier;
@property (nonatomic, strong) NSString *actionType;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *tag;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
