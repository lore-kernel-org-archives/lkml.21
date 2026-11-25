Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795637248;
	b=oDyzrOoP9hwIddeon9UgoR2ULnRqWaTh51EzsvtGTxEP5Msmht3TQJzUNwoTdah9oQyh
	 DDgvwYWmeldpXi+lu702LKctwL3FCSAMGl1GVUkmZgVb6JKjiA8sKRvV+e3hqer5Cjq1b
	 yKSjIYzukunuaAGDsTleJ2vqzQsuwK9o1p9p9edHApQ2ORk018PFiRJemo+rGLvfsRgyU
	 AAwnpGfVMR4AyJRFOjYKEyNcvqOxBR5Gu4auAvcZaFKIBEZZz1GUbrYWGyKx1bYbhCLA9
	 uUG2BtFOyz4M9dt7ijwLfAUcZaZ3ZRreoa40cEFpOlr9+dbd84lmvLyWMZOMXBx/miA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637248;
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
	bh=lmZh6bjWd3lqfup2mKxwKnG/48JPp9UsfMug2bvKYxE=;
	b=fkHmvhO5RuruLuJHRNFMMddB1msphHoNTvZ81zYBXKZ+hV+l+37/TmNLCFOj08ZWhMl+
	 i0dmktXxpchjbQ/uXBTojmtXi0iFBL3ccUTt0bSw6cN3juboPu0lIrw1jyZuDLHQUPB+g
	 j1jPK9nYyHQoMPDS91BldtNv28DEOqnzM8tDPQ1w0geT1s8kQ68bABh078dPKv2L2AdL4
	 z8EtcO4wO9yUduY959osfeDDryP69dTEHJsVY5vSQnBp/36FWUCybJdny0zmoS88s9z6N
	 iShUAk2b+ijvSP0gVFFansJ0w+vtihL/x6m8JJgV3jY8xOj0xAZi/OSIWY8iaRcIBFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Us7ZDdXU;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ahpQHjzW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C878606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C878606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Us7ZDdXU;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ahpQHjzW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795637248; x=1827173248;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gYp55ijsdzQmvVAffIJ/VmYwlJ5wl1D+mo/swxg+kFw=;
  b=Us7ZDdXUBjhc0R5cPZE47UStmEnvPVIujPdi+Z2ftt2RQ3dPuohNEkaD
   lvFidcrpjzua9Ofq0FApSzP0/DjG/LdOzMr3GLZLSQbXKOOwfi8V3+sP0
   nCzmtPAvZ1ubDIC4JsJWz+zpm+fKt9HFh8DHpn/FDo2B2FcOZ/ZoyCYYa
   +d2qXDhNZcag2INhKyeD1kPODiuDbNdYRqaqqkpCiRn0BugDnKHRu1C/H
   4dNm3r1XYYyWV5d91uoW+4JDIEpxC63w9uSVWz4cyX806nT84+IB/2eec
   IPcZTvNbR4DYqpPqFvZkmZ14OWPVCvCJ1As8WpGbRKFbj6IsZeG5Cu4k6
   g==;
