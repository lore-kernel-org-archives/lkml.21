Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795086779;
	b=WpgFRX266XdQMIbXpmGvlk7oPHZcKaPs7RvyGOMrCdV2N9KWjQSTPFOAjr28Ck8C1s0C
	 7ejPjAAfGx0FnY+J46cP5SWh8J0aV9q64PQjaCS7CbBubY0ZeYEC+Z+0pNJGwAszu/I66
	 EoAYuZjeGOeHNnCIX/v9hCzfm92XZPeMdOthhzLACckpNlGemsIyNjNOlH7zOtqHv9jnd
	 wbIHZnlhIR17Kh9xTYNObFy6WqqC4ln2IuYAuJ8XBAbICe2nzJsmN6Ljckd7Z6RvOrT6M
	 xlXsWsrgB/S0PywjQju9u/N7M5c3CR4MS5qS9xMnLIvORy6vfBD8GBULNuYntrd0GIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086779;
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
	bh=5jJMO1QHP+rcYMBbzGGEaviN698wEKYVD8agRsu4vzc=;
	b=GFyVik8Bn67CEROW5SYSgbijGrq/xN/Byvw36OEg1W9XlF0/0bFYbUPknzoUNotPKui3
	 c48qnmCl+zzVw7KsD+18wL5VeV/yaQjxeIebp8kAEUPq7CwVP5wB6lm/Rx0SbcMpzknsp
	 w2G3Fd+QLVsJ/X1hvWedcAt67uHf0TwxR7wjiyI7Q+vvrpwClPvbxTWHoDEOI2/hG+ROT
	 xcsS3B2Sl1oT1NG6Y7FzCxYFmaccVvJc34a4uAjDUOFzlFV3QA3E4Tph5n4tLn4QGfDXZ
	 u4diM26/aNQKMb7kmc4RTZrFE4EjWMnG+l82xhvk8VVTQ50/UCdifcTY1h9sqt2jhMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FmROkefO;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=XoCEj4wn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AF3606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70AF3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FmROkefO;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=XoCEj4wn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795086779; x=1826622779;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZHi62v18ByAsNxH3Afw2FqgOa8zZ1yEmoqdRz8ozjJc=;
  b=FmROkefOe8ZUkDZtqrEEHFLlCXDnzhIlGJXaq8SKxDENqCb50lj00pTl
   jcBZKVMUQZVSAXa8wdn58RyZ7hzQOK9d5jdKepLtTE+pRpDQX9u0z0Muv
   lfbcn6SgK3xg9Ga4LIe8xUQXDSRmvA2w5vyq4tiLan4rivYCMeDVvFCnB
   x8yJrpjQ+FGXA7iIthIGWO7+9l0fTB4fV82bdNjqLfeD1KKgS+NCpIZ0V
   aYgMxrNgKrbsdaa5y5OUZzlcWNg6hPr576zAjFVIIzmemtQWmr9z7VVpp
   0TufxPftUlcaiJbo+oF1bFcRaF3NEdmBoc6yapyg1klXKBOeCFWREGwqM
   w==;
X-CSE-ConnectionGUID: eBcjde0sQs287s+YswcMhw==
X-CSE-MsgGUID: nmtKLDujSP26cxpEo9d4zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3821323"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3821323"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 03:12:58 -0800
X-CSE-ConnectionGUID: ndAgrDnLRQiWvXMp2HohhQ==
X-CSE-MsgGUID: RBU+KIstTTiWkkSGIbfzaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10677954"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 03:12:57 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 03:12:57 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 03:12:57 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 03:12:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=th14t7UYJBtwQbQbzS9kxXrfEVZrJJmBEExgtxnTeGk6KBtLq50JMsxO4Y7PClDb1QKXm8uE6439wplycs2mlEOQzujeCE7sbKjnMOfz/xTK14QaHMZ3OLqtiFac3xt753PJH4WfAxLqc6OyJa6rqQCAatBa8sy6R4QECpxpMbVjWkAxFoHYzI09jt88wI4J3LQdbF9WMwbGWzn9YVgLFt4MAjJDUpALxlXRl0nCf8u4DSKtBfNp8NdndKi0c0LEZu83pr+9SnpZsi3HNFizq8pw7Sh10O1lu7y1bWuuBef7Y3p2nXs9Z/xJvtmZuf6R/cEQGXOtlqvj/Qi/0CJ2Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jJMO1QHP+rcYMBbzGGEaviN698wEKYVD8agRsu4vzc=;
 b=kPye7pYpQNbljX/SHLnvAAaIorxGzNCxH/DUei9+nPUlMqevoHf07ZR6cIe7RuE3Z3+NvqKxbElHf6ue7/LbJPBujeHNKuTKB7w/66Sr7DB1ORSsW5eJ0o2JnktHqyAVb93SAxVOQkP88k4vplP3OQMHkyYGbkFmw2SkH1jOKkCZZNmZEv/cKXVIrWQkORzY4Jwf34pIPkWvAj2NobjTb1A78qE0jfL0m1/gJkL8w1RmdxneBR1rSpacX20oV43M8b9O4DOdMwVwQU0VHQXUCOS2GR4cUQv/h4dI6LONLcRviypdLK4SrWlzxAKUd/rcDO2E7+7te8q/Mhh6oJ4SyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jJMO1QHP+rcYMBbzGGEaviN698wEKYVD8agRsu4vzc=;
 b=XoCEj4wnPPXQzPvKOLlRoYVlvwNVlMAUlObzB1+2KsPi4B7r2Sg6APt5i3FGHVhOK0ELza94Vz9ZmS0xzBx9pYrTA3XG6iFBXA4LdIBxUMtxW/jEZ24JWhbH5I5K8r0E4Oa5Qq3TEHbXdUaaE+Djq5GTd+fLsPtVV8D9zSTDLQM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 11:12:53 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 11:12:53 +0000
