Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795634003;
	b=z+mpJjQPep3ZAQF9KN10Uf8wx2c3T5LvPyGo6QtEAuvmwGR/mZg/0R7vW5ffYlSmcP9J
	 xk3niBsFuOG2g5vm/Y1d+1El9E1miJ+IJeTxgbFnFj5QxPTLclcTsbFwG0Q6Lophq854y
	 jhYpQijRFTNp6JIS+cZyAvGmK2BY3hMF2b2TlT1gT4VWMaWIK+H6xy/tTy07xhcO8XV2e
	 UgoNNIb5PMEvRsAoJYEiz0v7tRgCTu2+9fGn4bSGsdMtUSqSGAotiorYJEFkQWIOH02aP
	 DxU+UDt/0KLcYlvSLxQkeiRU2YKCbXwL2VB9ajE1BLYjTU4BeJApsVmAI3X+wBbs9Yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634003;
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
	bh=DeWxgzgS17wp/3SR3RVo7ZikDUpxskgwd79OHm/uajE=;
	b=Fn+tzRP4ocLwFrC2jTIXLwSNFPuU9y13YoE/fH5tW4JZ3IKaO6aiN9ogCNmjaJpYeg1I
	 POs0oq5QyI2/4nu1LWqWial5u5Iavubuq0a9GKF0AMWKWWivI+cVxX1Iwwa9TuDd6zpkU
	 5kaf25j1q5n/kNCbS3Cl6YWfUPhK04iedUMzE+rCwAZ3AMDZodLUpErwY/BGKvXdVKLSq
	 INLQiv1iPTzVEKm2L+aakyxQ8ZE5HpVfjMfHe8OkqcvOHTAT9b6t1RSSUniKlaKloXWHr
	 fBGmrMLOgWB60dzrbVFotSKEF+9l01XygMYtxtx/DAyEpnsqmDjEDM94ZUxvNVm42pQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KxoHTK5U;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=IiMd0PLG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F737606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F737606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KxoHTK5U;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=IiMd0PLG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795634002; x=1827170002;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hk7tFDSIU8SKVCgmTKinRS5QKOhkdgBWztF4gVBcCOc=;
  b=KxoHTK5Ul5DmQfBLi5Nhdz60EEDr2v61RsBXzWSuybl6NpDSrEwLETll
   n7EQlMD92Q6BbQPogf2ZjZxd3LgNYH4qTrQAGU8dKlFS04ah9AHEW+tJv
   VONq1D374kKr8hd27t5qA/iHohH18+5Gtn5QEwceW9WPwlDeu6LK/zKlD
   h2SC/+Mz0B69emqlbquCwOVT0cbkiBGg+cP/EqvElAVhnNireMbtLefDD
   IhIR9E/00JsrLDmbTdtCANvMNBvnHAuOoHH+LV3BRTjErDZyjPmLIDpex
   VvjZMBMPK/7DzBEwRSO8jlJ4BtD0jfiahP00V0MV1ynfAnAbjWn+V+jkj
   g==;