X-CSE-ConnectionGUID: 3TnkpdjZQlm15JBK1JzPPw==
X-CSE-MsgGUID: unrFl4FtRMS76VM/p5Ps7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4499322"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4499322"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:01:48 -0800
X-CSE-ConnectionGUID: I0kznHVrTv+LcZxyUroiBg==
X-CSE-MsgGUID: 5evVJ1MQRPWZznrwrX9e6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13980861"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:01:48 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:01:47 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 11:01:47 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:01:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQPAXi+AD+GkRq9ziKjlg709fbLUnhO9Zv7ZG/LJwhZzb1nVkaC5KZMpO9kbvdlUnelZpewbDX9SCkQUHFwxR3wLCnimnHEcZ3xwITbzyJEBYihxt+cVI40VnSVvzi4qafJwJ2jrNANWG7H3TVFL4rzA2wXBiDzCvErn3QrdPCvNNF/Sn0QqFNlXsC5rBCu6/5QnsoOW7x7YkuHgCmZIHKdZ1cnN1MSBBB6BG1Cr7zM2yl0ozjNMDO2INmJGnnjGTdi0jrFUM2o/Ypw14qlX/K1QUmLTkovxUbvVjuAdq5hbxLqxpNassbxY6HCVzX5VANmKTnqVKBoQUZ8WYgSkWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmZh6bjWd3lqfup2mKxwKnG/48JPp9UsfMug2bvKYxE=;
 b=egPqPB9QufSrav4hmCoF7syoDGHvz4K1fmsHQrHfkwPbBbnxjOEWHwY3PIOAL1fumyJhaSFCYpvuVoTpPWo0xHLC+kYi4fgB6nBGNx232IUT0o6wly61Z8VzOWzNeXSB/1RAtv5eGb+gnj4TGTU/AO64e/lQZku1t1/8lB/qXi8mVwIoBCbtnY51oFDclDfcItJa+DagyP1TuXs50NMwVaGVsX2oQPFz0QofX8Fapj6EZqZ3nxtlR1W2CWvbgbPMMRzod1JPb7d5RNhbvbWYiJgnbvmqJcGATXBor1lJ753f9YMTJZik6O+952YQO6qom9T1ZgDTtxLHNcOw/2ZAcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmZh6bjWd3lqfup2mKxwKnG/48JPp9UsfMug2bvKYxE=;
 b=ahpQHjzWUKyBQs7WjQ1B/Au2MZtn8y5AHfFNsA1/CwfxBITus9uuLxbxFPF9A5gnoMRRHXA0XA3afZ5Nut2pFUbZI0jQ47vTzDsk38d+HwN18U4gd5vVTYHVA49ARs4xSLefIK2OjdS5S1F4j8i1CIJfxT+ThlLeAJscartVPkQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 19:01:44 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%7]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:01:44 +0000
