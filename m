Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.93
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794962223;
	b=qgfE/6T9UgF+CFeyFruiLL7cnTPvtTvpN+kHT1uSf7Ap0SzGPSPWDHn8LIj/uvvU4Ua8
	 w7Tsh40ugfIsewvRwuryhvFselKlHtvON9Ep01+Wv5Lw/JdUpQOP/gNp7dCSKNijt2D4b
	 ioGm3UVxpuQhu3HSqpg1ScHIJMp5UYlh3y0chR2EH4XctcI3AmMmbPDDcLMIrRG/RSR7a
	 bd/NpyEZsthpJOrMm68xeZE2PRzaLJavISQTr4Yzuibmi7+G8sVqL7ELgee9xzMwOluGj
	 +Qkz7Q60Zr6fNTD1yZoqanZaJXfseiGAapErYd4QFUooe6Pe0hZJZp8NkM93M3jdd8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962223;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ZBiyzhz3qvvfSiM0CKHZsWk/eCZxdIhYU99JNgL5s4Y=;
	b=H+ubCM7iTMZJ2mD4mVUpf93PA+zyqWMGtjMU4ULoHuatfX/TVwPGQVA7gVyMlYgZUH4O
	 pDXYywM4LdUEpBvYKqZgk6/kpFzzpQg18gT5UX/xrG8Gmhzxmfjbt77CKbOUSYaEl95ey
	 vN5lqH4AEctQBkKVh1Usmed1mIxZ5SlKPVitbD2xR+0qe/PBFTSFGQhEE2dPRPhLlJIgj
	 9R+4o+tCi967uzGt8iXgIx/SKyrSE2xUTAhDUTHiY9UTzDVlSgO42VCpAx6Zt0xMhWRTY
	 TLQrPteCXvhMwodKgIXE5FGz99Zc/ssFxamq9pYOEbPml8kias3jWO5OWGmBO5TK86A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xcena.com;
	spf=pass smtp.mailfrom=xcena.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.93
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021093.outbound.protection.outlook.com [40.107.42.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCB1606A880
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DCB1606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xcena.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xcena.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0G5VGWgEWDvXAzja9oFOQIgbA2OxcPY9jTFlSHyVXFHJdvYk+n217wLhbFcrMbDH4m+VqGAj968glQBMnp6EVN4TIKJr4C7Ujvfxz5ZJQgLoj6cjyzMa1U+gIqJa6sQC9JSZTzkM+TGfLcRjHtSM+U4Ih5fyNkOR5NKEChnWbcZy1rFqH7IBEW0u6DY8OSRRUxLlp4ty2xmTbKVmSKtw2DVR5dDIl7lOvjLP9/Sx09N+tQHW1/YjTV4BsnNU82OgP+IAhmhaIkK9I4XzWijAn1d7fSh+Q/Rm4VaQJGLVusANqR/0pKslSTiwH6f0KkbKf4VRz5X1bYJwincKLtonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBiyzhz3qvvfSiM0CKHZsWk/eCZxdIhYU99JNgL5s4Y=;
 b=l8qaIxlUzYhy4Nvt1XUbhwlrVZVu5FDGHV69x0jnjabp8U7x58rCJRnY2IW5HJXHi3iIjazu2CoNS2RixrGcKMYVusA2fWjv+dW2HrkH+lf8HO89lfVTpTtt5JUAKIP+fBjB8GrcEr3DVYBzlFr9mhqPmr/VxLz1e//Bcl+MjNN61YQ7sjqj+0b9entiC3HU/MtXJwh0q5eOS9nxhHTItHPMIfXUocKRHhC55j6MMcD/zGDMxJZlu1JGzQntM9FQKGtN/OZZO9zdE7IOlvyJtAewdVDYzMIG/eEWgbzctUiSb9CmJty2RGWsG5wvDI+LkNQDG/t1X110gApEaHidKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xcena.com; dmarc=pass action=none header.from=xcena.com;
 dkim=pass header.d=xcena.com; arc=none
Received: from SE1P216MB2499.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1d1::9)
 by SE1P216MB1911.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 00:36:58 +0000
