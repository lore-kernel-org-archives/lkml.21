Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795561272;
	b=RjzHBVm1GQjMUuQ5fBU7j53Eg8XH5/RoVi6f84prU86POsY+IAIR35vFWKYgFqZWhGxF
	 Yd7Qe5HbyyIFrm3LtbkjhQWNCtXTJ4ewJACOPZPX1RXG4wTAnZUqK326ahfG8TwhRAOFG
	 n2K0Gtw1t8KiFfCR/rTsmt+QQi1WuA5NNkEMt/AlALZ4JdXvGt42ntU707PFJ0A5YlI+O
	 ntkRC/IwJAAVz7Ig9+OKEZsr9DSV1ZhQEJ9OdHnEM3/HM7qGOZkDdIs8HYWzLlBrVepqs
	 dgMF7fVKW/kejNW7gIDzVdKFmFKaq68A2RCRMNK840VfJ2p1BvKGkydqHZLlMmqtrcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561272;
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
	bh=ZT6eFP/V2G9YhP+ah/ElaP9fj2YHlvsyoGSdg1RlSUw=;
	b=nNOCtJ0kE6xWGlGbQoPAddrqSec5RTCXzERHZKMiZBVbS9wcZzV5xo4cZtsfXYg+MWok
	 3LiJ82QdBsXOtOb2ORf1HOp+EZyUAzBxD0r/WvyB4O6ZM4BQSCTNHnHPz3OpHe7bAZ1L3
	 sRZR8ZI+MOdEfAoOLIeR/CTn/F81ZhrmKTBD5TYCjVUUE7HtEjtimpf1iL0Iw6QLjHs3i
	 h7+Rrri3WqlLzmiEw9gUgVRZbPOd8Hg3JtqTPdS9htAE6D5DHJnNnFfcrRMK/g30LUzyM
	 sSrhlo3IaiKukMhzyTdT/54v1F27enSrvrj2fT0QunUSy9MDi1hQ2DvRQVKmNeGnZyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PmWffPCi;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=d3AbgkuX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9EB606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E9EB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PmWffPCi;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=d3AbgkuX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795561272; x=1827097272;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZT6eFP/V2G9YhP+ah/ElaP9fj2YHlvsyoGSdg1RlSUw=;
  b=PmWffPCiMpY28Ku7AzCj4RJ0n3LXhBZZE6YbUrC9HcZ/lPgHiSflBazp
   7c2C2qUHHI0s/kaWYHDD5lNYewLFWymaDuJtdm3onLUIhCupJT+GXeinZ
   8YlJdLBOBn7i6cEUNqxYpGpSHQDPDpHQZCvgtrusBbYiwMu0abuHL6I1V
   vk0v7QU0NKCQbhGF3TQOgvnB3YKc1Z9CwfL9oapLTFGr9SfMVzMCrL4TI
   JjKgQnfh3wUq1qrq0HCpNtYEiFNIm3dk/5MP64ONa0cF0oX/BBbIIOidg
   OarTEF+nYubmiQrZmvRhXcws8IPS01T4Yg8ulxEfwVrNPnSibjN8jUyay
   g==;
