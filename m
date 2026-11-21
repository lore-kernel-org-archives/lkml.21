Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795298891;
	b=jAYOTn3u9xF3JumoXPV1YkUW+LNcs9TSWX0jUFjFTqZt2/EHsdyLpzPlLvDgty8BU+MD
	 4zs90UErpfkey1r+5qEy2rTvBUXTmD31Dta+4AFXib2IDLxI9Gzu3QqFm3jNTaYKxOPgM
	 S7ULYOIctRbG+Dh+hTPvLIqHvENOS8M6Elsvu+EFdAsDG0VPM9P/HAKEDsZ0q1PjO++dS
	 0ciXeXGdUvz6JfLuc+tZH5r5raZTAJeW7ef1+LQeyf0SfzvfgJJ5u4x1sgnuOorYf1I4J
	 RbwGuoo+T9rHO9nlIiyAk70vLj5c+y/141rAe56Yneoyp6uJ/ojoihZd9FJgGKqRC/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795298891;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 From:Subject:To:CC:References:Content-Language:In-Reply-To:
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
	bh=P0zdop4NEkZKBHsu/7tpGYC77/n3yEzNxHH3YbqBYTA=;
	b=39b3ZAJweUPUJTiqJE5f+PvKXMcwyznKcGFX8UHoHT/HhCH41MaqubVxnHu2V1WL5sXs
	 GeN47aDid8q02zY0Qjj00VNoDOUWqcj+rk10tuKCgJ0ifqnGcY33t2T+T9Iv1DNbOUyYf
	 +VncANv/r+GrAaBGR19O6AsKWH4ftZdZ+T6H8idkEU4P/iu4oANwKwUOk0+aWgMA04+0I
	 E/WN+sxUB48SR9CwgUJPQf0U7R2bEVopKh5cC65qgJ7JUGd42RSvqnRHz4C1gD9H6gQOv
	 18JvwI2aaCXk2fcmXeFL2fMiouYXbHpWHvJaDqntGfeuM1bipWjd8MzIh8OaPqHSkRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="YW/2kSXK";
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BiLB6+Dm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D172F606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D172F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YW/2kSXK;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BiLB6+Dm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795298889; x=1826834889;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OVUvguw3u86I8zTXjBPydrF70uWVbDi0nxwbDiVKfy4=;
  b=YW/2kSXKKJuFMsAMBBc8wsu4J+V8rm42rZYhN6h66vgjt8CZYvlGOREI
   kmtKPvR2WxKKGUIlykl01OkyzPjiUe3wxDH3Bhrfs/yj/0OMtlgCJlnAO
   1+Fif3UOWz7kn6U1iUIS4j0kWuCQsPLD0I/Xj84cJbMdKeP+7Ck1iqvJB
   UudPVZV/iaqW/NNRiIGqse4EyoC7WAYXh22ywDBcTLgnwj4JJxZGJ7IKa
   oJBezohH0oN+WlwKV4zW6rrkj0KHOhTajc6n8474I2qWmfSUqaUQdsXVR
   C4qinucHf7ibmJYmzd2nIsuDOqlnw/B2POkytpmDKF/gN624L6wBfn5Sc
   g==;
