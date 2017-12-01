//
//  MaxHeap.m
//  algorithmLearning
//
//  Created by peng8744 on 2017/11/30.
//  Copyright © 2017年 peng8744. All rights reserved.
//

#import "MaxHeap.h"

@interface MaxHeap()
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger capacity;
@end

@implementation MaxHeap

+ (void)heapSort1WithArray:(NSMutableArray *)array {
    NSInteger n = array.count;
    MaxHeap *maxheap = [[MaxHeap alloc] initWithCapacity:n];
    for (NSInteger i = 0; i < n; i ++) {
        [maxheap insertWithItem:array[i]];
    }
    for (NSInteger i = n-1; i>=0; i--) {
        array[i] = [maxheap extractMax];
    }
}

+ (void)heapSort2WithArray:(NSMutableArray *)array {
    NSInteger n = array.count;
    MaxHeap *maxheap = [[MaxHeap alloc] initWithArray:array];
    for (NSInteger i = n-1; i>=0; i--) {
        array[i] = [maxheap extractMax];
    }
}

+ (void)heapSort3WithArray:(NSMutableArray *)array {
    NSInteger n = array.count;
    for (NSInteger i = (n - 1) / 2; i >= 0; i --) {
        [self shiftDownWithArray:array count:n index:i];
    }
    
    for (NSInteger i = n-1; i>0; i--) {
        [array exchangeObjectAtIndex:0 withObjectAtIndex:i];
        [self shiftDownWithArray:array count:i index:0];
    }
}

+ (void)shiftDownWithArray:(NSMutableArray *)array count:(NSInteger)n index:(NSInteger)k {
    while (2 * k + 1 < n) {
        NSInteger j = 2 * k + 1;
        if (j + 1 < n && array[j+1] > array[j]) {
            j+=1;
        }
        if (array[k] >= array[j]) {
            break;
        }
        [array exchangeObjectAtIndex:k withObjectAtIndex:j];
        k = j;
    }
}

- (instancetype)initWithCapacity:(NSInteger)capacity {
    if (self = [super init]) {
        self.data = [NSMutableArray arrayWithCapacity:capacity + 1];
        self.data[0] = @(0);
        self.count = 0;
        self.capacity = capacity;
    }
    return self;
}

- (instancetype)initWithArray:(NSMutableArray *)array {
    if (self = [super init]) {
        NSInteger n = array.count;
        self.data = [NSMutableArray arrayWithCapacity:n+1];
        self.data[0] = @(0);
        self.capacity = n;
        for (NSInteger i = 0; i < n; i ++) {
            _data[i+1] = array[i];
        }
        self.count = n;
        for (NSInteger i = _count / 2; i>=1; i--) {
            [self shiftDownWithCount:i];
        }
        
    }
    return self;
}

- (NSInteger)size {
    return self.count;
}

- (BOOL)isEmpty {
    return self.count == 0;
}

- (void)insertWithItem:(id)item {
    assert(_count + 1 <= _capacity);
    self.data[self.count + 1] = item;
    self.count ++;
    [self shiftUpWithCount:_count];
}

- (id)extractMax {
    assert(_count > 0);
    id ret = _data[1];
    
    [_data exchangeObjectAtIndex:1 withObjectAtIndex:_count];
    _count--;
    [self shiftDownWithCount:1];
    
    return ret;
}

#pragma mark - private methods
- (void)shiftUpWithCount:(NSInteger)k {
    while (k > 1 && _data[k/2] < _data[k]) {
        [_data exchangeObjectAtIndex:k/2 withObjectAtIndex:k];
        k /= 2;
    }
}

- (void)shiftDownWithCount:(NSInteger)k {
    
    while (2*k <= _count) {
        NSInteger j = 2*k;
        if (j + 1 <= _count && _data[j+1] > _data[j]) {
            j+=1;
        }
        if (_data[k] >= _data[j]) {
            break;
        }
        [_data exchangeObjectAtIndex:k withObjectAtIndex:j];
        k = j;
    }
    
    
}
@end