Received: from SE1P216MB2499.KORP216.PROD.OUTLOOK.COM
 ([fe80::ab34:dc28:aeb6:23e]) by SE1P216MB2499.KORP216.PROD.OUTLOOK.COM
 ([fe80::ab34:dc28:aeb6:23e%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 00:36:58 +0000
From: =?utf-8?B?7LCo7KSA7Zi4?= <junho.cha@xcena.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Matthew Brost
	<matthew.brost@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
	<thomas.hellstrom@linux.intel.com>, Lorenzo Stoakes <ljs@kernel.org>, "Liam
 R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mm/migrate: drop the fault lock and wait killably for
 migration entries
Thread-Topic: [PATCH] mm/migrate: drop the fault lock and wait killably for
 migration entries
Thread-Index: AQHddnXOOiHBVYNtcEeNy1c5wTrk1LcyBBgAgAD4pdA=
Date: Wed, 18 Nov 2026 00:36:57 +0000
Message-ID:
 <SE1P216MB24994BE82B29119A699E5CB9F67A2@SE1P216MB2499.KORP216.PROD.OUTLOOK.COM>
References:
 <20261117-junhomax-fix-mm-migrate-killable-v1-1-f6e7b135a159@xcena.com>
 <d463af46-13c3-47f7-8b26-702a8edcd140@kernel.org>
In-Reply-To: <d463af46-13c3-47f7-8b26-702a8edcd140@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xcena.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB2499:EE_|SE1P216MB1911:EE_
x-ms-office365-filtering-correlation-id: 15c1dc2e-3334-4539-bb77-08df450c0d92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|376014|7416014|23010399003|366016|6133799003|18002099003|22082099003|261009223027099003|56012099006|4143699003|261102123227099003|261028144727099003|10067099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|5023799004|38070700021;
x-microsoft-antispam-message-info:
 59AmIkp+gqUaX16XtSV2vmCQRuywyUuN+rSkmsMAN5fM9e+S/E6/hUuWDfmNFt/Kf7WIPOSMzezEsbfOiVPTdD2fCUusE0/9JhnBOjfNIZDqq9OmxrQkqS6KoGO2ZfJP55Zw1l8RfzkxmwiVGNphEtBA2XaqJImRAkEAuX1dYuVTsKnupmm7Jbuf/jIN2d2m7u7amHJGPC9VUDbyHBAspcAwVoxwL/787IPMQmf420bDhbRYiAL/x9X1a8HS+vjBvwGReA+U6lbP76Dq7lZtKTxFl26brG4chFLxgFtldm0ZeXRijOx2K3w1OokBiiiFLf0AXQQE1MAnu7vycVNIoBrAvfQssZhbLZypQELI7Ov19E03Hol7lQBjHMWQTsCAOP9QJgJNKavYmpxXqHUaDJLM46wpaEsputsN4R2A8a33l2sDmeFAwggbWqpvz3yBAWR2fXzzOmod3GFG01wP7liFfToKFn4JJwmKnPSzXt9gF5tEfor+mxH7u5YUHhQkCzDQ+MGx52etWQ7nrqbJlC2fBnc5n6LktS/R01SOcjVQOtpG3ZA2ahIZI7Uv5LnX/bDGDTb6Hrjom88BZ3ukokZ3N10x2AlRNl46WAR8+0T7/pVC5DutGjbl+BSUOSUOgdFmtCCLx0yS553TTTlSAf0U1OdRDCAKHr8Vbu68GDiK2tJhOaOBKooGNVejwttKBHy5+syy/Qh9xuXnaSwbzxVW3WULy5ILq/MxDhKYT+w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB2499.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(376014)(7416014)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(261009223027099003)(56012099006)(4143699003)(261102123227099003)(261028144727099003)(10067099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(5023799004)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?emQ1d3U3U3RETTdrZTdnMjJGNGZUanZpQ3BTL1hDRWdZcUw0eWRmU3hrTFlj?=
 =?utf-8?B?bXdLL0dBMjVSUWNDRXJUV2NtcTNiYTVtQzBZS0U5WHFNRzRJTmhKcjB1Z21U?=
 =?utf-8?B?N3dia3g0aTV6amtUY1E0OFl1Y2hhUWZReExSZ0M2YU9OWjNOVnEzdWgrbW9k?=
 =?utf-8?B?MjhFdUxPdGxWTS9lczBZdkZNVm5nL1paZ3ZBMThiTHhvSFVKUUNnUzJVT2ds?=
 =?utf-8?B?UVdMc2F4S0NZbHd2RFhmRHh4SEYzTVVlVTErVWJIeEVDQU1KYXJmVWtqMmpi?=
 =?utf-8?B?d3REbU1wYTBSSTY3Y1lUQ21qa0RaOFloeUcrVVp0ZjNBMDY1WkNjaG16RGRz?=
 =?utf-8?B?bXVmTm9SeW1GVGxxT29JMGZjLzgzN0NsU25PcDR6YnBWWjIrQ29vT3I0K0pV?=
 =?utf-8?B?MmFra3pyT1M2NUtQa0J6MUtmcXJYaEFBMjUva3BCVEEwU21OTmJqWnlXSlRI?=
 =?utf-8?B?Z0tITmVCa05kUyt3SmE3K2taQVNnNmtrZ0Y5eHJ2OFhSU0hLSVI0WDdLdE16?=
 =?utf-8?B?L2xWV3hRNFZ0V2hQbEVuSlRaVm12MGNZWlBnakl5dVRJUldNOHBWZk9xbCsw?=
 =?utf-8?B?U244cW9JTWlWQWticEZLMXFyRUZNYU1lcGUwWE81eTE5aHVOQ1lNazVsTWxx?=
 =?utf-8?B?SVBRNE1uOURaR0JlQXc4Tmtpdm1CZDd1ZWZiRmJOV3J3SlIraGU5QUtXUVdw?=
 =?utf-8?B?clltV1h0c0FJTEkvSDU0ekNCTjg2aGN5RjBSSTR5a0YwajdXR0FseVE4Ti9N?=
 =?utf-8?B?RTNqWVdoY0ZSRU9mNFZsK2dWQUtoVUwvd2ZITzVmSHUwa1hpbExnTWo2QzhF?=
 =?utf-8?B?clArQVFtZjRIQmJETlVhT2NNa25lNmt1M2pCUFFUL2hOYlJjcEttMitIMDN5?=
 =?utf-8?B?K09RbG9NSG4vanlCdnZrK2VLZTR2bUlndUs3VUg2MjFBdEx5bGJNSTB5T1JI?=
 =?utf-8?B?R0VaZThYOVVxRlBRc2NqamlsQnpmNFBOWCswOVFHa3VzbVN0NzV4NVlqQUNq?=
 =?utf-8?B?K1A2cG5KVmdqa0R0Nk5PckgvWXBqT2VQaHhua2RhTkFsckt3ZmJFdlE1KzF3?=
 =?utf-8?B?QlRSaWlsOXJVZ1JpQ1RIMHQrdXYzbjQ4cHNmR2VHTkJXNFVaRWxrVDhrMXIy?=
 =?utf-8?B?UGt4VnRsUERKUDRZL1phSFFVZjFVVE1KaHhRNEhlcSthbnkyZmFqNkFMbXFY?=
 =?utf-8?B?cEZ0REZueVc2UjRnVWdoMVNjS1B6elRGUFRYVFBkZ0hMeXFKbXQrTEc2STRn?=
 =?utf-8?B?OER0eENqWUNVazdueHdMSUlZdDVTZ3lQK1JJaGJiclVTUkEwaEQxZ1g1UnRB?=
 =?utf-8?B?YWxxM2pwYVlZQVFVQTZmak9saGo3TythRzZlTTNHL1VyNVdRTW10Uk1yL3VD?=
 =?utf-8?B?N0pWL001bE10b0ZZMWwrRThpUkp0NWEzcXFydjRJOGRlY1hWaUpCei9xSTd0?=
 =?utf-8?B?cjQ0NmtJUDNDRVlGcWFweTY4WkVXQ1lCNU1lOGJ1bXNkSTdBbE1CWGNUV1Zm?=
 =?utf-8?B?OTE3REtmaDZUVC92QWtac1pRa3BRaEk3dloyQ3FkN28reGV4d0dJeEh0bGFT?=
 =?utf-8?B?TjI3ZlRlS2IvZHNQUHZKc1ZHejU2UWRZSHV1T2tma1F2NnBUajZJam9kQWFy?=
 =?utf-8?B?di9FUFFWeTRuZDBYbXFYUUk0RjVCSzN1aVhnVEEyV04wYVpMQ0ViU0oydGpD?=
 =?utf-8?B?WDJ6TFFDbnhEamNabGQzNVhKM0pSOEh2bE4rcnJWNy96Z1ZIc0VmUEZjVEVu?=
 =?utf-8?B?RlJDS3V4SW5IR2E5S3dNaVppZS91SjZPY1BibWRpbDJYSkdiZEU2bFc3ckpJ?=
 =?utf-8?B?Y0gzY0lhUEtZcmxRT2pKc05kY0ZHQ0tJUmsvd0tpWnNiaDJMekFTU3ZRaFpu?=
 =?utf-8?B?WjFwS3dwOTA3cHVZeXVoRDN0V05uM096VndSL2RVQm1YMENXamF1eGJvMDdY?=
 =?utf-8?B?VzcxTnVhYkhZZTRjcUZ0WDE1RENIWWxyTUovYVpJdC9qdWY3VlFBbEhaMXFh?=
 =?utf-8?B?Qlg1VEN1NnpTNUZycEU1TEtWV25DaTRPc3AyV09CRXpxWExCbW4zZ3lOTnBi?=
 =?utf-8?B?Y2ZWR3JxTXFXbFNPNVpJMGx4Mno3Qit4TU5lY0h5UThyZyt2TFE2MmFtd1Zj?=
 =?utf-8?B?bENNUThPMW5sOVpoem14bGM3WlU3VkU1b3hoSXc0elFLN2V0K0d6MnkwUUtR?=
 =?utf-8?B?U0IyWks1bkczcmJ5N3o4QTFoTzhQaVc4TmNqVVRnQ25hTjlJaGNMTmd5aTA0?=
 =?utf-8?B?UERZY2o3bVg5RkhSdmgzbVdkZzExY1pIQlVEMEJVT3p2eUtHSlpReE1nM0Vy?=
 =?utf-8?Q?WPVgu6QccuxgnFl/mC?=
Content-Type: text/plain; charset="utf-8"
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
X-OriginatorOrg: xcena.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB2499.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c1dc2e-3334-4539-bb77-08df450c0d92
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 00:36:57.8842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b6b27f63-aa52-4904-bb98-c040d01eb7f9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RdmTVp3AnrUw9rBiaeijUZx+BBEsNm1wazfTerAJAdP0sf2y3s/rE+jPhP+OyccWUIK0WNVll54Cb/zcm2Xxmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1911

SGkgRGF2aWQsIExvcmVuem8sDQoNClllcyB0byBib3RoLiBJIGNhbWUgYWNyb3NzIGl0IHdoaWxl
IHByb3RvdHlwaW5nIGFuZCBvbmx5IHJlcHJvZHVjZWQgaXQNCndpdGggYXJ0aWZpY2lhbCBkZWxh
eXMgaW4gbW92ZV9wYWdlcygpIGFuZCB0ZXN0X2htbTsgaXQgd2FzIG5vdCBoaXQgaW4NCnByb2R1
Y3Rpb24uIEFuIExMTSBhc3Npc3RhbnQgd3JvdGUgbW9zdCBvZiB0aGUgY29kZSBhbmQgdGhlIGNo
YW5nZWxvZywNCmFuZCBJIHNob3VsZCBoYXZlIHNhaWQgc28gaW4gdGhlIHBhdGNoLiBTb3JyeSBh
Ym91dCB0aGF0Lg0KDQpVbmRlcnN0b29kIG9uIHRoZSBtaWdyYXRpb24gcmV3b3JrLiBJJ2xsIGRy
b3AgdGhpcyBwYXRjaC4NCg0KVGhhbmtzLA0KSnVuaG8NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IERhdmlkIEhpbGRlbmJyYW5kIChBcm0pIDxkYXZpZEBrZXJuZWwub3JnPiAN
ClNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDE3LCAyMDI2IDY6NDYgUE0NClRvOiDssKjspIDtmLgg
PGp1bmhvLmNoYUB4Y2VuYS5jb20+OyBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRp
b24ub3JnPg0KQ2M6IE1hdHRoZXcgV2lsY294IChPcmFjbGUpIDx3aWxseUBpbmZyYWRlYWQub3Jn
PjsgSmFuIEthcmEgPGphY2tAc3VzZS5jej47IFppIFlhbiA8eml5QG52aWRpYS5jb20+OyBBbGlz
dGFpciBQb3BwbGUgPGFwb3BwbGVAbnZpZGlhLmNvbT47IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcu
YnJvc3RAaW50ZWwuY29tPjsgVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGlu
dXguaW50ZWwuY29tPjsgTG9yZW56byBTdG9ha2VzIDxsanNAa2VybmVsLm9yZz47IExpYW0gUi4g
SG93bGV0dCA8bGlhbUBpbmZyYWRlYWQub3JnPjsgVmxhc3RpbWlsIEJhYmthIDx2YmFia2FAa2Vy
bmVsLm9yZz47IE1pa2UgUmFwb3BvcnQgPHJwcHRAa2VybmVsLm9yZz47IFN1cmVuIEJhZ2hkYXNh
cnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+OyBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT47
IGxpbnV4LW1tQGt2YWNrLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KU3ViamVj
dDogUmU6IFtQQVRDSF0gbW0vbWlncmF0ZTogZHJvcCB0aGUgZmF1bHQgbG9jayBhbmQgd2FpdCBr
aWxsYWJseSBmb3IgbWlncmF0aW9uIGVudHJpZXMNCg0KT24gMTEvMTcvMjYgMTA6MjYsIEp1bmhv
IENoYSB2aWEgQjQgUmVsYXkgd3JvdGU6DQo+IEZyb206IEp1bmhvIENoYSA8anVuaG8uY2hhQHhj
ZW5hLmNvbT4NCj4gDQo+IEEgZmF1bHQgdGhhdCBmaW5kcyBhIG1pZ3JhdGlvbiBlbnRyeSBzbGVl
cHMgaW4NCj4gc29mdGxlYWZfZW50cnlfd2FpdF9vbl9sb2NrZWQoKSB1bnRpbCB0aGUgZW50cnkg
Z29lcyBhd2F5LiAgU28gZG9lcyBhIA0KPiBmYXVsdCBvbiBhIGRldmljZS1wcml2YXRlIGVudHJ5
IHdob3NlIGZvbGlvIGlzIGxvY2tlZCBieSBhbm90aGVyIA0KPiB0aHJlYWQsIHNpbmNlIGNvbW1p
dCBiNTcwZjM3YTJjZTQgKCJtbTogRml4IGEgaG1tX3JhbmdlX2ZhdWx0KCkgDQo+IGxpdmVsb2Nr
IC8gc3RhcnZhdGlvbiBwcm9ibGVtIikuICBUaGUgd2FpdCBpcyBpbiBUQVNLX1VOSU5URVJSVVBU
SUJMRSANCj4gYW5kIGtlZXBzIHRoZSBtbWFwX2xvY2sgb3IgcGVyLVZNQSBsb2NrIGhlbGQgdGhy
b3VnaG91dC4NCj4gDQo+IFRoYXQgaXMgZmluZSB3aGlsZSBhIG1pZ3JhdGlvbiB0YWtlcyBtaWNy
b3NlY29uZHMuICBJdCBpcyBub3Qgd2hlbiB0aGUgDQo+IG1pZ3JhdGlvbiBpcyBzbG93Og0KPiAN
Cj4gIC0gVGhlIHdhaXQgY2Fubm90IGJlIGtpbGxlZC4gIFRoZSBzaWduYWxfcGVuZGluZ19zdGF0
ZSgpIGNoZWNrIGluIHRoZQ0KPiAgICB3YWl0IGxvb3AgbmV2ZXIgZmlyZXMsIGJlY2F1c2UgVEFT
S19VTklOVEVSUlVQVElCTEUgY29udGFpbnMgbmVpdGhlcg0KPiAgICBUQVNLX0lOVEVSUlVQVElC
TEUgbm9yIFRBU0tfV0FLRUtJTEwuICBGb3IgZXhhbXBsZSwgaWYgdGhlDQo+ICAgIG1pZ3JhdGVf
dG9fcmFtKCkgaGFuZGxlciBvZiBhIGRldmljZS1wcml2YXRlIGZvbGlvIHdhaXRzIGZvciBhDQo+
ICAgIGRldmljZSB0aGF0IGhhcyBzdGFsbGVkLCBldmVyeSBvdGhlciB0aHJlYWQgdGhhdCBmYXVs
dHMgb24gdGhlIHBhZ2UNCj4gICAgc2l0cyBpbiBEIHN0YXRlLCBhbmQgdGhlIG9ubHkgc3ltcHRv
bSBpcyBhIGh1bmcgdGFzayB3YXJuaW5nLg0KPiANCj4gIC0gVGhlIGZhdWx0IGxvY2sgaXMgaGVs
ZCBhY3Jvc3MgdGhlIHdhaXQuICBUaGlzIG1hdHRlcnMgd2hlbiB0aGUNCj4gICAgbWlncmF0aW9u
IGl0c2VsZiBydW5zIHdpdGhvdXQgdGhhdCBsb2NrLCBhcyBmb3IgbW92ZV9wYWdlcygpLA0KPiAg
ICBjb21wYWN0aW9uIG9yIG1lbW9yeSBvZmZsaW5pbmcuICBBIHdyaXRlciB0aGF0IGFycml2ZXMg
aW4gdGhlDQo+ICAgIG1lYW50aW1lLCBzdWNoIGFzIG11bm1hcCgpIG9mIGFub3RoZXIgcGFnZSBp
biB0aGUgc2FtZSBWTUEsIHdhaXRzDQo+ICAgIGZvciB0aGUgbWlncmF0aW9uIHRvIGZpbmlzaCwg
YW5kIGZhdWx0cyB0aGF0IGNvbWUgYWZ0ZXIgdGhlIHdyaXRlcg0KPiAgICBxdWV1ZSBiZWhpbmQg
aXQuICBtaWdyYXRlX3RvX3JhbSgpIGlzIGNhbGxlZCB3aXRoIHRoZSBmYXVsdCBsb2NrDQo+ICAg
IGhlbGQsIHNvIGZvciBkZXZpY2UtcHJpdmF0ZSBmb2xpb3Mgb25seSB0aGUgZmlyc3QgcG9pbnQg
YXBwbGllcy4NCj4gDQo+IE1ha2luZyB0aGUgd2FpdCBraWxsYWJsZSBhbG9uZSBpcyBub3QgZW5v
dWdoLiAgQSBmYXVsdCB0aGF0IHJldHVybnMgMCANCj4gaXMgcmV0cmllZCwgc28gYSBrZXJuZWwt
bW9kZSBmYXVsdCBmcm9tIGEgdWFjY2VzcyByb3V0aW5lIHdvdWxkIGZhdWx0IA0KPiBhZ2FpbiBv
biB0aGUgc2FtZSBlbnRyeSwgcmV0dXJuIGF0IG9uY2UgYmVjYXVzZSB0aGUgc2lnbmFsIGlzIHN0
aWxsIA0KPiBwZW5kaW5nLCBhbmQgc3BpbiB1bnRpbCB0aGUgbWlncmF0aW9uIGNvbXBsZXRlcy4g
IFRoZSBmYXVsdCBoYXMgdG8gDQo+IHJldHVybiBWTV9GQVVMVF9SRVRSWSBzbyB0aGF0IGZhdWx0
X3NpZ25hbF9wZW5kaW5nKCkgY2FuIGVuZCBpdC4NCj4gDQo+IEhhbmRsZSB0aGUgZmF1bHQgbG9j
ayB0aGUgd2F5IF9fZm9saW9fbG9ja19vcl9yZXRyeSgpIGRvZXMuICBQYXNzIHRoZSANCj4gdm1f
ZmF1bHQgdG8gc29mdGxlYWZfZW50cnlfd2FpdF9vbl9sb2NrZWQoKSBmcm9tIGRvX3N3YXBfcGFn
ZSgpLiAgT24gDQo+IHRoZSBmaXJzdCBhdHRlbXB0IG9mIGEgcmV0cnlhYmxlIGZhdWx0LCBkcm9w
IHRoZSBmYXVsdCBsb2NrIGJlZm9yZSANCj4gc2xlZXBpbmcgYW5kIHJldHVybiBWTV9GQVVMVF9S
RVRSWSwgb3IgcmV0dXJuIGF0IG9uY2UgZm9yIA0KPiBGQVVMVF9GTEFHX1JFVFJZX05PV0FJVC4g
IEEgRkFVTFRfRkxBR19LSUxMQUJMRSBmYXVsdCBzbGVlcHMgaW4gDQo+IFRBU0tfS0lMTEFCTEUs
IGFuZCBpZiBhIGZhdGFsIHNpZ25hbCBlbmRzIGEgd2FpdCB0aGF0IHN0aWxsIGhvbGRzIHRoZSAN
Cj4gbG9jaywgZHJvcCBpdCBhbmQgcmV0dXJuIFZNX0ZBVUxUX1JFVFJZLg0KPiANCj4gRHJvcHBp
bmcgdGhlIGxvY2sgdGhlcmUgaXMgc2FmZS4gIFRoZSB3YWl0IGVudHJ5IGlzIHF1ZXVlZCBiZWZv
cmUgdGhlIA0KPiBwdGwgaXMgcmVsZWFzZWQsIGFuZCB0aGUgZW50cnkgY2FuIG9ubHkgYmUgcmVt
b3ZlZCB1bmRlciB0aGF0IHB0bCwgc28gDQo+IG5vIHdha2UgdXAgaXMgbWlzc2VkLiAgTm90aGlu
ZyBhZnRlciB0aGF0IHVzZXMgdGhlIHZtYSwgYW5kDQo+IGZvbGlvX3dhaXRxdWV1ZSgpIHBvaW50
cyBpbnRvIGEgZ2xvYmFsIGhhc2ggdGFibGUsIG5vdCBpbnRvIHRoZSBmb2xpby4NCj4gDQo+IENh
bGxlcnMgb3V0c2lkZSB0aGUgZmF1bHQgcGF0aCAoaG1tLCB1c2VyZmF1bHRmZCwgaHVnZV9tZW1v
cnkpIGFuZCB0aGUgDQo+IFBNRCBhbmQgaHVnZXRsYiB3YWl0cyBwYXNzIE5VTEwgYW5kIGtlZXAg
dGhlIGN1cnJlbnQgYmVoYXZpb3VyLg0KPiANCj4gVGVzdGVkIGJ5IGhvbGRpbmcgdGhlIG1pZ3Jh
dGlvbiBlbnRyaWVzIGZvciA4IHNlY29uZHMsIHdpdGggYSBkZWxheSANCj4gYWRkZWQgYWZ0ZXIg
dGhlIHVubWFwIHN0ZXAgb2YgbW92ZV9wYWdlcygpIGFuZCBpbiB0ZXN0X2htbSdzDQo+IG1pZ3Jh
dGVfdG9fcmFtKCk6DQo+IA0KPiAgLSBTSUdLSUxMIHRvIGEgcHJvY2VzcyB3YWl0aW5nIG9uIHRo
ZSBlbnRyeSwgZnJvbSB1c2VyIG1vZGUgb3IgZnJvbSBhDQo+ICAgIHdyaXRlKCkgdGhhdCBjb3Bp
ZXMgZnJvbSB0aGUgcGFnZSwgZW5kcyBpdCB3aXRoaW4gYSBtaWxsaXNlY29uZA0KPiAgICBpbnN0
ZWFkIG9mIGFmdGVyIHRoZSBtaWdyYXRpb24uICBUaGUgc2FtZSBob2xkcyBmb3IgYSB0aHJlYWQg
d2FpdGluZw0KPiAgICBvbiBhIGRldmljZS1wcml2YXRlIGZvbGlvLg0KPiAgLSBtdW5tYXAoKSBv
ZiBhbm90aGVyIHBhZ2UgaW4gdGhlIHNhbWUgVk1BIG5vIGxvbmdlciB3YWl0cyBmb3IgdGhlDQo+
ICAgIG1pZ3JhdGlvbi4NCj4gIC0gV2l0aG91dCBhIHNpZ25hbCwgdGhlIHdyaXRlKCkgY29tcGxl
dGVzIGFmdGVyIHRoZSBtaWdyYXRpb24gd2l0aA0KPiAgICB0aGUgcmlnaHQgZGF0YSwgdXNpbmcg
dW5kZXIgYSBtaWxsaXNlY29uZCBvZiBzeXN0ZW0gdGltZS4NCj4gIC0gaG1tLXRlc3RzIHJlc3Vs
dHMgYXJlIHVuY2hhbmdlZCwgYW5kIGxvY2tkZXAgcmVwb3J0cyBub3RoaW5nLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSnVuaG8gQ2hhIDxqdW5oby5jaGFAeGNlbmEuY29tPg0KPiAtLS0NCg0KSGks
DQoNCkkgYXNzdW1lDQoNCiogdGhpcyB3YXMgbm90IGhpdCBpbiB0aGUgd2lsZCBidXQgZm91bmQg
d2l0aCBhbiBMTE0uDQoqIE1vc3Qgb2YgdGhlIGNvZGUgYW5kIHBhdGNoIGRlc2NyaXB0aW9uIHdl
cmUgd3JpdHRlbiB3aXRoIGFuIExMTS4NCg0KQ29ycmVjdD8NCg0KLS0NCkNoZWVycywNCg0KRGF2
aWQNCg==
