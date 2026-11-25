Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795610239;
	b=VOg/THU1xFoU4wH9H+YI7u2kyrUA3znSmBwp5i3BkLXqM0BpVGIptRhf2rdo4+enVK0A
	 mF1qvVgPEHJdF7eiBs+dMuj/yZjBKxmT+mD0gsH4k9vjtIZsiisQjhPtvT26sRvVKC8wf
	 XaTWOZp3zKc2hFgnRoGGc/PDRcNDHR2aC+lE/KyOcKGfgZvqVvQCohuk0DIf5FEJMHJ52
	 WFkRv/AXcNjPmTQUWB9L9OuGggO1LfA1lE38p5VTnnweHSv7lZlWHHdctVQaamO1+zB4B
	 5cJ9B4wkPJg1Md+C5RR4Eox3O3jCQARn+Y+/4CKrq7H1W2NK0hw6f6Ry1zUoG+yDQ9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610239;
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
	bh=0a725D/zLX1uPiOYFUUayaMr2fCAMbmj6hfjBlzek9o=;
	b=Mh6VDkRnbdmid0Q6dtyzg/TRTVZtNpLkfkOxMb5Isty9vfVf6obcF8y5xXTHM4eTakFg
	 whDjOVhPgcNBaknzapJPe/cOzDiWrT+0Lvu2pWwvYBv2uv3y/G73wGqialvsHItcF1AqJ
	 j4qv9/G1Z3DYrBtHOets7JWunT3f354bFMKavK3HMFTHrgpJ1VJam1DRXIqZyZ4ITwAyw
	 axuuK+IXoSaHULqRkB/2vtesf1lsNXzi1ugEBTXKEY6OkiE/UpGrwpzvJMqJhB0HCVNxY
	 zSMLlhxADUEQB2ignakY1RaWyfHOoWGfySpPcOSqv/8zOFr9AWQn7W1lUGnn0Y5EwLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EsA2pN5V;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DJO0nKHy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CC1606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2CC1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EsA2pN5V;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DJO0nKHy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795610239; x=1827146239;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=kWrAfgK2orA+TwI4KlcW7DPfJik2SB1HmDKT2+wAV2k=;
  b=EsA2pN5V6bnk+rZhcEZc4DEduoXxfXz32yT0qgAmplNoi2KwJ7baRZAG
   JmZqhZ7j4Ajb/9hLM1BMbjouzslrzgif36p/g2qweuDrdkISDKDa8kLIQ
   gCHaSAKG1lSho9g80ayPeki9r+wB34uXUGYj0+FEl0h19FJKnHgA9kO9F
   2Tr6QycMMCsQhvlYMyKpmgO7WxI4F3r82bVhnz0lWHEtRObDBD7IM3b1Y
   jtIs6Wl9k6INS1O44qB3P3BrcxrEOtA+rLrtcdPdYT2/xDfmNmo5RX9OI
   ZXpflWpcU0R1Nrq/I1EsBWhhzDtCK7Oj0G5s4XE9OZn+hFx0OwqBbRaHY
   g==;
