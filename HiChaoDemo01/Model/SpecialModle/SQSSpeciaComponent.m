//
//  SQSSpeciaComponent.m
//
//  Created by Mac  on 16/7/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SQSSpeciaComponent.h"
#import "SQSSpeciaTagAction.h"
#import "SQSSpeciaAction.h"


NSString *const kSQSSpeciaComponentId = @"id";
NSString *const kSQSSpeciaComponentCategory = @"category";
NSString *const kSQSSpeciaComponentDescription = @"description";
NSString *const kSQSSpeciaComponentTopPicUrl = @"topPicUrl";
NSString *const kSQSSpeciaComponentPicUrl = @"picUrl";
NSString *const kSQSSpeciaComponentTagAction = @"tagAction";
NSString *const kSQSSpeciaComponentWeekDay = @"weekDay";
NSString *const kSQSSpeciaComponentDay = @"day";
NSString *const kSQSSpeciaComponentCollectionType = @"collectionType";
NSString *const kSQSSpeciaComponentComponentType = @"componentType";
NSString *const kSQSSpeciaComponentTitle = @"title";
NSString *const kSQSSpeciaComponentAction = @"action";
NSString *const kSQSSpeciaComponentUnixtime = @"unixtime";
NSString *const kSQSSpeciaComponentType = @"type";
NSString *const kSQSSpeciaComponentYear = @"year";
NSString *const kSQSSpeciaComponentCollectionCount = @"collectionCount";
NSString *const kSQSSpeciaComponentMonth = @"month";
NSString *const kSQSSpeciaComponentCommentCount = @"commentCount";
NSString *const kSQSSpeciaComponentV = @"v";


@interface SQSSpeciaComponent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SQSSpeciaComponent

