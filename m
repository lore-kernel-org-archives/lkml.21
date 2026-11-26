Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795718664;
	b=r0jQuJngTui3Clphy2Q5bxVxLBqMCf9ZdiIqOh8bw/X3gg1mmF3MKH3jPjwrUjjOCJ1O
	 k4w3V1tp52gSX/e3uxg7GmQP7pzuPgGFJpz6kdGw2IgqoQRD1VUqMhKTId/oU4rMOIKea
	 1inh7mBDcaUIP4iGMWQdpujzCmL3RuOmGzoYibwt77VClXRXDOdgt2QUwLLFQvygJvG+L
	 po6ZInLOJaOd3Buge42guGM7rQlGQiLFr9YFftWRCxIWVx8+OeqDvaYerqRx2LnMxbKSL
	 BKNw0/BYcAcDlPqiD8UBTNJ/JPvrF/a3eYUrVKEZHkC+8c0ZycbAIjZXm09vveaOMUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718664;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=bqqY5Z5rol1g/Hc65Y60+6FrfUyz4bsV6STmWi9QxjM=;
	b=wg3ZT+IFCnMsmIHWGdBIow01ycoqgarp99n4g5X9xvi5jyFgR9oR1Hv0muddWWFZCCeu
	 wgP9lHEXNhl8U65MXbZkBFGirERCxiLu5c9SJTlPG7QfZuXtVcccu+ksixS+IKWPOkiLc
	 tyZMXqR7S5PqzssRq9dVWLAx3fVYhpGpu+uxaacZHhwDEf9HvSq5yDMXnwzhJbNiaKZHl
	 BJNgE3O6I4dG37me6Cf8b8oBoSYqWqEKHIDQ4o5aIkSlggKTeN/GZVFQqJ2yVV3Zymvg4
	 W5956nF7NWyojdgj7Ib0aT62yHk6aYSak+eMipuo/YmmSQQwZPjmjNpPYkuSvW12z/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gqcHuWuh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.39
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010039.outbound.protection.outlook.com [52.101.46.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBD8606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EBD8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gqcHuWuh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4z4XfxhVdlGeuZYxmSGY/wO3Q+NqRFj7s+SVEpq8nLI9dHuemPchAWMy2mxCy9jVVMtRC1bWoLpagMQwtwAYTyxg9mvos4K+Mk/LfO/GbcGsFzAQgcWizphfCMjKdfwql9LplUNv4Cnko8wmLO37zcq1BTdnD43craqkWXjD1230zxBEZB2qzt9gyXjBAATkPymuITaldRFV6jUfZQoxWnKkAFx/sgCixEhMOVCQaklkY+RzJHfCB/fKQ4jFoajPFDiH894whi9eReig31zLvg7CALGxHYKk7xnuElLI9EsfVAPph9is2eXDjYlFOuvr+NvOvJZVnfhG13hSIZrAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqqY5Z5rol1g/Hc65Y60+6FrfUyz4bsV6STmWi9QxjM=;
 b=H3bGv0/OBLK6IsaNi5A3lFImadxcPw89qX0LQbcdbua+HiB4yrKFDgO+oYY7cUPDqr39Tlprg6e8yI2gKpeCpbt0JaUXxcyxZ7ceVq7dRSePayrM284hj+aWYSyEexguZe2O+/xzHfsrNmRavrY4kqph13dSjRxprJZmOwTh9wsvqAFwuymw2WG8b1wKR7WXiQyWMEm6G9v9BAKTiWIZWTvrYT5ywq/cGfMQYtQ6+GcDK3TcCHBPPn8L59fc+0iG5kmxTSM7veMBWZgV4QgZVpkFFW4gX0fazYi4spajz5a5v8/s7U3pIOdPrtllIsHtLdjTCNPQ8ZWZAN+JcQpKCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqqY5Z5rol1g/Hc65Y60+6FrfUyz4bsV6STmWi9QxjM=;
 b=gqcHuWuh8IUjKBasuJSdMx3K+PxxIFRnBOMEYXhikbmxh1hc5Ik5bT2WgnsE/J2vZ6zm8l9+WNlfeDDK/qtvHb2j+NulZbaDoRdFnyfl6en1gFEJNHtNFrr/lE+XlX19AaCC0pd13c+UpmaDCjRHa1NbNScMSxQaU6uWEp5jkjQ=
Received: from BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 by SJ2PR12MB8160.namprd12.prod.outlook.com (2603:10b6:a03:4af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 18:44:17 +0000
Received: from BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed]) by BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 18:44:17 +0000
From: "Garg, Shivank" <shivankg@amd.com>
To: "tejavojjala@google.com" <tejavojjala@google.com>, "Rao, Bharata Bhasker"
	<bharata@amd.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"david.laight.linux@gmail.com" <david.laight.linux@gmail.com>,
	"ankur.a.arora@oracle.com" <ankur.a.arora@oracle.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"vbabka@kernel.org" <vbabka@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "surenb@google.com"
	<surenb@google.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"nhuhuan@google.com" <nhuhuan@google.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "liam@infradead.org"
	<liam@infradead.org>, "Salunke, Hrushikesh" <Hrushikesh.Salunke@amd.com>,
	"bp@alien8.de" <bp@alien8.de>, "mhocko@suse.com" <mhocko@suse.com>,
	"ljs@kernel.org" <ljs@kernel.org>, "rientjes@google.com"
	<rientjes@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>,
	"torvalds@linuxfoundation.org" <torvalds@linuxfoundation.org>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3] mm: introduce copy_mc_highpages() and batch copy in
 folio_mc_copy()
