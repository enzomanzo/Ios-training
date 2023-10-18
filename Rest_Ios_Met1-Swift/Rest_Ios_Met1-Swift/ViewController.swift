//
//  ViewController.swift
//  Rest_Ios_Met1-Swift
//
//  Created by Enzo Manzo Carelli on 11/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var minhaImagem: UIImageView!
    
    var session: URLSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func exibir(_ sender: Any) {
        //cria uma configuracao de sessao default
        let config = URLSessionConfiguration.default
        //cria uma sessao com a configuracao default
        session = URLSession(configuration: config)
        //acesso a API
        let url = URL(string: "https://xkcd.com/info.0.json")
        
        let task = session?.dataTask(with: url!, completionHandler: {data, response, error in
            //açao que serao efetuadas quando a execucao do task se completa
            //let texto = NSString(data:data!, encoding: String.Encoding.utf8.rawValue)
            //print(texto!)
            if let texto = self.retornarTitulo(data: data!){
                DispatchQueue.main.sync {
                    self.titulo.text = texto
                }
            }
            if let appImageUrl = self.retornarImagemPQ(data: data!){
                DispatchQueue.main.sync {
                    self.carregarImagemURL(imagemURL: appImageUrl)
                }
            }
        })
        //disparo da execucao do task
        task?.resume()
    }
    
    func retornarTitulo(data:Data)->String?{
        var resposta:String?=nil
        do{
            //a linha abaixo faz a leitura dos valores, NSJSONSerialization faz o parser do Json
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            //cria e popula uma string a partir da chave neste exemplo "titulo"
            
            if let retorno = json["title"] as? String{
                resposta = retorno
            }
        }catch let error as NSError{
            resposta = "Falha ao carregar \(error.localizedDescription)"
        }
        return resposta
    }
    
    func retornarImagemPQ(data:Data)->String?{
        var resposta:String?=nil
        do{
            //a linha abaixo faz a leitura dos valores, NSJSONSerialization faz o parser do json
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            if let urlString = json["img"] as? String {
                resposta = urlString
            }
        }catch let error as NSError{
            resposta = "Falha ao carregar \(error.localizedDescription)"
        }
        return resposta
    }
    
    func carregarImagemURL(imagemURL:String){
        //cria uma constante para receber a String com a url da imagem, e transforma-la em URL
        let myUrl = URL(string: imagemURL)
        //cria uma constante para receber uma request da URL
        let url = URLRequest(url: myUrl!)
        //cria uma task do tipo download
        let session = URLSession.shared
        let task = session.dataTask(with: url) {data, response, error in
            //se resposta = not null recebe o binario da imagem
            if let imagemData = data{
                //transforma o binario em UIImage e atualiza a tela na thread principal
                DispatchQueue.main.sync {
                    self.minhaImagem.image = UIImage(data: imagemData)
                }
            }
        }
        //disparo da execucao da task
        task.resume()
    }
    
    
}

