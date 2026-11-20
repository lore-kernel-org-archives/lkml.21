Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795165283;
	b=n94GUNkFZ5i77NSCsxl7zvhvHXOZHI99O6KkHhxTh9KEVWMf1U5IybZJMVkrCWPBGMjt
	 QJCGXkoRBJrBMUskFu8sA/hK3rOCt0tafgZ3B4eOlHxQueo5MD3HfAhQeXxj7Qd/Cwxor
	 pv2rsd9vUeMDpgUCRJoud96URDTPebL0aDaiLOs1iFxEcJOEXr6wIx8auacc5zjLaq2FA
	 Ha4ljZgyHWERH0aMVk69S55o2O1lShjlvViLeDeA9Ehs1Xe3ytWVV0fPnzoD/2u0MCwr+
	 KVKGN8SmYp1mM1oCavP99KCSkIvn3830NlepjWlNZypLx1SCvKRVFrpo2DnWpmd+qsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165283;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
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
	bh=e/MljzW2VR1Q0PRUbW7J1+PBX+wGYSmcUsy2WKmj8iI=;
	b=ot2P2N64w6E6Y2Gv5yz73mfsJBX2h6Aho7GuNAToKUmD2GCqiW4lukJx7z74N/4OB6po
	 LIWJWWipn+fS+Or1R3okCXKFjK68rk9GbhypPHQT0R8aYBv2tCUPLqBJPFeuvm7uyt9tC
	 fW5/t14QYP1X4/K0lEkt0bG8/WcSL8U7Vwdy01EmEgoqSgJyGalx5IwlRJqQeeSe9FppT
	 fGDL7z4+2bvvQmTh5hB6Q+9SHuZxlU9nP/+d5mOLRvB7gNzk8SdC26EtLdQcS9qZPIB1+
	 kuS1yQiBKfrmLHdDV6mR9vNUIYvOsY0N1SBoGGpe4HBUCedOljLa/ESgifTj+HiyxdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=JDpqq0ou;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.32
Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazolkn19011032.outbound.protection.outlook.com [52.103.53.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A55C606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A55C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=JDpqq0ou
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipZKDQjJhXWd2gbGWPhk/+yQ4SR9XRHE9G572p+waevn1LzDPDmMMqlk4kc8RNGPF5xf6ReUDMJO5sglb9wfr+77bvaFk/HecApDBa0orGALSVUX5O5RucRorA0VkiO7lVvSnESC05HVMzxwVRXy6KZxv9m+igbhWJTH+hu0mwz4MTsiAAnY+xhNOxiamYKlGl+beiZgicrq4fgXzgkdy0fmhvsON/SpW1Rf1gNNU4HxTP2Hh5oat9Oky6N/VO28foVCNOSTR10zzraXl6PmltXtKA2O4uh7m0WFvJe1EJvhc7EPhX0pAr46Z4SfSDN8uh8As9hGXXh342r9QbmgHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/MljzW2VR1Q0PRUbW7J1+PBX+wGYSmcUsy2WKmj8iI=;
 b=akrWcJrXXU9AiHKaMjliHcFV86VKsR5tUivFLv55Orcl+2H/h7KLU3rpprHsLpugSehfwZ2dJELKnsg/UnG05F08A7nY8PUIOfE1mt4kEch/tOvAjUvlgD6ybiyUReuaiJRNYe3Ogra8Bd4IUDgJyhLVVusjQvN3C95KrLCkktCxnj1N6Du5hnMZ3MYkSNBLDyBOGrLd2jTi4jYDIjRBpfhtRqyXsyh+KGAZ8Um2+v2jPg3yH51CC1Rr6Nru2U/dWzDDzcfaPR3fcsTk2Gy3kQhCSxMVifj41hLmhyaWpPp4RKs13k30fowEX/+XixNEQL1UikToc95IqJLQ0TRWNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/MljzW2VR1Q0PRUbW7J1+PBX+wGYSmcUsy2WKmj8iI=;
 b=JDpqq0ou6rJpu3M+JdOspn72GdNXV+VRWpgWxonOt6oy9Apsp5iHl0bsAopUGrSSwzDopFwSzl9Qg1XbSVgXA/Nr8v2nD+Qs9brVqbi7h4hbmc19skB+Mm7QmcrEkd3Xvz01CVUKSg0AkV+shcJZCYaAke5tFxAhQgo6/3voMZd9oZE43L3/HROV1woAnJnNDXhNCXrkiW9s6CqbblMDiTOTl8nrEjYm+FtGM+Pzavq05zzKPe9/3LEitLYnw/wLZMz6j8kx3ON7WKn+cYJ0zzggInMJqaloMGQuN1KHgWgS0XjtbMyH5uLBchZ1cSDhfQDZIptCiw0jdtLcGI0SNg==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA1P291MB0254.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:12::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 09:01:20 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 09:01:20 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "arnd@arndb.de" <arnd@arndb.de>
CC: "clemens@ladisch.de" <clemens@ladisch.de>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?=
	<habilerenturker@hotmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
	"syzbot+fc3a448093c17a792368@syzkaller.appspotmail.com"
	<syzbot+fc3a448093c17a792368@syzkaller.appspotmail.com>
Subject: Re: [PATCH RESEND] char/hpet: Fix missing TASK_RUNNING before
 put_user() in hpet_read()
Thread-Topic: [PATCH RESEND] char/hpet: Fix missing TASK_RUNNING before
 put_user() in hpet_read()
Thread-Index: AQHdeFPCUE10c4cdFUKZQgMGtPiX57c15esAgADEqwA=
Date: Fri, 20 Nov 2026 09:01:20 +0000
Message-ID: <20261120090118.122217-1-habilerenturker@hotmail.com>
References: <0efc7469-55fd-4295-bea2-04881f2758a2@app.fastmail.com>
In-Reply-To: <0efc7469-55fd-4295-bea2-04881f2758a2@app.fastmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA1P291MB0254:EE_
x-ms-office365-filtering-correlation-id: 1de53def-4421-4c8d-1d35-08df46e4d82f
x-microsoft-antispam:
 BCL:0;ARA:14566002|38102599003|21061999006|15080799012|25010399006|51005399006|31061999003|8062599012|19110799012|8060799015|24021099003|55001999006|2604032031799003|440099028|3412199025|102099032|40105399003|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?VngzcnhWb3lsSEMxeXJ1VjIyNVJnOXI5cDlLMFkrcWlXNm5kM09vU1ErblMy?=
 =?utf-8?B?WVh5emtVdXlKT2VSVFpTTys4YUorWkMxOTZvSEp1Z09rbnk0OTd5dGhsc3Mw?=
 =?utf-8?B?NnBVZC8vZ0hOeDg2cEJ0MCtxTXdQTFo3SitrWTFlaldOQVA1SjBYc3hOQWo2?=
 =?utf-8?B?QW1MZ1lRVVNrQ2tsT3E2T2lCUmRtMHRzOFVFUk5ycXorLzhYSVZHUTg0SlpH?=
 =?utf-8?B?U3BjTnRkUkx0MDJubW0wNVljc3JiZU9JOHQrMmJEdWR0TGlQdDhjeTVNL0Rk?=
 =?utf-8?B?QkVNQno3T3BXTHNjb0pJS0dFK3pyNVlJLzk4dkFpTDFLOXY1MERhUjhmeXAw?=
 =?utf-8?B?bytDeXdRcjd1V08zQVRBakZ1NUNQeUlTQ3Y1dWU4UG9sclpQdlB4cnhLVVJ1?=
 =?utf-8?B?c3cvNFA4SXhxYUtzenJBUkFkNFdDZkdxaFdnY2tLaEt3cGlzbWhMTCtkT3Rj?=
 =?utf-8?B?NVZZN2xvSG5LOEU5WUVTeStLbW1ieWE4dTJWVUE4Y1U4M2ZUYWZHcjBnU1Bq?=
 =?utf-8?B?S0ZHSTJyaTN2Q2hXNlhIVGc0MCtlL2ZieWxPbGNKU2Y3K1VSZ1ljaUhIK0ZS?=
 =?utf-8?B?SG9RZk9NaWtnUkJycWxUa2p6Y2xUb2ppdlNoMzhtdWJTS3JmWXJ6akkyWjJU?=
 =?utf-8?B?cHJNOVZFL3RvdDFPRG5tSzEwME9aZ0RMQVZJUzdmM01GeUQxYlRScmVpWDRY?=
 =?utf-8?B?K0I2UVk3STdQek9aaUxhQWFRZkM5R2lZckl2aVZ2UUllalR2YVZ0M3hSSGpZ?=
 =?utf-8?B?VVpjUWhGbWRxTklObmgxaUlLNmZ6U25ZaDl2eStNRmx3a3dEVm1QWENhRlE4?=
 =?utf-8?B?ZVZVd3E2dm1DVHlOWmIwU05QbkVnZ0NBaVcwTDY4eFpLOHIwWTh5TVZaamts?=
 =?utf-8?B?Z1VHc0RGUmhmd0pYSGpocXNsZUZXaWFKOWJHVVBybW9GS2RIUUtxOVVnTlJU?=
 =?utf-8?B?SVNJdkZhdG1zd2h5TWw2cGRBeENUQi9zZFVzb0QzemxSNkVpN3JKTzk4WHRS?=
 =?utf-8?B?N1VmQmdHL21hMEtXWUd4anJlT1RIdFZ2TFNZY0l1RHUwUGJpQ1FyQjNMN01j?=
 =?utf-8?B?VDFPOU5HWE84NkhxZ0JDWUdUQnNOa0hPQVJPemhKa0t5UmdsVEx3aUVxZGlB?=
 =?utf-8?B?SHJXWG9zdkxLWDJCNUFhVjlyWGRuVUVNN00rSTJTSUJjY3U0T1NWVnFrM0k5?=
 =?utf-8?B?NkY4RHBVVmRQbmxuSnBnbGlOR08yRlBraVhsMmNkaXdsRUIwRUdDcE9PLytJ?=
 =?utf-8?B?MncwOG9VeFJ1TWlRdjBuZkN0QmJwVEc1a2FacTJyYXJvUUVFZXprNnNZVFpP?=
 =?utf-8?B?TkcxUyszeU5NWS8zQi93L0t4SGJUcUliZmVqWUF2bUJwTU1yRkI1SEUwSnlp?=
 =?utf-8?B?d1NDdUJmenRXL09QU3pGbEVRRWlUbnFZYTM2dmEzbHJTbXUvMHk4V2ZZczBr?=
 =?utf-8?B?Wk0xemZNOTR5OVVHMm5LNmFHckhiU29oQk9YUEUxNEgrOGkwbVpYaU1panB4?=
 =?utf-8?Q?ajs/M8=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmlHcjlVaFpsbDRPUDMxd3Z3a1pDZnM3Yld5ZHUrbXdLVGFIbGYrWk1TODE1?=
 =?utf-8?B?dkdrSjVBQzYvbXJoRW84Uzc1SDhnVTFqSlNaUlluckFSWEk1aU1yL1pRVjYr?=
 =?utf-8?B?L3ExZm1TdVFSNnVUN0xUZGZEY2FDbUcyTVlrTnBPbEhhbklPcWpoNFJKT1h0?=
 =?utf-8?B?TVJWVUQ2UzdGZ1BKeWVjK3dZRUluT045N0xnei9GcTc1Tjl6cThLdUg4bi9O?=
 =?utf-8?B?VE5ybXBSUFYxODBMcHlhTXhMai83dzBvS1FtdlhtVjJidkNUbEpLYk9teGpt?=
 =?utf-8?B?aWxXOU0wK1UxeUxrVCtZMVFncUlFL0JCVVpHMFVkN1RGak5HUVp1WjFueUtS?=
 =?utf-8?B?ZmVHVHVCMHE4bHlmbFl1VFVCTjYyWmdnK2FtUkNsOW1HQXJDNWsvVVQydllT?=
 =?utf-8?B?SVpKNGpKdjArNHlRU0FHVVB0VkduT0pxdzlQbFpsZFAwODhmNm1NODZuNyt2?=
 =?utf-8?B?b2JBR1BJSmFyTjZLN2ZNcnBRY0FvaGFaemRiUlBxcExkbGRzOTlwRlpiZk5D?=
 =?utf-8?B?WG1OOHlBTDRDNEY3bFZnZFdyZys1U3hhdVZsOUQrRndSV1ZRSnU1QlR0YkhZ?=
 =?utf-8?B?ZEw5WHBIQWRXeFdqY1M3UjE0ZFhlL3FiQWJLQjVkMVRaekJUYTVBYTZYdmtw?=
 =?utf-8?B?M0NtMFV3V1JlSFBPNEtrbDM0eEwxRXU0MGlGNGZrMU1hcHp0MkloZERib3Fj?=
 =?utf-8?B?cGFZUFU3bXEraytjOG0yeWZtVjdVMUt3L29aa2lYcUViTVdJTGpnK2ViekMz?=
 =?utf-8?B?dFAxMXEraHhFVlJBZkZ3Zm5sVWRmelNZWFVpRVU4N1hFbnRnSGlQenNPY1N3?=
 =?utf-8?B?Q0dIZTVsNmhyMU9RUWpJbTYyaC8yWUFrY3FUQXJlcytNeUxSZ0dSb0V2dmxU?=
 =?utf-8?B?eGR2Nk1kVTY1VUFhZk5DQ20zNHM0V0wvSWkzTHRjMVBqYlVmS0FzUHZtbFRD?=
 =?utf-8?B?dklRWmUyeUp0T1luL3hoTmRHY0RZdFc3QXdnQ3hxUUlRUXhDT3k4QWtnYVVT?=
 =?utf-8?B?NUpTZ3I0cE1yUEVKbVpPaUt4Ym5HUDRXamEvNVBoS25KSnM1YUJReUE2ZXhz?=
 =?utf-8?B?Ym1uVCtTR2dBcHgvZFQyYzE5MHc2L3FQSTZpRzJFaGlMbGZLN2lpSWw3MVht?=
 =?utf-8?B?blRUWCt2dm9nMlZ0RWRxTmovMDZ0dDFzUTBnQjdEN08vK2pCYm5EVkhWS2s4?=
 =?utf-8?B?RlVoNm81NzdhK1dVejRSY2hrdFp0ckphN1RCZzRxdjQxdTIxOW5WOTYzTyt6?=
 =?utf-8?B?dUVEbnFiRktvYlFtL1FHeUM2cGFlbHhiWDRrSVBCb0FiV0c5MTd3L2E1bkdW?=
 =?utf-8?B?Y1hnakM3bUpCQWlZVkxmanpUdW02MzRqZStubTB1MnB5QXA2cmw2S2h1Ti9O?=
 =?utf-8?B?QndUYUt2ZUJaM0c1ZGJNZ1pvR3l1K0ZvV3R3VTA0R2FoMnpzei9QNU1WaWE4?=
 =?utf-8?B?Y211ZmszSXVYRVprcXk3a1NJcjc0ZlVXRlR2cmZtbHB6bnNRUTBZY1Rrc1Vl?=
 =?utf-8?B?NlI1cTVhRDJkUUVlbjBOMjRRU09jNWtYem9nN3ZxYWc0a3VrRDlJekxTaEIy?=
 =?utf-8?B?QU14a1JMdWQ5VURzQ1gwWW5qSjRWZ0pyYlB3Mk5DeThwVU5YbVIwVFJVeDZB?=
 =?utf-8?B?Sm9ta3NSZ0V5ZG42MktmYzlyK1lReXBZbHB5cHErSmpRdWFDSUJla3hmeFdi?=
 =?utf-8?B?ZEJ5bUZ0cldmcFVEOUV2aW5RS2FZMmpKelZXa1F5Z1RSREowVDduWmFPSFBp?=
 =?utf-8?B?TGV4MktDeDg2QVkxdkVBOERlQ3pZUzRjRlJVdHArSHZwckVqa1F5Q1FXaDBM?=
 =?utf-8?B?Rm4zVTZOQTUyZmNMT1NzN2R3SUtyRXhjRzI5TkJCOGVXY1ZHOFdna2oxOWx3?=
 =?utf-8?Q?z6GdnQlbavN81?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6B4F46A5356B0488E97C84DC7250865@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de53def-4421-4c8d-1d35-08df46e4d82f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 09:01:20.2160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0254

T24gVGh1LCBOb3YgMTksIDIwMjYgYXQgMTA6MTY6NDhQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBJIHRoaW5rIHRoZSB3YXJuaW5nIGNhbWUgZnJvbSA4ZWIyM2I5ZjM1YWEgKCJzY2hl
ZDogRGVidWcgbmVzdGVkIHNsZWVwcyIpLAo+IHRoZSBiZWhhdmlvciBzZWVtcyB0byBiZSBvbGRl
ci4gTWF5YmUgYnkgdGhhdCB0aW1lIHVzZXIgaGFkIG1vdmVkCj4gb24gZnJvbSAvZGV2L2hwZXQg
dG8gcG9zaXggdGltZXJzPwoKSGkgQXJuZCwKCkluZGVlZCwgd2l0aCA4ZWIyM2I5ZjM1YWEsIHRo
ZSB3YXJuaW5nIHdhcyBpbnRyb2R1Y2VkIGluIHYzLjE5LgoKSSB3aWxsIHByZXBhcmUgYSB2MyBw
YXRjaCBhbmQgaW5kaWNhdGUgdGhpcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCgpTaW5jZSB0aGlz
IGJlaGF2aW91ciB3YXMgcHJlc2VudCB3aXRoIDFkYTE3N2U0YzNmNCwKSSB3aWxsIHVzZSBgQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmdgIGluc3RlYWQgb2YgYSBgRml4ZXM6YCB0YWcuCgpUaGFu
ayB5b3UgZm9yIHRoZSBjb250ZXh0IGFuZCBjbGFyaWZpY2F0aW9uLgoKUmVnYXJkcywKVMO8cmtl
cgo=
