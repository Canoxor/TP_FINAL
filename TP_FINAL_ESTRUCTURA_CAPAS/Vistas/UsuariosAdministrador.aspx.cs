﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;


namespace Vistas
{
    public partial class UsuariosAdministrador : System.Web.UI.Page
    {
        protected NegocioUsuario N_Usuario = new NegocioUsuario();
        protected Usuario usuario = new Usuario();
        protected Usuario usuarioSeleccionado = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarGridView();
                setLabelUsuario();
            }

            setLabelUsuario();
        }

        public void cargarGridView()
        {
            grdUsuarios.DataSource = N_Usuario.getTablaUsuarios();
            grdUsuarios.DataBind();
        }

        public void cargarGridViewBusqueda(String nombre)
        {
            grdUsuarios.DataSource = N_Usuario.getTablaUsuarioBuscar(nombre);
            grdUsuarios.DataBind();
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["usuarioLogedIn"] = null;
            Response.Redirect("LandingPage.aspx");
        }

        protected void grdUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idUsuario = Convert.ToInt32(((Label)grdUsuarios.Rows[e.RowIndex].FindControl("lbl_IT_ID")).Text);
            bool seElimino = N_Usuario.BajaUsuario(idUsuario);
            if (seElimino)
            {
                lblMensaje.Text = "El Usuario con id = " + idUsuario + " se elimino de forma logica correctamente.";
            }
            else
            {
                lblMensaje.Text = "No se pudo eliminar, intente nuevamente";
            }
            cargarGridView();
        }

        protected void grdUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdUsuarios.EditIndex = e.NewEditIndex;
            cargarGridView();
        }

        protected void grdUsuarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdUsuarios.EditIndex = -1;
            cargarGridView();
        }

        protected void setLabelUsuario()
        {
            usuario = (Usuario)Session["usuarioLogedIn"];
            lblUsuario.Text = usuario.Nombre;
        }

        protected void grdUsuarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(((Label)grdUsuarios.Rows[e.RowIndex].FindControl("lbl_EIT_ID")).Text);
            String Email = ((TextBox)grdUsuarios.Rows[e.RowIndex].FindControl("txtEmailEdit")).Text;
            Usuario usuarioSeleccionado = N_Usuario.getUsuarioById(id);
            

            if(Email.Contains(usuarioSeleccionado.Email) == false)
            {

                if(N_Usuario.verificarEmail(Email) == false)
                {
                    usuarioSeleccionado.Nombre = ((TextBox)grdUsuarios.Rows[e.RowIndex].FindControl("txtNombreEdit")).Text;
                    usuarioSeleccionado.Apellido = ((TextBox)grdUsuarios.Rows[e.RowIndex].FindControl("txtApellidoEdit")).Text;
                    usuarioSeleccionado.Contraseña = ((TextBox)grdUsuarios.Rows[e.RowIndex].FindControl("txtContraseñaEdit")).Text;
                    usuarioSeleccionado.Admin = Convert.ToBoolean(((CheckBox)grdUsuarios.Rows[e.RowIndex].FindControl("cbAdminEdit")).Checked);
                    usuarioSeleccionado.Email = Email;

                    if (N_Usuario.editarUsuario(usuarioSeleccionado))
                    {
                        grdUsuarios.EditIndex = -1;
                        lblMensaje.Text = "Se edito correctamente";
                        cargarGridView();
                        if(usuarioSeleccionado.Codigo_Usuario == usuario.Codigo_Usuario)
                        {
                            Session["usuarioLogedIn"] = usuarioSeleccionado;
                            setLabelUsuario();
                        }
                    }
                    else
                    {
                        grdUsuarios.EditIndex = -1;
                        lblMensaje.Text = "Hubo un error, no se pudo editar correctamente, intentelo nuevamente";
                        cargarGridView();
                    }
                } 
                else
                {
                    lblMensaje.Text = "Error. Ya existe ese Email, por favor ingrese otro";
                }
            }
            else
            {
                usuarioSeleccionado.Nombre = ((TextBox)grdUsuarios.Rows[e.RowIndex].FindControl("txtNombreEdit")).Text;
                usuarioSeleccionado.Apellido = ((TextBox)grdUsuarios.Rows[e.RowIndex].FindControl("txtApellidoEdit")).Text;
                usuarioSeleccionado.Contraseña = ((TextBox)grdUsuarios.Rows[e.RowIndex].FindControl("txtContraseñaEdit")).Text;
                usuarioSeleccionado.Admin = Convert.ToBoolean(((CheckBox)grdUsuarios.Rows[e.RowIndex].FindControl("cbAdminEdit")).Checked);
                usuarioSeleccionado.Email = Email;

                if (N_Usuario.editarUsuario(usuarioSeleccionado))
                {
                    
                    lblMensaje.Text = "Se edito correctamente";
                    grdUsuarios.EditIndex = -1;
                    cargarGridView();
                    if (usuarioSeleccionado.Codigo_Usuario == usuario.Codigo_Usuario)
                    {
                        Session["usuarioLogedIn"] = usuarioSeleccionado;
                        setLabelUsuario();
                    }
                }
                else
                {
                    grdUsuarios.EditIndex = -1;
                    lblMensaje.Text = "Hubo un error, no se pudo editar correctamente, intentelo nuevamente";
                    cargarGridView();
                }
            }
        }

        protected void grdUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdUsuarios.PageIndex = e.NewPageIndex;
            cargarGridView();
        }

        protected void grdUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "eventoActivar")
            {
                int fila = Convert.ToInt32(e.CommandArgument);

                int id = Convert.ToInt32(((Label)grdUsuarios.Rows[fila].FindControl("lbl_IT_ID")).Text);
                Usuario usuarioActivar = new Usuario();
                usuarioActivar.Codigo_Usuario = id;
                if (N_Usuario.avtivarUsuario(usuarioActivar))
                {
                    lblMensaje.Text = "El Usuario se activo correctamente";
                    cargarGridView();
                }
            }
        }

        protected void btnBuscarUsuario_Click(object sender, EventArgs e)
        {
            if (txtBusquedaUsuario.Text == "")
            {
                cargarGridView();
            }
            else
            {
                cargarGridViewBusqueda(txtBusquedaUsuario.Text);
            }
        }
    }
}