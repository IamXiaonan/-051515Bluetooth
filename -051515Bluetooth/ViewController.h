//
//  ViewController.h
//  -051515Bluetooth
//
//  Created by Xiaonan Wang on 5/15/15.
//  Copyright (c) 2015 Xiaonan Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController : UIViewController <CBCentralManagerDelegate, CBPeripheralDelegate>

@property (nonatomic, strong) CBCentralManager *central;
@property (nonatomic, strong) NSMutableData *data;
@property (nonatomic, strong) CBPeripheral *peripheral;

@end

