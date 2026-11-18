Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.82
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795012605;
	b=TqOiBtKw3fv51wIGtEuglhfb4iXKPuwXR83h1PQRfdhSLzdl30zhNEcXouys76BSr0Yp
	 jbaWshfssYrLJmHJ7dELhFYlEeYnj8YzuBNTfgzTKg3AhdqEdxq5QWkXTb2WrXwZSKtn4
	 7KxDZer8HBb05HPJKHwPH+UTRZJuVeGpmRaKK427hKIWMs5gWIwkIIy359yaB2OO/KmyI
	 bdK2kASWCXmtWAXGDD2CKLwDC+JuhjZIAzlntDfhhOWjblUIsOUym8v6xywHecnhbsBB5
	 j0XzboHWfPYuogsPPex2vTVn1890RPyr5ofoSft1HjwDwzArMUoCeKIeRnbRB8ui6/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012605;
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
	bh=4ct73n7alAR0qllxopHzV6bawqrogZ3sVCq6mpU7+88=;
	b=dD7HlPf2oxp3MvdqF1d4GCux+GHjDlixPLG3smBMdeZahUOqzm1wMmGbJQ7ntz+jUpfo
	 Ic3SIMqO1bYqjkrD9fpmdbJwZvylX4aUvBwz8Q3LMRRcLGveWNqk4DhTMBag8yGyvP53l
	 oT+8tBOp2c9seCnRXQzySSVDxxIMYfWzgb5sFAL+n9FOys6Y5i0ZjBoSW1VpRpK4amgnI
	 MpKO1QVjuY4pOy/6wuxA9CO6+TV2+AFKwp4VQH4Zyh2v8Q5fOnuoD/8X2nl2coP6qR0N1
	 7g6vjt7cI2QQyhRLhubaQzPkedVi0GmiBl8w4epNm8oxZ6x5FUmMto5/3z39K9p9FlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=NAT2YIFW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.82
