//
//  FunkyNSMutableSetSubclass.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import <Foundation/Foundation.h>
#import "FunkyCollectionCounterpartProtocol.h"

@interface FunkyNSMutableSetSubclass : NSMutableSet <FunkyCollectionCounterpart>

- (NSMutableSet*)NSMutableSet;

@end
