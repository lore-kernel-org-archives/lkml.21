Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795634032;
	b=jsT+ykyCbhPMXpCGazvJuUBABZcFGDQSMqkVztHBXNlQAob7pZRhTEc3kGC0q4xPeQp3
	 nSG4MnSAdDFjkXwTLrBFg+RJQA733+muZMTGOnXWXKn5C4cfafUQB4irnFzngfcunfX8R
	 FrEtgv7oc7GEvD3vYfVkn273gEsq5LpYA33RYcI48tn5i7lp3yTmRBz3Hayl3mts0q8QM
	 lZz3weoky17U3RgTf1zGLWWP1a43xopNv8ym9OTGtLr/ctvCJaWY5ciOjDPofX8IYs1tZ
	 zQalaINWsubobBsh1qmjJOnQF519XuZ20T4WClUC0JahrsNvnNCb+gjK3gLEoIMwVwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634032;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:CC:References:Content-Language:From:In-Reply-To:
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
	bh=yQZYyKQ2Lgnoya54swyE50zNYE7FxAHyT/4+BfNM5p8=;
	b=KNDojYgNY+/yqQaEbAW/Ho1XkxH+uztu75g1HKkA2J7g04jtkwMUIXZd09vMsWtTHY8u
	 TmxdhlmIszkjUrN8Kfm4J4TYqXImrCvBK3aQZzyiZ7z0/uyDLM7ErxqVQEKA8vL3kl8/d
	 azdPlPbUa23IBASo6s8+EOiOlwo2IBkzAToPad+EGipzo8/B64h633Eabqt0un+/h6R4l
	 cJY7qZjEtzy5wEw0hkZMU6g82DDQqZJfjigwKXZq13g+Cg0nHxNBmhhDq3DJi3uIUzkrg
	 3fRIjxkMhq1d5Edh2KN/030w//Ma00LH2YQU4w3jrET0sFLkTUc73bOcWlxeOJYD34Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IrqtlUDD;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="V6/QtuHO";
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBBE606A683
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CBBE606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IrqtlUDD;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=V6/QtuHO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795634031; x=1827170031;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P0Gjwkzq6FLo/gKFQZxlIRLB185pVo5O75/l6Up/R54=;
  b=IrqtlUDDjRj+DOgBVUKqPHw9ZaYgDnlwSbYKrZjQN3DqC7/mt3EqM7Dn
   qw/FylVaXztpDrX19aRPoRdy6SOxnjty2LyynXT3PJkmUekAcwVKqGPgz
   dQwzEiMmz+FOXHGIajmb6rTzJHtXzIKyUFQfhLWxyzmcwYBqlbFqxw3J1
   wOpWFTEoBz1wBHdWT3jee2cTMOg8uzW5/nkdjCYIbTq9A62YtDc+QY6RI
   JK+WUbLmydJZE/MYYiUi8L8TgkBiFz+yLM6z1YrKTdhbckkHoA2gaUok7
   eifu6xk7hYzj8Wqwb7gMlzl/vl69Efu/T+uS6ys49QCZb98f65fs/264p
   A==;
