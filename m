Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641223;
	b=DjJrIgzheTVsgtZNj6sZvrNK1tcuht5/MeXoi4/o0qxM/s9qBry/Ji8IhUcjzu/PtVqd
	 bVIEqiv1eThKuV6u8vgctcfSsexIPXqY2w1kOUDjgTbD7dtnkxGgicmigPkZ0P3CmSXLp
	 Knp11e+sbJEI4XYcmd0nQD7wSM+LV4BJDIDDKTlD6owHgwcW172FTKBDPIMttsnYDvPZi
	 O90MWRrsiVo96Ag/rJ8k8ttEjrJKMEMw0CfNOwcrHXbC9RqRQuDtFmLtINyBkNg54OoFi
	 5noeuE40JU8uBeuu6G6iKUvO1nRhO02Mj272qfPh2UMHnNa1hlKiZN4m0o3Yz71Qyvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641223;
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
	bh=rvcANYdBdXPyNgchA9WKHxuzV8LP2l6SQp9R69xwKOs=;
	b=x6ExSKwL02Hfo4AHXsQEb1DM9ljbYnHHqERlF3Fyw5nhE+r/r0+LkzRQmdTCgXS6EMKY
	 Wb0SmGA5dPP4NhXcVJq4Zh9dCTe3VSMcgMFGmEH3vLuna3a0UmwJLgXzdoXc3sPRlDKOc
	 xybqh8dTbzF0WZgoNWpiE2PNyJb+ezI9zVUNjZg5EpeolSYaTlqNjIEDYBG4zblHpxoQ4
	 eINsDUE6BfJ4v2lYMKGGJnvRRtWnamZoykFRNZFM7cg67ZiwD3WCqcpaHM5NRg9Grl1Gl
	 tD5rQZpe9oRyhqyPTXhXEB7Gyxhto4OFIFUZFxXR5shSB/AiSOsmtRty+b0CFDw383Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QZDWCQkT;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=SeAT5j3n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C38606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C38606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QZDWCQkT;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=SeAT5j3n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795641222; x=1827177222;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=13q2m4VS6gBi68V9dxAPrbmsNBCQphXqng0c9g7TMZE=;
  b=QZDWCQkTQ0k4phbm/KGtM8DT08xx3WxrMqV3dfuTVwFuJH8/Hh7ovqC0
   P1988qXHTAPIcwTSfqmM8RbMdIFBaHK+KxPwW7icKDh5P7MtrOagXStXZ
   320u0XB5Tw0XemQ++P5aghInU77It+dvkIj4NsXgUqS7PI5cQeF524lqU
   juoXSRJeE4hE4KtDh04hzkaCIO1M5kVUsuwSGAQcAjW61K+pZz8IeQcO2
   DeBtSlZOgkOlNM7E5iJNYMPgku1pDzyc+dNBvHBJGibon4snCnmblhwzz
   jt9UDvi85nkS61mUOHRcdK4kAZv4vnAQrTwei6LuZd/Vw55bnPcZoDBGE
   A==;
X-CSE-ConnectionGUID: sXYZEw23S2a2UK8ktmPBLw==
X-CSE-MsgGUID: F4s9XoFLQOugIZeYd39mXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4559332"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4559332"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:20:25 -0800
X-CSE-ConnectionGUID: bMyEii73T6CbUXKjyNWzYQ==
X-CSE-MsgGUID: ktCwM+oGSkShGH/0W6FPOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13614938"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:11:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:11:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 11:11:48 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:11:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLmTjb8jHRAKVEvVfyyyiIZt2bF7wOwQ0WMBUYQloFI3yOeooFxDzE9ASY4qgvmL+cm6i5rSrnXYKzBUz7LxJdJJBXjKLPFTocChUk7mFxjPD1cP1b1tobm37jSKY3qcK9CCTpSeSqAByqEhQZJqFRhpoM2Y8reTFUUk2wRHAE6RqIRFzTxy1l2EyXYU145e1xIx3CN20sdn8r1XNfdz6m/qfnGUPNGJDJezVRAahg0twlnN8GKpZW2oMEm/TzDqDfurRsveTvO4JbKeDicnrCpGA11TbzT4Op14c5tmlBWxa74YVAzXV/GqzYmwAbfDsYETTO+6lUQMR6Jh2fXbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvcANYdBdXPyNgchA9WKHxuzV8LP2l6SQp9R69xwKOs=;
 b=UqVdQ/A6LIlC2cv0E6sDXBtF82907MrwcCqBM4L261FH3EUZjJWbX3y5Cux/J6DclbObQ2b94lq9JJ20N7077EpKp/baS+SFGJLQrwEK/pfRFSr/6JyKUPtvy+42+KFGLAOtqzysDcHB4OwIEqFzSkLMpcENFNKoerOBnAG9wOKOPi19+CUPnV/6wTsoo7z0BLV9aDb5CCSlBAMwxfg+Xriah75fu3s9nucRRKU40JXiZMIT/eHdmISbQaH330TCA8+riJMUAI6HZGYNsgVOXSSyAYmNJe+TBQ3khe+G7cGvcf5e+nneBklK+4CWJ6NrENWeSPJi2klBPMUKY/awlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvcANYdBdXPyNgchA9WKHxuzV8LP2l6SQp9R69xwKOs=;
 b=SeAT5j3n87Y3ALSj2Zcs3pNlCxYR0l4CF/RwcicFY6o9bRGcbcSEtfo3hsgQ9+wWc5dYy7QjWW/8mxFKZZifljiuPQMe6sSg/vhh2mBhKONZjPJhmzH6/ycGKBcYZLoU87d2erKP7Xnk90aBRxPJ5LRfo5CJRbzr/TJCj8Ha/ZY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 19:11:45 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%7]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:11:44 +0000
