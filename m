Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795640871;
	b=yll7xNifn1cCuL4x53sAAX7Y++eWf8ZHrXZMoGEdgCWB17oueNXINub2ugV9vlk6b0zq
	 JPLFCSG6PRgupkE8NYgW0vhwTvNWvsmLEG28t92PaFWx2Kw5VEHlVMMfEoW9mMN9MCpSY
	 5KDeREtPkG24Us7atyMRkoeJA6d/vYsbLO6NrLzvlfMNRDJsiBKP5eo19wdooH/9+tD1k
	 P5Nam/kAJ+HQaSeYOk6uWyJ4B5YX0/eNso5L6A+PiHV1Kg3b//t+gfU2xE0aYL4HkFaC9
	 GFF5F+GvE1ulx0vIqh/ChEmUe5MspHV6YFPBAqThyyAS/+mOYbqcaRv1yIE4VZHyfQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640871;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=7X191HInW7X/MCx3/tvfFzy8rVm9dFA4IklDuXPHsUg=;
	b=rY76WqlfjLUuqDL35rcNcBLznqSI8B47I/N2Ec5NpvI9uQRzNmsqemBK3TIuAMBPGgXP
	 jeF0/2boucYKN/2hVjXLehci25IJDxu08l6dDmB2P0sB8M+g1gtZ8LDWegALQyRMwUl2P
	 5Erts00RmxmbBYyKK4uSP+Pr6rHFocjOyWr/CpX4jXS/MHF2pHEqz/zRiy9vQPsbfTgv4
	 rvJyPyMPKI4avVkdr+P4ivM00ZJtWxtV79bj8d/WW5xEdrTihtiDgVpnomQe2hq3mEk4a
	 uokJWsgKwA4G3j9MfcynvcsdnfUSBar7uIat7Z8JsiWEQ/P+gc2OTLGpT7AP3BNKHpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ikPwrjNc;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BcPheV3W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA80A606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA80A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ikPwrjNc;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BcPheV3W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795640870; x=1827176870;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7X191HInW7X/MCx3/tvfFzy8rVm9dFA4IklDuXPHsUg=;
  b=ikPwrjNcgwiTOY/cnRq6PGeGb+8WvDYqH548BZ7FTFrlzNOrzEh/u0Zp
   FiEvEsKwgpwvV1ANvj0Rkjw/9l0r0b40xSW4nHoq1PWc/JwQoJlHORAUN
   BMG0Z53l6hzDRqmZRE1t/9DmqjjrW/vXDtBshFvBeavaunyjORSPFsHnL
   /ot+UA5aBvBKcLZh0yWfU0yDxnzP77hV2izPC1GFrqiwegkhQ21IANET+
   g3ix45r8EYGXifBK1pYQnKAVfDVIoSc7T1R9PvJMwfhALel/rJk1D/r3a
   AH62WD1JKtkXc0ZGzLZGMBpBtIylKbW1y3AH/0yG7BO/UdhVHUrr5KIVB
   Q==;
