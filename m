Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795115589;
	b=2hU0RcN61wQ+MAJKOKdUTZ34QIqaAfn60NYD1B0HgH36VM/io2ZqBviy+M4h/7IQQqKr
	 1H6BPrtCW705IgBRU3YelBGIuU85d+Sr6K94ankQ8X+UVEEcr3qiTNW0z8xCmWlg4BMvA
	 2VweH+H3YANiMM0R5HDuFPkrVe5GrnzLe+scxyOQVLh1nnAiF8/hQbTLZQ9rupl2q6aZC
	 Jc5vT+xd/xkXGIjtJ/T57SbGX7ds3NnKYPSnWoqT+cR5TUzqnfXgPmbhSIm30JOh9T5bI
	 15rQLvmWSMn+kkguRvBcJ5IKoJkt+z9tAqGTbS5N0tILAMyTFkVFud83onxeSp38a2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115589;
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
	bh=U/eFDAoftdR+47j5TDKKYQSpm6hFaxBpiClQoZM8PiM=;
	b=cfumXkN4QLqH0r2h7Ot9cxx/PS6TQJmpldX7UaCAzdPzx9l3A5p8b7R8uUsm18fE0WKM
	 EdtMwtafxA/kxQZWy+ifaeML2nB0SzrYMPz9nca2MkZ2PYntUyeZ62BoeMUXiQqd79g4w
	 RWLyHp8RXBnVylZo1GWL9aDv31O+qCPqauCC6xDKdyJh9uMbyZLjK4zP2ayFNyZz9kNbX
	 zDyWzGNCgKCQMdrAghkiMxXwivZE1LH6IQyNwVTh9cu22qBy4u0O4W4LehVRmYeIcLuki
	 vOWdnbyTzSTkmG6Y698z7zL92de3Gp96hbfvJUabJW60Tn10ZsbZr6OJE0PT0EAD7GA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dp8yCTyb;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=lEwF94gt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2038606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2038606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dp8yCTyb;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=lEwF94gt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795115589; x=1826651589;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tGTwHNb4SFZecux+zhZRIBv/eizdgIzMnFHYlKu2qXM=;
  b=Dp8yCTyb4E0hpiXl8eaQapdDilAgOayBV5AQP/dpjE+j5UpTJUeUWoNC
   rSBgZN0WwEPgh+0CozKuE0DQali7sfrfNKe2sYS/1Z5ePvG4+VV6CHc6A
   CY1MZ8W5DAShirCvk5GC0NCziPJVzgrE0l7n2A9pjAFZxf4FKp8WMQp5D
   jOUk+2MCMSb3Bi3/gpMwSOf4eGpo9/xzq9eHja3RJ2xcgFd1C4eKz6ATl
   HwSoJQjagcvNS+ScqhHAcjDHGH/0Ih+XZIfCWNWPZj3BTFmT9ZDC+DcHp
   kMnFqnlOfi9NPoUP8u/SGF00n0x1IkOVDpNgIWoHEp/rRubKFWH8fJVG3
   g==;
