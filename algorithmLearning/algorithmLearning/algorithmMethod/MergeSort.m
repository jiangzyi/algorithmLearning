//
//  MergeSort.m
//  algorithmLearning
//
//  Created by peng8744 on 2017/10/30.
//  Copyright © 2017年 peng8744. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort

+ (void)MergeSortArray:(NSMutableArray *)array {
    [MergeSort basicMergeSortArray:array l:0 r:array.count-1];
}

+ (void)merge:(NSMutableArray *)array l:(NSInteger)l mid:(NSInteger)mid r:(NSInteger)r {
    NSMutableArray *aux = [NSMutableArray arrayWithCapacity:(r-l+1)];
    for (NSInteger i = l; i <= r ; i++) {
        aux[i-l] = array[i];
    }
    //初始化，i指向左半部分的起始索引位置l；j指向右半部分起始索引位置mid+1
    NSInteger i = l, j = mid + 1;
    
    for (NSInteger k = l; k <= r; k++) {
        if (i > mid) { //如果左半部分已经全部处理完毕
            array[k] = aux[j-l];
            j++;
        }else if (j > r) {
            array[k] = aux[i-l];
            i++;
        }else if (aux[i-l] > aux[j-l]) {
            array[k] = aux[j-l];
            j++;
        }else {
            array[k] = aux[i-l];
            i++;
        }
    }
}

+ (void)basicMergeSortArray:(NSMutableArray *)array l:(NSInteger)l r:(NSInteger)r{
    if (l >= r) {
        return;
    }
    
    NSInteger mid = (l + r) / 2;
    
    [MergeSort basicMergeSortArray:array l:l r:mid];
    [MergeSort basicMergeSortArray:array l:mid+1 r:r];
    [MergeSort merge:array l:l mid:mid r:r];
    
}

+ (void)MergeSortArrayBU:(NSMutableArray *)array {
    //遍历进行merge的个数
    for (NSInteger sz = 1; sz < array.count; sz += sz) {
        for (NSInteger i = 0; i < array.count - sz; i += sz + sz) {
            //            // 对 arr[i...i+sz-1] 和 arr[i+sz...i+2*sz-1] 进行归并
            //            __merge(arr, i, i+sz-1, min(i+sz+sz-1,n-1) );
            [self merge:array l:i mid:i + sz - 1 r:MIN(i + sz + sz - 1, array.count - 1)];
        }
    }
}

@end