X-CSE-ConnectionGUID: g5/MoiTYS2eltA1ZefnA2w==
X-CSE-MsgGUID: yNQGWivJRh+9P3uGSnDDGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4549265"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4549265"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 13:07:49 -0800
X-CSE-ConnectionGUID: KYahzgoRRfW4VB67hCY54w==
X-CSE-MsgGUID: ajp1ozAQSo6R5jgPYJjrIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11838634"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 12:40:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 12:40:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 12:40:28 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 12:40:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1zUeSSpy75163Ihg/PHG2fsdPPP40WjKTiFy31o9BocD0brT0U478r3zRP8+rAHEnseL/SQphhf8u4etGWcCQ+/AVIkvfWfK+h1roCYxIRPsE52+vT8RiMyQLDh6zN7txI7dh4bJ50vgJWICTJzqQwoi7DzAynxYIwIAqi3gj/NsfEWY0VlLSZgXXtdiTi4DWGDMaI7ilV1i25sui6JCHdrTRfc5KXHzALF8azoJfgDVHkTaRVaHpPbWiNokWXnQvC39yyJDYG1ZFE9krsZMwjURoc0+bpVhfyTlAjuwHuAE2W87s1nDvsDg7noRI2SXhDyw/IjkeH/1nWKWaSJvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7X191HInW7X/MCx3/tvfFzy8rVm9dFA4IklDuXPHsUg=;
 b=pMLfWTYT4xtvEQQ1pI6/GrHUUczpyygUr+64Va5kZeu2ddfVci4wMLZ7SLhz4jsvsYnc7dv1jcnEpiHfSj1tf2FPrNLa0glhwuulRMeZqYsZIo3CG07LqgOWT+GAS4u6YV3Y/tbTR1MUOacmr1l4uriYxfntFoSRDzhc5Z/JWjV+Rrn59UOzRHArhFsJ6N0ehRnF5hBUcem2aCvcq6rvLg6IojCZDsi1pvzrq+dbVuS8/4aTlQIgo64SeDHzBAbBQfDf6fCOOLyuaHMV/Z+4Drg/zkCacGtON4uoNOrkaSGNUrYUyXDGMRNzWQO1zP6f1+oCbLx4n5gA0e/M5/kaIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7X191HInW7X/MCx3/tvfFzy8rVm9dFA4IklDuXPHsUg=;
 b=BcPheV3WraWe4t+KB+LHTFGN1eQR1ZYXmjTv+nNvz6cGOP30CzDBWxXSec99tIOPJ9vdVWwyyJ0hc41YBNHhp7ZYktWGLl+ia55wjToThmdWc5VrlTCtSmjcJBLmF/qNV5oGQij3kL+PDUEW7Pg9Io2xapVLzr2WAwYhNt9PV/Q=
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by CH0PR11MB5250.namprd11.prod.outlook.com
 (2603:10b6:610:e1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 20:38:19 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 20:38:18 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>
CC: "luto@kernel.org" <luto@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "bp@alien8.de"
	<bp@alien8.de>, "tglx@kernel.org" <tglx@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/9] x86/mm/pat: flush the TLB when only an alias mapping
 changed
Thread-Topic: [PATCH 1/9] x86/mm/pat: flush the TLB when only an alias mapping
 changed
Thread-Index: AQHdcsNTwQm1C6E9DEuvLmaIGq2Pnbc95pgAgACqkACAAMMegA==
Date: Wed, 25 Nov 2026 20:38:18 +0000
Message-ID: <6b5c846e80f8bc0f8239a553caad57bcf9b7117d.camel@intel.com>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
	 <20261112-fixes-x86-v1-1-791adb8d6670@kernel.org>
	 <b7bd4a18c420fe65728f4d50b69e2be0d1d39aaa.camel@intel.com>
	 <awajjPwS-dKPnsKT@kernel.org>
