Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795120671;
	b=LqC6i5IJzr8SLrG5mU28JF7E+TsGmqcQoVRZFZ6Q1ZDKs4FjxZlrsNpQjyYx1uk9fCs7
	 1VW+gt/VOOJMeZo6ioulBnLOgb3L8CjauSfbULD/hbzpIGtn8JOxYcxdeQ0ax6RrdMoeh
	 NBN3DMMe/Q8/09YW2m1Mw0UkiMOVb3RFC1/DRzgoN8A/qf1n6IcoaQkCWdWNkSFkJjcRX
	 MBzi9zsGev5Sbg9vISsvuqJvYNbEtvuEbffYls37Emu2qr6gHFNtElAVnRbpJzBMBuhB3
	 kVXwYDYxX4OJAmff+ap3ZilAlKAnLA4Ox5u3P0O/OvNKzvLv3Yn3lhL9YniplwpvFCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120671;
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
	bh=vsgdUCV3d5iym54mATlynehl/gP2Xu4SUzK2FRy8OCY=;
	b=x0QMUdw1WDpUnOiFFJVaR2VimVpa2quJcdtgIJWt98rTAkEx2EFN3sLXrs+SqvPHYZ12
	 KEImnifLb5n8CrPqEfH5c5jyPSW3Vkpg6KxTlBKiggd19er1E5LUh+QwZxoPsHIg/iqr9
	 bJalIgNxHeTApw2S18tf0t+1YQCIqrbGHmhMkK9EHj0F/Mqs1TfV+TZjZOiibgDiQCePv
	 sFoZx2lkyTIf0IhP+APolaw1EF7YMZ7x6r0ZEl8KJiwoDCP5Geno5re+L1F3arZwSnjkZ
	 I6OAsDHzG6dpxQ9lTUNkwPfr7WlSeKzP5DFLKpOfyADi6YckskmsZayLaSitvcScuNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b="met/erri";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.23
