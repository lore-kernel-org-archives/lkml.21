Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795639651;
	b=CRCPDlDd02Ie6P5dlDu5yQbKaJe1aH/Ir7bF8rF2baF5y2f7X9FrAKDekmXW05aD1q71
	 bjKlf8SThAcxoMMHrg4i4kq6irOn5/c59sLMtkQtQ+OdrFSR8P03Sr31Pqo0FVyHYnXPp
	 skbGaK/WDjr3KjbzMue+VrQbPuuOamhjkCY8xoQSgN5sjJmhSitYDxEhkLO2Mn5bN5RUe
	 +QvLwhaf9LhXMVDRWOX9hYgdT+SlnpDStciLiPxjH29OdvoynZyB7yZLRPKs/+tWSWdJ8
	 ePg9B2H3ZSFGt2yJhKaU7h9/ZPazqY3M+Jh594cHtJDECmAUoS1X6UM5rDptjHLqMqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639651;
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
	bh=tLusHrOgcmoC0qAKYHj+42Lp9wajqTAZ+Ng8D23vfOs=;
	b=DUlBsff6q0jK16QwSC4cxFPWSXoT/WgmHklW/mswb25UD8g1n3QfdHlrlT2fnxwwNf1m
	 /R46tdi9NCwQpNzczFAn2PiUEr6OTusmCCnlmhyvoO9yl9q8etVoqZjAZ9JiRfy8tPLcy
	 dr9QP34qTKLKcNvGaR/eu1cPVrrnLqu470ojpvSWMPFRz3z+qbeHldNKBKYFBHY9E7W4m
	 xS0wTf7RETgUnI9HbxwDFW0uqgIb7sRB9vWCewEnd9Qo0h1kCn9X0k6B71dvxxhJNOVML
	 HryttatjlvP2mF211itI6dJI3aVbq7LEz+DKoUScA8OwK1i5JKMxndVKQzamrA4yy7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NK5wZYAc;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=hZadFnWs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5913606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5913606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NK5wZYAc;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=hZadFnWs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795639651; x=1827175651;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PR544OyDnSTeFhryIKW7WpyFsPy4p9meBR1OBWTuHGQ=;
  b=NK5wZYAc1T9Ivtz3Lz7hzJdMDvrPFz4LTvqrB6iun39ogZccSJYFIyuE
   bnSvqY0cYdb1bitsw33T10Rv+YemUx44Nq1SlUL0TA93BRHkm/oi+7I+x
   dzOS9CeXldsp4JEYTGKvQz5zUOVwb7UsxMgjiOTPs+MVOVvdcREHgzLjr
   yerDVcQzr1Kcxc8ZDcb8UD5eWxvmTKmKQeyAPpFnFA9oPReJSmFwIs1pF
   em2BY5bY5HxiK35Ty+bvhslI/08Cr6j3fGfMf4VPB5lce8+sJlQNJTY2G
   7F1EC5aKNbZn3TQd6Nw9N8axbtBUYMHoc/m4KtgPTKeOn3yf+xlZhWAo1
   g==;
