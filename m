Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795298907;
	b=q4Yk6txA/UvmlW2xFitFAeqjscc20aRcsdOziYZDgZAIW7yX8Q9hbBNbVNToT6ooRkeB
	 yZMfB6yYdjvaME1e20+m+EMJ91WW6PSYdQPuvjWC64N6vuuPOfcuIzLEI42xjexI7mXwQ
	 meX/lBV2Kds2qN2zeIKnpqWJONapB2hM1VVlm8CyuMaPwdYVCi0LLGxel+9V+EfY++pEe
	 mTR+J9kf5/fwWT98+lgPG1hsL2/c0IR6JQSFx9HbA9Kep4EWwdaJl6I0um0JU6FkDAfaC
	 FK0Md6xT+Nsmydyj99gMvL74SJigWX92vewfE4OfqTw4a4dCPMCfJN10F4SREs3mpfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795298907;
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
	bh=LICM05vQd698k2YifkRKp8srJbGkbt5FZ+4s3o+aEx4=;
	b=oP/5mgTj8blHKRb67U2liog0DZqSZBwHE7ujYXlB2lKf454SkeICtziHUgUUk2EG/OpT
	 0RKrwtS8lIbDSWRd/HSCwQ5/HY4FBNOuEC9DFJ80QnVDFu4N3zEk0a9pmVM5uzJJymx8y
	 PVkxVPekpyxy/33gU1eZU16sq/oHvci1AfAD3gJXMqj52gOcILupfzygGR0FOCqzPcPDr
	 cgs9pIpDzyHra3pTlWKzdfMS+3nA9gFNaRoDDAvbOPXUWI8IbDgVw3E8gr+0lV7LlFv/N
	 ozku9RGvyVWbaQ3meXmTvD+3C4rL5ejDinFiuDkjMLI2/uwYUUTMJ2ygBcSABbHPCDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CLgmEhoj;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="Goi/qXkM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9EC606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B9EC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CLgmEhoj;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Goi/qXkM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795298908; x=1826834908;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J6rZNCf3nuCmx2KUoHpLheU65aFKqC9R6L1BUb//8Bc=;
  b=CLgmEhoj/fHgHOLpnr6l0UYdW242+J+qJcl/bXnfGxpOBOAdD0jby36z
   O8TnCckGhUHxVreq83E/ux3zsR6xuADeaLNtM8GsHMnjxXEHIi9uBSUpo
   atFQ/AvMs5oN3Ami/W5KT/b+xYXqA9MZ1ZgL5y8r6GgQIf5+MWoqxnbAX
   ghgfzly7T+zRz3Lry8lmYG6bsiquljTCu2QFzc6l/LHzox9/Uk4g1Qf2B
   hJlVeG1xd7HwgkF0iUCpj7DIwphNFNqRZX03JhhNVK/bxGvmqPs8QSqom
   m7wILhiIIdjVPa6/TPg5cGjmMnBPYhRX8dGGo6hSrpmI6R3Yud3Q2EI2/
   A==;
