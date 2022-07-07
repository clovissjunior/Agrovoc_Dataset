unit Agrovoc;

interface

uses
  SysUtils, Classes, Dialogs;

implementation

procedure ProcedimentoRDF_SQL;
var Saida,Entrada:textfile;
    linha,valor_tag:string;
    texto:widestring;
    inicio,fim,x,tt:integer;
    valores:array[1..40] of string;
begin
 assignfile(Entrada,'agrovoc_termos.xml');
 assignfile(Saida,'DatasetAgro.txt');
 reset(Entrada);
 tt:=0;
 rewrite(Saida);
 while not eof(Entrada) do
 begin
   readln(Entrada,linha);
     if (copy(linha,1,5)='<rdf:') then
     begin
       tt:=tt+1; texto:='';
       Label1.caption:=inttostr(tt);
        for x:=1 to 40 do
         valores[x]:='';
         writeln(Saida,'INSERT INTO agrovoc_terms (id,arabic,catalan,  czech ,  danish,  german,  english  ,  spanish  ,');
         writeln(Saida,'estonian ,  persian  ,  finnish  ,  french,  hindi ,  hungarian,  indonesian,  italian  ,  japanese ,');
         writeln(Saida,'georgian ,  korean,  latin ,  laotian  ,  malay ,  burmese  ,  norwegianbokmal,  dutch ,');
         writeln(Saida,'norwegiannynorsk,  polish,  portuguese,  romanian ,  russian  ,  slovak,  slovenian,  serbian  ,');
         writeln(Saida,'swedish  ,  swahili  ,  telugu,  thai,  turkish  ,  ukrainian,  vietnamese,  chinese) values ('+inttostr(tt)+',');
     end
     else
       if (copy(linha,1,6)='</rdf:') then
       begin
         for x:=1 to 40 do
         if x<>40 then
           texto:=texto+QuotedStr(valores[x])+','
         else texto:=texto+QuotedStr(valores[x])+');';
         writeln(Saida,texto);  
       end
       else
       begin
        inicio:=pos('">',linha); 
		fim:=pos('</skos:',linha);
        valor_tag:=copy(linha,i+2,(fim-i)-2);
        if (copy(linha,28,2)='ar') then valores[1]:=valor_tag;
        if (copy(linha,28,2)='ca') then valores[2]:=valor_tag;
        if (copy(linha,28,2)='cs') then valores[3]:=valor_tag;
        if (copy(linha,28,2)='da') then valores[4]:=valor_tag;
        if (copy(linha,28,2)='de') then valores[5]:=valor_tag;
        if (copy(linha,28,2)='en') then valores[6]:=valor_tag;
        if (copy(linha,28,2)='es') then valores[7]:=valor_tag;
        if (copy(linha,28,2)='et') then valores[8]:=valor_tag;
        if (copy(linha,28,2)='fa') then valores[9]:=valor_tag;
        if (copy(linha,28,2)='fi') then valores[10]:=valor_tag;
        if (copy(linha,28,2)='fr') then valores[11]:=valor_tag;
        if (copy(linha,28,2)='hi') then valores[12]:=valor_tag;
        if (copy(linha,28,2)='hu') then valores[13]:=valor_tag;
        if (copy(linha,28,2)='id') then valores[14]:=valor_tag;
        if (copy(linha,28,2)='it') then valores[15]:=valor_tag;
        if (copy(linha,28,2)='ja') then valores[16]:=valor_tag;
        if (copy(linha,28,2)='ka') then valores[17]:=valor_tag;
        if (copy(linha,28,2)='ko') then valores[18]:=valor_tag;
        if (copy(linha,28,2)='la') then valores[19]:=valor_tag;
        if (copy(linha,28,2)='lo') then valores[20]:=valor_tag;
        if (copy(linha,28,2)='ms') then valores[21]:=valor_tag;
        if (copy(linha,28,2)='my') then valores[22]:=valor_tag;
        if (copy(linha,28,2)='nb') then valores[23]:=valor_tag;
        if (copy(linha,28,2)='nl') then valores[24]:=valor_tag;
        if (copy(linha,28,2)='nn') then valores[25]:=valor_tag;
        if (copy(linha,28,2)='pl') then valores[26]:=valor_tag;
        if (copy(linha,28,2)='pt') then valores[27]:=valor_tag;
        if (copy(linha,28,2)='ro') then valores[28]:=valor_tag;
        if (copy(linha,28,2)='ru') then valores[29]:=valor_tag;
        if (copy(linha,28,2)='sk') then valores[30]:=valor_tag;
        if (copy(linha,28,2)='sl') then valores[31]:=valor_tag;
        if (copy(linha,28,2)='sr') then valores[32]:=valor_tag;
        if (copy(linha,28,2)='sv') then valores[33]:=valor_tag;
        if (copy(linha,28,2)='sw') then valores[34]:=valor_tag;
        if (copy(linha,28,2)='te') then valores[35]:=valor_tag;
        if (copy(linha,28,2)='th') then valores[36]:=valor_tag;
        if (copy(linha,28,2)='tr') then valores[37]:=valor_tag;
        if (copy(linha,28,2)='uk') then valores[38]:=valor_tag;
        if (copy(linha,28,2)='vi') then valores[39]:=valor_tag;
        if (copy(linha,28,2)='zh') then valores[40]:=valor_tag;
      end;
 end;
 closefile(Entrada);
 closefile(Saida);
 end;

end.