Message-ID: <959725fa-d3bd-49cd-ae17-ca0650d4cf09@intel.com>
Date: Wed, 25 Nov 2026 11:01:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 04/12] x86/resctrl: Detect Sub-NUMA Cluster mode
 before enumerating resources
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1793864720.git.yu.c.chen@intel.com>
 <d9c9ff67609cbca8dc840c680425d90191c4a1dd.1793864720.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <d9c9ff67609cbca8dc840c680425d90191c4a1dd.1793864720.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0343.namprd04.prod.outlook.com
 (2603:10b6:303:8a::18) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: f664dbae-10a4-40f3-57f5-08df4b268c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261026140227099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: f7jnm6CJE/1HynLpHSn4UQMby+Y8Tv6tchtIPofbzFoRTTXGxDIWnw075fweu1QAm1T0/23rDlBMtetYgGPp7CFHYdwVoaiOhfTkjPS6iDYky2ukEBX/z6+SGkHiPr+9EzyXjlaEta2X025dY8vRA/OGq7Dl5liAsaOoJJND1YKe1t2URN2NoVflPOIOXVwAI4LwvBzmHSfOiAAWJwE1aputuv+skxsZI+xg/DOq5nScvSNGSVIocVNKJ1RhxiIZb9fSrwz28dQAM31zDVAsxs7JDeealvaZh26csDrL0STHub5eO1ypCKD+nVlKlYtZqL7RkPjLLtQBRlK+iWmD1O3vUWUVwB5/Au9wij/i6QZN5izQbLQF/YLytrRl9ysoYLc8+xbsSMYJ9EHVfUgUC4N2x/TJOnlsF0Vk4lAhp6HZu3cNBUYbX7SAooasdBol/Rues0lDpMrg4hjPhb2wmxiWTwR1p7ZfGy9AjN2I/T3PoHLVzCVDxWyGZMKSk1f2+IcbBGiMuX3Imv2rdmKBpq3YUFQAxwhfBSpbUX/KhbrfwB2coPBE0gLkiinuDSSY3xPOdxwSsV0YKvHHuEeDg+/jZhwzCiKiAd69nntbZe3hoMBBcXXeM7ZzTcIYbGzLxPketYj/1bw/wQsLCKtloZQbBw7KA1kKyMoth28hIXQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261026140227099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWhqYkkxcXdOZlB2eHM3NUV1cnM0dG5ac0ZOZCt5OFVJTXI1QncxQVZFMWhX?=
 =?utf-8?B?allYY25YQXlaNnV6L280M0tqSks5eElBcm8vQkJxcytsc2FPbnI5UElXV3Fp?=
 =?utf-8?B?WS83QVNmVk5zTGJiOUJTUytMN3EvaEV6cW5lQVAyNW5XZ0dsVXVZK3ZadVpm?=
 =?utf-8?B?UmRTQ01Yc20zMU01WGFENU5SQU5LSVB1N1lSQ25rOVlzdnd2aVBMY1c1ajhL?=
 =?utf-8?B?T053QXBaNVNEUHRjUGdEclQ4U29qTTVtTm84b09hWGVqYUJTMlBXWGZORnRH?=
 =?utf-8?B?Q0YrS0hTVXdVcUJWQlUxSDFvcmN2ZUpKcCtOSTVSMlV3RTh3UjVYYVFCcUpj?=
 =?utf-8?B?YVR5dFRJdjh1N1k4SzljaHcxd3VhK0k5UEJRYllVYnF0RTJsZm5RenkyOWta?=
 =?utf-8?B?eE0wMUJ5OWF0MC85MVFwRGhBUVFkUGdmc09DRm01UmVBUVBBRnZMeEV2bHFh?=
 =?utf-8?B?bk0xYTNsc3lNSTVJRnFabkV5TGF2V2dSdHdxV00ySzZPRGU2MzNDcmhObjJx?=
 =?utf-8?B?THZ6Vy9VRXhSaXg3THExMkM2a3pyUFpLOHR1eGF4QzlkY2lSZzZsNXNwOEJ0?=
 =?utf-8?B?NWpWZE9HcGRidDV3bWV6Nm9ZRmhyaW81QjdBSXlWOE1xa1hkWjY0bFd4Mkti?=
 =?utf-8?B?cmt2VU55Z2tPTHNxbUwyeldXM3JWVnNSbnVuVkF5ZVY1VDZBY2dkeEMyQVBF?=
 =?utf-8?B?S1hYb2JkbFhvNmswbU5WbUFFYjd2bEJSRUh6eGRRaU04N05xbFVMb3Z1RDl0?=
 =?utf-8?B?dVFaQmxPeFkyTVExZEtGVHFHc0xkZ3R1emlwcFFxREd0S0c5NUYxWC8vNmtP?=
 =?utf-8?B?TUJ2M1dXUXBTT3BHRm5ybktnSEdpYVZkYWw4TlBQQ2hCRUREeWVIRmpnTEU0?=
 =?utf-8?B?NnhtbE5OYlY3UEFGQ3NKWEh2elZTZjBMZlVlNG5hQ1FGN3pLS2wxNTZkaS9O?=
 =?utf-8?B?QWRrdzlhdTRxK2QrN2lkcmZmZHE1dlFycEk5ZXh6RXhobUlvUVFETkZHUWNG?=
 =?utf-8?B?d29aZVl1QkpXclNpVEt5LzhLMXZDTFdPR3oxakE5bk5nZ2V4ZlN4SmxmVVM0?=
 =?utf-8?B?aHgyKzlVSEQyQk5GaFBMVkFwZEwwa3hFRVVFMi8xQXc2Z2xibGtLcW9kODFk?=
 =?utf-8?B?aWdDN3BraUVkRHBLeXFhK1ZhOGNpOTFUMUtPN20xQnVnU0p6QnRXb2h5aDF1?=
 =?utf-8?B?OXJRM0VFMFR4TkxDQk9hQk44L2dYcld5MWI4Ni9zT2VwYnRpZjZmb3hWdDdX?=
 =?utf-8?B?UFk3N0FveG1RemE1YldGS2xXbmhtdkh2a1VQSlZYSEE4MW9DWUQ5M2xwcGRV?=
 =?utf-8?B?R3ltSHhuNmNLcHNzd1JvNWF6ZzZvRGNyWHhielRtR2JkQk5PUmF0OVpxZTI0?=
 =?utf-8?B?aXRmbVg1dFVEOTlNZzA2SDQ5ZlpsQld5UEJ4R2psWTJVc3NDSkJtUVo4Zm1F?=
 =?utf-8?B?dmFhb3NzVzgySGYwNEI1SWRyTTg1ZlY3TE9aOXhtRzJSUmt4VnFEdWkwVWg0?=
 =?utf-8?B?Nkl4L0tFNHNIT2FKb1VRYUlUeFIvYVdQamg5Y2NSM09jWFUvUEV3OGU5aTN1?=
 =?utf-8?B?UmFuS3h6VUNza1BhbjZPZzlpZVNRa0tMMFlEQkhLK3EwT3ZOVGRWOUZ6OFdL?=
 =?utf-8?B?VW9UbzVVc3BZdCtPdTBsZTg1V3lFOSthOWVtK3BTSHVVVGNZVEx2M3p1elJS?=
 =?utf-8?B?ZSttaEgzUjViQ2Jyd1hYRHRoRFA2S2FOWldzdWJmZ1VSYy9OTCtkWjFaWk9J?=
 =?utf-8?B?aHZlUjFtb3FKbDBGdG5hU1piY1JWUkJmWXdjUEdnR1RXYVFSTk1OYjV0RDgx?=
 =?utf-8?B?VW1aRE96dzJOdHcxWk01WWt4WG5odlBnN3BvQ0F5b1FKOHFzMlhwR3pWNEdY?=
 =?utf-8?B?ZzFZdUw5V1lSUHNrcTFmcFJCVld5L082RUx4bFRLbjBqWmJFdVE0N0xhWlJI?=
 =?utf-8?B?ZXBKSWFCQUxGQmU0TnFqVTc4bEI4MTZyZWZUYUJOMGFPY3JuWWswT1BHa2Vz?=
 =?utf-8?B?b1lZaElNekpOaTlzR1FJUDFUMUtvWEhNdTVkeWFaWlczT0FoVkg0eE5HVmg2?=
 =?utf-8?B?bXF0dW1DL1BsMWQ4T0xHTVlYdk5WNDVkVGNxT3hDMWZROXpFY3hPKy9rbVZo?=
 =?utf-8?B?MU8xSVo0NHlQRUVZUXhzeEZVWDNCZkNha2tCbThaaGIwaHYyMUNhUGtnb1pS?=
 =?utf-8?B?MGsyMWlsWDRKd3puYTI0aVc0dHZOZFhueWoyb2pNYzFERjNPRm8rRStiZXhT?=
 =?utf-8?B?Wkg2ZGFpd0tnS1VrSXNsaFVES25JZ24rMml6Q08vNjdKVklBS2pqd2hhTWZ2?=
 =?utf-8?B?dktZV1BDZWdXVXBnQUpwalNUc2RHTGNsd095dXZWaWZlUk14eXlkdWVmOWdw?=
 =?utf-8?Q?stke8o/OQYraLgaE=3D?=
