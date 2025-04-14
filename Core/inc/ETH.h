/*
 * ETH.h
 *
 *  Created on: 4 апр. 2025 г.
 *      Author: ganibllo
 */

#ifndef INC_ETH_H_
#define INC_ETH_H_

typedef struct EHT_GPIO_struct{

}EHT_GPIO;

typedef struct ETH_struct{

//	void ETH_init(void);
	void (*TxData)(struct ETH_struct *ETH_);
}ETH;

#endif /* INC_ETH_H_ */
