package com.RESTAPI.test;
import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate test() {
        return Karate.run("CP01ListarUsuarios.feature",
                                  "CP02ListarUsuariosID.feature",
                                  "CP03RegistrarUsuario.feature",
                                  "CP04ActualizarUsuario.feature",
                                  "CP05EliminarUsuario.feature"
                                 ).relativeTo(getClass());
    }
}

