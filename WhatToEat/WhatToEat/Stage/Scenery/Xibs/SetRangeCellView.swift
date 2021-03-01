//
//  SetRangeCellView.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/24.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class SetRangeCellView: XibView {

    private enum TextFieldTag: Int {
        case StartField, EndField
    }
    @IBOutlet var inputTextFields: [UITextField]!
    
    lazy var superTableViewCell = UITableViewCell()
    private var editingtextField: UITextField?
    private var startDate: Date = Date()
    private var endDate: Date = Date()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        initSetRangeCellView()
    }
    
    private func initSetRangeCellView() {
        for textField in inputTextFields {
            textField.delegate = self
            textField.inputView = createDateInputView()
            textField.inputAccessoryView = createInputAccessoryView()
        }
    }

    func createDateInputView() -> UIView {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePicker.date = Date()
        datePicker.datePickerMode = .time
        datePicker.minuteInterval = 30
        datePicker.addTarget(self, action: #selector(pickerValueChangedAction), for: .valueChanged)
        return datePicker
    }
    func createInputAccessoryView() -> UIView {
        // Create a toolbar and assign it to inputAccessoryView
        let screenWidth = UIScreen.main.bounds.width
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(barCancelButtonClickAction))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: #selector(barDoneButtonClickAction))
//        toolBar.setItems([cancel, flexible, barButton], animated: false)
        toolBar.setItems([flexible, barButton], animated: false)
        return toolBar
    }
    
    // MARK: - UI Actions
    @objc private func barCancelButtonClickAction(sender: UIBarButtonItem) {
        editingtextField?.resignFirstResponder()
    }
    @objc private func barDoneButtonClickAction(sender: UIBarButtonItem) {
        editingtextField?.resignFirstResponder()
    }
    @objc private func pickerValueChangedAction(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        editingtextField?.text = formatter.string(
            from: sender.date)
        let fieldTag = TextFieldTag(rawValue: editingtextField?.tag ?? 0)
        if fieldTag == TextFieldTag.StartField {
            startDate = sender.date
        } else {
            endDate = sender.date
        }
        appStore.dispatch(RangeDatePickerSelectedAction(rangeView: self, startDate: startDate, endDate: endDate))
    }
    
}
extension SetRangeCellView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        editingtextField = textField
    }
}

