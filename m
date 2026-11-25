Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641223;
	b=QUSWUxiITS8WLQqylpNnOBs7om1bEid7MEIL2Y6XQhaio1jjg5mQ9nPU+NwZKik8CAE2
	 TFRHA3P0L2pjQrJKk2BoctvnrKKrDxU013f+wN7YLaAV71QszHFQsyTDqhR4k7yikoEvG
	 I3hrhrXl2aurde9GDLgQnute7IiB4VACDezj8dFILfW1aIrPgss7vWfRDVeCFQCRK7UL5
	 OZE8T7bg1J4LwQjYV2q02OuktauxPlFMeJV5m46qjtP9c2UA0Pc/9KZaTdrUH3PQxO7hW
	 5VJS4FVeOziqz4tVAefJ/hYffhgUkSG+YH3YT/Sv1i+2b6ts5Vg1kw0YOmRoQXNSqBA==
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
	bh=zZTHe+EHnErVntJd2sQDm8ojFuFP1DY9+0mJ1W8lZY0=;
	b=cZmELvd9dFALESbazk319uC/T8dQhs0xrK8A1oix6tlCJNlbnbQCX9NPh5lAZZ2S7Wxy
	 Wz2chEM8HWlLAM/n7qduocbYWYEDqoHkOhqbCuZL2WuzR3ata+R3MfIFFc5phIxDxr1Sx
	 EhlSs16CLDHQ83r9yj/4PS6PL+K4qnhD6ZFr7Kx63/M9evqDtdz/xyfsKe1nsF9hgZ2u0
	 E8lcpgDuJ4Hi1eAW8r0fi9XUmw074odTVpZ4SFSyIBnqTy5QWiE+7iqrcYHUkRpFoC5zh
	 F/X9nLYktq9HLmfb2RuAawtxnyDb6aYTK+/SF4aR6aZeaWGSe5gAymXw8lq6NEqgfxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BqOyei8M;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NahWcDvZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618D1606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 618D1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BqOyei8M;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NahWcDvZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795641223; x=1827177223;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XACQ8h8vSfJcJmgfq65N8fjpbw2bz5fKxhGAYDuFh00=;
  b=BqOyei8MKkVcnyyCRlnUi7Z/uhnfTj9bTPvJu7oox2WjdHmzss4Cl00m
   3eMHkKmDcWnvSQlnMx6rECiD8feIRM8mbLrPrV/SqNYVoD9cxoq4MKhDr
   74lB9A8pJKueNjkaSygxHk83483ITFw1UawSoGMsn4+PVFvfnsovsqxOL
   2cnw7dI6UkRHEdH3EqjcjGqAbKbkV1JWJJ8TdvWjk9HZMRasYCXpiWxz8
   XqvYyYB2ND5VDNj2Kk4Z5y9wrEHdH99GIsuXUiq6/TU/XbIDX2+rpajIW
   t0f5A0QLLKzIw7V3U6Jo16zHXZh9b+nYcjM+h7OuUooslocvdN4aNhXa2
   Q==;
X-CSE-ConnectionGUID: z5iwb5BJQeKpak5CAE7X8g==
X-CSE-MsgGUID: FLyfmw7DQGG4A1YLP3UI9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4559323"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4559323"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:20:25 -0800
X-CSE-ConnectionGUID: oWqwHZBDRq+QHI9XAMcYkw==
X-CSE-MsgGUID: PToyffG1Rpag+07NyiPcOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13614843"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:11:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:11:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 11:11:14 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:11:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLYq6rwsn4UjLhH5bzuADDQO3UEs4Qr54+B0n9Oxov1tQ/VadiG4f0oPSljFVb46MVBiFGhI/c73Dim2kQFzycMdLJoFTLtQPLbT8LG01yeMOUWR0J1QJvlFNcSMt+8gqk7YhbQF2+j7kznlyRlooaVoXKpf6lrKL1Tg47Vs7P67h0k9/Pq9+VtYITmiM2vm6OMzmJDbhEcKh7qFW0H95l1EkMIh4KYxB8SUm9f1XQgTlieD2o4FZpnJFeSJ0tIsAVECusqR/7V+C5QphLmni1rZaDB/8ZR2teQX8XBFAV9asthbVWQ6GtqrcFpkuu7kqXXfeIYehqJlVf52uaEyRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZTHe+EHnErVntJd2sQDm8ojFuFP1DY9+0mJ1W8lZY0=;
 b=FiiOjI9o/35ba7R33HRh0eMXhRhwdK4+QIYoyQyDmS5QKkqplLr1cBb/Dk44tU0Q7/5V87+bt+NzyelQI2NCMWqWSfB1RV6XQGx+Bp9/Z9JWA2gVe2b8LYpwbAgYVoJtepy0bSoyNRH7Q2sii/8+QoFIOyhX39ZX0WBUUM750M9S4hywejBdVscOpS4X2kOwW7qH+vm576mmg8e6OPSvA4kiCUqyuYqbD5Qj0mbMy3EaTcebsQnkRMiXv938rdaAMEr/cl/OjO76QkwqJcW+aT1mD6bkgp8AT7OMbfRrrTz4BtaHpubV0MJqhx+O7vFeVq4+8Bl4BUmt2ovKMoDJYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZTHe+EHnErVntJd2sQDm8ojFuFP1DY9+0mJ1W8lZY0=;
 b=NahWcDvZoWyRW3FtIUBB/kdvRvD5xHbFbJ2vSHngFpS1dO49NMEelfDAScmcHJIM8sHaAtBIe4+3gLx592SksCzVt0tu3WpA0LR7GxtBvJgToAwl5Tak/x4BaZzVSOY3xu32vQzEcY1lQOxOpKZHf8Tpoglm1v7kQL14IFT6zl8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ5PPFBC9025319.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::84e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 19:11:11 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%7]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:11:11 +0000
