//
//  ApolloExtension.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/3/30.
//

import Foundation
import Apollo

extension ResultMap {
    func toInputAddress(address: InputAddress) -> InputAddress {
        var newAddress = address
        for key in address.graphQLMap.keys {
            let value = self[key]
            if value != nil {
                newAddress.graphQLMap.updateValue(value, forKey: key)
            }
        }
        return newAddress
    }
    func toInputBranch(branch: InputBranch) -> InputBranch {
        var newBranch = branch
        for key in branch.graphQLMap.keys {
            let value = self[key]
            if value != nil {
                newBranch.graphQLMap.updateValue(value, forKey: key)
            }
        }
        return newBranch
    }
    
    func toAddressDqCmd(cmd: AddressDqCmd) -> AddressDqCmd {
        var newCmd = cmd
        for key in cmd.graphQLMap.keys {
            let value = self[key]
            if value != nil {
                newCmd.graphQLMap.updateValue(value, forKey: key)
            } else {
                newCmd.graphQLMap.removeValue(forKey: key)
            }
        }
        return newCmd
    }
}
