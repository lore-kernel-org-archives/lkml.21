Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795703336;
	b=xblBh4medvFPlYpO9aCVn1GFga/3aUmscq0yKtCS7NTyjbkSRXC0LcVmjcsjK+O/vSS0
	 Whkzc3C74hASmMm7ZaY3yqoU25/Kh0igiIBENYYxWGM5uxSZe+DkvmpolWblUBhRG4tyn
	 Cwo8CPQfmwKoH2xZ9bhGvHciberozc4HVYzO0kfKDMLSMHm7noKVO+VJpnAxk5bIRtsgW
	 TM/NE7gnU6503dN4xGqk3rceYyXsB+zwSzbHVJpzkqnt5Dw85lp3mTr7Jek6eqksQdyvK
	 LMl0Ytq69o2RIMv67AtbeV7XqtTJd+1oUZN4Lmc67MVqBgu9FXDj34VVhglDX7rsyvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703336;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=jWTIDyOYluJ0uL3znrcXPWGfRrFQ19+Y9zadL71wj2g=;
	b=QlrIijXEZNYf+CoYGWZzHWItM6ZU3whwaMq/ztMh4CtjBYkcgJDqqpA1TvIVAK2LB0aF
	 j/h0TQUL3PUwcITLAclIuZMg+lkaBJ9gurEhV1eu6fW29d+00mgI52fIz5atIhosySyT/
	 jKdlFoJkxvz2xoD+lb95lNLVv1z+duJCPPto/maDh0OKMiLl8GcN/wtFu8JXyegPtEhCb
	 XNvbwZxRri6NhNLX4fs4mftHQ0QOtuzKOLhfQdm41TtDCcMv0iEcLqn0KyGWvAe6S0BWT
	 gcqJpaljTxZ7g56obTVtK7SgS1XkOxhJiPU2WH6LyLhYRZ8lvpJOXxBZNSnubbPHDyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Xc/Ao1vk";
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=FqVtpiP5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB80606A69B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB80606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xc/Ao1vk;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=FqVtpiP5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795703336; x=1827239336;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=s0xJ2TfOMIPSkGejPP0IzUYa0pENHYVU0KM6wvwXZug=;
  b=Xc/Ao1vklzbldjZUydCWB75oZD45MTcvBOoDXTIQ5fbn6m4AnrA0YlUv
   ZnQaWUgIvQOZ0xzlB1AIlP2QHR2TqTnpg6+ZJ0ausyXI9CoiD8V05JxGL
   tqjVB7Ug2CFdNlGO8oVN1OHsWwzLerrcJsNb8JPwTrQDvag/8xTHdIVx0
   bCA2jo9h9h6WVjK2N2OYWva0QzO0tJTWn24r9OFaKVdV2z/5+vFkZKw0p
   y08zI+C5/rJ+mG4h7qigAAAcMv0F7ELSl+1HjYr5+uxJgyxsm2fW9Urah
   tBnw+hyoKaKGBcvj2EkEiIS4MwiJn8ohtlC3Vb8C1OJ2VgAgf359R9WLp
   g==;
