-- USUARIOS
insert into usuario(nick,telefono) values('Pepe','11111111');
insert into usuario(nick,telefono) values('María','22222222');
insert into usuario(nick,telefono) values('Juan','33333333');
insert into usuario(nick,telefono) values('Susana','44444444');

-- CONTACTOS DE MARIA
insert into contactos(usuario,contacto) values('22222222','11111111');

-- CONTACTOS DE PEPE
insert into contactos(usuario,contacto) values('11111111','22222222');
insert into contactos(usuario,contacto) values('11111111','33333333');
insert into contactos(usuario,contacto) values('11111111','44444444');

-- CONTACTOS DE JUAN
insert into contactos(usuario,contacto) values('33333333','11111111');
insert into contactos(usuario,contacto) values('33333333','44444444');

--- CONTACTOS DE SUSANA
insert into contactos(usuario,contacto) values('44444444','33333333');

--- MENSAJES DIRECTOS
insert into mensajedirecto(
    idmensajedirecto,
    texto           ,
    remitente       ,
    destinatario    ,
    entregado       ,
    leido)
values(
        1,
        'Vamos a hacer un grupo de ASIR',
        11111111,
        22222222,
        'si',
        'si'
);

FALTAN MENSAJES

-- GRUPO
insert into grupo(idgrupo,usuario,nombregrupo) values (
       2, '33333333', 'Viaje a la nieve'
);
insert into formapartede(usuario,idgrupo) values ('11111111',2);
insert into formapartede(usuario,idgrupo) values ('44444444',2);

FALTAN GRUPOS

-- MENSAJES DE GRUPOS
insert into mensajegrupo(
    idmensajegrupo,
    texto         ,
    idgrupo       , 
    remitente)
values(
        3,
        'El sábado no puedo',
        2,
        '33333333'
);

insert into confirmaciones(entregado,leido,idmensajegrupo,usuario) values
('si','si',3,'11111111');
insert into confirmaciones(entregado,leido,idmensajegrupo,usuario) values
('no','no',3,'44444444');








-- VISTAS
create view V_CONTACTOS(nombreusuario, nombrecontacto) as
select u.nick, c.nick
from contactos, usuario u, usuario c
where
contactos.usuario = u.telefono and
contactos.contacto = c.telefono;


create view V_MENSAJESRECIBIDOSPOR_DIRECTO(nombredestinatario,nombreemisor, textomensaje,entregado,leido) as
select d.nick, e.nick, m.texto, m.entregado, m.leido
from usuario d, usuario e, mensajedirecto m
where
  m.remitente = e.telefono and
  m.destinatario = d.telefono;

create view V_MENSAJESRECIBIDOSPOR_GRUPO(nombredestinatario,nombreemisor, textomensaje,entregado,leido) as
select d.nick, e.nick, m.texto, m.entregado, m.leido
from usuario d, usuario e, mensajegrupo m, confirmaciones c
where
  m.remitente = e.telefono and
  c.usuario = d.telefono and
  c.idmensajegrupo = m.idmensajegrupo;

create view V_MENSAJESRECIBIDOSPOR(nombredestinatario,nombreemisor, textomensaje,entregado,leido) as
select * from V_MENSAJESRECIBIDOSPOR_GRUPO
union
select * from V_MENSAJESRECIBIDOSPOR_DIRECTO;


create view V_MENSAJESPORGRUPO_RECIBIDO(idmensaje,
 cuantosrecibido) as
select idmensajegrupo, count(*)
from mensajegrupo m, confirmaciones c
where
  c.idmensajegrupo = m.idmensajegrupo and
  c.recibido = "si";

create view V_MENSAJESPORGRUPO_LEIDO(idmensaje,
 cuantosleido) as
select idmensajegrupo, count(*)
from mensajegrupo m, confirmaciones c
where
  c.idmensajegrupo = m.idmensajegrupo and
  c.leido = "si";


create view V_MENSAJESPORGRUPO(nombrechat,nombreemisor,textomensaje,
 cuantosrecibido, cuantosleido) as
select g.nombregrupo, e.nick, m.texto, r.cuantosrecibido, l.cuantosleido
from grupo g, mensajegrupo m, usuario e, V_MENSAJESPORGRUPO_LEIDO l, V_MENSAJESPORGRUPO_RECIBIDO r
where
  m.idgrupo = g.idgrupo and
  l.idmensajegrupo = m.idmensajegrupo and
  r.idmensajegrupo = m.idmensajegrupo and  
  m.usuario = e.telefono;

  

create view V_GRUPOSDECHAT(nombrechat,integrantes) as
select g.nombregrupo, count(*)
from grupo g, formapartede f
where
  g.idgrupo = f.idgrupo
group by
  g.nombregrupo;