X-CSE-ConnectionGUID: bXiMplzKRpGRQrHNTHMY1g==
X-CSE-MsgGUID: PEgmGoBZT4ay9lT3ZuXsmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4377519"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4377519"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:12:47 -0800
X-CSE-ConnectionGUID: tn52dPpSQeabA0WviMB6sg==
X-CSE-MsgGUID: 6fhxmUXOSra6U3nW1L34Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11933940"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:12:47 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:12:46 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 11:12:46 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:12:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPd8VC9PIWpbVDex6JHUaC5f0dI/7bZmpdQa15dISFF2cx+EFIyvU7z/KmdRa15yaPj3qAZ+bEZaUAGbaUzJzYdcKO19wIY5Ri15P/P/SXYZnEpftTaL6RGR7nbdLCw8WYZ8FlDzluL3V8GZHQdVC1stq0pMbGLvAiMLRW4gGf+Mz9wtrUOwogjURJ5scKj3yJCXj1jY699vI7ynfPZoHIrjTyhjIVOeZ72IofRsxvNxBQOmXEUOCcrtL5oTv+Oig61X0h+BaNVWFsMzTGICjChDmKls3TCAkquSLBVt2XVF2XwlOX1XmAwLlbl7+gM1L0mIBdyZd1PoaKw8Ey91Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLusHrOgcmoC0qAKYHj+42Lp9wajqTAZ+Ng8D23vfOs=;
 b=cDGsIfnwQvlD8CXNOJdD7vydlOLODgGUuUgHuZBuCD7XKi8o/gDQ28/bQeM3t0KHj0adsxUELXcWOlvtnaHMHW6zcyEAv+mW0n+RCphej5gB/Hi/Hf3qhsc+/osOke50FRiLb4UzQSP8o1Qh+BTZ6bstzXvlYRkwTaMkoh5aG3JF3SeNOpYSGSyC2hm72F+hkO3AqPDYqqGkA+9GXffZnlDnU/KW9UKaMk7tt5gdPcB3zXyDXhfu7/b2UvKajWmnmExgL46OhvbUKBYscN/Zrq2RTIXJjLonGHx15GJdCWvR4hTND02nihjP/G18MO2P9eeh1NA5CYw82zGv+pYaRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLusHrOgcmoC0qAKYHj+42Lp9wajqTAZ+Ng8D23vfOs=;
 b=hZadFnWsqgG/ArpR78r9gdLDmjgRYfvI80vyhCdAG8ROHym7Wk+GsOT3Qf1ZOgEMCFeNEwC19V1pIy9GagXpxxhruUectLyf2orS+/OLXNz+cB/Sc0dcMc+jP4nMva0OOwGHPa1JMGguMwa+iRHzQCeZKC9rqFF5FSwHEReWKZQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 19:12:44 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%7]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:12:44 +0000
