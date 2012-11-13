//
//  ViewController.m
//  CustomViewDemo
//
//  Created by DOUGLAS STARNES on 8/27/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "ViewController.h"
#import "CirclesViewController.h"
#import "RectanglesViewController.h"
#import "LinesViewController.h"

@interface ViewController ()
{
    NSArray *demos;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    demos = @[ @"Circles", @"Rectangles", @"Lines" ];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [demos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.textLabel.text = [demos objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectedCellTitle = [demos objectAtIndex:indexPath.row];
    if (selectedCellTitle == @"Circles") {
        CirclesViewController *circlesViewController = [[CirclesViewController alloc] init];
        [self.navigationController pushViewController:circlesViewController animated:YES];
    } else if (selectedCellTitle == @"Rectangles") {
        RectanglesViewController *rectanglesViewController = [[RectanglesViewController alloc] init];
        [self.navigationController pushViewController:rectanglesViewController animated:YES];
    } else {
        LinesViewController *linesViewController = [[LinesViewController alloc] init];
        [self.navigationController pushViewController:linesViewController animated:YES];
    }
}

@end