X-CSE-ConnectionGUID: mSYPcoxLTzKEe2L1Q5s0Hw==
X-CSE-MsgGUID: keyUQY1PQ/iRBPbMYSLq4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4499290"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4499290"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 04:23:34 -0800
X-CSE-ConnectionGUID: l2lbzwUHS+uLXc/g7waQlg==
X-CSE-MsgGUID: HFSGG/7HRtyAY2dEGV9zog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="13531964"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 04:23:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 04:23:33 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 04:23:33 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 04:23:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9sjTngPHCXlGnJaxUKycS+XXk1jRbpXbtCOMzA4Zs7nYw5aZ4e9p7ohzHHFpSmRUNTmnAs4cUH62L9q0px55Ac6Y4s8YMTtZEX+AYCbl4cyUHMCwCsGlPAOXHRV4V3K/hsZXehTUH8eRZ/G6cVs7iI7VTRfRwB82OLPQCgGQoFQiuKKiX63v1otNwXCFHYc4UNC84198xHZRpkrVH6Cg4zYvGtwaQ5kg5aPMjMVxk4ylqKNkNjMmtHwsmTfVjYq/EbyQ9xy9MqeU0VR1TSR6AdHj0h8kDH9YfY+6XYW7IftXVHUC8sNUn/dicLXwuw8diC+koVgPc7TYy2uZxQsGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0a725D/zLX1uPiOYFUUayaMr2fCAMbmj6hfjBlzek9o=;
 b=YAEQkM4k+P1jtKYwjnPlZIM+Tlmf1z0YagbJEA6xLSew/c44jlz+N/wE9F5ULB1F3HON11hFyRc8/J+72Y0Tf7mq4dS1W+AMh9EG2OOHwDqs8wIyovV3Ijm8RyM+6taXP1sZMCoJF+GpgOG2kxmubObguLvwZCcTl59QbpnBCgUWuTTx025EgpHTuY29cR8t49mfFRK9VUPRLaFXaLQoaLFqu7EqD6eSNpvxPCzD8yIS0U0aA/yBJ4t8PrissmO3rCPDkj4gVqvRq80zykH4N3GZL5PKDVNMSe+bj4gd/I7LRVz2JPafUFL0DHiKzjulpN/kyycsIJx4I+9bfpdExw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0a725D/zLX1uPiOYFUUayaMr2fCAMbmj6hfjBlzek9o=;
 b=DJO0nKHyFcYGUMnBHxUUPFr+9dL4jr3o+5CQsXeieT0nDxNiV0bduyHjZ/EnmPCz6o2wzes5cPJF8jAo72goCnxmoHKvR5kvyj0XIx3By/KA0FzsmAdsDgHJk/1HydSe5QukLo5dPl8NGwyDbp+xeX0+zSt+9SgOKg8AQjoPsQk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6005.namprd11.prod.outlook.com (2603:10b6:510:1e0::19)
 by SJ5PPF1170C8165.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::810) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 12:23:22 +0000
