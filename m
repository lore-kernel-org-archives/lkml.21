Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795132756;
	b=W2qp9zFiC667WbHUeZxOdQkGNuwPvl1iw/t/9EpkEA9tWvOwfU3RSwWYcz8HOZdMybhl
	 4qyLJ5tkFYBd+GA4rq5PoX9jPuAtEqqIHV2VD2pcW3sNN75XTMl2u8h33YWXujNsh1FT2
	 NOy8hLyJIW3UZ0KtV2W+EthtERx4pBGYK5UJKV7AQF/IxrILyh6/u2mRLksKA3wQKwqK/
	 Gip6epCvk42Nc5rRH2djPd9vOrmISxP4GAC0SMfCPWIkrPlWQhpwzVOMUeYGCgYxjZLsL
	 JPphU16FGRUzmt8A9n6gdfyeuzIiwJjcGbpNUueo5ANw/3GsPiuwcZOLIfdA9ri449g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132756;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lOL/u1BXYB/+IC0teLIcRhbuWc3idUge0J9GfcevnY8=;
	b=Ive/IkFNJH96l8OdciTl9oOeAZ7w1zfzA3699ykDJu1QLLVZ4Jvcex0hoRrDh9GzHY3S
	 klxPwfdYfa1gHWiUPKJBvFGaOCRbJn7+A8BPgH5Y0piHNC6HO77SDbny/oEsM2OnzevxZ
	 VsRUVIRNkOxxNgB0H9J3QtOUenbJ5BTIOyKGu2DgHFG009XbQxgb0Z+35Afx3IefOt/zz
	 hXXvpy08Hvor/dagRV8lUdg0bcSpw46Ea6Uv2qWYpfbbZRj49ekNPyzNnOh7uANqrbIx5
	 BLbsQDPeYw76Jeif6o5voUcQxJuivWcaiFxKglnMB3Rmny/QKfyVGVAT9AdBlh/FO2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=LRdQLvaa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.56
Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012056.outbound.protection.outlook.com [52.103.53.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A62F606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A62F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=LRdQLvaa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVFs59dnz+6g3xKfz9marP9jVfIowFHl1ZBs6n9W3zZGewn90sEg6I5V1nVYMhR9D1NbTDGMbAHkPOX1bB/G5UWiGuPmFuI4ItSUzV4vKlkvLtQBoitrFEuZOthmSWKwQ8kF6duY03yOvf1JmnxTe7WE7EY/6z8IQPPtUchokng20yb6UhslPqQua/6S2Bf1zyZizu1IFtzUU9gxue6m7/13tnJiHAXFQqNQjW3Q2QAeRc0H6B17PEkaaNamkETu6RAPiWKz+QPHqs2U8Bg9abndzNIkX4dZ9xWmw8jeDPvuFOtd0FAzMMlZ/TSEqKk8DwWkyaVSqShHLV+acVPwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOL/u1BXYB/+IC0teLIcRhbuWc3idUge0J9GfcevnY8=;
 b=p/qst5BU23t8Rn3wNjUE4xdoNAT36Hr5iaoaA8S2bqTXlsvVqjWHemmwFQhChfFrAroTzQbhvSX41gwL0ty/FJp/LVpQQD0D/xXW6g8LkL1C30WD/u5C2OF8h8rb9MAiQAszL6+jyJSm9yL/HDroQ4L5a4MiXX9f/SsR8sIyCRYiXIqNcRrsKLEsJozbGosmw2g4lzI26OE4fBSSGu6SVEAW5LvEDbynm9YzkDGMHhc1apuTq4wFDuLzdQJHRogWYIT81ZVyT4zxl2xUjitvOd1k2KWtfYlyB56mVb5b+Buc3RVdnX1uCLLTkaNCB1ngcEABZ6Gy5NUwAtkCWDtF8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOL/u1BXYB/+IC0teLIcRhbuWc3idUge0J9GfcevnY8=;
 b=LRdQLvaaEd2rgTV9isfmdY1F/fy5Xqi4tPHfT7h2bDuVdzHS89XKGEPeYemdwrIk9wM6ByOxSSNwbYiyx7NOT6og5t2nnRxJHleQc1qu8JdG+xBTSswZiz4+DyMDR3J+WFYUo7SH6XKYzKPwojWxnRPm+cX6B87Et+wUIWIMLU8QlEkhTrrUvcnE6T8cup897xyF2MoZdsEplZqcjvzNlzXFk89HsdrCWgKazXqnnQv5kOcXelq/EFaVKsFHkhtgC7mw/4DBWq1PLhqGfXsWUPAbi6dKl3Vtk4q+zYWN94MghlLT8dS5mspkek5w2kDDrPUN6T6979Kblu+qVsXUww==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA1P291MB0110.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:12::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 23:59:12 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 23:59:12 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "dave.hansen@intel.com" <dave.hansen@intel.com>
CC: "bp@alien8.de" <bp@alien8.de>, "daniel@quora.org" <daniel@quora.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	=?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "jwiesner@suse.de" <jwiesner@suse.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "rick.p.edgecombe@intel.com"
	<rick.p.edgecombe@intel.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] x86/hpet: Replace sprintf() with scnprintf() in
 hpet_select_clockevents()
