Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795703294;
	b=G+7v+rJcqyZUYzUqR+aRmWTSGxDFuGnA6ZsX6Lsa3k14KurKGjvVZ6Qz2yQvpqJDLYKw
	 J6yALRQOQvuHMdFRt8Ff0FY5zBkxMJYNaOSyqzQSg7hbpcDaaq8GDxGeivr3tyCyfN5GM
	 6uN32Y0ThzKyMCZf/+oxCTAnXq5F5/oF4cbzi8mzskUOIK6tvqB4qaxuf6nY4+wah4u58
	 9Bzy7IOPtX9ilgLJXssHV3I+MQVEUwkh7aGPHte/TSv4jIsvpvtZrZo7WSONM64osLc6n
	 mMZcjMCUV/tJ7JVXlC5hPbeCcZ8j1JITmuy3kg1SiBbhMdxoPKsNFKC1JymAT2XLWMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703294;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=VwtVzc9+FBCkcPaVuhtwqiQtlBpU7cMfki6DtteZC1c=;
	b=aW7FwNTSODIPKLhA4xbAD0VKqdyB2R9UoKT0Vd9S9lvTiaODFoWOKgkrr9mKI4tVT5PN
	 NYE6pvHeNS46dA9Agovw8xQCIKcJ5KWnMpB2STDZBTOsPOCwPu9lumFSy6wghDcDVjMp2
	 heFZuVmNX/XCtZWLZb1e5PvS8cUU7AAvqzAyk07HpeKYSUd7znJP4suHzjNnR2+uaZ/Wx
	 27ij0m0pQzH1WD9BEZry/znXpMcnyW0v0nO4q8N19BAwNjbIbG3dmOfEF6e6m1/5bze9z
	 u3hjpX5p0hM9s1FdXLmGrG4aPUvlMYWc6SCYjnj8NMrKsskZnc7z6f4VQi2aCG49Udw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G50XO5KU;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BFascmVc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B524D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B524D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G50XO5KU;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BFascmVc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795703294; x=1827239294;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Ey6rB5CwwmXsRbRi6+1jTI9B2OsLkNIhHdwhaSCcAsE=;
  b=G50XO5KUt7sEU5xwjdDgP1ub4+K9HsRySf6K5KINy0vWNK80CN4ZW8eE
   IeX9oU1dHWO5roT6ukaDfEWdlB9EtJpldi7dFmcAJpUjlH0eGlqcSF1qo
   i5vJ/l/Ys5p0wa3eT4Z47bF6LvcNPZIcwSFjPAYjMPOJfBfV1FAgLoffc
   IsP/p+2teA1qJLumRKyzcqLGZUTXqyn4bIyt8ICT7nUJLVGhWIUi7n20z
   aHAkY4Z4cDZyFKPl9N5s43JzfNuBUE4Tx9GYiP6xgdhbeVjfrussT6ACv
   N4HVr4VlVGAlAyCaEdzlgTpTyn37zSJibdl5tOYkTgkAr2AdfeHjWAUiR
   Q==;