X-CSE-ConnectionGUID: dhAdhqi3TB+C4EQAxhNmVA==
X-CSE-MsgGUID: YJ+8CNB4QKWTUN6CBJeG1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4423977"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4423977"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:13:21 -0800
X-CSE-ConnectionGUID: fmARh3NdTpuarbu12LndNw==
X-CSE-MsgGUID: 1GO8jB/CQzS1u+21bOcsTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12269867"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:13:21 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:13:21 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 11:13:21 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:13:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWIKJgcPIodpoobYNV7m2lrtlfFHJZSSy6sPdoJ2kC37u/lodCw4nYly7+rhSsXl7MJSSEy3eMuFcNY8IaDxarJ7aA2qfrbQfvg5Y695noigC8qUjvC9sgZ8nGwfbGeeRVbjfpK66mBtKLCh5nDzrorqogs2/WSvBofiHIusMv91WhFjvRbjWsQm4Y24yYwP7csceVlRxf2GuMUmTBy+W4gxUYzzKmrpmOU4ietYhWv43xkl28ybMVWj0axXnNPgvpuYqEowM3RORsc6ijhAHlQfYn7R3llKmO0kRCCO0I3yaQD6rlDsRuSduE1YOfxRItkXfWRBMEO9WI8tRM2GOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeWxgzgS17wp/3SR3RVo7ZikDUpxskgwd79OHm/uajE=;
 b=AtazSjz61zkZSAsjnhKtoTuHllWMMBuF6ToVkEB6gKMjq0QGZavjon3DeJ5yAJHCDQS5w/HP2Iu25g67HeUCllnmILNXdBAOteGssNBWW/4dk06v+ptkCRQU5n0xf5PTaAW5jGBEcT4/lkZsv9QNMdmT//qaWtUqUdA9+mJivKZeIEQ2x+Dq4mLx5Upk/+899AcawQ8sCWocxXG7Bf1iqo2JqVU7qmAQ83zlZtFY9fv0eezUf2QtEy2fAgVPfS5QMOVqw/go+5B+SkhFk3H2U039mR34yaY0SY4AuR9vNLzuxEcUUV/ksUDXD9eErF/Zzg8japw+QQMJaZAiTdrbYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeWxgzgS17wp/3SR3RVo7ZikDUpxskgwd79OHm/uajE=;
 b=IiMd0PLGiLJc5a9OcBLcGh/g1tGoyED6qD7BRDjeTeqxWjPSK8AlWhsJJWjVqJ8fMNhpT3WG1VKHflVj2JioyObkV8y9N0jM3LknrcP1GKkO+hXE6Fy+R07yMEPmtea9gtN0HyOaKotDMARQcUGvj0ncnsH6mxwZcKeQ0bNymiY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 19:13:13 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%7]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:13:13 +0000
Message-ID: <c3662607-96c8-456f-8ea4-9e13b2851f4e@intel.com>
Date: Wed, 25 Nov 2026 11:13:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 12/12] x86/resctrl: Add MMIO-based LLC occupancy
 monitoring support
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1793864720.git.yu.c.chen@intel.com>
 <7bed6c8ff93d549d82c546010933d8e6c02aa44b.1793864720.git.yu.c.chen@intel.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <7bed6c8ff93d549d82c546010933d8e6c02aa44b.1793864720.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:303:2b::34) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ0PR11MB5086:EE_
