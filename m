Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795683371;
	b=l6GJZCCEo0ixah5GfJnhLbgrD1cHmc/G/vviCaSwk+iMSwhvSonBPOMsnCD0RMm8J4lD
	 3/lopKHujaDBqopR9jm0gCTmAVYl3f6tPO9bgnIsWPqd4B7Wolz+JK2mAz9AT13pTcSCH
	 4lJhaccxxYO+61b5ycygiGGs6qOHY9Fdx0W2Q+3h1MQKKbS2isORVFgAu1sxi0yqL/9a2
	 XY1ZKSrF7QFd8jT4l2rfiNFVCgbtZ4NgwVLF5tTztWmUzQQ73Zg/y8oXgo3b8wbDq5brP
	 rVNgcswXQqw2PmfCW7w6rhBjKmWTwdedG90lzg2+UxqBOQEc/qLrQUD/TbxhHaK6Eog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683371;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:Reply-To:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
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
	bh=xXp8i9G1w4/5IMS6KpaSQfAoEJyAOLY5KFT7OYkbTeA=;
	b=X1KbrgQpGD8JvqTqqhmvLCbGkQMILNT/mzYdZtFoIdcKaQ2r6C3C4Iv3qFWFlBLkPCsL
	 /849f15prN/nIw3rdYdUi/dPXewU3VTgjb0BbSdHMoccFwBfozBdQCfwYpyv2IY1ARiF3
	 pDyKZv8mG+ZU9K/D+vf1hg3w4kzTPIQLdLnulEROjtKPpOO8wi8zGmYte1YnPvMXOPqg+
	 jS7R95RXcyng+AYxGuoQB9DvkwR2Dr3kjPlpGBSX2wvGP/NmqmjNURRLQEM2qz1tmNM+W
	 anQmO/Shn2lVyW15wXgNU9prV4Ji6M9H9IQvOO+sT0LMasOUC47NXn5PUZJ3Rw/vCFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="NA8/sS6Z";
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=UV8LdsO3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04144606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04144606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NA8/sS6Z;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=UV8LdsO3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795683371; x=1827219371;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=vDR17SlxKFRU9UdWarhFRV1BKXAoiQhX1NboJUQIWcs=;
  b=NA8/sS6ZfqSYi8j6GALsqbNKqNJ9IZGFku1wkg/zy3S9Z0kt5bjZEJUO
   bycUZMNzUkHsMRtEVJw9GQbREO6sA5ZUIYqV9FnWQAO1RKJ4zr5iqP7+6
   Cg0WO+Uolh3NLKOIXbM4qfwG5t6l5BDgsFPk0jDWA6xY2yfxfr+iTEdw3
   2x4z3D3qfCu6iNb3XGwk7CDflaWXCYHni7gtsiWaotdEQ/KOceAZHQ8wh
   Y09LrD0Qu+3M27VIrkZGfcz6RXdzty/2zP/LwpJCcirPVeOzw2RsPkz4a
   K1hUgbs8mi1f/EEXN9Y4gzfb3i0t8pGw3bWrueSfIyDxJFONDY/7jAqX3
   w==;
