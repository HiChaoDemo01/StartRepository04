//
//  SQSSpeciaTagAction.m
//
//  Created by Mac  on 16/7/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SQSSpeciaTagAction.h"


NSString *const kSQSSpeciaTagActionId = @"id";
NSString *const kSQSSpeciaTagActionActionType = @"actionType";
NSString *const kSQSSpeciaTagActionType = @"type";
NSString *const kSQSSpeciaTagActionTag = @"tag";


@interface SQSSpeciaTagAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SQSSpeciaTagAction

@synthesize tagActionIdentifier = _tagActionIdentifier;
@synthesize actionType = _actionType;
@synthesize type = _type;
@synthesize tag = _tag;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.tagActionIdentifier = [self objectOrNilForKey:kSQSSpeciaTagActionId fromDictionary:dict];
            self.actionType = [self objectOrNilForKey:kSQSSpeciaTagActionActionType fromDictionary:dict];
            self.type = [self objectOrNilForKey:kSQSSpeciaTagActionType fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kSQSSpeciaTagActionTag fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tagActionIdentifier forKey:kSQSSpeciaTagActionId];
    [mutableDict setValue:self.actionType forKey:kSQSSpeciaTagActionActionType];
    [mutableDict setValue:self.type forKey:kSQSSpeciaTagActionType];
    [mutableDict setValue:self.tag forKey:kSQSSpeciaTagActionTag];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.tagActionIdentifier = [aDecoder decodeObjectForKey:kSQSSpeciaTagActionId];
    self.actionType = [aDecoder decodeObjectForKey:kSQSSpeciaTagActionActionType];
    self.type = [aDecoder decodeObjectForKey:kSQSSpeciaTagActionType];
    self.tag = [aDecoder decodeObjectForKey:kSQSSpeciaTagActionTag];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tagActionIdentifier forKey:kSQSSpeciaTagActionId];
    [aCoder encodeObject:_actionType forKey:kSQSSpeciaTagActionActionType];
    [aCoder encodeObject:_type forKey:kSQSSpeciaTagActionType];
    [aCoder encodeObject:_tag forKey:kSQSSpeciaTagActionTag];
}

- (id)copyWithZone:(NSZone *)zone
{
    SQSSpeciaTagAction *copy = [[SQSSpeciaTagAction alloc] init];
    
    if (copy) {

        copy.tagActionIdentifier = [self.tagActionIdentifier copyWithZone:zone];
        copy.actionType = [self.actionType copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.tag = [self.tag copyWithZone:zone];
    }
    
    return copy;
}


@end
