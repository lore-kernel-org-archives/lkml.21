Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795667382;
	b=gmQQEahu473hUV35peCeql17SlQQ6PufduLtWeFut8v7RikqqEOMEt9FycEDHQuWmrC7
	 DG7q0hStAAW6qpO8Duyu7t069rHqTGDm0vlN1uFk7tpg3E3EBpY6oiWu2k85gN1tVJA5e
	 p4k1W2a3dR1lEUOeWO29M9eUggW7GoxVlbfF7rHePuwrJNVDL/1/0ETFfvEtrDanOGGot
	 rL1Ktef2XWup+VDNSxbwrG5WOUCPW/Uy6/Q5h/bfQoQAfUGtqN90nMP68saalPDI9jPhH
	 C8UJQXGy/sJqs7W7Su2KeohaT/jqQqhqeYO16XANaqWT0YXiiVN7FzUmp6RUjsldzWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795667382;
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
	bh=zRuVz+4P7tJ2G37nNpm2gKfIzbWCcv3DY659bsRJlkk=;
	b=OJk+15adV+gPuzExtidYFEv4mI551Rl39thyFxRwYJlunyPpVg3SssYNB85BsEynfzmS
	 dbabVltnGCDMCg53icLtgvnVFRh7LIK1T5u5w9Eh7aXE8I5/PsljGsiRRD9vgxF9YiQfS
	 goyUxwtvBAvpHisYpz/rBtrl3csVRe3/wKqNUzu0QVW37H8owKB38VzeYgezy3NTHZZZa
	 SljlWZGDLh5vl6iDm80LBzntJScCtxHZPB18HM+xSOwW6q90t6B5mf+jWvx2lXSPLhMsk
	 Q8IVjRXfmVa17KXv7SKCevphlUBiIRFcZH5yunhm7ofXkXp2n9S6V6guawOYv+8+O8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GHufvA0d;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ID05VW+G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D214606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D214606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GHufvA0d;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ID05VW+G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795667382; x=1827203382;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WQrw64N2WXbQLQNt0+FAvIR0xkzT1imzbMPXCDcqlrY=;
  b=GHufvA0dOZk22mkq3ebAwqudrJazRD5j3ODKACDmtuqfAfW6sNkeKm7T
   P/VO8Fo06Hm5uXmgAtys2VUYwwars4omG3Myovi2woGG9FVVTI6/D68AL
   QuCygQ87BuJVvEXKenhOddeLBCovGErXQAnN/cexLLLa53KtoDyMEQ5+X
   KxsKbSQ5h6yamkBHF7QlT2EaXaLUUZuTCWvnBBmrv1jVJXmYyNQ6ROmUG
   Jxm5IQCFdqzEafAnbfeWYwrGlMx/roXi2HKaJgO7NVbV68XSbQWfPPQxY
   OgJKgQhxVlriqIIDgx7CqWPFE+t69EPujv8qsVNQWTgZyrToCKtjkngvh
   Q==;
