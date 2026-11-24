Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795541283;
	b=LRZgHEK588iWtDBp8hN3tA7PFJHqy3iLGGtlDMwPldGlN2JqchTRFlzRYY2zq7ETQiby
	 c6jQT1Ldb+UnhR2lG0mNPj6oP9bAC1EIMuFS+v+R+u/KH7K7ikelZTmzdq/I2jaO+BRXK
	 DWHPRedeStcgQEPxCBEnnB41y2LnJq2feLC23RvZjITW/p7rm8g/UJIo74radCXjuGiiG
	 Q/BuVJWKmZTUTvXnKgRvn5LrrPbkrQOY1i4WGrHNXnvaqcN4O8pG6nV+UC4S897ArHFKU
	 NwVg1/Dnq8m3lhGAurF8JV2fdXhu27JmXtFXtRqUL5qyA+4lA7KWE1UjpBJvhUBvMhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541283;
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
	bh=pzmpHYBkEtZ8m1N7wvYIf+1YqQ7n9HnUtsXG0Q/N0LQ=;
	b=hUse23A5JZQDAWoiGOnRw7hJEUiDAtasiv76unKtuWbReWl2xofk0qeiK2/IMxcVKUfo
	 7Kz4g1JexEq+GXuSxheNaCR1pFD7sbKyeAuDXp6LfR0X4HtsNCcdTjdvFiHWMLTy0jUH/
	 E0cgCC26N7cbCAtCf6mPVBehQF2XtNVKoxPzmynY7FSyrdM6J4ocX6W/btTT1yBPB7B+n
	 yy/Lh8uS7TnY/Q9gIpQ0GmZ/k67jfhP2eSwZJLXEyXczwbHr+5ib1xo2dxRS4bukAW7t3
	 h87fl0Vi4QKcxpm9eTmxPk8jVe2aQEao+179Fvff7xs5Kfma3JdYRGgWqjgXD3fUhKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="LreN/8lg";
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kRwAeKvk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F1B606A329
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F1B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LreN/8lg;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kRwAeKvk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795541282; x=1827077282;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DNPzhXLMSAW99m+RYCL7tl7ZvjpU3QmYlKH2BmQSbZ4=;
  b=LreN/8lgao+RyVaJGSfCJ+erOrKIlbDZeIrwzMqnV8pm6SFnBhykY7Zk
   Euttmt1DlIRnTn55F2Kl8dxDvIPXt9Brnlv3qbdS/efDtjlHlbIPqt7Xm
   mYCyOPsFEjACWnunZ69Y+iZ/IPi2d8f3q5cWBheVjEyNfd92PaBFhuPMB
   MpOIuRnmmh4vp2l/ZgqbIyH798aLha5mQD8D3XHI/FI81w66VywnVC7DG
   8+7+NeUoGdIxCteOmJmpf2pCmYvHKdbbi56l0DzUurLig40NQBkTBIcMn
   l2w90iBDT+jc8DHqp2jB0I5wnszqkhkCYhVVtTON/jX/OSMkmVLjG9Cbu
   w==;
