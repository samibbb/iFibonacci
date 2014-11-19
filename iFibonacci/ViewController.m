//
//  ViewController.m
//  iFibonacci
//
//  Created by Sami B on 2014-11-18.
//  Copyright (c) 2014 Sami B. All rights reserved.
//

#import "ViewController.h"

static NSUInteger maxFibonnacciIndexForLongLong = 94; // Fibonacci values after this index exceed ULONG_LONG_MAX, sum yields invalid values
static NSString *const FibonacciCellIdentifier = @"FibonacciCellIdentifier";

@implementation ViewController {
    NSMutableArray *fibCache;
}

- (NSNumber *)fibonacci:(NSUInteger)index {
    
    for (NSUInteger i = fibCache.count - 1; i < index; i++){
        NSNumber * valueAtThisIndex = @(((NSNumber *)fibCache[i - 1]).unsignedLongLongValue + ((NSNumber *)fibCache[i]).unsignedLongLongValue);
        
        // How the max index was found...
        if (valueAtThisIndex.unsignedLongLongValue < [fibCache[index-1] unsignedLongLongValue]){
            NSLog(@"max index: %d", index);
            break;
        }
        [fibCache addObject:valueAtThisIndex];
    }
    
    return fibCache[index];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    fibCache = @[@(0), @(1)].mutableCopy;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:FibonacciCellIdentifier];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Anything past exceeds the limit of LONG_LONG_MAX
    return maxFibonnacciIndexForLongLong;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FibonacciCellIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"%llu", [[self fibonacci:indexPath.row] unsignedLongLongValue]];
    return cell;
    
}

@end