X-CSE-ConnectionGUID: b8L3QLzLT42DE4FlXT6BeQ==
X-CSE-MsgGUID: N/0QYkLARtmAOgeh72QWRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4575908"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4575908"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 20:29:41 -0800
X-CSE-ConnectionGUID: TR0uoq/1R+OJopabafyIpA==
X-CSE-MsgGUID: X8b14LUaQR+w2bkyhtGuZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="13744036"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 20:29:40 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 20:29:40 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 20:29:40 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 20:29:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7bEziej1OWGMYDejsiB0/4fiMi50azEhVWO8D7wrJP06yy3gfQXKqPAbZBum+mLgrlvxDKoJq5T13rJcq00lgdYM6Hf2U5YzWin4Dag/p34j1o5y7HBHc7dGoyUBa4Rwx9FB4cenC6DyLAWYqCcYTb/aIMCx4TiRLTHDrd/vCtObHWNAA8fJ2O8E9SDq3ZANQCgLXAwvuxnd02uUrBBfA9wyd85OuS3uuHgA8D4weDnqUOz61GM8i21SijOejJLoTHUlJ2dLr2JXo3Yvmv1NoOWNklUnUdhGJPpfrGWYqGhCUPc8Zo+BpxrPvvrDrlzP3k18eWOMbgifKgpqHDPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRuVz+4P7tJ2G37nNpm2gKfIzbWCcv3DY659bsRJlkk=;
 b=jDTYu/Y9lsA2mkmGDuaiNIGmFvttdzHymf84lRT+CsHbTsX3l9XFCjh9k89SYih2giV5I+kvBWxPyuzMxv7QDqmDgb5/uy9R8DwNszNsuTgJwZJESPI/N4fR7k1htyVDs792PthIZW+JFbU8cgMHhhkHAVpKusehK92DqSksMIViSCQ8khGS/GWRb7Uaysityhx9PzRUdhqF91LrWR5isJZuQ83CsnqiRa4eQNKWtuJ5aLD+w33NFvdSusdTMjJhYJhTAZBbgumLLQ6UruLu6oz8I4b/zYbexoAAfIMqaV3eU54R7LiZExR17AGjTQlB7W9eD1Sqeuyb8SBSvcozpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRuVz+4P7tJ2G37nNpm2gKfIzbWCcv3DY659bsRJlkk=;
 b=ID05VW+Ga2dwJFvhX5zXW7MEUMjqRY/ROcwLP6eK4+9crNSwT9jcT8dN65u7zylvyjf2pgwy+rdZJJM7XLEXaUcequGTura05HDym8/yRy143p/sM0OeLb/mRhrlhWpiNkUL59Vnubm+X+N9ZXAA5eh/MNn+FD4Dpcai8VGr1SE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by IA0PR11MB7912.namprd11.prod.outlook.com (2603:10b6:208:3dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Thu, 26 Nov
 2026 04:29:37 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 04:29:37 +0000
Message-ID: <d4f08ffc-fc04-424d-b13b-41df7fa94e74@intel.com>
Date: Thu, 26 Nov 2026 05:29:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cleanup: clarify scope-based resource management and goto
 guidance
To: Peter Zijlstra <peterz@infradead.org>
CC: <linux-kernel@vger.kernel.org>, Kevin Tian <kevin.tian@intel.com>, "Dmitry
 Ilvokhin" <d@ilvokhin.com>, Christian Brauner <brauner@kernel.org>
References: <20261125161205.65809-1-przemyslaw.kitszel@intel.com>
 <20261125164443.GH2668804@noisy.programming.kicks-ass.net>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <20261125164443.GH2668804@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZP191CA0070.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::20) To LV3PR11MB8508.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|IA0PR11MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dad26bb-ba19-4345-b0d2-08df4b75e136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|261021123027099003|261021121427099003|56012099006|261022105027099003|261022115727099003|261102123227099003|261026140227099003|261022075727099003|261026121527099003|261028144727099003|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: r6BSA6/UbEx/3okV+bxoM74GYA/CJ88pI/Y/IVvEgHmq5Ugtqep9sp5hw44agcg5C48bnaSnbB+EAQzbcg6DsoyjWtRqPWaomxBF/YOVxIT/NoPxSeil5cCeAFMWTntRdLLsZ8Mu8wiwsWXbbJHqx6cDRNhwAM2wnaYRxzdgV5IqdpIQpH+uVKsbt7m944depx6QAG5taq8SmEU5LqbWSZ8jSjL85weXjKzJRYD0OiBrDJiny4u07X7QaTgy76HQslAvB65lt/XRux1bfKiHLs9SaIPRyQkiSODEgjDHvZTBBol4ccAw/aLCdJfu25ncdKT4yKDFyMAVTPjKycbvrkNhA5VkjpgQRJ0P9mlO8KXXMn2xqpTrWci22JkJE/aEClj7d0SSPpBgXeu5F02oq3L6lZNh/OnQfKAMfG3G3HM1nnlAEZjMA7OUj1IUktZBb4rzBqGQnidknAUEDGztyJmns370XUebjhrMcvRgvxd/wPsc8HhCWF8y7CQf6nhE1N2ZfxZvc3nhGH5MXlcQbuS0zhEJyXe01lPsC5U9Yv8S5D/eURljh8o4FEJsJ9xWecsuXLTUWJ0SSii3IeuEilDi2bENfBQxfloIDyKRt1dRbq8irWON2gPqt0uiPi7YcJe29Ai49OdzzzG4JJwT5tGJPkpXnIbTlkLD7xS37XU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(261021123027099003)(261021121427099003)(56012099006)(261022105027099003)(261022115727099003)(261102123227099003)(261026140227099003)(261022075727099003)(261026121527099003)(261028144727099003)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFd3Sk5vZ1lpNm51WTNBK2F6dXpUdGRsdFp5T01Fai9palZlemNLMlNJSEpz?=
 =?utf-8?B?elJQdmFGVTVpMTZRWlI0cFZPa20yQm9zdU9DRHVqaFRpbVBBTTdoVTRsWWpq?=
 =?utf-8?B?aUNKUWIxZy9IbXZsMWVvd2JuTThqRlhjblNhdjZ0Ym5SeGdmdzUwTnoyc2I0?=
 =?utf-8?B?OE9yVFhwK0lHVzRReXJuWXN3TGRkNUZFSEp5aGJGSTB6VS92MEkrVktUd3Nn?=
 =?utf-8?B?YWs2ejRqMFpkeTlmQjBkMlc2V2VsbVBaOUUwRWpxS3ZMYTYwb2V6MDdwT0FP?=
 =?utf-8?B?K1FsRVlzSTRIaDYwTjltUThmV0ordHJ4a0RLNVZoR1pHT0pxWWxPakEyelFJ?=
 =?utf-8?B?Y2VEb2F3eks2TEtoVnRBN1NGTnFOcWFrQ3Fad3l4NUo3Vm5IRnQ1SVUwUy9i?=
 =?utf-8?B?M3RiTE0wLzdMcHdUNW4yc1N5UDRtOHUwa0szbFJyTnFGWklyMDNRSHZ3VXVj?=
 =?utf-8?B?cTJuL2JwUDh0UUZUWGEzY2Y5K2FKQVVNY0d6M0pNR1FSb0pBUFlUSmp3cS9P?=
 =?utf-8?B?S3U1TTk5V2pBUTh4Q25PcjFIWERBVXRJSGxPbzNjWlY2c09kdWJMZnEyUm12?=
 =?utf-8?B?SElWVHQ4YUtFOU5DYWlhYWZFYkZzTWhjV2ZGaFk2VUdHcm9iR0RJOUVsczVX?=
 =?utf-8?B?dUU2aUN6MGZ5WjN4aTlodjJwdHl2eGMwQzVHanY1VUhzT0xSU3pSSUQ1Y2hy?=
 =?utf-8?B?RE5ROWZxK0Q2VDFwY25uci9Dd3NjK2F1eGpNaWxIcHk1L3I3YXI5d3JkOGNQ?=
 =?utf-8?B?a2t0aFNISThsNm1iVzdJYlNMTjRxbm41bzBXUFltTy9sU2dHNFFTUmJWNW5n?=
 =?utf-8?B?cXZ4Y1piV3U2RitpZjVtdjA5OXVDcWw2dzRrczFDRG44N1lFRUpaeVczcGVs?=
 =?utf-8?B?YkdNS0Fla1ZZRlE3RWpGZWlLcEt1eDVtRmdDZHhWSEVpQjVvZGtIanB6ZDBq?=
 =?utf-8?B?aFlKTkpYM0N1RXNGeCtQNlBIMUxNMTg1SlByVnA0RUNsWk5ROUtPczFjSVpw?=
 =?utf-8?B?a2J2VklFZTVCWVBnaVYzNGdjc3VDUUswRjdvbm44c0xZMDJ3NmthTFlwOTUr?=
 =?utf-8?B?d2tjTFZic25yRE1YbXh6bzAxRzVKc0NaMDBkcHVHWXJBb1E4UmI3VTZxZXRD?=
 =?utf-8?B?WmRKd0ZIbGx0dkdqa3JYSXFBVWNxdG9TUTA3d21idytvL3dkQUl4NDh6YUk1?=
 =?utf-8?B?cE5xZVpoZGdZenpBMTZ4WUMrRVlhQ1hmS1NRTVZOK0lpTUFPVmxkcmxLZ3B1?=
 =?utf-8?B?NmtqQzkxTCtOdnZtS2NPbFh5Qm8weHlqNm1zOWJ2ejZ4aCt5cG9YNGphcUdi?=
 =?utf-8?B?RjM1dktMOCtwdEpIZDZzbmJuSENCTFMxa01PSWxiM1RpSE9xWlB0cjlraTVv?=
 =?utf-8?B?ZnpsV2xHMmt5ODE1V2I2clhtZVhEaGVvSnh2Qk9PSWFxUGNPWXRETEJFVytp?=
 =?utf-8?B?M2xHWjFUbzdRMk04OGdrWWFPR2F6ZTZlZVcvRGFKcGE5Y0pxOE83UU5YN2ZL?=
 =?utf-8?B?OStNdDk5NHBQNjN3SjJwcE5LWDJiQ1ByNThUbGZKd0lvNzZ2VFhtMG5kL3U2?=
 =?utf-8?B?Qmw1WFNocTBZemsxeHBpZE1KS3R6U05vcXUrVTU0bzFsdmRQMUFrakZrTmh0?=
 =?utf-8?B?NmtpVCtNcnpCZUNrL01xZU1LUkxXOGJrTEw4RzB2OXQ1T3lLcVRMcFh5TC9w?=
 =?utf-8?B?TTFFVllPYWwyZzdwNXJ4NHV3UU4xeHlNajl2eTVZVWRXSkJpblo5dW5YMDcv?=
 =?utf-8?B?RlR2Z1lJeFdoMlhiZk9pREY3TlQxZGFkaVp0VzloWW5nczd0OERtNDFPdU40?=
 =?utf-8?B?a3FxcXM0bE5YYUVIU0FTTHdlUURGOU4xSFJOaDBqUUIrSmNrT0UwVzdrUkZB?=
 =?utf-8?B?dzZoZ2ZrT2dhTWVPVlg4TWNqMmQxUDdUSEwxVTVDVm1xM1A4ZnlvZGdYbTAy?=
 =?utf-8?B?Z2ZhNjNMSm5aUGV3QlA1aEg1TnBBb0RFVzJtS2QwbkZHT0JhdHdVSWh3Uk9I?=
 =?utf-8?B?cE9SNzVjNys5SFhUUFBYZWVTVGcySUZiM0xQdzBkc0tzQldVK2JzbWZraFpV?=
 =?utf-8?B?RklLemVIR0ZqZDJhMFY3UkJyQ1ozQUhvT0thSFZZLzNtVlFZL2prMjlGVEZq?=
 =?utf-8?B?ZXhKYzFpVzRDOVY2bEVoWkRaTXBXUWJVQldWeG5Zd2JzMCtlK2tWaFlURUZE?=
 =?utf-8?B?WDRDWWFRVGhtbXdueUV2dXpLS2xQOGU5dGFXTmxJZGxqbm1BZHJ2YVNFWGFS?=
 =?utf-8?B?Qmk5cVJESUtxYU55NnFWQ3V1aEM4czJYYXNuM3F2QW1tYzRhQTN1TjZaQVJK?=
 =?utf-8?B?bFk1QVdvSGlRaDdmeGlxd0Q3dFRFMHV5V1BCaUY0Y0RFK2dJVVpBT3BOMXNC?=
 =?utf-8?Q?nYPQm8R38qfXpWzE=3D?=