X-CSE-ConnectionGUID: UyEscZpUQImSggpraRTIRA==
X-CSE-MsgGUID: XYl6skueTQaZycUZTupQRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4143116"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4143116"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 14:08:27 -0800
X-CSE-ConnectionGUID: wN3aEvMuTLmaLbpVlbBoAg==
X-CSE-MsgGUID: elDtHKgvToeiKSFA4gvQYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11237944"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 14:08:26 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 14:08:25 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sat, 21 Nov 2026 14:08:25 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 14:08:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZ8L1wz0VEE4ely2Un97CSA4TSJ7W26P1P5qnT3pWkNnPkxSSH9bL7b8tXf9gwNi0ofp0dTiQjVsnJOB4MIJqY938Nmz8xLDZ2PvTJasrmNoXRFx8cxwZURg5j2AZRuRYgq+AK4T92T9tvizb4VBZ04AR03YDrNMXQH7NkQ5+jo+aUp6wpqmzngEaupwsYsHWMPcWp1kGpJuS7PM/5yyrGz8e8lKYAuZ08mOUIb0ZmTihy61E/H9/yD5viSOK7T/s1j8pcUyIVs0vdhZ80TFg33xJooA70z/kEL7ZRhiquoL93qRyRoWYTbfgbz+v32Wg4vk49QQ7dbv+4ocBvnAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LICM05vQd698k2YifkRKp8srJbGkbt5FZ+4s3o+aEx4=;
 b=OIxDQnmOkxZYRjZvilBDcoNVEabknKmh+U0aReJAPBW9IkU5KRineCrqpiY2vq4H5Fh5tTRB53bvMGjq+6sAeXzLFaTsti0WHvpiPfARtvA/jjUXJCpBfWyY94+/DGX0L7SJXddWVOwUSmap2SsKtST/ha2TkqrjUOmht/vrS+sfFbF/9Es3N3d6w4qLjMMokGLrEgrhYti16/rtfkTgMVwds7Ayfhz1Ui7bmN8B+AxH3aPyQ5njUvomJQKso0hEEqgJPwrKkvC2S68WdqhOXuPJtEMrRJmyZSGflhsayJzllbyEfO0dCPWWZV9RhYvYyks7djFpyLCbeKwjHrERdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LICM05vQd698k2YifkRKp8srJbGkbt5FZ+4s3o+aEx4=;
 b=Goi/qXkM7sqw6pjcxGwaXj102mV5jScJzRI79+6vNVZzzuZrSl3Xsfy1ir4fJDhHDRTz2muqaE+mEMuGeqgR5Y41ZKrdQmX16mkTFn/aYLZ8AKizxYT0I8kFFVJooximBMI/mt4iEQyQsAIUygW8UGcK0R1T5vBK31zo06Xov5Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB819107.namprd11.prod.outlook.com
 (2603:10b6:806:518::11) by PH0PR11MB5805.namprd11.prod.outlook.com
 (2603:10b6:510:14a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sat, 21 Nov
 2026 22:08:23 +0000
Received: from SA3PR11MB819107.namprd11.prod.outlook.com
 ([fe80::e8cf:3b9e:d98:ee2]) by SA3PR11MB819107.namprd11.prod.outlook.com
 ([fe80::e8cf:3b9e:d98:ee2%6]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 22:08:23 +0000
Message-ID: <188d736e-8d8b-449b-8826-d6ff72800379@intel.com>
Date: Sat, 21 Nov 2026 14:08:21 -0800
User-Agent: Mozilla Thunderbird
From: "Chang S. Bae" <chang.seok.bae@intel.com>
Subject: Re: [PATCH] x86/fpu: Put non-enabled dynamic features into init state
 on sigreturn
To: Daniel Wade <danjwade95@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>
CC: "H . Peter Anvin" <hpa@zytor.com>, Andrei Vagin <avagin@google.com>,
	<linux-kernel@vger.kernel.org>
References: <20261117112640.1435-1-danjwade95@gmail.com>
Content-Language: en-US
In-Reply-To: <20261117112640.1435-1-danjwade95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To SA3PR11MB819107.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 9fc31b62-8b8c-4596-1d38-08df481bf58d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261026121527099003|261026140227099003|261022105027099003|261028144727099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CVNONMBhbsp3JDIeLVHgC0yQEK4dh1om+0R94Vyc89nDIprVhtYbj1YIwXtWEKW1XWc4kxGZX0RKLFXtcfeEyj+Q9eWSePB2VeINGNznLHhp8zH+G6YrhyacMlOmos68U7RdCOXrpf5iU6h+d7n4vlESvkXD8PeEUbem1wHItOMlW5XPPrKOtlSQ9eQH5TJj7AHFVIR1dw3vBsWls3g2P6SYs9g2/rp5V4hzeY7ISgxOeeVupbHxxv2Y5Z8fYyhQItuGEqW30wHnrjwbUV23qLe3qDoQf0DyZu8esh9Cg0SMBhouzfTp0SJFRVeoIVCNW8Z/zrVwmJD9cW7areh2vzoSCbmCsIVkK1faxqdwVCuEagKko6G8Cw1Kbjd/UBBfuW2Gyh+/SVrVeHWbJf6lDO8Pc6DY06Q5evxB3es2nFYIsPdKGje2KxI/otdlKtfsjtU9PZWxGW5wq+B9L4/nefXRuBP42rwMxIFDDipYpofeGFDjVbssDPJWeaaWrHzbgpDX9V7LWAj3c177HM9/0qeMmvsvkZkiwi5Cm7ZCTIbCM2S8yfwMUk6/ml5kkD/JRHY25a1CmVUAlINp08dSQXQAYHSi9wJsKFwl4paFenRg0fYTNU2PT89Ebf3ndLPUQd1Hy8qpx8JYLOeF84t79S1A744qoqiAGxrOjx7d+KU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB819107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1p0VTFLNEdTcUk4VUx3Q2E5ZzJHMytiRFF5ZTR6ajlqT25jb0hBb0IveW9q?=
 =?utf-8?B?elk5RmRYWGZmOTFhQ0VQNHpHUnhHUlRmdzQ1THNzRjIrdnBPNXNkNmpQODV5?=
 =?utf-8?B?ZnladnBSdDFLcmtaMDc4SFBCNXJSOG1JSUw5Rm5pdElNNFBLRUQyWHdGcFI5?=
 =?utf-8?B?WkdNTWljOUQ2cUhBSTVSUGZhTEhaa041QUZFRG9Ndnc1L0tFbVI5MUovOFpP?=
 =?utf-8?B?aUZrNHVYelE5eGYxSWtNcjZhQUJmNTN5QXdsZW5PdFV3TEtwWCtOSXhqaDF3?=
 =?utf-8?B?cXNOZTNmeENtZ3kwd3dHUmQvSnZoNk5IempjK0N2b2pSRmFlREd0VVhlWTJU?=
 =?utf-8?B?bGxma0NTMjlEVkluM0ZEbzVDcnlyc2ZJR0N4Rlo2cjlHUlVkQy9Ua1d6U2hF?=
 =?utf-8?B?Q2daUlZWZjRodlBwQ2o2T0FwclpWQUZySHlhMXQvMkhMYWRwZUdCeWZFbjdM?=
 =?utf-8?B?WCtiT3NaTjFGVklUMkdLclpHcnR5d0tHc3prem9CTkZnaE00Nlg5bnJmanlo?=
 =?utf-8?B?NG1Ha1BOYWZacit0ZW9nTkhjSy9PNFlmV3U0NktBeUxzOTBTUzFPdzhTTXdr?=
 =?utf-8?B?cVFYZUNJMTBIZE14UkkxNTNsdlhDWXhRRnVmS2l5S1JhbE9Jd05ZNzNVTjJH?=
 =?utf-8?B?K0l0eHNqMUFLV3hhS0dqUGN6ZThWVEZEUUtwNW9qeUdkaVlSWGlTU1lEZHJ6?=
 =?utf-8?B?UGk1cjVnMnFvWVc0N1JsTjhrUjZuS0pFZ1p3QXovZHlxVUVraUNZazM1WWl2?=
 =?utf-8?B?UFdKbndjMVRHUWR3d2Z5Wi9DWGljcGNJemdvU3lDRkJNRFdXNS9yZUNVbmJQ?=
 =?utf-8?B?Nm9mckpDbStwVWpuZWNYUWxmS0RSWE53cW5SdFYxREV5VnlFWElhQjB0ck9W?=
 =?utf-8?B?TUZodnh2S0hibmhsNUlWMzIyTnI5bHBqNEJtRWp1UVJvL2dXdVRzZWZ1a0lC?=
 =?utf-8?B?M2YwYlFhNzZoNGorcWhsVWEyYWkzRnl0cmlDSDlUOEkvRXllL09MWEx6VzRE?=
 =?utf-8?B?Uk1nWlAvcms3TDVVdWhuTy84UWNPbEJsbEdKYnJYemhuV1NoSVNHOUEwU2Rs?=
 =?utf-8?B?T2ZNRjNIeUpZZWMzRnBFYm9wQ3lhcmU2QS9BMTBFZS9CNlhjM0tRWmlDN0pT?=
 =?utf-8?B?UFdKbG5lRkEzaVZtancyNnlNMXA4QmZMTjlSRGphTG83WXlIUHdQbFBFMVl2?=
 =?utf-8?B?S2hQSFplYjE4Rmh3dFkzTFo2MzBhYitINEppTWZyaCtBZ3VRMTFtRE81Y3Qz?=
 =?utf-8?B?NHQ4aEVLa0FZVjBYS1grdVdzbi83V3h2WVRVMEdhWmtmZkZMMElWa2FkS21X?=
 =?utf-8?B?U0NqYTRxSVlCczdSR05SdWpwR24ySWsxUEZQYllienlKZWo3Q2RlMGx6ellK?=
 =?utf-8?B?andiMDVWVklETEpoa28vZ21lU2tQVG5Va3VIbVY0N3ZWUjZ0OE95NWVmS0Fq?=
 =?utf-8?B?ZTdBeGJGQ1FHaHRkdWtMaHFscFc2SlNXaWRGOCtCT3B1cWZvVzlUWkVqcGwv?=
 =?utf-8?B?L3B2OUx0YlgxdDNiRitsbnJ6bllJby90QmJyenJHMDFSYXZxYTI4OE9sNDA2?=
 =?utf-8?B?MzVDM1doZk1EdFowVitrL2kwVWVZTkMzVlVHb0ZwQ3h4MGVFeUptM04yd21D?=
 =?utf-8?B?VnBTZXVkVGptdkkzOXg1T0loRUZSU0l6a1pvTmkrUytVdUh6V1gzcEdRSjYw?=
 =?utf-8?B?WFN6bDhhNmgyL0Q4aFZlOWNOV1pQdnFFRy9qQWdLMkkraVhPQ0tYVTI0cFhz?=
 =?utf-8?B?dFg2RnhHOTNyc2d4TlhuWnN3QlV1YzNPNVhpeEVPckw4Y2JudWFRV0JTemhW?=
 =?utf-8?B?OHlHSExRL1dRQ2F0c2ZOSnRTRkNESHBJdGUyazJucEdaNFFucEhCMjNHOUcy?=
 =?utf-8?B?eXVYYVN5cWh6SVllM251NlMyOHlPVWo3MFNpenVnaXlGUHNQQ0dQNTFNZVo3?=
 =?utf-8?B?K3VCMGxrZGtzUjhSQ2tpRjNhZThWb1ZEVVRhYzUyNmM3K0RzOWFaTDRhSVo0?=
 =?utf-8?B?dWtHY0JEVVIxWHQrcFZQTm53SGVhYjFxc2hhWktHUUwvSHlXQnQ3eVR4SVlv?=
 =?utf-8?B?ZlpkZ2s4R2RRUnVLODJrd1J6ckQrZ2FyRU9yTTZjRUFhalNHUHk4RHc0U3px?=
 =?utf-8?B?SG1NWUpRUGdQRTcvY3pDZHpiaTJnWG9BQTV3ZkVyYW9wZHZNTzlmYmhsaldY?=
 =?utf-8?B?YjIyYjJ2NG9jZU4wRlVYa0w1YXF2Q0ptQVN6V0VjTkNlbmtYRTRKNEVUSDM5?=
 =?utf-8?B?bEl1ZEhDV1M5QkpKRVBkbksrNXJkRDBVUHNrYWZTenZuazhXa1ZSSmJnYTBT?=
 =?utf-8?B?TDBqZ2lGMzRKdE9YaUZIUG4walllOWlXMHVYWkszS2RVM2ZtVUUrQT09?=
X-Exchange-RoutingPolicyChecked: Zkwl5+0d2XRaYWgmw7Lro5SQW452lh6jQSNdM4hAxgSPMoMeMV4XPqmR5yHwpATeWhfxGkJsz7m0EL0//QaBpc+y1WnxSFafwMtVPcObhSM7Nsr8alD4V3fJQM15JXhtNQAqn2oZIe1PWYnOpClDhstGZDcT7UFN7fzUZAysCT/s+j54xqhew1Iw+ol3rrVTd6dWqJGvSMJIrvGIOKjfJpwB6yc9s1HcQeFL189dIduHW7jHstt9ni4m/WThyr9PXwk//3CCKY9N12C1IDDnzHyVCc1qF/SdzgYff5EG9l0oZChGb8kAPx96dhj88eK++UgWzIyyFHHQh7AngoEn9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc31b62-8b8c-4596-1d38-08df481bf58d
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB819107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 22:08:23.1577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 848DyjqUQuIG7g2DRGGetcgAu+Enuj4Lt6Lj/Ugi3VKIpAl/xTd2JI8Aos+Y5kS5bGc2tEUSSBoKtf3da4MDTDVaqk+i0rFfeGNq+7TJqTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5805
X-OriginatorOrg: intel.com

On 11/17/2026 3:26 AM, Daniel Wade wrote:
> 
> diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
> index 164255d..757a831 100644
> --- a/arch/x86/kernel/fpu/signal.c
> +++ b/arch/x86/kernel/fpu/signal.c
> @@ -267,6 +267,11 @@ static int __restore_fpregs_from_user(void __user *buf, u64 task_xfeatures,
>   		/* Restore enabled features only. */
>   		xrestore_mask &= task_xfeatures;
>   		init_bv = task_xfeatures & ~xrestore_mask;
> +
> +		/* The previous task's state can linger in disabled features. */
> +		if (test_thread_flag(TIF_NEED_FPU_LOAD))
> +			init_bv |= fpu_user_cfg.max_features & ~task_xfeatures;
> +
>   		if (likely(!fx_only))
>   			ret = xrstor_from_user_sigframe(buf, xrestore_mask);
>   		else

Hmm, since this missing ran into the issue, I suppose some fatty comment 
here is needed and also with some clear distinction between two. 
Perhaps, something like:

	/* Restore enabled features only. */
	xrestore_mask &= task_xfeatures;
-	init_bv = task_xfeatures & ~xrestore_mask;
+	/*
+	 * If the FPU registers do not belong to current, they may still
+	 * contain state from a previous task with features beyond
+	 * current's enabled features. Clear up to max_features to
+	 * prevent state leakage.
+	 */
+	if (test_thread_flag(TIF_NEED_FPU_LOAD))
+		init_bv = fpu_user_cfg.max_features & ~xrestore_mask;
+	else
+		init_bv = task_xfeatures & ~xrestore_mask;

Thanks,
Chang
