/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	property string bindPrefix

	GradientListView {
		model: ObjectModel {

			ListLabel {
				text: "IO"
			}

			ListTextItem {
				text: CommonWords.allow_to_charge
				dataItem.uid: root.bindPrefix + "/Io/AllowToCharge"
				allowed: dataItem.isValid
				secondaryText: CommonWords.yesOrNo(dataItem.value)
			}

			ListTextItem {
				text: CommonWords.allow_to_discharge
				dataItem.uid: root.bindPrefix + "/Io/AllowToDischarge"
				allowed: dataItem.isValid
				secondaryText: CommonWords.yesOrNo(dataItem.value)
			}

			ListTextItem {
				text: "Allow to balance"
				dataItem.uid: root.bindPrefix + "/Io/AllowToBalance"
				allowed: dataItem.isValid
				secondaryText: CommonWords.yesOrNo(dataItem.value)
			}

			ListSwitch {
				text: "Force charging off"
				dataItem.uid: root.bindPrefix + "/Io/ForceChargingOff"
				allowed: dataItem.isValid
			}

			ListSwitch {
				text: "Force discharging off"
				dataItem.uid: root.bindPrefix + "/Io/ForceDischargingOff"
				allowed: dataItem.isValid
			}

			ListSwitch {
				text: "Turn balancing off"
				dataItem.uid: root.bindPrefix + "/Io/TurnBalancingOff"
				allowed: dataItem.isValid
			}

			ListLabel {
				text: "Settings"
				allowed: resetSocSpinBoxItem.visible
			}

			ListSpinBox {
				id: resetSocSpinBoxItem
				//% "Reset SoC to"
				text: "Reset SoC to"
				dataItem.uid: root.bindPrefix + "/Settings/ResetSoc"
				allowed: dataItem.isValid
				suffix: "%"
				from: 0
				to: 100
				stepSize: 1
			}
		}
	}
}
