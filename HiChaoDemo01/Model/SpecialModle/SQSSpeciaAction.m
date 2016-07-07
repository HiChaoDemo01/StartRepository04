//
//  SQSSpeciaAction.m
//
//  Created by Mac  on 16/7/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SQSSpeciaAction.h"


NSString *const kSQSSpeciaActionActionType = @"actionType";
NSString *const kSQSSpeciaActionId = @"id";
NSString *const kSQSSpeciaActionTitle = @"title";
NSString *const kSQSSpeciaActionV = @"v";
NSString *const kSQSSpeciaActionUnixtime = @"unixtime";
NSString *const kSQSSpeciaActionCollectionCount = @"collectionCount";
NSString *const kSQSSpeciaActionCommentCount = @"commentCount";


@interface SQSSpeciaAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SQSSpeciaAction

@synthesize actionType = _actionType;
@synthesize actionIdentifier = _actionIdentifier;
@synthesize title = _title;
@synthesize v = _v;
@synthesize unixtime = _unixtime;
@synthesize collectionCount = _collectionCount;
@synthesize commentCount = _commentCount;


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
            self.actionType = [self objectOrNilForKey:kSQSSpeciaActionActionType fromDictionary:dict];
            self.actionIdentifier = [self objectOrNilForKey:kSQSSpeciaActionId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kSQSSpeciaActionTitle fromDictionary:dict];
            self.v = [self objectOrNilForKey:kSQSSpeciaActionV fromDictionary:dict];
            self.unixtime = [self objectOrNilForKey:kSQSSpeciaActionUnixtime fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kSQSSpeciaActionCollectionCount fromDictionary:dict];
            self.commentCount = [self objectOrNilForKey:kSQSSpeciaActionCommentCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.actionType forKey:kSQSSpeciaActionActionType];
    [mutableDict setValue:self.actionIdentifier forKey:kSQSSpeciaActionId];
    [mutableDict setValue:self.title forKey:kSQSSpeciaActionTitle];
    [mutableDict setValue:self.v forKey:kSQSSpeciaActionV];
    [mutableDict setValue:self.unixtime forKey:kSQSSpeciaActionUnixtime];
    [mutableDict setValue:self.collectionCount forKey:kSQSSpeciaActionCollectionCount];
    [mutableDict setValue:self.commentCount forKey:kSQSSpeciaActionCommentCount];

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

    self.actionType = [aDecoder decodeObjectForKey:kSQSSpeciaActionActionType];
    self.actionIdentifier = [aDecoder decodeObjectForKey:kSQSSpeciaActionId];
    self.title = [aDecoder decodeObjectForKey:kSQSSpeciaActionTitle];
    self.v = [aDecoder decodeObjectForKey:kSQSSpeciaActionV];
    self.unixtime = [aDecoder decodeObjectForKey:kSQSSpeciaActionUnixtime];
    self.collectionCount = [aDecoder decodeObjectForKey:kSQSSpeciaActionCollectionCount];
    self.commentCount = [aDecoder decodeObjectForKey:kSQSSpeciaActionCommentCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_actionType forKey:kSQSSpeciaActionActionType];
    [aCoder encodeObject:_actionIdentifier forKey:kSQSSpeciaActionId];
    [aCoder encodeObject:_title forKey:kSQSSpeciaActionTitle];
    [aCoder encodeObject:_v forKey:kSQSSpeciaActionV];
    [aCoder encodeObject:_unixtime forKey:kSQSSpeciaActionUnixtime];
    [aCoder encodeObject:_collectionCount forKey:kSQSSpeciaActionCollectionCount];
    [aCoder encodeObject:_commentCount forKey:kSQSSpeciaActionCommentCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    SQSSpeciaAction *copy = [[SQSSpeciaAction alloc] init];
    
    if (copy) {

        copy.actionType = [self.actionType copyWithZone:zone];
        copy.actionIdentifier = [self.actionIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.v = [self.v copyWithZone:zone];
        copy.unixtime = [self.unixtime copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
    }
    
    return copy;
}


@end
