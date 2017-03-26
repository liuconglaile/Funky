//
//  LTNilTolerantNSArray.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "LTNilTolerantNSArray.h"

#pragma mark - NSArray Subclasses

@implementation LTNilTolerantNSArray

- (NSArray *)arrayByAddingObject:(id)anObject
{
    if (anObject == nil)
        return self;
    else
        return [super arrayByAddingObject:anObject];
}

- (NSArray *)arrayByAddingObjectsFromArray:(NSArray *)otherArray
{
    if (otherArray == nil)
        return self;
    else
        return [super arrayByAddingObjectsFromArray:otherArray];
}

- (BOOL)containsObject:(id)anObject
{
    if (anObject == nil)
        return NO;
    else
        return [super containsObject:anObject];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [LTNilTolerantNSArray class];
}

+ (Class)classForMutableCounterPart
{
    return [NSMutableArray_NilTolerant class];
}

+ (Class)classToFlatten
{
    return [NSArray class];
}

@end

@implementation NSMutableArray_NilTolerant

- (NSArray *)arrayByAddingObject:(id)anObject
{
    if (anObject == nil)
        return self;
    else
        return [super arrayByAddingObject:anObject];
}

- (NSArray *)arrayByAddingObjectsFromArray:(NSArray *)otherArray
{
    if (otherArray == nil)
        return self;
    else
        return [super arrayByAddingObjectsFromArray:otherArray];
}

- (BOOL)containsObject:(id)anObject
{
    if (anObject == nil)
        return NO;
    else
        return [super containsObject:anObject];
}

- (id)mutableCopy
{
    return [NSMutableArray_NilTolerant arrayWithArray:self];
}

#pragma mark -

- (void)addObject:(id)anObject
{
    if (anObject != nil)
        [super addObject:anObject];
}

- (void)addObjectsFromArray:(NSArray *)otherArray
{
    if (otherArray != nil)
        [super addObjectsFromArray:otherArray];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject != nil)
        [super insertObject:anObject atIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (anObject != nil)
        [super replaceObjectAtIndex:index withObject:anObject];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [LTNilTolerantNSArray class];
}

+ (Class)classForMutableCounterPart
{
    return [NSMutableArray_NilTolerant class];
}

+ (Class)classToFlatten
{
    return [NSArray class];
}

@end

#pragma mark - NSArray Categories

@implementation NSArray (LTNilTolerant)

- (LTNilTolerantNSArray *)nilTolerant
{
    return [LTNilTolerantNSArray arrayWithArray:self];
}

@end

@implementation NSMutableArray (LTNilTolerant)

- (NSMutableArray_NilTolerant *)nilTolerant
{
    return [NSMutableArray_NilTolerant arrayWithArray:self];
}

@end