X-MS-Office365-Filtering-Correlation-Id: 69002c16-1d89-4754-b6e4-08df4b2826da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|10067099003|11063799006|4143699003|5023799004|56012099006|261022075727099003|261022105027099003|261021123027099003|261026140227099003|261028144727099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xOmzpseCg4dw2A17wNqbVqfL6fzaBe8Mw6kLiF1phsJ+vbFonfduL6P9jxhTLQ6nI5I8zx1yjmcWJzWmAuQAPg2Vh6rBTQkGD+UQvgf95UWtcDHW0qqZlVYMC1M6els1jKJUBQNqBYw4GqO75Sb2XpjOwa/KlWnbT94C9buTlSS6quwtcMkG0mI+xYi97QzAm0zuZKXzygOjgNTwcViaZQ46DmDSnzF7wGHSyXutbjpcxwxC9BH+4wsfOwPPagPtJdmaX9NxIODRk8Y+EvZy31xxIcdW951sXd1OdCQ57sEbmWsk0wBGxUpH3gLChVgW59uUohmdCkGQv+iST/+aauQUT5ZjKhTvczi1JwcV7DgKb2R+MSX6vH1xNoTyOxMrYCOWw04Z0ez1vpDBa5HdDfgyHEYPA126rOBpg73lcqyUjPA7M8xkAVuSxnLEjNN0GlQpIJGHiWNiFC1DLOF6dX5dD5Ar4Xg2UNQsS8wNAMDDdNGzO7T7a5NtHlfZRuQlH+lRNr0lb8hMHaecmregKqi4CAFk0vIxvmdhsxWqXgkNumC3Q2mrqUWXYh4Zam0eICcs0dKn4i2XGbMPpvVTcjS1BkZm7p3ToQGVa/NuWYs289Y5F5VnkrZ5qzznlmXs3OYVjt0l9mPl2oCOsn46xa1dmStvFldNmFn+CY1uy+Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(4143699003)(5023799004)(56012099006)(261022075727099003)(261022105027099003)(261021123027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFBRaXR2Q0pCUjRHdkZzT0VpN2NOL0kwMFFMQ2xUdHNCejJEaVJpUlVROUpC?=
 =?utf-8?B?T1VjaXhKWWQwOEJRRmlubGp5WTVCZ2E0YjNPcXdENVlhL3JCM0dieUUyZEZ6?=
 =?utf-8?B?dlBFR2l6U3JjTVJJRVZ4ZzM2NHJ6QTB6eFFkcVZncFVNSWlmMk5iTG51MlBy?=
 =?utf-8?B?ZVFpalNIbXlxUjd4Q0pxYmo4VWlJSUFrdVFxQjllRlQ2STJRQkpoSG42T0g4?=
 =?utf-8?B?NEt0NTVyQ0pOT1pxSG9ySmxPYVA4SjFobUFXcGdtQW13eUJkL0RZQ1l4VjlK?=
 =?utf-8?B?bzB2NDFuTlhqUnA2YmlNMkRRWUJlY3V3QUE2VWM4Y0VpZ212Y3FQUFZ0eGRZ?=
 =?utf-8?B?WkZkY3VCMHN3UFhNVVJZYVFiWFdBcjN2ZjZhNTN3M01qSTdrTVkwTWRwV1Rz?=
 =?utf-8?B?cmdNQnhyeWRsN0pjU0hGdjZpNngyWFZQK2pMcFNxamJjMHFCNFNKQkkwb3lD?=
 =?utf-8?B?OGxES2s5Y0lHUmtoK2RnUWtVWGF3b1I4eUEycFpOdXVQSUVRcEV6cjJzb1lp?=
 =?utf-8?B?dnNLUXd5aS9XQ0gxMUdjNEYvNnR6M0h0RU5FSG9HckQ0T1laT1Q2UEx1QmRw?=
 =?utf-8?B?dForZjA3Lzk2dFBmWEs4ak5SWWc1d2dTaVR3SHZRc05Qd2NhK3FPVzV6YjVH?=
 =?utf-8?B?OStDNUVHQ3BGeVpiYStxU0pZdWN0T3FaRTBNL1MrTjBzKy9rL285bzN0MjY1?=
 =?utf-8?B?R0srMkxxZXM4MEUzdlV3alRFeWVNUGUyZW1qZzBkb3JMR0xzQWJKc1o3aHBB?=
 =?utf-8?B?cXN5Q3oyb1M1UGpHZ0hUa2ZpaUxRd0FPMExBOFdqa21pN29wK1BqNWNrSVAw?=
 =?utf-8?B?cnF0SVV5VGdqcUc1NDZ6ZkRlM2QzaUN5VWJDSy9teUE2WnhZRWNYSlQ1WjE0?=
 =?utf-8?B?QmJQYXZJSGJiZ1d5b2FhSFFGQTg5ZEpETW9Tam5RZHBubUhwMGcvZTd6ZFVB?=
 =?utf-8?B?OFBlVVpTQkpLb1p6eVg2NUFtYUE4d3krZ1B4cDQrVUoxN2Q4ck5IMjJUTG8x?=
 =?utf-8?B?VHd2bzZKZit2a29raWlsNUZLZEIvY0ZIMXhZMWV0d2xFS24zdm9uSFJITmxs?=
 =?utf-8?B?UVNWNG5rMnRnSk5LclFqcWVGdjh4cmRDVFNteVNoVWRNcEFzWlY5bG9HT2dR?=
 =?utf-8?B?SU82MHJCWU42K1FvcG95WXNwcFFSM3NaY0d4YW5hSGRuQXY2U0xJRVZXVE5k?=
 =?utf-8?B?cE5PMEhPN3JzcHhJd0YzS3E1d0RoQ2RYUkRqWVgrNEtmeFFsWFpPa3lCMkwr?=
 =?utf-8?B?Zk9CR09JMkN3bjJ3MzRSUGd2bXV5ZnhIcDEvdTRxQTdvM2FpQ3NkYnV4YXp6?=
 =?utf-8?B?NEtnNGUzVHg4bEtmMDFtZXNUTnpVdzQvNnlsb1R3UlQvS3F2MDBWQitqYzlD?=
 =?utf-8?B?c2JHVThkcFFlZjZtellNNU1LaithRFdaK2QxOWRQbHo1TE1reUxvZjBMcEh5?=
 =?utf-8?B?NUZBc2UwcDBFWUozVVFYcEZBZ0l3WGY4TmVDajZwNWl6dElmb01oWGNpZCt2?=
 =?utf-8?B?anVFQ3VWVWhuUExwYUtDSDdPZm1jUGoxaG5kdEVoam1OVVdNRmc5MGswYzJK?=
 =?utf-8?B?WHFVSXJHOEJleUlQOU9nWVRsb3NLMUJRMUd2anR3MUhPTk4vREhFbnlvS3gx?=
 =?utf-8?B?VzZ3Rm01ckNhSHVPU1NWL1FtSU9RdGgvUUx1NERQVk9DK1VVcHZ3c0l0WVdR?=
 =?utf-8?B?ZXcrWmV2TERNaVIxanlwME9wNllMYkRIb3MyR3dlWWxHcklpZjJXczlSNldR?=
 =?utf-8?B?Z3pDZTZZMFVTRms3OGZaOER5aGk4STl5dEdrWHFpSEdLY3lCdVFjbFRURTMr?=
 =?utf-8?B?TFZzeHQ4Tm5mRVZiR1h0ajJ6MjdlQUdOeVhoaWNkWHdBOHBYS29od005RFly?=
 =?utf-8?B?N3FMK2hLV0ZkRllQYWtYc0lrL0pGZS9nTFlBb0dXQlZaRjRTbzgycDFLWUxR?=
 =?utf-8?B?V3AySTVVbDFsMjBJVCtSZXZBUGtSQlcxektNVURSVzFTWDFhUk9KUGhtL1BG?=
 =?utf-8?B?ZUdldkhaWk1DUW11amRqRWFoVm9tTVBlejlMcExpOTAwa3RkbUwzWEQ2MTZQ?=
 =?utf-8?B?Sm9sbEl4QlRsRTFsOTRJZit4UGZ4L0g4Nk44V2pHOU0wNnNUd3VxcVltQThO?=
 =?utf-8?B?c3htemJPZ3R0cXdXM1hWcHh1OWNQTG50YTh3ckFwVXNHeENxTXRTVE5UbVRx?=
 =?utf-8?B?cTlCbkt5M3ZFUm96M2dHTEg2emcxMFdzSnM5VHFPOVNXS2Z4dlBubndPUkNG?=
 =?utf-8?B?aUlUcEJvSlY2YW14VjQ3enlDWTVENlJsYTVPa2RVTFcraUFveE5mYWZ3Ullm?=
 =?utf-8?B?US9uRXlrTHllcFVLb2ttMU53WGVrMjduTXluR0NLbDZOMFVKL3FMNCtUanNT?=
 =?utf-8?Q?/uzsFsa37IAdo/rg=3D?=
X-Exchange-RoutingPolicyChecked: hsa1qN1UzTvvfNmyBoQypiuKRje3lOdeOSchdcDgH7Lm/7A0zdM6Cb3llnH2bFkc7BJEzGW9NuIJzL/scTdvpIgzF0tO5G/NEMuAve4VYtBrZK1Dq8HTE4ymyGdPHE/b+uVVtU8DA0E+b+WMwyhDyvAkdahZhT5WfxaVkPetwLBl1VWskuqCWFYYCufS3Es1SBojJhYQ8ZzBEpePsNS0gA++xktONg43R7Grr7dcEuh0E5jjiikFv0/jYNIzQyXYJnZdR+RouQsA02mK4uvYasb8b8EMYh8fYmzXAD9+UPD56p6Gow36Zc2rRClHE3EUNz2itguvon30J9fCG5vDYA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 69002c16-1d89-4754-b6e4-08df4b2826da
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:13:13.3831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EENxcASEMyi7zkAuwJo9CWngibPDJc7bD/vTQhNjSCbzHXrp8s9Uy4nTtMEepRWN0paYS1o7VKSWqg4vfQuxdSi15xUr6/k9FTaZk6wcI04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
X-OriginatorOrg: intel.com

Hi Chenyu,

On 11/5/26 2:10 AM, Chen Yu wrote:
> Add erdt_mon_read() to read LLC occupancy via MMIO and use it when the platform
> supports ERDT. Fall back to the MSR-based path if ERDT is unavailable on this
> platform. Mark the LLC occupancy event as readable from any CPU when it is read
> via MMIO.

This is just a list of actions without any context or problem. Please
see "Changelog" section of Documentation/process/maintainer-tip.rst

> 
> When LLC occupancy is read via MMIO, limit the number of RMIDs to what every
> ERDT domain supports. resctrl uses a single number of RMIDs for all monitoring
> events, so this limit applies to the MSR-based MBM events as well. When LLC
> occupancy is not read via MMIO, e.g. with rdt=!cmt or without CMRC, no event
> is read via ERDT and the number of RMIDs is determined by CPUID alone.
> 
> Keep the per domain limbo handler even though the occupancy counters can now be
> read from any CPU via MMIO. A single global handler would still have to check
> the limbo RMIDs of every L3 domain, so it would do the same amount of work. The
> only saving would be running one limbo worker instead of one per L3 domain,
> which does not justify maintaining two limbo handler models.
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> ---

...

> +
> +static int erdt_read_l3_occupancy(const struct erdt_domain_info *d, u32 rmid, u64 *val)
> +{
> +	struct acpi_erdt_cmrc *cmrc;
> +	u64 l3_cmt_count;
> +	u32 offset;
> +
> +	cmrc = d->cmrc;
> +	if (!cmrc)
> +		return -EIO;
> +
> +	offset = cmrc_index_function_1(cmrc, rmid);
> +	if (offset + sizeof(u64) > (u64)cmrc->cmt_reg_size * SZ_4K)
> +		return -EINVAL;

This looks like an out-of-bounds issue for which -EIO is more appropriate
since it is translated to user space as "Error" instead of the
"Unavailable" that -EINVAL produces?

> +
> +	l3_cmt_count = readq(d->base[ERDT_MMIO_CMRC_BASE] + offset);
> +	if ((cmrc->flags & CMRC_FLAG_UNAVAILABLE_BIT) &&
> +	    (l3_cmt_count & CMRC_UNAVAILABLE_COUNTER))
> +		return -EINVAL;
> +
> +	*val = l3_cmt_count * cmrc->up_scale;
> +
> +	return 0;
> +}
> +
> +int erdt_mon_read(struct rdt_domain_hdr *hdr, enum resctrl_event_id evtid, u32 rmid, u64 *val)
> +{
> +	struct rdt_hw_l3_mon_domain *hw_dom;
> +	const struct erdt_domain_info *d;
> +
> +	hw_dom = resctrl_to_arch_mon_dom(container_of(hdr, struct rdt_l3_mon_domain, hdr));
> +	d = hw_dom->d_info;
> +	if (WARN_ON_ONCE(!d))
> +		return -EIO;
> +
> +	if (evtid == QOS_L3_OCCUP_EVENT_ID)
> +		return erdt_read_l3_occupancy(d, rmid, val);
> +
> +	return -EIO;
> +}
> +
>  static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
>  {
>  	void __iomem *addr;
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 87494316becb..4d5aff6ec1b5 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -155,7 +155,8 @@ struct msr_param {
>   *			which has been corrected for features like CDP.
>   * @msr_base:		Base MSR address for CBMs
>   * @msr_update:		Function pointer to update QOS MSRs
> - * @mon_scale:		cqm counter * mon_scale = occupancy in bytes
> + * @mon_scale:		cqm counter * mon_scale = occupancy in bytes.
> + *			Not used when LLC occupancy is read via ERDT.

To be accurate this should be "Not used for LLC occupancy read via ERDT." since
mon_scale is still in use for MBM when LLC occupany is read via ERDT.

Reinette
