Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795151077;
	b=AUfQTn+sHQ915JIrbcdDrbH6ArY1PquPY96Z1VWnUq2OF3Exawd3cMBG2j8SIQHms2wg
	 1tiQLKh4lw31iB15VFfqI2QrXDJFCxGF9cnAvWji8RfUBje+x+39u/yJDgljQg3Qf3tsW
	 byYVz9S8sgdExLStvVtDue7scbJNGo66hMZAVMs3ib4/gxSZGwF5ZNMAubmal8jMJUmBb
	 M3fgGx8Z4TCiYRQ0k1S4UeoucFRLtngWAifm/Rg/WDsIiAn6kdMyoBc/wsevxq8JOna26
	 7ASLSSZ/QmWUCs/dkYVFDlNAep2BJOLnoTGC2hBb+h/ZR5rxG5zNiT72m26GHt20LIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151077;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Content-Language:From:To:CC:Subject:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=j6qs+8UkEjXUKxseSD4KcKrQp3Z/EptTdoME9NS1Ppo=;
	b=D0AyrCfjJuhPkvNUS5tsbbhSfUp7m+9NGRhvuPQ4HTfGuD7P3An4ur74dJA1i6IMHpCY
	 gO2nkx2GkjzYF6Vfq865sIBerQuG/9IXqHo75i0AhVS2REIUHupbHmPro6GpyBD2zoz0T
	 Tg1GLA5CZtNRVg9r+oXny1Exvx7gzasn0qEQz9yoSOJu3PJTSJzEKgCcdW2P4WeAYKUOq
	 WuqXS0Zee7+om3B+jYDGoGLOW3ZCOM5Vh3/9t0ivUaTJHEtlSmxWGncbnJqhcpo4C1pJd
	 5uUDwBkiNpbwbmFqefJJspO/ZfWAkz66jPo49zbih3G8RtWqQpU18/T7ceq6NEttnww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jxbBCE+L;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=isQHIa6b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6184C606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6184C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jxbBCE+L;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=isQHIa6b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795151075; x=1826687075;
  h=message-id:date:from:to:cc:subject:
   content-transfer-encoding:mime-version;
  bh=gYGzWlI6qpefHQrbjSqkCr/knpZSQWLrt3IYmqoIACc=;
  b=jxbBCE+LSdrhO+p58dBCQ3hA9JtUnzAAbvsiJ9CxdrPK4KT4efb5Y2KH
   oKNu8YRZlzUbYtMb15A6zqKKiOfN2QiguZKQhRmmpuW86/CphyUn80e4t
   JR+w9eLQF2I3tcr78clStbhV6BXC4CA8jatSWHxyPz2yVP6u4Vi5Qs1qi
   qgR0WkK/wf588/11oq8aG4Lchejw6IlqG4aSWdtbE9Jt3YrG8zNPgAtcb
   ZsMabxImBdQM77q3ykYsFqr80+pCW96ceOP3nOKlHH7R3rAzoQuItmmjs
   wpMJYmylOGKlr0clRFIQEHomL2IEUB2rBq3miSVai28RDULypGauKZPha
   g==;
