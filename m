Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795634594;
	b=iBGygywwJEcrChP6fTnBiIDwuFrVqMmoZiFwRWAqqjkENDUH9Kp3jxExZBeR/7+wn2Od
	 G8H0I2/j2UbjqkAa7fCXby1tOZ06kJUWUWEm+grvY8d6OAwBtfFDp7XZbIQ/HIMWWHYSJ
	 BU3lQ5OvNHp16E9qm/J39ADT6N99MJOslD2c3RMYFhzcskk6gcJPrGIgz4zRZs2AZnc1e
	 UvfoQTZgv4UU5Eq3jr/83PVm3SLjhp+DMLCM7e5s2UxQegP2w3bGFgkwCubl2H0aiB++2
	 WXF4H8hZr/SYWjNHArvNLLgjn/Fybc+YJM5OAN9e3ZGX7US9BjwQZjQ82F6QbRIhDcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634594;
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
	bh=9uLfTz51WuBPktFvCMHeGfexgZIYZHEwXTe0EGBsF1g=;
	b=bHgRO1ugwtSlOfErqS9xxN12BjfsVcx4IwnSs9RRaUwUbc9ZlYLlN2eakf87/ZdUjjiS
	 r0ESFtCr1FNAMSuzzeucJgIXajlWl2d7LTfZDSBJ+kqNGiUvAcg+YxUca0T7d3VhBCTuV
	 dZndwAGBA1IjUF6wtH+Q6NrWkSD121GshovATjfCV7OsPa5XkBndyw6QvGI4wwnpPN1EG
	 LAPx/V+covyfzxVTXpE2dVhRYUwwnrGYPZAoNY2VlDkPavjP/vNs3jyFKnOfEvqkV2EfD
	 esf5rApm4mfR4rykVD/nzMZ8CwbbPA+qGmD0y3EhFSrWj3Ynm5J3Fz9luNjrS7ebvrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JcC4YEAO;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=e5uAaflZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9DB606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B9DB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JcC4YEAO;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=e5uAaflZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795634593; x=1827170593;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=t7obzzgfD7SToOIUQtK3jHzVm3rve2/9zWRi/MmZFIM=;
  b=JcC4YEAOAzl0CqPdXPaMktbU6SWM+Xky7y4UkNDxpKViwe5NR9qt8OVr
   ihzs4/nIRjnnQx7jUgMrpwdJAJq7Q4OILPW5Z+C9anHamed8nadx9J0S2
   D4ep2xVjCfck+8/AKLdQKdkBVOYZW+sN1rrAdHKgQGQf7NzSMrhmTY5SV
   cKFh/n37mGDjYB1yD4KwKJCR87IOArNnFcYvqci3jf0R1DMVJsOsRPLZ3
   zEClR3vde0sOPMhe0lGC0qpYJxhBAy5fiK3O6GAFAuhC6ReppRtAwX6oe
   3wEovIUOQMJ5tCv0v8Clid3bronN3BCdBmvCjfWRRhToGZ5nZZ9ARQUUk
   g==;
X-CSE-ConnectionGUID: XYlxjrZ7RWukYoKmCFAJng==
X-CSE-MsgGUID: LIM4nlMUSbG1Fci7MQuRYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4432819"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4432819"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:12:21 -0800
X-CSE-ConnectionGUID: fmvP2xPKQISP2ggpAAhMQA==
X-CSE-MsgGUID: rg6090XSRlO95eQsIUFiww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12061067"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:12:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:12:21 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 11:12:21 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:12:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWPZH5RmgGktYgjvGE9e32uNCMGdne6FfT4jS81rs8NY47edjwyilEcBDRrob//9zRqaYWNbdXRRtdzLeQu/jk2/91MXJdFTAZQbKG4gwkomLFylXrrDBnXS2mU7VlUsKiIY4NEZIH2dbbXLY4Y+caKtjcB3Ovl674CtVHrt3lqCod5vbhdORivLItvaj40naHZ33FoIQxUKoo4D9fB8O65RhBimzkLd6nAWm2C0U9doPbxyltgFyccjBzwpp98BRzdMviSOtb9zUgjSwuYcAm13Ww+15U8+NG18MmT6px/AhJveWtXynGNEzd+AKIgfZXDNQgWbAyyPHJwXYFHmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uLfTz51WuBPktFvCMHeGfexgZIYZHEwXTe0EGBsF1g=;
 b=KeeOxZYsKC0LdNoAPR6K4MbbIdJKCc9qXvb5VhGML9wM1FQxYutJMn3wZmD+ttY67f2q+JqX28x9dsScNEDhRCouFgt27NDBvxoUOpsUHVwL1N9VRTXfRqEAy2eR7Q5n74EXF3bu5uAVln26Yyz9z3Z6X6FVqu+1edJaznoxal6DCD21ijRbLoqICkLIBKvVkfsBnTs5/ZBt9Az/p6yxc8xh6uQlq4jQJTmg6n5u30zbw3oEjfo3okh022vfOSw2Ow0IFpkbdPFT+YZX6uh8IvvPvunIi2LXmJZexJJXhfwvGxi+UhZ9UMyZ0E3WiYKMXiY7W164rvjfmbpfcwxXJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uLfTz51WuBPktFvCMHeGfexgZIYZHEwXTe0EGBsF1g=;
 b=e5uAaflZAuTvq69fIly2KEOlr9wQpf+MFjoMpdsBfy2IdOL00uocPh8kHSSFcfk336lLgpwX7DSX1Cxn+0SlRH/nG+OaR7AFG4JNcpO4cVcYxTwK5yI1NMoj8UqUyBxWxMgvJj0eg2Cr7Nwiylsr0pI+ftWq+WQ+6c+tAaQfNZk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 19:12:19 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%7]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:12:19 +0000
