//
//  IndexHeap.m
//  algorithmLearning
//
//  Created by peng8744 on 2017/12/1.
//  Copyright © 2017年 peng8744. All rights reserved.
//

#import "IndexMaxHeap.h"

@interface IndexMaxHeap()
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSMutableArray *indexs;
@property (nonatomic, strong) NSMutableArray *reverse;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger capacity;
@end

@implementation IndexMaxHeap

- (instancetype)initWithCapacity:(NSInteger)capacity {
    if (self = [super init]) {
        self.data = [NSMutableArray arrayWithCapacity:capacity + 1];
        self.data[0] = @(0);
        self.indexs = [NSMutableArray arrayWithCapacity:capacity + 1];
        self.indexs[0] = @(0);
        self.reverse = [NSMutableArray arrayWithCapacity:capacity + 1];
        for (NSInteger i = 0; i <= capacity; i++) {
            _reverse[i] = @(0);
        }
        self.count = 0;
        self.capacity = capacity;
    }
    return self;
}

- (NSInteger)size {
    return self.count;
}

- (BOOL)isEmpty {
    return self.count == 0;
}

- (void)insertWithIndex:(NSInteger)i Item:(id)item {
    assert(_count + 1 <= _capacity);
    assert(i+1>=1 && i+1 <= _capacity);
    i+=1;
    self.data[i] = item;
    self.indexs[_count+1] = @(i);
    self.reverse[i] = @(_count + 1);
    self.count ++;
    [self shiftUpWithCount:_count];
}

- (id)extractMax {
    assert(_count > 0);
    id ret = _data[[_indexs[1] integerValue] ];
    
    [_indexs exchangeObjectAtIndex:1 withObjectAtIndex:_count];
    _reverse[[_indexs[1] integerValue]] = @(1);
    _reverse[[_indexs[_count] integerValue]] = @(0);
    _count--;
    [self shiftDownWithCount:1];
    
    return ret;
}

- (NSInteger)extractMaxIndex {
    assert(_count > 0);
    NSInteger ret = [_indexs[1] integerValue] - 1;
    
    [_indexs exchangeObjectAtIndex:1 withObjectAtIndex:_count];
    _reverse[[_indexs[1] integerValue]] = @(1);
    _reverse[[_indexs[_count] integerValue]] = @(0);
    _count--;
    [self shiftDownWithCount:1];
    
    return ret;
}

- (id)getItemWithIndex:(NSInteger)i {
    assert([self contain:i]);
    return _data[i+1];
}

- (void)changeWithIndex:(NSInteger)i newItem:(id)newItem {
    
    assert([self contain:i]);
    i+=1;
    _data[i] = newItem;
    NSInteger index = [_reverse[i] integerValue];
    [self shiftUpWithCount:index];
    [self shiftDownWithCount:index];
}

#pragma mark - private methods
- (void)shiftUpWithCount:(NSInteger)k {
    while (k > 1 && _data[[_indexs[k/2] integerValue]] < _data[[_indexs[k] integerValue]]) {
        [_indexs exchangeObjectAtIndex:k/2 withObjectAtIndex:k];
        _reverse[[_indexs[k/2] integerValue]] = @(k/2);
        _reverse[[_indexs[k] integerValue]] = @(k);
        k /= 2;
    }
}

- (void)shiftDownWithCount:(NSInteger)k {
    
    while (2*k <= _count) {
        NSInteger j = 2*k;
        if (j + 1 <= _count && _data[[_indexs[j+1] integerValue]] > _data[[_indexs[j] integerValue]]) {
            j+=1;
        }
        if (_data[[_indexs[k] integerValue]] >= _data[[_indexs[j] integerValue]]) {
            break;
        }
        [_indexs exchangeObjectAtIndex:k withObjectAtIndex:j];
        _reverse[[_indexs[k] integerValue]] = @(k);
        _reverse[[_indexs[j] integerValue]] = @(j);
        k = j;
    }
}

- (BOOL)contain:(NSInteger)i {
    assert(i + 1 >= 1 && i + 1 <= _capacity);
    return [_reverse[i + 1] integerValue] != 0;
}
@end
