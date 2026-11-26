Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795702876;
	b=G4X+Ke7X0/uFOSeZex/XTVHSNMYNOajIr2U8HsHvRGp616NT9JkXjCUd6suiMhXK6vo2
	 ZkT7/L5zzX7A3Lpa3RMKjuPl7SPtbjdmGgzTaNBl8XO6p5HbZh+i/d18pX63AtmBPUTA3
	 txkdBrOz+byuXBeiCGZwTlTByOySr6gkENUHdk40+Jjfk9e+Xt/MkutGBpiBrSEPWFSLz
	 UjZGec3MvfZXik0/P64u+e+ZmKImL0Yuo8CO183vzouS/q+Jk2s0KOPIH7zHG4wpGHGN5
	 DVgdyYtALBQs8R/AqzHAZYpE9XyQweaBQMr/9oP8TpHv6gZq53NPO6ECNub6afPzf2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702876;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:CC:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=Ge6oxR2q8ckah6GzfDKwBgfjmmOznORIurghaC29zC4=;
	b=ZI87eU6VmGRRhFGKSLU4kb1Wbkh3iUAvY2VawuH2hgKVMlW1eUwyIb/w7/mzQT0qjJ08
	 G1znF6i/nKrtX/3vEMYbXtSIOxCtKsVSugG6QuDnJBB0r7UbA4iwVyWjayNL7n1SCiQIp
	 xj9J9gAldX3IwFLKRLIA9sbrioTvcX+brSU92VSbg/WBuoXx6keJlompQpKkMJ9SjBC9Q
	 Wg9QDu4MRP75+7pNA4QItq/8hXePv/+bFFCOYK9XT1ghfzhQ2PHeFmu5HDAjVkwnT4a6g
	 h1YykdtCz6aPxyt05TCie82rA0SSxc6ulWHzW5YPDYyBYW4Wif+6dCPLaxUfdSqIG5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=luypgX2N;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=PsncnnUD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106A1606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 106A1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=luypgX2N;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=PsncnnUD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795702876; x=1827238876;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=69DpDqzSsFfcG1VAauQPw/K6QWnaGLhfChR5slAoj1I=;
  b=luypgX2NtmdbkjKoNHQhBjQNntv/5OF8UAuIdyMcDAS59TfqrhorIjIz
   XP6hhSbU+ruAb7djp5Wk6UsnnV5CSFKrqjMfQ6/UrZJ0UvBQ6zHPGgDVO
   T6oFN97l88r2hCjzvP2qkrpXwu63Dl3q3UZ16Xi8j5AffIjOJj+x2NxG3
   DbpxMF2dnwO1YYvSeAyKDe2I68YtmmgKxgQa69UlDRc8H4oIi3SkkgMmD
   Ad3dGx8e1jlotRjH7adFecKT5iTfdna5wtdGlM6V2RgLwvaLxhKcG7Pid
   nwWv11ozlnqkgKp+xz8+FfhhiBf2+SHVJ5c4IZzIbI/PA4mhISqoG35IE
   Q==;
X-CSE-ConnectionGUID: WAIeMm7LQtOg4Qe9P/aNDg==
X-CSE-MsgGUID: TBMIm7JjRVyaJt5trHPMiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4665960"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4665960"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 06:21:05 -0800
X-CSE-ConnectionGUID: F6WKDEXJQ0mzTge+6EqsVQ==
X-CSE-MsgGUID: VwI37syXSJSmw7ibBqVraw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12487387"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 06:21:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:21:03 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 06:21:03 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:21:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1bO8Z9Xschlx8vxg35Mc7nQlLFqf8Ai30dYig6F2Lud5nXSuwxE8/7AFzBcMyJbHQqmts6qgLRHAfIAluUcyFSojP4gFksKtRZZ1PEV6HOEGgoTEYRC/xvQ2ZJlgw2VWVJgChocmftzRjBMDBnP55a7C1+BKnRKRRh+db6KMYDnZvxQzUtbtPxvEDECbAx7Cqv9UWXq2ij75REi7PNTrFK/3XuxuUIF/sJSKe2CIQvVUpZfB4tpoYJtPkzrnMb+4xfLQoyMZU1iLHGKeQHgWVY0UO/5dmqouLPjPn3wbGQ8JenttT0303d1fvr4lc/d46ntV94L6edwn8aG3iQpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge6oxR2q8ckah6GzfDKwBgfjmmOznORIurghaC29zC4=;
 b=VSuE5kgAuWM8+Q+4poWfDm8CR/xPN1HhYeeBCBVqa05J9F28xY1zC1AYuRNfLZX1YTCPUI7akn1/h1VapyZkiIc77mINiC2fqZ0Cye1WM7axa2jl9+/J0TLZP+FScOEovVUinvJclwKONPM9GzD68Wee5WRyJ319bKN/Fc7xM7gZnd3AHT9wRPKVcQ7gnRjsO4Mn7eRlK4eiPsyCjDPJJdnytspwO1/C8EKz43OsMH/gqJ27Rp2VUt8MYpVugkS30egP43Ptt49YVt10z+5aV2n6mUNAXNXEZ/sKt4UC7z66IwnLA4OD0plWaQZNw4cpXeKRM9sf4nS5sV2srNhdAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ge6oxR2q8ckah6GzfDKwBgfjmmOznORIurghaC29zC4=;
 b=PsncnnUDeupVjPC/J01mmanrshWcK2vsl6ByI+nFCeHH6fHhB5zuykdzxJem5rTC1oIYSXYOkFcH6Cy/tZdNwU0BIHDwR9e4cS7oLRk1RJxcxLDsFA8n1AKDsB4ISPPK32CLUG0h+8wwe+K9cj5c5dBi1+J+3F5XOCovDRYXnYI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 14:20:55 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 14:20:55 +0000