X-CSE-ConnectionGUID: 6rgIT94LRGSteoherw/T/w==
X-CSE-MsgGUID: 3AnEGtmDQoeI8V6si77E/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4490265"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4490265"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 00:55:49 -0800
X-CSE-ConnectionGUID: R0D9SxVQSX2lBHiljueYZg==
X-CSE-MsgGUID: qmtpgVqORrWIn2zTerO/eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12127225"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 00:55:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 00:55:48 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 00:55:48 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 00:55:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LC4HO4skcOey94rg2S2xWDu7+7L4EuGLeRBjdLtTOi7/ME5dr+y+33h1Pv+/DTbthvvtMcCHp2XbUHDP+30535GTHhUIzp6I8TxcwczJ+50hG8JI6SbpNkFbM7WkmJZ4YKdR5+DW0JCj4lNVkkY97cwHflIYKc4Wa8QCqmCrLxehANol/feUFQzaSoFUv9sCwIAlqZzhfwyrtHW0zNzZYGYSNf/M4z8v/7szStVYbhtvS63Rccd0OI9LVipOidJbGXtad5SEOi/8pltLSGfWyFlbsUVNTNYHvgYRcbaXYCN5/bP8oTzVlDvvzoAq9gdRgj/2zhqbOAmp9SNiedDQAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXp8i9G1w4/5IMS6KpaSQfAoEJyAOLY5KFT7OYkbTeA=;
 b=FXMZUQMZQ6BxZ3qap2ZLeNNthlN/9iZbFTCim/VzMAgBMFxUgiOb+qaxSS0yOfdUxYQ7MXx0+2fZccXHoNW/IW/Pq0cHueHFcYcKBWIZpOqJ5IQuj5i1PvAFcjBLF9TgoSLhden8HnzMbOBXoRbVZELEUH1Z+1Zm466YbnPGwdwfCyXuSTt26BkoEM36XBbDIuF3gImA2aLvRrFVHNY8vlX5fMwq26VSOB8Wna6qr8L1vETwf17k9sztfsMu0pl+DjECsvl0s+nVuaKIcBefpQup4yhIYFknyBRiPZVQbTq4g3qZa9PamXJudueZYUfSKxYtQ6wH528bgn2xMAbk8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXp8i9G1w4/5IMS6KpaSQfAoEJyAOLY5KFT7OYkbTeA=;
 b=UV8LdsO3U0eewZODBFwE1Cn9P9prlqdD4BzucXsccokiVjSVp3PfqZ/6dPnurr9k/KVTz4maCyIUJA4pOTGNjcJWmL/gZoo1GBoVolCIF1VgAKA29V6rPuVMlvZnnXQxqKtBz3/0qdU6UO2ILBDkCkS/j2LC3/PsXmGi6m6NBRE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH4PR11MB828026.namprd11.prod.outlook.com
 (2603:10b6:610:50f::20) by SA0PR11MB4718.namprd11.prod.outlook.com
 (2603:10b6:806:98::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 08:55:45 +0000
Received: from CH4PR11MB828026.namprd11.prod.outlook.com
 ([fe80::da9a:6f95:4772:38dc]) by CH4PR11MB828026.namprd11.prod.outlook.com
 ([fe80::da9a:6f95:4772:38dc%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 08:55:44 +0000
Date: Thu, 26 Nov 2026 16:13:25 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
CC: <bp@alien8.de>, <dave.hansen@intel.com>, <hpa@zytor.com>,
	<kas@kernel.org>, <linux-kernel@vger.kernel.org>, <mingo@redhat.com>,
	<nik.borisov@suse.com>, <tglx@kernel.org>, <x86@kernel.org>,
	<chao.gao@intel.com>, <yilun.xu@intel.com>, <ackerleytng@google.com>,
	<vannapurve@google.com>, <seanjc@google.com>
Subject: Re: [PATCH] x86/virt/tdx: Add command line param for DPAMT
Message-ID: <awfqJfLIZkxprFiY@yzhao56-desk>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20261126005417.976523-1-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126005417.976523-1-rick.p.edgecombe@intel.com>
X-ClientProxiedBy: SI6PR03CA0002.apcprd03.prod.outlook.com
 (2603:1096:4:285::13) To CH4PR11MB828026.namprd11.prod.outlook.com
 (2603:10b6:610:50f::20)
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
X-MS-TrafficTypeDiagnostic: CH4PR11MB828026:EE_|SA0PR11MB4718:EE_
X-MS-Office365-Filtering-Correlation-Id: 39512d8d-efb4-481f-7225-08df4b9b0ea0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|10067099003|56012099006|5023799004|11063799006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261022075727099003|261102123227099003|261102130727099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: VqyYNBG2rDQgH76ICnwVDkGbzTce5WP3n2/mcGRRFOQeCs/NOV02+4JtxVIBBghrkjpqLRzjQ6+ovD8xQhDYWG+Z8AizFXs94z5WZ1aHsPHob9xhboJsbmRnTckvD5dsZkjti4zSwexjizbR6FrKd68MA6I8SJAdbdeW/mNGgGILTOIMEYyGq5cPuaW7tmuhZZA9c4gqNKnVZvxoRuzg+eXVfdgc45cxsTIjRYwHsHjl7Cce1ztMozCjsf8RLPeFwDadsFqRgC16pe1hejtyX1ofhiGcs8X//azfv1dUgycLuKXhFKILZo4GVg3GhmTtl+jC40aM79Rz0O9i2UCaA347S7Laf6YkoG0D+nNk7qdsbbjgSOpMzaIYVy+Ti/zKIce+YWAc+6diNa94TEdvZ1pjgllAKBhudNZJ2hSftRd5d/fYWAzdBJVzF24J3ALH7nc8z+SdbVUt1SHqbPNwYaQGQ8JSRmIR5uBebn9sFXAY0GRKYDsimsP+uD/g7fo4V6Gatp7a6RfY7xa5w8t9xpazxTZAfkoxR687a9GV5s+FAvAN3MlD+8ZIorXRKm8Ck3pJBfof78y67tFgybuT62xd9UQBI8J6m2P7yT3b85dAU/7i7G9ROsGBOh8Bq0D/qzvPmrrpupN57Yhbhz7sUzMR20FsDL+cnXwgJKDii5Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH4PR11MB828026.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(10067099003)(56012099006)(5023799004)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261022075727099003)(261102123227099003)(261102130727099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wYtdtA8sx7knF0IQXeNj4zfQSu+bD1xao0IjPFczmIgh8Sdwp4rDcluycrXA?=
 =?us-ascii?Q?u8Qgw2755rzkH6ez668basdS+cWqxrzS8TXgpyX64vQL4b5fyBHepNYIC07s?=
 =?us-ascii?Q?h9IOK1asawOjjPu15BKDVRw/wcJD4GWspUtZoSacKlo9WfY6UmzFL71to0Yf?=
 =?us-ascii?Q?oC/q7etqYXsI1SIkIujpv5dITAKaB15h1Jx62nfMKpydcngtVxC8ORXqZeXB?=
 =?us-ascii?Q?m6oxADBaXntfIf+bQJneFPWMy43owUm8sKE4SUWk7YkJNYwt2COTaAs3dRd5?=
 =?us-ascii?Q?pU8uL8lMzyxzslgXIdJ8dksdExPfu2qiIlK4NPEi4hz15U4aA+NbuSHX9wiQ?=
 =?us-ascii?Q?x7IpjugFd95OMADPQehQKSL9kjUczNJfES0cFjC5oq5QJdviypM6916bNa+R?=
 =?us-ascii?Q?a1jcN/1ZeFhyNWAuYghkqpsFF08HIZMR/mUEBLLZOmujaMBZ/XekERoCIYUh?=
 =?us-ascii?Q?ZuttCUf3EVw4gcjwFmsLZ2L9WD5mB8fPaZIU2B7+fGW+O4fOyu9cZGRGTAEP?=
 =?us-ascii?Q?pat6vGDWwOqwMQtN/rBlxaWMWmv6GkSsflLJRunslyjLbZl9D9PiqPYCV8Lh?=
 =?us-ascii?Q?N+FyPH8FOFN7nZyXq57heuvwoTveFxJWQhcAGMVSVQei9VJz4/FD9q1fVES/?=
 =?us-ascii?Q?Msrm7ZomsG2XcjJDUeRz3/P32kZCCr+gJrBBrqpAaT5KcCrpeZRSxRTcHDAY?=
 =?us-ascii?Q?rUpm7aWU//TSd8Fh5Q4f0q3UwoYzfUmHxdd1gmZ/BzcJbwe1r3KnYLy8PytF?=
 =?us-ascii?Q?GFO9usc7/WtFCQ/UyUgZLCEOmVcpKKNSbJB9VyVDzTNs7Fw1p1tpvrt679Ra?=
 =?us-ascii?Q?onvZa1HwPzN73B4iXm0Ph8MuRFg4Y/+5P9QEU4yDeZa16urkcQSBPtqV2phB?=
 =?us-ascii?Q?oYTB87GINNnWbLHPZ9QvJVw+ClEb9MwrO2lzgbgH1sKA2uLlCKUR+U1eOwzg?=
 =?us-ascii?Q?2NstqX1NCOeo0LhPYClMPJFJ7ogeD14/27jeefl4nqSJdp1gYXwfnRetorp+?=
 =?us-ascii?Q?0Uju/75U5VXEMOGy2uSSN06LmhC0rCMbxvdPqzioHbzVH9O7CV/mWuTyLThN?=
 =?us-ascii?Q?68LoqBug8J3gHDr/4f4VDSEbBaMLwlqndyqjUWgIC6HlLMCH42aQiRphpgrX?=
 =?us-ascii?Q?RXcIDvj8PZoD7pWPX9EbHrPf+7+ooL/bX8i81mw6e9voRQT+/+NdINwtivMV?=
 =?us-ascii?Q?JFI5j9RSDyFRK1/Seqa9L7J40IbP9ErvLFKrGK2HZ7xaYBRe8iDLB3qdHJoz?=
 =?us-ascii?Q?liV9yWOqxI14NeNczL6xyO7hLixDR0Dcxp8vGOXuh48HKzTmpDu01l2JyR9M?=
 =?us-ascii?Q?WQ2d1UwUYGODWSDRu2NcY+ScBC+GZ707BiFA/aR3DA8SFnGbJWSbeP4v4d6E?=
 =?us-ascii?Q?YXzEBDnab5UMRzv6oXj3AT9YQP/cTyDsQPs7cyP2toyjeRN+pCLglV4zhqP9?=
 =?us-ascii?Q?Iwtrzixi5k4Xeu1zIZB0ARsqvAGNCTDZpFrzE6oDUbovoNomEUx8/vHLm4N3?=
 =?us-ascii?Q?lMHUP6XIeRw1ioA7QTO3mfNhv1RCYu5L02HbNAbSIxgMJL8YfdZ15waen4Jk?=
 =?us-ascii?Q?CEYrTv2bePRuHYbvnBqPF8P9ZWzp44Wa0hOU/IP0ppngoGNlHL2t/xD4ZR94?=
 =?us-ascii?Q?AFolnOdxfI3OWdJEIo+KyXooQG2SKppMPXUuJbPXG4uuEU3vRiCe6RfDidjy?=
 =?us-ascii?Q?fsHEs6LEBvKM7NN2VmW4UDBq9nENK3URMudKQEL+dxoh2P/Sv7dAIX+By+9o?=
 =?us-ascii?Q?QJjXfUy8Kw=3D=3D?=
X-Exchange-RoutingPolicyChecked: bxgpnEBQORNHsd1eBVd320x4iWzUKGBy99qAB4r/kjBq669NLgGzbLd/sqU+jStjcHGMcQmMgxojvzWavsLa9UE6hGXt/Kh2B5uKz1jLtvWd5zMs3D9V1LvmUjTwV9Ah2xMCy8YG9mQrUR51V/lptDBmCpeZrBaUZG9BsEuZ8dKC5BHnJoCZKJ6XhG35MkmD2gVA+XrYG3O/jh01R/2EoCbGjjxhxTpJR8saaJmtYRibfPV4GUWPBhYaNRikggF+j3t/tePBNcTjPHZt9gBoen4C53OIvd3gWF62Og5vszLXms6tbpfsa1b2rX9O9PGCtdGEq5Ki8Bf9eg+JNVRtNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39512d8d-efb4-481f-7225-08df4b9b0ea0
X-MS-Exchange-CrossTenant-AuthSource: CH4PR11MB828026.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 08:55:44.8356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vyElJYAZ5z+xJhqxoiTJ56UuGIb7H4NxjS40y/D1d1ejx6B15egVh1MDccUuTrDlxCfiMt30iy9LrcvTpzY6zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4718
X-OriginatorOrg: intel.com

+ Sean, Ackerley, Vishal,

On Wed, Nov 25, 2026 at 04:54:16PM -0800, Rick Edgecombe wrote:
> The Physical Address Metadata Table (PAMT) holds TDX metadata for
> physical memory and must be allocated by the kernel during TDX module
> initialization. Dynamic PAMT (DPAMT) is a TDX module feature that can
> reduce this memory use by allocating part of the PAMT dynamically.
> 
> In order to work with DPAMT, the kernel needs to perform upkeep on the 
> DPAMT for each page that it gives to the TDX module. Late during the 
> upstreaming of DPAMT, an optimization patch that avoided taking a global 
> lock for each maintenance operation was dropped. The plan was to follow up 
> the initial upstreaming with optimization work, however priority for this 
> work has yet to materialize.
> 
> Separately from the wrinkle of the global lock, TDX continues to struggle 
> with large patchsets to enable new features. Doing DPAMT maintenance for 
> the new types of memory these features require, further grows the initial
> patchsets.
> 
> Adding a kernel parameter for DPAMT can help these two separate problems. 
> Having DPAMT be default off can make the offensive global lock the rare 
> case, while still giving some big memory conscious users the option to use 
> DPAMT. Having DPAMT capable of being off means that the upcoming TDX 
> features can be merged in smaller pieces by ignoring DPAMT to start.

There is a new direction to have initial TDX huge page support without DPAMT,
as it simplifies the initial patch set and would be faster to upstream. That is,
TDX huge page support would depend on this patch that makes DPAMT optional and
default off, and huge pages would only be enabled when DPAMT is off.

Would you like to have an early discussion on this direction?
Is the mutual exclusivity between DPAMT and the initial huge page support
acceptable in practice?

Pros:
- Simplifies the diffs in tip and KVM.
  Only one patch is needed under tip, and DPAMT-related handling in KVM can also
  be dropped.
  
Cons:
- Part of the KVM implementation becomes slightly awkward, since the 4KB
  mapping/unmapping code already supports DPAMT.

> So add a parameter and make DPAMT default off.
> 
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> ---
> Dave, feel free to ignore.
> 
> TDX developers, this is small, but can I get a round of review on the 
> patch? One consideration I had was if tdx_supports_dynamic_pamt() should 
> be renamed, but I thought it wasn't worth the churn.
tdx_enables_dynamic_pamt() seems more accurate.

> Another idea is to ignore the impact of the global lock until someone 
> complains. And for the new features, to make them mutually exclusive with 
> Dynamic PAMT support by simply keying off module support, rather than 
> allowing Dynamic PAMT to be disabled. But since Dynamic PAMT is available 
> on all newer modules, this would only appear to make the new features 
> enabled. In practice they would be dead code. And default off is arguably
> the best default option in DPAMT's current state. So prefer the kernel
> param.
> 
> Also, I cherry-picked this from the last DPAMT patchset and didn't retest 
> it on upstream yet. Will do, but I'm not expecting problems.
Tested working with kvm-x86-next-2026.11.11, which is at v7.4.0-rc2.

> ---
>  Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
>  arch/x86/virt/vmx/tdx/tdx.c                     | 12 ++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 176648941aec2..af8b8eb54228e 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7564,6 +7564,13 @@ Kernel parameters
>  
>  	tdfx=		[HW,DRM]
>  
> +	tdx_dpamt=
> +			[X86] Controls whether TDX will use Dynamic PAMT
[X86] --> [X86-64] ?
And is a "KNL" tag necessary?

> +			to save memory, when supported.
> +
> +			Valid parameters: "on", "off"
> +			Default: "off"
> +
>  	test_suspend=	[SUSPEND]
>  			Format: { "mem" | "standby" | "freeze" }[,N]
>  			Specify "mem" (for Suspend-to-RAM) or "standby" (for
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index 96ced0494b687..ed5f37e5ebb29 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -50,6 +50,8 @@
>  /* Number of DPAMT pages to be provided to TDX module per 2MB region of PA */
>  #define TDX_DPAMT_ENTRY_PAGE_CNT 2
>  
> +static bool tdx_enable_dpamt __ro_after_init;
> +
>  struct tdx_module_state {
>  	bool initialized;
>  	bool sysinit_done;
> @@ -2055,6 +2057,9 @@ EXPORT_SYMBOL_FOR_KVM(tdh_phymem_page_wbinvd_hkid);
>  
>  bool tdx_supports_dynamic_pamt(const struct tdx_sys_info *sysinfo)
>  {
> +	if (!tdx_enable_dpamt)
> +		return false;
> +
>  	return sysinfo->features.tdx_features0 & TDX_FEATURES0_DYNAMIC_PAMT;
>  }
>  EXPORT_SYMBOL_FOR_KVM(tdx_supports_dynamic_pamt);
> @@ -2316,6 +2321,13 @@ void tdx_free_control_page(struct page *page)
>  }
>  EXPORT_SYMBOL_FOR_KVM(tdx_free_control_page);
>  
> +static int __init tdx_dpamt_setup(char *str)
> +{
> +	return kstrtobool(str, &tdx_enable_dpamt) == 0;
> +}
> +
> +__setup("tdx_dpamt=", tdx_dpamt_setup);
It looks like core_param() is perferred over __setup() for a simple typed
variable set from the cmdline?

How about:
core_param(tdx_enable_dpamt, tdx_enable_dpamt, bool, 0444);

>  void tdx_sys_disable(void)
>  {
>  	struct tdx_module_args args = {};
> -- 
> 2.56.1
> 