Thread-Topic: [PATCH] x86/hpet: Replace sprintf() with scnprintf() in
 hpet_select_clockevents()
Thread-Index: AQHddohI+TLOqhQheEKSKFYW9eZNrLc2B7gAgAAFjwCAAAckgIAAAmeA
Date: Thu, 19 Nov 2026 23:59:12 +0000
Message-ID: <20261119235911.119953-1-habilerenturker@hotmail.com>
References: <f80b9d6f-c8f2-46d9-a396-bbc2bc6513d1@intel.com>
In-Reply-To: <f80b9d6f-c8f2-46d9-a396-bbc2bc6513d1@intel.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA1P291MB0110:EE_
x-ms-office365-filtering-correlation-id: f67bcc0b-ef8c-4f2e-ddaa-08df46991bee
x-ms-exchange-slblob-mailprops:
 CLk2x5OX5VamqICzye+315pYcDqahkiGDmpjMJIRmqkn1rOZYoENna/WRbdO/2gnF9i8qvaYxOXSnfjT04t3AOJh1WNkROfgsoDF9hSyrbjPQnJTqOQltyNhC5fWuffCIdxLOIGIn5uj7GdTAJyRuPMLW3hLG4GYuPcwd5tDr1q1Nubi9NWpsJl+rX4andrnX/8SToE9655PomBUpfjMlPH+VC8voUE6ovf9B8gudJMSWbKaRAMPzXVeha34rV7MYijF9RgQSzX26/NPZTVLSGAjihptMG0KP3vHzzVZPh0ku2581jColrSx76wzBVfFbiurBrKrNUp5iDehlIKkXU+/3eXiXAs3wbW61xHy6nAoIpvPtPucrUfclgibyqKtL+NqD90InTlrBUeuwJIbXW3i2LKVAWH07QNOp8prkIkGO54lz4hd16Djep32XO0+3BvURCIMgtLWdrs9IE9IL65INHn3ABY+PGUB/NrcVv8fLED5/LsiVHA4lj5eirGFhnHr9eQHgR1a+Q8cmE3lY6XiNwV2xokZfCnGvDx6bbiWettvHsegkH5QpFnOT5Hd1XYDecaeIMglcBDitSHgs2dkoeqww3t3IQavR4vZR4U/J9r38eaqbu5dyAm7S2fX/IJRwPmQ0erhnZlcWTnmuokd1Lwl7B6lLhVujHIRbOoMDS7C/dkubkxji1ntLm1xUuFEC+d/wdIqEcaFJJrnfw==