Message-ID: <cdfbf2a5-78fb-4afb-b079-2e5dbfd403c6@intel.com>
Date: Wed, 25 Nov 2026 11:12:17 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/12] fs/resctrl: Do not invoke smp_processor_id() in
 preemptible context
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1793864720.git.yu.c.chen@intel.com>
 <cd73a928b588171354c96b873fa192ee80c60173.1793864720.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <cd73a928b588171354c96b873fa192ee80c60173.1793864720.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::9) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: b3210c75-bbef-4ee4-4317-08df4b28066f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|10067099003|11063799006|4143699003|56012099006|261022105027099003|261026140227099003|261028144727099003|261026121527099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bZ4kGcwPAZn1oL0XcLHyurXlt1m5B6JGO+n6Vaf9FAFx9sPIgpX1U2EuRTXwp4WMGbXXHmEC/dR6MPKifSa6ih00/CXN8ydd0VvW/6ezh5u/es3HtcdlYabvAP8V7aQKS7AuNV2vnflmWOTJrycCDGnffKagCXyU7zXwmeOCki6+HHxegIbZxXbxs2nyREjp64K3W1HHbLWUckmSl1u+rdCyH8ATwKQknqzJacNe57eOH7SHFDBUS2dLfr1dvykTKrNVoqZxWxOj6csO38RtKNZDbcDR4xoae1sODBsc+3lgQs82Ipp6cXBHIarh8/R3W0TkYNJd3wKbFJzpl6LFECpFCA9N2bvppJXYNvSFmxPcJgWReGX0dVf1DluXHM6RtjWhMxLOnPvHS0anlIN/B9LhyQ/aAK6AE1yRB7xkGAH9js03BvfQYCCfzhzzXct/AE9446uQ0uFolioQdRiNSjd2K7VUZX8bvigTd6ueaCPctFuPvrHkd37ZRO0jJhBjeOY7+WCt/FMNt4aZZYrab0fGSRl1GmRDKmqXZwNu3bxX2zDKswQNkmS7ZGnP3Oc2pgLtWv3FohWePyJJrJ49NCVmGxjnarPKH9hXI1Kkb/BooCHK43aSGM+3hRq3skUOimrX/tLsdsa/MQp6BolpIYT2Hi/DbKf+cFdmQifC5+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTArcll5V3dTbGtKY1Z6c3hBUFZXeExJeW15NUtNUXBrSTY2Rkl2aVVKc2hT?=
 =?utf-8?B?SncyQTFpY09Wc0YrOXpBSEZ6NWlpeDZLdFpjbFNneVA2cjdGZmI2a3Q0bjBM?=
 =?utf-8?B?V0F6cUtEWDFWbjRCY251R3c3aTJ4MWdhbExZMWNHTEFUZ2s5Z0ZUU3Q4Y21z?=
 =?utf-8?B?eWVuOUFGQ2VBdFdpdGxWdTB0NUZ5WGpSS096TS9hYzAvVXZEaVlvRWMrWDNI?=
 =?utf-8?B?T1I4QUh6UUVoZUQwdUdzU3BxV1p6VUxuUGdBRGttQ2FGU3VpZVQvcE8yM2Y1?=
 =?utf-8?B?UFBsNXliM0lUZ2FnTjZCdVNKL0NHeURVTnJKUmlaNW8reWd6Z043bVFpVUR1?=
 =?utf-8?B?ZFpmK244TEl3czF0b3JSN0RhbW9SR0haSERMUkg1SjN6L1QwZ3FyS0krYUFj?=
 =?utf-8?B?bHN5b1E4a3FWMlFQalVZWWVIN0NhQmwvSEF5Rm5NQTNtaTFLS1JxYUpSNG1s?=
 =?utf-8?B?cXBScFhBNzFONWgrQ1pYNXB6ZFdPSGc5WW45ZW9YVkFocEUyTGJBR2dNR0VS?=
 =?utf-8?B?L1dzNnQyTE95UFYzNjAvM2I1V3VuTFdNWXQvYVlNaGtsSEF4SlVaWjVPUDRR?=
 =?utf-8?B?bnAxcW9LSW45cm1WcDg1YUZhWnFhbkQ1VGMzOXVwQ1hrQlBMdUpOMzFWd1RZ?=
 =?utf-8?B?eisxb0xUL0d3NHcxMG1aRTVlajVoeE4vRVhYcG5RWERLSW5iMWxSTnY3UG0w?=
 =?utf-8?B?dyt2WDFCelpLUGNGT1g2YjVaeFY3NFhFRTBjVGI3K0VRcUFBVmdodGlldzhu?=
 =?utf-8?B?NnM4THFlaDFOM0lrWm9WcVY5dEpOWXZpaDVyMUNjSzk5eWxFY2lqcmtHZ0dH?=
 =?utf-8?B?YWdwLzlmVGxiSmk0ZWkvdjY0Ynp2ZmJOeE1FUktNbSswQUlNdndIcFZwYnU0?=
 =?utf-8?B?VnpGQTEwMHlJTzhkejcvVDJEblNxUyt2NjJYMkhBaHh1L25aK1Uvd3RDSTA0?=
 =?utf-8?B?L0wxaWxFLy9xWGl6R1pLeit5TFVkSFYzWEpRblFBV053cndtUytYcUlTM0J1?=
 =?utf-8?B?QXFOeDJtTlg5ZlhwYUhoSWN0VWFvTmVUbzB3T3VMZDFKYWxTS0dOeFVnaEpG?=
 =?utf-8?B?cUd2NU1jVFFKZWU5Q01tSDY4Y3FJRnpQZmh5NkFMOWQweTFVRHVBNnJPdmJt?=
 =?utf-8?B?M0RIY2FBVmEyT3A5elQvaThNS1p1YkNXbTVLY1BXSTl0dDV6NHlmK0dINVZ1?=
 =?utf-8?B?K0dqSGYyN3BCZkRURGFpMFFuL2NqNFBnTUJXYlJhZDhCeUx2VmxVdmJxeEl1?=
 =?utf-8?B?T2dtc2tTbU5yZ0k1K2xualNzYmdpemZHVlFxMDh5LzU1czNhc2gyeWhHYVg1?=
 =?utf-8?B?TTdpK091bWk1OU9YbmpCKzI5aFFyckpYZDN6VnlzMmc4ZGQrV0dBaXpZdHFp?=
 =?utf-8?B?OTVHRUpydWxyYUNIQVJ5YXlJODV1QkwyV1V5UzJwSlluNVc0amhOdDRwUkVn?=
 =?utf-8?B?eXJ0cUhCOFJuWGR3dlEvNkhVcUQreWMza1JhL295bmJsSWtuUXpHLytWRWpP?=
 =?utf-8?B?RGx3R0w2ejNaVWI0dDRGcmVMTHJUVjdyR3JMdEUvUmJ6RTdFeUJ5b0hSWUhO?=
 =?utf-8?B?aTRsUGxJSzdJRGc1TVpiR0VQM3hySU4wNTE4QWhRQS96SlNTZTRTUFVVTzhQ?=
 =?utf-8?B?bDlVRnJ6bDBkSENpR1kzb1pESmw0dVE3enJHOVdqR1hReTJnMlpBSWtFV3hY?=
 =?utf-8?B?czlWVWpINEJRUnZGeDlKYW90NXlyU2RlM3RXUG1EdXZxRDdVRHJhT0NsSkVL?=
 =?utf-8?B?YThSTU5XdTR5UHF5eTN2WjRvYUM1VWtKOVdDK3k3NjBsYzlKSmRWK3VMelFy?=
 =?utf-8?B?cGlURGhreERCQkt3WEFkTjcwSG5nRXJKUnNUVEUwNWVWSm8xZWlwaWpob1Zu?=
 =?utf-8?B?U25OZTE4OFUvVGM2cnA2UE9VMW5BUWgxVzFHclJteXVEZE1GVm1sVDEvWlcz?=
 =?utf-8?B?Z0dLcGZmWVFxV0FaVzVLbEh5ckpOdFdGVisrK2d5SDdFMlgvQXQ1Z0tDc0NZ?=
 =?utf-8?B?cFZsVkFKTXpjTHdlUFpWYWNIdjRFV05HSlBDOWordzNpYmVUampWYzR2MGUz?=
 =?utf-8?B?VEdkR3JNZFFpRkJKZEQ0a2tXMSsrQU1sMUoyeTg0MEhUOUh5NHRKM1gvMWpL?=
 =?utf-8?B?SXF0VVNxcUlmaXArY3lMSFZ0enQzbk1FU3BSVm8zVEJzSjZYMlhWMzArRWNC?=
 =?utf-8?B?Z1ZOaFF5a25qRng0cElFMnI1U0pZdDBoZnUxbUhBeUZBdFhaall5UlBtK05t?=
 =?utf-8?B?eGJEZjlzN0swZDkrM1NlYXdvbGNoZGFPNHNOM3BZMnRQRmNnamxVWXV2ZXlq?=
 =?utf-8?B?eFVEc3ZEUTlxc2p3TFkzdnB4UDFGeFJieW9xZFBUb0dBckd5RlA1b1V4aW9s?=
 =?utf-8?Q?XczgWKoezDLAB8dk=3D?=
