//
//  AuthenticationViewModel.swift
//  PostBank
//
//  Created by стасик on 13.07.24.
//

import Foundation

class AuthenticationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var errorMessage: String?
    @Published var isAuthenticated = false
    
    // Переменные для сброса пароля
    @Published var resetCode = "111111"           // Код, отправленный на email
    @Published var inputCode = ""           // Код, введённый пользователем
    @Published var isCodeValid = false      // Флаг для проверки кода
    @Published var isPasswordResetSuccessful = false // Флаг успешного сброса пароля

    // Функция для отправки кода на почту
    func passwordRetrieval() {
        resetCode = "111111"  // Заглушка для кода
        print("Код сброса отправлен на email.")
    }
    
    // Проверка введённого кода
    func verifyResetCode(inputCode: String) -> Bool {
        if inputCode == resetCode {
            isCodeValid = true
            return true
        } else {
            errorMessage = "Неверный код, попробуйте ещё раз."
            return false
        }
    }
    
    // Сброс пароля
    func resetPassword() {
        guard password == confirmPassword else {
            errorMessage = "Пароли не совпадают."
            return
        }
        isPasswordResetSuccessful = true
        print("Пароль успешно сброшен.")
    }
    
    // Логин
    func login() {
        // Логика для входа (пример проверки логина и пароля)
        if email == "test@example.com" && password == "password123" {
            isAuthenticated = true
            errorMessage = nil
            print("Успешный вход в систему.")
        } else {
            isAuthenticated = false
            errorMessage = "Неверный email или пароль."
        }
    }
    
    // Регистрация
    func registration() {
        // Проверка совпадения пароля и его подтверждения
        guard password == confirmPassword else {
            errorMessage = "Пароли не совпадают."
            return
        }
        
        // Проверка формата email
        if isValidEmail(email) {
            // Допустим, регистрация успешна
            isAuthenticated = true
            errorMessage = nil
            print("Регистрация прошла успешно.")
        } else {
            errorMessage = "Пожалуйста, введите корректный email."
        }
    }
    
    // Валидация email
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
}