X-CSE-ConnectionGUID: T9OlvNCKQU+EWC1AbIy3lA==
X-CSE-MsgGUID: ZklGR6DhR5qMOO2Cwiw8hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4155171"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4155171"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 14:08:09 -0800
X-CSE-ConnectionGUID: o37vFWibQQeFKa1JCw+6NA==
X-CSE-MsgGUID: eOaC81U5QUyeUNBCognWAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11325257"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 14:08:09 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 14:08:08 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sat, 21 Nov 2026 14:08:08 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 14:08:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9pybSw6vBBehXOirOrVMj/d5ojNxpzpwwzeG6SiaQSss0X4b1PrniXehkmkoRKSe3L/qL+a0qVUhGeG3JcebDht7HouNAIa7IgSmGxtswVh2J9CaocEUgbMCrRbcviiryUrAl2dsGVeYAqZNT0ZrOdVKPqN/EfJA8uSRFycORjVqZfSMqdS1rkuGyHSafttVbA/wzse1anjbZSdUTSw47Jz/GsN3toqRVaGzy4noaFry1Jy2tcUGUEXKchXgfzV6utX92WyiCzTJJdRKXyVcq8Sryr/G4XYTNSzT7dzD1HdxvFSztp5PUFiiU++4DI8O00/yu4WChM3A8uJfkQv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0zdop4NEkZKBHsu/7tpGYC77/n3yEzNxHH3YbqBYTA=;
 b=hxdx4lGVYXdV7W35Hvgr80jAw0JGl3P2xhrivf/omJgUKivxd95Ykx7EH2yhi50+mCMLD1vs5URYcszlgYFX5bqPcmJoZuzK0O2KvS5gMkAFMrLS9I9/Yb/Ja742OyEZBiYuW/bj3Bv23ZHSw7Y0KdUyPQX1Y1ywqdMdq9fbJZBgzb8GA21OmroRoWLQ6B0flIy8gIoVuMsQTzvjBST8Q3ebWL55bfabGyHK+frankQKHB3T+npRH9lJ4WlggDRyr8hHXPImqNcFFAIhftPB1MvNEEPR/WvPsuvU7j4f1mqltKF+elPQ3D/QiT0BLVMNMhZNA0dhEZzeByOFtTPUJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0zdop4NEkZKBHsu/7tpGYC77/n3yEzNxHH3YbqBYTA=;
 b=BiLB6+DmIkRV+YXLJUA3u/yiEyfyBweXPPwFlCgO08GLPHp5D6pCeZePZ4dTyY8Ej2OZuoU3AYxEB1tOJzZd4ewBMykM/pdwVlB9wXqSZqKqFQtXKcye8hEa8OIX2olspwHr1jIHkyEeiMYnCgZx4yj45olFi7EtLPm3KhLYnX8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB819107.namprd11.prod.outlook.com
 (2603:10b6:806:518::11) by PH0PR11MB5805.namprd11.prod.outlook.com
 (2603:10b6:510:14a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sat, 21 Nov
 2026 22:08:05 +0000
Received: from SA3PR11MB819107.namprd11.prod.outlook.com
 ([fe80::e8cf:3b9e:d98:ee2]) by SA3PR11MB819107.namprd11.prod.outlook.com
 ([fe80::e8cf:3b9e:d98:ee2%6]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 22:08:05 +0000
Message-ID: <aae55e1a-3b4f-47ef-8a97-3eb3a470bf86@intel.com>
Date: Sat, 21 Nov 2026 14:08:03 -0800
User-Agent: Mozilla Thunderbird
From: "Chang S. Bae" <chang.seok.bae@intel.com>
Subject: Re: [PATCH] x86/fpu: Put non-enabled dynamic features into init state
 on sigreturn
To: Andrei Vagin <avagin@google.com>
CC: Daniel Wade <danjwade95@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H . Peter Anvin"
	<hpa@zytor.com>, <linux-kernel@vger.kernel.org>
References: <20261117112640.1435-1-danjwade95@gmail.com>
 <a0c51547-a354-4dbb-9194-0b359ea604cf@intel.com>
 <av5TI7uMazFmWYid@google.com>
Content-Language: en-US
In-Reply-To: <av5TI7uMazFmWYid@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::17) To SA3PR11MB819107.namprd11.prod.outlook.com
 (2603:10b6:806:518::11)
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
X-MS-TrafficTypeDiagnostic: SA3PR11MB819107:EE_|PH0PR11MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f55ce3-cf83-4726-d56a-08df481beaea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261026121527099003|261026140227099003|261022113327099003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|5023799004|4143699003|56012099006|10067099003|261009220027099003|261009221227099003|261009221727099003|261009223027099003|261009223327099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: A2H4gAApl4sdLLtVpunp3Zk1aUPkr3LCGqYpAKk2rVSDj1yZuNpQvNcLKkGHKhR8LRpN9sI5d+vLYp9Y04kvNlvhw5zB9i7QM8Dy0PSc2/BjgLjSOfHwHvKggQ66q+N0xCHZA4Z3vQN3sOhkntKTU2nKIFWP+xVUPyiY7dEI5jNKiu+OGuxVoIqGSLN2NBtg6alN9tTvfKEd53sBTcSGVEMo2YX9ZG9dtg7LKjA1gsFXSdnfMkthgnD6JjbZVziIK0x6DLwNCpOzOqnL6rVVHlJQGvePABfKTJOontIeRn0q27iRpZ2dqdGaRhzUcJVfiPh0j+v0ZzFNtZXVVuSkI0ax6ekUJiV0aD1Q4mBPTWWLj98ydgs53XcOC7jvNYmS5sahB3+EQ9OrLQddUFSDmHVk4wh6FpnURw4/UtraZoPUzP5HmautTfGroykQHnDl/bMFuGf0ZOGCVHWgbyhbF4fLSyMXxyMS+rNHf17KLevwR/9LXpR27BsZ4q3OPOVMY46FIVJbOJkjmskb+JXg6SoaSZhJe0PWLORyAf6xcaSrn/0G3VnGUSjew1wX2v7INwUln6Hzvs+mffd1QODkC63+jFk5P2GKAC/G39Zc2kB5sb1rFXMlp7CGTydoXWt4+ZAqtPXX2qeLmw4UL/L7HZcR66gniZ9VcJSERv0waNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB819107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261026140227099003)(261022113327099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(5023799004)(4143699003)(56012099006)(10067099003)(261009220027099003)(261009221227099003)(261009221727099003)(261009223027099003)(261009223327099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEtEdFhOMkNFbjBNTXFYV3pOODJGak90NkF3MlBFTHNxeWNBUmZxdGJlT1c3?=
 =?utf-8?B?VlVpZEZYQ2VSNkJnUytVQXplNk9WRWExNm1SZVIzSVVGMkRSR1hMRWtPdVIw?=
 =?utf-8?B?ZEZQOEwrMEVaa0ZxKzJ0NnZxTnBRcm03ajduNmZsNVJtcHhKTXE4eUpjRUxj?=
 =?utf-8?B?c3J1QmpqRCt5LzE3OXVLMVZqZElqenpsNitHaEdaZjJOSnpJUlhLWHlDZkY3?=
 =?utf-8?B?TUlEL3JBV3VUcjhtVkVMUWJMczFUSlRrNGU2Z2MvWTFZWVE5cXFOaGlrZWpm?=
 =?utf-8?B?NytRSnRva0dLWHhHUVJOQXJUS3VTbEd4SlZQbkUyaUpQcUdrU2EweWJGWVFC?=
 =?utf-8?B?dFdFNmNTVkU4cDhhT3FHeGlDZFJLb0JxQWJNeXMvZUVqRlpZVUVIVzFSL2Fy?=
 =?utf-8?B?ejY3cXpadklZQXM1Y2VyakZxcEtsM2F6YW9KTUtnQXJMeG93MzFWMXpkVUxy?=
 =?utf-8?B?UlBsclZZeFN2a0ZLckpkdlZWRUd5QnRGY1E5dHBrYTc3b2VSeTZpM0RBbDhn?=
 =?utf-8?B?MVNEckhGMHpibFJJMVRWOXRGMEZTcHdlcDEyZDE4MU54WWdwVEtYM2RXb2pD?=
 =?utf-8?B?NW9ncElweGE4Myt2aHdJcnlkOW05RG9nVzVZL3ZMS1JPdVJzUEorZTZKS25J?=
 =?utf-8?B?MkRkWjJXaktiUVBtbmpxYkYvdmN2UUgzQ0hUTFFoTkNsRVdaUkFDdXhrdWt5?=
 =?utf-8?B?dk5MQlJIeEFETXlENmZadDFqUU5qRFFKeXduOWJLZXR1VlhLcjdEVVRtNlB5?=
 =?utf-8?B?Mzh5OFFoRHF4VVMvQkJGdTFkUC9nWTRKQkVicVh3T084R2VKallaOGFZek9p?=
 =?utf-8?B?SXZWcVNnczNWVUpkYlBVQ3lCM28xRFBZUE5mS1hvMGFyQXhYUCtSMW5MdkIx?=
 =?utf-8?B?UmxCTzNCdEtadkN1VTQxZm5BS2lUdVZrNVF5TXJuZ1VNYldRRS9zSEQ5MUdD?=
 =?utf-8?B?K1FWQTF0a3ZQeEV6RzVPT1o5WS9TTHozRjBFdnpZTDY5dENlYlR0Q25jaWlN?=
 =?utf-8?B?N1VWOWJlWnFiZVd6OGViK3F4VS90eG05M3FJcUg0dHVLdTdNL1gzYjZjYVFx?=
 =?utf-8?B?bmpHSVA4U0F3c0tWN1dXZDFtd1hjQkFpY1ZuaG9CRVJHZGptR1UzWklOaGNa?=
 =?utf-8?B?QS9HWER3bDNyQXRheUhKb21mMmRURktRdnpUOFBjNzA0RDFEdkYreTdjT0ww?=
 =?utf-8?B?TVBTYitqd2Jpdk5GbFU3d1JZb1JzTUVva05yY2tBQ0E4amxNQkZ3WkRXR3J2?=
 =?utf-8?B?c3g5N0ZRMTVMUmFvRGZ5akxrYnBhMi8yMlF0NzRIS2N3bEgybEVKTXJWM0Fa?=
 =?utf-8?B?STA1bmRoWXNpRlR1Mk9oaHJxQ3J0a0h6Wk1GR0FOSzg1bkROUS9XTTF3VFdk?=
 =?utf-8?B?MFN2UGpWaEJITGd6eVQwazJ6TWptbHk0aW9oNkhZa21teUgyT1RNbTNoL3BV?=
 =?utf-8?B?eFhwYk4zSmYrSDV1bUFrU0RUd0VOTHZHVThEY05nSjJ5ZzBEWHdzMlRUUHp3?=
 =?utf-8?B?c3h5VTRidVpyN3poWXRveXNjZmRVT2NZclBYZlpuZkFOM3V5dGlTeFk3K0dn?=
 =?utf-8?B?ZGlEWWFFM2Vlam4zOW0yRWsrWlNacUpZWUU0Zy85ZWN2MU14aXUwQmtXTXVy?=
 =?utf-8?B?MDBkSXBZMTlVbzFxd0tKNjY4SGdUcEFSdlVDT2dwRDB2ZXh6bUhieEc5TmtN?=
 =?utf-8?B?bjlBTFEyM1lxclUxS3RQUEZGYUlNaUVJOVphelpuNXkyV25CZGE1TEJzcVZK?=
 =?utf-8?B?T0tleHhsYUl3VjZhcWtYeG83K3ViMW5zSWZnQTNJcDNBMGNYR09CWG5DSVR1?=
 =?utf-8?B?TnRvU2ZneW1wV1REbEJaUkkzSWZJL3NzbU16VnZTODBsYzJnby8zRjJ1bkNF?=
 =?utf-8?B?d2lZZ3JQcUNqdXRTRVEwUjRmSmZDNEtyS0ZXeC90ajcxSk1sSFhLQWVQeTN0?=
 =?utf-8?B?S2F6UTRydHY1M09HWW1OYkUvYzdsdkFFK0NtZEJzQnpOSjhGL0tKN2VaM0l4?=
 =?utf-8?B?VTdORlJrR0FES1BETllNaVZ5ZlJsTGs4c3Q0MnR0d0w4N3BwdXRXT1EzMzV4?=
 =?utf-8?B?c2krRW5vbDJaUnU2eGRqOWFYdmRZNlE0TnZpTGtOMGlnWFFMQVFIdStwaldY?=
 =?utf-8?B?UzAzYkdYaERVOFVnUUsySDlMeEEyVHZQRFhvUzlMenZJYXFYZWFzejdIT2Fh?=
 =?utf-8?B?eHB6ZmFBaUFBenRpR1lDbDQ5STRkVzZsdUd4Z1VyaG41WVR3M1N2SWtOYkhm?=
 =?utf-8?B?bVNmU2tmMHpIbDZHaDZ4eG92ZDhIakhLN2NKeHlqUVIzbzBlK2RKWndoaXhV?=
 =?utf-8?B?VURRT25qQVRyazB5UXhnQnB5MWFTYlJuZUtZMjRtdkJjUTh2ekh2Zz09?=
X-Exchange-RoutingPolicyChecked: ZcQanAaP0JDvKkRG7YYT/7CAE+P7bn2UKvCCRTkyjx3rgzhGbyDuG/JwqqUzXRbMNvdNT3CtKLTNVnlcKPjW1rCfvOxhO05TAVGybDH+1jdCzPn63/BDfOkd1xawN6pmw1rRwZHC1EWssoES/kjM9CfjAxuVRW4zIMe9Rij3npIZsiKM5FB8YSBwPHZLqYxWCu5sZtNwAgdBOA2QPUOBTvuMTMff8fw9h319PKzo9jLxabyyedl3ATCwPxw7oaOMaNAhmjB+LkozygYPPzY/Hy+oNLu/qwKo5cUe4t3LDiabm8JWBGkWwT0PrlXtSVVEAZXGW8JVvBaunBZy8ZZ1PQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f55ce3-cf83-4726-d56a-08df481beaea
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB819107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 22:08:05.3781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsXpXlrRpIyhh/xAlNoqWBfVtP/iILoOqXGbYCmMXMdLPufqEfAKG13XubYUA72SKVy7XM+SBaBGfpGWeQQUdKngZkJE7yHuwELunIG4pJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5805
X-OriginatorOrg: intel.com

On 11/18/2026 5:38 PM, Andrei Vagin wrote:
>>
>> How could that happen?
> 
> The code relies on this: while a task owns the FPU registers, a dynamic
> feature it has not enabled is in its init state.
> restore_fpregs_from_fpstate() maintains that by restoring with
> fpu_kernel_cfg.max_features (the comment there describes exactly this
> case), and fpu__clear_user_states() does the same on signal delivery.
> 
> The 64-bit sigreturn path doesn't. restore_fpregs_from_user() restores
> from the user buffer with RFBM and init_bv both limited to
> fpstate->user_xfeatures, then calls fpregs_mark_activate(). That clears
> TIF_NEED_FPU_LOAD, so the full restore on exit to user, which would have
> put XTILE_DATA into init state, never runs.
> 
> If the registers still belonged to current, that's fine. But the task
> can lose them inside rt_sigreturn: the first XRSTOR from the frame
> faults and fault_in_readable() sleeps, or the task is simply preempted.
> Switching out only saves the registers. It doesn't clear them, so the
> next AMX user leaves its tiles there:
> 
>    CPU0
>    A: rt_sigreturn()            A has AMX permission, XTILE_DATA not enabled
>         sleeps / preempted      A's state saved, TIF_NEED_FPU_LOAD set
>    B: runs, uses AMX            B's tiles are now in the registers
>    A: back in rt_sigreturn()
>         restore_fpregs_from_user()
>           xfd_update_state()    XFD[18] set: B's tiles hidden, not cleared
>           XRSTOR(frame, RFBM)   bit 18 not in RFBM or init_bv: untouched
>           fpregs_mark_activate()
>    A: exit to user              no reload, B's tiles still in the registers
> 

Thanks! Much better description to me.

> Here is the selftest to rerpoduce the issue:

Yes, this is good. Maybe better to trim a bit if considering to the 
mainline.

Thanks,
Chang
