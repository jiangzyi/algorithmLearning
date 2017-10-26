//
//  SelectionSort.m
//  algorithmLearning
//
//  Created by peng8744 on 2017/10/25.
//  Copyright © 2017年 peng8744. All rights reserved.
//

#import "BasicSort.h"

@implementation BasicSort
+ (void)selectionSortArray:(NSMutableArray *)array {
    for (NSInteger i = 0; i < array.count; i++) {
        NSInteger minIndex = i;
        for (NSInteger j = i + 1; j < array.count; j++) {
            if (array[j] < array[minIndex]) {
                minIndex = j;
            }
        }
        [array exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
    }
}

+ (void)insertionSortArray:(NSMutableArray *)array {
    for (NSInteger i = 1; i < array.count; i++) {
        
        //写法一
//        for (NSInteger j = i; j > 0; j--) {
//            if (array[j] < array[j-1]) {
//                [array exchangeObjectAtIndex:j withObjectAtIndex:j-1];
//            }else{
//                break;
//            }
//        }
        
        //写法二
//        for (NSInteger j = i; j > 0 && array[j-1]>array[j]; i--) {
//            [array exchangeObjectAtIndex:j-1 withObjectAtIndex:j];
//        }
        
        //写法三
        NSNumber *number = array[i];
        NSInteger j;
        for (j = i; j > 0 && array[j-1] > number; j--) {
            array[j] = array[j-1];
        }
        array[j] = number;
    }
}
@end