Message-ID: <b880dfaf-90d8-4a68-abef-5c96e8da9115@intel.com>
Date: Wed, 25 Nov 2026 11:12:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 11/12] x86/resctrl: Add the ERDT CMT scale
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1793864720.git.yu.c.chen@intel.com>
 <051539a40e662d6cf0a9f0fd35204f23571137da.1793864720.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <051539a40e662d6cf0a9f0fd35204f23571137da.1793864720.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:303:2b::27) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 5923199d-535f-4052-9b01-08df4b281575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|10067099003|11063799006|4143699003|56012099006|261022105027099003|261026140227099003|261028144727099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: C+lD2Jd9fcoTBJm79Ulq9Bed/fM2W+q0aGvVMWPVXP5OZkAkM47CsXjEvQrhOQgZyoOKNu2qQVjPlKm6tM9EY6qFVv/Cdd8GfQuDqFIKARTFMTdVwTOK6BzCeTtsFZrTYbXN9PorMuIQjq9Pk8fuQBJ4dIo+7f/yLD2TmBVINprkatQk7uDIZom1YWdHFxa3mVKNoXzGp37jIrEZpeKuRO8EuKprcYPPXG5ltMkAK6ZoxEhXKDqHQGZMjFL+dPm3DTxaRqzFADpRPEXjUzwFhPSzwPloSB+tVa6aPEl6NM7dpLTgfA4OyvVzS+AFJlgstYUMgS8n1nDC7KqKn/yU5epwDWl+N1V3LB4EGSuW4rJ4hpzSGiur5o2A3OVaP0uk2Axq0kRN3p07ZOYTun2Amsgbo2LJ5hHfhoQeWjV8gXxQC1SaJ7a1PgACrfaWUjXBZij+zKzkT9j6hJCi40WR9ifyzCp/eeanNt2KYfPabsyGDizsN8XqoANhUJo75fFp3RhypjOkxvl6B06JL9mwO93HngRZm/gqutoOKA+8g1orRUVGNLDdXHDLhNcUsAkPLdqK3HbG4DygFwPlGh354XsqsMgeMjpcL8FMN9y6ccxowgorLHTMwLVQpDiPN70uzjuorIwEAyAxpEKzc6iubHd+jt2bs8BtE689UzEOvvE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3l0VzNCNXNIMVZybm9SK1FvWFlwNXdvZVZxejZVVVIwK29zVnpNVVJKUjZF?=
 =?utf-8?B?cUlpRUlvNDlacUFkNmVrS3NTamxMaG4za0lPOGJMZlRBRkRONzR0ODViMXVn?=
 =?utf-8?B?eGZlS2xqZklFWGY3bTBGZVdrMzMvOG04WlIwOFRLeHlOOHBFRGpWazljb0lM?=
 =?utf-8?B?YnA1M2Y2T3ZoNUdBYWdMZmZPNW9Ub1JLcU95OE1BZzdOekdCSS9Kd1Q2ek05?=
 =?utf-8?B?dXhHWmg0Z0JQd2RvSmxaZ2RRNVdzbVRWbjQzVnlmaUhUNHB5WUF2dlEzdUtj?=
 =?utf-8?B?N2k2RW85eCt4dGhYWlNMVWJXdFo0SFVKVnEwb285dFluVm85dHEzMVBwc3RI?=
 =?utf-8?B?dnREQnpjVmRjblhVRElacXdVbXVrUUVYcWZ5RHJXS3NkbURNTWkrSVp5Wncr?=
 =?utf-8?B?ZU5qbnFVRHE2ZUIxRmxRRUxKVjZGaml3UC9sWms5VWJOQUFiejZKbjBFQjVt?=
 =?utf-8?B?cDA4ZWRKVS96OU1veDQ3azEwcHRPOU5zcThvZ3RNVEZLb1VScEZKT0JVZ080?=
 =?utf-8?B?WE5YRklsbGR6TkdDTW9pQTZUdlFxRDBNaVk2M1A0OG9KdUIvRFIxbWRFR1J5?=
 =?utf-8?B?Q0htOWExa3FxWXI3ZWh0VlM0dUwycmxvYTlLWTI5WkcxQ3RYdG5aZ3lCNnJP?=
 =?utf-8?B?ZTVHTTh6S3ZER0Y2bklvK1hoTGxxa2ltUVR4YkQ1Y1NTSFBjeTNVQXIySzhK?=
 =?utf-8?B?NFF6dWxON3A2ZXNxcXlId25IVVVBRVZ0SndGcmd5cCtlemNWZEgrYkNtZG95?=
 =?utf-8?B?V29McXh4V0ZrUkJqaXF5MHBkWmNtNXFuYlRYV0swR0lwZzdzLy9jODVFN1p3?=
 =?utf-8?B?YnY4WTRtZ2dtOXNqSExPamRQZkpnSCt5c3Bha0RKbk9kQVJmbVVCbWZjd2VB?=
 =?utf-8?B?M2xVbVBwM2ozNXQ0RzhhUWV4bUl3YnBoS2RwVDJkTTBqWk5WbFRsWWg2T3l5?=
 =?utf-8?B?enZzbW1MNGVUQXdOdXh1Vm1TMkpGazM0M2N1RVE2UGlPckozSDBRTTR1SktN?=
 =?utf-8?B?UmtaT1ZBNGRobzZmRzdSdUFCckk4ZXNqZVBGRkV4RTFRM2pJVktvRlhWWlhs?=
 =?utf-8?B?SDhLVzJjNEFTTit4RmF3amVQd25vQklwZ1J0UzIxa3loTDd3SVcya29wcThU?=
 =?utf-8?B?MFllUDFXRHh6YUhMWjJBSDRwUFJPbXhhQzBSbTFkeVRNMGxUa1pSZ2QyVUxM?=
 =?utf-8?B?S2hFbnNKL28va2cxRjd2emkvZ2Q2MUdKK2F2dHE2dGc3NmhDdE5VakNQbzdW?=
 =?utf-8?B?OEVneUhXN3BCTzFPa2ZSSkN5ekFwSjd0eUd4dEdYZ01lVHRHZzJJS3dWbmxP?=
 =?utf-8?B?cm1qaC9lSWlDanN5dHNxNEZvZFlIZktGVWt1YkVqVktiYkVsVUl1Z2tQcy9i?=
 =?utf-8?B?R2RVRzlSSG5uaVNQdStxekdma2NIV2tuL1dFdnVTdVJ0RjZrK1Raa2Q0YjVh?=
 =?utf-8?B?U3dsNGIvL2VsNGphVkEzYmlHTlkvZldtbkloTFBrNXZ6V1puaDFNQ3BNbUZB?=
 =?utf-8?B?T1BrbVI5NFo5b2VSZ0tXSmQxSlFnNERqSVNSVmk3bnlVS1l6UENXaW1XbHAv?=
 =?utf-8?B?TWpNY3dFZHU4b2k0a0RpMko1SG1nZGYyU0JqZlA1Z2oxNjQ3VkgxSlNFODZX?=
 =?utf-8?B?anVQakFERkZjRXdoZDZoOFI1Zk50enM2NEtKeUg4ekkrRlZkZVJ1RDkybE5K?=
 =?utf-8?B?ekcyZ3hFSEdVSjB2QzNxL2FQMExxY2Z5WWhDVC90c3o0ekV4SjJPTFY2RUtz?=
 =?utf-8?B?QkpLSmZadWhVb2I3NnFzUEJ6L2E1cnpWbjQyVWw1OU9FQ1EwVWJEb2tSYjg0?=
 =?utf-8?B?SE02OWZwMlVaRmVRZHZNV2VZMnBQQXNsZFZIdmlLMmxpL2I2dFh1QXdmeG90?=
 =?utf-8?B?YTdGRDd4Q0k0T0toLzArT0R2L0pjNFI1UHNwSmhValpacVlYUk4zZlRHSE5S?=
 =?utf-8?B?Q3E4L3EreGgxc1FKMzRPUml0T09YWis3L2NTdnE5VTlYaGdBbWtzcXU5U2o1?=
 =?utf-8?B?Q2RqMk8wUWZrQzJzMkdKRnp2cG9jK1BTZStGSnJXTFQ1NUZoa2VBbkt1dTNW?=
 =?utf-8?B?WmJVSVl2RGxMUU1vb2NpY2c4eWtEb0RQbG9lTkRDYndvZkRCSGV3eml0dDBh?=
 =?utf-8?B?WkZCUGhKVVpSQndLNWsyaFAwMk1kTTNOdEtWVkh1czhFaDQwS3NsUlpKVHB3?=
 =?utf-8?B?emx4eWh5M0lkWnRzTDEvM25PSVRCcDgydmd4eURQM3k3MTdGMEwzYTBoY2c0?=
 =?utf-8?B?TERmeE9kdXp2VHN6N2dTZWpjSkNNNFl5Rk82Sko4c0wxdWVDT216cCsvU3Zl?=
 =?utf-8?B?S3M5ZnYwOXpFcWtvVDV2bkcxMm1ERHFoKzZsclZOU2swS1U3SDRVY3BCREVy?=
 =?utf-8?Q?UqkyYX44tuN5Txr4=3D?=
