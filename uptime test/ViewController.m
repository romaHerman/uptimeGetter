//
//  ViewController.m
//  uptime test
//
//  Created by Herman Roman on 11/18/15.
//  Copyright © 2015 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *uptimeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [NSTimer scheduledTimerWithTimeInterval:0.3
                                     target:self
                                   selector:@selector(showUptime)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)showUptime {
    self.uptimeLabel.text = [self getUptime];
    [self.uptimeLabel setPreferredMaxLayoutWidth:self.view.frame.size.width];
}

- (NSString *)getUptime {
    NSTimeInterval uptime = [NSProcessInfo processInfo].systemUptime;
    //NSLog(@"UPTIME = %f",uptime);
    
    NSString *uptimeString = [NSString stringWithFormat:@"Uptime is \n %0.4f hour(s) \n\n\n\n Raw uptime is %f",uptime/3600.0, uptime];
    
    return uptimeString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