X-CSE-ConnectionGUID: Q609fU/OSrWTFODE84TAtA==
X-CSE-MsgGUID: 6G5i/obbT82NXB5d71HvCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4431200"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4431200"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:00:49 -0800
X-CSE-ConnectionGUID: XnouRM5SQf6uzuLN5Yyztw==
X-CSE-MsgGUID: 4rP/Olz6R32A6Os2DQjxPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12080845"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:00:48 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:00:48 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 11:00:48 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:00:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izT9j5TXfPyBrXABAN4YASsCDeO3hUFOk/rMqeQHFvEVpjGB68M06VLXQCcqPynPeNO0y1wj01NHTow6cYm8yWhYjWYuv4O+mvne+slCWeVK6fFi5aQkZ47fH9yd3QxyFqZo4uPP3SI6n7ayv5ODz1p0WjxIwPLlgSiidSpl4hN3eJJm7mBWg69Ry4aggUpB9TjKstJD36wGRHNR5gptoUQ3Gi02xZHTh5fy8rcHTrqFE5ndJTNeYjNzYYcvKhL94Y0B+r3YHk2oUe7pqa6G60gYyc/WmRn3S1ifDz5VIyCDKeqOWxud9lfV7ByjhzrGlM9ztrVr8oQDf8BCMO+pKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQZYyKQ2Lgnoya54swyE50zNYE7FxAHyT/4+BfNM5p8=;
 b=k0FACILQrmWIij1AY4fYkrssSi6L96ObTjptOuh7gNasl8ew/w9y5kJwhTjLczq4s5lJJJQjD7Q4ccwPc8m8JWz4jDU/Id/Ywr0iz6lm+GD8GZagsIOGVjJM1t+6Spf7ynjZGxH4Jm014v/xsloH8vi7h+d88KZuw+Tk9+32fomKG7ofT1OD5zVmGEmsVNuXSu8GQKGiznum4nOYSXtwsCipJR6u8cwFNCkRCy0Ayn45oTEwMdH4W41qlOqHwqqlPXsxSPBnDKrgEmhtZY4m1TPo+dMB/GWTK3hUl3B1ReV6+Yc3rkvxUHT9FUMubHZHtFsi3tMi3LJ97YEPIkHm1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQZYyKQ2Lgnoya54swyE50zNYE7FxAHyT/4+BfNM5p8=;
 b=V6/QtuHOjPFmHJqaU/DYZbGb/Saeuwfaurw0woWxiuPJ8Ow5uWQquUh4X9lr+y6Vws2ET22YCz37jma2dGBmp6z55i8LbPy3SmL2RNG0KIqJmNM4DG7DcnL5T53LgtQ/d6uYhsvRMF0EQpR6uyBMbz3qkUpt+Ln5g70e1sIz5aM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 19:00:42 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%7]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:00:40 +0000
Message-ID: <44ec9227-47de-47b1-be2a-575e059946d4@intel.com>
Date: Wed, 25 Nov 2026 11:00:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/12] Introduce MMIO-based CMT access for Enhanced
 RDT