X-CSE-ConnectionGUID: sO9WXojySVmh4tUq1WYMDg==
X-CSE-MsgGUID: l41w+G5rRfa0RdO3bfhxpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4028062"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4028062"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 11:13:08 -0800
X-CSE-ConnectionGUID: osQ1WXcMQiqJGA+RgTQKNQ==
X-CSE-MsgGUID: jJ4TzfyBRcOBEMHnDLiplw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10409057"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 11:13:09 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 11:13:07 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 11:13:07 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 11:13:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1blkV6r0eQfzbWmT6fwqiJziig5WAaruFt/CaWGuMUs/XLpgoKGw+8eod+iko0Hj9/N9WVDCr7jRbwEY9hYnAFyywtAJl5EmO54G2yooGKfEG+pujBdiIN++UcEcOuRWNFYpZA6xfc/pV44Pm+HTh9NDQF4pYxsKQmr1hy7EZe+73MK3wwaYn7N1Q36A7DMEplQXi4xlTM5Eh6xb/VanxeDmz/mEd+fiR7h3pvPXPTg1Ap94A1vn3DU0kxsVl0CLQj9u90eRxr30K7MvKXm54pFC4RywcTzaJzd412zujXHZSd1FShAEfOcjwavSrABHCAMpCJfuG0UgpE7lv+jsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/eFDAoftdR+47j5TDKKYQSpm6hFaxBpiClQoZM8PiM=;
 b=w/aQXks+xFu2Wp1titn1rw+3b9LZtM+b+u5qla/3Sadz7yM5JKJ5ci5BxHWxsnSqh0sOb6/9NuquYkKicOm0Cu+kg74yDBGY9GBBSNSYZlcRu/+vmOFZqScFG6FiyaGnW3fOK7co44rup6G3Oi1LGWqBr2NyPyNHVIvs0rVsNvnLK+E/eBSqGOz9G8mFJxgNWmy/NPxGUF+SazUBxNyJUcH6S1br1hd+oCm5aOE0o3kZ08Lc1H8y8xauxdSjjrbTgyh6S4XhKROGPgyHGF7V8tv2svr7SDvTLxDRxdH0qgv97LivtrpcBV+ZKTVSz991Z846iR2y062dojGbAzBfXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/eFDAoftdR+47j5TDKKYQSpm6hFaxBpiClQoZM8PiM=;
 b=lEwF94gtt8rWwaJ6TMCZGBh4yRLyAChte5b5m1xYqfWSNCCFgS2eufFtC2PO7bM8MDgRRpEt5rs8xzTfauaU/ZomIhbLk1THaeVe3is05WCWTkvd+odCWc9iBeBS7S/stph/6q+OnDbkgYeBMphZ5dqVm7dVkW1Ps6OnJf1uxv0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB819107.namprd11.prod.outlook.com
 (2603:10b6:806:518::11) by SA1PR11MB8543.namprd11.prod.outlook.com
 (2603:10b6:806:3ac::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 19 Nov
 2026 19:13:00 +0000
Received: from SA3PR11MB819107.namprd11.prod.outlook.com
 ([fe80::e8cf:3b9e:d98:ee2]) by SA3PR11MB819107.namprd11.prod.outlook.com
 ([fe80::e8cf:3b9e:d98:ee2%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 19:13:00 +0000
Message-ID: <194e8d57-dde8-4944-b933-a76a338cf6a3@intel.com>
Date: Thu, 19 Nov 2026 11:12:58 -0800
User-Agent: Mozilla Thunderbird
From: "Chang S. Bae" <chang.seok.bae@intel.com>
Subject: Re: [PATCH v4 2/9] stop_machine: Add NMI-based execution path
To: Peter Zijlstra <peterz@infradead.org>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<david.kaplan@amd.com>
References: <20261104182322.578066-1-chang.seok.bae@intel.com>
 <20261104182322.578066-3-chang.seok.bae@intel.com>
 <20261119130254.GS2668200@noisy.programming.kicks-ass.net>
Content-Language: en-US
In-Reply-To: <20261119130254.GS2668200@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0135.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::20) To SA3PR11MB819107.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SA3PR11MB819107:EE_|SA1PR11MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a549158-0626-4d62-4f97-08df467120c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|261026121527099003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3FgU5gSCkLZ0vSsq4VQdOtpUFDHVqI/pmMpF+UL8x/jnlkj+Av0UCiCnfbnQ8YczfhmfzaMNTbp4XQyuJhGlKuC1JDehNBSs4L19vuL/PvPuRRkrTn7zXmWKQ4RMODuYAxfu0Fd09HGGebzOvT3PYui224vj9yhsxnOZ4cY2KM9+H3583vjC0wUQBwivANq1WTpEDKBTUgsof19ZWgc89lV6J7zIKdvndqCsU69gDrtN7snokQgoS5MFkZr0M/ewYI0f36xOqTGgCqr0F5ava2fbm/kcJvYHxLxYlzRdpqTLlBo2TO9zJZIlx7TDtgo5uhPQ2wG+vhvkapcdaPEzso/tV9IAaS1BQRVTnpnzl/UNa/8JkQc0VdazIYCsMzwOxTH+d4j90bUlunhPZ9jMNGHj+LSkUFPUmJbB7GDQ3i2a7Z6oO4+PrmDCSTUwSQLf0NYUpSInhE6ACxEZe/bnHKttwihKaJAKCAptOm1MEOf5sDPHspb8bZ6ewcjFHUtz5qmv86v6RAuJN3+tAvgVN7ZuTLPmKgBZVtQzLi1fRqpM6GjNvfk7PHnryTOcs8eNwuWqVoPcFf0KewiEnn0HurWJK9AZRGrH6RYbpKGMu2/B0LjITOWKnhscV972vmUx5qR1v2dSkAAgCAGYpci699eceIsvsMraY2MOt9WQ/xU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB819107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(261026121527099003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHprMmFRYVR0Q0wzVTducjJWcUlOa3ZTSEtGdzVIRmF1UWt3QU1iWE5mY1g2?=
 =?utf-8?B?bmx3NnRvUkp5VklUUmxIcWVIYzRIR2twVUwvS3JYdVZNd1IvSjBqeGF4NnlQ?=
 =?utf-8?B?SnNjcUs5UlNzMDdILzA1SFROVjdEM0xJd3J2eG5ramhBZWZ1UE40bmVQc1U5?=
 =?utf-8?B?Nzc2ME44WEJzeDFjU2ptUytRMlV1V2MxOXVpcG9VMjN3L2Ezd08zS2FWNy9H?=
 =?utf-8?B?OW5oUzF3M01zRUZBemRzT08wYVFqdU9YTU93Z3VTWVpZYTFrK3VMbmJWc1Vr?=
 =?utf-8?B?d3ZNWjRJMTlEUEJSUFgvMW9aaS9DeXNEU1N2MGN5T1pKNEtUZ3hUVGNaVTFq?=
 =?utf-8?B?RHRtZEZoK2Nqb0JGVkhlTklPOHJ3cGhyUjhLYW5UMXVWSDhXZ3Zrc0VSZkZn?=
 =?utf-8?B?Mko0cGNMVVljamdLTVBMQjQrcTdXTHlVS3F0Rjl0SW5qZC9ZZkR6b2ZSTGY0?=
 =?utf-8?B?UXQ0NFBzREpBWG0yL3MxQzBLNFcreWtFRGFhOWRNTUNBK2cwMlE3eEJFbkpB?=
 =?utf-8?B?b3grbENGN29TZ25tNlBCMU40c2phMU1QR1d5azJUMUYwM3ZJWFI3MU9IOHlr?=
 =?utf-8?B?RitaSlloWDMwZ0NFdnJyRWgzaFJpbFdBT3ZoWXczWGZCUytEYTNqZG5VZHV1?=
 =?utf-8?B?Q0RaemxxeWFsSEpkWVJWK21yc2VGajkwV000dlZnOExLc2owbkk4SGtaNk5D?=
 =?utf-8?B?S2tHRWY0RXIzZzRGYzY2cGVSNDZNNnQ5Rk1qSCtTTzNoZWxpQ0lTQ2wycWo3?=
 =?utf-8?B?OGoyVHhkSENad2cxTmVDMUp3QUt0a3pwVnFXNGEzSHErK21sdHo0b0RiOEdN?=
 =?utf-8?B?VTRLMVlUdE03UEdoSkJBRFltdndFN241U1hWUGV5a20reW1BTnl2NkpXVElW?=
 =?utf-8?B?SllJVDdyMEcwMW5RZFg3ZFhWRTdTY0p1R0d6cDNIWDRMRXY2N2VhckkvdUNQ?=
 =?utf-8?B?ZXpDa3RuNDY4dkVJTExacXFPRHRWc3MrUklsS0lMSWxGT2p6c0NRSEFaSENm?=
 =?utf-8?B?cC9QNkFSWmRMa0hjMkl5TkVjWEtFRWpjUjI1SmdxaXJWakZWamtCZUNvY0Qw?=
 =?utf-8?B?Wit6R1hIOTQ2WU40SmFVR1hKeUZSN0IzdmJOalVLVFZkYXlDdkRVM05BOHA1?=
 =?utf-8?B?ZEU3TzFYT3VXaWZOL21EVG0rVm4wUE5GVUV4aDJ5b3BDZGxqZU9qWDZVcThW?=
 =?utf-8?B?UEVYQ0lpNVdsZzEvRlROS3hVSitKQy83R05zS0h2TEl4MXl3V3Bta0JzL0xV?=
 =?utf-8?B?d2lmRGpJRDRnVGFvRkF1aCtqaThHc2EzR3VZeVRTeW1nM29vbTdCQXpnVEgv?=
 =?utf-8?B?V21INU5LNm1EWTZ6NWFDRkQwVGNBbm1qVlY1dkN3eWFaZTZUdWVNNFhiTHVN?=
 =?utf-8?B?bzlzeGg5a095di9JQjZJK1hMM1hya2UrK1BXL0cwcWxaOUl2OTFNWE92UnZ2?=
 =?utf-8?B?TXcwNUxvRVZOc2lwT0V2bEV1RlpZaHg5OEpXZG5ScUxrVXNPRU1lM1lFRzRx?=
 =?utf-8?B?NFZnZkxIdEgwR1BmNXdVWllBY3VjaXpLdXh2a3RMRHhvcEZFZlE4MWRLemww?=
 =?utf-8?B?NSsyUlQ4VUp0aTJ6S0dzeVE5Zlc0MlFVR2l4QUViNHpwQWlFeTNaVWxuY1hm?=
 =?utf-8?B?OFNiUitUMVVPTU9Ia1h5c2FlWW1OZXprOGpBQWRwb3d4YU9GejRBdXVqd1Fr?=
 =?utf-8?B?MVNVRTBSZ1BTREd3Q0x0MWlIQ2hVd2J2bWVjYTNObFhuY0kwR1B3YXowelQw?=
 =?utf-8?B?VnVjcGFYOEM2UDdYbTg1ZGo2OTdrc1Zvd0dUYVNmQ3ZPNDRLeHR6b1ZrbG1v?=
 =?utf-8?B?NnFJV1RtMkc2QW5xaVpib3hrYXFkZ2RvTjN5RXdiVER4eVdZMGprb0Z4ZGpi?=
 =?utf-8?B?N0VWK2wxM1J6NlZISFlKTnE2V1F2S2NacDlvYnFEaHpiaDNYdTQ5NUs4WVNO?=
 =?utf-8?B?bnB6OWtYR0ZuS0tieWVOTENIR05wR0dlSGlLMXArYUZFaHViTEFyeEdGWUQ2?=
 =?utf-8?B?aW1rL1dQOEVNYTlkTDZxbFQydy96UFBYUnVtOE9XVk9TSU1HdUdhdGRtRkg2?=
 =?utf-8?B?TDJ0ZUJsVzd0d01hWTlGRDZzWXhqa2FCREszTHQxVEdVR1NxM2lBakY2MVkz?=
 =?utf-8?B?aHhvZ0lKY1ZzS25NNkt2SkZrWmxvRkkybm5IYVp5ZlZqclYxTzgrZlppeWFw?=
 =?utf-8?B?Y0M3VzdacCtUV2xCQXhUQmQ4dzhMUEtsYzhuWHJaV2xhZlljSlFCTmUxUGN2?=
 =?utf-8?B?bjZmTXlzUlVCTUxyUVFwN1ZSWFY5Tm1wd0tNQURFS1FCNGo3ZjVSdWVzVlRo?=
 =?utf-8?B?OVJQTVRTVDQ1RUhLc3NNSTRkcUN6bENiQnlrL01ESHNRd0QrYXJNUT09?=
X-Exchange-RoutingPolicyChecked: fTWHzNfzXJVkjE1ASZ5tsm+uegOvKwT1/8zIW7zby538a/2+Yqwvnogy8k1oN59bNs6eyJkDBjQm8Bm4w+mgu92HsOt9lGfUdcFmpaS+HKL4Qhuu7SJrzQo2GF9Te/Jz7WFu6aRh3h1aSIMl20OOUlzWKQ/hOD712FiVwfqqsXyUJEAt8vQvUScfB2EH3wyB7mYUnJ+mpAnyijLLeE1adbSQ/Qq/COYwMpZXjKyOcLm8DCUYxqv1tXS+Ijq+ouJhDrSC+z8zWGWVmNWQIdGhCdTki23f9KnKoP9y6T7EgqZBPpH2LdYF5yiuvMz27T2kFp+5dzRWFh2W+CX14yCumw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a549158-0626-4d62-4f97-08df467120c7
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB819107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 19:13:00.6045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wt09k8zt6P5sw9YS/xU4yajg/VL6RwlYu3mnlTc22WunhLNXGX3nVfZLRL5guYYERBs/zpvJ9iwNSa68j9f0bQydvWSEquupjIYjTR8blD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8543
X-OriginatorOrg: intel.com

On 11/19/2026 5:02 AM, Peter Zijlstra wrote:
> 
> I didn't bother with the noinstr, but it shouldn't be too hard to add
> that back in I suppose. But I see very little reason for it, since (1)
> see above, micro-code should do this,

Yes, agreed very much. TBH, I find myself with zero motivation in this 
refactoring... as far as involved in the microcode loader.

Thanks,
Chang
