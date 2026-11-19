Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795112907;
	b=pdR873gE58LPDyLICjXGKzoBjd4gd2OF+m9Q+TU/TTsQato8JYwNIwbARLP2qBpcAwGU
	 QEZJdsP0lqvIvBYpZ0LaAAW3O5+OIN2fkKi9YJD6iszA5bNbnCpQIdtJLN5TMthFcvYyW
	 shjP+xCqdJw8TMw256AXvG1Q/nlFDTu+FNSsuhDrTemG86eLLpVSsKZF98eKyFM7sDp8m
	 CfINSOylFUOvqKZ4b4dZSwMIHAr4cA6Yf+IuA2t+W2i1TK72hWVBMgk5j4E0u5Gj01raA
	 jQFyN0CTVcFtPBpx6i2g7w5fURbGXaTxghbZajxznDV3BqptPxdpdPP0dchV1/bc0kg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112907;
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
	bh=ryqPL0YSidlIE5vJrWV1DNPhCJGROPkuhoPJm2c/2h4=;
	b=ODRa8Lf+GvopiET39Br7VAnIzbJXKgsF4uHuk1BUpJ+zKsxc0ybq18ShAPA8XyOnSrqa
	 dVRIj+QpXFAPVvhh4gaqwhabsHwwsDsh/HKaDB3pVEioKEBaIyxq5kB2GopFMp/Tj767z
	 JWHeCKJKpw7dwzGJ5z8iEROixkGG6ewwWSgBMnqIazvPKkYmeObN2fStpoprwGTwdZBFe
	 nE3L0yWLNigFlgp0eH6Grpep82bBb9iWv13jRKAxrR6NVZ8yGRZXKJ01HMm3w5HJQTnnp
	 tLxfovtrHjUW7c5ZfNZFCzte5z88gGbyDpQ8xFZTmAPbChkwCkRnXkoBEqVE9g273Kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=EBsSusUH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.28
Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazolkn19011028.outbound.protection.outlook.com [52.103.53.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095C7606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 095C7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=EBsSusUH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1au3hdiUGQi5//kXlqbFO119exFXVpowodr/hSAwQ8pjRTe9wzQuWLgbYHnJhWR2OYsEoW4IlaiwN/3aYtKYyOObkv2QK4FVHSAKkKz6r1+4MK4tyHJoNfskrM5Or3Eza/kqLonxS/Peh7h0e3Y4ltkN6j0l8S+HRSef9EO3QoaZ4NpvIMzh8SH84J0wj/qxdNlOId1pRUAt1rVG2imizZefahj19ECjCage4GLiyOeHznjJ4ihxga8/6BvtiuWV+2By5Y6xVoFuAPDSKumcT7M+e0dDC8DSL0XEWRevs/dA+Rg2pFuDhhzMWAShQWLkVoKbM+tViwAEGpFNqhlmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryqPL0YSidlIE5vJrWV1DNPhCJGROPkuhoPJm2c/2h4=;
 b=ixmYsOzWI/kW5C1TKHcTrudIcDCPMo//DyhxqLlJeAPNbm1ZiFOg5Igc9wpz97U9rzBoUHLeH/+6ruF0yf39bfRH5UQ6itGDWJ5iuT3OozaPXDyfZ+RYusLiHiyv8kacszIY8+PPUtojtvtKQ4Nxa330BlO1Mv7AnNXMBhKei7vU7yFQGjqe8E5JCyT06/ESkw6t5LTVOgD3fAgNWeVPtCp9smcBKjWJkKRCCKuWfz5GWOTm3zVGIUwGXXWUi40LyqXZqR1c37qDZmbJGWMmb+tWVedNCU0eu+qxVGOr/WAF63M2kDeuVLsyd3rQ5AEqwWWchUJw5vojFFPmArPytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryqPL0YSidlIE5vJrWV1DNPhCJGROPkuhoPJm2c/2h4=;
 b=EBsSusUHx270i7QAkhR9QeQI0f3B2zQkXkU3Xzyq0ciSR8SEpgSdrB08WUj7Sxw9TkMdxczji5jCiC75aivXj+ApYzY01fgwvT/OK2Kt4S8H9ebXs2eXQQt3pxgs65RFu2mF92ERggmSFKjsdNH09QDNDfwmJ1FHVs9+yEadALNVQSvzRKACMEtuafi01KRLhXvvk3bMkqeFUHxzyiUZvSnm2a7GOhrqqQWgjH+REt8dJtnXgSV/mzD6JleHK+xd+YUaXluvkofH8s9Cd/a8gW0k2KmysiH8FUmSY29scZUJ6Ef6MUEuEpDsAc9yYCq3iV1oCDWFpCWvH03+rvYqvg==
Received: from WA0P291MB0172.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::6) by
 WA1P291MB130179.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:4b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 18:28:24 +0000
