CREATE TABLE public.Horario
(
    idHorario integer NOT NULL,
    tipoDia text NOT NULL,
    entrada text NOT NULL,
    salida text NOT NULL,
    CONSTRAINT id_Horario_ PRIMARY KEY (idHorario)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.Ubicacion
(
    idUbicacion integer NOT NULL,
    GPS text, 
    provincia text NOT NULL,
    canton text NOT NULL,
    distrito text NOT NULL,
    direccion text,
    CONSTRAINT id_Ubicacion PRIMARY KEY (idUbicacion)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.RedesSociales
(
    idRedesSociales integer NOT NULL,
    facebook text,
    twiter text,
    instagram text,
    pinterest text,
    CONSTRAINT id_redes_key PRIMARY KEY(idRedesSociales)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.Idioma
(
    idioma text NOT NULL,
    CONSTRAINT id_idioma_key PRIMARY KEY (idioma)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.Hotel
(
    idHotel integer NOT NULL,
    nombre text NOT NULL,
    telefono1 text NOT NULL,
    telefono2 text,
    sitio text NOT NULL,
    correo text NOT NULL,
    idHorario integer,
    idUbicacion integer,
    idRedesSociales integer,
    petFriendly BOOLEAN NOT NULL,
    ley7600 BOOLEAN NOT NULL,
    totalHabitaciones integer,
    CONSTRAINT unique_nombre UNIQUE (nombre),
    CONSTRAINT hotel_id PRIMARY KEY (idHotel),
    CONSTRAINT id_horario_hotel FOREIGN KEY (idHorario)
        REFERENCES public.Horario(idHorario) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT id_ubicacion FOREIGN KEY (idUbicacion)
        REFERENCES public.Ubicacion(idUbicacion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT id_redesSociales FOREIGN KEY (idRedesSociales)
        REFERENCES public.RedesSociales(idRedesSociales) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.Fotos
(
    idHotel integer NOT NULL,
    direccion text NOT NULL,
    CONSTRAINT id_Hotel_keyFotos PRIMARY KEY (idHotel),
    CONSTRAINT id_Hotel_referenceFotos FOREIGN KEY (idHotel)
        REFERENCES public.Hotel(idHotel) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.Videos
(
    idHotel integer NOT NULL,
    direccion text NOT NULL,
    CONSTRAINT id_Hotel_video_key PRIMARY KEY (idHotel),
    CONSTRAINT id_Hotel_video_reference FOREIGN KEY (idHotel)
        REFERENCES public.Hotel(idHotel) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.HotelPorIdioma
(
    idHotel integer NOT NULL,
    idioma text NOT NULL,
    CONSTRAINT id_HotelIdioma_key PRIMARY KEY (idHotel, idioma),
    CONSTRAINT id_HotelIdioma_reference FOREIGN KEY (idHotel)
        REFERENCES public.Hotel(idHotel) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT id_idioma_reference FOREIGN KEY (idioma)
        REFERENCES public.Idioma(idioma) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.Habitacion
(
    idHotel integer NOT NULL,
    categoria text NOT NULL,
    descripcion text NOT NULL,
    precio integer NOT NULL,
    CONSTRAINT id_Hotel_keyHabitacion PRIMARY KEY (idHotel),
    CONSTRAINT id_Hotel_referenceHabitacion FOREIGN KEY (idHotel)
        REFERENCES public.Hotel(idHotel) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.Discapacidad
(
    idDiscapacidad integer NOT NULL,
    auditiva BOOLEAN,
    visual BOOLEAN,
    baston BOOLEAN,
    silla BOOLEAN,
    CONSTRAINT idDiscapacidad_key PRIMARY KEY (idDiscapacidad)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.Empresa
(
    idEmpresa integer NOT NULL,
    contacto text NOT NULL,  --jjjjjjjjjjjjjjjjjjjjjjjjjjjjjj
    telefono1 integer NOT NULL,
    telefono2 integer NOT NULL,
    correo text NOT NULL,
    idHorario integer NOT NULL, 
    CONSTRAINT id_Empresa PRIMARY KEY (idEmpresa),
    CONSTRAINT id_horario_empresa FOREIGN KEY (idHorario)
        REFERENCES public.Horario(idHorario) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.Actividad
(
    idActividad integer NOT NULL,
    nombre text NOT NULL,
    riesgo integer NOT NULL,
    descripcion text NOT NULL,
    ley7600 BOOLEAN NOT NULL,
    petFriendly BOOLEAN NOT NULL,
    idUbicacion integer NOT NULL,
    precio decimal NOT NULL,
    edadMenor integer NOT NULL,
    edadManor integer NOT NULL,    
    CONSTRAINT id_key_Actividad PRIMARY KEY (idActividad),
    CONSTRAINT id_ubicacion_Actividad FOREIGN KEY (idUbicacion)
        REFERENCES public.Ubicacion(idUbicacion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.ActividadesPorIdioma
(
    idActividad integer NOT NULL,
    idioma text NOT NULL,
    CONSTRAINT id_Hotel_key PRIMARY KEY (idActividad, idioma),
    CONSTRAINT ActividadesPorIdioma_reference FOREIGN KEY (idActividad)
        REFERENCES public.Actividad(idActividad) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT id_ActividadesPorIdioma_reference FOREIGN KEY (idioma)
        REFERENCES public.Idioma(idioma) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.ActividadesPorEmpresa
(
    idActividad integer NOT NULL,
    idEmpresa integer NOT NULL,
    CONSTRAINT id_key PRIMARY KEY (idActividad, idEmpresa),
    CONSTRAINT ActividadesPorEmpresa_reference_Empr FOREIGN KEY (idEmpresa)
        REFERENCES public.Empresa(idEmpresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT ActividadesPorEmpresa_reference_Acti FOREIGN KEY (idActividad)
        REFERENCES public.Actividad(idActividad) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.HotelesPorEmpresa
(
    idHotel integer NOT NULL,
    idEmpresa integer NOT NULL,
    CONSTRAINT id_key_HotelesPorEmpresa PRIMARY KEY (idHotel, idEmpresa),
    CONSTRAINT HotelesPorEmpresa_referenceEmpres FOREIGN KEY (idEmpresa)
        REFERENCES public.Empresa(idEmpresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT HotelesPorEmpresa_referenceHotel FOREIGN KEY (idHotel)
        REFERENCES public.Hotel(idHotel) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.InformacionContacto
(
    idInformacionContacto integer NOT NULL,
    nombre text NOT NULL,
    correo text NOT NULL,
    telefono1 text NOT NULL,
    CONSTRAINT id_key_InformacionContactoInformacionContacto PRIMARY KEY (idInformacionContacto)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.Evento
(
    actividad text NOT NULL,
    fecha date NOT NULL,
    idUbicacion integer NOT NULL,
    descripcion text NOT NULL,
    idInformacionContacto integer NOT NULL,
    CONSTRAINT id_key_evento PRIMARY KEY (actividad),
    CONSTRAINT idInformacionContacto_key FOREIGN KEY (idInformacionContacto)
        REFERENCES public.InformacionContacto(idInformacionContacto) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT id_ubicacion_evento FOREIGN KEY (idUbicacion)
        REFERENCES public.Ubicacion(idUbicacion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.Usuario
(
    nombreDeUsuario text NOT NULL,
    contrasena text NOT NULL,
    nombre text NOT NULL,
    apellido1 text NOT NULL,
    apellido2 text NOT NULL,
    fechaNacimiento date NOT NULL,
    paisNacimiento text,
    paisResidencia text,
    familia BOOLEAN NOT NULL,
    hijos integer,
    idResidencia integer,
    idDiscapacidad integer,
    telefono text,
    correo text NOT NULL,
    idioma text,
    sexo text NOT NULL,
    idRedesSociales integer,
    mascota BOOLEAN NOT NULL,
    CONSTRAINT idUsuario_key PRIMARY KEY (nombreDeUsuario),
    CONSTRAINT id_Residencia_U FOREIGN KEY (idResidencia)
        REFERENCES public.Ubicacion(idUbicacion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT id_Discapacidad_U FOREIGN KEY (idDiscapacidad)
        REFERENCES public.Discapacidad(idDiscapacidad) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT id_redesSociales_U FOREIGN KEY (idRedesSociales)
        REFERENCES public.RedesSociales(idRedesSociales) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.PlanAdministrativo
(
    idPlan integer NOT NULL,
    idHotel integer NOT NULL,
    fechaInicio date NOT NULL,
    fechaFin date NOT NULL,
    precio decimal,
    CONSTRAINT id_keyPlanAdministrativo PRIMARY KEY (idPlan),
    CONSTRAINT id_Hotel_referencePlanAdministrativo FOREIGN KEY (idHotel)
        REFERENCES public.Hotel(idHotel) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.PlanUusuario
(
    idPlan integer NOT NULL,
    idHotel integer NOT NULL,
    idUsuario text NOT NULL,
    fechaInicio date NOT NULL,
    fechaFin date NOT NULL,
    precio decimal,
    CONSTRAINT id_keyPlanUusuario PRIMARY KEY (idPlan),
    CONSTRAINT id_Hotel_reference_PlanUusuario FOREIGN KEY (idHotel)
        REFERENCES public.Hotel(idHotel) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT nombreDeUsuario_reference_PlanUusuario FOREIGN KEY(idUsuario)
        REFERENCES public.Usuario(nombreDeUsuario) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.PlanPorActividad
(
    idPlan integer NOT NULL,
    idActividad integer NOT NULL,
    CONSTRAINT id_keyPlanPorActividad PRIMARY KEY (idPlan, idActividad),
    CONSTRAINT idActividad_reference_PlanPorActividad FOREIGN KEY (idActividad)
        REFERENCES public.Actividad(idActividad) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT PlanAdministrativo_reference_PlanPorActividad FOREIGN KEY(idPlan)
        REFERENCES public.PlanAdministrativo(idPlan) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE TABLE public.Consecutivo
(
    idRedesSociales integer,
    idDiscapacidad integer,
    idUbicacion integer,
    idHotel integer,
    idHorario integer
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

INSERT INTO public.Consecutivo VALUES (0,0,0,0,0);

--FUNCIOENES ***
CREATE OR REPLACE FUNCTION public.ObtenerID(
    tipo text)
    RETURNS integer
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$BEGIN 
    IF tipo SIMILAR TO 'idRedesSociales' THEN
        UPDATE public.Consecutivo SET idRedesSociales = idRedesSociales + 1;
        RETURN (SELECT idUsuario FROM public.Consecutivo);
    ELSIF tipo SIMILAR TO 'idDiscapacidad' THEN
        UPDATE public.Consecutivo SET idDiscapacidad = idDiscapacidad + 1;
        RETURN (SELECT idDiscapacidad FROM public.Consecutivo);
    ELSIF tipo SIMILAR TO 'idUbicacion' THEN
        UPDATE public.Consecutivo SET idUbicacion = idUbicacion + 1;
        RETURN (SELECT idUbicacion FROM public.Consecutivo);
    ELSIF tipo SIMILAR TO 'idHotel' THEN
        UPDATE public.Consecutivo SET idHotel = idHotel + 1;
        RETURN (SELECT idHotel FROM public.Consecutivo);
    ELSIF tipo SIMILAR TO 'idHorario' THEN
        UPDATE public.Consecutivo SET idHorario = idHorario + 1;
        RETURN (SELECT idHorario FROM public.Consecutivo);
    ELSE
        UPDATE public.Consecutivo SET idDiscapacidad = idDiscapacidad + 1;
        RETURN (SELECT idDiscapacidad FROM public.Consecutivo);
    END IF;
END;$BODY$;

CREATE OR REPLACE FUNCTION public.insertarDiscapacidad(
    pIdDiscapacidad integer,
    pAuditiva BOOLEAN,
    pVisual BOOLEAN,
    pBaston BOOLEAN,
    pSilla BOOLEAN
)
RETURNS integer
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
    INSERT INTO public.Discapacidad VALUES (pIdDiscapacidad, pAuditiva, pVisual, pBaston, pSilla);
END;$BODY$;

CREATE OR REPLACE FUNCTION public.insertarUsuarioPrev(
    pAuditiva BOOLEAN,
    pVisual BOOLEAN,
    pBaston BOOLEAN,
    pSilla BOOLEAN,
    pNombreDeUsuario text,
    pContrasena text,
    pNombre text,
    pApellido1 text,
    pApellido2 text,
    pFechaNacimiento date,
    pCorreo text,
    pHijos integer,
    pSexo text,
    pFamilia BOOLEAN,
    pMascota BOOLEAN
)
RETURNS integer
LANGUAGE 'plpgsql'
AS $BODY$
    DECLARE pIdDiscapacidad_ integer := public.ObtenerID('idDiscapacidad');
BEGIN
    INSERT INTO public.Discapacidad VALUES (pIdDiscapacidad_, pAuditiva, pVisual, pBaston, pSilla); 
    INSERT INTO public.Usuario
    (nombreDeUsuario, contrasena, nombre, apellido1, apellido2, fechaNacimiento, correo, hijos, idDiscapacidad, 
    sexo, familia, mascota) 
    VALUES(pNombreDeUsuario, pContrasena, pNombre, pApellido1, pApellido2, pFechaNacimiento, pCorreo, pHijos,
    pIdDiscapacidad_, pSexo, pFamilia, pMascota);
    RETURN 0;
END;$BODY$;

CREATE OR REPLACE FUNCTION public.insertarUsuarioFin(
    pNombreDeUsuario text,
    pProvincia text,
    pCanton text,
    pDistrito text,
    pFacebook text,
    pTwiter text,
    pInstagram text,
    pPinterest text,
    pPaisNacimiento text,
    pTelefono text,
    pIdioma text
)
RETURNS integer
LANGUAGE 'plpgsql'
AS $BODY$
    DECLARE idUbicacion_ integer := public.ObtenerID('idUbicacion');
    DECLARE idRedesSociales_ integer := public.ObtenerID('idRedesSociales');
BEGIN
    INSERT INTO public.Ubicacion (idUbicacion, provincia, canton, distrito) VALUES (idUbicacion_, pProvincia, pCanton, pDistrito); 
    INSERT INTO public.RedesSociales (idRedesSociales, facebook, twiter, instagram, pinterest) 
    VALUES (idRedesSociales_, pFacebook, pTwiter, pInstagram, pPinterest); 
    UPDATE public.Usuario
    SET paisNacimiento = pPaisNacimiento, idResidencia = idUbicacion_, telefono = pTelefono, idioma = pIdioma,
    idRedesSociales = idRedesSociales_ WHERE nombreDeUsuario = pNombreDeUsuario;
    RETURN 0;
END;$BODY$;

CREATE OR REPLACE FUNCTION public.eliminarUsuario(
    pNombreDeUsuario text    
)
RETURNS integer
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
    DELETE from public.Usuario WHERE nombreDeUsuario = pNombreDeUsuario;
END;$BODY$;

CREATE OR REPLACE FUNCTION public.updateUsuario(
    pNombreDeUsuario text,
    pAuditiva BOOLEAN,
    pVisual BOOLEAN,
    pBaston BOOLEAN,
    pSilla BOOLEAN,
    pContrasena text,
    pNombre text,
    pApellido1 text,
    pApellido2 text,
    pFechaNacimiento date,
    pCorreo text,
    pHijos integer,
    pSexo text,
    pFamilia BOOLEAN,
    pMascota BOOLEAN
)
RETURNS integer
LANGUAGE 'plpgsql'
AS $BODY$
    DECLARE pIdDiscapacidad integer := (SELECT idDiscapacidad FROM public.Usuario WHERE nombreDeUsuario = pNombreDeUsuario);
BEGIN
    UPDATE public.Discapacidad SET auditiva = pAuditiva, visual = pVisual, baston = pBaston, silla = pSilla 
    WHERE idDiscapacidad = pIdDiscapacidad;
    UPDATE public.Usuario SET contrasena = pContrasena, nombre = pNombre, apellido1 = pApellido1, 
    apellido2 = pApellido2, fechaNacimiento = pFechaNacimiento, correo = pCorreo, hijos = pHijos, 
    sexo = pSexo, familia = pFamilia, mascota = pMascota WHERE nombreUsuario = pNombreUsuario;
    RETURN 0;
END;$BODY$;

CREATE OR REPLACE FUNCTION public.insertarHotel(
    pTipoDia text,
    pEntrada text,
    pSalida text,
    pNombre text,
    pTelefono1 text,
    pSitio text,
    pCorreo text,
    pPetFriendly BOOLEAN,
    pLey7600 BOOLEAN
)
RETURNS integer
LANGUAGE 'plpgsql'
AS $BODY$
    DECLARE pIdHotel integer := public.ObtenerID('idHotel');
    DECLARE pIdHorario integer := public.ObtenerID('idHorario');
BEGIN
    INSERT INTO public.Horario VALUES (pIdHorario, pTipoDia, pEntrada, pSalida);
    INSERT INTO public.Hotel 
    (idHotel, nombre, telefono1, sitio, correo, petFriendly, ley7600, idHorario)
    VALUES(pIdHotel, pNombre, pTelefono1, pSitio, pCorreo, pPetFriendly, pLey7600, pIdHorario);
	RETURN 0;
END;$BODY$;

CREATE OR REPLACE FUNCTION public.eliminarHotel(
    pIdHotel integer    
)
RETURNS integer
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
    DELETE from public.Hotel WHERE idHotel = pIdHotel;
END;$BODY$;

CREATE OR REPLACE FUNCTION public.updateHotel(
    pIdHotel integer,
    pTipoDia text,
    pEntrada text,
    pSalida text,
    pNombre text,
    pTelefono1 text,
    pSitio text,
    pCorreo text,
    pPetFriendly BOOLEAN,
    pLey7600 BOOLEAN  
)
RETURNS integer
LANGUAGE 'plpgsql'
AS $BODY$
    DECLARE pIdHorario integer := (SELECT pIdHorario FROM public.Hotel WHERE idHotel = pIdHotel);
BEGIN
    UPDATE public.Horario SET tipoDia = pTipoDia, entrada = pEntrada, salida = pSalida 
    WHERE idHorario = pIdHorario;
    UPDATE public.Hotel SET nombre = pNombre, telefono1 = pTelefono1, sitio = pSitio, correo = pCorreo,
    petFriendly = pPetFriendly, ley7600 = pLey7600
    WHERE idHotel = pIdHotel;
    RETURN 0;
END;$BODY$;