X-CSE-ConnectionGUID: QHXB4tHXT8mwI8jmXU9IiA==
X-CSE-MsgGUID: /OrnuHtAQiyQywQQia815A==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4702524"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4702524"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 06:28:14 -0800
X-CSE-ConnectionGUID: HBGefMaZQyqYENOjvxwMnQ==
X-CSE-MsgGUID: Bqdy3PWLRc6G6NNuDvoqWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12344290"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 06:28:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:28:12 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 06:28:12 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:28:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKdZqGAbhLdXrAb50HehLSrrIv4gjjZERmDcL8Caz+Zkwsn81LEsWBkfqPzdDcI/7YzUNoBpoHlLGr5xePcRlblCfZrZLJz+8S+HkJl6MQRmXkJ727Z4ZMJGFqMNXl7moPCsTsZ/LF7Z7lsHAPaNYW/z5ILZ3nuAunX1FEiP4M7s4IFAHbyvTYTWf5zlC+fWc5QDewx42jsBWh1phiLX/IvfnaVg7czHNxb8YqOUfwpgit6gLnqPKmwRpN2iB+qzyazap9GdvBt2a30OIa0u/72+XNpjLM0551Mbn83fnlHK8yfVIwhTYiVRi0s7fLOx59n0kk6QOJuSBb7t/KfXpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwtVzc9+FBCkcPaVuhtwqiQtlBpU7cMfki6DtteZC1c=;
 b=nU/sRlxr9rLAACzrTO+iQMsLSIOPEA/uTtcdb523PajptdUxueNkI57b+GGt9foMzq70IpLu9iDAV8Bfg+Ls1H9/OIadzahvtAzoo986HZDJdKPbuVwVgPEl+PSm9Xx7jRJ7aGxn0Z6N7omumx/VmqYLQiA9PnsAiSbfmCXtQEbHgiLDnFMP+QK5S4Rw9ulCp0qEaJKLjyPp5g4pi1Lan1KyslNF2TLx+1QgpqpuxqCWk3GJfro2Kkj95cvyU74lvJhNjtZz7BRbMtX31XBD3R7vVtM5EbE30aM+DVFR9nWZY08608c5uJPxNFxO9VCmJdPZ/VIpRpCmAUa6edEKeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwtVzc9+FBCkcPaVuhtwqiQtlBpU7cMfki6DtteZC1c=;
 b=BFascmVcjJimtw0T7DB8Li1ALqNeLzjT9hG6HsFkTbJJEhjBmonc3ct6BsPH85VlleW3dJyUuMLv72g1ysCntQRcwM/VTva4glYYi8ggBm3i1kCQGIbc8QrSJVZcdVSG74QtUKZOVIaFSTrHwvwAFjrRGmetHoHTq7s8pzZXxFs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH7PR11MB7595.namprd11.prod.outlook.com (2603:10b6:510:27a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 14:28:10 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 14:28:09 +0000
Date: Thu, 26 Nov 2026 22:17:07 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 02/12] arm,x86,fs/resctrl: Move
 resctrl_arch_round_mon_val() out of line
Message-ID: <awg/Y1f7MNtiw1fz@chenyu-dev>
References: <cover.1793864720.git.yu.c.chen@intel.com>
 <672dbb3622255ee7df0a64ef4e74b4c9b51db02e.1793864720.git.yu.c.chen@intel.com>
 <38ecb50e-0020-4d9d-996e-0bf6d43b33ef@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38ecb50e-0020-4d9d-996e-0bf6d43b33ef@intel.com>
