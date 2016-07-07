//
//  SQSSpeciaSpecial.m
//
//  Created by Mac  on 16/7/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SQSSpeciaSpecial.h"
#import "SQSSpeciaData.h"


NSString *const kSQSSpeciaSpecialMessage = @"message";
NSString *const kSQSSpeciaSpecialData = @"data";


@interface SQSSpeciaSpecial ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SQSSpeciaSpecial

@synthesize message = _message;
@synthesize data = _data;


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
            self.message = [self objectOrNilForKey:kSQSSpeciaSpecialMessage fromDictionary:dict];
            self.data = [SQSSpeciaData modelObjectWithDictionary:[dict objectForKey:kSQSSpeciaSpecialData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kSQSSpeciaSpecialMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kSQSSpeciaSpecialData];

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

    self.message = [aDecoder decodeObjectForKey:kSQSSpeciaSpecialMessage];
    self.data = [aDecoder decodeObjectForKey:kSQSSpeciaSpecialData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kSQSSpeciaSpecialMessage];
    [aCoder encodeObject:_data forKey:kSQSSpeciaSpecialData];
}

- (id)copyWithZone:(NSZone *)zone
{
    SQSSpeciaSpecial *copy = [[SQSSpeciaSpecial alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
