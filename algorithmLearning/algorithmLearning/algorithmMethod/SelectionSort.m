//
//  SelectionSort.m
//  algorithmLearning
//
//  Created by peng8744 on 2017/10/25.
//  Copyright © 2017年 peng8744. All rights reserved.
//

#import "SelectionSort.h"

@implementation SelectionSort
+ (NSMutableArray *)selectionSortArray:(NSMutableArray *)array {
    for (int i = 0; i < array.count; i++) {
        int minIndex = i;
        for (int j = i + 1; j < array.count; j++) {
            if (array[j] < array[minIndex]) {
                minIndex = j;
            }
        }
        [array exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
    }
    return array;
}
@end
