//
//  QuickSort.m
//  algorithmLearning
//
//  Created by peng8744 on 2017/11/29.
//  Copyright © 2017年 peng8744. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort

+ (void)quickSort:(NSMutableArray *)array {
    [self quickSort:array left:0 right:array.count - 1];
}

+ (void)quickSort2:(NSMutableArray *)array {
    [self quickSort2:array left:0 right:array.count - 1];
}

+ (void)quickSort3:(NSMutableArray *)array {
    [self quickSort3:array left:0 right:array.count - 1];
}

+ (void)quickSort:(NSMutableArray *)array left:(NSInteger)l right:(NSInteger)r {
    if (l >= r) {
        return;
    }
    NSInteger p = [self partition:array left:l right:r];
    [self quickSort:array left:l right:p - 1 ];
    [self quickSort:array left:p + 1 right:r];
}

+ (void)quickSort2:(NSMutableArray *)array left:(NSInteger)l right:(NSInteger)r {
    if (l >= r) {
        return;
    }
    NSInteger p = [self partition2:array left:l right:r];
    [self quickSort2:array left:l right:p - 1 ];
    [self quickSort2:array left:p + 1 right:r];
}

+ (void)quickSort3:(NSMutableArray *)array left:(NSInteger)l right:(NSInteger)r {
    if (l >= r) {
        return;
    }
    //arr[l+1...lt] < standar
    //arr[lt+1...i-1] = standar
    //arr[gt...r] > standar
    NSInteger randomIndex = arc4random() % (r - l + 1) + l;
    [array exchangeObjectAtIndex:randomIndex withObjectAtIndex:l];
    id standar = array[l];
    NSInteger lt = l;
    NSInteger gt = r + 1;
    NSInteger i = l + 1;
    while (i < gt) {
        if (array[i] < standar) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:lt + 1];
            lt ++;
            i ++;
        }else if (array[i] > standar) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:gt - 1];
            gt --;
        }else {
            i ++;
        }
    }
    [array exchangeObjectAtIndex:l withObjectAtIndex:lt];
    [self quickSort3:array left:l right:lt - 1];
    [self quickSort3:array left:gt right:r];
    
}

+ (NSInteger)partition:(NSMutableArray *)array left:(NSInteger)l right:(NSInteger)r {
    NSInteger randomIndex = arc4random() % (r - l  + 1) + l;
    [array exchangeObjectAtIndex:l withObjectAtIndex:randomIndex];
    id v = array[l];
    NSInteger k = l;
    for (NSInteger i = l + 1; i <= r; i++) {
        if (array[i] < v) {
            [array exchangeObjectAtIndex:k+1 withObjectAtIndex:i];
            k += 1;
        }
    }
    [array exchangeObjectAtIndex:l withObjectAtIndex:k];
    return k;
}

+ (NSInteger)partition2:(NSMutableArray *)array left:(NSInteger)l right:(NSInteger)r {
    NSInteger randomIndex = arc4random() % (r - l + 1) + l;
    [array exchangeObjectAtIndex:randomIndex withObjectAtIndex:l];
    id standar = array[l];
    //arr[l+1...i) < standar
    //arr(j...r] > standar
    NSInteger i = l + 1;
    NSInteger j = r;
    while (true) {
        while (i <= r && array[i] < standar) {
            i ++;
        }
        while (j >= l+1 && array[j] > standar) {
            j --;
        }
        if (i > j) {
            break;
        }
        [array exchangeObjectAtIndex:i withObjectAtIndex:j];
        i ++;
        j --;
    }
    [array exchangeObjectAtIndex:l withObjectAtIndex:j];
    return j;
}

@end