In-Reply-To: <awajjPwS-dKPnsKT@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|CH0PR11MB5250:EE_
x-ms-office365-filtering-correlation-id: 8503473d-c168-4702-d897-08df4b340a17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|6133799003|22082099003|18002099003|4143699003|261026121527099003|56012099006|11063799006|261028144727099003|261102123227099003|261022105027099003|261026140227099003|261021121427099003|261009223027099003|261022075727099003|38070700021|10067099003;
x-microsoft-antispam-message-info: F9Q3jOrzajzEeMTTeq9hpUB/AYn/Kg4rjWvhHzpzM3bUkdOcerRCo0bQbQ34E2i80UIBpSp9188tv0gzd5xIxKEjOXBChz/WtaVIhfibJVJ4XZBwlyKWCW+ebWXBAmvESphTTOOL2SL7u6hPgOzJjWEKhmRZpbC2+rIsvbuwKXX+tYC1q/D7rLdhas6HMCRMkeCH2LaB0zShX9U/49BDqK8TiaE82mX285DwlokIL1eQ4p1NNHzYIAP/6SoeHxr03HzFMmcbNh1s4w83G/9OEecQHUBdHkwkTmNr1WZ9x5rEmlUl01U3Tjfh43nsfGo2kpCWd7kdNNJpHGROXXsNMvq1Uy8m11gTcaOws4LYI5KX2iQXtm/3Jc2syrz9Z4hD+9iwSnpjstcNk65ViUdLZJK+OnYc9RXmAG+4GuUWA+Y6cyMsLAAxUbn9svWM8p3dALfnZqzR3MO9Vl4T2vMRNWV5mJHUS+xImTQNi7MeS1Hx86Tk/uxCJ6T0o9lK2CUozP3KYIhhFiXSGDEvq5wwlVqaqFYaKdIm9yDN/y+gJqu5YCyRPbXnLPeRDUNqf53X1DZXFe9oU3eqhbZ4TdAuSr9bi76s9IyOhKaTbWfUFdxOdL9ageGIzVKPlKwjr514CwXBk/nUnihwSQbxHyiHCuZxMBBF/f1DBFtvVDMmWDFlumLrk6tcBO5GqWUYAB7M
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(6133799003)(22082099003)(18002099003)(4143699003)(261026121527099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(261026140227099003)(261021121427099003)(261009223027099003)(261022075727099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1pGY2taQ2tCdS9LY05kZVIybXY2KytsOUVoSTFrclYrWkVLMkRzcFQzcUNr?=
 =?utf-8?B?bzZLeTVwUTJkM3ZXK2Q1K1VyMGpKWjdjZTlWVXdpM1BTdi80S0srVUxUSFdt?=
 =?utf-8?B?U09oTmFGUm9kL0hPZVFOYmcyZjdUQ1gxSzZBS212OHlQLzF2eTMrUi9SeEZK?=
 =?utf-8?B?aHlkakQ1WmxNOTJNNWJ4YWZPQjBmRmpsOHpnNnNsMmFodE0rUXVYUGxlYW1N?=
 =?utf-8?B?VXZIQ0dhb0JZUU96NURwSUFhQVlxQmdWTlJuak5CTEMycUZ6Zit0ektsSlh6?=
 =?utf-8?B?eFNFMGlkTXIwQVRrRzZUUWc3TkdWMks1LzFuRjlkODBSSTJldHBISHJWbVdu?=
 =?utf-8?B?K1BlTUF3a294VVV3dSt2RGlhUjkweVVUZlBPZHZUS1lkc1lNZTJMRXhISWUw?=
 =?utf-8?B?a0IvR3NkQTY3ekd6VVUvV2pmR0UxMHVWbUFkSXd1MFM5WG4vVzV5UHhkcERL?=
 =?utf-8?B?NmN6RkI2cEY2MnRSbXpPaDMyQkFTUm5uUHBGVGdSMU42b2wweW1uTFVPd2lt?=
 =?utf-8?B?alNudmdmQUgxaWJOaEFlQ2U4WWNkUWM3MnFTT1pRSTB1NURBRzg1MzNnQ3Fn?=
 =?utf-8?B?Ti8yK1FGM3BENFlMeFl0MHU0U2dycjB1U3Vzem5hbmdES1FCbEczMFNUbmND?=
 =?utf-8?B?d255RkZGRm9WR1g3YjVaRGRUdHF4UHB1dnZIb0hlL2tSZDRrUTVWQldHMk9o?=
 =?utf-8?B?a2ZLZ0pzbStIdDVKZkZNR0ZVUHlFYnBBdlpNRFNyVWhVT1FNaFBtWGpONm5z?=
 =?utf-8?B?SVVHWkJLT2h2UjM0SjViQ2c0eEl2d1NoYWxtMmpFUUtaU1BrTC94dkdya09x?=
 =?utf-8?B?OEpxb1RKMnlxK2xYRHMwSjJSYXV0eGZ0R2x5YzBmSURWeXp6UlVmT0FNYkRN?=
 =?utf-8?B?V3hNVU5QVU8vdjBqeTFSOTMvcDlTU3hHVGkyTDZKUnZmdG1uWDNYNHNZWWRU?=
 =?utf-8?B?RFd2WVZHeGdxWkVnZGVvMWdXNmJGd0x4NzUrU1ZoSEFML1dlMENBYVRzWXE2?=
 =?utf-8?B?R0tLb05GNTFtdjhCS2dEZU9vNitxaVprVHU3M2NuRFl0LzNiZm9RbXYxdUVE?=
 =?utf-8?B?TmpSeGkvSEpsZjdGVTJVZ3hMY3VtTUJjczhnd0dHYWd0aFV2WlVscWJ6bU51?=
 =?utf-8?B?Y0o2N0RNNk1leE5JbHBTK3RnQ1BxUVQ5QTNjd3RIMDZDeFZwTS90M2dZK3dF?=
 =?utf-8?B?b2hlYllOTXBrcmFuQVpkTC9KWTlST1FLcmJETG5lYS9RWURMdDcwYXg2MTdR?=
 =?utf-8?B?bk5rSDNLeWZWcVIxT0NwQW0zYkZWcXZEaWxPd1p4QUZGQTNDSy90T0Y4SmIy?=
 =?utf-8?B?S25CQ3dPNGpVYkRTNjZEZ0RDYTJ1NzFqN0puM1Z0WFJIMzBhOWc2WnZ1dm9Q?=
 =?utf-8?B?YlVlc0FGVC8zaDlqcVFXRncvWC91MnpPNkJNTlM2VkhkNGZCM0FzMXpDZ3dS?=
 =?utf-8?B?SUFaWEN0ZHorNS8yZ1Q5YiszUVBFQnRHcm1CaVJBem0zUUNCdDhqNzI1U0Yx?=
 =?utf-8?B?R0VoVEVBVEhyNnlIekwwemJCWmlrc2lWc001OU83a1BxZWVuY1J2bUFCNjhZ?=
 =?utf-8?B?UzBvcHpKZHJmdE9yUy9xZHNVQXA1ZXplYVNkeXMzaTE4aFMwZW5maEJPOERW?=
 =?utf-8?B?NWhFMkl3Y2dSbml4TWhHdjNyZmNDYXFXUHo2bWZNOEtrQWdmN0hPM2RPM3Rv?=
 =?utf-8?B?S25PM2xYbXJPc3VYWU9zcXVGSXYydkJRVWpUR29mZzB0VjR4eWFZa2MxTFht?=
 =?utf-8?B?aHV3TmFDQlRaK2NmN1NkOXEwT1IzTTNKZTRXZnVyQXZ5Y2pweG1tSGlvNW5X?=
 =?utf-8?B?ZGhEeGtyT1F2VUdSOFFKcERYV0lPRVJ3c1J4RUZZWEJrMDhaYmxrRnh4SVox?=
 =?utf-8?B?TTFuZG1DR3dyb1RvTG5oaG8yUEhIdWpla1NuZ3Q2anlaSmFqTHZVNDRMcUV0?=
 =?utf-8?B?TlJiNytuNVUzWEFtOVI2UjRnb3RyMkxiOVNOZVZQbWdBRDE4aGI1UVdtWlQv?=
 =?utf-8?B?cDFNaXJJTXd2THArbWE5alFwOUhudXVhVEF0U09QSkFoUTZoNXlLWnlmYVd5?=
 =?utf-8?B?MkdXTmkvOHptbkg0T0pzczFHNk9xNzdJeGJKREx6Y3ROVVArQU5mNnBsczVG?=
 =?utf-8?B?QVh4VXVFZkZLL2FLckVQR1NrSHJleDJwb2FwYnJHNjZMazhDT0NGT0kwb0hT?=
 =?utf-8?B?VEJaZ1hHbWt4STR3QW9lMkZSWmdUbTM2akwrWHVCUm93VDN5MGFiQU1Tampl?=
 =?utf-8?B?cytWaFZXUmNIWmlZbnlkeTgzUzVhQ3FaUGl6cDhQUmZTYjFVbG9PUVJnVThX?=
 =?utf-8?B?SHhZUDhBZTVscGlQcUg5SXJnYm9LOVpDZUE4b3pOMCt3T3FIOERVTU5JZEo3?=
 =?utf-8?Q?/OwibaF5gUM7ZQwo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0DF7D81F2A9794CAC8D76AA578C5D86@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: Oli5QWEQ1hAyzvomj/Y2ZdvfdaYBIcPzhDzGFFZeDVhcMexqyG3NmGZrE0nYzRzNkCjwj+/NNIyzRCt/hUxsS9GbiitQoz/DTyAeb3OXH3noQfRhm38GLryuiBTEtCJbLbXHu3HdnZNBtYdL3Qebdy3bHLw21mFejW4T82WagIkeRqiY/ZJ8a7IXJ4aVNOkm6A+kgWrQiop2mclQnqYkxqv1pjEiCO19J6J5pVob79FUxENrLuN/gYW/+XEppba7z7Qfily0PXJrA+J2knTl2LBja8Z0dkCqJAXuhrjt9strdopt2R8KtE+cjjoFVBAcWjrYn78bL91qLBiBbCDyQw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8503473d-c168-4702-d897-08df4b340a17
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 20:38:18.9017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6BHshxdYoQkXAYROjnZsBQl5bjIWCeNLR0wIwTElSnl8uh8DOweOIyGG/tZJJdvaZZbCgNAvLEGhdf4qtQr8T+oMT+IzVx8NXE7fGbWdFWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5250
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTExLTI1IGF0IDEwOjU5ICswMjAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0K
PiA+IEkgdGhpbmsgdGhpc14gb25seSBhZGRlZCBhIGZsdXNoIHdoZXJlIHRoZXJlIHdhc24ndCBv
bmUgYmVmb3JlLCBmaXhpbmcgYQ0KPiA+IGRpZmZlcmVudCBpc3N1ZS4gSSBkb24ndCB0aGluayBp
dCBpcyB0aGUgb3JpZ2luYXRpb24gb2YgdGhpcyBiZWhhdmlvciBmb3INCj4gPiB0aGUNCj4gPiBj
YXNlIG9mIHdoZW4gdGhlIHByaW1hcnkgdGFyZ2V0IGFscmVhZHkgaGFzIHRoZSByaWdodCBwZXJt
aXNzaW9uLCBidXQgbm90DQo+ID4gdGhlDQo+ID4gYWxpYXMuDQo+IA0KPiBSaWdodCwgaXQgd2Fz
IGMzMWM3ZDQ4NDRlYSAoIng4NjogQ1BBLCBmaXggYWxpYXMgY2hlY2tzIikgdGhhdCBtb3ZlZCB0
aGUNCj4gYWxpYXMgdXBkYXRlIGludG8gYSBjb3B5IGFuZCBmcm9tIHRoZW5uIHRoZSBhbGlhcydz
IGZsYWcgbmV2ZXIgZ290IGJhY2sgdG8NCj4gdGhlIHByaW1hcnkgcmVxdWVzdC4NCj4gDQo+IGFi
NTEzMDE4NmQ3NCBvbmx5IGFkZHMgdGhlIHVubmVjZXNzYXJ5IGZsdXNoIHdoZW4gYWxpYXMgZG9l
cyBub3QgY2hhbmdlLg0KDQpTbyB0aGUgb3JkZXIgZ29lcz8NCg0KMS4gYzMxYzdkNDg0NGVhICgi
eDg2OiBDUEEsIGZpeCBhbGlhcyBjaGVja3MiKSBpbnRyb2R1Y2VzIG1pc3NpbmcgZmx1c2gNCjIu
IDkzNWY1ODM5ODI3ZSAoIng4Ni9tbS9jcGE6IE9wdGltaXplIGNwYV9mbHVzaF9hcnJheSgpIFRM
QiBpbnZhbGlkYXRpb24iKQ0KaW50cm9kdWNlcyBvcHRpbWl6YXRpb24sIGFuZCBkaWZmZXJlbnQg
dHlwZSBvZiBtaXNzaW5nIGZsdXNoIHRoZW4gdGhpcyBwYXRjaA0KYWRkcmVzc2VzDQozLiBhYjUx
MzAxODZkNzQgKCJ4ODYvbW0vY3BhOiBGbHVzaCBkaXJlY3QgbWFwIGFsaWFzIGR1cmluZyBjcGEi
KSByb2xscyBiYWNrDQpvcHRpbWl6YXRpb24gc3VjaCB0aGF0IHRoZSBtaXNzaW5nIGZsdXNoIGlu
IDIgaXMgcmVzdG9yZWQuDQo0LiBUaGVuIHRoaXMgcGF0Y2ggZml4ZXMgdGhlIG1pc3NpbmcgZmx1
c2ggaW4gMSBhbmQgbWFya3MgMyBhcyBmaXhlcz8NCg0KT3Igc29tZSBldmVuIG1vcmUgY29tcGxp
Y2F0ZWQgY29tYm8/IEkgdGhpbmsgYSBsdXJraW5nIG1pc3NpbmcgZmx1c2ggaXMgYSBiaWdnZXIN
Cmlzc3VlIHRoYW4gYW55IGV4dHJhIGZsdXNoIHRoYXQgaXMgbm90IGhpdCBpbiBwcmFjdGljZSAo
ZnJvbSB0aGUgYmVsb3cpLiBTbyAxDQp3b3VsZCBiZSBhIGJldHRlciBmaXhlcyBjb21taXQuDQoN
Cj4gwqANCj4gPiBCVFcgZG9lcyB0aGlzIHR5cGUgb2YgcGVybWlzc2lvbiBjaGFuZ2UgaGFwcGVu
IGFueXdoZXJlIGluIHRoZSBrZXJuZWwsIHdoZXJlDQo+ID4gdGhlDQo+ID4gcHJpbWFyeSBhbmQg
YWxpYXMgc3RhcnQgbWlzbWF0Y2hlZD8gSG93IGZyZXF1ZW50bHkgZG9lcyBpdCBoYXBwZW4/DQo+
IA0KPiBMaWtlIHRoZSBjb3ZlciBsZXR0ZXIgc2FpZCBpdCdzICJ1bmxpa2VseSB0byBoYXBwZW4g
aW4gcHJhY3RpY2UiIDopDQo+IA0KPiBDdXJyZW50bHkgdGhlcmUgYXJlIG5vIGNhbGxlcnMgaW4g
dGhlIHRyZWUgdGhhdCBjb3VsZCB0cmlnZ2VyIHRoYXQuDQo+IA0KPiBJJ20gd29ya2luZyB0aGUg
Z2VuZXJpYyBzZXRfbWVtb3J5X2NvcmUgWzFdIGFuZCB0aGUgYm90cyBrZWVwIHllbGxpbmcgYXQg
bWUNCj4gd2hlbmV2ZXIgSSB0b3VjaCBhbnl0aGluZyBhcm91bmQuDQo+IA0KPiBTbyB3aGlsZSBp
cyBhIGRlZmVuc2UgYWdhaW5zdCBwb3RlbnRpYWwgZnV0dXJlIGlzc3VlcywgdGhlIGNoYW5nZSBp
cyBzaW1wbGUNCj4gYW5kIEkgdGhpbmsgaXQncyBiZXR0ZXIgdG8gaGF2ZSBpdC4gDQo+IA0KPiBN
aWdodCBhbHNvIHNhdmUgdXMgZnJvbSByZXZpZXdpbmcgc2V2ZXJhbCBMTE0gZ2VuZXJhdGVkIHJl
cG9ydHMgdGhhdCB3b3VsZA0KPiBmaW5kIHRoZSBzYW1lIHRoaW5nIDstKQ0KDQpZZWEgZHVwbGlj
YXRlcyBhbmQgQUkgZmFsc2UgcG9zaXRpdmVzIGFyZSBhIHByb2JsZW0uIEJ1dCBjaGFuZ2luZyB0
aGUgY29kZSB0bw0KcHJldmVudCB0aGUgcmVwb3J0cyBzZWVtcyBiYWNrd2FyZHMuIFRob3VnaCBJ
IGRvbid0IGhhdmUgYW55IG90aGVyIHNvbHV0aW9uIHRoZW4NCmp1c3QgZHJvd24gaW4gdGhpbmdz
IHRvIGNoZWNrLg0KDQo+IA0KPiBbMV0NCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjYwNzIxLWdlbmVyaWMtc2V0LW1lbW9yeS12MC0xLXYxLTAtMmMxZmM2MjMwNmIzQGtlcm5lbC5v
cmcNCg0KTmVhdC4uLiBCdXQgSSB0aGluayBzZXRfbWVtb3J5KCkgd2FzIG5ldmVyIHRoZSBpZGVh
bCBpbnRlcmZhY2UgZm9yIGtlcm5lbCBtZW1vcnkNCm1hbmFnZW1lbnQuIE1heWJlIHRoaXMgaXMg
c3RlcCB0b3dhcmRzIHRoYXQ/DQo=