Thread-Topic: [PATCH v3] mm: introduce copy_mc_highpages() and batch copy in
 folio_mc_copy()
Thread-Index: AQHde2cVdNDdRagqI0WgqtwpzpVG17dAtXYA
Date: Thu, 26 Nov 2026 18:44:16 +0000
Message-ID: <8ef0c61f525f3a1881d2717b1b7e43cd74d7674e.camel@amd.com>
References: <20261113-batpagecopy-v3-1-297f5b2fd28e@amd.com>
	 <7639d5f0-3dfb-4446-ab04-51317f604a69@kernel.org>
In-Reply-To: <7639d5f0-3dfb-4446-ab04-51317f604a69@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5259:EE_|SJ2PR12MB8160:EE_
x-ms-office365-filtering-correlation-id: c431f202-4678-4302-7d8e-08df4bed4657
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|921020|261026121527099003|38070700021|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 keuanFcYABdnhQSCIRARKzNJcGGXm8luC++xQD0VutFm/FexbKZ+dv/c3QtvaYCuQv+H4YvTioo86YYUvSumpi7JsOIAElrEFg2J8CPjd6oJVoo8QljqJ5CesO1j6lLVWZAAJrgt9l5M2uOztAOaHeEkmALiTHKCc+iLcIho7vve42VBUy2/n0UCjN+4XXxYJpvs/aL0SIoHvgSHwnXZxFG6XMnQ+Hdwn8FtsxeOFCpcfYiOD8eNf331OWnaHX99yAr8SrIbcFgGEl6fWb4aVwCGluhojeYs8EaL1Xf+OpjhMGQL+1nax8VyrBnelrFTtZoA3CPUgPXA/ZVDHZMFtRamJgKmVM/8z5kWtzZN089urYH0oTGmPbpZRGW0RjaKcTcpLKHHlBk5BVpzGjerxKjgekSdmq6suS9lExWQ5fqE6JkT+ec8iaAF2B9acf4Q6jXTeaRgRnITFwOFSj2w6epZEATsMu6xO8BC5ORGgEL8ngHysrt3W30u64BUqmjmmwl2N9x78lWtkDCjt7iZJt2BUycgkP8wFjLdoFlH5kuw9YQyyDjgxOUl6mzARDwj7BZBGH4qhVX47M+RwzSq54w7hVwRa3reFVrrurtGpY9Wdj04zWSdWwZgggE1vGtHIbYIBMx0nP0D3Z+mu1AxgXSHJJJ4UAe4K7AI3EQIBjAepAUG0PT6MPeLEGZwXKJfBsCf+Xr/Ny4RmKiYMZgbyzQZ0jtrsrBr3kZJSfOz1OA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5259.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(921020)(261026121527099003)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZmQwMEo1Q2M5czA5YTB6QUQ3Z0ZiVDNtcm96RWNlSDMwNjhKbndVSlAyY3dD?=
 =?utf-8?B?amllaWxOeHpXTzNCYnd6YXltOFA0OWJocjd1dElrczZIU0RDMFF4RUpaTnd3?=
 =?utf-8?B?NGxoQnZhU1ZLaS84NHJTUUVtc1hjcjFuSE9LbHNJOUs2S2orR0Q2cStkOGxu?=
 =?utf-8?B?TGdqckZ1S1hyMVlRUFQ5d0JYVTc5QTVraElDUWdOY0ZVYWQzbk9zL1dUQ1Bt?=
 =?utf-8?B?cjNkVTVndjJ0eTZLM1VJeUIyekRqaVVGVTgzZEQxM3NjNE9aK05LSmtWWjFK?=
 =?utf-8?B?VWdYemh3aG1jNGlvZnVKMTFYZzVialgyTWJQYWtxT3h4WklLcUgrK0x0WlJn?=
 =?utf-8?B?SUswK2FUaWt4ZDJ6TVBVR1YyQWk0aTZrdVU0RXJVQUVYWG44MGx6emo4OUhp?=
 =?utf-8?B?QjdRYmFhYWxTYmVyYURmMHZ1VVQvM1gyamZjVEJWVUFVOWlEMkN4NHBsQ0V2?=
 =?utf-8?B?U0F0ZDNZTFpRQk9QME5XdWIxQ2RidGYzU0hTZnhGVkdBY1VBL2FFbDRWQk9n?=
 =?utf-8?B?NCtLWWtKTXBzblVaL1NCdnl5N1FnMnpZNTExWnkwbnllcStKWVhrQjhIV1Nh?=
 =?utf-8?B?dFZIby83UVpMMVQ1U1NDR056ZWV4eHBZRzYwQlJpblI4NTZuMlpYaTViUmE1?=
 =?utf-8?B?YTJxbUs2SmtId2hGQUNTY2tDUjdidUt0Z0pYN1VXSjAvTzBqcTd1K28xektx?=
 =?utf-8?B?aUJYcGUzQlU3SWRnN1hxNVdpRXJrbUJwZEYxMisrSk1jOFV3NjNnbDFIV2lj?=
 =?utf-8?B?R3ZUUW1SaUN6NEFRSXZOZXU1czVXRGhDUWxEU3AxNXlldGJ4VUhiaHQrRnF1?=
 =?utf-8?B?S1RtVldnSUJYYWZVSU5mWWFGaFFkWXY1eWp3UUNJc0tMamNkNHk4dmxaUmll?=
 =?utf-8?B?Znk0dk9QSStHYlVlOWVtc3F4aTdvTDRQVmlsbzlxUW1jNFR5ZTdsSnZHdUZI?=
 =?utf-8?B?M0tTRTRtblRDYlZuTUhXUWVDa2JnNEhwcHlWY01DMkdEeWVwdTN4cmFpcUNN?=
 =?utf-8?B?R0FvVlZjQis4dDdRSmdkQmJHYkJ5Qm0zMHhzZEJIL0owU0NlNUNGM3VsdDBl?=
 =?utf-8?B?Y0VJK0JxMGZnT041TUFCZXJtSmFLbzZ0ZThrOGVUS3FiYjEyVWw1djRnYlRh?=
 =?utf-8?B?dlUxZXpMajY0Y1lqL3VhaHBRZGJEakVSSDBueGN2NThsNks4YTNJdmdGd2lq?=
 =?utf-8?B?NUZWd09ycG5ZTjdkTCt0amJLMDhHSytsa2RjMkFtOXZ5dVd3dW9LSEVzZ1p4?=
 =?utf-8?B?dWF0WDE4blNMNnoyZlk2cUhzcnh0ZjR2bEREbFF0bEIwZkdlY3hxZ3BMZndl?=
 =?utf-8?B?Q3ZTWlNOTW9lZ0xkUGFsdlU5KzZFdzZIUkZHTDZPMUs1dUI5alVBbllaQkFD?=
 =?utf-8?B?U01SZmNQbXhoODA0aTlaa2dKWDNBZ1dxT0VJcWZPUHJ2aE1PUUFzMEtrLzM1?=
 =?utf-8?B?c1hTdVI0cGhyaGRlc3NPTmtZSTJ6YWxiWjZ5NGdkQXpZZ0cvQVo1d3drS3hE?=
 =?utf-8?B?OFRVMGZMV08xRmNmTVlkcldtQlJQZ05FNEI0NXljeXZMZTNIVVpxUEF2SXFF?=
 =?utf-8?B?V1NKNU9kUzRiZHRDV1l3dVc3MjhRMDFiQUZwaWtVSnRwc01mZHpCdWZla3pp?=
 =?utf-8?B?S0F2ZDJEZDhYcW1KWDM0Z0g1OUdjQjdaaDNLL1RZYUs5aVdZaEVubGx4RFk1?=
 =?utf-8?B?TTQ2QkIvbzRua3AyRWpwcjAyTW8rb0hnQ0ZycHczZDJldFg0UERuZm9Ua011?=
 =?utf-8?B?TFNOTEh4NGNaU3dBNisrbEJkaWhoV3lSUk8yS1pCUWZmSGRpdkJUQnFnMTVt?=
 =?utf-8?B?dW9OQy96NjRBQzNIU1RqZ1o5UmJqOHAwV3FRcWRVdGx0R25ETmZiaDVDcTh4?=
 =?utf-8?B?NWcrbkVzTEVCcUdHOE01N3NmSkRBTUZuLyt3eDNEMDZhS2d2dUpvZU1UTFlG?=
 =?utf-8?B?djhwTHBQUk9mQWlUK0t3WWJUa0hvckZ0aTdmcWRHRWprMzkzWjNZdndDbXIy?=
 =?utf-8?B?RlBnR2JQNGl4a1JidWlPUHVxMll5TUxucjlieXlrZGRKV2pNVU1ub0FnZnJ5?=
 =?utf-8?B?VkZhZEQwVmMwN011d0tNRlJPQW5pZnZwbDRzVmszUCtDV1o2cmc4T240U3Vp?=
 =?utf-8?B?ZkxkSWtHZzhXNCtGaFZzam4ya1ZpM3Jib2J3Tkl5T1crR2xnQlUrcFUzd004?=
 =?utf-8?B?Q1RTUldVd2tqcGlYZFloeEZxbGxOOVVCTFlJZmd3OWIzUE5pM1lLdXEwU2dz?=
 =?utf-8?B?cGhHMlQ3UzNyME1xVjR1Yy9tZ1M5Z2I5VlV3RXY4K1BoQ2Vnemx4SmxqUUN3?=
 =?utf-8?B?UGV2Z0tHbUNwT2pyeTh4QVFYd3lrdlNUUlpXcUtKeDIrUy9hY2ttUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DCDDB8F00EFD34CA65A64B6146348FB@namprd12.prod.outlook.com>
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
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5259.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c431f202-4678-4302-7d8e-08df4bed4657
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 18:44:16.8956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rWYhIWP6ps5evT4YeErbuHJ7UZOBrJtaVncBIMWUbi964/Ms0/KtN2X7wgz8Hk7QXBJkimLkBYRqLRNLiu3qIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8160

