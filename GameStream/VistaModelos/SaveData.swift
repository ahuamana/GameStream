//
//  SaveData.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 14/01/24.
//

import Foundation


class SaveData {
    
    var correo:String = ""
    var contrasena:String = ""
    var nombre:String = ""
    
    
    func guardarDatos(correo:String, contrasena:String, nombre:String) -> Bool {
        UserDefaults.standard.set([correo,contrasena, nombre],  forKey: "datosUsuario")
        
        return true
    }
    
    func recuperarDatos() -> [String] {
        let datosUsuario: [String] = UserDefaults.standard.stringArray(forKey: "datosUsuario")!
        
        return datosUsuario
    }
    
    func validar(correo:String, contrasena:String) -> Bool {
        var correoGuardado = ""
        var contrasenaGuardada = ""
        
        if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![0]
            contrasenaGuardada = UserDefaults.standard.stringArray(forKey: "datosUsuario")![1]
            if(correo == correoGuardado && contrasena == contrasenaGuardada) {
                return true
            }else {
                return false
            }
        }else {
            print("No hay datos guardados")
            return false
        }
    }
}