x-microsoft-antispam:
 BCL:0;ARA:14566002|24021099003|55001999006|51005399006|8062599012|25010399006|15080799012|19110799012|8060799015|38102599003|2604032031799003|31061999003|40105399003|102099032|440099028|3412199025|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?cEdhNFlCcFJac2ZZWDYyNjEvdG9wa1ZDSTlTQ3hWbEg0bGh6VDUyZXUveXdD?=
 =?utf-8?B?UzUxSHYxVUNLbi9xWmJWT0o0a2E1dXY2MzhjK0w1ZEdhVmVpR0w4VEtMclJM?=
 =?utf-8?B?Y0hXb3NjWU11NnhHSlZUNHMwQm9VTHpkeEN4NU8zU3ZnaDUxYWY1bXNrNGcx?=
 =?utf-8?B?WVhERGV6WTVoUGZWV1QzT1Q4NE1vQ09OM2ZIUzNVU2Q0MVc0eVBuaS82NW1o?=
 =?utf-8?B?WGRWMDlySDVWNUE2MS9wSTZrYlhLMW5LQVhWc0lKdEx6Vk5OcEtneGZPWlEx?=
 =?utf-8?B?Q1h2ODBVaXY2Y3BPZ1pLM29kQTkvRGFpd0ZCbmhYZ0QwaVQrbkJvUGsvb3VI?=
 =?utf-8?B?OVhsY0xpZWpSNVZwZURwMWxOZlkySVM0bGVtTXFXSnVNQktGbEtpWitZb1FK?=
 =?utf-8?B?Nk1vaXprOUdKZzlXT3RFMmNRZXVxOWpURjg4VjVmdXJHc1U1UFJnWDlUMjlI?=
 =?utf-8?B?RS9lREdwa1Z5SCtsaUl4bFNiekZKN2c0LzJUTlpzejRiZndpU0V1TXlqbUVq?=
 =?utf-8?B?T3c0V25yMkh0dG5Gc2pWT2o0SHNPaG93QVhUUTJMNkkya2tqSzZYVTZJYkx6?=
 =?utf-8?B?eGk1MzJBc2RZcFVQSEJ0bjZvRFhEYlh1eWdZY2lYK08ybTlUcnVYdFhoM0tn?=
 =?utf-8?B?ZENxbERCejFISy8rOCsvbkZlSnl2MHUzUmNjSk5pZUpDNkV3bHJDVHBrSU1S?=
 =?utf-8?B?eTZ4cXo5RjZqRjBOL2p0ZlVZS29Va0o5dVdlajcyWFZGYWRCSFI4a1dRdWxO?=
 =?utf-8?B?cnBoSHZ6dys4MWFGTkVlYzh2L2I0N0c4Um96MUQ4WERUOU1ZZHc1UGdTWGlU?=
 =?utf-8?B?RWN4TENab2xEQndsNkN3YUR4REFaQXdFZGRKL1dmNUF2UVVpL0MwQ2tSZndk?=
 =?utf-8?B?YWZXZGFGKzlrejZwZHhGbGVMdXVvTmhuaHpTd2I2MEF0L0h3Ulc5cGplRTJZ?=
 =?utf-8?B?Q2FwaHNZcE5OTkhhUWZtTEVQOCtpNVdJd1o0Z1VpdGRlR1BlbkNFSVl5Nnkw?=
 =?utf-8?B?SE50UHQrcFdUVEdhZWRaOW4ySzM5SzBxWnNyN29ES0I2NVFZVU4xdWplU25P?=
 =?utf-8?B?Zk8zUGl4d1NOY0tLY1hucE5KOW9aQUNrSWFIL3FVczc2dkcyMjFmUmlVakxS?=
 =?utf-8?B?c0p6QVl6cmd4NmxYMlJmQUlTYWtmbFdoMGlXbUN4UU9MTWw3RmQ5L25XQkhk?=
 =?utf-8?B?TU0rcUZFZXFROFlyemNBUkVNRmFwU2pGbzRYWDBXNkhXVVZQZWhGZ0gyNlZT?=
 =?utf-8?B?QWZGTVBkbmJrTEppT2VCZ0dsY3gwSXZaTktYTENyZ2pCeTNWMWtIYmI1akI5?=
 =?utf-8?B?TWhPYzdXK2RORFJkNkU4OVBGZzN0bEpZaExwZ3RCQmRER0FEaVhIZHNXRW1O?=
 =?utf-8?B?WExVZnJ6QjN0NzkzbmRBZnp3TDd1MWl3bnZwcjNLVWIzSmtCNWFBNERuZEtM?=
 =?utf-8?B?LzBBWnhRQ2RBSnFLdHNUcDhnU3dLUURIT1oyNlNRPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bzBqR01oYVF4QTZiejRLMnVXZGlKNWEyQUhBK3FoWCtNRW9sRWk2czJ1R0tD?=
 =?utf-8?B?R1EyY3dTM01BcTJnWVg4SWdwWUl0WVI3REFlNUN5d3pHQ1MrMUtaU1NDRG9k?=
 =?utf-8?B?S25WaFFId0xUVXc2SjFWY0VoUUZLNkJVN0E5eFpOU3IreWZvdEx3SjMvWkt0?=
 =?utf-8?B?T2thZWhGV3pNQ094N1ZySXAzSHR3ck10dStTZm05VDFLdGMzamFDbnR4S2pF?=
 =?utf-8?B?ZDdoMExBVnJlMEdDTWRUbVgxM3g0MjRTclRROXo4a1orTjloR0hJbGt5N0pp?=
 =?utf-8?B?amxrTXJlTnRCbmRpMWZvYXlUT1puYU4xaU0zWDZ3cDRDdExHQ0VYWmptZGZa?=
 =?utf-8?B?YStvdnc0S0hYRlRib21rdnFIUjlJZ0FJNzhFSUlmQjJIV3NsSXdXNmd5QVRv?=
 =?utf-8?B?TmY4a0lER0lpWlJrVUttYUpmbldhakVvcDl2YkxYVFFlSVdiaDI0RjZJay9O?=
 =?utf-8?B?K0x4MEhtNHhFR2g2bFNTcWNyZUFkdWlOak9PdWJyaUJSdVhTZ0phampHOERE?=
 =?utf-8?B?Sldab1BxamdEWU85UldjeU5oQW5FTmpNY3VwZlBiRjdXYnVIcStnamFFcXJD?=
 =?utf-8?B?V2k2cnFRVWF2K0hKNVJJL3RoVSt6MkRFZTlBeDNlOG85Wk5XcklvMVdHVjB5?=
 =?utf-8?B?cmtFQmhXNUhJbGxmb0RGSmQ1VGNaa0drMFd4STZJNGM3OURjOWRiYnFNVnVP?=
 =?utf-8?B?bFJWUXVxWGxwY1BIR0sxK3hmSmdkWTF3TnBPYmhVaXZTNTlxRTd3MW5nTVFM?=
 =?utf-8?B?V2lNd3JjV1Exd1NHa2kzL1h5VVlxK1lBWUNZWlZzZEQ5dDZHL1M2Z0FwelhI?=
 =?utf-8?B?K01yaWVJQjNnVHp4UU91amJTamJHYjdhOHRVOUFMcUl2NUtzMGZIR2dKc24r?=
 =?utf-8?B?RFlna0RUcHcycHZBV3lXOTcyVEl1S0ltd0Q1NURZVHRIQmZOdWNIaEhieURr?=
 =?utf-8?B?R2o5Y0lxZVhUZ0xoRlhKRDAyZllvVFBtd0puVzhjd3F2VDIyVGV3cTJTYW5F?=
 =?utf-8?B?emc4cTllOTNCdUhPVnozZkdUNnBCUzZmc2lQRnAvQzN6Nm5mRlJaNk1JczVY?=
 =?utf-8?B?Q0N1UXlWQ0tmUHVldDBzY0xWOXZtZVg0TkdPQUJxQndna3lMTndsa0ZLOU9o?=
 =?utf-8?B?WE51cWx1RFpjdERuUnI3MUV3YnRJM0t6ZEt3bUVYS1kvTktCdDdzS1NHYXRH?=
 =?utf-8?B?TDZ6d1pKY0h6clkzUGNrcHFid3lLMnV4amhrK1YwVHlpSWtJRnlBWmtDNnAx?=
 =?utf-8?B?SGc5cGwwditGTzFScjdEZDVqa25RVDVVYzdJUGpJS0IvNkVCUUlIS0ZJUit4?=
 =?utf-8?B?NjRXY0xYNTh5dUhjRmdPMGRlNnN2TXQyU2Q1T1dla0ZMb1JpUzIyY3hZTFda?=
 =?utf-8?B?cmZ1aFhnWitJbmw3KzQwMGdzbW1sUTZwQ0RGc0tmMDl2OUM3OFFYbWNnM3VL?=
 =?utf-8?B?TTF5MlBCVy9MdjBtTXN0TytQdm1OamYxbFhZT0J6RU5ZS3ljOTR6YkRTKzBO?=
 =?utf-8?B?NU5ZaUViaCtmd0lNQWVrelg5MlpwaVI5QWtZV05KRnBVck9QRjJ5MjUyWmJU?=
 =?utf-8?B?Y0dJNzhtendsY3psUlVFOVZENjM3VkhEZkxpUnRtZ0NtWS9oUGtNMnFBaks1?=
 =?utf-8?B?MkdwL2RHcVQxbkI1aUxvNERyR1V4VUZDR1lVNWFmV2k5TDVkbWp1TTlOSVVV?=
 =?utf-8?B?ck5CaWZLMTlXL0hnMVVDYXU5Vlh1R1pSRm9zUkVGc0JmblhqM2N5NittTmN0?=
 =?utf-8?B?a2FwZXF5SmQ2NndqZDVpZDJ0Q3FtNFJSandnNnN4WlQwWEYycmpvaEM4d0JQ?=
 =?utf-8?B?MSsyZUt4aHFDdFhYZjdqWmZjd2luWUJUM05GclFhN05KSVJ2MU9SREkyTHdJ?=
 =?utf-8?Q?doMl1/Dwe3XM9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5246F82EB14FF4FBC855543C6DC8821@POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-2112e.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f67bcc0b-ef8c-4f2e-ddaa-08df46991bee
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 23:59:12.1486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0110

VW5kZXJzdG9vZCwgaXQgbWFrZXMgc2Vuc2UuIEkgd2lsbCBkcm9wIHRoZSBwYXRjaC4gVGhhbmtz
IGZvciAKdGhlIHJldmlldy4KClJlZ2FyZHMsClTDvHJrZXIK