T24gTW9uLCAyMDI2LTExLTIzIGF0IDE3OjIzICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCAoQXJt
KSB3cm90ZToNCj4gT24gMTEvMTMvMjYgMTg6MDksIFNoaXZhbmsgR2FyZyB3cm90ZToNCj4gPiBm
b2xpb19tY19jb3B5KCkgY29waWVzIGEgZm9saW8gb25lIHBhZ2UgYXQgYSB0aW1lIHdpdGggY29w
eV9tY19oaWdocGFnZSgpLA0KPHNuaXA+DQo+ID4gLQ0KPiA+IC0JcmV0dXJuIDA7DQo+ID4gKwly
ZXR1cm4gY29weV9tY19oaWdocGFnZXMoZm9saW9fcGFnZShkc3QsIDApLCBmb2xpb19wYWdlKHNy
YywgMCksDQo+ID4gKwkJCQkgZm9saW9fbnJfcGFnZXMoc3JjKSk7DQo+ID4gIH0NCj4gDQo+IFdo
YXQgYnVncyBtZSBhIGJpdCBpcyB0aGF0IHdlIGFyZSBub3QgdGFja2xpbmcgY29weV91c2VyX2xh
cmdlX2ZvbGlvKCkuIFNvIHRoaXMNCj4gbG9va3MgaW5jb21wbGV0ZS4NCj4gDQo+IFRoZXJlLCB3
ZSBzdGlsbCBoYXZlIHRoaXMuIFRoYXQga2VlcHMgdGhpcyBwcm9jZXNzX2h1Z2VfcGFnZSgpIG1h
Y2hpbmVyeSBhbGl2ZSwNCj4gYW5kIGEgc3BlY2lhbCBjYXNlIGZvciBnaWdhbnRpYyBwYWdlcyAo
Y29weV91c2VyX2dpZ2FudGljX3BhZ2UpLg0KDQpBZ3JlZWQuDQoNCj4gDQo+IE1lYW53aGlsZSwg
Zm9saW9femVyb191c2VyKCkgbW92ZWQgdG8gYSByYW5nZS1iYXNlZCBhcHByb2FjaCBhbmQgYWJh
bmRvbmVkIHRoYXQuDQo+IA0KPiBDYW4gd2UgY2xlYW4gYWxsIHRoYXQgdXAgYXMgd2VsbCB3aGls
ZSB3ZSBhcmUgYXQgaXQ/DQo+IA0KPiBUaGVzZSBsb29rIGxpa2UgZXhjZWxsZW50IGNhbmRpZGF0
cyBmb3IgdXNpbmcgY29weV9tY191c2VyX2hpZ2hwYWdlcygpIGFzIHdlbGwuDQoNCkkndmUgc3Rh
cnRlZCB3b3JraW5nIG9uIHRoaXMgYW5kIHRoZSBjbGVhbnVwcyBhcm91bmQgaXQuDQoNCkFzIGNv
cHlfbWNfaGlnaHBhZ2VzKCkgcGF0Y2ggc3RhbmRzIG9uIGl0cyBvd24sIEknZCBwcmVmZXIgdG8g
cG9zdCB0aG9zZSBhcyBmb2xsb3ctdXANCnNlcmllcyBvbiB0b3AuDQoNCkRvZXMgdGhhdCB3b3Jr
IGZvciB5b3UsIG9yIHdvdWxkIHlvdSBwcmVmZXIgaXQgaW4gb25lIHNlcmllcyB0b2dldGhlcj8N
Cg0KVGhhbmtzLA0KU2hpdmFuaw0K
