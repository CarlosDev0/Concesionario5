/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Concesionario.Entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "ventas")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Venta.findAll", query = "SELECT v FROM Venta v")
    , @NamedQuery(name = "Venta.findByIdVenta", query = "SELECT v FROM Venta v WHERE v.idVenta = :idVenta")
    , @NamedQuery(name = "Venta.findByIdCliente", query = "SELECT v FROM Venta v WHERE v.idCliente = :idCliente")
    , @NamedQuery(name = "Venta.findByIdVehiculo", query = "SELECT v FROM Venta v WHERE v.idVehiculo = :idVehiculo")
    , @NamedQuery(name = "Venta.findByCantidad", query = "SELECT v FROM Venta v WHERE v.cantidad = :cantidad")
    , @NamedQuery(name = "Venta.findByFechaVenta", query = "SELECT v FROM Venta v WHERE v.fechaVenta = :fechaVenta")
    , @NamedQuery(name = "Venta.findByNombreVendedor", query = "SELECT v FROM Venta v WHERE v.nombreVendedor = :nombreVendedor")
    , @NamedQuery(name = "Venta.findByPrecioVentaUnitario", query = "SELECT v FROM Venta v WHERE v.precioVentaUnitario = :precioVentaUnitario")
    , @NamedQuery(name = "Venta.findByIva", query = "SELECT v FROM Venta v WHERE v.iva = :iva")
    , @NamedQuery(name = "Venta.findByCiudadVenta", query = "SELECT v FROM Venta v WHERE v.ciudadVenta = :ciudadVenta")
    , @NamedQuery(name = "Venta.findByComentario", query = "SELECT v FROM Venta v WHERE v.comentario = :comentario")})
public class Venta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdVenta")
    private Integer idVenta;
    @Basic(optional = false)
    @NotNull
    @Column(name = "IdCliente")
    private int idCliente;
    @Basic(optional = false)
    @NotNull
    @Column(name = "IdVehiculo")
    private int idVehiculo;
    @Column(name = "Cantidad")
    private Short cantidad;
    @Column(name = "FechaVenta")
    @Temporal(TemporalType.DATE)
    private Date fechaVenta;
    @Size(max = 100)
    @Column(name = "NombreVendedor")
    private String nombreVendedor;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "PrecioVentaUnitario")
    private BigDecimal precioVentaUnitario;
    @Column(name = "Iva")
    private BigDecimal iva;
    @Size(max = 60)
    @Column(name = "CiudadVenta")
    private String ciudadVenta;
    @Size(max = 300)
    @Column(name = "Comentario")
    private String comentario;
    

    public Venta() {
    }

    public Venta(Integer idVenta) {
        this.idVenta = idVenta;
    }

    public Venta(Integer idVenta, int idCliente, int idVehiculo, String nombreVendedor, short cantidad, BigDecimal PrecioVentaUnitario, Date FechaVenta) {
        this.idVenta = idVenta;
        this.idCliente = idCliente;
        this.idVehiculo = idVehiculo;
        this.nombreVendedor = nombreVendedor;
        this.cantidad = cantidad;
        this.precioVentaUnitario =PrecioVentaUnitario;
        this.fechaVenta = FechaVenta;
        
    }

    public Integer getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(Integer idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdVehiculo() {
        return idVehiculo;
    }

    public void setIdVehiculo(int idVehiculo) {
        this.idVehiculo = idVehiculo;
    }

    public Short getCantidad() {
        return cantidad;
    }

    public void setCantidad(Short cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public String getNombreVendedor() {
        return nombreVendedor;
    }


    
    public void setNombreVendedor(String nombreVendedor) {
        this.nombreVendedor = nombreVendedor;
    }

    public BigDecimal getPrecioVentaUnitario() {
        return precioVentaUnitario;
    }

    public void setPrecioVentaUnitario(BigDecimal precioVentaUnitario) {
        this.precioVentaUnitario = precioVentaUnitario;
    }

    public BigDecimal getIva() {
        return iva;
    }

    public void setIva(BigDecimal iva) {
        this.iva = iva;
    }

    public String getCiudadVenta() {
        return ciudadVenta;
    }

    public void setCiudadVenta(String ciudadVenta) {
        this.ciudadVenta = ciudadVenta;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idVenta != null ? idVenta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Venta)) {
            return false;
        }
        Venta other = (Venta) object;
        if ((this.idVenta == null && other.idVenta != null) || (this.idVenta != null && !this.idVenta.equals(other.idVenta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.Concesionario.Entity.Venta[ idVenta=" + idVenta + " ]";
    }
    
}