X-CSE-ConnectionGUID: xzC3J5m/RCSNSvHNuqtjpg==
X-CSE-MsgGUID: OtIxYsK/Tb6aZyxJn1M6rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4702620"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4702620"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 06:28:55 -0800
X-CSE-ConnectionGUID: 8hG+P1PQQiuUNGd+2bq4jg==
X-CSE-MsgGUID: H8gH+ZxDRWqZLfGu1U8i3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12344427"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 06:28:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:28:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 06:28:54 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:28:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NG8x/zpY3xNBa63kK2rPEMoK79ewUM1rs+7+fRhX53SllmOp55XyQ563Q4j9RaNAdwDZ075p0mK8/8UFvN4+b096Zdnhv/Hmd22tmLQLu9QV+D5+IDIUi34ZNPTcmthaaypdl/OltHa7er0HWoDkO0ufJ5dmyQ3+dOYumCzSY3YGFq0WaaLYKnzCdCx2LpXVV520pRuIgpm2XPNHb2ip6olxNhKpmr6UzXVwPWpVWg4mI8uUAhzpZup170vG60mmF2EQ2932srzVU37MI2BieZbwhgqiu00zAcijmzt7i9SXpdVuvvFpzwxdAWu4Tm+AIvGftfJLOdngQLnk6poCQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWTIDyOYluJ0uL3znrcXPWGfRrFQ19+Y9zadL71wj2g=;
 b=eyxAswcOMaSBnuMl1hLLGms+h2VZwgwTKP4tXjMgSJn4h34D86oKbt1BDkcxwOhWCCP0FSzl46RnAOwBFePuyAr4W35hila5C09Bkevig0T490Q0tV5Nu6BDMzwVLRKAqHYl2LilhaZ85wnLhK3HUVYkBbRMiDG5jPbonwh+yA0+gc8bd2YS7vkshHuiiPoiVsDgi7xUAFz/VFMO85bbRT3QOq3jnAJh9IXTDS4lFJKMNLvuyUCJWb/SBqmXPJ2FcevQeCWfn20TwO7mV8dWJo/fYpJ7ouLOkpJ78ATBHQfkBnSLVs6GVSyDB9UmHh04y49ptFz99d+u1AuThHWstg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWTIDyOYluJ0uL3znrcXPWGfRrFQ19+Y9zadL71wj2g=;
 b=FqVtpiP5MB3+/1wn//mdz6HV1Tdnbm4LUOPeWoPLocGQoqhf/Y9F0Ff+n3sUMTBt0r88BUwJcd7bFsBDVBJeJVDfHC2a+LUHOgQHHD7MEG6hrlNa8SshNhQLk6apClR1k2m/j7DSL5qRAuVD7AxVdmBLZzoraDxKR2JAKefNH4g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 14:28:51 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 14:28:51 +0000
Date: Thu, 26 Nov 2026 22:17:49 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 04/12] x86/resctrl: Detect Sub-NUMA Cluster mode
 before enumerating resources