Message-ID: <df4d3bfa-6f7c-4323-aa9e-dcdacfede17b@intel.com>
Date: Wed, 25 Nov 2026 11:11:41 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/12] x86/resctrl: Refactor the monitor read function
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1793864720.git.yu.c.chen@intel.com>
 <0f9331a421081ebe65996a19e73a8d6811d5c9c6.1793864720.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <0f9331a421081ebe65996a19e73a8d6811d5c9c6.1793864720.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0029.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::34) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 68c9904d-03e2-48d3-b403-08df4b27f1c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|10067099003|11063799006|4143699003|56012099006|261022105027099003|261026140227099003|261028144727099003|261026121527099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yioXXWAqsGw/zYQLfIrxCjCVVIe6/9k/xwJKWGbmQp/YKhsP31EPhf0XvekqrJi3XpffdC4UfQd498edVQlLj4ULk2qKNdUpDdr0O8RIBTS09mNHFWn0RBM5SV+jU0Z5QWYpNBqJ0O83KbcDypl5E3PdR4pA7gzKoNtqUl0JMsii732DGmeIglrJrd38FLJCTgmc9jVDczM0/QpMowTQKH11bWaX8EMdzeuX3cn04M4dfS1OsgGIqsrYjQAMp2sZJT8ayhTacNAzpXVvftOa+rqJUs/xpK8Pr5iCgNB9KIekjHl3vfnIuYgaQFv5sYSykjIMgXqtuNuXy7ZpuY5HcXhPMsp7uW+4yTnaXjvemMUA5+B2IVT2K1hf0DuSHK/2kZKwG3XCnfskms+U6bRGIhllECPLMeEO25dZDoeDPIdgrGmuchpK4+P8DFHKhHDAH91Fd8uuSGw6cyb6gvCY2oIqoFYNOJRaCW0VvSMjKFHIiPS8gHKNdv/zbFGGj0fQvvsSEjoC8j+HgVj53OW8dYb9SLkpiSWk1EKVgywelCtKRoGTXohqZt9UzvvwQ1hsLAxjpWsEbHQ/t6FiLO9mbGn1KS2mwXERuLuVVS1TFVK9j2FKUeoPzaAMih1e7qYlnRY8iWVPvgyaQaaG+DOlOg8NfGXTYsC9dUfJp1/02iU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N000MmtuSExVUUVkU2JyRFYxemJVL1RUdCs2QlZ1RXgwbDRmZnlKenhKZXpF?=
 =?utf-8?B?UmljNGlUR3I3VWlaeFBmSzdBaWVLV1VUL0xudmQzSE1OY1JFZ2Nnb2E3QS8w?=
 =?utf-8?B?R3RzMnNLa0cyQytlQ3lzdnpRTitNL2ZoYzFQY3ZnRyttMGdkaU1qZkgwZXJQ?=
 =?utf-8?B?Y1lyem5VdjVUc09jdk82d1hkK2tWNzVva244TmJSYjZUaW1hb2VNRlRoYzRF?=
 =?utf-8?B?N2R6M2luWmdnalI2RklRL0RBdG90QlNTT1Z3aWV3QXV2dldJS3g5WHo4M3Ey?=
 =?utf-8?B?TS9pTHlIcFhHYlN3THplV2J4TWVxd3o0L0pPZXlPckFONys4WkhvdWdxcVk2?=
 =?utf-8?B?eXlxdmdNS1lzVzA4TVF0bVN2bGZhb25iMjJuOWh1aDZnVEF0cEdiNFpHNU9R?=
 =?utf-8?B?Z1NVdmxWejJSaWhZWlk0THI1UU9veDhnZFhxdndwaWlzQTFwWlZPVGw4Ky9J?=
 =?utf-8?B?d2h0VkV1VE9KbUU4STVmY29acTRRcm1IYXdsRnJQczlWL3NJWnVMSkxVclB0?=
 =?utf-8?B?NzkwT2VNY2w1R0pqdlVLNFByV2xSYlVyQXVtWDBkZkZxRDdGSHFJRjljSXd3?=
 =?utf-8?B?RmpNVDhkNVh5LzdsWmlKZTR2bHR4NCtIaElnRUpWTFVGOHozT3FYY09jMlJV?=
 =?utf-8?B?UFN4Q3p4OHNhZndnK1FwRTRyNzVPRmFqa1JHb1J4UXdpbWNXV0xaVjFyOUVp?=
 =?utf-8?B?VlpYVXhMRTYyWWh2ZzJuZWhPeFlFWGt6bTBWa2l4WnJpQitadHBjcG1rV09o?=
 =?utf-8?B?UlVGcXdUSHJJVy9zdFI4Y2tUOFpYblpwZUcreUhWNW9xckFacmU0RGxaNTNJ?=
 =?utf-8?B?QUN3R0J1ZjVFbWZTSC9qUWx2UWZFNUhLdCs4MDdocEg5bjg5Y3MrYngwU0RR?=
 =?utf-8?B?R1psRDRBMUk2djU2cUN2WjhmTGVxUDNBam9pVFcvZXkvVWw2SlpYOFBtaFJG?=
 =?utf-8?B?dGl6M1poNjZxZGhyMmN6VFJycnpIQ0ZEMzlmTzFZYlBtR0krcGYyMGx4NGQ4?=
 =?utf-8?B?aHlxNmdOVUJzWTJZZy92YVRaQ0JCYWZHWXBGc3lLVzBTT3ZIYXR1WmMrS1pq?=
 =?utf-8?B?ak1mcjZCckhkdmFvcjBaNytCK2FRSUtwcGR3ZEFNNy9RZmNzS285dkhCYnZI?=
 =?utf-8?B?eWlmN1Ayemo1c1RnNGNkSTR4Z21xckxKTUc0ZzNtN3FtYUxzK0NJK2xYTWs0?=
 =?utf-8?B?T3dmYWFLQXdDMzF4K1BzbzVDMzV6eW5OV2VOTGZvSngxdkxERXl2aFZRVElO?=
 =?utf-8?B?TmNNUzNjWGtFU3dzczBFY05GcmlUS0tqR1hyNUF6S0xZa3VwODA3clY1aG1Z?=
 =?utf-8?B?dFZmYUt2MG9idHQvMWNQdGV1VmVQQ0FiV0VvUTE4N3pIWklIcTFTL3R4SHZS?=
 =?utf-8?B?dGJydlB1YXk4REQyTmNjcEVwV0ZXSVYrWUo5NitTT1lLNG5UeWVFYWpUWGNP?=
 =?utf-8?B?RGIvRlVESDJ0aGM4ZE1JVjdhQ0NSWmF0SW96YUVGdUJjRE1LYjU0MVZBa2Nk?=
 =?utf-8?B?b0R3MWNmVjBWbFd5R3Y4eERkWFo5Uitkd1ZUaFJiR21uUWRXbit0MC9kdUZ4?=
 =?utf-8?B?MHpKQVNiVUZhRTRhZlp5VTZBUWQ1cXcyVldCTFBMdWpxZlNvZDZrcFhrWDJw?=
 =?utf-8?B?aytVbFliSTdNT0RvOHE2YW1hSGFJQjhuRmVUTkRhK2pseFo0MmQ1MUU2UWYz?=
 =?utf-8?B?RTBObDJUUUNYd2JUZy81K0UyQkpRM2ZvdkdZNWF0NEFRaWdMNTM2cG9qNlBm?=
 =?utf-8?B?MEZYamIwTWxXS1RUdlVWOWRkZUhxRExCVGJLOXlXNlhDWVhjT0lnOWdraml3?=
 =?utf-8?B?ZmJ2N2NoM2dwVGI0QjJzWEwzSWJVV1ZOcHFycjg1Rjg1WEgwcU1OeWovSW1S?=
 =?utf-8?B?NDkwS2Z3c3JWa1JwdFVuUWRLb1dVY1NYbVpTK2NRRVFUVGhZRktLZUx1bUF0?=
 =?utf-8?B?YmtIZE1sVDBxczFGYzV2U2t0US9Jb1lCamVhRk9zdDA5NkFBdC9qRFhWZUky?=
 =?utf-8?B?VlZWTUg2MU8wWDYwZnBMYVM1Wkw2NjRKekRiMlpLd3VRZkhjYll1eXhMRG8y?=
 =?utf-8?B?Rzd3eEt2VjlsMFhpR0dOVlFGeXJjb2JvcUxIc1hWcUpYdU9lVk1ML3lXQzZ1?=
 =?utf-8?B?WCtmcEhDYk1CYUdkdHQ2Yk5Nb0h2ZDlwQkpTeFByMFZpbnBtc1p2Rkp5V05k?=
 =?utf-8?B?NkNSeTd2ZE43c3RBSEM2TjBRbHk2SWh5b3huMFArWkk5ZXVpd2hKQStPbytW?=
 =?utf-8?B?ZlVVbFczelUxV1pwNlgyUXlPekM3dnVqaC9RN3l4NTFMK0Y1STFFc0k0R0lQ?=
 =?utf-8?B?d1pDU1ZCSFBNZCtqVkRFblY5b3RUSW5QVHVURVJMWGhuYU8rQTJIamFlQlpU?=
 =?utf-8?Q?D3CVBoM5q7hq+Jzw=3D?=