Received: from WA0P291MB0172.POLP291.PROD.OUTLOOK.COM
 ([fe80::1957:c071:8204:8322]) by WA0P291MB0172.POLP291.PROD.OUTLOOK.COM
 ([fe80::1957:c071:8204:8322%7]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 18:28:24 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "clemens@ladisch.de" <clemens@ladisch.de>, "arnd@arndb.de"
	<arnd@arndb.de>, =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?=
	<habilerenturker@hotmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
	"syzbot+fc3a448093c17a792368@syzkaller.appspotmail.com"
	<syzbot+fc3a448093c17a792368@syzkaller.appspotmail.com>
Subject: Re: [PATCH RESEND] char/hpet: Fix missing TASK_RUNNING before
 put_user() in hpet_read()
Thread-Topic: [PATCH RESEND] char/hpet: Fix missing TASK_RUNNING before
 put_user() in hpet_read()
Thread-Index: AQHdeFPCUE10c4cdFUKZQgMGtPiX5w==
Date: Thu, 19 Nov 2026 18:28:23 +0000
Message-ID: <20261119182822.60160-1-habilerenturker@hotmail.com>
References: <2026111926-finisher-captivity-64ce@gregkh>
In-Reply-To: <2026111926-finisher-captivity-64ce@gregkh>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA0P291MB0172:EE_|WA1P291MB130179:EE_
x-ms-office365-filtering-correlation-id: 27533b96-4a01-4dc6-a026-08df466ae56f
x-ms-exchange-slblob-mailprops:
 vuaKsetfIZn9IFDOZRHBr3PkJ6iE+FIkEyYaFnOAKWzmaqS/eky9NzaNI0AAvIlNK6dkhDfbR59ByiL8/+l6fPr6Myqb0uwrrokVzAuODBeM2g7ZYQJqCmX7Y0AX1OPmr8PiDW8Q6jKXvAmfSDtQDqp9R/KjKbpRTSQssRUq5WktDocmw/j2f2L8vrgDrs0RPt+DzZeVjuGbi8lJQCmht4hJy281i0x5SmQQbL5yS+Pc/hAgRZ2ztM8NgEYOAJ6Mg5FAqXff+J6ORI249JW+mQLbXWC+L4fBYkpltn7X47LDuk2J/YLKTegjGqwDnvzFZ/ymyAawdk5WvoGx1BZk7mP0qmt5FWLjpP3Jb4zd8Vie5hk6Ow77FYS8+fzmnvOcxVePONtQ88MZn0bq80+20k6nuxuuUONVInZ1WqsP/O0NbQzi1cPyRzoTEq4M+nLBxykR/Z4zXN8qZYXaMxMPlxNvPiWWH6bfX77cfr2t3aYr1u4yYQ4u5tXRUe32L24tisD8MMJOjGBvicYotEaqwVq7Ws84uk1E8+s1dR7JkUkMDviU110r3sP9mVXBWo/v3MWXE4s5W/E5I3O1PbL7lmtHw2HVY8/2hKiyir6PCWCSqnGjY3Nw21i4+unCw0nuWVlEhDe54w4dupinkO6V/aqluDiraRu9aqhl7HJt0xrjgDwrej3wjCde8QpTUJB4ErDjMzLyvJgPcPHPtox5naCnHsN0JqtRKp3/wVx447v6ASdbtHLvT0YhfLtmqRzfO5o6HwRQshfbjj9POGcqopkFauBkWHH/yAhWW5E84uPB3JSrPRPBIhJVMZrADHIa
x-microsoft-antispam:
 BCL:0;ARA:14566002|24021099003|15080799012|38102599003|21061999006|31061999003|8062599012|8060799015|19110799012|55001999006|51005399006|25010399006|440099028|3412199025|102099032|40105399003|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?MTNaRkYvVHdRaUFGZktsQytOWkh0UStkUVRtM1JJYW56UDVRRE5qMk1IZjNI?=
 =?utf-8?B?SkxFaWZhTnJjNk5tRnJVRnpyRG5jaEd3TWJGeFdoVmx0SG1VMEZsWlZmTUY5?=
 =?utf-8?B?M0JJeHFsRUR3VThqdkxOYVhJZ3ArTHRJck5mdG0xSEF2Zk9IcXZQWXBLNVl4?=
 =?utf-8?B?NGNjT2Y3Y3pocVdtZXZCZHZDY2FBc1VZb3VuM25qRXI0MER6VGNSUVlWbmgr?=
 =?utf-8?B?Tkk1cjlpRWwreXMxME0vM1pybm5VWUpQUU8vOSs2ZXFlbTFBTUlMVVF1Q041?=
 =?utf-8?B?QzBNbnBIVk00dkZBZEV1ZHdWdDdpK2E3K3d5MnFzLyt0NHZGQmZVeDFvQXVt?=
 =?utf-8?B?U095R1JiMS9ta3gzVE9CQ1BEU0VZcGVxSi91UWJYNi8xUjk0YWpERmhWcFhn?=
 =?utf-8?B?bWNKb0xiMU8wRVBWV25BRnoyeEVuT2wzZFhXKzFxYWp6Y2R4Y3pwa2xwZGx3?=
 =?utf-8?B?MGxsSG5OdkVFMGpPWXU1V0NNQU9rc1RBWnppNk90RXVPTm82V2F4MXJuVjF1?=
 =?utf-8?B?NGw3b3ZHR3NoVjJydDg3OXdXVUYyTXk3Z3JMZjhZUUpsOVdqUmhFeUJ3SVZp?=
 =?utf-8?B?TUJZb2ZLcTkxb2VsNEFXZmJBWkovMjI5cWxOb2JkMjlETi81bUdldGk3Z2pn?=
 =?utf-8?B?M0RENkZPc0hHMWZMamNORGJoU280b08xQ0FZWHBBL0lBa3JJQ290UkNlaCtM?=
 =?utf-8?B?Zm5PbFVxeGV3UjhSQWhPUjdiYkRybVQ2ZC9iMEhVZDJNSVJqS28vUUVzNVdR?=
 =?utf-8?B?Tno4N2lTOXQ1a0NCNWkva2c1NzRmNzAwcHM1VkdEMjdkVG0zT29IRkx5anBn?=
 =?utf-8?B?Y1VwT1FuNnpNOUtvTUNMK09DRWpEMVlFekIvM2lhVTlPTkN6TW0wZUYwc0l5?=
 =?utf-8?B?MGZETzdOUWZzeXpqRFJpVkIxeUN2blVxclpNS2N6ZzhsN1BtRWtLeVIxNU1m?=
 =?utf-8?B?YVNKZmFFdTUxZW45SXp0eGdRNlQ2RmNqVFhPaUdNc3ZPM0FxdTNSUCtyVzlQ?=
 =?utf-8?B?SFZYMjFzQTlhdEdjSlV6VzFpRU13SDIzZUlmWCtsNmRoWElxS3kxeStPNGVu?=
 =?utf-8?B?R0hIWFNieE1JVXlWWVZPV3BZRVF4TUo4VFp1eUhVVUZoc0pVaFBPRnorOWtZ?=
 =?utf-8?B?blMxcnU5d0ZNYlZDNlFpRlhSQXkySlhxdytoWFVjZ1cxWUpjZnJ4M3BUeklv?=
 =?utf-8?B?dzl1VEtJZHIxbGNaYlhFQXBhN3dWY3E2elJIQ0dmZURvdFZ4QW9ONWh3dFRN?=
 =?utf-8?B?ZVBnWTJTUmpFOEE4bWpXNTR3aEdYTmM5RXZ3aGoyWTQ5WHhCclFPaE1BYVRz?=
 =?utf-8?B?VTRJdGRJYXlELzBlR0RMWklxWXo4THR0ZkdUUENyT3M4NEVJQWhiVW5oYkF0?=
 =?utf-8?B?U2REWHlKUXBVSExnamxQNkl6Qm4rTGI3dXEwengzOXROWHJiS1VQMm5heDFn?=
 =?utf-8?Q?n7Bp1iHU?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aEt2U0YvSEJDdWVUdWJabjRsQ0pjdDlRNXNrRHZFRjlJeFVTZEQvQkNxOUFn?=
 =?utf-8?B?bDZpQURGeFpRR1pPOU1HQmNnRmUrbjVaZXdSL1JFaHlUZTlFa1RVS1B4U05O?=
 =?utf-8?B?aHRjL2Q4bWxlYThEMlNXRzdzVHlZUUsvSmFKblJFRVJqNlE2Ti9rR1A0ZUNp?=
 =?utf-8?B?T0VKemdzTWo0SjEvaFl6WjgwN1BWT1RIeWNIa0UvSlB6REcwRzhzcTQ2V21r?=
 =?utf-8?B?RUFpbVBibVUxV0tRaTFqVDBNSzBSbnlnOVVha05GYXJ2c0tqbGJERVJ5UHk1?=
 =?utf-8?B?S2d4SlU2bklka2hSSW9URTMrR2pBajlycVo5UlVnWFh2dGJMZnpJRlQrN0px?=
 =?utf-8?B?L1JsTVNLbkpZZTdUV2hFeE5mcFZFYlU4UVNrUDhpNWs5UXBSenFRMW02YXM4?=
 =?utf-8?B?M2hzTDF4V2hyQzdWMkRZNllmUXNQTGs4RXBPS1B2YzRzTE9GRXU3RWw0QXZD?=
 =?utf-8?B?M0QybTZlRlQ5UUlCVHc5UncxUTZBTjhCcUk4OGN4TTBUcEduRy9xektOazBi?=
 =?utf-8?B?U1RGOTB5dDNiR3g0VVROYkw1OVRNb2xoRVFaN1NndHBld0RvaTFDMkpTOXhv?=
 =?utf-8?B?RnBZYjBvQ04vbWpwenBQR2xRQmUzS3YxVGhpNDN0cVJvdEp4Z0tkRnRvbEZN?=
 =?utf-8?B?d0dBZkt5REVndHZYVUVwZ1RVaytpNFNOZUh5L2hsRUt5RXFGSDRPMHVMZDBm?=
 =?utf-8?B?aEhTZk9Pb1pFbVFZcmVjUlJTaTJPNngrRURZcWJZQTFnSDB6MmIvcnVnYkRF?=
 =?utf-8?B?Sm1oejBacWVKbjdIRG1PRStnQi9DbHBnc2w3RjhsYThPUDR2ZTBCV0Iybm0y?=
 =?utf-8?B?OVF2UXcrTWVMQk5UVk5OMHlyTUIyak1OU01kMjBYMjRIbjk5VE1VNHhMOHBE?=
 =?utf-8?B?blVlekdWK1Bydlc0ajAxSW9WQ2xyQTlSMXlzNWdOU3c4SXZsVHUyK0tHMXd2?=
 =?utf-8?B?QXd0Y0xKQlhKQXArM1drYkMzVmhkc2xVWVFxMFUwQzMxc2h4WjNWN2VIQVR3?=
 =?utf-8?B?TXlmazhMOXJLeWtvRUhXZ3RRSnE5YTRrcXNrNEVod3MyUzR1MmpwQ3dsRlZC?=
 =?utf-8?B?enpKeS9sT1RxY0xNMXVUQXowNkVQUE9xVlZwa3Q0UlNaRkVncWc0VWxrQlNa?=
 =?utf-8?B?ZU11RWE2dUJ3YzE4N1JNSGRsbzNFZGtlamxjT292VnRvQ2NOL2NnL2EvWGVt?=
 =?utf-8?B?RVg4QTliMUVCOHNua1paaVVKQXc2OGNyRXVWeDA0OGdHQU5NM25wcER2QXE0?=
 =?utf-8?B?a01JV2hac2xnb0ZveW15U3RaQ2lhd1d1OHZFMXVKMVhvcFlUQUdCOWM2OTVL?=
 =?utf-8?B?RzFKY204YUdTWlcwMm11TGhaVFVpaHhYWmNMakU4WFpRWCtoQ2hqdVZoemxj?=
 =?utf-8?B?N2w1OWl4dkZiQmJlTUdIeXRseTF2MldOdi9PNHUvdWRZYTNXcld3ejhKc1RD?=
 =?utf-8?B?T21oRDJrN3ZJYkRxenRONlhkczdEZ2JCM0J4OERUMSs5SUZlT2xoSzJ3QnFt?=
 =?utf-8?B?L0tpWmE0SGxza1JsY1JQOEJnU1lPc2pCay94bnNUeURCZ2l2WnQzdnRxTDYy?=
 =?utf-8?B?bDUzYjY0ZUVMTlNBU0x0aldXREZmS2ZlTjFuV0JxNjRLa3E3UklZTGN5V1V3?=
 =?utf-8?B?QnlVR3ZwNmV3K2lBa1hDaEhUUXJDZWVMNlRpVUlwbFcwWmZsd2lMRklPL2ZJ?=
 =?utf-8?B?MEdKZk5LNkN2eVlPMFJGcnVWYWQ4NFNLN2t6ZHVyYUMrck16Q2crV041SHNh?=
 =?utf-8?B?dFdYQ3k2TFp5V2w3NlVqSHVGVVFQRlJ4djhMZmZwNTZ0L1dtWGVTQ0IzQjJR?=
 =?utf-8?B?UEUvZkhXS0RKU0FIZ2M2Wk9LcU1MRFBZdmM2MFRpVEYrVG04YmFManJQYWQ2?=
 =?utf-8?Q?76RitmslanlGP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0646C866A432EA4AAE2F66CAA0ADA6EF@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0172.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 27533b96-4a01-4dc6-a026-08df466ae56f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 18:28:23.9334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB130179

T24gVGh1LCBOb3YgMTksIDIwMjYgYXQgMDM6MDI6MDdQTSArMDAwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IFNob3VsZG4ndCB0aGlzIGJlIHNldF9jdXJyZW50X3N0YXRlKFRBU0tfUlVO
TklORykgaW5zdGVhZD8KClRoYW5rcyBmb3IgdGhlIHJldmlldy4KWW91J3JlIHJpZ2h0LCBzZXRf
Y3VycmVudF9zdGF0ZShUQVNLX1JVTk5JTkcpIGlzIG1vcmUgYXBwcm9wcmlhdGUgaGVyZS4KSSBk
b24ndCBoYXZlIGEgc3BlY2lmaWMgcmVhc29uIGZvciBjaG9vc2luZyBfX3NldF9jdXJyZW50X3N0
YXRlKCkgaW4gdGhlCm9yaWdpbmFsIHBhdGNoLiBJJ2xsIGNvcnJlY3QgaXQuCgo+IEFuZCB3aHkg
aGFzbid0IHRoaXMgZXZlciBiZWVuIG5vdGljZWQgYmVmb3JlLCB3aGF0IGNoYW5nZWQgdG8gY2F1
c2UgaXQKPiB0byBzaG93IHVwIG5vdz8gIEFuZCBiZWNhdXNlIG9mIHRoYXQsIHdoeSBpcyB0aGVy
ZSBub3QgYSBGaXhlczogdGFnPwoKTXkgaW5pdGlhbCBjbG9uZSB3YXMgc2hhbGxvdywgc28gSSBm
ZXRjaGVkIHRoZSBmdWxsIGhpc3RvcnkgYW5kIHJlcGVhdGVkCnRoZSBpbnZlc3RpZ2F0aW9uLiBJ
IHRyYWNlZCB0aGUgaGlzdG9yeSBvZiBocGV0X3JlYWQoKS4KVGhlIFRBU0tfSU5URVJSVVBUSUJM
RSBzdGF0ZSBoYW5kbGluZyBmb2xsb3dlZCBieSB0aGUgcHV0X3VzZXIoKSBjYWxsIGlzIAphbHJl
YWR5IHByZXNlbnQgaW4gdGhlIGVhcmxpZXN0IGF2YWlsYWJsZSBHaXQgaGlzdG9yeSwgaW4gdGhl
IGluaXRpYWwgR2l0CmltcG9ydCAoMWRhMTc3ZTRjM2Y0KS4gSSBjb3VsZG4ndCBpZGVudGlmeSBh
IGxhdGVyIGNvbW1pdCB0aGF0IGludHJvZHVjZWQKdGhpcyBiZWhhdmlvci4KClRoZSAyMDEwICg1
NDA2NmE1N2M1ODQpIGFuZCAyMDI0ICg0ZTYwMTMxZDBkMzYpIGNoYW5nZXMgSSBleGFtaW5lZCBk
byBub3QKYXBwZWFyIHRvIGhhdmUgaW50cm9kdWNlZCB0aGUgaXNzdWUuIEkgY291bGRuJ3QgaWRl
bnRpZnkgYSBzdWl0YWJsZSBjb21taXQKZm9yIGEgYEZpeGVzOmAgdGFnLgoKSSBoYXZlbid0IGlk
ZW50aWZpZWQgd2hhdCBjaGFuZ2VkIGluIHRoZSB0ZXN0aW5nIG9yIGV4ZWN1dGlvbiBjb25kaXRp
b25zCnRoYXQgY2F1c2VkIHRoaXMgaXNzdWUgdG8gYmUgZGV0ZWN0ZWQgbm93LgoKUmVnYXJkcywK
VMO8cmtlcgo=