X-Exchange-RoutingPolicyChecked: JPC3vFUCKyfNVbwQxk98Qhxs6ek99jbmLX8DmDBJsi5gNm0x9J+prdrU1qQJfU3K/qoQWoGEWIG8JnvsvAHWgI3czODE6md32bBQaVxnhM9z9L9R/JSWMKY9f3R9oex8kP5MFG6gC0HlyJF1tYmcDWliliaSvihe7OQYF12VOkuQ3WMkiMeynB2BQQUoxINA6VapzZ1+75rhXsTinpUEVTw0LmoJ/sBd6SLQ5HEXttGHqahS37hQeFC/DLivI83VUQcIqJQlZHjWDnKC4pBW/iVQlGsZbyKeiPJZQ1/WpohO76a22AvmbO0GUvIRdFU5gF9cCOlDMyQj6dBgoFFHLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b3210c75-bbef-4ee4-4317-08df4b28066f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:12:18.9966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7i9oDlAldK9ErDngZvzl31AKoKV+cLUcbeoljAdIQUEpepoVnck6ZVNm4N07BTMA4OJWukOm9G8gott0d4T+JTUDavdq2W7EXdP/ImJcb10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
X-OriginatorOrg: intel.com

Hi Chenyu,

Could you please move this patch to the beginning of the series, right after
"arm,x86,fs/resctrl: Move resctrl_arch_round_mon_val() out of line"? This is
the only patch from #3 to #12 that touches fs/resctrl and does not have any
dependencies on the patches that precede it. Folks only interested in
resctrl fs code can then just stop reviewing at patch #3.