X-Exchange-RoutingPolicyChecked: fVUz99V6+BoqAMmRk+4uwgd6Py8x+i0ObvaRcIe4f/t6k4KW5j7twlVkpsHaAxhoIH9x4lue0+1bPsv4a2R3NCBese9rZlnoSbfwmStv+Hhs16lhRAyOXKdgbSjiRwTDfJtGm48HnNjGLPv6aNK4+svbEGry6mcmJ5fh0LFeD74TjjpMQODtkGk2eiMf1Pvnp6pnaccqXKWqCx4N7StqDIKJfnWnejIVLZwno2BMHB1Vsds89+JE6jI3/jWzBYEIQBPMrEVg6KuGYCXbBA573ciE1iQ0pbZs4b/Pft77CQvi4A64qffFMtdeehOU5CGeXYWFeZuHeaalLewDaBBcjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c9904d-03e2-48d3-b403-08df4b27f1c2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:11:44.3014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFiAiZ111PLfR7/3kfpSLTPfCp9khRDqfFLwBMuMAJJV23ob4ildEx/kB7rbhBP+KOQMW6HRRuFGZLtX0+I2pUd9yVUoSe/cMqYk3CdKtFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
X-OriginatorOrg: intel.com

Hi Chenyu,

Could you please move this patch to be right before #12 "x86/resctrl: Add MMIO-based
LLC occupancy monitoring support", the consumer of the refactor?