X-CSE-ConnectionGUID: uu/BONQyQteLD1eMXsXfSA==
X-CSE-MsgGUID: m2PNTPORSsGdbK3z8wd0lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4016890"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4016890"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 21:04:35 -0800
X-CSE-ConnectionGUID: Qz4rqQ6kQf2h2AKf59Kr/g==
X-CSE-MsgGUID: f8tttxuvT/WafvwmGuvWUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10550778"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 21:04:34 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 21:04:32 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 21:04:32 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 21:04:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQ3eCbAbS9Rvi+O9oFHtuZnp3j6fUJoZlOKLJjVa2/PVkiiosYHAoOPi7zhFCWO58ePpq15Y75eC2s5dNyFXhlR2aYfGEmG/RmqoPhlu6t5WfLV9cSAwSixAMJYP4CfweO7nBgi0TiKKW21ac7WWeNYIBDc2rOtETL53scPnao3wrRYOeftkaWEUkR5pyn61sZ6viLMsuWuusQoAIHN3RC/w8Ur86Vu+JkK1kNGzUIF6QtfVRsOVezFyz2Ev+Gqdz302djKy5yy5XTpvn0pc8x8tsS6ZyieyzCxt99bF3r0/x6fVHL4pOxgGWR2yBnU6lvnjMprjZbiQ2eVJQnSXaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6qs+8UkEjXUKxseSD4KcKrQp3Z/EptTdoME9NS1Ppo=;
 b=yewPzV7nz8Z6Atl6UnNoRyynMPad2E1KYTUCZcgDgq5f5Zlb70xR+LyzdEvFdAWX0xrvl4WntXTGGXQdmgewQacY+95jGEERkjODWixHTXZ8rRdkO8EOok8tE3gQMQEd91uRqEx5neMwozqR6QBy79SzUH6w0cSg0uWVa1QGoVo/2fZ+m8OxHprOCyDYDT7UOos9NPaRBetkTC5WKyyuePOEMDJSBTIFhrctRjU2puzHRLE55oWBYFTPID2siRZwCL3N4KhDUKUhy8+x2s/huWB34SKK/6Ari91WZ6sB3LBbFMvp+Cwt8MPEZnZ06byXWLpJDDbtxTfl3ZL1qsMtew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6qs+8UkEjXUKxseSD4KcKrQp3Z/EptTdoME9NS1Ppo=;
 b=isQHIa6btjPqGvlnnZiE+GqGCRJ6mvyYiSZhtIcJLnFot9mSFwlcyFJmPrBxjwGV7oMzjJq1NS/TTNuphD0wUXdv24NUclxCwiFUBHKQTCzZHIpgbugd67mpvyJpJ4wzjCVeHzGcvtq67I1/vHe0WQaBrKdQnPnG2q5rlx6g3U8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ5PPF50B3E12BC.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::828) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 05:04:28 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0615.009; Fri, 20 Nov 2026
 05:04:28 +0000
Message-ID: <b06e1fc2-87f1-4004-8102-c8cc8928345c@intel.com>
Date: Thu, 19 Nov 2026 21:04:26 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
To: Tony Luck <tony.luck@intel.com>, Ben Horgan <ben.horgan@arm.com>, "James
 Morse" <james.morse@arm.com>, Dave Martin <Dave.Martin@arm.com>, Babu Moger
	<babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>, Fenghua Yu
	<fenghuay@nvidia.com>, Chen Yu <yu.c.chen@intel.com>, Jinjie Ruan
	<ruanjinjie@huawei.com>
CC: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, Peter Newman
	<peternewman@google.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	<reinette.chatre@intel.com>
Subject: [RFC v3] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0346.namprd03.prod.outlook.com
 (2603:10b6:303:dc::21) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ5PPF50B3E12BC:EE_