X-ClientProxiedBy: SG2PR02CA0152.apcprd02.prod.outlook.com
 (2603:1096:4:c9::23) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH7PR11MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 587dfbb4-6c83-4e29-1b71-08df4bc97e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003|261102123227099003|261026121527099003|261022075727099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: JZ0YufYTFb2Q9ZpQ+MvXOPD5r0xQAX3CXQMP+j6pYR9+61b/i7e/1H6yeGdyHEeB2Hs9N/gN+MVbaaJNfmceFDb3HQ6lNhg27FWLTEXtd9F/pmC8YfzqA5Bae1XOn0n6ByMi5cJm3yT6a0WErIuEb6Hv835lC4AaJHvfY8PwfEYRGz98hhzfcv1YiWPUSB+GmUtSnP2/ixb4sHhUQ8dxokLOZux8jDTL5ou4hzLKtikXtbKpjytFWHxn5HrQh2wRjoH/xMShxZcG+tNft4uO2txpotJsz4hyBVKS1Z2ZQw0Zj+thGXixaQF9Aj5m0Tr4LHPZwTrYc5Y9Pu186KRvlv0vNAiMSbqqp36VWK78j/miu91177a1y6h39HJ5CXs98ufl8CQOPoInfKMsk2UaXw6SmXrozwaSDJh5ETa7dao/DnpBrIsr5KUmPi2/yjarGUL6wQjBZvdTAH8ALLJe210NeiQS+y/L+IPKGgtOTSpXCxYd76h2tdKA+PhW/kzPES3fwohmimKgAxnitEN46oqoZ9cgvvld0pLPRzvksELzjo1iSPNiltYk85uzV1laKt1S1ivX0DA226VBFpmWECdGg/yTNT1qzb8A9saJzlACJ8o1bmH5JvUHgq9dMQ1Ay+VHXpmXDUNYjes6WNst+Yjxccv4QWDMh3vjZKa61iM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261102123227099003)(261026121527099003)(261022075727099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EOXV8IPB7X0N7dvMmQmQDXKqk+7lJ9Ib6e13czG2/jWfAE92MPzJzEnLEnDt?=
 =?us-ascii?Q?Id1LVnNh/gPRE023lcCvvR3UprkdLnsJMJ091wv8HTn79cdj++X+aytYuO0n?=
 =?us-ascii?Q?tm310o4SuXmDU8vSAFrlW3UUARRBvdGFTKYuSI9nXtAKGtaS7YWyBk8nET7B?=
 =?us-ascii?Q?KKHNwg9CBqIsRRGCWrWiMwuHod3YC2MPCA5VAD4ZOvt8SWppwbfoha8NOcqI?=
 =?us-ascii?Q?2z3e1RnUFe6v1BcSzOUOhwW+5XKfyw7QrHp338eyrCSHPbBwJ47Y/BQ0PcJY?=
 =?us-ascii?Q?yjel0dHEH5bmyM9y8B/1E4oB24h7Tz97WW1TSYshQX6/LvqLqay37MKMqf3H?=
 =?us-ascii?Q?MCi7+B0Z5TU9ASTUyPnlmgB5BhFqukb58gxtDTVXUdWh22vFhYzLgNaZm3JV?=
 =?us-ascii?Q?Z/BWW5F0ohO87aCq0KFvzOfvbpQ92ANG6awRcZoJ5w/3OWRhBOTMBh9fhBaA?=
 =?us-ascii?Q?/u07B6Aer3D0g949qORWHoBeqo/K1VrZmqDE3OStz3eV4pZqDQhiy6w86ctN?=
 =?us-ascii?Q?0GkSIMplXAhKtBRluOIYn2Sz0yM6I9uPFvkW2lMxBORtY0uwh7N1VI0qXim0?=
 =?us-ascii?Q?UFrAgtcHATnrsUWLFLLfZFb3mV0D+9KCDOclvEaS4dpieYK7v/kNh2fIhWBN?=
 =?us-ascii?Q?vX9mCpZF1QBnq4rS0tCvOC++A6VLCSXSIWwhVP0AQeRxyhD3NuSp+9GiVYFd?=
 =?us-ascii?Q?bvdKXh1h6hvbgwim+byCc4YGRl5A+twxiCdjS5hP+ZRfwWLRf7YSH8NZ6Pw9?=
 =?us-ascii?Q?EC5lM/t0GeejJf5Y4PHl78ph71zG0fPWtQx/6sOs7YmH0hxDN3RpzoiBiquT?=
 =?us-ascii?Q?B98ISpu8soks96AArn3AHNGUEHtM495czroR4rdxrtO6pMTHzFdZ3/HDCGb1?=
 =?us-ascii?Q?YnPQwN6vz5Utx8MeSTgsXCckT6WrOgKwCAeGMg0wp9gcL7tVAovAYS7dXMvX?=
 =?us-ascii?Q?mKVLOwM1+inTbrTmRzi9/50AvYs28PcGmgCpIcB1Y5VOOwOL/s/Tpg4DxDx9?=
 =?us-ascii?Q?G4PNF41k0tbhcXBVkA8PhWm8vvZyfyr3nobglI9zfAaRpeSsIpiZwHkO2rUZ?=
 =?us-ascii?Q?wqmtF1OLjjXNhOuv/0JkCIrqSzmTEpRxBBSV2uOeTB6DGTom7EsctxV6PKO1?=
 =?us-ascii?Q?E0wnzF1f0IoyeHXnKW31FOcUptL2CNe7VT6jOlZR/BTC3tgTzlQjEygoVyJ6?=
 =?us-ascii?Q?99Aoa2Pa8Fu6K9jAdunqskUHNXGo5YVFgHnWU22Em7VwfU+4vc2ncHYRcVyA?=
 =?us-ascii?Q?Tx0mtzmvXIgIbi8DPbYXC309uWzHZE0760p0WMtMiVSLo5nYgMZ6RmZGYaZ4?=
 =?us-ascii?Q?qOrZrv4l9yeHZshSkfjSdH3vCiLIQ4KM8CzFbCCZ1yC//yXoBc8b+tcflzj9?=
 =?us-ascii?Q?RYYMJWpPfK0gTOGqx4b0YUnYsnm1Py/2YoimOZO+mBP8IebnlcVXsYTQtaXg?=
 =?us-ascii?Q?VxmSTgcH31q6tbFVdOcMOKso8qcKAY7/FwebF84xXFIkUGDzkYHeAQ0gOJBB?=
 =?us-ascii?Q?Mufj1+TIAMidItv9LMNHQ3v1iVOwtUzXgDs1MoO8CTdJfRca459ftoUk66TK?=
 =?us-ascii?Q?yr6qCRTySx7hWRIBorZBC8hUtE7sNofq5DiCx/6Q52Aiy7lC0X7psn1guxMU?=
 =?us-ascii?Q?NKxFMH4IFxCw82r6HJEPdMjb8H7BJiOVzdW+AO20WBg8Es8FrXGTS2v8vnj3?=
 =?us-ascii?Q?XVSyk/FhyL0949sGM1MKujII0bC6xE7NBhPb42X5TkAWPS6JmtCL0WEirh1Q?=
 =?us-ascii?Q?4kUjpm+FLw=3D=3D?=
X-Exchange-RoutingPolicyChecked: GM2QHrIrnTCRC8BH3YT5Z9bmMWTFxo4b/miG9gDMWC58MrRaLLSmiCu+sdVmzUiumv1fdqRZ6DkAyHzNbWn99XiZ+wiRnN9xByu3SNSsd/XhklY0EXxMKg+oQkrbC+8aKM+m4zp8sFBFmWvWnskvCc6g/AbDqpOd3xSXw1EUtFM0R0FkUWibZVaoBT3iOO5zM77k1iNpVNXlsZAOfBT6174vwI9vI9T4pfQMW9Dfori/zwaLD2GfMDav17Np0Jf/5hFbW6eb7UGU/np7glnBWDe/Amfydn8ddXTQN+Xz4vCJsPO+a95oWSZBK7ajE0QGBkIIN0FRD5HNRCMgCnEmEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 587dfbb4-6c83-4e29-1b71-08df4bc97e53
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 14:28:09.1191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KeAMM/+ueCaTOAF/BiBCj7cvoY9fOGyOvQQm1LusRjZ3aOl6+WQlKGktz/2UWYZZe1WJq1/wHU+g55vv+Gc/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7595
X-OriginatorOrg: intel.com

On Wed, Nov 25, 2026 at 11:01:23AM -0800, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 11/5/26 2:08 AM, Chen Yu wrote:
> > resctrl_arch_round_mon_val() is an inline function in the x86 and MPAM
> > architecture headers. It is only called during resctrl initialization and when
> > user space writes "max_threshold_occupancy", neither of which is a hot path that
> > benefits from inlining.
> > 
> > Upcoming ERDT support needs resctrl_arch_round_mon_val() to consult
> > ERDT-specific state. Keeping it inline would force ERDT prototypes into the x86
> > asm header, fragmenting the ERDT code into a header where it does not belong.
> > 
> > Move resctrl_arch_round_mon_val() into monitor.c and declare it in
> > include/linux/resctrl.h alongside the other resctrl_arch_*() calls. Move the
> > MPAM stub from arm_mpam.h into mpam_resctrl.c accordingly.
> 
> The final paragraph narrates what can be seen from the patch self.
> How about something like:
> 	In preparation for ERDT support, declare resctrl_arch_round_mon_val() with the
> 	other architecture interfaces called by resctrl so that resctrl no longer forces
> 	architectures to implement it inline in a header. Move the x86 and MPAM
> 	implementations out of their headers.
>

Got it, will adjust it.
 
> > 
> > No functional change.
> > 
> > Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> > Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> > Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> > Acked-by: Ben Horgan <ben.horgan@arm.com>
> > ---
> 
> With changelog fixed:
> | Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
>

Thanks very much!

Chenyu
 
> Reinette