X-Exchange-RoutingPolicyChecked: IYK2ZFzqmNOO3igReTR5TLLG3woNl32+GN/k87Jnmb4oE7NgMQDQ6FhrKklaBeYvNziJuh2Gb1bwTCE5krs/RrzvWfkM0n6OVnSmcbfqsfb3nFFKF0GQRZgOb3MIzi85gDLVj6j9qgHC94bVUmXxb86jwx6pZR5t5hgrF8tK3bG6Ot6Zc6vG7f0OGkXL2sj2hb/ymuWgHXMAiUAdttAPXQIpKtnqAtnuvRf9CW9KkrLhvtB7O/lv+k5ElweQEEWHek0GXa6zfjaD/XIav68EsD+/fVz/YyD0xHiKaQxZJ/7bBDYU9RzR1f5LrWp0JtghnKRCsSIMxIsDr4bU+NklzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5923199d-535f-4052-9b01-08df4b281575
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:12:44.1871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+BNt5GXasueZhxqZIFFe3Je7KAysmiHWD9a0cc0f9TvJwCpOK4J65CS/sbPIg4zfK5Vp43MSpHQcFoJ7ORm7C+4RBdfYy6Z2uxPzyuWRmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
X-OriginatorOrg: intel.com

Hi Chenyu,

