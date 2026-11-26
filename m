Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795675425;
	b=eQ6f2hvBD0LngG0T6G7zcHRL9NmTLmPbKMERWbw7WQpLQRn14+drZq3JveSBPLl7HMi0
	 1E0qdKaRkv4B027Hp7SvoQbIsNlTkdoxQAEP6WLn2XB1jA6QaEQYd8jJUn3DFzchVwQjA
	 44mz1eF9tpuLrmbEU2aJEBNEqgFkaYb9gr4IBkimg4K4lVLHl2smPBPKRjcFC7RvaNyoJ
	 PjxjFQuxaeBRAL9HHIJGqS/RRH6MSjSwJZW4SdMKXGKUQW/b241kDBLLH+P3Ye/rWeUHQ
	 jLXSqEaglRbcwugXQyvUqBzxoLVCmmgxaKHCDFvp5g3LXtRSwE7tcsmHDPYlsj/gI4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675425;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=a1pYyssaUjoXewnr0gzqbdv/J1e8YMaTsBFqy2NmGl0=;
	b=hPkCatm6XQ/1OzjLKFDxk3EEBiSB8rfnKD+j0eI17VsZSgcfi79BWdlduGZlT6v4yxnA
	 emogfB/3pA7qyhsB/2XFFf/jhV6vBUGJ/CCLwwES09Ea0pxaRRmEMcMv967x5vaFaDuOQ
	 lfbgmNFFX62Ur64dzYzceRL/xC3j/G4HgP93KQwWpOYItksMXEymlgHafVo6DxDXYhoo7
	 gk9SpYQTnE+aHEnY8whVms2MMU5mVvCaShYkb6Cd47z7+Rph/OqBBySrWJC3B3mKAbYF7
	 wt+HupUPzv51n5/re3mDotYbE8ujpbcCxD/szkKfyBLCMlIb4awvgEHzm4mx+fpGsLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fujitsu.com;
	spf=pass smtp.mailfrom=fujitsu.com;
	dkim=pass header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=selector1 header.b=A89OqNux;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.38
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010038.outbound.protection.outlook.com [52.101.229.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D71606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D71606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=selector1 header.b=A89OqNux
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/d69JCDjlig7/8hWueDHT7/C/QsYkhTjDn0/fBPZGwBXFLXIVdL1vpQT/UIWFB3s1yFgPQCRkz+Q+Co8aMZHvUVrfoR7NZr1RsNS5AXpA3rolV1cJtm1C3Y5y5AC6kp9/+QeSHjIHI/UbzSGSNcjuQ791+2iH5RfqXXhC4Vm4YUD7cVTW40M3ISkUreQszIrnUmJrP6BMzFstRb40H8UL+gQJvYqJNi45Rr1AO+epI8z+tTeZ/LGlv2e5ZxJspM99pUWjjZSniImhZZDy/nAKjROawWmB7O/zR/HEU+2QK7IHeEmhuTkTmYP9mKrvU9vD/KUq48UBvwTAmBYFSbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1pYyssaUjoXewnr0gzqbdv/J1e8YMaTsBFqy2NmGl0=;
 b=llsZLGbO9nQZ/wzMj4WJfylRi6pZOjLFLgdml3SzoFKnH60z8+WxLHsbkd1Ap/BhgV5EPHhnHa+aYogiYRbS3dbafgUVLEuOyTw8HR7jTi/9gwru7tD2h7aD7DqrCc7qy5/ftEpXNkgzmOJdCuZ6ogV1KNx1JkNtZa3v/5e/3oZTUarE3hjY9u1/sEHuf70RH1n7aRhOy6RTiQ5+PIw3h/QIkJkBt63hV0Q90mtcovLNZWa5wUrleLOzVgpljShmh5ioWxlpByTiJWWJv/4Zw0LYCXtBr/gBSeBAM1aLeZCpGlMKzGIYS+EdTXC6+asKHDR5Do9Cg039XJIh4QuIEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1pYyssaUjoXewnr0gzqbdv/J1e8YMaTsBFqy2NmGl0=;
 b=A89OqNux82FnZyaUn93e2jTBKEGmne+nwrcmSBvh1snczu5qFuJEjiKgcQAjkUtvZ/wYWjP+sO6h76kjbFhFZ6QcPPryA76oFCoErl/ehNZwQ1vphgPC6R4WwV3qq+pyDNGqbi+COXXl5A+/QoMDxNuRm3rDVeuhY090tNQPOyaCSIYhOR/0LQiwyMlDhXSEDOj0f01WhxctoeMiX/EAdjZQh2Cj7vxj8VWZi40HYFRbu9eeZTapDRG0hM2uUj/Fyx6QuqYZR32kJ9a4SGRFXUQTjlND0UtTIErUbmx9YyEOalJGReM9IqJ/F95wfhcIsyohk9bnsiDWicU+RtwfzQ==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by TY6PR01MB499654.jpnprd01.prod.outlook.com
 (2603:1096:403:610::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Thu, 26 Nov
 2026 06:43:41 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 06:43:41 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: Fenghua Yu <fenghuay@nvidia.com>, Reinette Chatre
	<reinette.chatre@intel.com>, Tony Luck <tony.luck@intel.com>, Ben Horgan
	<ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Will Deacon
	<will@kernel.org>, Dave Martin <Dave.Martin@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Chen Yu <yu.c.chen@intel.com>, Babu Moger
	<babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>, Vikram Sethi
	<vsethi@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Newton Liu
	<newtonl@nvidia.com>, Richard Cheng <icheng@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RFC v3 07/15] arm_mpam: Refine L3 topology and class
 selection
Thread-Topic: [PATCH RFC v3 07/15] arm_mpam: Refine L3 topology and class
 selection
Thread-Index: AQHdcJDC77gRSBuDHUmnP2oLgnlL3rdAAXeM
Date: Thu, 26 Nov 2026 06:43:41 +0000
Message-ID:
 <TY4PR01MB16930E52FB869C21445C825758B422@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
 <20261109212427.1409204-8-fenghuay@nvidia.com>
In-Reply-To: <20261109212427.1409204-8-fenghuay@nvidia.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-11-26T06:43:16.585Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|TY6PR01MB499654:EE_
x-ms-office365-filtering-correlation-id: e6a1a748-fd78-40d8-6ddf-08df4b889bd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|261026140227099003|261022105027099003|10067099003|261026121527099003|261021123027099003|261102123227099003|261028144727099003|261021121427099003|261009223027099003|1580799027|921020|38070700021|22082099003|18002099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 1U+9LeAeeMgmPTFePuXcpvJpHVK2bo1KI9tIJc9KxEfOkL4unJLPDm0uifwNrRNh4KRAOb787YIAKD9gDzOVgweciLxLiGmYmThB6eppjVMlFwixzaNYcF+4mTsQuPzulK9Y2S2ncBCs9XI6UZii2xSUOYQ+XEYJ4D6HnxZ6WpEegFcPcspy8p+sn52R49aBlDk0WKATHFL/vC8V0S4ILlrkAqutRKK9puc5NZFtue4THcOawy4SA0rxMxnSJH4dBzh0WzzZtJXuYJHlvwdMD89RQ3U2H7/LAOOoQVt9y0JyiWVKnUMoPppWr/KCipdK51CbSCJkN216mgSmtSSS+h5KlF1u5FS3B2ldK44caYptwhiVcbFG5K/FXEkpzLZw2SK1Sor/007IedK2y2CocWsog7eZZuXjZ5GCnj4qThNjUq5TlpBX7YbSBp2lU4ZMxiVXBScqPrmKNBYkmlvM8E3u68YHL4Yz0ckbI80YZpZsaXq4piGHM8yD+dKDoQBZo+AZA1Mt2mUpz+VNkqMePbV1C4z6/whEkMUZBAL251E20LGhvb6PvCOPERqlzlGCJm4EbtEh9lwPoG6v7CVMgaz7VKPwkc+FrgOKvoa7SC/SZs+TKxIc0FQM/D7AGRN7hoVVouznN9v7Mqry8OUgwWW05/bKwbWMDkcTA5nb4KbaH1FV0f/Za/lS9aU3O6wyMor2D9oKXJr5iEtXTcAHwJ3m5Ek7lUWf4ZuM23npzeFo3MerVD7fPX89zVXycGLXKb2Y4uOV9SD7qW0YnLoJag==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(261026140227099003)(261022105027099003)(10067099003)(261026121527099003)(261021123027099003)(261102123227099003)(261028144727099003)(261021121427099003)(261009223027099003)(1580799027)(921020)(38070700021)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?VlF5ZU5aL1lsaGtNL2NadmtNNHBPZ0dlelJyYWk2VWhTekNJa2ViOWZJ?=
 =?iso-2022-jp?B?endBTVRCN3RZaWd4akwvbjc0cVJWem5mWS9VM1pxbDdVMkhzV1VoTVlI?=
 =?iso-2022-jp?B?MjVsREJoZUJMKzNlNlFoNHkzd3ZndXpJRUlKNURBeVFBTFZ1blhqLzYx?=
 =?iso-2022-jp?B?M2tmbXZIdkxvVUs5QktZei9ybTVFcVY4Q0xXVERnSDlvQ3VYNWYycGYx?=
 =?iso-2022-jp?B?MEJTZkNXd1B2QThIOGNIcmM3cEozdlZXeDZSeDhUWDNzVnVvZ0Y3UGJW?=
 =?iso-2022-jp?B?dDkyKy9RNFFmbkp6Q2Z0V1BQVW1BRjVHNTFyNHk4SC8rSi9qMFVOdlBF?=
 =?iso-2022-jp?B?QVI4TEV1ZUppU281dHg3M3VKYklwcXNpaDZlUmlSUjR3SkdmVWlidWZM?=
 =?iso-2022-jp?B?Zk9SdDdoMmlUbmptNVU0RHBsVTNHRFg1Uzh4RmNtQjFBVjFHODVpMHBY?=
 =?iso-2022-jp?B?MlB0RkQ3anRWaTRKRWpwQ1BzSXNHcTJRdkVIbDhkaXRPRENzU0pTdDdR?=
 =?iso-2022-jp?B?MjlvcHljNEhleE9hRjF0aDVnVTRYRENDNWZUekRDNmFyeWJ2NXNFb1Ez?=
 =?iso-2022-jp?B?U05LNVdmL1B6WTV6ajdGNGI1Mk9meXc5bWhCOVhkQ3pwRUlaeWpQQ0dI?=
 =?iso-2022-jp?B?OTVDaTRJckJVSnk3eDhkOEViK084NVJkWmg3eGo2ck4vV09oTEZXKzBI?=
 =?iso-2022-jp?B?eUt4UHErb2w0RkVsajd0Y3ZLbkZMRXd1R0wzdHh2WUlZNXdFWUI3dSs0?=
 =?iso-2022-jp?B?cDAvbXJKT1hjMmplTWQyZEF0MStRRHlqU2RUcUxhN1JNUndCdzlFOU1v?=
 =?iso-2022-jp?B?R1g3SWg0ZHdjQjlrS0xOQjZMaWVVQWVSSHFDZkZZTmxDallCZDFvM3F1?=
 =?iso-2022-jp?B?N2drbjBKdDVlQ1poVFdrMHJLVUdoc0IrUXNKNGNxdGpyeU1PVGk2SytO?=
 =?iso-2022-jp?B?cU1QQnpsL1M0S3FqRTBia2h5SVpwV2x0bFJxWXpKUXJuMDVNRmVFNFhI?=
 =?iso-2022-jp?B?V2JRbGh2SDNaVlZyelhFNHVhOUdzV01ObTNTL3VXcWtmejd3bjlncmpR?=
 =?iso-2022-jp?B?YkpRNHNmUkU1TjBxRUtZZ08rZ21pKzVZdU1zOUlkZ2M2Q0Fua1FiZW9q?=
 =?iso-2022-jp?B?QTJIdGRkV0VvdWdvVFIzN1YyL1BuTUdsTkYvejRWSXRYcDRzUFV4R0xB?=
 =?iso-2022-jp?B?RVNmRzJERElZcXR3MFkyckpmc2RNeWJNOG9ZT3hLaXVVekQ0R3pPOXdP?=
 =?iso-2022-jp?B?aXgyUkcvWWpMRTVyNHh5bUJzRXZHeTFsSS9UVGY0blRRcjdsVm83OHZw?=
 =?iso-2022-jp?B?Qng4SWxmaTlXaXowRHl5UUxsTFpCRkdnekZqUmpuaXE1REhxdWw3YXYy?=
 =?iso-2022-jp?B?SG9YaUtqTzZDWkZNK3ZVSGFFLzBxc29mSWxKYnI5anQ5R1pKaCtwdEVh?=
 =?iso-2022-jp?B?ano1QmFXbjhsQWRDb3pVYktEUHRkS1dNKzQ5MmhsY2tRSTYxdEd4eG9v?=
 =?iso-2022-jp?B?eDdRZTl5ZVFuZUFCZCtSS0x3V2UxTXAwbkJjc0Zvdm1WTWlISWRtRytX?=
 =?iso-2022-jp?B?dHQzeC9qdyt0V1M4K3R2U2tTTDIvSmd6T3lIVFplbVo3T25tWmcvM2Nt?=
 =?iso-2022-jp?B?UzlCQUFycU0zWXovekU0SWc1ZjgxdXhuWjFvM1AyTnpscWVGZEFLSSt0?=
 =?iso-2022-jp?B?bFZGVUJ6RTJIRmtsOVdGZWdEbWJkVWk4MHYrWnpET003Vm9JSUZEWEVL?=
 =?iso-2022-jp?B?TGppNGVhRld3ZmVyOUppQU9ZclBTNE9rM3JtSnlWcmVNZ3VnMU9ZbTlS?=
 =?iso-2022-jp?B?dkp2OGJvZUdYeCtFZUp5ZFl6N0xJTE9GT0x2M01FSWJHUVQ1SWEvU0Q0?=
 =?iso-2022-jp?B?Sm9YcFdzL0EzWGFJWGxrRmE3MDRBcFNSMTdVNlRGL2JaTXJNUnM5TldM?=
 =?iso-2022-jp?B?cytHZjk5UWpUaTVMQUVkTksyVTk0c0lSa0RzQ0E1cGRrZ3prbC9keVRu?=
 =?iso-2022-jp?B?b0NwY0ozY21XbXFZTTJFK3dXb0xBb1U2Y1JRc0dDOXNRVTN4a0E0ekdG?=
 =?iso-2022-jp?B?clBPTVpkRGRCT3d3cDFIUFphbmw4NXArT3V2WEMvNVpRNytPWXhpbEMz?=
 =?iso-2022-jp?B?alRKcGorUFJTdmFlVEFZN0hTaEx1SEY3MWg5S1Vna2lSUWpYTlBQQ1ln?=
 =?iso-2022-jp?B?dkVuWGExOWx5eFVNZlV4M3VRenFLR2IrL0VEQ1psUGlPRE5OZEJ3NDMz?=
 =?iso-2022-jp?B?U1NCcFVETVZ4c3N0Sk5rNU03ZVI3SklGelRLUWpyYTg2dmU5M2ZteFQw?=
 =?iso-2022-jp?B?WlVpZ2NLUG1KSXVhbEhVb0pUaHhPR1h2WFhtb0UyNlBIWE1mTVpmY3RX?=
 =?iso-2022-jp?B?dC9GZVhXNlJoTzhBaXc0STByZE15VUdMMnZSVU9RVzM4K05Ga2sxU2sv?=
 =?iso-2022-jp?B?ZlMrcTZ1YW9kek1FOFJWL2U4QkJCTEk0RG5DTk9mYit3b1hIa1lzL242?=
 =?iso-2022-jp?B?eFBOTUg1WndpYjB4OEd3emd4cHl1dmY0ckN6UT09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	CvGhr1v7VYaBkv1KKodQGEGU+3q2NRTThXzrdUlRxdQyypx9T2hISS3+Q78y738HEy/MGAhkyya+V1EnV3DkbSWQ0bnRJBZLmyJUZPreWDASJDlKCjCxMwVrgmz1GlmHd5diZLUc9JbQtBYsHXhmcHrEEWpqdEmGqo43fW3/MDrJ7XnVz2eWt8fuZsFPY6tqlHvysHDR/jyX0ISZEB4EnrfoeWmEx08hvVhoccQxxLSlO64Bjv2nU+ivdbtRcb4suUT/QMeOk/IONboT06OcLTQ1503Jr5Gj/a85YRcpZU6WeKwGd18fVrDO/bjWVsoYLetiNcZgDzGm02vRLABjXA==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a1a748-fd78-40d8-6ddf-08df4b889bd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 06:43:41.1087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1MCng6OtLILsktP0ObViymRMyq90nVh6RcJmUmP31qnij+vppZRwUdG42wZIkQIM3ZcjZDr3n7VD02JoKCAMDUnydztghK0jQA7oCJS42hc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB499654

Hello Fenghua,=0A=
=0A=
=0A=
> After enabling memory-level MSCs, the existing class-picking heuristics=
=0A=
> still treat every candidate like an L3 cache MSC. That rejects valid=0A=
> memory classes for MBWU counters and applies L3 egress checks to MBA=0A=
> classes on CPU-less or system-wide affinities, leaving no monitor or=0A=
> control class selected on affected platforms.=0A=
> =0A=
> Adjust the heuristics so memory classes can back MBWU directly, L3=0A=
> topology matching is only required for level-3 MBA candidates, and=0A=
> traffic matching is skipped when the class already spans all CPUs.=0A=
> Also tolerate components with no online CPUs once at least one=0A=
> component has matched.=0A=
> =0A=
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>=0A=
> Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>=0A=
> ---=0A=
>  drivers/resctrl/mpam_resctrl.c | 22 +++++++++++++++++-----=0A=
>  1 file changed, 17 insertions(+), 5 deletions(-)=0A=
> =0A=
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctr=
l.c=0A=
> index 47a7b18d841d..72302f6021d7 100644=0A=
> --- a/drivers/resctrl/mpam_resctrl.c=0A=
> +++ b/drivers/resctrl/mpam_resctrl.c=0A=
> @@ -865,10 +865,12 @@ static bool topology_matches_l3(struct mpam_class *=
victim)=0A=
>  {=0A=
>          int cpu, err;=0A=
>          struct mpam_component *victim_iter;=0A=
> +       bool matched_once =3D false;=0A=
>  =0A=
>          lockdep_assert_cpus_held();=0A=
>  =0A=
>          cpumask_var_t __free(free_cpumask_var) tmp_cpumask =3D CPUMASK_V=
AR_NULL;=0A=
> +=0A=
>          if (!alloc_cpumask_var(&tmp_cpumask, GFP_KERNEL))=0A=
>                  return false;=0A=
>  =0A=
> @@ -882,8 +884,11 @@ static bool topology_matches_l3(struct mpam_class *v=
ictim)=0A=
>                  }=0A=
>  =0A=
>                  cpu =3D cpumask_any_and(&victim_iter->affinity, cpu_onli=
ne_mask);=0A=
> -               if (WARN_ON_ONCE(cpu >=3D nr_cpu_ids))=0A=
> +               if (WARN_ON_ONCE(cpu >=3D nr_cpu_ids)) {=0A=
> +                       if (matched_once)=0A=
> +                               continue;=0A=
>                          return false;=0A=
> +               }=0A=
>  =0A=
>                  cpumask_clear(tmp_cpumask);=0A=
>                  err =3D find_l3_equivalent_bitmask(cpu, tmp_cpumask);=0A=
> @@ -903,6 +908,7 @@ static bool topology_matches_l3(struct mpam_class *vi=
ctim)=0A=
>  =0A=
>                          return false;=0A=
>                  }=0A=
> +               matched_once =3D true;=0A=
>          }=0A=
>  =0A=
>          return true;=0A=
> @@ -1041,13 +1047,15 @@ static void mpam_resctrl_pick_mba(void)=0A=
>                          continue;=0A=
>                  }=0A=
>  =0A=
> -               if (!topology_matches_l3(class)) {=0A=
> +               if (class->level =3D=3D 3 && !topology_matches_l3(class))=
 {=0A=
>                          pr_debug("class %u topology doesn't match L3\n",=
=0A=
>                                   class->level);=0A=
>                          continue;=0A=
>                  }=0A=
>  =0A=
> -               if (!traffic_matches_l3(class)) {=0A=
> +               /* Check memory at egress from L3 for MSC with L3 */=0A=
> +               if (!cpumask_equal(&class->affinity, cpu_possible_mask) &=
&=0A=
> +                   !traffic_matches_l3(class)) {=0A=
>                          pr_debug("class %u traffic doesn't match L3 egre=
ss\n",=0A=
>                                   class->level);=0A=
>                          continue;=0A=
=0A=
The function mpam_resctrl_pick_mba() already performs the following checks,=
 so there is no need to repeat them here.=0A=
=0A=
        if (!cpumask_equal(&class->affinity, cpu_possible_mask)) {=0A=
	            pr_debug("class %u has missing CPUs\n", class->level);=0A=
	            continue;=0A=
        }=0A=
=0A=
Best regards,=0A=
Shaopeng TAN=0A=
=0A=
> @@ -1175,8 +1183,9 @@ static void mpam_resctrl_pick_counters(void)=0A=
>                  }=0A=
>  =0A=
>                  if (class_has_usable_mbwu(class) &&=0A=
> -                   topology_matches_l3(class) &&=0A=
> -                   traffic_matches_l3(class)) {=0A=
> +                   ((class->type =3D=3D MPAM_CLASS_MEMORY) ||=0A=
> +                   (topology_matches_l3(class) &&=0A=
> +                   traffic_matches_l3(class)))) {=0A=
>                          pr_debug("class %u has usable MBWU, and matches =
L3 topology and traffic\n",=0A=
>                                   class->level);=0A=
>  =0A=
> @@ -1314,6 +1323,9 @@ static int mpam_resctrl_pick_domain_id(int cpu, str=
uct mpam_component *comp)=0A=
>          if (class->type =3D=3D MPAM_CLASS_CACHE)=0A=
>                  return comp->comp_id;=0A=
>  =0A=
> +       if (mpam_class_memory(class))=0A=
> +               return comp->comp_id;=0A=
> +=0A=
>          if (topology_matches_l3(class)) {=0A=
>                  /* Use the corresponding L3 component ID as the domain I=
D */=0A=
>                  int id =3D get_cpu_cacheinfo_id(cpu, 3);=0A=
> --=0A=
> 2.53.0=0A=
