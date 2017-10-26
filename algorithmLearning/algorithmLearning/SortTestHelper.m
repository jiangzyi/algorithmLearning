//
//  SortTestHelper.m
//  algorithmLearning
//
//  Created by peng8744 on 2017/10/26.
//  Copyright © 2017年 peng8744. All rights reserved.
//

#import "SortTestHelper.h"

@implementation SortTestHelper

+ (NSMutableArray *)generateRandomArrayWithN:(NSInteger)n rangeL:(NSInteger)rangeL rangeR:(NSInteger)rangeR {
    assert(rangeL <= rangeR);
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:n];
    for (NSInteger i = 0; i < n; i++) {
        mutableArray[i] = @(arc4random() % (rangeR - rangeL + 1) + rangeL);
    }
    return mutableArray;
}

+ (void)printArray:(NSMutableArray *)array {
    for (NSInteger i = 0; i < array.count; i++) {
        NSLog(@"%@ ",array[i]);
    }
}

+ (BOOL)isSorted:(NSMutableArray *)array {
    for (NSInteger i = 0; i < array.count - 1; i++)
        if (array[i] > array[i + 1])
            return false;
    return true;
}

+ (void)testSort:(NSString *)sortName sortMethod:(void (^)(NSMutableArray *))sortMethod array:(NSMutableArray *)array {
    NSTimeInterval start = [[NSDate date] timeIntervalSince1970];
    sortMethod(array);
    NSTimeInterval end = [[NSDate date] timeIntervalSince1970];
    assert([SortTestHelper isSorted:array]);
    NSLog(@"%@: %fs", sortName, (end - start));
}

@end