@synthesize componentIdentifier = _componentIdentifier;
@synthesize category = _category;
@synthesize componentDescription = _componentDescription;
@synthesize topPicUrl = _topPicUrl;
@synthesize picUrl = _picUrl;
@synthesize tagAction = _tagAction;
@synthesize weekDay = _weekDay;
@synthesize day = _day;
@synthesize collectionType = _collectionType;
@synthesize componentType = _componentType;
@synthesize title = _title;
@synthesize action = _action;
@synthesize unixtime = _unixtime;
@synthesize type = _type;
@synthesize year = _year;
@synthesize collectionCount = _collectionCount;
@synthesize month = _month;
@synthesize commentCount = _commentCount;
@synthesize v = _v;


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
            self.componentIdentifier = [self objectOrNilForKey:kSQSSpeciaComponentId fromDictionary:dict];
            self.category = [self objectOrNilForKey:kSQSSpeciaComponentCategory fromDictionary:dict];
            self.componentDescription = [self objectOrNilForKey:kSQSSpeciaComponentDescription fromDictionary:dict];
            self.topPicUrl = [self objectOrNilForKey:kSQSSpeciaComponentTopPicUrl fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kSQSSpeciaComponentPicUrl fromDictionary:dict];
            self.tagAction = [SQSSpeciaTagAction modelObjectWithDictionary:[dict objectForKey:kSQSSpeciaComponentTagAction]];
            self.weekDay = [self objectOrNilForKey:kSQSSpeciaComponentWeekDay fromDictionary:dict];
            self.day = [self objectOrNilForKey:kSQSSpeciaComponentDay fromDictionary:dict];
            self.collectionType = [self objectOrNilForKey:kSQSSpeciaComponentCollectionType fromDictionary:dict];
            self.componentType = [self objectOrNilForKey:kSQSSpeciaComponentComponentType fromDictionary:dict];
            self.title = [self objectOrNilForKey:kSQSSpeciaComponentTitle fromDictionary:dict];
            self.action = [SQSSpeciaAction modelObjectWithDictionary:[dict objectForKey:kSQSSpeciaComponentAction]];
            self.unixtime = [self objectOrNilForKey:kSQSSpeciaComponentUnixtime fromDictionary:dict];
            self.type = [self objectOrNilForKey:kSQSSpeciaComponentType fromDictionary:dict];
            self.year = [self objectOrNilForKey:kSQSSpeciaComponentYear fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kSQSSpeciaComponentCollectionCount fromDictionary:dict];
            self.month = [self objectOrNilForKey:kSQSSpeciaComponentMonth fromDictionary:dict];
            self.commentCount = [self objectOrNilForKey:kSQSSpeciaComponentCommentCount fromDictionary:dict];
            self.v = [self objectOrNilForKey:kSQSSpeciaComponentV fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.componentIdentifier forKey:kSQSSpeciaComponentId];
    [mutableDict setValue:self.category forKey:kSQSSpeciaComponentCategory];
    [mutableDict setValue:self.componentDescription forKey:kSQSSpeciaComponentDescription];
    [mutableDict setValue:self.topPicUrl forKey:kSQSSpeciaComponentTopPicUrl];
    [mutableDict setValue:self.picUrl forKey:kSQSSpeciaComponentPicUrl];
    [mutableDict setValue:[self.tagAction dictionaryRepresentation] forKey:kSQSSpeciaComponentTagAction];
    [mutableDict setValue:self.weekDay forKey:kSQSSpeciaComponentWeekDay];
    [mutableDict setValue:self.day forKey:kSQSSpeciaComponentDay];
    [mutableDict setValue:self.collectionType forKey:kSQSSpeciaComponentCollectionType];
    [mutableDict setValue:self.componentType forKey:kSQSSpeciaComponentComponentType];
    [mutableDict setValue:self.title forKey:kSQSSpeciaComponentTitle];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kSQSSpeciaComponentAction];
    [mutableDict setValue:self.unixtime forKey:kSQSSpeciaComponentUnixtime];
    [mutableDict setValue:self.type forKey:kSQSSpeciaComponentType];
    [mutableDict setValue:self.year forKey:kSQSSpeciaComponentYear];
    [mutableDict setValue:self.collectionCount forKey:kSQSSpeciaComponentCollectionCount];
    [mutableDict setValue:self.month forKey:kSQSSpeciaComponentMonth];
    [mutableDict setValue:self.commentCount forKey:kSQSSpeciaComponentCommentCount];
    [mutableDict setValue:self.v forKey:kSQSSpeciaComponentV];

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

    self.componentIdentifier = [aDecoder decodeObjectForKey:kSQSSpeciaComponentId];
    self.category = [aDecoder decodeObjectForKey:kSQSSpeciaComponentCategory];
    self.componentDescription = [aDecoder decodeObjectForKey:kSQSSpeciaComponentDescription];
    self.topPicUrl = [aDecoder decodeObjectForKey:kSQSSpeciaComponentTopPicUrl];
    self.picUrl = [aDecoder decodeObjectForKey:kSQSSpeciaComponentPicUrl];
    self.tagAction = [aDecoder decodeObjectForKey:kSQSSpeciaComponentTagAction];
    self.weekDay = [aDecoder decodeObjectForKey:kSQSSpeciaComponentWeekDay];
    self.day = [aDecoder decodeObjectForKey:kSQSSpeciaComponentDay];
    self.collectionType = [aDecoder decodeObjectForKey:kSQSSpeciaComponentCollectionType];
    self.componentType = [aDecoder decodeObjectForKey:kSQSSpeciaComponentComponentType];
    self.title = [aDecoder decodeObjectForKey:kSQSSpeciaComponentTitle];
    self.action = [aDecoder decodeObjectForKey:kSQSSpeciaComponentAction];
    self.unixtime = [aDecoder decodeObjectForKey:kSQSSpeciaComponentUnixtime];
    self.type = [aDecoder decodeObjectForKey:kSQSSpeciaComponentType];
    self.year = [aDecoder decodeObjectForKey:kSQSSpeciaComponentYear];
    self.collectionCount = [aDecoder decodeObjectForKey:kSQSSpeciaComponentCollectionCount];
    self.month = [aDecoder decodeObjectForKey:kSQSSpeciaComponentMonth];
    self.commentCount = [aDecoder decodeObjectForKey:kSQSSpeciaComponentCommentCount];
    self.v = [aDecoder decodeObjectForKey:kSQSSpeciaComponentV];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_componentIdentifier forKey:kSQSSpeciaComponentId];
    [aCoder encodeObject:_category forKey:kSQSSpeciaComponentCategory];
    [aCoder encodeObject:_componentDescription forKey:kSQSSpeciaComponentDescription];
    [aCoder encodeObject:_topPicUrl forKey:kSQSSpeciaComponentTopPicUrl];
    [aCoder encodeObject:_picUrl forKey:kSQSSpeciaComponentPicUrl];
    [aCoder encodeObject:_tagAction forKey:kSQSSpeciaComponentTagAction];
    [aCoder encodeObject:_weekDay forKey:kSQSSpeciaComponentWeekDay];
    [aCoder encodeObject:_day forKey:kSQSSpeciaComponentDay];
    [aCoder encodeObject:_collectionType forKey:kSQSSpeciaComponentCollectionType];
    [aCoder encodeObject:_componentType forKey:kSQSSpeciaComponentComponentType];
    [aCoder encodeObject:_title forKey:kSQSSpeciaComponentTitle];
    [aCoder encodeObject:_action forKey:kSQSSpeciaComponentAction];
    [aCoder encodeObject:_unixtime forKey:kSQSSpeciaComponentUnixtime];
    [aCoder encodeObject:_type forKey:kSQSSpeciaComponentType];
    [aCoder encodeObject:_year forKey:kSQSSpeciaComponentYear];
    [aCoder encodeObject:_collectionCount forKey:kSQSSpeciaComponentCollectionCount];
    [aCoder encodeObject:_month forKey:kSQSSpeciaComponentMonth];
    [aCoder encodeObject:_commentCount forKey:kSQSSpeciaComponentCommentCount];
    [aCoder encodeObject:_v forKey:kSQSSpeciaComponentV];
}

- (id)copyWithZone:(NSZone *)zone
{
    SQSSpeciaComponent *copy = [[SQSSpeciaComponent alloc] init];
    
    if (copy) {

        copy.componentIdentifier = [self.componentIdentifier copyWithZone:zone];
        copy.category = [self.category copyWithZone:zone];
        copy.componentDescription = [self.componentDescription copyWithZone:zone];
        copy.topPicUrl = [self.topPicUrl copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.tagAction = [self.tagAction copyWithZone:zone];
        copy.weekDay = [self.weekDay copyWithZone:zone];
        copy.day = [self.day copyWithZone:zone];
        copy.collectionType = [self.collectionType copyWithZone:zone];
        copy.componentType = [self.componentType copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.action = [self.action copyWithZone:zone];
        copy.unixtime = [self.unixtime copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.year = [self.year copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.month = [self.month copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
        copy.v = [self.v copyWithZone:zone];
    }
    
    return copy;
}


@end
