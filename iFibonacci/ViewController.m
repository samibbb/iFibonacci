//
//  ViewController.m
//  iFibonacci
//
//  Created by Sami B on 2014-11-18.
//  Copyright (c) 2014 Sami B. All rights reserved.
//

#import "ViewController.h"

static NSString *const FibonacciCellIdentifier = @"FibonacciCellIdentifier";

@implementation ViewController
{
    NSMutableArray *fibCache;
}

- (NSNumber *)fibonacci:(NSUInteger)index {
    for (NSUInteger i = fibCache.count - 1; i < index; i++)
        [fibCache addObject:@(((NSNumber *)fibCache[i - 1]).unsignedIntegerValue + ((NSNumber *)fibCache[i]).unsignedIntegerValue)];
    
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
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FibonacciCellIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self fibonacci:indexPath.row]];
    return cell;
}

@end