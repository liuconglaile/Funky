//
//  NSArraySubclass.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 22..
//
//

#import <Foundation/Foundation.h>
#import "LTCollectionCounterpartProtocol.h"

@interface LTNSArraySubclass : NSArray <LTCollectionCounterpart>

- (NSArray*)NSArray;

@end