Received: from WA1P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19010023.outbound.protection.outlook.com [52.103.53.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05739607431C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05739607431C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=met/erri
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VL6WLT16KLBVQKvcL3hNB66iWMbQknUwpQZf3/mqyHAbcKFbeUV7QgSq4JDDDTwneITmwWYHWbIhDSKkSFJuDjr1LDEjNnWnBLe/jwh0zws5VHiZQ/HbQdAT0QePefMhmZUIE79nyo5cBJX03SKlbfFJieZkQIfFYT1hVbKuw+ptQWrxwktmse0S+C3U34X6riZ/i+iu7I5FtEbRvuQdXqO0rO+GQPbqzFs58JsxUORlARsSAUYgERECIbbynfmZJRcFd+E9Eb8xOJ/PfAaeczilfmRtjGeIspfHQ4mI9IuKRMlDo9Xdwg5s/zz4O4LN50RstrdJJCoRwjjVSVq3dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsgdUCV3d5iym54mATlynehl/gP2Xu4SUzK2FRy8OCY=;
 b=xKeKJ3JZMxsgoucF5dgX4pkGbRegAdfmsUMhLFyv3dx7FnADk/PSGP5ZfBCixC+svnN3wAZpXRY5Brg8T+whhTPSUVw5Qyilvw9QABs8ZEOlZDwmjNposXwP2F8vwBXfZM7Z+2DgoeaBqTjzQ3AvgER8yymmh1ccDJJWsoYXJ/y2pW3KTV772bemMuCABs5UxxoOZsAan29Yn829mwqogMgzBBngmyDUevSOKAtV1FdWavEAMfQx4IXpAJ6AWY3PiFBYhR9VtPKkwrRe1Ya/cczAlZFR9hQKWdHBaDx8VRzFpYEp7x86XSp2YW4S8+ZmBBU98uSfum1mwd8GPDeOxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsgdUCV3d5iym54mATlynehl/gP2Xu4SUzK2FRy8OCY=;
 b=met/erriMK7G09tVyrmVllSayNtnFsFs4Red6XSvHEerRACc1tn+o2iFYDHYgCctXThM1zyHUWCVZn+PHYSRaECCxCV8RRfPxb0zUMyqnRWnpkBdSRzX10XwZHzRrfdFrz54XtF1QGH12n9FKQ+Q0gvMLGPVBdLa4DyqKIfzulyEPk7zyY8CH3slaAsPuO05IfQ1yuPE9DHrZ8H+gMRzAor+12vcuQGO+npoRtRbcIj68+ZvkFL0zQByjNqNe79mQVB8bLMWNifsiZXCndei8J0b66Y8UautVFd/MawU8dE0YPZeSYIMXT4fp8tVB236/mnd5XS/vMFcOIthvKEwvw==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA2P291MB171083.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:47::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 20:37:48 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 20:37:48 +0000
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
Thread-Index: AQHddo9YVXcm+DqNU0WkNQyfDE7BTbc1zo4AgAAP+wA=
Date: Thu, 19 Nov 2026 20:37:48 +0000
Message-ID: <20261119203747.80853-1-habilerenturker@hotmail.com>
References: <55cf7d7a-b16b-4d7f-b455-d239f8d80363@intel.com>
In-Reply-To: <55cf7d7a-b16b-4d7f-b455-d239f8d80363@intel.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA2P291MB171083:EE_
x-ms-office365-filtering-correlation-id: f45bb3c5-f992-41c0-3f7d-08df467cf940
x-ms-exchange-slblob-mailprops:
 qdrM8TqeFBvhuFgLLe5qs4jWk9CHdv0AHliBZFaAR8+bzNEm83Z+lV9GkoB1PHQ74g7YhGvyo/6wMW+hcpnP6m3XEw+Xdv8XtDjeE0xZJtioThXfilw12AT09JhHILtVdAjuizLcyv8qk6o1lWzIqmwXHP46BCRtXJ4/F4/z3roaeeU754SAb868LMa3jzMoba2AOJ42PU1VBzwPi0WmBmyVzqTvDVaDTnwUz94tBvj4YmBt5vwJXvUcpW6Gd5cfLere6KWr2W2eBv/8U6gGZJpHj8Vs83slF7YBgg/nj/MT6Oph3uBc64Boce74O8oNiZXsCRNl/9r5uL+O2DQw0/ttZzMcC/HOyfHaPachUnMdAbk8yRsuYU24mgSGTNlG/U3U4knKw1KARQVpY7Mu5VCTsifZOF0TXwr7Y9GaxEPl/0REa41XhNnrr5aqvX7rDpvB2Q16fV6w8VfmcIjaehyC7mTUNkjt/DHmgOfknOnfM0nwAOSGXV4UZ1MlPncMlV6UdcOMnL1tNJaJRWJktsNQbDUwXOCWXUMsmKBSkuTuFQuRmA5EA/Xml83h3NUuFiBhHkgrGnmVBOVpq08BWOSDyjmFANPy9IncJ5un9UjUoGef8JqDgX9bIXVJ0bq5pox8SakqH1ZkOmSgZ/ZCr9cpGBDGEEYYF/t/K0BcFQgFFhPMROdB+CDOZt35KgFnmrIVJRSmQEEhurJMWYSwe9VwSZlIIYtUlCAP0e33p5Dw0y1n+unSFPc36CgMGd+9SoraBf5wzvAk8qrWOjYw8+ltjNNcrQL7
x-microsoft-antispam:
 BCL:0;ARA:14566002|13031999006|38102599003|8062599012|15080799012|8060799015|19110799012|55001999006|24021099003|25010399006|31061999003|51005399006|102099032|3412199025|440099028|40105399003|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?RWlqU1J0dzVsVVhLZXN4TjhNeHd2UHVCdEZodDIvM3ZRb2F2NjBsc0tVNE4y?=
 =?utf-8?B?Wm5mMUJJbWhVN00waVpGSHpBT3FFVm5QMmI2MnRPNEJlclF2RnQ4UWtSSnh5?=
 =?utf-8?B?UkhBZDdXVDJrWG9mMWhGb3V1WkY4ZWtJQzIvaldlaldRSFdndVY3RnZoRjUw?=
 =?utf-8?B?cTlaY0hLZHpGelAyRktDRHRKY0V1cGZZZ29CV2trV0djZjRBcnByNDN1aDhq?=
 =?utf-8?B?K0UzSElVdXdUVHBsR3cvV2V1MWVZQlNpM0l5NFVrbmR0NlJzbE54Y1FENjZp?=
 =?utf-8?B?dGM3U2duZE5mUlNFaDZycHpEcHkvbTQrOC9RWHg3Z1p0UjJOQ1VSSUl1ajdk?=
 =?utf-8?B?NU1iNG53dUFnQVpaTWRBWjR0cnZPREZWL3RJU3NOMFBBRmN2dEpTSzVwYkIw?=
 =?utf-8?B?RVdSSXNHZk1ZZm5HanVDQ3ZESGZhc2UydHVJbUI3cDhxejZQd1h6K0pvMFlC?=
 =?utf-8?B?cWZIVjFUM2J3VmdBbHZ6dlhlMSt5cGNBZVlBeTJQcGJpTFlvYVpWUkxYQ2Z2?=
 =?utf-8?B?QnJsUWQzWWo3ZlJiTmlnK1BpSElEUnp6Q2krN2JFWHhDOWExeG5Fa0g0Nktv?=
 =?utf-8?B?dGd3MUE2M3VLWGlwYWhsZlA5WHJXNm92TExlaFd6WFJKVDZiemJycjBDNEhj?=
 =?utf-8?B?QkxueG9rQ0ZSemM1UUREUzNONE9SSys2dzk0ZlNYekIvRnByemNFL0ZjZFI0?=
 =?utf-8?B?ZFhGWVpMQVpaRFpPeWZ2Wi9URXAvRzREWDFucmNDaWRMNjFHeWNrSjRySEky?=
 =?utf-8?B?S2Q3S3ovVFZuU2tCRkNOOGIyT1NPR0I5c05nZGRhZG41UTdGL1VITDJvb1J4?=
 =?utf-8?B?Tmc5RUZOM2FsNXg2UXNVTFd0M3hHWmY4YkFCS1ZodmhhSVhVa2JyZW9zTHR3?=
 =?utf-8?B?bUc5amg3RU5MU3RKUExGMEpWNXJVVzFtMWFwMmtDNm5XbnFlcGpDeGU1M2Y3?=
 =?utf-8?B?UHQ5TDZGbE8xbXcxRk13RHZ2amxoWGEwcnhOdzVQL1NXV0RBTDJCbVJKMXVz?=
 =?utf-8?B?VTBxVTdZVGl4aStXUFdWek9LcXlzK0dvTDFPNHU5Uk5DK2tRQ21nT3dNR0c4?=
 =?utf-8?B?anBBTGRkVEdhSG9hWDNGcUxIa09zZTJiRVdSWHBDZTl6TFVGNC9ISTJsTmEw?=
 =?utf-8?B?clY1WHhzMG1IZlpHWkh1VEtpRWlVQXVvM1padjMwaFNpeWsySVFYazlGOFZD?=
 =?utf-8?B?SGRPK2p5N2pvSGR3S05Qb0gzZE5DN2g4emcwbWlEVXlpRXZHemJobjA0Y0Jn?=
 =?utf-8?B?MmY5N0x4L3lVSEVjMFcrM0NWOTBZa1AxVksxZEpNT0FiOVFlcHhlWnpjQ1Z2?=
 =?utf-8?B?SUJZV2lhRk1jRDZ2Rmw4Q3FmaGhjQ0FiTHRleE1hVXRnSU9RS2NCZlF5am5O?=
 =?utf-8?B?NW9ZalpoLytEanE0aFlYZDRaczJDYjlYOEtsWjBqWlkydTVrdFFnUElaWmtk?=
 =?utf-8?Q?FWYq2L/i?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QVM1VXRLZGxHaEZldmFabFJXVVlYYTNKN0xKdlM5SVl0TUFGaDlSWE83MUVy?=
 =?utf-8?B?dWpkb2tESW9QME9BRzFIYnI0QkthRkpiWTJMSGhTS0ZpSTd4bFJzUHhYUENI?=
 =?utf-8?B?NmZrSE5ja3k3YlZxU2EzTEpRMlc3ZGkvRkp2Y0cxc2JjQ3FMeDdvU254dFlD?=
 =?utf-8?B?dXlrMnNBQkVFR3p3NjVRR1dYNktWeTdkc0xkZ21LdVNMMWpJQ0lsQkZPMlJw?=
 =?utf-8?B?UmpGMFhQOHllZW1Jd1BoM0JyRlE0MlBRQXpkZW85RVo2ajFiVjYyWWIrNmxl?=
 =?utf-8?B?NGdjdHNVYUZiOGt6d0ZtSWFTUmUvRllWc2hoa2FoL3JCWENDQ2Y1RmRPYjRN?=
 =?utf-8?B?c0VhNm9kVEN5cFlTNUJqNm9Fc0xIL0lERHI2cklEcElPUnM4Q3U4ZWtkZTNv?=
 =?utf-8?B?WVFWOFRFdURscmFtaEw3WXB2VW0vVFE2TjBGMlJpa1NnL2N3c3VWMjQrOTRS?=
 =?utf-8?B?enVUbTNxbC9nZnVRZlVvYUdndDZIZUFISHVrd0tWWVpKRHRDWWZ5NHhFM3VF?=
 =?utf-8?B?KzRQM2lLMEtheStDUGkxS1RpMjZyTlFKd0ZKYlVBanptUlQzUXhhbUJTNnJL?=
 =?utf-8?B?UmhXTHIzNFIzcE5Ib0FRZThyNlhsRXRucnQwUG1jN3hDRmZDZjZDSndPdGor?=
 =?utf-8?B?L1FmY1JiblRmZGtlNk5udjJSVFdkVWNUWlE3YkNubXNaMFg0SG5XeGNDaTg3?=
 =?utf-8?B?VTNxRzFDd0UxNDlnRGFlTU9KYXBlSXlnSjZBaHB4ODU2WVovd01mVGtKRWY5?=
 =?utf-8?B?dENSSk5mT2Q5dWNWU1Z6ajZJenkrUm5TNDdheW56OXVZdkRxQXhVU01ZSXcy?=
 =?utf-8?B?MUFtVUNaT3IzY2R6dGtPQmlua2VXUDRuci9NeGQ1RmJPdjlrTElSeXVFdER0?=
 =?utf-8?B?ZVhaM2lMNVZVNExEWG5KbU1DNnBueGw0Uy9wSythWWJwY0l4RkY0Y0c0Zmwr?=
 =?utf-8?B?QkdtVTE5d0Rwd295aGNJUXJQaDF5TzFjc0pKSzgraWtIV2FMSHBhdEttRWJ2?=
 =?utf-8?B?cktIVHlDS2d0aTQ2TitBVzdMUTdEeVVOZFI1VUs2dTNUUU1kVDg0dnZFcERk?=
 =?utf-8?B?SDBIMEMvaWJWTEFDUjlobFVlOVFVb3gwRVRTUlFpS2sxd0J1U2w0Q210cExU?=
 =?utf-8?B?OEcyTXN6K2RVb3JTWWRWQi9lcEpDMTdnbVZobDEyQnhlbnh3YkRseTFERXVY?=
 =?utf-8?B?ek9nbHd0Wk10cGNvdnltbHdockl2ODBtT0lNN2xlWkMrc3d1UmRtZnNxRVlm?=
 =?utf-8?B?ZU1ISXFzd3p2QkpVTUxlOG1MUG1RSm5yMnM0QWhUSUt6U3pOak93YzB0bDg5?=
 =?utf-8?B?ZWswaU9ITnAzY0dWUHN5dlhmM05vajdQMkc0UlREb0pzbzFWUFgyZEkralQz?=
 =?utf-8?B?Y0wrTUxQOUhac2I4WEROZlQvT0pBQ1lCTXFyeFkyUEJJRm9hU0dJckhyVW13?=
 =?utf-8?B?RTlpV05DTUE4UjNyWDRPTjhvZmxtS21ncXNYZDB4K1Y0b1d3Kzh6aldnQWYz?=
 =?utf-8?B?V05iT1RqMVE5NWgzNFl4OFdMMjRKQytiK05VZTlReXBNZUNYdGhVMWpkbFZ0?=
 =?utf-8?B?TzJkZjQrUi9sWFZwWElSSW9SWVZCbmFsTUtTbG9JQU1MVkVEVlo3czFuZkZE?=
 =?utf-8?B?WVZWY2dsQmpLQitiWlRkc0ZvYzdwcjNiYXp0aXpDeGh0UVcvOUZlcXBQRldO?=
 =?utf-8?B?S3IwbHBBV3lURW9JTGxyUm5DZEpsRWVxc0VBTW1ML2NqaFh5Y0xNYnZrYVly?=
 =?utf-8?B?T29jZC9hZGRHdlFFa1BuOHRoclZoYUNJRVYvdWgzMitvWlByODFyR3ZCR0Jx?=
 =?utf-8?B?bUsvVFpGbnFSU2lpTjM0TmhqUDlMTFlpbFFCWFlZeGFncXpzL3NvWThJZDB2?=
 =?utf-8?Q?yePBxDKVoet6u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <439291E3B064924DA812D2A4FDDE3504@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f45bb3c5-f992-41c0-3f7d-08df467cf940
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 20:37:48.1139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA2P291MB171083

T24gVGh1LCAxOSBOb3YgMjAyNiwgMTE6NDA6MzIsIC0wODAwLCBEYXZlIEhhbnNlbiB3cm90ZToK
Cj4gSG93IGRpZCB5b3UgZmluZCB0aGlzPyBXaHkgZG9lcyBpdCBtYXR0ZXI/CgpIaSBEYXZlLApJ
IGZvdW5kIHRoaXMgYnkgYXVkaXRpbmcgdGhlIEhQRVQgY29kZSBmb3IgdmFyaWFibGVzIHRoYXQg
YXJlIG9ubHkgCndyaXR0ZW4gZHVyaW5nIGVhcmx5IGJvb3QuIEkgdXNlZCBgZ2l0IGdyZXBgIHRv
IHRyYWNlIGV2ZXJ5IHdyaXRlIAphY2Nlc3MgdG8gdGhlc2UgdmFyaWFibGVzIGFuZCBjb25maXJt
ZWQgdGhhdCBhbGwgbW9kaWZpY2F0aW9ucyBoYXBwZW4KZXhjbHVzaXZlbHkgaW4gX19pbml0IGZ1
bmN0aW9ucyBvciBlYXJseSBzZXR1cCBwYXRocy4KCkhlcmUgaXMgdGhlIGV4YWN0IGJyZWFrZG93
biBmcm9tIHRoZSB0cmVlOgoKLSBocGV0X2Jsb2NraWQ6IFdyaXR0ZW4gb25seSBpbiBhY3BpX3Bh
cnNlX2hwZXQoKQogIChhcmNoL3g4Ni9rZXJuZWwvYWNwaS9ib290LmM6OTA3KSwgd2hpY2ggaXMg
YW4gX19pbml0IGZ1bmN0aW9uLgoKLSBocGV0X21zaV9kaXNhYmxlOiBXcml0dGVuIG9ubHkgaW4g
ZWFybHlfZGlzYWJsZV9ocGV0X21zaSgpIAogIChhcmNoL3g4Ni9rZXJuZWwvcXVpcmtzLmM6NTI5
KSwgYW4gZWFybHkgUENJIHF1aXJrLgoKLSBocGV0X2ZyZXE6IFdyaXR0ZW4gb25seSBpbiBocGV0
X2VuYWJsZSgpCiAgKGFyY2gveDg2L2tlcm5lbC9ocGV0LmM6MTAyMiksIHdoaWNoIGlzIF9faW5p
dC4KICAKLSBib290X2hwZXRfZGlzYWJsZTogV3JpdHRlbiBvbmx5IGluIGVhcmx5LXF1aXJrcy5j
OjYyNCBhbmQgX19pbml0IAogIHNldHVwIGZ1bmN0aW9ucyBpbiBocGV0LmMgKGxpbmVzIDExMSwg
MTI0LCA5ODQpLgoKV2h5IGl0IG1hdHRlcnM6Ck1hcmtpbmcgdGhlc2UgYXMgX19yb19hZnRlcl9p
bml0IGhhcmRlbnMgdGhlIGtlcm5lbCBieSBwbGFjaW5nIHRoZW0gaW4gdGhlIApyZWFkLW9ubHkg
ZGF0YSBzZWN0aW9uIHBvc3QtaW5pdC4gVGhpcyBwcmV2ZW50cyBhY2NpZGVudGFsIG9yIG1hbGlj
aW91cyAKcnVudGltZSBtb2RpZmljYXRpb25zIChlLmcuLCB2aWEgYSBtZW1vcnkgY29ycnVwdGlv
biBleHBsb2l0KSB0aGF0IGNvdWxkIApzaWxlbnRseSBjb3JydXB0IEhQRVQgZnJlcXVlbmNpZXMg
b3IgYmxvY2sgSURzLCBjYXVzaW5nIHNldmVyZSB0aW1pbmcKaXNzdWVzIG9yIHN5c3RlbSBoYW5n
cy4KCkl0IGFsc28gZXhwbGljaXRseSBkb2N1bWVudHMgdGhlIGludGVudCBmb3IgZnV0dXJlIGRl
dmVsb3BlcnMgdGhhdAp0aGVzZSBhcmUgc3RyaWN0bHkgYm9vdC10aW1lIHZhcmlhYmxlcy4KCkxl
dCBtZSBrbm93IGlmIHRoZXJlIGlzIGFueXRoaW5nIGVsc2UgbmVlZGVkLgoKUmVnYXJkcywKVMO8
cmtlcgo=