To: Chen Yu <chen.yu@linux.dev>, Chen Yu <yu.c.chen@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1793864720.git.yu.c.chen@intel.com>
 <avrTiSvpFSqLqCh-@three-body>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <avrTiSvpFSqLqCh-@three-body>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0336.namprd04.prod.outlook.com
 (2603:10b6:303:8a::11) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 07699309-76c7-4268-5d5c-08df4b266613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|5023799004|11063799006|260925021911599003|260925021311599003|260925022911599003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261026121527099003|261026140227099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: US/6BrN3/HCnOUd+gD4kqJ/Va/Ag/XL/fGJEQ5wg1lyrjwdxcVxlz5SIv4gRNnKZyEXtED35MkT89ZPjv0U3/owZ6iOTh8ey68BtFxvslY86Y7NK4aKv4r/ggElRnnIl+bbrl0Ob+UNppsvpzVnR50jtgPoayp3vs7CxS1fkj4O2uju4WtlqRAgnaJmjNKgpcW4YrxQZc51yY3gXcyrsfpwFvqtciceTdCv6cU/nRJdXtl7GFjIYIzYAGGIt3jChp3JerrW+mUI9JfB8+hglF0uYMKFkIzj7sPs3ZsK4T2wxGw2FJVwdzTNi5NBDjXw8lQq/kgujokbHnWrXE7++taiklkFfdqZRlRB1/4Xfx2XGeeYwvy1PdoW55VexHpeJ1eLXpxZAP98GmdQKoGw8xFkkzfDKcEp4JUpK6FnVhCQd20a2uzw0ZIOMHijpCqu9eHBMxpntWx1sPNWYkIMoSL5wdsWX1DtjCym9FbNDgoxGSxhNHZQCNvrLB7+5Sl4MsfpvbBsTWrsVjXw8UB90RnS+rlQMto2nUkLbPc8EUpYedIv/2kA+t3K1TpsGIWN/L7npePgLg85dpPGEIjHc2dHfukMoQLYss6Qcnmno0lM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(5023799004)(11063799006)(260925021911599003)(260925021311599003)(260925022911599003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ynh5RjFLMlhIc0g3V1EyTkZpOUd6eXdnbElvd2lTQUFkaC8wMWNCV2ZxMFBn?=
 =?utf-8?B?OW43Qys4TU5vNzBEL042NXlxRmJwWkFrNGJDRFdFdjY3eTlwKzhiVkgvcXJq?=
 =?utf-8?B?MytLQThlWFIrZmlPQ0syM1A2WFNnMmRjQTk4MmhzVmtObDU4UlBBbEIrQTJN?=
 =?utf-8?B?aXpRUXJNV2FoeTR4SUU1QnhkZldEb2FpcEhGSkc0NU9XZldtdHZYRkIySklY?=
 =?utf-8?B?Qm1rTUplSGNFUkR4bGhoWmtPZkNlSGo0cU1HbGF3bGFUeDFrbU8ydEFPaDhQ?=
 =?utf-8?B?b3FPTDh0OElpWnN4SkJPZDBoL1Z3UVB1Q20xM3U1bERGcHRjQlBLOHo3WkVW?=
 =?utf-8?B?SWpubDhBUjgxL1RqNXpTR1dPRDIvREcyZW9YTjM3WjNIYWxxSmMvMk5tZWV3?=
 =?utf-8?B?V0M3N2NoVkZ2azJubUNTN2I3ZlhvWDZYdUpBQ0F2ODF0M0p5Ukg1TXRMUUJF?=
 =?utf-8?B?TmRnME1vWjYyUERmRWhKWi96V3VZL0NoYmFBOWYyQnBCTEJVaE5JSyszcHBG?=
 =?utf-8?B?aXM2TGJscXQxVGN1TldUaGhFZGx1OENoekduczM3bGY5TXNSU1R3WERqMk1y?=
 =?utf-8?B?VngrNk1Ib1FiOEdiU1F3blFuYWhpU25FQi8xUlFVQXRRaFdSSTJnK0VYUXc0?=
 =?utf-8?B?cU1Sa1Y1d242WWdkN1pUc1QrQWZMSGdpcXJBcFE5TEh5Q0RSVDQvMGtNOXJ3?=
 =?utf-8?B?VUxKV1pzTGhqYXZmeCtQVE16bCtCZ1BFZXovQmRFYnhpWml4QnJTdkJ3Q1Az?=
 =?utf-8?B?UkhKWXJia2xjWTZpV24yQ2g0Ky9GQ1lYNTZ4bmJQYUNZandhRzFUQTFTaXFi?=
 =?utf-8?B?TDBFd25Gc1hsd0JDRVoxYUhQM09CMDM2YjVnOXhtTmNCbDdaRTlydU0zSEpP?=
 =?utf-8?B?cFc2a1EvdG5xbGtsK2xXOXlDajdDNC9iSWVLbnpHOTZOd3RuMURsU3NqMjEx?=
 =?utf-8?B?eThIaWpWMkljenJ4NGkrZXlnakxmWGJNYlZORjZHK201eWdCdU9heW5tTFlm?=
 =?utf-8?B?UlgyYlFtRmtSN3hoMDJQSzVoWmQvMTlGQkVWajAyRTUraVp6RkxPR0I4STc4?=
 =?utf-8?B?K0crQ1kvODRONmVaN0ROOWVkYk0wRXd2Zm9oL2ZkQk8rNXl2U2RGNzlTNkFL?=
 =?utf-8?B?RjdJZzRDOWZUbVBCaTZET00rWUtZTjZXb2YyaW1wbmpxRzhLSjloL1hwRE5R?=
 =?utf-8?B?VTQ2Nk1SQjN6Z1VVcDd2dmlTa0FPV3ZjK1MzeUc1dCt3ckE4NkpyNjBNQlRm?=
 =?utf-8?B?cVplODdDeFExMTVtWW8ySlFuUlZGa2lReURnWkhyZmpVWlN5NWp0cW1TQ1lo?=
 =?utf-8?B?SkljcTdmcVpBRVZMWUl3SDU5UEV0YlFGdmRTRU80SGdKNnFaQ1hNRDFaanpJ?=
 =?utf-8?B?YUNLWjJGMnlLYVExN0hJMEx3a1Yyck1oMVRKQzJKcit5QXlYODlrY3c5VDRx?=
 =?utf-8?B?UCt3RGNnWlp1OTN5T1ZqdHQvZFYwQk9FWWNySC8wejdFL2hCVWJmYmFvQ05j?=
 =?utf-8?B?QkN5OTZzK2JiOVY0RVY2cXpuSnpCZGVvN1hERklaaXZxUjFoKzhBRW1rcFhU?=
 =?utf-8?B?c0tWWHBINFB0VTB1ZDlORXA3eWRBLzJzMDY2dmRQQTFuMXpyRUx3eWRRanA2?=
 =?utf-8?B?NEtTbmlWYWhsYzV2VDc5a3pNWVJld0VSNVJVNnEvVlFEQUJqQkFIL1gwQ212?=
 =?utf-8?B?cVRUelVDbWd2UlhWckdPQ1VYeUZDekFrbkZpVHA3R3B3Z1FabTBJbkVnNUJ0?=
 =?utf-8?B?TzhlalV2eWZLRFpveVVTRHo4RkZCRjhicGVWbmZXSzA4UVhONTViUGhyYUpi?=
 =?utf-8?B?aHdnSTFCclNNaEV6UU1mbk9TMnJuanY4UDlTWEl1QWRoN1U0TzBpV3ZLS1RQ?=
 =?utf-8?B?djRhTkxxMXZyWFdzeTBmYzRaWGgzeW5pcmQrc2FIbWw1djV1b01Nd2NrcWRx?=
 =?utf-8?B?Qm1NNk1oak90RU9sZWEzOUdJOWpPbnJqVmoyUDViOGFlOVk0TlhIZDV3ZnI5?=
 =?utf-8?B?d3daQTg1RTg0VktYT3ZBd256eFd3V3crOVZlMmdDREFHbmxaVU1hblFHb2hk?=
 =?utf-8?B?enlKcmphRyszTlpqYTZSbDJQVzZ3bEN1SHVIcWQ3YkxNV21RcG56eGxPZDQ3?=
 =?utf-8?B?T3FiWXkwSGlFV05MQVF3bnBiMU4vcy9MOGNlNmhoZ1diN25FQ0h2ZUZPNzZ2?=
 =?utf-8?B?TVUvb2hKQmlvR0F3aFVpNVp6YkZYdFNkeHFEcGZ1RmhLelhMamVKYU8wYzhQ?=
 =?utf-8?B?Q1lZczBBYjNqUGRyRU5wUXBleHViTE5BcjVabFMydFRXOTF5NXZ3ZmdVMVdu?=
 =?utf-8?B?YnBTUlVERmZpUkhnL0pxYVp3SGdETGpxRW1tYUxQSmRENVJ2MlJtcmJEYmJT?=
 =?utf-8?Q?OyNoURwBxzHwPZak=3D?=
X-Exchange-RoutingPolicyChecked: Mus8HFQZOFmskSjnm+gpto2TC5wCXfaZ+p2A95IisJAGL6KHZgSB+Z4ImfvhQiV6VdHXPoMhoVq6Q7vS+vo/WNyiSQSV2ZMdqfbzdolvahOTM/Ll9mzbgtresJwf5SJqyPAlXbqqwipPWbZUnSo296hC850oO9o1caGJDJ/CCGT8EZhrv7u1RZwV7GuCrAEvewTZu/hi466Q5ACaTrgCBScdFE/Xy4UBGgZfTIMMR+4A4XqYFl45+aax5GD/k7oCzSNtuRVoMA0Q+N12i8goAvogLEk8RJx9lmgIl8kyoVKngsK88B5zHVA2xHqGEtXKG5XSTM2NZtx73kXCKeLesw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 07699309-76c7-4268-5d5c-08df4b266613
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:00:40.5736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdxensVIVyZEJSb6pEHHNd6R01jOCx6xpTUtYTYDg8c6GjhTG7rbDB765dyhXLu9J89bK3c8C9r1hkh5n2gsyJlVKh5FA/EALt87NWkmL/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
X-OriginatorOrg: intel.com

Hi Chenyu,

On 11/16/26 1:57 AM, Chen Yu wrote:
> On Thu, Nov 05, 2026 at 06:07:59PM +0800, Chen Yu wrote:
...
> 
> Response to the sashiko 2 review feedback at
> https://sashiko.dev/#/patchset/cover.1793864720.git.yu.c.chen%40intel.com
> (false positive IMO)
> 
> Review1:
> "In resctrl_arch_pre_mount(), all online CPUs are then added to
> RDT_RESOURCE_PERF_PKG without checking erdt_try_bind_domain():
> arch/x86/kernel/cpu/resctrl/core.c:resctrl_arch_pre_mount() {
> 	...
> 	cpus_read_lock();
> 	mutex_lock(&domain_list_lock);
> 	r->mon_capable = true;
> 	rdt_mon_capable = true;
> 	for_each_online_cpu(cpu)
> 		domain_add_cpu_mon(cpu, r);
> 	mutex_unlock(&domain_list_lock);
> 	cpus_read_unlock();
> }
> Will this cause an online CPU that failed erdt_try_bind_domain() at boot to
> still be added to the RDT_RESOURCE_PERF_PKG monitoring domain on first mount,
> while a CPU onlined (or offlined and re-onlined) after mount is excluded from
> RDT_RESOURCE_PERF_PKG by resctrl_arch_online_cpu()?
> Should resctrl_arch_pre_mount() also check erdt_try_bind_domain(cpu) before
> calling domain_add_cpu_mon(cpu, r)?"
> 
> Response:
> PERF_PKG(AET) does not care about ERDT information, so whether to add the "broken" CPU into
> AET's domain does not impact the result - the AET monitor event's any_cpu is true, so
> any CPU can read the monitor data without having to be read from the CPU in that domain.
> We can keep as it is for now.

This does not sound consistent:
- First, above makes the claim that it is acceptable to add the "broken" CPU 
  into AET's domain since it does not impact AET - this contradicts the implementation
  (specifically patch #6) that instead _drops_ a "broken" CPU from domains of _all_ resources,
  even though not all resources are impacted by an ERDT issue. How can these
  opposite behaviors both be justified?
- Second, adding the "broken" CPU into AET's domain is only done during AET enumeration.
  If that same CPU is offlined and then onlined again then it will _not_ appear
  in the AET domain. Whether a CPU appears in AET domain or not thus depends
  on when the CPU is onlined.
  
The place where AET enumeration and general CPU online flows meet is domain_add_cpu_mon() and
adding a check here means that it needs to loop over domain_info_list which adding
erdt_try_bind_domain() to resctrl_arch_online_cpu() attempted to avoid. Does not look
like this is possible while it also has the consequence of removing a CPU from domains
it could actually be used it.

What if changes to resctrl_arch_online_cpu() are dropped and instead domain_add_cpu_mon()
changed to:

	domain_add_cpu_mon()
	{
		...
		if (id < 0) {
			...
			return;
		}

		/* Only L3 monitoring reads ERDT, so only its domains depend on a binding. */
		if (r->rid == RDT_RESOURCE_L3 && !erdt_try_bind_domain(cpu))
			return;

		hdr = ...
		...
	}
		
With the above an issue with ERDT will only impact L3 monitoring, albeit also MBM, but it
will not impact the allocation features or AET. What do you think?

> 
> Review2:
> Should cmrc_init() in arch/x86/kernel/cpu/resctrl/erdt.c also reject a zero
> cmrc->up_scale (for example, !cmrc->up_scale || cmrc->up_scale > UINT_MAX)?
> 
> Response:
> The correctness of cmrc->up_scale cannot be guaranteed, because we cannot distinguish between
> a 0 value up_scale and any value between 0 and UINT_MAX, they have the same effect, and we have
> to trust the BIOS/firmware on this up_scale. We can add the above check but are not sure if it is usable.
As the report highlights, this series indeed assigns a different meaning to a 0 up_scale - it means
"ERDT is not in use". Since it is given another meaning then it does not seem as though an
value of 0 is actually supported and adding a sanity check for this during CMRC parsing looks
reasonable to me.

Reinette