X-MS-Office365-Filtering-Correlation-Id: e327381c-dd27-4f93-25f4-08df46c3c0ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|18002099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|260925022911599003|260925021911599003|260925021311599003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: qM39ZR4vtH1ZJL8sML/l3xp56ro9IUaHOBsDSgJhqpOX8n3vE2MG0f3iJb7Quw1DqsJqZXaW/rGUaaLax1HjsNCyVr3Gq0g3QSJNgnuOx+JL1aXGDKkjKBcPFjKfDKCSNQS/oJYLOpDnP/7Cv+yvFPGlfrFeUunFjY/yttMCpE/yOSj1gcBsin5oVlMbMyWTD/sy4ZviBk498A15K+Di9kqz2RjnjfRpIkxMkHN5tmpgNN9t9hAZTJNzVbgbvnu5NJNDmfVhW1KMIYJY9HBBrDFYo3LqE1TUo/MtweGLkwbnacD8Vo5NGFcsUbYpwn/0+89hB7qyDGqhtkGhaPmi+itKXg5/pKTfxUBrejb0E8RHKMFn4OIEIvIX5AwFCcP3+A9h+7Dj4IWZFdMkNlOmpZbDpEYmZjtekNTD5ja4nguOlMLIrZQkvU+K2DnZrfbLFr8e0NJtWiA2KcyLu6gQBrjaL6v6+mkhfviZfGTRaYLFPsjbMnZyJvQZSxTK8pcPx6Y5OqhEsvXgZZvinxJiKVTyvmW9502zlTsfj849wHYSt9E6AeqnLZtES2oi8kFW83WMxyjj4WfC/ysaYK9F/oqdPYayQf/+/DGBUu2t8a+CBsZ/s0Asdx1enY9fTaVP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(18002099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHdhc21UMEF6RkpFaVBlVkJoMVlMMUVOYUxsY2xpL1FNekNDU3JRcE52b0d6?=
 =?utf-8?B?VFlQT2FOMlpXUXZVTFBOejVOOHE4N3R3NmNYa1Y3MDdyNlBvaGpRWjhlclpE?=
 =?utf-8?B?eEpyTVdwZGYxVm1zQXQzeDFTTHhrUVd3Y1FmOGxBaGxINzN5T0NZZlJyZlJ2?=
 =?utf-8?B?SHUzTmZRRm1vbFgzSjl0WGZhTmtCMXBpcU9jZUhqWlhoM2VjY2tQeGVDdVNP?=
 =?utf-8?B?T0wxVWxqQ2JqbGxBdll0VG1wYjVrb2hFeXFwdWs4WGtnNjh1cExwb3REazg4?=
 =?utf-8?B?NXhMWHRUeGpBSFlOY1k0YVlBbDlyL0gvTjFLaDBVdDFXM0JFRzJISDkvbUdH?=
 =?utf-8?B?dTBuNjgvZzNuY2I3ejlJT2g5cDM5T1IwNGlxUGlya0dNVFNiOUQ1L0VXMGlu?=
 =?utf-8?B?QnlySmJncnlMS1dkOFNaS1d4RkNVUmNIRzk2ZnZiOGI5THdGMTU3TzRaUm9M?=
 =?utf-8?B?VVVhUjUvWm9QV3NjWGVQY0xnd3hycGhXZWRTL2RVRDdaazBlZnNvaGtQRUlX?=
 =?utf-8?B?cFdieVBHVC9qQzRqUXlRZTVBWjQ0cFM0MGdWTGxLb0lPWXpVUGpwL0hFWFAz?=
 =?utf-8?B?emdFUXIrK3BlVm9GbTVHWUdsUnJ4bmpsUUY4OTk4VkprNXVPQmJoWFdWdEhG?=
 =?utf-8?B?cmpKTjlpRGVmU0tMUGlXWEs5dzByTjl4OFdoV0Rvb1ZsS1ExWnZRY2ZJQ0tB?=
 =?utf-8?B?RS8wcFJKOE1pK2NidlVkQnNiaFRLR0pxOVNxZFFpUGpIWEgxRy9yZEdSR0N0?=
 =?utf-8?B?T3JuWmw2VU0wZnM0bFJ0VWowUW5CbFB0UnhRUzE2QUkzZXpXaUdBK3JqZFZw?=
 =?utf-8?B?emloV2ZxOUp4MExjRit2UVBDc2NLU0hVY0diZHROazc3dTVDZll2YkdUckJG?=
 =?utf-8?B?SWt3VTV3NkJMczVVcis0VEZsN0QxQytoYysvUTNPQkd2WHRmMlBrbDJwcVgv?=
 =?utf-8?B?QXY3OTJNVFBqeWFEVU5oOEplYUpYd08wRk9CbGl5UmlyUWZKT1pmT21SWWFY?=
 =?utf-8?B?TGd4d0FtbWhhdXFCc1I4bkd3U1FzMmdpRnVnMFdXY3lnWmM4L1R1M3JLc085?=
 =?utf-8?B?MVYxMmE0SnZiZnNYUnhhaXdOUDVVcEJpTS9SZWZlMDl2UUhjYzM2eVZ1Q09y?=
 =?utf-8?B?cnVnMjU4MVRPNXkvdHJEcjBtVERUTzRjRGV4eUZTdGxoQTBjemRHMjYyNUNI?=
 =?utf-8?B?MTBOSkk2ZzlrN0wvMjhqNEY0OVNLcTI0NFI5WEkyODRYaHo3YTBLc2d0UWUr?=
 =?utf-8?B?MlcwamFDV0JSeWlDOHM4T3JKZFdPSDZUMm9YMHJBTjBlME0zcE11R0tSOUJR?=
 =?utf-8?B?OVhNa3NZMU9vZ0VCZy92QzJ4cGJPd29uR3VuNXE0QUY0dEZPTDZpOTNLQWl0?=
 =?utf-8?B?alNlaFp1OTdXcGhBOGpjSFJqRlR2L2FFWWFlRTdvM2cwSDMxUEtBNlVQSTlm?=
 =?utf-8?B?ZTJockZwT3o4aW8wTlpPaHdhNlR3UFdrSkN6OGMydGwxNGNyTVY1UmI5K040?=
 =?utf-8?B?RG1RdGhGblordkhnaWlxOHdyajRwNnRDVG1LVkRMenZGQ1VOY2V1ZWl0SkpS?=
 =?utf-8?B?cE9xaW5yZzBGbmhneDhxU21uTC9ESnhkSlhWRDMvdjVRWVY1R29DdnowVVJt?=
 =?utf-8?B?UXR1L0g5YnBJM3R6ck9oTGNSS3pseEQ2TTFEN2M1WG5NdXhXUlczR2NlQXBj?=
 =?utf-8?B?Qm9VMXV6Q1BVMXFmaUNobmR2MzB6UDhKTzVJU2UvejhkdWpnbjB4M2sxSWdS?=
 =?utf-8?B?b25LSUk5TUU0aGFhSHdHNFZBUDVRYkxyc2VwZlVDSUdXVnFyU0podi9aRGYr?=
 =?utf-8?B?QXJOSWxJeThxNzlUaEswa0VaL3IvdTY0RlAwN1FhU25QTW4wVUFPRVd6L3Zw?=
 =?utf-8?B?SytzVnhrNXJURU9SZWdUMXBQKzkrSWtDQXJoTm9HYVIvb213dHE0a01PejhM?=
 =?utf-8?B?c2JRN1pXR2lUcUsyNnc4bGg1dGZRd0dSazRLL1kyR3h5M2xOdVpxUTl3dHp5?=
 =?utf-8?B?U1BCSEl2YnJ0SHpLNWFMcWhqUGpheElKYlVsMnZ6VGtkTlJpZ2NZZzdXQWZj?=
 =?utf-8?B?UlI1L0VtRTczLzZ0bmVoUFJtbGZwcUh6RDlEbHdyK2VxdFdKd3UyUnVlb1k0?=
 =?utf-8?B?NE51OWJNbXJGTjFQWDRNVUcvc0ptbWpkVUQ4UVVDY3gwTEl4aHBzMHZrZEFI?=
 =?utf-8?B?VE9yclNSaXlXSllMNnB5dzVaTnQvYzlXNjRwcVZ2ZnQ0dGpYcTJDSlhsVTZt?=
 =?utf-8?B?bStBTm04ZVNvSU5kTjV2bStoVFlXSHRrdkJaekcySnN4ZVVKSzkxTTIwM2Qz?=
 =?utf-8?B?OUI4RzV4aDE1ZHVkcmZQeHdqbEEzZXVjWVgvSFlFWWFQUG9kZitWRURSbEIy?=
 =?utf-8?Q?137ZnH4bC6hZud50=3D?=
X-Exchange-RoutingPolicyChecked: AIBhK3OpDGKcYsQj8wQlQY1acQGnPhoNF0aOx0iKnq2ipWvdnhRqcy2YEaZ7EnrVHu5N9K56W+hZTrTjkKMzeV064ru1ubRaWnCoKV4N42uW6gnlwJtviGMPmxScaLP2/69QNHVt0x51AkSDNHlpMn1kpSw/UGCSIZHnvFGRJbZgzuWZJI7uDbRoipi8s036iH1VEVIoFF47yYlQ9Nj4DAjk8/havVHnFWw6hHvs2A5IUqiSzMQbObiLqeZnecgIzoNdHzqSFH41BemfdkoWoJZfaBIDyvm/KYVQMrF1KAv9+OKstfkVGoqpIwbaO5NJICGobSlEk+j7sa1Jx/fPTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e327381c-dd27-4f93-25f4-08df46c3c0ff
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:04:28.3894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08k5BybGayhYMpwC2cL0hIRmlvvEX6vvmXYnhEGGAO8rI2nblsLk1GZXvlMr29c9vCKa/IKsWjyX+6ZQdwv5Jq1/RByDe+1r6jBii7KUimk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF50B3E12BC
X-OriginatorOrg: intel.com

Hi Everybody,

I believe that discussions around resctrl's upcoming support for multiple
controls are starting to settle. This RFC aims to capture all the remaining
items in implementation as well as documentation. Please point out to me if
there is anything I missed.

RFC v3 of this PoC can be found at:
git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v3

Please refer to the documentation patch for an overview of the planned interface
changes as well as user space contracts/expectations:

https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git/commit/?h=resctrl/controls_rfc_v3&id=95ff9ff7430095cb7264946c944c750315db73d9

Remaining opens:
---------------
- Ben: I do have a question about the formula used to determine the size of
  a scalar cache control. Please see patch changelog of:
  https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git/commit/?h=resctrl/controls_rfc_v3&id=8695aab0997d5aa60e104374fae9701f51156c18
- MPAM only compile tested.
- The same x86 "SAMPLE" code as RFC v2 to demonstrate emulated controls.
- Add relationships between controls. For example, cannot set "MIN" control
  value to be larger than "MAX. Unclear how to do this in resctrl fs when
  considering that the relationship may span between emulated and backing
  controls. This is potentially something that needs to be managed by architecture
  and thus potentially without a consistent failure to user space.

Changes since RFC v2:
--------------------
RFC v2: https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/
        git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v2

User visible changes:
- Make scope a property of the control again, now in addition to a separate
  allocation scope of the resource. Expose the control scope via a new
  per-control "scope" file (L2, L3, or NODE) that tells user space what a
  domain ID in the schemata file represents. Needed to support AMD's GLBE
  and CPU-less memory bandwidth allocation. (Ben and Babu)
- Name controls according to the scheme agreed during RFC v2 discussions:
  <resource>_<resource_scope><control_scope>_<control>, with the control
  scope dropped when it matches the resource scope. MB and SMBA carry their
  L3 scope only implicitly, so their new controls show it explicitly, for
  example MB_L3_MAX, or MB_L3NODE for a default control at NODE scope.
  https://lore.kernel.org/all/bccb1249-e722-451a-9c75-8aa846713045@intel.com/
- Report "max" per domain in preparation for systems with resource
  instances of different capacity. A bitmap's "max" no longer has a "0x"
  prefix. (Drew and Tony)
- Drop the "min_bits" file. The "min" file of a bitmap control now reports
  the minimum number of consecutive bits.
- Only offer, and only allow switching to, "native" control mode when the
  resource has emulated controls. (Ben)
- Only allow cache pseudo-locking via the default cache control.
- Display the "size" of scalar cache controls. (Ben)
- Stop reporting scalar control parsing errors as being about "MB". (Ben)
- Document the control naming, the "scope" file, that control values may be
  reset on a control mode switch, that legacy info files return no content
  in "native" mode, and that non-legacy resources need not have a default
  control.

Other changes:
- Require a control and the controls it is emulated by to have the same
  scope.
- Require only legacy resources to start in legacy control mode.
- Generate control schema suffix once during initialization.
- Fix initialization of the list of emulating controls (Ben), clearing of
  staged configurations of backing controls (Chenyu), and Haswell control
  initialization (Chenyu).
- Reword changelogs about CDP, allocation size and the bitmap control so
  they no longer suggest resctrl will only ever support one cache control.
- Fix checkpatch.pl issues, subject prefixes and changelog typos.

Series structure:
- Rebase on:
  - x86/cache branch of tip that is based on v7.4-rc1 with the queued
    resctrl cleanups
  - MPAM domain separation that was extracted from RFC v2 and submitted
    separately:
    https://lore.kernel.org/lkml/cover.1794283825.git.reinette.chatre@intel.com/
- Squash four patches into the patches they support:
  - "fs/resctrl: Provide control to cache allocation"
  - "x86,fs/rectrl: Provide control when requesting arch to update a single
    domain", which also keeps MPAM building at every patch in the series.
  - "fs/resctrl: Expose bitmap properties via new files in schemata folder"
  - "fs/resctrl: Include emulated controls when determining control field
    width"
- New patch from Ben: "fs/resctrl: Display size for scalar cache controls".
- Move IO allocation control selection, and the helpers that display the
  new control properties, earlier in the series.

Any feedback is appreciated.

Reinette
