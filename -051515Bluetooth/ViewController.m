//
//  ViewController.m
//  -051515Bluetooth
//
//  Created by Xiaonan Wang on 5/15/15.
//  Copyright (c) 2015 Xiaonan Wang. All rights reserved.
//

#import "ViewController.h"
#define kServiceUUID @"6BC6543C-2398-4E4A-AF28-E4E0BF58D6BC"
#define kCharacteristicUUID @"9D69C18C-186C-45EA-A7DA-6ED7500E9C97"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.central = [[CBCentralManager alloc] initWithDelegate:self queue:nil options:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma marks - communicate with Bluetooth device
//discover bluetooth device
-(void)discoverDevices{
    //discover any peripheral devices that are advertising bu calling:
    //nil for first parameter returns all discovered peripherals. In real app, specify an array of CBUUID object.
    NSLog(@"scanning...");
    [self.central scanForPeripheralsWithServices:nil options:nil];
    
}

#pragma marks - delegate

-(void)centralManagerDidUpdateState:(CBCentralManager *)central{
    switch (central.state) {
        case CBCentralManagerStatePoweredOn:
            // Scans for any peripheral
            [self.central scanForPeripheralsWithServices:@[ [CBUUID UUIDWithString:kServiceUUID] ] options:@{CBCentralManagerScanOptionAllowDuplicatesKey : @YES }];
            break;
        default:
            NSLog(@"Central Manager did change state");
            break;
    }
}

-(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI{
    NSLog(@"Discovered %@", peripheral.name);
    [self.central stopScan];
}


@end