X-Exchange-RoutingPolicyChecked: O8wStEH5aOkRPKhGX3Qsyg0wHEC7CeYHROBCtxxzpx618gX+lsu4PeZAIFqZgaBpjXWEx5Ig2ZdvTfYnisfpmVLfoQKeea97IKN0IemMfVJLCUohepkbTvTiS4MhatPOboc7MfkQggCeFNKnpys1t9dJDpCZzVpG15HlGKpjZe7PprDxo/CgfDwQXaj9tWmWXkH3a3efuZiLZ9KYb+zkSXRwx2AvCoXt15JjOW7kxpUSDP3sleCkKUaHP6FvaLWs53HIYEBT9AcvI91QwrWppzsIHUYzJqwl/BUrEj63GqHWl70VoYD9hLyoHl1IRKPnCRlB5pD8zIgennE9aiISpw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dad26bb-ba19-4345-b0d2-08df4b75e136
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 04:29:37.3675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3WAVP8luYU+kDEGjiOKYUUkiaGC+9Ljf1vktcM3KIlBU2rGr0tuJxQOsc/Vlo3wcsRVRCiXkPC9oxc8YMR0F3Eq8N6oyNEXSsaPEW5/tJWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7912
X-OriginatorOrg: intel.com

On 11/25/26 5:44 PM, Peter Zijlstra wrote:
> On Wed, Nov 25, 2026 at 05:12:03PM +0100, Przemek Kitszel wrote:
>> Scope-based resource management helps manage resource lifetimes, but it
>> does not solve rollback of a failed operation. Such rollback is often
>> best handled with multiple goto-based unwind paths.
> 
> Not sure I agree; you can fully convert to cleanup. Sometimes a little
> tedious but often less horrible than you might imagine.
> 
>> The current guidance can be read as discouraging any cleanup helper
>> alongside goto, including guards. Automated reviewers repeatedly flag
>> code that mixes the two, so clarify that the recommendation applies only
>> to __free().
>>
>> Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
>> ---
>> I develop mostly in the subsystem that bans __free(), which is also
>> most low-level of all the helpers - so I get that we could discourage
>> mixing __free() and goto. But for the rest it is counter productive.
>> ---
>>   include/linux/cleanup.h | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
>> index 1e09aead4b08..3b852198e969 100644
>> --- a/include/linux/cleanup.h
>> +++ b/include/linux/cleanup.h
>> @@ -145,12 +145,10 @@
>>    * statement and not group variable definitions at the top of the
>>    * function when __free() is used.
>>    *
>> - * Lastly, given that the benefit of cleanup helpers is removal of
>> - * "goto", and that the "goto" statement can jump between scopes, the
>> - * expectation is that usage of "goto" and cleanup helpers is never
>> - * mixed in the same function. I.e. for a given routine, convert all
>> - * resources that need a "goto" cleanup to scope-based cleanup, or
>> - * convert none of them.
>> + * Lastly, avoid mixing __free() with goto-based resource cleanup in
>> + * the same function. This recommendation applies specifically to
>> + * resources managed with __free(); it does not preclude using
>> + * guard(), scoped_guard(), or ACQUIRE() in a function that uses goto.
>>    */
> 
> This isn't entirely accurate, guard() is likewise tricky.
> 
> Consider:
> 
> void foo()
> {
> 	...
> 
> 	if (!bar())
> 	  goto bar_failed;
> 
> 	guard(spinlock)(&my_lock);
> 
> 	...
> 
> 	return;
> 
> bar_failed:
> 	undo_pre_bar();
> }
> 
> Then undo_pre_bar() is inside guard(); and that is very much not the
> intention. The same will be true with ACQUIRE();

ah, I see :(

would it be fine to relax the doc and stop discouraging against
scoped_guard() and goto in the same function (but keep the "don't jump
into/out of its scope")?

> 
> The whole thing is all about scope. It really is a point to be careful
> about.
> 
> The scoped_guard() is safer, mostly because people typically will not
> goto into one.
> 
> Now, clang will actually warn if you mess up; but GCC will not and will
> happily mis-compile your code for you.
> 
> 
> At all time; be very careful when mixing goto with cleanup. The general
> advice to not mix is safest. That is not to say it can't be done when
> you actually know what you're on about. But clearly the AI bots are
> clueless.