Message-ID: <44ba5286-ae25-46ff-a862-e7c0e26487e8@intel.com>
Date: Wed, 25 Nov 2026 11:11:09 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/12] x86/resctrl: Parse ACPI CMRC table
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1793864720.git.yu.c.chen@intel.com>
 <d83563076e5f945078a83aa5f10d430b1fb5e561.1793864720.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <d83563076e5f945078a83aa5f10d430b1fb5e561.1793864720.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::16) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ5PPFBC9025319:EE_
X-MS-Office365-Filtering-Correlation-Id: 509d3599-2968-4af3-456b-08df4b27de18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|261028144727099003|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: u9B3xzSOXiQqnzp8IWFtI5g//rU+e+uvuRH6OG1ecyYMPIWharpYJt/IFutrxDXS/nXTGBjTKVTZO5hS7FF1vXy8MKcbZPt2l/hoBj4+IDuWPO69vdil/LIryVl8AQBYSaTQq5D6JZWpou/TlqnSgnMx4RsfP0xrQh3FswaTRTDwgSCeJ9CyCIwEOmqQk2qV4rxnjEIVnTnjU1iGeXTwKGiAjCPQa/QqaRsxm+/RS8ya92Srn6M8ked/RCoBvUgL32V2GKVIB31APhxDLz5U1kUa2cV8Ry7gGcyEes3tUAdXtWu1BBZ0FxPFLhaj5jlAgjhthkzZMMU8tw8vydgKx9oQxHl4y5a41wfDbenViCd1DH29Uo6V+x452xp4F5G4wToGhM9WSFrf1o0J2yPIBdagJQKefv+jZRBVLG4sCSCrGtl/vM5oCMasUZMnQmAjl0fsaCyOjX8FCkI5Rlu4gRbnBgp/JfDNXD2muT7aItU92x1MTZz7UIeIBNeyBs6ohF9xpAUygkTISHJB3KVjgkKcPU3aqI2jSoetCvyx4GsdQQntsexdfbzuESifcWd0cIbwj82UmBZuYC6UoswYuE0QQHAPPdX11Az5qKmQXvezOjlj1F34HXTtLLWP2iTRWdrB8UxErjg7KZHtVtkVRB7ivCv/5iIDw0d9sHCCIeE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(261028144727099003)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFE0c0Q1RDN5Q2EwYlFhUCtQVW42UnVsZVBUeEVTTlJvWG9LSHpKUG5ZYzgz?=
 =?utf-8?B?eGlRUG9jSFBRY0tuVWtURDlGQnYvRDNielc0TGR0eFdCT3pvd1RMVnV5empF?=
 =?utf-8?B?Wi8xK3A2dHNGSllreVlrWmxSK2dJbjF6NFozVjdYTStrRlU2M2FCUmJDaVE2?=
 =?utf-8?B?bG5QYmtBZzlCOWVKZEtjcWdkZmI3dGd1VTBFUE92c3Rud2V4UmtiNEx3K3Rm?=
 =?utf-8?B?YXlPeFZkQW1IL1ZoYTViWnE5YkRBTCtYVjVKVU1UWU9OeEZlM09Uc2lRNmlM?=
 =?utf-8?B?cWErVlY0MEd1Unh6aDNoSXN2YUV3dk1YQ2E4Zm9DazFMQ2ZYSFJ5OE9mYjVY?=
 =?utf-8?B?ZHV0V1Q3cWFBTkl2K3hHbHJQQnB1V3RWVDBXYlMzVzBialo5YkFpYUpGajFU?=
 =?utf-8?B?ZEJHalN1cTMxc1IvRjZzQlgzSHhKRlZhcnlhUGtFSmFlN0prTVpESUpLRUl1?=
 =?utf-8?B?QjRianBnUmdRc1hSS3p6SGs5bEJWSjY2S1Z3TEJqRUlQODlMeFd0N1NQWDVT?=
 =?utf-8?B?NzZVMGh3azRJbTR4T0tmL3g0dUNmNW9hSnd1em1BTVg5K20rbFN2bzZZVjJz?=
 =?utf-8?B?QlhPNXduU012NXJVaSsxaUlUS1dtOTBIVGVXNStTOThJZGhSVUoybnNTVzVk?=
 =?utf-8?B?UFZ1djl1NElXbk42ZnJkbkVBQTNFQTRqbStZK25wdzNyQXQ3eisxQ1pTVXhL?=
 =?utf-8?B?aFRNLzRkR05lNTVZWFhDV1FiYnhKMStYSytVOHo2ZWgwVDBvOUl6VjVZZzBT?=
 =?utf-8?B?Z2tSOTg4OUk2MWZEUDE4KzIvb2V6bVFYdDZSZGpYVGhxRm5FOWduODNCWDJC?=
 =?utf-8?B?QTNkSHVKVVI1bnhZZlRwUU1zMjcyeExkM0Fmakp0UmtaT1p6TkljNDZTdkk5?=
 =?utf-8?B?U1ppdUN5MmZNRUlmck5MRXFkL3dveWMrRzdYajYyYmZPM3hRazJ4OXZSZ250?=
 =?utf-8?B?TmJKemx5NEw4ZmFSOVY3K2ZEU2JJUXRlTnAxc2tWeVlmajhNTFpUZHRCZ1F5?=
 =?utf-8?B?QjNaNmRYdlpwK2ozVGMxaFZhSGgzTmU2SnpMTThBTFlmYmZvVmVyL3hDY3d0?=
 =?utf-8?B?Mms0dFVINklZZS9EUXZLS0p5RnpuZ1VhUVNPRHZKWlJKa1B0TXFxLzAxeUhS?=
 =?utf-8?B?bUtyQTQ4a0xsd0R0QUxzZzlzbWhOUEhoMXJYWFR6M0lmSCsrR2RQZjgya3hu?=
 =?utf-8?B?aTZLZ3dYQm1BMFVFdEY4Z0xaS1VLK1hhVGZaSVpxalJ5aFJqK0hPRUM4STFI?=
 =?utf-8?B?ZFAzQlRwdEQzU0RxbG5tYlB3aDRBdC9DNDA0TlJrQmpkNlZQbDB1Y2dCSHo3?=
 =?utf-8?B?b0dONDgycE5hc3RSQ0hLMkc1VlRFU0U5WnMxMWMzMC8yclhnSEZtMzlmOTQ4?=
 =?utf-8?B?YlU0M1dwRUNsTmthZ1RQL3NtYmhCTnlxdEVYYTFKd1hBN1A0azFVenBjY2Vm?=
 =?utf-8?B?THArSHNmZHBxNjUwSDZNTEM2YzJnQ0xYejlaT2x5aDFRbWd3THZOdE5JZXho?=
 =?utf-8?B?S0tHUUZnQ2wwSnY5Nis3N2R0L0dhc2JxTXhRVDdjN2xjVXFPWSsrVXJxQWdN?=
 =?utf-8?B?aVNEVG1FdVY5c2lHNSsyY3lueVloZ21PNmU1TmdsdEw1WGIyT1dOT3hXdVpJ?=
 =?utf-8?B?QzJQVUtiWkgvS004eE5JRDlzbk1qMC9UaGFVU1ZxbVBCNnFrVWxiUTIxeUZx?=
 =?utf-8?B?dEt0T25hYlY0RDJ1QUQ2WlF3RDZ4U3NSMXhPajRlTlZkVS9TM0t4S2pSRXBQ?=
 =?utf-8?B?dlo2Wm5SYVNmemFVa1Z5dG0vdmhsSFRlcnRJOVJJeHBNWUFPUzVldDd2UFQz?=
 =?utf-8?B?Y2c0ZnM0MEREZk9uM0RsWDFwdnpHeVBKUlNtZjlEU1ZRWVhKRGtMamZOUDBM?=
 =?utf-8?B?dGRkTldVRFVDdDBia3k2UnJxOEFMQTdFTzFaSVFKSUJlQWZGaGk4QWt1eTZ3?=
 =?utf-8?B?ZEJjc3dEYzFlYlpkZnVCUnVMZmh1T1hRbmIxQnpvZmpjdzZxWGFKRWdOY1NW?=
 =?utf-8?B?bmJray9NNlVqb1poWEQzdys2dlVIdlRqUXJSWlBKU2t5Y3RqTUpLWWlaRjZT?=
 =?utf-8?B?TlhWQkFtQ25YRGhHMEtaSUp3dmR4dzk5Qjdxa2QyZ3VQMTJvTklQWVFHT1lE?=
 =?utf-8?B?UmNFMFkzZWFRbXBTRnNQUVlsNXB2L1JTdzhveXlqc25wNWJVK1NTQ0MyaE4w?=
 =?utf-8?B?RkNoZ2NlQXNRRWhvRWpGTkFOcERyWmpBbmUyNHNleFN6UlJndUFqamRqaTYz?=
 =?utf-8?B?NElkeVBORHpBVk9mQll1dThyOSszd05UTzR1cVppSnlqZ3c3Qk9XNklweUZW?=
 =?utf-8?B?RGY1bHNNQmp1R0NRUHhKNG5XWDY1RjhGaWV5czdyd290bDZxaWhQRys2ODlX?=
 =?utf-8?Q?knq77WCXfzqjIUDk=3D?=
