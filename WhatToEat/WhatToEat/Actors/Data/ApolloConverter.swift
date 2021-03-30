//
//  ApolloConverter.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/3/30.
//

import Foundation
import Flynn
import Apollo

class ApolloConverter: Actor {
    private func _beUpdateInputAddress(
        sender: Actor,address:InputAddress,
        resultMap: ResultMap,
        complete:@escaping (InputAddress) -> Void) {
        let newAddress = resultMap.toInputAddress(address: address)
        sender.unsafeSend {
            complete(newAddress)
        }
    }
    private func _beUpdateInputBranch(
        sender: Actor,branch:InputBranch,
        resultMap: ResultMap,
        complete:@escaping (InputBranch) -> Void) {
        let newBranch = resultMap.toInputBranch(branch: branch)
        sender.unsafeSend {
            complete(newBranch)
        }
    }
}

// MARK: - Autogenerated by FlynnLint
// Contents of file after this marker will be overwritten as needed

extension ApolloConverter {

    @discardableResult
    public func beUpdateInputAddress(sender: Actor, address: InputAddress, resultMap: ResultMap, complete: @escaping (InputAddress) -> Void) -> Self {
        unsafeSend { self._beUpdateInputAddress(sender: sender, address: address, resultMap: resultMap, complete: complete) }
        return self
    }
    @discardableResult
    public func beUpdateInputBranch(sender: Actor, branch: InputBranch, resultMap: ResultMap, complete: @escaping (InputBranch) -> Void) -> Self {
        unsafeSend { self._beUpdateInputBranch(sender: sender, branch: branch, resultMap: resultMap, complete: complete) }
        return self
    }

}