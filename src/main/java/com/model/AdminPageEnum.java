/**
 * 
 */
package com.model;

/**
 * @author Huynh Tan Dat last on 22-08-2020 18:22:28
 *
 * 
 */
public enum AdminPageEnum {
	billPage {
		@Override
		public String toString() {
			return "admin/bill";
		}
	},
	staffPage{
		@Override
		public String toString() {
			return "admin/staff";
		}
	},
	charPage {
		@Override
		public String toString() {
			return "admin/char";
		}
	},
	createPatientPage {
		@Override
		public String toString() {
			return "admin/createPatient";
		}
	},
	createPhieuKhamPage {
		@Override
		public String toString() {
			return "admin/createPhieukham";
		}
	},
	history_medicalPage {
		@Override
		public String toString() {
			return "admin/history_medical";
		}
	},
	indexPage {
		@Override
		public String toString() {
			return "admin/index";
		}
	},
	list_accountPage {
		@Override
		public String toString() {
			return "admin/list_account";
		}
	},
	list_bacsiPage {
		@Override
		public String toString() {
			return "admin/list_bacsi";
		}
	},
	list_benhnhanPage {
		@Override
		public String toString() {
			return "admin/list_benhnhan";
		}
	},
	list_dichvuPage {
		@Override
		public String toString() {
			return "admin/list_dichvu";
		}
	},
	list_hoadonPage {
		@Override
		public String toString() {
			return "admin/list_hoadon";
		}
	},
	list_lichhenPage {
		@Override
		public String toString() {
			return "admin/list_lichhen";
		}
	},
	list_medicalPage {
		@Override
		public String toString() {
			return "admin/list_medical";
		}
	},
	phieukhamPage {
		@Override
		public String toString() {
			return "admin/phieukham";
		}
	}
}