Received: from WA0P291CU002.outbound.protection.outlook.com (mail-polandcentralazolkn19013082.outbound.protection.outlook.com [52.103.53.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299E4606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 299E4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=NAT2YIFW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJYhwY6XVarGTsEQS7GIE8LbEYolqcw1o0BQSqyya4p9fuidRpiobzYe22YCE8DfMSKh31Pyz4bXu1twI1l3mdq2enZzHj2cqgBOgeYKEDgyW+jFQCj4EB1e+W68daFVsso1/JgGvrfAFSH3ozTa2rgMsqrqCE7Yl13CVB8IB2Yw14zpSwfU4FY7kttTDTXhbkh8v1W0hI5obfMtcFegRmMJbIQyG1VdsCOdz0K153cSbQoGZ3FqTYc4SZA1jByZEP6MscbTWPE8BjW0swQb3Xzu0Riy4WXLnLqH0CMhMlLh+5n4oK0qbYXe297m1dRVECIdsK9FeI2rvrvHw9zsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ct73n7alAR0qllxopHzV6bawqrogZ3sVCq6mpU7+88=;
 b=H2XpPCZt2PaHC6Ge1gdIkU8um+WXsuV4ISxsXQb7q+9ig+8D3zUA97O23hPbYGJVFXhoJmsmjhb5ticTAlgwVsol8fm+3veYwppFpRnGS4rSCQf9TmtXW7AeDY8oZ0+Wfd00kuFpkKmLXDmA5KDHsvOGVzi44QVzJaP23BzI3y5lXTdmCmznCPFwueUpWs+q58C2r5GWllkWeOBFOEiharXsNcAHPDcWINh8PpRly3yfOSOzZ3EavYq6+uX2xRYOsDY4AkRrCujPCeuwYHGwMm84uAS+4uQoNiwZK2tPM4nu9nvexkp7H3TNTWttuRFdTiQYUA4ec/iD5GHQ5a4ucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ct73n7alAR0qllxopHzV6bawqrogZ3sVCq6mpU7+88=;
 b=NAT2YIFWZZLQWv60fh2oqR7GS2jD7CzDju1HDCCXj9KBnlOvn8LpiflffUETTGoPAZ2EslvAJk2OMXh0KTLwwwZEQt3dKK+ZRTZW90+BBRJdhoirYJqgL7pKD9zrDaKctBGDPijvgQvhx3UkTGZZ0E2p4ByxmVT6eFdb4ApLEJswWUMyX6w+enrQLYRolJ8PpxIp2tubwgZKC5G0rHK+mZUk1jsiS7qVI4T+WH+RBDew68I9MgdpJ8esTjOOI8KDLq/mJTfw2IBb6SRbtF80bxRJS4Rgeznr0JEA1Appt3kvxOwuagmtKQ+gbG9zQlWTwIGPu28WnxoTdoGZj9/GaQ==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA2P291MB927617.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:40::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:36:41 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 14:36:41 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "habilerturker@gmail.com" <habilerturker@gmail.com>
CC: "bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "habilerturker@hotmail.com"
	<habilerturker@hotmail.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] x86/hpet: Add safeguard check for zero channels during
 init
Thread-Topic: [PATCH] x86/hpet: Add safeguard check for zero channels during
 init
Thread-Index: AQHdTRtgox4p0CZcSkuUiKYdHp89Z7c0OReA
Date: Wed, 18 Nov 2026 14:36:41 +0000
Message-ID: <20261118143639.13128-1-habilerenturker@hotmail.com>
References: <20260925182614.16261-1-habilerenturker@hotmail.com>
In-Reply-To: <20260925182614.16261-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA2P291MB927617:EE_
x-ms-office365-filtering-correlation-id: 1da4f758-de77-4de3-424e-08df45815c83
x-ms-exchange-slblob-mailprops:
 gMiuAN0LASL4Z831lB8tpzpdpKMUIXWl9RXMs3I/mmsMVlExFHW7AMXvsVUYhOKmWZdMYqSlU5Q7KF/DO84b8S3Yu4U+YXXHeseUrmao+7hgVWiKSRYLBzd5TmjOZxdi7dK2aL2SIj4aHX/8Z7nPOy8OuARNxLrqhaC1mKTEvpyRF+ZOCjxw1VeldnknUEfPZvdjUmGvsnskUQl/+hdgbwdGWEwl8VTiVcUhp+5bdXpa5jWjOL+CYxnhwsF7Us5ymT5bagOdvipI2PAUfiK7bV76jCkTXmsgBc7yfundLC6sgH/OGTWhSbf0uagbuWO2monLgSe/Hl+J6Qn5Anxj4dt+yfBnPrwqfZkmf1jTw4I0HZYKKCw63GLCCk2MwwD4Wq04xonvvXuJwoaRQGBKZNhomb2JTrjhuYwItBA99sDqX71QOktkwB/1m085JS0ZomUsyghcbjxVdnL3MfhYUnF9F1Pogmu61tVX47BYDnQ6JybxKCVK6nB7coj/8Iit/vSCGCAbtps7h2yYS9ZhOh0YdIUgywTr3q7CJeirRXLW2Fmmplt3W9FiI8TR/RK3R+Cne1Ogw1VV2fgk0X8tSGGUrUvpDHiLQlxKvAj7f1g4OxGktAeKu8XHXoGQjyLhFhaktvFSZu9riqlCGhWELQWC5nVsQ3ZDWNjiJAv7KYUN5LUxyjfCNbbKkUcdgeqz12sRgkDlxKuij0ZYVByaTQ==
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|4140399003|25010399006|19110799012|8060799015|51005399006|8062599012|15080799012|24021099003|38102599003|40105399003|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z2w4UW5mazlCSnlCZ0lMUk84dkpuV3dKOTNwV3gyU1Y4d1pFb3hkQU9iWStp?=
 =?utf-8?B?M25VZ0tjZHNGb2hHVy9mVi91NHozY3VVeXFscC9DcFRGM1ZScnVWSytBZjhS?=
 =?utf-8?B?ekJTbXZZQ2VmSGtxdUJxdW4vZyt2dUloOC9lSldDWXJndkhjTGY1NGw2cXp4?=
 =?utf-8?B?dlZQTmF5cW4xc1JZbS9PTGxWK3kwRjU2aFl6a01LZlRRSEV3anpzQXRtY1lL?=
 =?utf-8?B?SWFOL3NJQ0lHa0xvYndnZTF4amtOZHd4N3haT1g2aExReGE2VTZlcVVVSUk1?=
 =?utf-8?B?eHlhRnk5bjc4by8zWUc2M1NzUWk0VG9DOWVBanlReU1pYWt2M2Q5V21nZkRu?=
 =?utf-8?B?dXZkQTB4SWNFQ250eVZ5MGlOZkRna2pQZ2FhQzZaaWFmeTFneWtSQXhQdjJH?=
 =?utf-8?B?NG15RWtSa0VpWmYrVzZrVTg1ZDEvVzF4bGErc2NJM2ZYaXdnUlExS3lTT2h2?=
 =?utf-8?B?R3lvNW1zU2dSOGU4dVp5Y0ZQdUczWG5wTmQ1TlgxMVNublFHYSt2R2hoYXB4?=
 =?utf-8?B?bTlGTkdYN0xUTWZFNENwZzVGRzJsY2VXRTBJUXRJZXlLTE5IOUVzYVhFQnlv?=
 =?utf-8?B?TmVudXRJRHZVbXg4R2tjRjV1OHIrM2FOSzNsQUJUT09nZWtXYWYxekV3TnpS?=
 =?utf-8?B?U2hqenM2aWVhY2lBQ3lWOEVLbzB2aFhPR2ZwTzJyQy9GRE5NTjY1T1NvQVpv?=
 =?utf-8?B?UDd6SENKK0hxY2JIWm15bVVtMmJCd1Nma1JtV243a0FzVGFjWUVjeGgwSDBp?=
 =?utf-8?B?K24vRlRZZ0tMV0VaNU9tdlEvekgwTE9zL3JTY3FYd0UxQmVIL2NTQ0k3NlJi?=
 =?utf-8?B?MjVyU2xiN0VRNWxNcUN5d1RPcms4SUpVMTBJN1plZXNEWGpaU0ZwWm1xNTNJ?=
 =?utf-8?B?TzA5STRYdkF6SmNqM0Q0Qms3aFFYZVJzeUpFc3RJRlNuM1g4SHhHQ0p4K002?=
 =?utf-8?B?QVNXWUMvdFhXS1VUaXlzYk1WRlcwVHhRbE04N08wU0pGNFRVWk43Rk50amlM?=
 =?utf-8?B?UzhVUktBY2xIazQyUjJ1Q0hIZFdjVGhzYnN2OTZNc3RwNncza2xlSTRudEtF?=
 =?utf-8?B?TGpnbjcrdlVsUHZacHlpdVQ5M3Q0V2hrVSs5aFpGN2g1T3RMMDNJTUNjWC9i?=
 =?utf-8?B?bVNzd0kxekVDbEtpQkRCelg4YWltV2x0QmRidWRpYURmcVgzUHY3NzdLRjdE?=
 =?utf-8?B?YjRKaW1KemhjN3ZqTlVuUTV0bUszSDBlL0FIZnpHQzRiMi9xKzRjMjJlWDhM?=
 =?utf-8?B?QWtObTZXRXVjSndyOHlCWnozc0xTc1hSZlVCU0VtTVVqNmYydkNRSlFoWkRj?=
 =?utf-8?Q?pZzIhpwRu8Gd4=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y00yT0R2REowR0pmdVF2RFphVXNLQjRpNHlqRHZUaWJ3S0ZzOUExd3d5cUxR?=
 =?utf-8?B?T0pYcUk1WU82RUYxQ1NaUVYvVThxaWpoNXRMbkF4Zld2WldSQURaTlFLWWll?=
 =?utf-8?B?ck14YjBzNWtYMGtZUkNHTmNlZTdiTFpxbDMwR05iK0prbkRCb1NmY3g1WHF0?=
 =?utf-8?B?SHE2NTRBcXF1Yk5nd3I1SU5UMGZDSmhxNzVEK3lXUitiUjQ4Zk5jWWVtUmdp?=
 =?utf-8?B?NDVsSWJEcHR3Mnd4N2NWOGxXSnB4ZUdIaWpBdllBM0Q1bDRTMXJiTjBGUy9M?=
 =?utf-8?B?YnRaY3BJVzdKb29iek1PemFIR3RNdzBDbnQ5ZnBabEtaMXdRbEJXWkp6RE9l?=
 =?utf-8?B?MEl1WUN2SzdzQVBab0M0dnNZT3MyOUNDMVdRVi9NVnhxejlqMDdJTGF0OTJ3?=
 =?utf-8?B?dzF0VjhrQmVRR0t5L3cvbVFTK0JjNHNnYjd5WEEwcm1wYXYzMFgyMGNCNE1i?=
 =?utf-8?B?OUJZc2VwWVc3enlnazFrU3phemhwbkhkaFJyeEI0WXo2ZjBrOEdWcW5XQzYx?=
 =?utf-8?B?QXdSY0lBTlBQeUpoSEV0OXhuVXErb292WnZyMEM3NVN3WEhiWGVsUThhNHVE?=
 =?utf-8?B?bkk3WHZnT2ZqL3paTUlIWE5IYjJoUjVmanF3a1pLUjU1VFZvcDJwVEd6YlQw?=
 =?utf-8?B?dHl0OGN4N1hWRE1VbVJ4YjZZRldjaXVyc2VtQitodkQ1Tm9OMy9QTGlDWUoz?=
 =?utf-8?B?RjQ3SFZ5dHFTdDB6Q1lZZDhWNVNFLzZ2ZG96eDU2QjhtSXRWQlRERnc0a2JD?=
 =?utf-8?B?d3lldFg5SFlvRWV2ay94VGloNkZNejh3eFZBMUNMSU83Q3ZBd1J5SjdMWHB3?=
 =?utf-8?B?Y1g1TUc1Q0U5R2NNblNiQk5EK2lhQ2VGQVpXbGMzb2pwNy9Nd2hIYTlqYm1Q?=
 =?utf-8?B?Zms1bnV3RkoxSUJ3UTJtWlRvOVpIbkpTYjFQdlBkL0NwY0RqLzRoV2VLK2pm?=
 =?utf-8?B?TDM2RlJDOHNPWkJmQWNpTFRNUVVDUm9qRkkydDFpQjlXN0ZaTmhqWWgycGtH?=
 =?utf-8?B?dDZLSlRyRG43cHNPTmxCTUNNK2wxajZZRExCZEFQeDFJTU5yQkM4YjZlb0ZQ?=
 =?utf-8?B?dUVTc0lUNzczd09QZjJhcHhvZ0lMN3MwWEdYUm1sUXB4a0lzL2pnV2lSVm1D?=
 =?utf-8?B?aHhsd21KZERtTFJPWG9GdnBRa1hRMVRJMFEzMHhRZkpydVlHdmVBbllvQkV3?=
 =?utf-8?B?STA0U2dkVkVhMXVPSFdsWXJzWGVnWnpEdDZHWHRJVUZxRGlRMTNwa0ZZME9h?=
 =?utf-8?B?cEt1azVRZHZ1OExndFBlUEpuRzkzMkhadVZTWVZIY28yc1VUeGZJVjFPbXBC?=
 =?utf-8?B?TzJXekZoWEswdmRNb3hYWUk2UG9zemJrTUtiU2w4ZEtiTUd4d0VqM1g5dXlJ?=
 =?utf-8?B?alNoaGthMVJrRUl2c3ZnZDlqY3hRdExFQ3p5VFdmcTJhY1dVY0EwOUlQY1NV?=
 =?utf-8?B?akZlVFpNRHBoVFl3TnMrbTlESHZpdFRXTmc0TEFRRngvMlVhVnlsWU1ZZUU4?=
 =?utf-8?B?UExWell0TFdEY01peWJkS09hL3hTVWlBR0RvT2I1RmFVZ0IzSXNCWXQ1aGg0?=
 =?utf-8?B?Z2hiZ1BZQS9qdHdscUhUWU9qcUtXN0VDc3Z2VnUrbVdDeW9hdGVCRVpxanhB?=
 =?utf-8?B?SWZtVkNjNXB6N2JEeW1sZmsxaDhNWTZqazZ1SUNvSDQrWWYreVBPdFh4VXRQ?=
 =?utf-8?B?SCtybTQ2ZmhZVHNuaWh4dVU4TFBWSldjSUloYVdVbElCMjIxUkdYMXJrNG5W?=
 =?utf-8?B?OFA1OGN5RVE5VkNLR2VKZitCTE53bUs0TlNVKzZLL28xYVpibjJCSE9wVXFh?=
 =?utf-8?B?UGdkNVdnS3U0ajJ5ZkNlNjYyVU0wZ2FER0NaaWRMNmp1TXBuY1VHcEVIUmV5?=
 =?utf-8?Q?7DFm4TQQ4L4ie?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BA8D6D5E613A74DA73D2FB1DFB3D620@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da4f758-de77-4de3-424e-08df45815c83
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 14:36:41.4640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA2P291MB927617

SSBhbSB3aXRoZHJhd2luZyB0aGlzIHBhdGNoLiBVcG9uIGZ1cnRoZXIgYW5hbHlzaXMsIHRoZSBj
aGFubmVsIGNvdW50CmluIGFyY2gveDg2L2tlcm5lbC9ocGV0LmMgaXMgY2FsY3VsYXRlZCBhczoK
CiAgICAgICAgY2hhbm5lbHMgPSAoKGlkICYgSFBFVF9JRF9OVU1CRVIpID4+IEhQRVRfSURfTlVN
QkVSX1NISUZUKSArIDE7Cgp3aGljaCBpcyBhbHdheXMgYXQgbGVhc3QgMS4gVGhlIHplcm8tY2hh
bm5lbCBzY2VuYXJpbyBJIGRlc2NyaWJlZApjYW5ub3Qgb2NjdXIgaW4gcHJhY3RpY2UuIE5vIGFj
dGlvbiBpcyBuZWVkZWQgZnJvbSBtYWludGFpbmVycyBvbgp0aGlzIHRocmVhZC4gQXBvbG9naWVz
IGZvciB0aGUgbm9pc2UuCgpSZWdhcmRzLApUw7xya2VyCg==
