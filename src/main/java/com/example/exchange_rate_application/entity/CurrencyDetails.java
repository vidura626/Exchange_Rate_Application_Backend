package com.example.exchange_rate_application.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "CURRENCY_DETAILS")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class CurrencyDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String code;
    private String description;
    private Double price;
    private boolean isBaseCurrency;
}
