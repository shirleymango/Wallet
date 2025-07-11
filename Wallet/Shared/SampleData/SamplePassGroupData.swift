//
//  SamplePassGroupData.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/11/25.
//
import Foundation

struct SamplePassGroupData {
    static let passGroup1: PassGroup = PassGroup(groupName: "CapitalOne", passList: [
        Pass(background: "CapitalOne1"),
        Pass(background: "CapitalOne2")
    ])
    static let passGroup2: PassGroup = PassGroup(groupName: "Luma", passList: [Pass(background: "Luma")])
    static let passGroup3: PassGroup = PassGroup(groupName: "Eventbrite", passList: [
        Pass(background: "Eventbrite1"),
        Pass(background: "Eventbrite2"),
        Pass(background: "Eventbrite3"),
        Pass(background: "Eventbrite4")
    ])
    static let passGroup4: PassGroup = PassGroup(groupName: "Acadia", passList: [Pass(background: "Acadia")])
    static let passGroup5: PassGroup = PassGroup(groupName: "Coach", passList: [Pass(background: "Coach")])
    static let passGroups: [PassGroup] = [passGroup1, passGroup2, passGroup3, passGroup4, passGroup5]
}