On 11/5/26 2:09 AM, Chen Yu wrote:

...

> @@ -279,6 +273,22 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
>  	return ret;
>  }
>  
> +int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
> +			   u32 unused, u32 rmid, enum resctrl_event_id eventid,
> +			   void *arch_priv, u64 *val, void *ignored)
> +{
> +	resctrl_arch_rmid_read_context_check();
> +
> +	switch (r->rid) {
> +	case RDT_RESOURCE_L3:
> +		return arch_l3_read_event(r, hdr, rmid, eventid, val);
> +	case RDT_RESOURCE_PERF_PKG:
> +		return intel_aet_read_event(hdr->id, rmid, arch_priv, val);
> +	default:
> +		return -EINVAL;

An invalid resource is a driver bug and a permanent failure. The return value
here is translated to a text string displayed to user space: -EINVAL is translated
to "Unavailable" while -EIO is translated to "Error". Since this is a permanent
failure, -EIO looks more appropriate. Since it is a driver bug a WARN_ON_ONCE()
also looks appropriate.

This highlights an inconsistency between fs and arch here. The domain_header_is_valid()
check in earlier hunk returns -EINVAL, when it should really be -EIO. Fortunately
the fs __l3_mon_event_count() does the same check and returns -EIO correctly. The
return when domain_header_is_valid() fails could be changed to -EIO as part of this
to make it all consistent but is not required.

> +	}
> +}
> +
>  static int __cntr_id_read(u32 cntr_id, u64 *val)
>  {
>  	struct msr msr_val = {

Reinette