Date: Thu, 19 Nov 2026 19:01:49 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Jianyong Wu <wujianyong@hygon.cn>
CC: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <tim.c.chen@linux.intel.com>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <kprateek.nayak@amd.com>,
	<linux-kernel@vger.kernel.org>, <jianyong.wu@outlook.com>,
	<liuyibin@hygon.cn>, <zhongyuan@hygon.cn>, <chen.yu@linux.dev>
Subject: Re: [PATCH v2] sched/cache: Enable LLC aggregation above the first
 NUMA level
Message-ID: <av7XHYkg+XLO+Xm4@chenyu-dev>
References: <20261112065445.592968-1-wujianyong@hygon.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112065445.592968-1-wujianyong@hygon.cn>
X-ClientProxiedBy: SI3PR03CA0009.apcprd03.prod.outlook.com
 (2603:1096:4:297::17) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MN0PR11MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: 124da35d-accb-4b5e-2e66-08df462e0e56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|261022075727099003|261021123027099003|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ngXFwjm5YUv02ioYSbrUWaHkutrCMo0LluR7oLBz5Vwwx/8knplTUYt3iFiD1VfHkYdJ50aXVK5f7L/uqozO6OGBJIDXpVaSN1TzWlBTcZ6xzZb9Wco5aNz2jABsPeoxNusiEuhxxBR4VMuUE/NEE8G6QEjK5r/ZKOTwfCxlx3dHiXF8/BZXEmlcb6p1uvxgGmXPB+lEK6U5kx+aw2slFOUSwB1xMFf6w5zYyfNRca4BKD2RrtQ0YfcTR1UModnQEbY0T9/HlzgtgQFKmhmKwsyoqpQyfomOYGhF36lMkkON1rarJXa/O4FxMw8Sc8jeNfa3pc83RTUhY3G8MRuFkfwB3cHPfyBnTajFOl8X3PZSt2Kauihs3S/XLNjdG2bZyq1N0FFoCvrow0pphnvOPXp/cJKqRJUGx0drky9mxbATloErEDNoYvrLW3IWcCCLdsL0a6uF+9D3EPNRxX8pGR92blYHjRMmjjxp8AvZDt5vg/mE4A8IRebdBee/hAkKuDgXYBcHSMtVNaYh6z6Wk0y2KBrh1wS0x0so7HLYI+9KWy0ZzPgJbEO9t2/x8yYY3DFWQPkahqae+s74Q1v6O55cDF3EAVV+8w6mosoDVu4bN/q3XXaRgL0064EIv+FT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(261022075727099003)(261021123027099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7df7FLZ2Qa0F3ipr7g2qxfcmwhnW0XN19QelbEaR1+7CzSmjkNFemdiqsfFt?=
 =?us-ascii?Q?cI2x4qt0xsNcC+iQr48t/4uwj1FviQs8e8B02g4Sjw9uaeCbkj0YkQPTjr1Y?=
 =?us-ascii?Q?gHDMeDsVGFT8TLRGkrkzkUVwS/dPfyG866NXxjWdM3wQy6prgZLO5CpQxyVc?=
 =?us-ascii?Q?uHYR4M8Roh+kNaMrZUtCkJsAlOL4/J8Fx0YEUBb3PoGhmX3v09Qbg5A2kBWc?=
 =?us-ascii?Q?jBi4beRmLrY4n0mLeeiCyUj1aSzoq8nc2BSLh9xr+8+tcICTwranig9o/3vK?=
 =?us-ascii?Q?Ab7WWoAaznecNO4yfOMdh9bQwMEATyHCIDNx0M97k8xPRuOQNmYsRZ7P3GTv?=
 =?us-ascii?Q?YwPF1Gwps6rj1G+X3jmnKqBLqrovfpMzHnFOC89cM1B7OwoToXwIKjaum95W?=
 =?us-ascii?Q?LuiHlBRa9wQJfEqAhbRRygJSFosHYN4C/S33Tak/hm5wRNy3Fp5gCSAWrNo3?=
 =?us-ascii?Q?/oL6idNt3JsYyLmnSxk3Ri8MXzVz/VAHL4nBpJCtH63+cjHk1zJpg79exMOv?=
 =?us-ascii?Q?58GJNdJNWZPDkA3ynqK0LtUQgQuByyOU454qKCYXCr+C4HWtf7eUk2mcKQGb?=
 =?us-ascii?Q?/i/ZDLobDx2p0LGJH7svpaj+D296iErzQr53ksNz9hqKHvA4omRms9k+gBot?=
 =?us-ascii?Q?jm5od8+R5P97olhlFOAyzvJxt2vnSSkWX8jP0haYYjfL65GzG+CniHPqDTP6?=
 =?us-ascii?Q?WsryZpeYWcajPOUSWMqfP+N2/X1mMsvO4+kaDHdf3IAFa8ehYixxZwzrc9Nf?=
 =?us-ascii?Q?3qdwKgXvJ9K2dpsjGypz8jVkqfAJCLxFyjGC8bzoeZ47eL2d/rJNzIHp5oUc?=
 =?us-ascii?Q?qD6giNwz9GaaWZDGiBr4r2wpEvWzXrrsGlQydwrzsxCFHC8YWf8DJ2UzBfpG?=
 =?us-ascii?Q?AV5pmW4N6rJM6zTCC8vLufN6BIJ0SbmZypFA1HZTz2dPVmrZAJnADRBHofii?=
 =?us-ascii?Q?dMsYHqKsbnk8wAchtaV4Noye5TIsK6oeTEr+xKgxdeq8o1rcwyFHH9ydha/d?=
 =?us-ascii?Q?Za32D5fLHP31bj9HJZXLsoNbeaOjscUBh676EhK4gFuPGrYYSULUlq5uAZVd?=
 =?us-ascii?Q?e+HkctoTM3/qa6Ob0IHepYk4CEpXrJHzmFOyL1s1WhU9AytswA81x6HqUKvx?=
 =?us-ascii?Q?63yrWRb7UtaigZL3XVFZp+8g4sBe5djuyMq0py+4GNpZ+uIkwF1HPRM2tcwz?=
 =?us-ascii?Q?8Gm/KKJC7WZpGv0rtXIm5Zgc/M3fPxNwh25PbdIA9YERxI0WlH6iACo+d0Sh?=
 =?us-ascii?Q?xDsZNN26eNwWA51Iy3VxljOglOoFzoOdqFw8lCb0w0GIW0JlxKq/V2gv9W9C?=
 =?us-ascii?Q?BtZXN8a1gPmphQ1dmr4a6evPsdT9rZFRScpb2QTOGW4KIpMFYcBz23Zp70uW?=
 =?us-ascii?Q?1M0YqOy9gO2poUdOjmm+Cii/4dVctW/gYLO6NH2dw5UHoczQ+04WSQC1/P/r?=
 =?us-ascii?Q?hhu0spe/z06X9jUS1sPDkhAycdYzXYLhp6q3mTdaMzVzuwmQrKtJzhWvhn+m?=
 =?us-ascii?Q?Z1Ew1go6o9lUYdtvUdBtWDWEc/TXR393jjFymyB+WAtKE0ySXoUF6sJwc9Do?=
 =?us-ascii?Q?eJZlOzdTXCy9Nj2SuCQElm5UcviKwAZM3MC1DOHtlQgpKe33UzQPdcxntUFV?=
 =?us-ascii?Q?I7WiePAy+Nhh1fUDJ9/a1FdasapiNYJbyf3DVX+MkgQUGciZkZxvh5vt67PA?=
 =?us-ascii?Q?pO1qhsz7vKwAeL5gVqk9nzG0ry6+IMDqoLI/UoxfBe4hU8xs+IZoJeMjwfhQ?=
 =?us-ascii?Q?nK394rVenw=3D=3D?=
X-Exchange-RoutingPolicyChecked: QnOCprrzpLvEI19K5fyuKDdss8rxyBgUsZ8tK7mDeMgHMb3obPdY1b7a4U9M5A6j7vDKjGm+Pzv8jLRpBkiyj3P9oQJSECDV7bjLvgoLx4ROWnM9nEzpULPzOVP8kKSX3fo5W4nYwWYFf+Bt+LeDE5gii3zW37dFKx7VqP5qucQrLPaTqxS/3zwlJiyEv/lzDaiuBfvS9DhTg12qkOlKwWHLRZbZ07OUDHHbwxGMvcrdLt4okEHMZejCD+oOdS2Jw56iHVWzr+xp9DGVwi6UXGY4DfjfQDcWKyBxXAguvGkKLf42PnsE33OE+PqcZFW14hueXWAOa0Vqi1U8JdXrAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 124da35d-accb-4b5e-2e66-08df462e0e56
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 11:12:53.5872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpq3WVRqogT0XdZSxEE+utF9RkavUwkKD8ZG5j2hYBLC6V0ARmVUeFwgY8VbG6TLuHRAkTWJ64mjo/fTWeICAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
X-OriginatorOrg: intel.com

Hello Jianyong,

On Thu, Nov 12, 2026 at 02:54:45PM +0800, Jianyong Wu wrote:
> sched_balance_find_src_group() only considers group_llc_balance when
> sds.prefer_sibling is set:
> 
> 	if (sds.prefer_sibling && local->group_type == group_has_spare &&
> 	    (busiest->group_type == group_llc_balance ||
> 	     sibling_imbalance(env, &sds, busiest, local) > 1))
> 		goto force_balance;
> 
> sds.prefer_sibling mirrors SD_PREFER_SIBLING of the busiest group's
> child sched domain, and sd_init() clears that flag on every SD_NUMA
> domain. So on any domain whose child is itself a NUMA domain, i.e. on
> systems with more than one NUMA level such as multiple nodes per
> socket, groups tagged with group_llc_balance by llc_balance() can
> never take the force_balance path.
> 
> Such a group falls into the !group_overloaded branch below and in the
> common case ends up in out_balanced, so a task that was placed beyond
> the first NUMA level is never pulled into its preferred LLC.
> 
> Only require sds.prefer_sibling for the sibling_imbalance() case,
> which is what it was originally introduced for.
> 
> Split the condition into two explicit tests and gate the llc_balance
> one on sched_cache_enabled(), so that the non cache aware case never
> reads the group type, and the test disappears at compile time when
> CONFIG_SCHED_CACHE is off.
> 
> Reported-by: Yibin Liu <liuyibin@hygon.cn>
> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
> Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
> ---
> v1 -> v2:
> - Split the condition into two tests and gate the llc_balance one on
>   sched_cache_enabled() via busiest_llc_balance() (Tim Chen).
> - Add schbench/hackbench results with NUMA balancing enabled and
>   disabled (Chen Yu).
> - Reword the subject and drop the Fixes tag: this enables aggregation
>   above the first NUMA level rather than fixing a bug (Chen Yu).
> 
> v1: https://lore.kernel.org/all/20261104141313.185433-1-wujianyong@hygon.cn/
>

[ ... ]
 
>  kernel/sched/fair.c | 35 +++++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index cfc982205b98..01b9f7885574 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12192,6 +12192,16 @@ static bool update_llc_busiest(struct lb_env *env,
>  	 */
>  	return sgs->nr_pref_dst_llc > busiest->nr_pref_dst_llc;
>  }
> +
> +/*
> + * The busiest group has tasks that prefer the destination LLC and
> + * cache aware scheduling is enabled.
> + */
> +static inline bool busiest_llc_balance(struct sg_lb_stats *busiest)
> +{
> +	return sched_cache_enabled() &&
> +	       busiest->group_type == group_llc_balance;
> +}
>  #else
>  static inline void record_sg_llc_stats(struct lb_env *env, struct sg_lb_stats *sgs,
>  				       struct sched_group *group)
> @@ -12210,6 +12220,11 @@ static bool update_llc_busiest(struct lb_env *env,
>  {
>  	return false;
>  }
> +
> +static inline bool busiest_llc_balance(struct sg_lb_stats *busiest)
> +{
> +	return false;
> +}
>  #endif
>  
>  /**
> @@ -13303,14 +13318,18 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
>  			goto out_balanced;
>  	}
>  
> -	/*
> -	 * Try to move all excess tasks to a sibling domain of the busiest
> -	 * group's child domain.
> -	 */
> -	if (sds.prefer_sibling && local->group_type == group_has_spare &&
> -	    (busiest->group_type == group_llc_balance ||
> -	    sibling_imbalance(env, &sds, busiest, local) > 1))
> -		goto force_balance;
> +	if (local->group_type == group_has_spare) {
> +		if (busiest_llc_balance(busiest))
> +			goto force_balance;
> +
> +		/*
> +		 * Try to move all excess tasks to a sibling domain of the
> +		 * busiest group's child domain.
> +		 */
> +		if (sds.prefer_sibling &&
> +		    sibling_imbalance(env, &sds, busiest, local) > 1)
> +			goto force_balance;
> +	}
>  
>  	if (busiest->group_type != group_overloaded) {
>  		if (!env->idle) {
>

Got one question below. After cache-aware scheduling is enabled at NUMA level 2,
should we adjust src_cpu in llc_balance()?

Suppose there are 4 NUMA nodes, N1, N2, N3, and N4. Under each NUMA node, there are
sub-NUMA nodes, say N1.1, N1.2, and N2.1, N2.2, and so on.

Before this patch, cache-aware scheduling is allowed to aggregate tasks between N1.1
and N1.2, but not between N1 and Nx. With this patch applied, it becomes legal to
aggregate tasks between N1 and Nx.

Consider N1 as the dst_group. Then we try to find the Nx group as the busiest src_group.
Say we choose N2 as the busiest one. Then in llc_balance(), we evaluate the utilization
between the LLC containing env->dst_cpu and the LLC containing cpumask_first(sched_group_span(N2)).
The latter always returns the first CPU in N2.1, which might be wrong, because the busiest could
be N2.2 as well.

So, we might want to use the busiest CPU in the busiest N2 rather than the first CPU in the
busiest N2, how about something like below:

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 79f6b3a4fd7f..f2f15b20e3c7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12149,7 +12149,7 @@ static void record_sg_llc_stats(struct lb_env *env,
  * to run on LLC in idle dst_cpu.
  */
 static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
-			       struct sched_group *group)
+			       int src_cpu)
 {
 	if (!sched_cache_enabled())
 		return false;
@@ -12183,8 +12183,7 @@ static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
 		return false;
 
 	if (sgs->nr_pref_dst_llc &&
-	    can_migrate_llc(cpumask_first(sched_group_span(group)),
-			    env->dst_cpu, 0, true) == mig_llc)
+	    can_migrate_llc(src_cpu, env->dst_cpu, 0, true) == mig_llc)
 		return true;
 
 	return false;
@@ -12235,6 +12234,8 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 {
 	int i, nr_running, local_group, sd_flags = env->sd->flags;
 	bool balancing_at_rd = !env->sd->parent;
+	unsigned int max_pref_nr = 0;
+	int max_pref_cpu = -1;
 
 	memset(sgs, 0, sizeof(*sgs));
 
@@ -12258,13 +12259,20 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 #ifdef CONFIG_SCHED_CACHE
 		if (sched_cache_enabled()) {
 			struct sched_domain *sd_tmp;
+			unsigned int nr_pref;
 			int dst_llc;
 
 			dst_llc = llc_id(env->dst_cpu);
 			if (llc_id(i) != dst_llc) {
 				sd_tmp = rcu_dereference_all(rq->sd);
-				if (sd_tmp && (unsigned int)dst_llc < sd_tmp->llc_max)
-					sgs->nr_pref_dst_llc += sd_tmp->llc_counts[dst_llc];
+				if (sd_tmp && (unsigned int)dst_llc < sd_tmp->llc_max) {
+					nr_pref = sd_tmp->llc_counts[dst_llc];
+					sgs->nr_pref_dst_llc += nr_pref;
+					if (nr_pref > max_pref_nr) {
+						max_pref_nr = nr_pref;
+						max_pref_cpu = i;
+					}
+				}
 			}
 		}
 #endif
@@ -12335,7 +12343,7 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 			sgs->group_smt_balance = 1;
 
 		/* Check for tasks in this group can be moved to their preferred LLC */
-		if (llc_balance(env, sgs, group))
+		if (llc_balance(env, sgs, max_pref_cpu))
 			sgs->group_llc_balance = 1;
 	}
 
-- 
2.43.0


