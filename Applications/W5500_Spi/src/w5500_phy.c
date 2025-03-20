/*
 * w5500_phy.c
 *
 *  Created on: Jul 16, 2024
 *      Author: mahyar
 */
#include <stdint.h>
#include <stdio.h>
#include "wizchip_conf.h"
#include "w5500_phy.h"
#include "usart_dbg.h"


/**
 * @brief Checks the presence of an Ethernet cable.
 *
 * This function continuously checks the status of the PHY link until the Ethernet cable is connected.
 *
 * @return void
 */
void check_cable_presence() {
    uint8_t phy_status;
    int error_status;
    uint32_t tmptime = 0xffffff;

    USARTx_send_data("\r\nChecking ethernet cable presence ...\r\n");
    do {
        // Get the PHY link status
        error_status = ctlwizchip(CW_GET_PHYLINK, (void*)&phy_status);

        if (error_status == -1) {
        	USARTx_send_data("Failed to get PHY link info.\r\nTrying again...\r\n");
            continue;
        }

        // Check if the cable is not connected
        if (phy_status == PHY_LINK_OFF) {
        	USARTx_send_data("Cable is not connected.\r\n");
        	while(--tmptime);
        	tmptime = 0xffffff;
//        	vTaskDelay(1500);
        }
    } while (error_status == -1 || phy_status == PHY_LINK_OFF);

    USARTx_send_data("Cable is connected.\r\n");
}

/**
 * @brief Checks and prints the PHY status and configuration.
 *
 * This function retrieves and prints the PHY link status and configuration, including mode, speed, and duplex settings.
 *
 * @return void
 */
void check_phy_status() {
    uint8_t phy_status;

    // Get the PHY link status
    if (ctlwizchip(CW_GET_PHYLINK, (void*)&phy_status) == -1) {
    	USARTx_send_data("Failed to get PHY link status.\r\n");
        return;
    }

    // Print the PHY link status
    if (phy_status == PHY_LINK_ON) {
    	USARTx_send_data("PHY Link is ON.\r\n");
    } else {
    	USARTx_send_data("PHY Link is OFF.\r\n");
    }

    // Get the PHY configuration (optional, for more detailed information)
    wiz_PhyConf phy_conf;
    if (ctlwizchip(CW_GET_PHYCONF, (void*)&phy_conf) == -1) {
    	USARTx_send_data("Failed to get PHY configuration.\r\n");
        return;
    }

    // Print the PHY configuration
    printf("PHY Mode: ");
    switch (phy_conf.by) {
        case PHY_CONFBY_HW:
        	USARTx_send_data("Configured by hardware.\r\n");
            break;
        case PHY_CONFBY_SW:
        	USARTx_send_data("Configured by software.\r\n");
            break;
        default:
        	USARTx_send_data("Unknown.\r\n");
            break;
    }

    USARTx_send_data("PHY Speed: ");
    switch (phy_conf.speed) {
        case PHY_SPEED_10:
        	USARTx_send_data("10 Mbps.\r\n");
            break;
        case PHY_SPEED_100:
        	USARTx_send_data("100 Mbps.\r\n");
            break;
        default:
        	USARTx_send_data("Unknown.\r\n");
            break;
    }

    USARTx_send_data("PHY Duplex: ");
    switch (phy_conf.duplex) {
        case PHY_DUPLEX_HALF:
        	USARTx_send_data("Half duplex.\r\n");
            break;
        case PHY_DUPLEX_FULL:
        	USARTx_send_data("Full duplex.\r\n");
            break;
        default:
        	USARTx_send_data("Unknown.\r\n");
            break;
    }

    // Print the PHY negotiation mode
    USARTx_send_data("PHY Negotiation Mode: ");
    switch (phy_conf.mode) {
        case PHY_MODE_MANUAL:
        	USARTx_send_data("Manual.\r\n");
            break;
        case PHY_MODE_AUTONEGO:
        	USARTx_send_data("Auto-negotiation.\r\n");
            break;
        default:
        	USARTx_send_data("Unknown.\r\n");
            break;
    }
}

/**
 * @brief Prints the current network configuration.
 *
 * This function retrieves the current network configuration from the WIZnet chip
 * and prints the MAC address, IP address, subnet mask, gateway, and DNS server.
 *
 * @return void
 */
void print_current_host_configuration() {
    wiz_NetInfo current_net_info;

    // Retrieve the current network information from the WIZnet chip
    ctlnetwork(CN_GET_NETINFO, (void*)&current_net_info);

    char TxDBGBuffer[100];
    snprintf(TxDBGBuffer, 100, "MAC: %02X:%02X:%02X:%02X:%02X:%02X\r\n",
            current_net_info.mac[0], current_net_info.mac[1], current_net_info.mac[2],
            current_net_info.mac[3], current_net_info.mac[4], current_net_info.mac[5]);
    // Print the MAC address
    USARTx_send_data(TxDBGBuffer);

    // Print the IP address
    snprintf(TxDBGBuffer, 100, "IP: %d.%d.%d.%d\r\n",
            current_net_info.ip[0], current_net_info.ip[1], current_net_info.ip[2], current_net_info.ip[3]);
    USARTx_send_data(TxDBGBuffer);

    // Print the subnet mask
    snprintf(TxDBGBuffer, 100,"SN: %d.%d.%d.%d\r\n",
            current_net_info.sn[0], current_net_info.sn[1], current_net_info.sn[2], current_net_info.sn[3]);
    USARTx_send_data(TxDBGBuffer);

    // Print the gateway address
    snprintf(TxDBGBuffer, 100, "GW: %d.%d.%d.%d\r\n",
           current_net_info.gw[0], current_net_info.gw[1], current_net_info.gw[2], current_net_info.gw[3]);
    USARTx_send_data(TxDBGBuffer);

    // Print the DNS server address
    snprintf(TxDBGBuffer, 100, "DNS: %d.%d.%d.%d\r\n",
           current_net_info.dns[0], current_net_info.dns[1], current_net_info.dns[2], current_net_info.dns[3]);
    USARTx_send_data(TxDBGBuffer);
}