X-CSE-ConnectionGUID: CW140kmfSZuEJIVqUbSo0w==
X-CSE-MsgGUID: 5qH+f0y4SgaCZdvRRgKgUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4411606"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4411606"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:27:42 -0800
X-CSE-ConnectionGUID: jhUU0CBvTZWWrgkJ0eKoFQ==
X-CSE-MsgGUID: hyL3wd2RR0Czl7KRnZF9Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11614740"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:27:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 09:27:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 09:27:42 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 09:27:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0j4h9FORP2223gnXCFjIzBBqI566fXpsFKU7H9hvtHXcebtbtS09OzRsN2EMItWv4q64ZADt8A6wdrY8M+CPjHYiqL0q5CYGHGa27TGWh0jACEYaK7zKLlQz3E0hGDr7o+QJ5bkZ+JZreUQjzhLkCUbVGGN1IHccN06ammI3dIhwrtTYpnEHsV/N+oO6E7MY2WE/yWFC7JuYSCTTmjQout3fA3iErIpTIpFaa4AdPmQd8B5yyUSiu0E9fg9m1dx/lH2VsyfRDPz4L4UFLJSt9aiI5eTanEIecDeHCB+/54y5hLjXBJ4ER+iSwzXso2ad/bKqir82tP3aVg6pUSKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzmpHYBkEtZ8m1N7wvYIf+1YqQ7n9HnUtsXG0Q/N0LQ=;
 b=HrzxUb8YnK4/nZ+UpGDECZ/ZdgYsySsz1KrF0NQyN/kjWt9b1pYM2C8avT1/0+wgKOxZv3OAnwqiTTMMXENAKYr+1K5dA0iiHP+8CT2apoL/+JDnD2jxdC/bRDcptRuVa6mDB52ZGKR8TX0eU5Gyg9e2+Eh7pJhIMhuRt4VjxEQYvhKTkwgDh6vG40wmDyVn1lsunHu+8L1q9n/E625JrcNlSQPG4629KpXdMfmq6wYL0Jp9HmL3Kwb6WnN17ZznDUiDKAaq8Fn41EEsfKaLspy1vI9IV66H9pctpZuXMQNP5AmQ7Y/uait2mHtaOk+q7nlL/dCi6MzR/7KU51Hndw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzmpHYBkEtZ8m1N7wvYIf+1YqQ7n9HnUtsXG0Q/N0LQ=;
 b=kRwAeKvkjfNqxjI1pGSoQuycahHq1y3/BwTVYKHwoXW7wdE4GUtBe+etMsHYSC8pln1clAfpnJMZ4JjOdwcSTI/+SRIflQyqF7eYF7ZSUn5VZXyOY588DWaKvolgfOQLnnCg5nsmlYfpIgNQGE3RZcdzgBmuvHIjzCg3oLURuYg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DSWPR11MB9931.namprd11.prod.outlook.com (2603:10b6:8:3a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 17:25:36 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0615.009; Tue, 24 Nov 2026
 17:25:36 +0000
Message-ID: <da363967-f3be-4e55-8b8f-d6af20fb8f2f@intel.com>
Date: Tue, 24 Nov 2026 09:25:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/resctrl: Report unknown schemata domains
To: <x86@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner
	<tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>
CC: Fenghua Yu <fenghuay@nvidia.com>, Dave Martin <Dave.Martin@arm.com>,
	"James Morse" <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, Ben
 Horgan <ben.horgan@arm.com>, Drew Fustini <fustini@kernel.org>,
	<linux-kernel@vger.kernel.org>, Nirmoy Das <nirmoyd@nvidia.com>, Tony Luck
	<tony.luck@intel.com>
References: <20261118205825.3339003-1-nirmoyd@nvidia.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261118205825.3339003-1-nirmoyd@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:303:16d::31) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DSWPR11MB9931:EE_
X-MS-Office365-Filtering-Correlation-Id: c90ce998-8afc-4a0b-a1a5-08df4a4ff3e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|18002099003|22082099003|3023799007|11063799006|261022105027099003|261021121427099003|10067099003|261028144727099003|261009223027099003|56012099006|261026121527099003|261102123227099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: NDrQvuQbKlzWQwX6yGmCVpJAvUwSdYk7PaiKUZvyclSLDhp79HpidW3wrEckOMXJRRoDaGag+kTpJt4I0rBGXo33ybrRnbytBqBTTPZQFaqyMuOm/qtw4/0EB35GSPe/JfKEIrlbjnUhfk1EamRP7p+ZPlF15A3z6iWjqL66zFqt2wQuypD8CBii0ySNp6of9I5BNN9IkfVP/zSDRMSgcSU6VKaubf2kWhaTKpT5a2K9SvIP051BCoAcWeiiiWZF2LG74GvDUvFmxnl0Kmq/kKRXrn/FYmMSi/mp80yDVZqF5iznlmk03JM2FomKiXAHEW2MV3uM5hGZb0skMwhHyz7ZUKAqojXcKMwZqZXPXYqvVQCSh/uwc8Wb2/7TNsSmnd7G+DHMklQ0to8PYWm8R0OTxrT0RI7QXOO+RH3Xh34uTxJVCWSLjVHeBAf2yQp5+ZIIRWL95EQUistYF8kdgU6gTniaw0B9lCv5KYa/QruXJfxDzBL5uDQRmp6o9EKKAWoTkX0EcT0tKqkS3dG/RUDzYSRutl38k2on9RMXy/7iCPGdShz/KzaefNUEMq8U3ViPRBLOH1lwvrBygQO7qB/oGpvxbheP7c4BzBqaIXuZt3JSX4svoAhELP6x50S++TqI3I+7k8Ru2biNygMWDbhnMgMNBVXqufDuh1lR8hY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(18002099003)(22082099003)(3023799007)(11063799006)(261022105027099003)(261021121427099003)(10067099003)(261028144727099003)(261009223027099003)(56012099006)(261026121527099003)(261102123227099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THJCclVDbU5CeE1hRCtMMGF5WEQ5TWlwdENYTTlqZ1doc1VPQkhFNndxcjZ0?=
 =?utf-8?B?dmprd3pyVXY0cUJUbEUweXM4L3RnL3FLZHZuNmdxU3dabG5uWHh6eWR4VVhU?=
 =?utf-8?B?YmpqUGlWTGJFZWhIWFN0SjB4V0VBdWhnd09PakxaS1p4MHA0Y2ZrNDRCWEcz?=
 =?utf-8?B?c0dhdFRBa0hpeWRFYTRVNmloWTNxeE5ZaTFLU0ZQYjVFdVBONForKzY0SFk0?=
 =?utf-8?B?M09oMnl3T1EzQWVXeVF4SHRIV3gzd3JkbU5oTTNldmRHRkE5cHhXS2RsL1Fw?=
 =?utf-8?B?cDRnUy9pRGxCQURzMHNYNmJTSlR3RTZQTnFCQnRWUmFNaFlCM0tSTmxPOSsx?=
 =?utf-8?B?MnVaRjEzQ3lqaDhXT1VwY2VLeFFXcTQxR1F4YUtxODFTbWQvYU1XVmttY0xJ?=
 =?utf-8?B?by9mQUNBUUNzK0NRRmszTGdHT2tGMDEvelU3Uk0xMEVaUldvOWhSYjVRam1F?=
 =?utf-8?B?RzB1WWJNWXdoYndpQ0wyVnJvRWt0aEpTelRIbTFvRFBEeitDbG9iY2FUcDNC?=
 =?utf-8?B?cjdFOVFsRFh5MTd4OW1IZU5NU0wvSVZIb0lzNXRRNnJ2YWdibERrRGQ4bjV3?=
 =?utf-8?B?ckpDNUZRKzZxQkxFK3NnRHRlZ29Bc2NSWXJRdGZzekIxMGZDdXVOTDFjK0pF?=
 =?utf-8?B?V2tzTjdEVkFuT08wSGNxZ1lFUEF4ZGd1MnZUbzJxcTJYNFd0R0Q3ZmxiMk9T?=
 =?utf-8?B?cWl5YkJVa0ZWeUlnNC90RU9lTnJRTXQ0NDhJUWpPRGlxWThBbWZEU1Y1TXNk?=
 =?utf-8?B?WWlWNUd1RFRqcHpxbHFrYzNTM3pQUGtCTEwra2o1Tk5LQmJ3YlRPWThxeTNu?=
 =?utf-8?B?TzJ3eldKQXJRV0toSW1YdGxrY0NzUkx2T0lqaDI0TTJQRGM0NWlMNmRjc2xG?=
 =?utf-8?B?N3ZSanVOUDBQTUVJblgxK0tCQ1NVd01RcCtBN1ZmaURmcSt2SXZtNi9NYjd1?=
 =?utf-8?B?OStkbzJRT1lqamkvTEF3WWREWjJKbnNSNkJIVEdDVTFQZDdQTGY0WjExQzl3?=
 =?utf-8?B?Z2hoYjRZVWRsdFEzZEM5VVNmbkxmQWlydWJWWitxY2g0dUJJdDFnaWVYV1Ns?=
 =?utf-8?B?ZmtBcTBIYm1LT3pnakVDbHpscE9hZFh5M3FRbjB2K2R4bStmSm1yL0pGRnJy?=
 =?utf-8?B?NE02ZmpkMTIyUVVOdk5UaHN3Nldrb0FlZGNtNFJTTURBU0hNRExqcUxpb3I0?=
 =?utf-8?B?YUYwb3NvOXlZWVhuUUY4U3RMTDhodDFHZzNLYXdpZWNaSW82Unk5bnVCQllh?=
 =?utf-8?B?TjBtS0FPd0I1NG9MSEZYOWpTcUIrN2FVdlpIT2tLVjBnYkFFYWVuRStkOEI3?=
 =?utf-8?B?SnA1RlFrNDYwbHl2NTRUbnViM1JLWG1Sc05YSUVCZktjQ0FKSkFOOW1aMHpV?=
 =?utf-8?B?Wkc5M0FJY3MraVlOVUZZQytrNmMvdS9SekJaUG41NXVRQmE2ZHBFTnp0NTQ0?=
 =?utf-8?B?ekZPcmpCYkRmS3U5UUtsZDB2azR0aEJQSS9jMlJ6TkFCNzgwVzR2ZDJxSURi?=
 =?utf-8?B?V0daS1BEd3g5blU4bzM0cFErOFZoREx4YStoUWMxYVJwcVpyY0xqejFCcFpE?=
 =?utf-8?B?NmswbXlvTmhzdUJmR1lDbzZzcFRHRkViV01wRzlRb2tjWjFDR2s2TUZKcEs3?=
 =?utf-8?B?cjBtOVU0VkFuZlEyTGsrN2pFalZnVThldVNyTHpqRmk1eHFRajhEdi9NQnM0?=
 =?utf-8?B?anFRUnhXaUxkTzBjQ1ZTWjNrcElhQlEzWk9yVHoxYmRlSmVmQ0VETFV1SytW?=
 =?utf-8?B?UncyYWFiWE1HVzEwb2VQRXNkaGdkUUhlamJkL3ZpQWtkUDlDTU5tdzVWZVN1?=
 =?utf-8?B?Uk1pdEZ5MUt2US9uTXRzdjFoTkN3QzF3MlZXRVpDN1NuVUppaVY2QjZqTk9B?=
 =?utf-8?B?bldPS1ZaN0F4V2xCc1RKWllic0szVlBicE1SaDBpZHprUDA0MXVTV3hPQy8v?=
 =?utf-8?B?aTFvTUZMbC9rSkJ6TkpxbUxLRUdVaXg4VHNJM0cwNzIvV3FRR1ZRYkpuRGxM?=
 =?utf-8?B?YzFacVYvaVZ0QUFVMW9NMk43YkkzUW9ocWg1MXBHNlJRZk04YzJYcjhJdVJv?=
 =?utf-8?B?NGw3QS81VmREMzZRRmIxdWNWQzhWSlMzQVZRRjZZQ2MwR1ZYZWhkYmlGY01Y?=
 =?utf-8?B?Sk9lazFmQkVKWTJyM2hZMzZqWktJZjJpU21EVVUxc0l0L2xRcWN3NUI4TUFz?=
 =?utf-8?B?K1lsREV1Q1FhRExWNjAybkIwRGZqdmt5N1VkdE1PS29INnNwN1FQQ3RaQXdk?=
 =?utf-8?B?MVZvSXFzM09kNis2MXBYYjdFK05BSC9mMHZtdWN1YlVteDhtVnlVYWVWVENv?=
 =?utf-8?B?V3lmZEdlT0hROVh1NXlJVnNieDFOc2NkMU9ieVY1U3RlTVZvbElQUnk1WUlo?=
 =?utf-8?Q?myrUssSYk0jj9Fno=3D?=
X-Exchange-RoutingPolicyChecked: HtMOLc/cw/sYKExQStEmgH5qbAb49ctNEzXY+TDZ5lGvSf3KPc2jS6j+LHEgITk90ny1NfMDUxLQQDhQt3F1tN6bcutXxhaX4Dz5ITcMTql1SZQM9+lB+PNaS99SyXTEsF5al+OmNcoFqBrv2Y7F2Uj+ykItDRQWvVu2ER/Q+7l2jqA6KVRCifycuLG5zufilfpCAXsWS5Ce87/jbWt/WCctHxx/3VDERIo+H7xFvwEp8uwXpQ7B87MwCBaxHcXiu4S1CospSXCBKRLszg/ub6wGIZz35I4cLgtdwvbC7mrehfZUiE7LYUODuZgeINqRhFLkX1ox3QTvgz1+u9qiFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c90ce998-8afc-4a0b-a1a5-08df4a4ff3e8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:25:36.6835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7vcBhFztFBZYlcM48GyiOJfn1lsyM6c5jhuX1IVBePLDP3WyuLDPt5JpSiokf5BjxYrqzftemD8lsWcISLuoZs751/IuAviQOQPo06kWH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9931
X-OriginatorOrg: intel.com

Dear x86 maintainers,

Could you please consider including this fix?

Thank you very much.

Reinette

On 11/18/26 12:58 PM, Nirmoy Das wrote:
> A schemata write to an unknown domain returns -EINVAL without setting
> last_cmd_status. The status buffer is cleared before parsing, so reading
> last_cmd_status after the failed write incorrectly reports "ok".
> 
> Report the invalid domain before returning -EINVAL, matching the existing
> I/O allocation parser diagnostic.
> 
> Fixes: c377dcfbee80 ("x86/intel_rdt: Add diagnostics when writing the schemata file")
> Signed-off-by: Nirmoy Das <nirmoyd@nvidia.com>
> ---
>  fs/resctrl/ctrlmondata.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
> index 69123b2a3274804a..2f7db6c669214c3a 100644
> --- a/fs/resctrl/ctrlmondata.c
> +++ b/fs/resctrl/ctrlmondata.c
> @@ -279,6 +279,7 @@ static int parse_line(char *line, struct resctrl_schema *s,
>  			goto next;
>  		}
>  	}
> +	rdt_last_cmd_printf("Invalid domain %lu\n", dom_id);
>  	return -EINVAL;
>  }
>  
> 
> base-commit: 2a93af75384b7e95d62c5a9a39e13573e2170ec5

