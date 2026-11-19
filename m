Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795129331;
	b=EoiLAb9nOfcwI5Jq1I9VBs1gMjR2qTdqguYcknzodAMLVZRy2abkWYDP1+W+UkAj00H0
	 krEv6QPYueliKYYB0mKSr2kZGNNGWH7CArdc7T6A/VkUtoHHoFfTvNRDoHQ147GZUJsXD
	 ZKaVZnAwoy8xpKiRmhK42oE6awM4PcYQjmqHNACUya7vWJvT9uKkQt/4ap/Iou0zxLQfQ
	 qGMZJQZIdeheI7v9xtcurCTocu4U9v6yK5ANT606vp1+3j4NUy9R0UiHSpMcmuXcSFTb+
	 OuUnJ27t/gp0C7fwuDGopGC34JVODw8/qvX9kzR99VgB+9M8xI72QpCgsrz6ckpRztQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129331;
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
	bh=nVNrQK7Ca9+JJq1FMzI2ntQNQ7znP9qUB7mG3n78VQA=;
	b=ANL4VOmLCpZK/yOZOOJ+hHDwfDNCB3HfblfwSxMl5gpp6NCvxJYAGQnF12kdv+yamd3l
	 qss/XmU6jdt5hjn5FEciJIP75PbAuR86MdDbQEYRSUKg/3DtLoWS9CMO4H3Q5kmrI6nh/
	 L9ue1mkFbFVAGZBD9jPUvbGrLMXsTFuQFT9zavC9EuinivcJRdp/bmN4hywguDcns+/ex
	 0Sfu7EdIKNB0eDTUKsUnJsMAsc7/t414qFKWrcSEJgqFV7lkeUjK6WXU6Ym9IiNdHHxxb
	 /mX3lTAg34UJ0U6b1QOxTuGZlGc1IRoZGbGTlaSLazrwTep5QuF9HPaBBhRTFOnrUpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=Xx5fAZDt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.74