Message-ID: <28d24697-e4a7-4889-aea0-fdf58ab65586@intel.com>
Date: Thu, 26 Nov 2026 15:28:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cleanup: clarify scope-based resource management and goto
 guidance
To: Peter Zijlstra <peterz@infradead.org>
CC: <linux-kernel@vger.kernel.org>, Kevin Tian <kevin.tian@intel.com>, "Dmitry
 Ilvokhin" <d@ilvokhin.com>, Christian Brauner <brauner@kernel.org>
References: <20261125161205.65809-1-przemyslaw.kitszel@intel.com>
 <20261125164443.GH2668804@noisy.programming.kicks-ass.net>
 <d4f08ffc-fc04-424d-b13b-41df7fa94e74@intel.com>
 <20261126095007.GB49833@noisy.programming.kicks-ass.net>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20261126095007.GB49833@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0039.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::14) To LV3PR11MB8508.namprd11.prod.outlook.com
 (2603:10b6:408:1b4::8)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|DM6PR11MB4738:EE_
X-MS-Office365-Filtering-Correlation-Id: 13863a77-38c4-491a-ff68-08df4bc87bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|22082099003|18002099003|3023799007|10067099003|11063799006|261102123227099003|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|56012099006|261021121427099003;
X-Microsoft-Antispam-Message-Info: lpN9+n9XatuoMfONMmJE8PJLbmL6g/ZSg5+jd7NreA12lMC7Hg9FAxNKXT+OYu/Yd4KflpXgxT430UrO75SU4RxaFrLvOhljWZbYWGV93S40Wflwo4Sbt5F5INKAm/84Z1TN7uJwaDkEMzLBaEQhQMtk3uqw30Fc8TDxxAF7lv6E1GHVBfQZ0OUP6RtZVh5Ww4F9zhhqB9LmZPfbE0iiixLm9Yn1Feexsp3Awbh7OxG1irFYaCaoZJZ0AydZcREb0Lj7bWhqnwTisABuJwTs6W+IITmeQRlALO8sqk2ZnA16XUZhEZwiLss/jH9myge3I6lJ/En8K5QRMDblev1H3av2FN9Kb/L3iiVnTpw2ANK5jPFoQaHpd0Fau9j71llvG6bSM9+RjzfuRBCcGf5kM6P46Bvv6olWLORAhaxY9L7bMc1+oxuKR+4Z7ohJC6Bt7HTPNCglm1xSoX0K57GGDisdMwzlnBIs5BW6edosfrHoRUoYoeVhsbx3eIUTLUQHDZm7SPBt0zxUFYDmHHFjKpIvM5YHLD6b035UMgjsHNJwpADGJ4ChRy44R5MiFc+p/5g9Op1hBa1WDyPwVbhSsGuLSsHC32mjAf82UdmnLMUKZhhP0577QdA4c31VfPBlyH4KF5jHLQZaJQswfIV8DtIJ65SLvNFtw9g30TGhEJM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(22082099003)(18002099003)(3023799007)(10067099003)(11063799006)(261102123227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(56012099006)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnhhYTljS1AvOUdTRmNybXdVL21pTHVuUmgvYmRQZVk5bEtnWklFbnVra05G?=
 =?utf-8?B?ZDVpNWZoc3VTYXRUNTdZaXhDdVduVzhCNWoxS3dXK1VGUktaSDRkSzI5SFU3?=
 =?utf-8?B?RWdJbjRDWlpKaElnRlVjNXI4T3h2bkdSNEpyL09PYXl2bFo5cGdBUjhaSCtj?=
 =?utf-8?B?WWlTZWRpKzkwZEdSVC82UlpKNXAzM2ZjODhNRGY4SjRDMnlaWVFGZmx6TzU2?=
 =?utf-8?B?QzhvbTg5T0JZeTBHamdSMXJ1QStMU1NaTEhvZTVhN2N4TzVobC8xSmpEa3No?=
 =?utf-8?B?THVBbytORTVBbURyakhNcGttenA2WnR0VDhNREVoNk1OMUhnV1ZBZUJTK2px?=
 =?utf-8?B?WVg5U3NtM3hQdFJFSDBPRStPTWxMNG1XSlV3Zis0cEkyZXlpNGN6OHVkMUgy?=
 =?utf-8?B?S21UUXd3RCtuM0grZTZHWHhTU0plQUJCZWdRaGRBajhqNXg2WkFoak9LQlJW?=
 =?utf-8?B?eENwZlE0SEcxQ092eUg0bUJTWGM3RXZXQ1Y3WG12SzZxSkdsUlY5a0ZDNFNt?=
 =?utf-8?B?SEl0TDdXV3BsWWtNVld6MVJ5cU5YYnpPZWRQTlpsWUhEZ3VUckJWeDQrY2ZF?=
 =?utf-8?B?RHFrc3hpRlZodlBLc3FHdk5qTGEzTDR6bFppWUZYWElpaU5XcE9WNUQ4TXlk?=
 =?utf-8?B?OWpFcFU4VWNpMWtqeksxQm9HSHJEVWZmY3oyQlFCdUszYXpNNGhmZDF5V2FO?=
 =?utf-8?B?dncvMWIyaVhiSnUzditLZ1ExU3lrZUI2ZmxndC9UaE04M1V6VjQ0SlMyWCs2?=
 =?utf-8?B?L3RHN3dmNnVwL3FrY1NXOUp0Skt2aitlM2l3MzNGcnd3VnMrOGFwN2RJWnMw?=
 =?utf-8?B?S280WEtkS2R0R3ZJK0tubnR1cGJUZnBQdmIycCtlL1lzWmNVUGN3T2swVGIy?=
 =?utf-8?B?a1F3N1RFRC9qZXpOc2ovajlOVjI0RWZxWWZMenR6RTgzSFBVNHdVVE9aNU9B?=
 =?utf-8?B?eEN4RHFSa1ZvVDFJQmUveWc3M290NzRrUHNrYmFadDRsMFFMaEsyU01PWnpu?=
 =?utf-8?B?NWFNYXdRRjNWcmkvSU1SWWE2NFhrdjA3V3lyVWJlbGs5VGN3OHV5eFI1blU3?=
 =?utf-8?B?NDk4eW1hdEozMWVZK3FhUmNMeDE0SkdxdmNWYkdhTVdpWS9IblV0Q1BOVEh2?=
 =?utf-8?B?ekd0bHRpSVhXU2pEK3dHb3RnS3JFYW02ckJ1TGJDSDh4T2lFZ2kzbEQwYnNE?=
 =?utf-8?B?R0hlTjdpR0llZHhOYzViYkVqeEVtWDUreUJrWVZjTVBSTjVUUitTUE93N0RZ?=
 =?utf-8?B?TjcvRVgyaG9ub29vRDMxSU52bkptSWV4MlplZ1k2WGE1bStNa2tMR1I5Kyts?=
 =?utf-8?B?MGZEc3VNZGhDNFFKamp6Y2tHNVVxVkNWTHFFMDJ0K2ZEa3lMc3hsTk5JdjY4?=
 =?utf-8?B?WXBWMGhRY0F2VFIvdy82bHNvZkZLUlJQWW43azFkTURYL1MvZWJHckZuRE1Z?=
 =?utf-8?B?K1BFQklZeXIyZVFYVTE0R2NrazZjT3o5VlZZNHl0K0djTUlDci9TZGNuWmxZ?=
 =?utf-8?B?UlJYMmZtMEpLd2hlRHkvVWhrRnRsZTVudnpCR0hqQmVyWVREeHd2QXQ1WUNK?=
 =?utf-8?B?cXZhQVduUFo1QzczOUJza3Bwc3JESW5Jczl6UlZPNEZJcEg0T3RSWDZBbjlB?=
 =?utf-8?B?SXdjeWY3M3FaMFdvbUtCaXpDQXJpRDl3cGt5dkZyM0ZhZG1BbzlRckR4R2dQ?=
 =?utf-8?B?S0JLdTZUTnhTdGdwYTd3RjFtSnBNSWhPekx4K1dIS0hvRE5EZWordnY2Y3B3?=
 =?utf-8?B?NEZ1RU1uTjk3d1hNVGNiSFNJSGVzNkNCL0F1Smp2WDc5ZDFRTmpqOFZYSkNF?=
 =?utf-8?B?T2xwVVZDeXJabHFMdFQ0T3R0a0VqTWVBYVd1dzQ3em9EVEVMYlRST01VMDhr?=
 =?utf-8?B?RmFpZWNqQ1lOVmhPbFk5WFphenh5VDFLbkdDRll5Z3BWcnBEMzRUNWhpakxX?=
 =?utf-8?B?VGNYWUhtZ0pDR2pjUXArZzA4MEh0VXNmdVhCV2FIdFliQTF4T2dYQmEvVndW?=
 =?utf-8?B?TVd2RW85WUV4b3dvMEc0a2IxUW1saVQzN1JraVM5M3dvUmQ1TVpTblhTQThi?=
 =?utf-8?B?NGNaVGxyVlVVVXJZalpZOFBRQ2RGd2JuUzh4VUt3b1RRbWIyRmJUSmpGZGxW?=
 =?utf-8?B?MGx0OURURlozKytZb0xZSHNMOXptWmp5dFE3SGNFWG1GYnNqRHBhaHNlQUlr?=
 =?utf-8?B?Tm00dmRMNWtmVk0vTWo1eXUrRWNqdHVpZ01vdVRDZGZuaU1XQVgrOXA4OGdE?=
 =?utf-8?B?b2FiN054SUVQNzFWbVZtN3ZZTXFUK0dTVlBEZERxd0FOQ2E3bldSMkt1bEp0?=
 =?utf-8?B?MG9yYUswa0pxNEorVU0wWElpN2RXN0VBaEpKN01jbWRaRi8vZ0tnL01jb1Jv?=
 =?utf-8?Q?f43PzVD/thfh4hKg=3D?=
X-Exchange-RoutingPolicyChecked: YNSxVuPAp0C1QVtcV8T2e7ArG56p3loJcPqn1S3rlScZCouEE+wITos2cc9wlEle16NI6WTXypvTnzn+4M0WLRQ52uemXReIxLADJOM7Z7G8lwcUKcyvwvM+rhdWTKsTFJtEfLN7r0LslpUNcbGLy5hOuT1C71RDKmBiDqJlNHdsYMt3uifiYX326H4LQg7ruUz0ysK0E3+zEFdnRL2vjvFBHEbCphaQMbq/mgiEWdiQltWvWC59NgT3k+qRGZ+HXBpVMnFf9HyVxi8o3y6kdmr/TQ8H7a/hSaYcoYn5nJwJStXOC3jT1vDyZpONF0F7keojFoUIWVSBJesGyqAQmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 13863a77-38c4-491a-ff68-08df4bc87bf4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 14:20:55.7768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymWO9nVVkKV8HwsfyO3/MeeKVOkTnFcGIG81Cn4i8Y0JzGDsdMj0vBmyMnvsIC0lJmoEatBH6IR70jb3uIK4ORT2MsaNbBNCWn6nDSEoEoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4738
X-OriginatorOrg: intel.com

On 11/26/26 10:50 AM, Peter Zijlstra wrote:
> On Thu, Nov 26, 2026 at 05:29:33AM +0100, Przemek Kitszel wrote:
> 
>>> Then undo_pre_bar() is inside guard(); and that is very much not the
>>> intention. The same will be true with ACQUIRE();
>>
>> ah, I see :(
>>
>> would it be fine to relax the doc and stop discouraging against
>> scoped_guard() and goto in the same function (but keep the "don't jump
>> into/out of its scope")?
> 
> So I don't really understand the problem we're trying to solve here. Is
> this really about AI being stupid? Just wait a few months, I'll catch up
> or something.

AI is smart enough to follow our (human) written instructions, and right
now, those discourage scoped_guard() mixed with goto.
I would like to reword to fix that :)

Of course it will also be good for those of us who read docs, and also
have the additional benefit of not popping up scoped_guard() usage
(I don't believe, but there are still maintainers that prefer old style
locks ;P)