On 11/5/26 2:09 AM, Chen Yu wrote:
> From: Tony Luck <tony.luck@intel.com>
> 
> An event flagged with mon_evt::any_cpu is read directly in preemptible task
> context instead of being dispatched to a CPU of the monitoring domain. Only
> Intel AET events set this flag, so __mon_event_count() rejects an any_cpu L3

How is reader expected to know that an Intel AET event is not an L3 event? How about
something like:

	An event flagged with mon_evt::any_cpu is read directly in preemptible task
	context instead of being dispatched to a CPU of the monitoring domain. Only the
	Intel Application Energy Telemetry (AET) events set this flag, and they all
	belong to the PERF_PKG resource rather than to L3. An any_cpu L3 event is thus
	unexpected, so __mon_event_count() rejects it with WARN_ON_ONCE(). This lets the
	L3 read paths call smp_processor_id() unconditionally to check that the current
	CPU belongs to the domain being read.

> event with WARN_ON_ONCE(). The L3 read paths can therefore call
> smp_processor_id() unconditionally to check that the current CPU belongs to the
> domain being read.
> 
> MMIO-based LLC occupancy counters can be read from any CPU, so the L3 read paths
> have to tolerate an any_cpu event. Move that check into a helper which returns
> early for any_cpu events, avoiding smp_processor_id() in preemptible context.
> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> ---
Reinette

