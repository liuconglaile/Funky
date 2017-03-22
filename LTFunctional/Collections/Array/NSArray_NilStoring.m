//
//  NSArray_NilStoring.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "NSArray_NilStoring.h"

#pragma mark - NSArray Subclasses

@implementation NSArray_NilStoring

- (NSArray *)arrayByAddingObject:(id)anObject
{
    return [super arrayByAddingObject:anObject ?: [NSNull null]];
}

- (NSArray *)arrayByAddingObjectsFromArray:(NSArray *)otherArray
{
    if (otherArray == nil)
        return self;
    else
        return [super arrayByAddingObjectsFromArray:otherArray];
}

- (id)objectAtIndex:(NSUInteger)index
{
    id object = [super objectAtIndex:index];
    if ([object isEqual:[NSNull null]])
        return nil;
    else
        return object;
}

- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range
{
    return [super indexOfObject:anObject ?: [NSNull null] inRange:range];
}

- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject inRange:(NSRange)range
{
    return [super indexOfObjectIdenticalTo:anObject ?: [NSNull null] inRange:range];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [NSArray_NilStoring class];
}

+ (Class)classForMutableCounterPart
{
    return [NSMutableArray_NilStoring class];
}

@end

@implementation NSMutableArray_NilStoring

- (NSArray *)arrayByAddingObject:(id)anObject
{
    return [super arrayByAddingObject:anObject ?: [NSNull null]];
}

- (NSArray *)arrayByAddingObjectsFromArray:(NSArray *)otherArray
{
    if (otherArray == nil)
        return self;
    else
        return [super arrayByAddingObjectsFromArray:otherArray];
}

- (id)objectAtIndex:(NSUInteger)index
{
    id object = [super objectAtIndex:index];
    if ([object isEqual:[NSNull null]])
        return nil;
    else
        return object;
}

- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range
{
    return [super indexOfObject:anObject ?: [NSNull null] inRange:range];
}

- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject inRange:(NSRange)range
{
    return [super indexOfObjectIdenticalTo:anObject ?: [NSNull null] inRange:range];
}

- (id)mutableCopy
{
    return [NSMutableArray_NilStoring arrayWithArray:self];
}

#pragma mark - 

- (void)addObject:(id)anObject
{
    return [super addObject:anObject ?: [NSNull null]];
}

- (void)addObjectsFromArray:(NSArray *)otherArray
{
    if (otherArray != nil)
        [super addObjectsFromArray:otherArray];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
    [super insertObject:anObject ?: [NSNull null] atIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    [super replaceObjectAtIndex:index withObject:anObject ?: [NSNull null]];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [NSArray_NilStoring class];
}

+ (Class)classForMutableCounterPart
{
    return [NSMutableArray_NilStoring class];
}

@end

#pragma mark - NSArray Categories

@implementation NSArray (NilStoring)

- (NSArray_NilStoring *)nilStoring
{
    return [NSArray_NilStoring arrayWithArray:self];
}

@end

@implementation NSMutableArray (NilStoring)

- (NSMutableArray_NilStoring *)nilStoring
{
    return [NSMutableArray_NilStoring arrayWithArray:self];
}

@end
