<?php
    namespace Libra\Classes;

    use Libra\Classes\App;
    use Mailgun\Mailgun;

    class Mailer extends App
    {
        public function mail($email = [], $attachment = [])
        {
            $mgClient = new Mailgun('2f0735689f7eb0ccaf92c82a4c1486dd-6140bac2-cb8711e2');
            $domain = "https://api.mailgun.net/v3/sandboxe30efbf133c845b396ba8808f7029377.mailgun.org";

            $result = $mgClient->sendMessage($domain, [
                    'from'    => $email['from'],
                    'to'      => $email['to'],
                    'cc'      => $email['cc'],
                    'bcc'     => $email['bcc'],
                    'subject' => $email['subject'],
                    'text'    => $email['text'],
                    'html'    => $email['body']
            ],[
                'attachment' => $attachment
            ]);

        }
        

        public function send($data)
        {
            return $this->mail($data['email'], $data['attachment']);
        }
    }
    