Received: from WA0P291CU002.outbound.protection.outlook.com (mail-polandcentralazolkn19013074.outbound.protection.outlook.com [52.103.53.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7420B606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7420B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=Xx5fAZDt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfvcYL7n7BpotEZJG1N/hPD2WTr3l1d/acIn6PazKly+HlCcyai8++WFme+1R1VxojRSqBodoHB5uHh0OTXs/MmEcovpM7qMYGHa0+4e9HBW/o62Ln87gFTHC54uqS0qVJTow3O/ob1DkdfyFkNbGwczLb6eWv5wKy5THkifHP2mhA7wDV4PpqdkQ/H5fWgKC3692FG+SkkdQR+Prgon6gpV2RH/ea+hRG201E81+kjS38Bk0eZvZiCDGzM/mZTdjzAqAVNdE6WcoagAIkxBWPzxhRabx6otfTe+ttWhvMPPIjuikZJJRJLhRDVzXIMLHJasbatG2bZHCbu4O3RUzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVNrQK7Ca9+JJq1FMzI2ntQNQ7znP9qUB7mG3n78VQA=;
 b=Iubm2FDw9HCq5ovOdH6ps89a52qdHgkLMCFxC1DqJpfNiMHuCaX6ZoRasJ6QR5I03NOVt4x2Y10hfziPvrVcnzpFw1N7mmUIOf+45yUwb1xbpVWb4JSyUbmfIjkYSjklc2W7+swHwb+/1OOmR5/wsuBg1lLQwSBlL85ZFXhzogt1Vg+wVZ5HPStLAyP0QL0sxr1hKRCxusaFKvEy2Z/ZLSxKvLA76DaIbGxNcDWtGhdOwDh5WcaQKlEc9QtSqJN/vZ0e/mN5Qi4nAqlztithTMAWb0RO5jDQJBxLZiaaWK8IfdoBgt8rjDiyLyMLL363sxy7Kt+noxn4veEJoHE3Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVNrQK7Ca9+JJq1FMzI2ntQNQ7znP9qUB7mG3n78VQA=;
 b=Xx5fAZDtj132BGrRgU/tLsaPymbRpapoGdcRKA3gxqYFCvlKPBDr038Qgk2K5FD9YwiiBlkPZyq7qZpBpBvhuVHWSxPgVuPDyWlON3sljf1pPN2GJqXSJQL3A2C1rEc7nn6TpvO8Qs2ByQNvyzwVnkFm9+GONs5RNLAGjqjRoj4YrBr3589sc5NygZkto+9HVbVziIRr8SFG1Rf7vQpU16TkbfeFN1TlPgh6BetLg9PSl+74LXz3uXNqZcJ1G2WeiLBkojUtit27Eu5P/kXPuMxq99AO7EMCilXViF9JDH4i4/i70rYYRt87K6yhxgQLvyAY5CA0ENYaDij4XgDAog==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA1P291MB0009.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Thu, 19 Nov 2026 23:02:07 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 23:02:07 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "dave.hansen@intel.com" <dave.hansen@intel.com>
CC: "bp@alien8.de" <bp@alien8.de>, "daniel@quora.org" <daniel@quora.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	=?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "jwiesner@suse.de" <jwiesner@suse.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] x86/hpet: Mark boot-time variables as __ro_after_init
Thread-Topic: [PATCH] x86/hpet: Mark boot-time variables as __ro_after_init
Thread-Index: AQHddo9YVXcm+DqNU0WkNQyfDE7BTbc1zo4AgAAP+wCAACNagIAABMeA
Date: Thu, 19 Nov 2026 23:02:07 +0000
Message-ID: <20261119230206.83339-1-habilerenturker@hotmail.com>
References: <19fd45ea-4566-43d1-aee0-6d22c8026f79@intel.com>
In-Reply-To: <19fd45ea-4566-43d1-aee0-6d22c8026f79@intel.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA1P291MB0009:EE_
x-ms-office365-filtering-correlation-id: 768f5c52-34fb-4858-e44f-08df46912274
x-ms-exchange-slblob-mailprops:
 Vs63Iqe4sQkGaLwEdeYxLY7yqos8lGqV6EAIlIa9xExEYgImz/ih3V5/jqEZpgtp8xEnMh9anClr3R8m92oYI+BTRN3JGh50jEJFLBD2jD6nmRUpvkAfBBFYMW7Vni9jDIUxVkVU65W/ViCJM9GoblR50QTF4/7kdg3JGw004RM2yRknXMXPldSeS56uVa6k5X/v/VJYNcGdZRd9bCSeua/GXlARFxLYDCFo61J5OM19tio2EZlhQnGv1XqtTSlzNSFsMNJ3a5Eb1dVhLm7veywWqOPOp70C/04dRppkWp68SvYAjHgtdzw6v30Fx46WUkU5jH2asfZHfNayKVn6HdAW1IPMpFowgPosStyBLtsggTCvG7qyu5KyfNBVP47R+1HPBCgiHB7MsKvnm5JA6xV3PLw+ED/s+wDzt9383/xOrAfMuFdfv3DX7bVEXCp5pC0+M+kxY+cVO9Y7oqiV7vGdgzEvcq1mJs0N1lnxrVtkDYMxZVSi63H+rL0020YyztnaBJ5L2RSQAhZOQ/+XKEsyXn4tmqoIVbwi99fgl3ybMMNlsHzkt357lOlCAP0kIe/9Z6CqJzdUu7tBkdLbz6adacvytZLdIYSzveqi9psGFF5zUM0csc6NWyU5f+ctGCZhYvpVUqhlr7EexM3mstQUZ1QvlZrv4sPQ/3XzWOBO9tKeRM2ObFHSgNTYg32aiMRUKUYqCYzxf3wh7Uv86lSkYq8XbhD4KMhgbwxkQqE=
x-microsoft-antispam:
 BCL:0;ARA:14566002|25010399006|51005399006|55001999006|24021099003|8062599012|31061999003|8060799015|19110799012|38102599003|15080799012|40105399003|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?NXpuYjJ6bWU3UTJTRmlFL25QdStCZS9wMjJKMGlBcHk5NWxOT3JYaFpCN0hR?=
 =?utf-8?B?Y2VIWGpUeDQ2MTFjdFZkSnNXTHZWNUFoT1JwK1FFdCtBam1JbXlDM0Fqa3hs?=
 =?utf-8?B?a3V4TCtYSmJRVmFnOUlxbEhEVEE4UGN2YVJVcXdDSWpHMVFucVduTm1vdExz?=
 =?utf-8?B?NTFxUzYyUis4QWNtQ1FZV3FyVlQvRDJKOVJyZ2VWUEU5QS9tdVplMDhUYS84?=
 =?utf-8?B?TGREa3Z0RXNKSCtKNENPelUzRG9idmQwK1pERWJjYWJ0aHNJZi9JVnRRYkQz?=
 =?utf-8?B?Nm9xM29WdS9oOG9MaHNRQzZzNW1qZ3MrRjlZZ25RdnBPbGsrNVVQcmNuUUtP?=
 =?utf-8?B?MW9qemVPWERBcEMwSUtORWhPZE50VThmNVJrMldTZjJlNFRWK2VvSlJibXhI?=
 =?utf-8?B?Zm1WQStUSTZPa2dWSFNDWDI2Tm1ZNkVRcG1OYVRIK3hwQk14YnRIY00xdklu?=
 =?utf-8?B?Z3BLZk1BTEtQMmlXS3Q0Ynh5dDlJcnhaK2lRRUxWY2JDYmowMVlqazZ6aGRS?=
 =?utf-8?B?TVZFejRla1VwQkNjczIvU0sxbTh3clZCZkdCNmc3RFAvR0ZrYkhuc3lVaTg4?=
 =?utf-8?B?QWJ0eG0rdzNYVitGUUFCTUUvV2YyN1dnZlNZQUNrRnRtVjFNM2djT0tXbWVx?=
 =?utf-8?B?L2dvSEtWb3RCRFdqVGtFY2QzRkhha3dUQzAxUUVWSnBqcUNCUHQvaFJxNDYz?=
 =?utf-8?B?ZG9IUm9JUkFEcnpPV3RQcEgrQ1QvSHpLa1V1WlIvQkVjRUc5cDMraDV2QnFC?=
 =?utf-8?B?cC91b3JzeFlidXp2SUdQb3lCSzVic0NROGlPdHJxUCs1U3RxVmZLa0ZpNVZn?=
 =?utf-8?B?RFA2cEM0UnA2em9ibUI1Sk5qRjdrMVBNUUdobVlleXFIRDBzcjY4NDJRWVhG?=
 =?utf-8?B?dHRBdmhaRzNFU1RhRUhndjduaDRWNkEvc25aS3pkUnRmK3lVR1grUVJCMENt?=
 =?utf-8?B?QVVuNXFWY2drQkVzQ2lDclZsOC96cENnRkZtS1B1RmIyeElwaTFhZ0h4VjAw?=
 =?utf-8?B?OHpRYkdQOXk0dFNBOWZMVWs3L09henlSUSthVXYxUkpmQ1QvZmUrQzlXVytP?=
 =?utf-8?B?b3EyZ2I3SnUrK0VvLy85WGNtdUJocE1xUDh6cFVGMnpycERydDE0MFdsNzBI?=
 =?utf-8?B?cDU3T0lRUHpLOERIZEpYcThmdXdkMFNBeDUycG5LZnJGdFNJNmN2SkpCN0M3?=
 =?utf-8?B?WDh6dXBSTEFISk5Ta1BtNEhUd1M4cEhwWVpEUE0xYU9LR2dYSXhFZ1ovcGds?=
 =?utf-8?B?NE1VSG1RYjRhWS8rT05qWS96YmFYOFprdlBMLzFiTWkzbHB5ZnI1YkxhKzBW?=
 =?utf-8?B?b3NwV1JPZnU2ZXZ5Y0ZQL2kycHUrU0x5YXFydnZrejhuOEVRVm9uN05vUko2?=
 =?utf-8?B?Y3NsUkNNYk4zRmc9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmlFb3E5VzRxcXJGSXZKZGdCU3R3Ym44cTk4TitnSWoxM0V3U3lCdG54ejNz?=
 =?utf-8?B?S1ZGNzBlMk84MW5Sd1lySE50Q3NPakMxdVZ1Uk1TZ3RSTEFiUDZXeFRtZXRL?=
 =?utf-8?B?RHprV2luTGFCQ2lIWlExVE83VFk1OUxIUjR5QWFBcTJJUzdBckEybkNKUGdQ?=
 =?utf-8?B?emFOUlB1Sk5FQjE2aDd6ODlya21Sb3F2NnNyZk94b1d0WEpCMlc0TE1kK0lq?=
 =?utf-8?B?ZEtpSHBBTGZqNTNITVNXcmJ3U2MvZlZ2ZnA1UldKYmRGVUFZa0MrdlkxRzZz?=
 =?utf-8?B?UHVlSFdTUkx6R3R1Y1RvVjh3VmM4a2FRVjhNRndjWm5rdm1McFdHL0ZqUkRl?=
 =?utf-8?B?d0o1WXRmWFdaVjJuY1MzSzlkQ1ArcU44dG1uc0hsa3lGalpmWnBheVYxeGVI?=
 =?utf-8?B?MUVJdGdGaktuMWR2Um5lWklLdGQ0Z0hOZmJuZFdlNG5Ib3lOS0h1VnpBNWl2?=
 =?utf-8?B?OGdkbWl3Mi95STVNR1kxSGpDUUsza2czM3pBMTlyRWtLZjdDOGlrM0RkcFJB?=
 =?utf-8?B?bW0wdnlrRFJiZ05KMURXYWswSy9rTGVHeDZWdWllNUtvZUtUQmt0RVZRMXR3?=
 =?utf-8?B?TjRTY0N6R0k1aXJxdEZVeC9qekIwdC9pY2RTUFJtTWZNa0JGVnAwSkEyRlFw?=
 =?utf-8?B?TEpIeExjRWlYM3hhUlNQM1gxMkhZSEZRQzhKazlGNkpyTUpxVkdzcFZ4REQ5?=
 =?utf-8?B?ajBodmdkNFdBdy9RbFhwQW9oNFEyc05RZEhWOGZFZW9YOG9KdVJHWi9KUllD?=
 =?utf-8?B?MDh3WENmM0JNcHhJeEtqR3MydTY5OE5EczBKOGt1QXNieUFncVBXTXNHSkN2?=
 =?utf-8?B?MUVKelVMOHBsb1RYaDErZlFHUS9JeTM2MGRoUnUxSjdLbTF3Q0p4ZEUzaURD?=
 =?utf-8?B?SmY2V0Y0amZhM2NsWjA4YkgrWnhIc2wyZEZ6dm1GcWprS04zL3YxaUJ4ZlQr?=
 =?utf-8?B?T2lIQ1JGKzdkS040b2VucW9ETlRyOFdyS3hveEZBakNDQ3IzVEw1cWJXM3J1?=
 =?utf-8?B?SzFXN2U4dHR3UUdjU1JzeUR2aGE5N0VQVGZMblcrOEZHR0ZJUlg5VS92SDI0?=
 =?utf-8?B?T0JjMjR4czdmcVFqWVhKNTRBaGdsY1lFZGZSSXQ4Z25nSGxZY1haSzlVb1Fa?=
 =?utf-8?B?cXAwTm5PSXdKNVJPbTIvaGlFSHpKWEppb3A5TC8xalExcVpNWUtSNkROV0Nt?=
 =?utf-8?B?QjdwRkJLbzBDakRYaWpubXFEUDd4VjNLS1lJMDdsNlNSYlF6VUZROE5Hbm92?=
 =?utf-8?B?aSszU09XV3VQQTNkNXZMUVVTd0hEY005Q2V3UWlTMDYxMVdyZVJtRjVkMTBj?=
 =?utf-8?B?b0VxaFovb1d4U1FFVnFxcTJHNzBNVGxpbkc5QjNDS1pGMzdPS2tJQmxjT0tG?=
 =?utf-8?B?Vzh0TkkyeXVRQ2E5andkK00waDcyRGdrS0VFTEVUTjVnUHVpbEhRNiswTUNa?=
 =?utf-8?B?NFl4djJpSW5IMTlha1gzay9ubk03Tkpma2VkaFkvZXlMVkZZRGZGZzZ3L3d1?=
 =?utf-8?B?L0M5ck4vTFFOMENWZ1pwUUQ5dDA4RUVISE9CZVhMK2llUHZHU3Rhb0tpY1lF?=
 =?utf-8?B?Qmx4bkdxbVQ5SUJ0RklWckJMQ3JSeVBlTmpLZ0tkcmY0UkFibFc5eW81SWZG?=
 =?utf-8?B?OERIL2cxR1Q2Nko3R0tDOEZ1OFlURTVuU3hsVFBzN08xRXg4VlhvQy9DZmkv?=
 =?utf-8?B?MVVFTmtTYlJ3WlN6ekdraHBUYnJwMytyUnYxc3F5dzlVTnNZcEpra2dKTk81?=
 =?utf-8?B?RE84OTRFTng2S2dWZjl6TlN5WVU1d2Rhc0VEdlpJMFNJQmRsZ3FKa0M3SjhU?=
 =?utf-8?B?TjNraUV0OTVBMFVKNnJlMFFwc1hKYjdtVzJlVmgycUlYZDdTeEd0RDlqM01W?=
 =?utf-8?Q?IDvG2Lj06NLjP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F3A989BFCE2764DAB744601E316FF1D@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 768f5c52-34fb-4858-e44f-08df46912274
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 23:02:07.1702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0009

SGkgRGF2ZSwKCkkndmUgYmVlbiB3b3JraW5nIHdpdGggSFBFVCBjb2RlIGZvciBhIGxvbmcgdGlt
ZSwgc28gSSBjYW1lIGFjcm9zcyB0aGlzIAphbmQganVzdCBub3RpY2VkIGl0LiBBbmQgSSB2ZXJp
ZmllZCB0aGUgY29udGV4dCBhbmQgbWFudWFsbHkgcmFuCmBnaXQgZ3JlcGAuIEkgZGlkbid0IHVz
ZSBhbnkgTExNIHRvIGZpbmQgdGhpcy4KCkhvd2V2ZXIsIEVuZ2xpc2ggaXNuJ3QgbXkgbmF0aXZl
IGxhbmd1YWdlLiBBbHNvLCBhcyBhIDE3LXllYXItb2xkIHN0aWxsCmxlYXJuaW5nIHRoZSBrZXJu
ZWwgZGV2ZWxvcG1lbnQgcHJvY2VzcywgSSB1c2UgdmFyaW91cyBMTE0gdG9vbHMgdG8gCnRyYW5z
bGF0ZSBteSB0ZWNobmljYWwgdGhvdWdodHMgaW50byBwcm9mZXNzaW9uYWwgRW5nbGlzaC4KCkkg
dW5kZXJzdGFuZCB0aGUgc2VjdXJpdHkgYW5kIHN0YWJpbGl0eSBpbXBsaWNhdGlvbnMgb2YgX19y
b19hZnRlcl9pbml0LAphbmQgdGhlIHBhdGNoIHJlZmxlY3RzIGEgcmVhbCB0ZWNobmljYWwgaW1w
cm92ZW1lbnQsIGV2ZW4gaWYgbXkgd29yZGluZwp3YXMgcG9saXNoZWQgYnkgYW4gTExNIGFzc2lz
dGFudC4KCkkgd2lsbCBiZSBjb21wbGV0ZWx5IHRyYW5zcGFyZW50IGFib3V0IG15IHdvcmtmbG93
IGdvaW5nIGZvcndhcmQuClRoYW5rIHlvdSBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHJldmlldyB0
aGlzIGFuZCBmb3IgdGhlIGd1aWRhbmNlLgoKSXMgdGhlcmUgYW55dGhpbmcgc3BlY2lmaWMgaW4g
dGhlIHBhdGNoIGxvZ2ljIGl0c2VsZiB0aGF0IApuZWVkcyBhZGp1c3RtZW50PwoKUmVnYXJkcywK
VMO8cmtlcgo=