Received: from PH7PR11MB6005.namprd11.prod.outlook.com
 ([fe80::4f64:b0b5:4ed2:39ae]) by PH7PR11MB6005.namprd11.prod.outlook.com
 ([fe80::4f64:b0b5:4ed2:39ae%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 12:23:22 +0000
Date: Wed, 25 Nov 2026 20:12:19 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Jianyong Wu <wujianyong@hygon.cn>
CC: "mingo@redhat.com" <mingo@redhat.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
	"tim.c.chen@linux.intel.com" <tim.c.chen@linux.intel.com>,
	"dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>, "rostedt@goodmis.org"
	<rostedt@goodmis.org>, "bsegall@google.com" <bsegall@google.com>,
	"mgorman@suse.de" <mgorman@suse.de>, "vschneid@redhat.com"
	<vschneid@redhat.com>, "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jianyong.wu@outlook.com" <jianyong.wu@outlook.com>, Yibin Liu
	<liuyibin@hygon.cn>, Yuan Zhong <zhongyuan@hygon.cn>, "chen.yu@linux.dev"
	<chen.yu@linux.dev>
Subject: Re: [PATCH v2] sched/cache: Enable LLC aggregation above the first
 NUMA level
Message-ID: <awbQoyE80w8AFxut@chenyu-dev>
References: <20261112065445.592968-1-wujianyong@hygon.cn>
 <av7XHYkg+XLO+Xm4@chenyu-dev>
 <497d83de86d54fc3a390862f23cd6a57@hygon.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <497d83de86d54fc3a390862f23cd6a57@hygon.cn>
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To PH7PR11MB6005.namprd11.prod.outlook.com
 (2603:10b6:510:1e0::19)
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6005:EE_|SJ5PPF1170C8165:EE_
X-MS-Office365-Filtering-Correlation-Id: d8cf1583-1f05-427e-234f-08df4aeee55d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|23010399003|1800799024|10067099003|4143699003|56012099006|11063799006|261021121427099003|261021123027099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261009223027099003|261028144727099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1YCPYGcUjPpVn71uoQ07NETl/fRy9QcyEKGBXtCZRqXqpdblvKQrn+kzRB6EE7ceyOaOGwaQlayDdcYiKwoEsGycndmu3lOtnjMoYMGcu/f7QVZd132MwSizOsUobhJEb6fJuepdpf4lE5NsKCvQIB3/DjpIFvpzzTsqbNSGOTP/a1tg0lYPaJXGvsA3n6YAYpN0o3GxutudWBKYmf4g30vcLytg0ZnzPgDTSEcU/2Sx8FwbEZY95FjLEGUlIcNP+r7vdZzwJ8h7TVPPDrM5ThzZ1MFpK5zB+E+BmRS3BiOkefD7EBE462n7jz9mMOz+OF8+CvNLOpdIDehzrx/6Zf3DnB/fAmQeTyISU9xp62SOJNnmkIM5sUArLLdOTVILVTVIK7FEr3Kc97VuDGYVc5Plq3colnJlUukZt873lBSD9uMXw0EQBBXCK5vYOrooyV7Vt+nZX3hoNdanQ4tvp7VSv/1XMiN7fBy/WY+nPgmT2wWbEz40XerOQwG0zfCF4IDC0nBl66hE7hQFZIcwzi+rBkOkyE3cU0T7G7LCfdq7KHO4uYlceXGR2pugJaklWLzVAmr8R3wr5BMe2J4HDE+hbpmbwu4B1tURZJqjXLtWnL3ddQ5u4qs7Lfj7RQOl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6005.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261009223027099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OWB/VTPY7+++kW4TTEDCBRTzpR9e8RSfLQsFHiMZ8gT2fChs8BcTZVBV+/r7?=
 =?us-ascii?Q?bFlk9hKBHeeZ7EKwIDJEv+KlA6OP/vc0dZTB9Z3J+ZvSGlJ8qnW+z27SPQkq?=
 =?us-ascii?Q?/TC6xsBI+gX/DYTAk3E6vTDSXIBijnrsD8Mr4aVCBcLI2SRnZdVofFDgWriR?=
 =?us-ascii?Q?HC2zDSsnKSbkDaGACsSXT0+wOcEwUnNyPJs0NlQD61vjbcytbeEv5Nc7POOX?=
 =?us-ascii?Q?360ipxaNtS640sqg43Z0B0F958if23Ey/9bB9+QCmW1vVoWQ6InkxbifAOhT?=
 =?us-ascii?Q?nxFLrl+1K3SlEacjj7vtomWA2AbWXnjU2+T3GLUFScA569kmz8AdOEscwO3C?=
 =?us-ascii?Q?abl/1Qlzw2Kim19Ph1F9goY7rBV5fwiri2qoCwkW7hs1rUWaISPsocvP26aP?=
 =?us-ascii?Q?xKElluA7BDhzIahNx0Ni93Gr0YAB1JuKcucT2cShBD5pm7StiwVXJp5H0ztQ?=
 =?us-ascii?Q?8eVg3ia9KtwEq/CRKGHHC4QPDPfLprX5WqEo6RduHiNM0+7VNLrBzccwQg4H?=
 =?us-ascii?Q?sD1U87pk+Lk0PArI10jzWfRBB8slJEaELHViwoTrIDUVzvkvPwfLx3xuvrqL?=
 =?us-ascii?Q?yvhdqiHqxSCQ3RZ1Cw8InRteypTDU1IUpoy3gqGpYpTXpCdu9XBjs/VYhlIr?=
 =?us-ascii?Q?ymXImElKTrkMQlKYK4zseTN80V4/eqHPKZrJ97CHxg0MRR1ddjveue64pC6j?=
 =?us-ascii?Q?cE4T+Xq9K2dUD3v5D506DCFyj06WNa77J+PfroAj1APk+ljfI5n7ozmBsAks?=
 =?us-ascii?Q?shaa0Zl0kQg1LT6o55n4zkouQo/vhZ7k3EzUsLl9t2pgXlKpyZfZNUIqbn/D?=
 =?us-ascii?Q?LpZ7uPq7dTmVvIAgmzCNTxrzwyGzvYrHZlqtw/GA5cw7BH2luIJrz8F+wjg2?=
 =?us-ascii?Q?0/wpdCOutlpCVVYS09CLUvgrarE4UZzbbv6SpOkTYfUnbWTP15tV5fIXrnjl?=
 =?us-ascii?Q?tkmLAX0vIrPSVqTzUUi/QeeUf+7sczl/orkMGYR2fCdsRDBGbLWygPnK+M0f?=
 =?us-ascii?Q?BoIExZm7XfV3kKJNGO1TGJZc4d1IEmzeEOummkrviCyiHQ3NSEBE7gYkFXj+?=
 =?us-ascii?Q?a/t6UIQdOmQtwMoL3PeTK8ZCsx58sirGUiqEnuyG+ZSDY1vTwMBbGTRJxExE?=
 =?us-ascii?Q?4KkxCbMxjYfaLp4qa4/4/IuGvB7y21G4BiEX0qWPxhO6Eq3Sfa71H1UVoqWu?=
 =?us-ascii?Q?z+fxu5q3CgCRjVM1NnJCl/86xiiqN1cilsGRA4SmIrA5T+t6kxatphC2f+cl?=
 =?us-ascii?Q?1pHxSjGVBxF+DATH54hhKiUyx+bSUnY3h7C0miCGuiepD84Zqu31DljzxGeX?=
 =?us-ascii?Q?WJCgMjdmW/o6h1l0fRkKhXRMnVspZMr+39rO9TbyT0NcAdF0Cg9TihfJoCL/?=
 =?us-ascii?Q?kM7U4Jv0tT1EW5KKWelo6pv60GYQdzfa3bp7aPaWjvk5BVFACM0ouJRjIu9Z?=
 =?us-ascii?Q?BParIjPP4hs7lxqR8xWpd94PbuqNknx49a5MmZ69a4dGxuwtkQXOVnJiuIy7?=
 =?us-ascii?Q?3OZIYbS55QHU9ca68xTb7wa93OjonSKMAYqSCOeNpDyy5ThjKKRVseW/fwWg?=
 =?us-ascii?Q?wuVWiA2JM7D+FB6tXmGpXyOQ8/CkThNRv0AAhLrFQNDNc+y29WQBU7aiO59N?=
 =?us-ascii?Q?PYbnX3kjd35d5qwvQUjbIS6nMe4Hb30DYOQdpf6QYzUTrzUXeKfr0rfPAt/N?=
 =?us-ascii?Q?ljnKQIfpzpT0uu+GBeKjUOuoIhe/LRhtu7JENtW6OQbzpYXoklFFrBAbcrRi?=
 =?us-ascii?Q?MKOWunuSsQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: AuaR6ZMkAhf4HFUef7lkh/sNdymUa/pwA/TOrwbVEXDPxy3ad6fpaTX74di8SHQOjsJVg9HtQAS1xJUUdvflCtgrM0OVJRk1BDsRz0S23pokDGLF/Djjyecw+MuW4f61Q/cCgSw9a581D32BiFp97G6N7a9M8TcutYTBe7mogS0qk0IJzXqRVi8PgikgK69xI+KtlQk2sZzvzzqC2p1eng+W+jlD7cvFPRRrmZkEvi3P1WKRcL/IscEfYrgJeUAa/qXPRmwCEV5wWuVRrHCYnH0lq4l45GmkGXv8Z/xWutc0TFgY4Cur7H9cuXnX/TjminfTyu21xXPn0Dlr5zj+bA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cf1583-1f05-427e-234f-08df4aeee55d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6005.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 12:23:22.4287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exn2gmC5kw3vTDgFoFKKDqMVokY7n5CxF1DpzJSbKNw13ubZ2NDWdrYxUNfV9dHnl09oghBmusknr8e9EkHMYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1170C8165
X-OriginatorOrg: intel.com

Hi Jianyong

On Wed, Nov 25, 2026 at 06:01:48AM +0000, Jianyong Wu wrote:
> Hi Chenyu,
> 
> > -----Original Message-----
> > From: Chen Yu <yu.c.chen@intel.com>
> > Sent: Thursday, November 19, 2026 7:02 PM
> > To: Jianyong Wu <wujianyong@hygon.cn>
> > Cc: mingo@redhat.com; peterz@infradead.org; juri.lelli@redhat.com;
> > vincent.guittot@linaro.org; tim.c.chen@linux.intel.com;
> > dietmar.eggemann@arm.com; rostedt@goodmis.org; bsegall@google.com;
> > mgorman@suse.de; vschneid@redhat.com; kprateek.nayak@amd.com;
> > linux-kernel@vger.kernel.org; jianyong.wu@outlook.com; Yibin Liu
> > <liuyibin@hygon.cn>; Yuan Zhong <zhongyuan@hygon.cn>;
> > chen.yu@linux.dev
> > Subject: Re: [PATCH v2] sched/cache: Enable LLC aggregation above the first
> > NUMA level
> > 
> > Hello Jianyong,
> > 
> > On Thu, Nov 12, 2026 at 02:54:45PM +0800, Jianyong Wu wrote:
> > > sched_balance_find_src_group() only considers group_llc_balance when
> > > sds.prefer_sibling is set:
> > >
> > > 	if (sds.prefer_sibling && local->group_type == group_has_spare &&
> > > 	    (busiest->group_type == group_llc_balance ||
> > > 	     sibling_imbalance(env, &sds, busiest, local) > 1))
> > > 		goto force_balance;
> > >
> > > sds.prefer_sibling mirrors SD_PREFER_SIBLING of the busiest group's
> > > child sched domain, and sd_init() clears that flag on every SD_NUMA
> > > domain. So on any domain whose child is itself a NUMA domain, i.e. on
> > > systems with more than one NUMA level such as multiple nodes per
> > > socket, groups tagged with group_llc_balance by llc_balance() can
> > > never take the force_balance path.
> > >
> > > Such a group falls into the !group_overloaded branch below and in the
> > > common case ends up in out_balanced, so a task that was placed
> > beyond
> > > the first NUMA level is never pulled into its preferred LLC.
> > >
> > > Only require sds.prefer_sibling for the sibling_imbalance() case,
> > > which is what it was originally introduced for.
> > >
> > > Split the condition into two explicit tests and gate the llc_balance
> > > one on sched_cache_enabled(), so that the non cache aware case never
> > > reads the group type, and the test disappears at compile time when
> > > CONFIG_SCHED_CACHE is off.
> > >
> > > Reported-by: Yibin Liu <liuyibin@hygon.cn>
> > > Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
> > > Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
> > > ---
> > > v1 -> v2:
> > > - Split the condition into two tests and gate the llc_balance one on
> > >   sched_cache_enabled() via busiest_llc_balance() (Tim Chen).
> > > - Add schbench/hackbench results with NUMA balancing enabled and
> > >   disabled (Chen Yu).
> > > - Reword the subject and drop the Fixes tag: this enables aggregation
> > >   above the first NUMA level rather than fixing a bug (Chen Yu).
> > >
> > > v1:
> > https://lore.kernel.org/all/20261104141313.185433-1-wujianyong@hygon.c
> > n/
> > >
> > 
> > [ ... ]
> > 
> > >  kernel/sched/fair.c | 35 +++++++++++++++++++++++++++--------
> > >  1 file changed, 27 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index cfc982205b98..01b9f7885574 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -12192,6 +12192,16 @@ static bool update_llc_busiest(struct lb_env
> > *env,
> > >  	 */
> > >  	return sgs->nr_pref_dst_llc > busiest->nr_pref_dst_llc;
> > >  }
> > > +
> > > +/*
> > > + * The busiest group has tasks that prefer the destination LLC and
> > > + * cache aware scheduling is enabled.
> > > + */
> > > +static inline bool busiest_llc_balance(struct sg_lb_stats *busiest)
> > > +{
> > > +	return sched_cache_enabled() &&
> > > +	       busiest->group_type == group_llc_balance;
> > > +}
> > >  #else
> > >  static inline void record_sg_llc_stats(struct lb_env *env, struct
> > sg_lb_stats *sgs,
> > >  				       struct sched_group *group)
> > > @@ -12210,6 +12220,11 @@ static bool update_llc_busiest(struct lb_env
> > *env,
> > >  {
> > >  	return false;
> > >  }
> > > +
> > > +static inline bool busiest_llc_balance(struct sg_lb_stats *busiest)
> > > +{
> > > +	return false;
> > > +}
> > >  #endif
> > >
> > >  /**
> > > @@ -13303,14 +13318,18 @@ static struct sched_group
> > *sched_balance_find_src_group(struct lb_env *env)
> > >  			goto out_balanced;
> > >  	}
> > >
> > > -	/*
> > > -	 * Try to move all excess tasks to a sibling domain of the busiest
> > > -	 * group's child domain.
> > > -	 */
> > > -	if (sds.prefer_sibling && local->group_type == group_has_spare &&
> > > -	    (busiest->group_type == group_llc_balance ||
> > > -	    sibling_imbalance(env, &sds, busiest, local) > 1))
> > > -		goto force_balance;
> > > +	if (local->group_type == group_has_spare) {
> > > +		if (busiest_llc_balance(busiest))
> > > +			goto force_balance;
> > > +
> > > +		/*
> > > +		 * Try to move all excess tasks to a sibling domain of the
> > > +		 * busiest group's child domain.
> > > +		 */
> > > +		if (sds.prefer_sibling &&
> > > +		    sibling_imbalance(env, &sds, busiest, local) > 1)
> > > +			goto force_balance;
> > > +	}
> > >
> > >  	if (busiest->group_type != group_overloaded) {
> > >  		if (!env->idle) {
> > >
> > 
> > Got one question below. After cache-aware scheduling is enabled at NUMA
> > level 2,
> > should we adjust src_cpu in llc_balance()?
> > 
> > Suppose there are 4 NUMA nodes, N1, N2, N3, and N4. Under each NUMA
> > node, there are
> > sub-NUMA nodes, say N1.1, N1.2, and N2.1, N2.2, and so on.
> > 
> > Before this patch, cache-aware scheduling is allowed to aggregate tasks
> > between N1.1
> > and N1.2, but not between N1 and Nx. With this patch applied, it becomes
> > legal to
> > aggregate tasks between N1 and Nx.
> > 
> > Consider N1 as the dst_group. Then we try to find the Nx group as the
> > busiest src_group.
> > Say we choose N2 as the busiest one. Then in llc_balance(), we evaluate
> > the utilization
> > between the LLC containing env->dst_cpu and the LLC containing
> > cpumask_first(sched_group_span(N2)).
> > The latter always returns the first CPU in N2.1, which might be wrong,
> > because the busiest could
> > be N2.2 as well.
> > 
> > So, we might want to use the busiest CPU in the busiest N2 rather than the
> > first CPU in the
> > busiest N2, how about something like below:
> > 
> This is an existing issue, I think, even before this patch.
> 
> Suppose we have a system with multiple NUMA nodes, each node with multiple LLCs.
> When balancing between NUMA nodes, we need to decide whether a NUMA node can be
> tagged with group_llc_balance using llc_balance(). Then the issue you described
> above occurs.
>

Right, for the non-SNC/NPS1 case, it already exists. With the current patch applied,
the SNC system is also impacted. Anyway, let me post it as a separate fix later,
together with the other fixes for cache-aware scheduling, and I'll do some test
on top of that fix + your patch.

thanks,
Chenyu
 
> I think your code fixes an inconsistency here. Once a sched group with multiple
> LLCs is passed to llc_balance(), we use the first LLC inside the group to do the
> check, while in sched_balance_find_src_rq() we pick the rq whose tasks most prefer
> the dst LLC. But they may not be the same LLC. That is to say, we decide whether a
> group should be tagged with group_llc_balance using one LLC, and then we pick a
> task from another LLC to migrate.
> 
> With your approach, if we choose the rq with the most preferred tasks to do the
> llc_balance() check, it is consistent with how we pick the src rq afterwards.
> 
> So I think we need this fix but it is independent of my patch here.
> 
> Thanks
> Jianyong
> 
> 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 79f6b3a4fd7f..f2f15b20e3c7 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -12149,7 +12149,7 @@ static void record_sg_llc_stats(struct lb_env
> > *env,
> >   * to run on LLC in idle dst_cpu.
> >   */
> >  static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
> > -			       struct sched_group *group)
> > +			       int src_cpu)
> >  {
> >  	if (!sched_cache_enabled())
> >  		return false;
> > @@ -12183,8 +12183,7 @@ static inline bool llc_balance(struct lb_env
> > *env, struct sg_lb_stats *sgs,
> >  		return false;
> > 
> >  	if (sgs->nr_pref_dst_llc &&
> > -	    can_migrate_llc(cpumask_first(sched_group_span(group)),
> > -			    env->dst_cpu, 0, true) == mig_llc)
> > +	    can_migrate_llc(src_cpu, env->dst_cpu, 0, true) == mig_llc)
> >  		return true;
> > 
> >  	return false;
> > @@ -12235,6 +12234,8 @@ static inline void update_sg_lb_stats(struct
> > lb_env *env,
> >  {
> >  	int i, nr_running, local_group, sd_flags = env->sd->flags;
> >  	bool balancing_at_rd = !env->sd->parent;
> > +	unsigned int max_pref_nr = 0;
> > +	int max_pref_cpu = -1;
> > 
> >  	memset(sgs, 0, sizeof(*sgs));
> > 
> > @@ -12258,13 +12259,20 @@ static inline void update_sg_lb_stats(struct
> > lb_env *env,
> >  #ifdef CONFIG_SCHED_CACHE
> >  		if (sched_cache_enabled()) {
> >  			struct sched_domain *sd_tmp;
> > +			unsigned int nr_pref;
> >  			int dst_llc;
> > 
> >  			dst_llc = llc_id(env->dst_cpu);
> >  			if (llc_id(i) != dst_llc) {
> >  				sd_tmp = rcu_dereference_all(rq->sd);
> > -				if (sd_tmp && (unsigned int)dst_llc < sd_tmp->llc_max)
> > -					sgs->nr_pref_dst_llc += sd_tmp->llc_counts[dst_llc];
> > +				if (sd_tmp && (unsigned int)dst_llc < sd_tmp->llc_max) {
> > +					nr_pref = sd_tmp->llc_counts[dst_llc];
> > +					sgs->nr_pref_dst_llc += nr_pref;
> > +					if (nr_pref > max_pref_nr) {
> > +						max_pref_nr = nr_pref;
> > +						max_pref_cpu = i;
> > +					}
> > +				}
> >  			}
> >  		}
> >  #endif
> > @@ -12335,7 +12343,7 @@ static inline void update_sg_lb_stats(struct
> > lb_env *env,
> >  			sgs->group_smt_balance = 1;
> > 
> >  		/* Check for tasks in this group can be moved to their preferred
> > LLC */
> > -		if (llc_balance(env, sgs, group))
> > +		if (llc_balance(env, sgs, max_pref_cpu))
> >  			sgs->group_llc_balance = 1;
> >  	}
> > 
> > --
> > 2.43.0
> > 
> > 
> 
> 