X-Exchange-RoutingPolicyChecked: XDZp8HVknZeaLii6qI9P93IBfIfzNV8acUnv3QE6hLuU7DeEdF7k0AHk6G/zAZR6LzQUFL6fWME7Wnq4GODfqq3iGh9BGC/9xVTxd48Oasv4s7MSA5EhAN0H80h/EHavUCFRZ3B3i/UjSAG+4jK9Cq5TD13wgpmpa/+iRH7GdAx4UQVhTF/1KR+m4/OcI5fW2IhRIIK6zi07WliAcWU+rO0hELs5FwuQTTo+iL03hHzFs+zhrgDhtub7NODWb8UEK6jCMjxBeJo/OHjnR86K78UY6ZtazC493ysVeD6/BYzFnTByUWEzC9TkJF654YE3i7uAAkU4i0mEqCzWx4tTzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 509d3599-2968-4af3-456b-08df4b27de18
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:11:11.3551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+u0h5KaWHx2MACMJH4CPd1adnn5N/X/uhwUtR14OaAs6yh5sKWsgs4wREE+PRpTQ1ZcO7aO5INO5ZlhCWaPgrT0QbreA6qhmYbK6wX+zFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBC9025319
X-OriginatorOrg: intel.com

Hi Chenyu,

On 11/5/26 2:09 AM, Chen Yu wrote:
> The CMRC (Cache Monitoring Registers for CPU Agents Description) sub-table of
> ERDT describes the MMIO registers used to read the LLC occupancy counters of an
> ERDT domain.
> 
> Reading the LLC occupancy of an RMID via MMIO, rather than via the
> IA32_QM_EVTSEL/IA32_QM_CTR MSRs, requires the following data from the CMRC

nit: "via the IA32_QM_EVTSEL/IA32_QM_CTR MSRs" -> "via MSR_IA32_QM_EVTSEL
and MSR_IA32_QM_CTR"

> sub-table:
> 
>  - Where the counters are: the base address and size of the domain's
>    monitoring register block.
>  - How the counters are laid out: the index function, clump size and clump
>    stride, which locate the counter of a given RMID within that block.
>  - How to interpret a counter value: the flags, which indicate whether a
>    counter can report that its data is unavailable, and up_scale, which
>    converts a counter value to bytes.
> 
> The LLC occupancy read path needs all of this data on every read. The limbo
> handler also needs up_scale to round its occupancy threshold.
> 
> Parse each CMRC sub-table, validate the data above, ioremap the monitoring

From what I can tell the patch does not validate all data listed so "validate the
data above" seems to overstate what the patch actually does.

> register block and save a copy of the CMRC sub-table in the corresponding ERDT
> domain entry.
> 
> Suggested-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> ---

The patch looks good but I think the sashiko feedback about a 0 up_scale needs
to be addressed.

Reinette

