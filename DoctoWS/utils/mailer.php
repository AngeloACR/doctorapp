<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//namespace Utility;

/**
 * Description of mailer
 *
 * @author Carmen Tacuri
 */
class mailer
{
    private $sendTo;
    private $sendFrom;
    private $subject;
    private $message;
    private $headers;
    private $error = [];
    private $lastError;

    public function __construct()
    {
        /*$mail = new PHPMailer();
        $mail->isSMTP();                                      
        $mail->Host = SMTPServer;                      
        $mail->SMTPAuth = SMTPAuth;                               // Activamos la autenticacion
        $mail->Username = SMTPUsername;       // Correo SMTP 
        $mail->Password = SMPTPassword;                // Contraseña SMTP
        //$mail->SMTPSecure = SMTPSecure;                            // Activamos la encriptacion ssl
        $mail->Port = SMTPPort;                                    // Seleccionamos el puerto del SMTP
        $mail->From = SMTPFrom;
        $mail->FromName = SMTPFromName;                       
        $mail->isHTML(SMTPisHTML); 
        $mail->CharSet = SMTPCharSet;*/
    }
    
    /*public function __construct($sendTo, $sendFrom = null, $subject, $message)
    {
        $this->sendTo = $sendTo;
        $this->sendFrom = ($sendFrom) ? $sendFrom : 'webmaster@shelter.pet';
        $this->subject = $subject;
        $this->message = $message;
        //$this->headers = $this->setHeader();
    }

    public function setTo($email, $name) {
        return $this->sendTo = $email;
    }*/
    
    public function setTo($email, $name=""){
        if(filter_var($email, FILTER_VALIDATE_EMAIL)) $this->sendTo = $email;
        else $this->lastError = "Invalid to email: {$email}.";
    }
    

    public function getTo() {
        return $this->sendTo;
    }

    public function setFrom($email, $name)  {
        return $this->sendFrom = $email;
    }

    public function setSubject($subject) {
        return $this->subject = $subject;
    }

    public function getSubject() {
        return $this->subject;
    }

    public function setMessage($message) {
        $this->message = $message;
        //@TODO:string repace, etc

        return $this;
    }

    public function getMessage() {
        return $this->message;
    }

    /*public function setHeader($header, $email, $name = null) {
        $address = $this->formatHeader((string) $email, (string) $name);
        $this->headers[] = sprintf('%s: %s', (string) $header, $address);
        return $this;
    }*/

    public function setHeader() {
        $headers = 'From: '.$this->getFrom() . "\r\n" .
            'Reply-To: '.$this->getFrom() . "\r\n" .
            'X-Mailer: PHP/' . phpversion();

        $this->headers = $headers;
        return $this;
    }

    public function getFrom() {
        return $this->sendFrom;
    }

    public function send() {
        $to = $this->sendTo;
        $from = $this->sendFrom;
        $subject = $this->subject;
        $message = $this->message;
        //$headers = $this->headers;
        $headers = 'From: '.$this->getFrom() . "\r\n" .
            'Reply-To: '.$this->getFrom() . "\r\n" .
            'X-Mailer: PHP/' . phpversion();
        
        //Para formato HTML
        $headers .= 'MIME-Version: 1.0'."\r\n".
            'Content-type: text/html; charset=iso-8859-1';

        return mail($to, $subject, $message, $headers);
    }
    
       
    
}