On 11/5/26 2:09 AM, Chen Yu wrote:
> The limbo handler polls the LLC occupancy of limbo RMIDs and makes an RMID
> available for reuse once its occupancy drops below
> resctrl_rmid_realloc_threshold. User space sets this threshold in bytes by
> writing to the "max_threshold_occupancy" file. The occupancy counter only has
> the granularity of its scale, the number of bytes one counter unit represents,
> so resctrl_arch_round_mon_val() rounds the written byte value down to a multiple
> of that scale before it is stored in resctrl_rmid_realloc_threshold.
> 
> resctrl_arch_round_mon_val() uses the CPUID-provided scale. LLC occupancy read
> via ERDT is instead scaled by the CMRC up_scale of each ERDT domain.
> resctrl_rmid_realloc_threshold is a single global value, so one scale has to be
> derived from the per-domain values.
> 
> Add erdt_cmt_scale to hold the largest CMRC up_scale among all ERDT domains. Use
> the largest because rounding is a floor: a larger scale yields a slightly lower
> threshold, i.e. an RMID has to drop to a slightly lower occupancy before it is

Regarding "a larger scale yields a slightly lower threshold". I do not think this
is universally true.

resctrl_arch_round_mon_val() computes threshold using
	threshold = (val / scale) * scale

With an input of val=100 and a sample of scale values the threshold could vary:
scale = 30 -> threshold = 90
scale = 40 -> threshold = 80
scale = 60 ->  threshold = 60
scale = 100 ->  threshold = 100

Above shows that it is not guaranteed that a larger scale automatically yields a
lower threshold so perhaps there are some built-in assumptions in this implementation?

If all domains actually have the same up_scale, then that could just be enforced
directly instead of routed through a max that is not actually a maximum?

If, instead, the maximum scale is a multiple of all the possible scale values,
which is the only scenario under which the changelog statement is accurate, 
then that should be stated clearly?

If, instead, as the changelog implies, scale values can be arbitrary,
then using the max does not seem justified. 

...

> diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> index 107d599bf586..3d34e1050794 100644
> --- a/arch/x86/kernel/cpu/resctrl/erdt.c
> +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> @@ -36,11 +36,30 @@ static u16 first_rmdd_domain_id;
>  /* Largest RMID that is valid in every ERDT domain. */
>  static unsigned int erdt_max_rmid;
>  
> +/*
> + * Used only to round the global resctrl_rmid_realloc_threshold for the limbo
> + * handler. resctrl_rmid_realloc_threshold is exposed to user space as a single
> + * global value, so ERDT uses one scale derived from the per-domain
> + * cmrc->up_scale values. Keep this single threshold conservative across
> + * domains because the rounding is a floor: a larger scale yields a slightly
> + * lower threshold, i.e. an RMID has to drop to a slightly lower occupancy
> + * before it is reused.
> + */
> +static unsigned int erdt_cmt_scale;
> +
>  bool erdt_support(int flag)
>  {
>  	return false;
>  }
>  
> +unsigned int erdt_get_cmt_scale(void)
> +{
> +	if (!erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))
> +		return 0;
> +
> +	return erdt_cmt_scale;
> +}
> +
>  static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
>  {
>  	void __iomem *addr;
> @@ -256,6 +275,9 @@ static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
>  	else
>  		erdt_max_rmid = min(erdt_max_rmid, rmdd->max_rmid);
>  
> +	if (domain_info->cmrc)
> +		erdt_cmt_scale = max(erdt_cmt_scale, domain_info->cmrc->up_scale);

The above truncation is very far from the check that ensures the truncation is
safe. Could you please add a small comment here?

Reinette