X-CSE-ConnectionGUID: abLOcVIsRG2zBk895aqNGQ==
X-CSE-MsgGUID: 2dEd67QqQlCHfMciecRM6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4336917"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4336917"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 15:01:11 -0800
X-CSE-ConnectionGUID: PLlVWi+LQAiz8WVJRwiRvQ==
X-CSE-MsgGUID: hV9R88wuQ82Jw6yyIOaakg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11713480"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 15:01:11 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 15:01:10 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 15:01:10 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 15:01:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCE//sH+F+h6/m7LpNAldqCYaMbasmWQqJn6OLtkZAns+GuQfr5GK9QXh3+KssZC+LnxhE/qFC0qdQ33wkZdnmxN3zkNCUn1542ETmVMcyNjnT7u6tXZVaPfPxbuqRvZb91nKoDXWJ1LvGds9T3SEYgZzNpWqwas0bBUV93F7ClJbxkwQ/lxfG5J6FemJEo0cunG6Ny5gDBG3d7BOOOTMj7snXrkIZu25r5LUgDWx0zTtVf83xDI4oCSyJie8R5DvBIsyuh/z8VjXfKCg0t/b3tuNKcr1Jivkuh/OG1ldX4SVKyR7QGSoj0by1wAOu7QbXLcwGAWICoZj4cIIJ8mNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZT6eFP/V2G9YhP+ah/ElaP9fj2YHlvsyoGSdg1RlSUw=;
 b=gvMGSuyBJfasYJEjPCtxhAEHtmvIaG9WqBLf4o6t8/slbdCeDk43hN+bXKIiIAhg/ok/eLtTGfgrkEUVMz3IeHsqRwJBmAv6ohs1AaYi3Pl2UEFAtIFzMnUI8/tb4kDek3PlpVtAxZw3XUUP1SnDQ1ItToVQcuni50fHqrz7W58uWzVD4gCTwhH/5yGLuIWWgj5Kj9tTFVVP/18Ai9up5/Z9PH5j0nCAf2LfF719fVdeu56EPZIgnAsFgYKBxPVNrwzWNt0I7/vu/9ojHpbaJm7TuOm0ESTSmDNNUa84UeX6ua0qoDfQYjuSt92myj9QYDYTEIdje0P8WiOyyMFSJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZT6eFP/V2G9YhP+ah/ElaP9fj2YHlvsyoGSdg1RlSUw=;
 b=d3AbgkuXv6QzdV3Bt0r1/jU351deT+GkubjY1XNxlA5PPrhkJjMfZ9feJzEclJYMwdMMt99H3TZLvKvm27z5Jpf5vrldV0il2fscqVxMKmx4F9pySPMkYRDPDVffIxSUf2+smy3Owyx77mv86opXroQu/VsRmTpgYkTLlyiWW8E=
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by DS0PR11MB7263.namprd11.prod.outlook.com
 (2603:10b6:8:13f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 23:01:06 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 23:01:06 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "luto@kernel.org" <luto@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "bp@alien8.de" <bp@alien8.de>,
	"mingo@redhat.com" <mingo@redhat.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>
CC: "hpa@zytor.com" <hpa@zytor.com>, "thomas.lendacky@amd.com"
	<thomas.lendacky@amd.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/9] x86/mm: don't set kernel_set_to_readonly when write
 protecting fails
Thread-Topic: [PATCH 2/9] x86/mm: don't set kernel_set_to_readonly when write
 protecting fails
Thread-Index: AQHdcsNcgDNwHFfCL0SZnfiGgze81rc96deA
Date: Tue, 24 Nov 2026 23:01:06 +0000
Message-ID: <afbc0c7a79e880947962fec09885a9a8937ba7df.camel@intel.com>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
	 <20261112-fixes-x86-v1-2-791adb8d6670@kernel.org>