Message-ID: <awg/jUxWakDD4XaC@chenyu-dev>
References: <cover.1793864720.git.yu.c.chen@intel.com>
 <d9c9ff67609cbca8dc840c680425d90191c4a1dd.1793864720.git.yu.c.chen@intel.com>
 <959725fa-d3bd-49cd-ae17-ca0650d4cf09@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <959725fa-d3bd-49cd-ae17-ca0650d4cf09@intel.com>
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|CY8PR11MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2eda8a-3431-4bc9-197a-08df4bc997a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|23010399003|4143699003|6133799003|22082099003|18002099003|10067099003|261102123227099003|11063799006|56012099006|261026140227099003|261022105027099003|261022075727099003|261021121427099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: 45F4Ol52VQL6U5DTwjnRztfckSccUggPJ+499zPGa844q30Q+RNlYrogQW1I4u2u+0s1k4iOg9oA+ov9WcpX8cvCUkSGNSSH6hBuUNl3KiLoAgjZpMWA/HuQQQF7sDee6WXK/q6tB/9x93kGV0fBpjcPUZhZbHx88rGBj2gzEevNeEanf8CbEC7LelrkBn5f0Uhy4FIYPk4AjtIc/3FCSzQp+kcR9KwGfgQpCrsje1X0vE8NMpMR0keTjjuy1hFcS81OH6YH4jzNMBjbJuTDnHmLnWrEjkY/2KsIShAEboWLA4O1Hidh/yKLztecJH4yLytmy/pn7dL29d1AOignOftt0Urum5ZS+/JZcc71MXghqqa/zyu+W3skN59i3D74YbO618rPA17M3bA3r6j0DGyfFYNCAwj9F1T0qbPzoa5IGwUuCPd0ZSIfyOeck0TRMTwKM2grAFd2fZqs6Scjm8VbuCBj3BeBj3ccVQYrzf8Msn+Yf3MPBobDMw5xcSl+YzXDWeGLuTvLGu448r8tGkUWy0lwMR+fMxqxyxHyFfDejBVk9opDQ40bpmmTwXWOat6eklE7bqUTldGluYZqHKpu9jn8UW6u0iy0ZOG26ksmffU9xaU91Uy1lvFj6rnoLazlpfhol5b669aNuUCsEqpI/mA0vI/mFktcqx/x424=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(23010399003)(4143699003)(6133799003)(22082099003)(18002099003)(10067099003)(261102123227099003)(11063799006)(56012099006)(261026140227099003)(261022105027099003)(261022075727099003)(261021121427099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ArLGKXtkWNBqPM/0OhYV0rWUkxk2RKMhE1zhCs3jPN7XdWQuJD6SRft7g+7I?=
 =?us-ascii?Q?39lWwl8LnNYF51Yz0V4X+sd/j+yQD1OrHzvgGZ6kFaaj9pIDaaZFk3ghXXXR?=
 =?us-ascii?Q?eL5QahVoMX/M3ixfi/f3Rmo/f5lwxHTek1mRajxlI6YgUYgpo5OvkXUaanQx?=
 =?us-ascii?Q?UF7s4KSyzLK/gi1TXc2GOmjC4G1QtC7VWY+KHfuF4veULLbeO6CfXSv44Sb0?=
 =?us-ascii?Q?8pObYhp1U5zlTCu0WYLBKW5iEqpTeDz0ht2Qs2XkKy3qFTE4jZwY++DpD/tX?=
 =?us-ascii?Q?9/fP0/by/z65liU9nqJuLVK9Lk8s8GhwO4IgUktHkAfnXAAzN6oloNAeSyHO?=
 =?us-ascii?Q?ewbCnbG+LNoMwTgH/zCwdtq2y+FZbfuZE6mGgFOVNnnV1yLHFdedHd2U/R7Y?=
 =?us-ascii?Q?J3Yc0N2UF2w5/x+chpssBzUSgpDMjKQxjnDDL8dFreqT6/vxKsD3/ZE0+7dR?=
 =?us-ascii?Q?fD3mxoMgE4EGJ8Awef1YCzbplMjSjl6LPtllFtN5g37HDk/0CnhaTfCfk3Ba?=
 =?us-ascii?Q?R0UfABi5SjUX84zTyP3R3gWRiVe2bkqmQLExu6dPDAMQD1Uy+ZKyeorPhHjh?=
 =?us-ascii?Q?BPVPjHjb+p9p9NuE9GSIxubBLnjwIvgw5CRq+eHlukPNlMqqgGEr7eCI4wSC?=
 =?us-ascii?Q?AVp3naUsz9pw+sgKazfCw5vnthtZO1nSeTo5nE2GvL1UbOucjgCl9Q2yywm1?=
 =?us-ascii?Q?WPPqnh65A+5nPZCpADj1wpN5QmnI9U6OIbgv+k+2TBmHss+UGhZq4QfRwHbl?=
 =?us-ascii?Q?n80MGESt4l/BQU055I8WBkJ7zP5QKxY87IC+XrXbYHjYyWoGnVu2D0XfVWq7?=
 =?us-ascii?Q?uYLdhwXUsO78YhrXv9pf2Shf1enRaFGtvBkA/Cvp7XnOBXhihptq0IWEjXxV?=
 =?us-ascii?Q?dw+WxHYXAhR8b0osHcqaaC8aIJqBt3IApjMRnwzs08+LI2yXpNbofO5LStM7?=
 =?us-ascii?Q?77I8RHBDQZlnMYxPje28xWULJ+loJgBoKPVUv3sxxF8KrmG2Yut4SlmswhHW?=
 =?us-ascii?Q?iJQ8aoRpV7aq02ruqxG6X9DcXAQR95oC3UqPDL52m7QpFpvm0XMaVPDI6wmP?=
 =?us-ascii?Q?sfvcn5DTNqT+g0xY6SP8y7bOGFMCtiZiIaBixg78U0I81kKt5X6ui4acUdih?=
 =?us-ascii?Q?Pr4tvoBOvnBXiAj8hc7Nex6MlowF0sPubuxhqiTCNurJ+tfc2V7X3vwjM+5Q?=
 =?us-ascii?Q?ylP74F5tPOf+tAmcPK+yHWm947e2bktjQlLkqpd/zJ6PdCQpLE7+KMEUTFQ4?=
 =?us-ascii?Q?RomiE1PaN5HGj31eGGN2Og9YaeAghC2It2pIBDtwdEtBDCw1Sb+ayD8+io7X?=
 =?us-ascii?Q?OUbFS4NnjDI5oTUcVJWLOn4EJpByx2NOFCPWi5OqnF653C0ZyJcvalcXxyXZ?=
 =?us-ascii?Q?lVVXB5SobcaAmOc07H8d9MCBt0AR3Ll1qOwCHc+sudWg5ZHW/HBXTgejCakv?=
 =?us-ascii?Q?PdTaMo+XK+XRSWjI2L0mKj+H2tUW0yOtBZdToEuKUJLVuy/gZxiP+zBe4IVv?=
 =?us-ascii?Q?37WZNuLwcCknucfi7J1hM7+zvVHZH8ZbKqWeSCAWOOSDK/ArGVbmRSyv7VCT?=
 =?us-ascii?Q?6yiob50Je2tTAiShGnCdP1GLj9gDrrx+h5lmhGTulVJOQrfRYQsNj9Eu0wVF?=
 =?us-ascii?Q?82XHn/MtVXxQOKyCKrtlshS+ugGxJ1bQBhveDDgOLnv19FM4FJqECnuQqyx0?=
 =?us-ascii?Q?qVGGRt8ck7bk5N4qWTPUyXoOJ4HY5B/gKEVWItKY9F9oao8Vp4ll/x2H9Pqe?=
 =?us-ascii?Q?6ISY4qG7Cw=3D=3D?=
X-Exchange-RoutingPolicyChecked: RorEUTqOAHlpm7NuwgoRzqmm10zVAfOhZPnuErGU1Q9uo0ujz1GWa9DrLleE/y0gc6Be5O+Mw6xhTi1Qzg0J7grO4hFUajo3Z3YQVsSt9KB3f0iviBvedX0hHEkz2KDXhdMbns8NWaN5ycdgIiM8A1AN7UUzMpEpsdaG6xJtKZ/JiJxnrpmMLERbEbMHecTR2ocuAOelk1v4IzeBeblwGzEMPqI940qD1AwOuzks5BQ4TJgLt3TacDQH/CU29oBaMmWM69KBTqzVqAYou/JVzCXjvp3nlGLZ2i5moRC7zyf29fsbp6cO+MatwQaeYFjKRw1Xj/utb9hWslh+F5Nb2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2eda8a-3431-4bc9-197a-08df4bc997a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 14:28:51.5877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZS/2wzh5uOCxPgg6D9/Rdv+ndNnurH8RKW4FkjpasCDegz0lduKXXZFesgF7LH/NdcdSEGniKKXkrkya+JI8SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
X-OriginatorOrg: intel.com

On Wed, Nov 25, 2026 at 11:01:42AM -0800, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 11/5/26 2:08 AM, Chen Yu wrote:
> > The Sub-NUMA Cluster (SNC) configuration is currently detected only while
> > setting up L3 monitoring, so it is unknown to code that runs earlier during
> > resctrl initialization. Upcoming Enhanced RDT (ERDT) support needs to know
> > whether SNC is enabled while parsing its ACPI table, before the monitoring
> > resources are set up.
> > 
> > Detect SNC once at the start of resource enumeration so that its configuration
> > is available to all of resctrl initialization. SNC is now also detected on
> > systems without L3 monitoring, which is harmless because only monitoring
> > depends on the SNC configuration.
> > 
> > Suggested-by: Tony Luck <tony.luck@intel.com>
> > Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> > Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> > Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> > ---
> 
> Thank you.
> 
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
>

Thanks!

Chenyu 
> Reinette
> 
