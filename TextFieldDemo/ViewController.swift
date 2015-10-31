//
//  ViewController.swift
//  TextFieldDemo
//
//  Created by Boyko Andrey on 10/31/15.
//  Copyright © 2015 LOL. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        if (string.characters.count==0){
            return true
        }
        
        //Получаем текущий текст textField'a
        let text = ((textField.text ?? "") as NSString)
        //Получаем текст textField'a после редактирования
        let newText = text.stringByReplacingCharactersInRange(range, withString: string).stringByAppendingString("_")
        //В textField есть неприятное поведение, когда он при печати резервирует один символ и проскролировает
        //вперед при подходе к границе. Хотя текст и так бы поместился. Если Вам не нужно такое поведение
        //То замените строчку выше этой
        //let newText = text.stringByReplacingCharactersInRange(range, withString: string)
        
        //Получаем размеры текста
        let width = newText.sizeWithAttributes(textField.defaultTextAttributes).width
        //Получаем размеры области ввода
        let widthOfEditingRect = textField.editingRectForBounds(textField.bounds).width
        
        //Разрешаем ввод только если текст не больше области ввода
        return (width  <= widthOfEditingRect);
    }
}

