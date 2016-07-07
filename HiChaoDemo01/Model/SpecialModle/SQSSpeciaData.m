//
//  SQSSpeciaData.m
//
//  Created by Mac  on 16/7/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SQSSpeciaData.h"
#import "SQSSpeciaItems.h"


NSString *const kSQSSpeciaDataItems = @"items";
NSString *const kSQSSpeciaDataFlag = @"flag";
NSString *const kSQSSpeciaDataAppApi = @"appApi";


@interface SQSSpeciaData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SQSSpeciaData

@synthesize items = _items;
@synthesize flag = _flag;
@synthesize appApi = _appApi;


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
    NSObject *receivedSQSSpeciaItems = [dict objectForKey:kSQSSpeciaDataItems];
    NSMutableArray *parsedSQSSpeciaItems = [NSMutableArray array];
    if ([receivedSQSSpeciaItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSQSSpeciaItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSQSSpeciaItems addObject:[SQSSpeciaItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSQSSpeciaItems isKindOfClass:[NSDictionary class]]) {
       [parsedSQSSpeciaItems addObject:[SQSSpeciaItems modelObjectWithDictionary:(NSDictionary *)receivedSQSSpeciaItems]];
    }

    self.items = [NSArray arrayWithArray:parsedSQSSpeciaItems];
            self.flag = [self objectOrNilForKey:kSQSSpeciaDataFlag fromDictionary:dict];
            self.appApi = [self objectOrNilForKey:kSQSSpeciaDataAppApi fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kSQSSpeciaDataItems];
    [mutableDict setValue:self.flag forKey:kSQSSpeciaDataFlag];
    [mutableDict setValue:self.appApi forKey:kSQSSpeciaDataAppApi];

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

    self.items = [aDecoder decodeObjectForKey:kSQSSpeciaDataItems];
    self.flag = [aDecoder decodeObjectForKey:kSQSSpeciaDataFlag];
    self.appApi = [aDecoder decodeObjectForKey:kSQSSpeciaDataAppApi];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_items forKey:kSQSSpeciaDataItems];
    [aCoder encodeObject:_flag forKey:kSQSSpeciaDataFlag];
    [aCoder encodeObject:_appApi forKey:kSQSSpeciaDataAppApi];
}

- (id)copyWithZone:(NSZone *)zone
{
    SQSSpeciaData *copy = [[SQSSpeciaData alloc] init];
    
    if (copy) {

        copy.items = [self.items copyWithZone:zone];
        copy.flag = [self.flag copyWithZone:zone];
        copy.appApi = [self.appApi copyWithZone:zone];
    }
    
    return copy;
}


@end