X-Exchange-RoutingPolicyChecked: OLECos3VbsxOuvFnzui4p3X0mt3OQzwxIWVcYIHqLW7IKurN5WSIsvOV1u8s/qMHl3/oGLAgc+rv8E45zqcgo+2fsCz/3eZ2It+J9XPV9Hw3dhmgOx8R9Q0U/aITqfSWwcEYMu1G7IFk/hVwZ1XKUBQZutXfcLPIldoFr34qx6iHysZ47b/WA5Ou6guz3PJTJwZHzqLUxL0IzDCn3+C7SVZ7NUOgsa3xC005VTI1WgXJw0s15hgxH80RnNXGADQn2YRwohzMYdxFWe2V2slcgqY+oTvUqcfYozlXF7a9ubIEfq6vn5p08OVGZmHTIHCXOf/P0B8rzs2OGA6dnx9XWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f664dbae-10a4-40f3-57f5-08df4b268c0a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:01:44.1601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eg17XvsBu0Q/q5Ud35Zttrmn1aQRqCWA85l8HsaKg80Z+LBNtfEV1R/bFqplLsTYtQLUGm2eMsV2EfL7lpX56to7oHdtXDd/Y2+8W9ZDe8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
X-OriginatorOrg: intel.com

Hi Chenyu,

On 11/5/26 2:08 AM, Chen Yu wrote:
> The Sub-NUMA Cluster (SNC) configuration is currently detected only while
> setting up L3 monitoring, so it is unknown to code that runs earlier during
> resctrl initialization. Upcoming Enhanced RDT (ERDT) support needs to know
> whether SNC is enabled while parsing its ACPI table, before the monitoring
> resources are set up.
> 
> Detect SNC once at the start of resource enumeration so that its configuration
> is available to all of resctrl initialization. SNC is now also detected on
> systems without L3 monitoring, which is harmless because only monitoring
> depends on the SNC configuration.
> 
> Suggested-by: Tony Luck <tony.luck@intel.com>
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> ---

Thank you.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

