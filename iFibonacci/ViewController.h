//
//  ViewController.h
//  iFibonacci
//
//  Created by Sami B on 2014-11-18.
//  Copyright (c) 2014 Sami B. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