In-Reply-To: <20261112-fixes-x86-v1-2-791adb8d6670@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|DS0PR11MB7263:EE_
x-ms-office365-filtering-correlation-id: ce75ea16-d530-47de-2a43-08df4a7ed222
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|18002099003|22082099003|11063799006|261026140227099003|56012099006|261022105027099003|4143699003|261021121427099003|261102123227099003|261026121527099003|261028144727099003|38070700021|10067099003;
x-microsoft-antispam-message-info: RSBUMKXzjj3H6DD+qGObxf3CaXGtGGSWsYZr26TY5i5CadNTLhL2cVQuKAnXB0XZnamEYYT438NfePKakOUc8ePUn36hX2QUfuu0qcQd9HyjEIJoLcHMEzV3eObG32Y185lD/SerJvnmS8M2nMPFAbyqD6vFBMFYjaSFRgDpDzYwo6+bnZHyyu05CjvVmhAdmaPjcID5570bvKQee+8igBj0eNfpvfuyK4WmARLIKFzq/tl/XmgN0Zps+Q8l9indGqknHY4Dr++5pJdY7IgRgfbnhD1UggVU5ZKvOyi6CQ0+AoR9uWxHk28LrSSzCWsIe/tz+iece1vZsxPRDGxa2NIuOV8oOw7VJnlo/b+FsVg8bX4JaRZvlRN3w5ChBcMJqPYLSHAWMhvWaG7QqK7SqAf1+fzgy8n8jhny5f+nxaLqb50seiJzhToWtytxSY/mN7ag3FmljovhYlDiETyQlOQILY8bdMsWc+fVabhm/4QXk2N52a6iQQf0YcnKsnbWlCgyujHDoj1DGnKtv6SRryKukjKsxC/aQIg0x0q4IpZUfC8TBJhO1FXF4pqDqYu6eeG4sMSMlsCJTIjx+i0QpCAsGCnCyxL9zuqyKlsejTqBVffLnF9J4BaiLVgCHGu10XXlW31xQ6sBnWV+uStMelwTaIwrL6WMW9NlgDPktNTVnARtdng6Aulx5GjJg+MusXFL3pbXnelGY4gyIKcJha9ncDMUOLjn8RrH6z0M/pY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(11063799006)(261026140227099003)(56012099006)(261022105027099003)(4143699003)(261021121427099003)(261102123227099003)(261026121527099003)(261028144727099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWkrZEswc1EySldjNlNkNFYzREFPSWVPWDc2Wnc0RFJacEM0R0QwOUlSS1pD?=
 =?utf-8?B?cFFkN3BqWjZydGU2cFR2REwxR3J1T0kyYUNLd1JST2FhZlpUOVp5N2ExMmlr?=
 =?utf-8?B?ejY3QWoxSGNubE9VbkZFWmtPQS82T1VZWVhVemxlY2pERnNPQ1pCMDhsVndE?=
 =?utf-8?B?NkZKNGVxY3JvZjg0eDB0NUVHaDVXNFpiV1lpNHRKTC9xdVlkamp0c0t1Ykxs?=
 =?utf-8?B?eCtsYmdDTisyZ1RuNW5WSlFYYkF3WEE3UVNvaFdmSUo5MFYxQVVPNzlEY243?=
 =?utf-8?B?OTVEWVBoZW1UZmM4RkhmREp6Q3hCZU5MTHA2N2xZd2VOTXk3SFdLV1lHRTZT?=
 =?utf-8?B?eEhZNVR5eHpvNHRwaDVvRlNycDlzd1dlcll5cGx3M2xPNkVXbGloMC9zSUtZ?=
 =?utf-8?B?d2NrTWFHcW9uZTI4ZUl1ZStGNGZ3Nkdua0czbmFIWjZrU2ViWUVMTmFoSWQ5?=
 =?utf-8?B?YWVPbzRINkUveDhUbHk3KzJ3L3FSMkh2UW0xRVQxaklwL0tSTFhsbzFROVpY?=
 =?utf-8?B?ZTVMbHBDVFJxbVdibkloRTZFOEd6VHJrWHBFMlB0UzhBVTVSVis0SE1rM3ZJ?=
 =?utf-8?B?ZEVJYUxhSlpzanFMQUZXNTFiR2wvUG9uVVhZVStDcGkrNDdwL1I1K2RTUStU?=
 =?utf-8?B?c2RoWEVTa3pqazIvN0NTcDFjSTNFVVNQbk5wc0k1K2djZ1lUNU1sMDJBaGNE?=
 =?utf-8?B?ck83R1lVaTdKOTJvdyt5QUxUTUpmWWJSZGV5Q2hGRExnY2ZmeVpPem9mM3Ev?=
 =?utf-8?B?UDZUM3ZWZ053YUs4Z1JRVlk4Y05IS29Zc21BS21JclV1ei9aKzFzMW5jVGU0?=
 =?utf-8?B?SW1Jb3dvZGJsYUZkSFdyd0RlVklBb2E4dE1UbjBKTTV4b2UyUi9JZGtzRHU3?=
 =?utf-8?B?T0NnS3VDdHlVTzBSYW5STlJGNkV1V0xHQy9FNEVlNndSK05TRWU4QXgzYnNw?=
 =?utf-8?B?dENjTys0OGdUWDBxQlIwRitHMTd0ZE4vNWlQMnpFa2hJUmY5U3dyczFtQnZv?=
 =?utf-8?B?aDEzNC9pWTNuRjVISHFLckwzK0FoMVBwU0EzbG1VNTRkNzVjSHY0Vk5ienJh?=
 =?utf-8?B?a1JkQzNnWHN5Q29ndnlmRUNpOU1NZnQyUTh4K3lZTHVteFRoZ2UxaDNFN0ZB?=
 =?utf-8?B?TzNXTFZDaEdLM1JkRGROUzAvWjBHbm9STG9iSDVpRXhNdTJUb3drL3BqUnBI?=
 =?utf-8?B?S0syQjRoeHRwMGN0SDlwRkRnQ1NGUG50eFRxVXJUZkFuWnhZcC9aZjNPdVl2?=
 =?utf-8?B?S3JTSDBxVjRIcTZESi9ZRmtRT1lRNVNwMjRQTzk1Q2J0Zmptb0hnaitYdER5?=
 =?utf-8?B?RndraFF2NDE0bUtRODIzNzM2L0dOS2RhUE1TbjFJdTQxNEdGN0l4a3FDS1pl?=
 =?utf-8?B?RFFNRzZzS1J0dTV2anhUQjAyNFAvS1AzclUrb0tSOXBmblRtWEIwdGZDNlpq?=
 =?utf-8?B?VEREN1h2NTJXWkFiMElIQ000TDBub1RhY0dhT2VXNFA3MERBRFFRMW1KMzB2?=
 =?utf-8?B?U0JncjV0Njc4M1NYOGVBajQ0S0pSaGJaL1poc1Y1QlRGVjdmSDExamZ0eUZG?=
 =?utf-8?B?VVViUUpONUdVczA0cEJkM0wxdm1MeXhKRXBjdzBqS3d2blkxMUx6YnFCWVNx?=
 =?utf-8?B?NEpkQUV1MGJzWUJjMnpwc0c2b2M1aFVBdzBsSVlvMVBweVpIbVdXTElCSitr?=
 =?utf-8?B?QjFONEdmbnlaaXpSVjgxOTVNdVFPcTZMb0g3V2p5ZlM1M1dKaGpaMVlqcXI4?=
 =?utf-8?B?UGdLNXU3RHk5Ulo5eFRQdmtTS1Q4YWJ2emV2RzRWTndtQVBDWHBNQzBoSXhw?=
 =?utf-8?B?QWV4WGhxa3k0UmxwUm5BR0IvVWgvdW1hOUpTQzdkeTFrVGI5M3ozVDkyNkdS?=
 =?utf-8?B?ZWcwalBhNnNXeUVDblcxVGhDenhQNjZJclBRVTRZeUsyZHoyTGxsMG41MDNE?=
 =?utf-8?B?N2R2RzhEL1ZlclVkcnFhYytvc29LYU5aL3puN01wRGZ0a1hGL0FUSkFqVlFO?=
 =?utf-8?B?cjZ5RFNkVHpLYzdlSFdCaHFOM0lxL1RTMENaZ1o5aFd0WldmczlXSkZXTE9r?=
 =?utf-8?B?UUdIWWpIVDNoS09vQXZBaFJLUDN1WkFFYWdOUVRrcWNyQWhhanRvcWJPRitz?=
 =?utf-8?B?T0IrNHpUcHU3VFhwWlhMeEtvbjU5bE9FY00yNmVKblRsejVDUlR2RVdLWTRW?=
 =?utf-8?B?eEVQY0JoWjEzeFNiRzYreHhYUUIva3hBdWd4QUlWNktheElWK094c0pnY3k5?=
 =?utf-8?B?bmJBVFdpQkIwaUhNWjMvcGYyV1J0eXY2WjNPQ3d3MEdSNkxVblNJbFZNNFJt?=
 =?utf-8?B?dFdDSVc3TGo5WlBSNm5Cc0VmSllBWGRFaGRreUhvR2FDOU1aSm9EZkRuYk45?=
 =?utf-8?Q?Dtdg6aLU+yj4jZI0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <974E02710F4EA246BBAAF0F22393BCFB@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: dsdiuI6FFpYyxQPELLOjBkQjncwXrsSdh2IvuuiDjl1X/Tun2z3kDrnwRqzlFoMQupa94Kz/lyil7ZCuUpjTtAOEp6jS6xRhutashgMpyf1/g5KCGGHPmeCh9rDNZHvlKQGA+pInYXFKEg9n0NZjQUNOMT2GgN6Nr1Rg10CMvEWlHf3ZOm5VV3445+/X86HUbu78K4XSzI8L4ybi4qyJfwwjmXd6DWe+6GY4SS6WL/ydzMSHCcy1yKd9aBmhuU99JAMOBTXALpBHX+XDQeJ9S7GDcDvC/uAMUCeIzWECIvy5bof/8k2YXc4ZqaQJEmj6C9iTZrHA1WzmagymV8zRAA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce75ea16-d530-47de-2a43-08df4a7ed222
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 23:01:06.1391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q+F1Cf2V/gyKp2INjTGRZJVp7mhJrBrvzSWlQ67aIWaXCP39ZjiHJAuORn9kUeS+XoU3pNuYMDR91UIuOwDNoRCkpiCX/wHa6kNWyS3yiCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7263
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTExLTEyIGF0IDE4OjMxICswMjAwLCBNaWtlIFJhcG9wb3J0IChNaWNyb3Nv
ZnQpIHdyb3RlOg0KPiBtYXJrX3JvZGF0YV9ybygpIGlnbm9yZXMgdGhlIHJlc3VsdCBvZiB3cml0
ZSBwcm90ZWN0aW5nIHRoZSBrZXJuZWwgdGV4dA0KPiBhbmQgcm9kYXRhLiBJdCBjYW4gZmFpbCB3
aGVuIENQQSBjYW5ub3QgYWxsb2NhdGUgYSBwYWdlIHRhYmxlIHRvIHNwbGl0IGENCj4gbGFyZ2Ug
cGFnZSwgYW5kIHRoZW4gYSBwYXJ0IG9mIHRoZSB0ZXh0IGFuZCByb2RhdGEgc3RheXMgd3JpdGFi
bGUuDQoNClNlZW1zIGxpa2Ugc29tZXRoaW5nIHZlcnkgdW5saWtlbHkgdG8gaGFwcGVuIGJlZm9y
ZSB0aGUga2VybmVsIGhhcyBldmVuIGZpbmlzaGVkDQpib290aW5nLiBQcm9iYWJseSBvdGhlciB3
b3JzZSBwcm9ibGVtcyBhcmUgY29taW5nIGluIHRoYXQgY2FzZS4NCg0KPiANCj4ga2VybmVsX3Nl
dF90b19yZWFkb25seSBpcyBzZXQgYW55d2F5LCBhbmQgQ1BBIGVuZm9yY2VzIHRoZSBzdGF0aWMN
Cj4gcHJvdGVjdGlvbnMgb2Ygcm9kYXRhIGZyb20gdGhlbiBvbi4gT24gNjQtYml0IHRoZSBuZXh0
IGNhbGwsDQo+IHNldF9tZW1vcnlfbngoKSBmb3IgdGhlIGRhdGEsIG1heSBmaW5kIHRoZSB3cml0
YWJsZSByb2RhdGEgYW5kIHdhcm4NCj4gYWJvdXQgYSBjb25mbGljdCB3aXRoIHRoZSBzdGF0aWMg
cHJvdGVjdGlvbnMsIHdoaWNoIGRvZXMgbm90IHNheSB3aGF0DQo+IGFjdHVhbGx5IHdlbnQgd3Jv
bmcuDQo+IA0KPiBSZXBvcnQgdGhlIGZhaWx1cmUgYW5kIHNldCBrZXJuZWxfc2V0X3RvX3JlYWRv
bmx5IG9ubHkgd2hlbiB3cml0ZQ0KPiBwcm90ZWN0aW5nIHN1Y2NlZWRzLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogTWlrZSBSYXBvcG9ydCAoTWljcm9zb2Z0KSA8cnBwdEBrZXJuZWwub3JnPg0KDQoN
Cg==
