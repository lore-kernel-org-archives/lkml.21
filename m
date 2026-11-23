Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795404482;
	b=bFfvxEfY8Mvu1h14yBt4LVPTezwtN8e1jFTcroC1FSdUAaQbd39C/C0H3EDg/iJqbUPr
	 48lmTkuyBFVQgI1HMtVfPTBiKvtGZvSObsrnrmmGEGk9DG1AcLAhUlGBkIdVzBaWysBYV
	 i6FOnlcewKtZzvKOrQTFJCSnzdS4UOtX4kA0gHWmlEuSypgqD2uRgpfy+PvY6pUFr1TpZ
	 xbNvWKe4oX3tlEyY5e0g6b7Yf51sWTvbBYZZYDmw3VQ6HeFRBM5CrczKu4tOuzoeRDQz1
	 TOO2LzqDCLLe0pbfG0BF+haAiIYFoMAzwHM2JFiJQsYXp4jPulcC84596VADXDpx7Bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404482;
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
	bh=5jCkfoVhwPXFRTECN3r7Ey+BCG0vGx5hpsMEjmCL2mQ=;
	b=f8dZrQ80PuH2T2lDjBjXDmGcNCkCAyCKHisRKVKZrrDU8c6unlSXTrH/Jv2sBkJqz9tp
	 0Fg0m72klprwGToQzEyZwRBBmTAETHID1KOAcs6nLFJsczcoxZyuo5ZjEppqUZTtTbe8v
	 FZqPULQCKTBZYWQVbnKp5PHWanBUHcACbLv/pxIgEC2nJu7dsgDBPYqFXIKBz2qDX0A/z
	 vy7xB/chCKM0by4Sv874tMqKTec2ZyAxA5oHSNJLBdiwG1yvgxrBcfrSM4WjxGJO2FZqf
	 0YL2GWcNHlSe7cAURDiv/8LLipgxjpJCrWTsdXqYhy7tE/XkcnyFjeZRCga55QY2c3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DUjBo5ZM;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=aipiabiG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57167606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57167606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DUjBo5ZM;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=aipiabiG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795404481; x=1826940481;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=giD54AWdvCMwhDLVfZApmN2cZ9IFTwHsFnNtzEXkxsE=;
  b=DUjBo5ZMPXJUtlGxYByTCUMbpg3pUxYDUn/Ngc0cvHCmr1g1z/16MDE9
   XeC/1rVfgK7pZBiZUEuvcMjKluGxaQ46GIt/rxIuwREjZQBFOZbHpHv18
   bNZ1SV+Z0HNl8bAKjTV7m4wHg6lVZVdq5J/nKLjF9/Vqs499J2O5f9r0Y
   UJHATkhb8Gtv2nOIlCHhnHHgOypjBEE2oCfjvN6VIa5BWjou8NWKQj8lM
   9tXrl5QwhnyZn8/CZsj8l5rAZOlEm9ht3lRz2IsD6FM6QxyZ/ZbUlzSBl
   wc72/WrH4xiF4+dkez6YRm6BHSE+QazDKcM2B9E+SVQ9DUvC6Caxwjsde
   w==;
X-CSE-ConnectionGUID: Q8jJmIrzTnyLcS4oedjLVQ==
X-CSE-MsgGUID: Lh9A/unoS5qAaS9PP2jCyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4099122"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4099122"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 19:28:00 -0800
X-CSE-ConnectionGUID: +jk/94eZRKmq8kUaf86bfA==
X-CSE-MsgGUID: vtDvRQSbRrOrpeuQRuQ3Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11067725"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 19:28:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 19:27:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 22 Nov 2026 19:27:58 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 19:27:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kS8zmoihu6wjoETPH3yQf++dQETdij5m3sgM9H7DO/0seHdknDbezbjJZIfw7kMjI4QAZPJSHuG1NRm5OX0cPQlf4WKreGTOZH2Vd8UuzKCS2/lCmXoAeOSSwP9PxAwy8HDqzHCs86560RuIjsJV//yQxq4StYqy3C5nFigVD0bVupv8x0iXhS2MHFR4W34hfxz9xACzALP8eN/loe1EfIRMTEdcnDn+5cflRvqtyxtAgqEJAbb59F/5ZmZDjoYLzG222cL7JVdnThqd7bZuyV8hVfeY91WHW+k9kwyvohNWoV44bZheiRSk69EpWhfk8BS5gPIlQLYC7Rdtx2KzMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jCkfoVhwPXFRTECN3r7Ey+BCG0vGx5hpsMEjmCL2mQ=;
 b=tKHgR1Ilyd8OOXQ3GM3NQYOE0xiugYbDjz9hQK9+TfzW3siVzp6QT8ZmfMWzyuk1U0eSBG3qnFP6UNkNL+NEm3sSID2U5DPNCt5uGZok3fwT6jGpqJHqFwccSwpd0Qq8LiMUY/7uPXgO734VWcSyFf1FAISU9MhsaFLR7jgAchLQJ9EOK9XcoMXwHZ36l3acS9rXZfmtFahfehd8gIcsnKrtyRoHLC41N4BhY5LpHuIQIQukXkfGH1i6pRzgpjnipp5ZtDtXgMtgJ2/w+G2FsoqrCEOu8wjBhVBK1Zw/h4Yt8lZlHL3KKPPvX9TIpxFKtu3PVVU7AqbBgIClVDEBWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jCkfoVhwPXFRTECN3r7Ey+BCG0vGx5hpsMEjmCL2mQ=;
 b=aipiabiG+Jl8JybaT978yq2g6gCwsVOkeXEZva08skqgujuJixjPCI3yfuqHxhy0KRrMnhR5geAlnUASCpajUlAf616YOolzrEytlGrGOGJ9Q717Uxq1IbVpPk7YcymR2JgefsRedWZc/03pxKZj9A4PU8WI+F3eNnU+dtQLqK4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MN2PR11MB4694.namprd11.prod.outlook.com (2603:10b6:208:266::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Mon, 23 Nov 2026 03:27:55 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 03:27:55 +0000
Date: Mon, 23 Nov 2026 11:16:50 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: Tony Luck <tony.luck@intel.com>, Ben Horgan <ben.horgan@arm.com>, "James
 Morse" <james.morse@arm.com>, Dave Martin <Dave.Martin@arm.com>, Babu Moger
	<babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>, Fenghua Yu
	<fenghuay@nvidia.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Borislav Petkov
	<bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, Peter Newman <peternewman@google.com>,
	"chen.yu@linux.dev x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v3] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
Message-ID: <awOwIrJLVLJJVWNq@chenyu-dev>
References: <b06e1fc2-87f1-4004-8102-c8cc8928345c@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b06e1fc2-87f1-4004-8102-c8cc8928345c@intel.com>
X-ClientProxiedBy: SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9)
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MN2PR11MB4694:EE_
X-MS-Office365-Filtering-Correlation-Id: f53ba279-4083-4bdf-23fa-08df4911c379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|22082099003|18002099003|3023799007|13003099007|260925022911599003|11063799006|56012099006|5023799004|260925021911599003|261022105027099003|261028144727099003|261022075727099003|261026121527099003|261026140227099003|261021121427099003|261009223027099003|261009221227099003|261102123227099003|261009221727099003|261009223327099003|261009220027099003|260925021311599003|10067099003;
X-Microsoft-Antispam-Message-Info: ObBp0Z/a1OXFpJm8O4Hpj4RGZrUynOvFGA0JM7JOUycNyEEHe1ajn1E6XnOx2tvpRmxIZzO//h3zUkOy4wl2OiziO5VyXQNhG7u76283oK/dbv0KU2M5VCpy2eYabaB8E5cEDG3TB7OPsEexh1jDqZ4bBJuFySL+mzMTEoLOPZFH3CvsajtfoWu1RIStLVoi44aTRKy7IhAGgMKR3WqekIxGwN6RvjcCrAYEuuELBQ2i+LZTNPDK4LaYoX0W5Eje8E292eiOGh2zIOaqnFeODypVNjdB/yuWaWFZYUNHtRxusvjLdKaQUa5f2yWG66QMvwmCdhVU1pUA5WsxiR6WHv/PcpoG3iD9z2AL41HLzRdY3Q1h5J2UeJqC+JtH2UN77DKwC62PUZKwig/1QUz7XK+krV2czdo8Q0/uo79N5XVrFdKrTbmeBaY3rae9zQ8srwrznLx7DpHQSxaLFW/uFLbESp4jrdUCmtNMgJZu7mWUwuNvXrQNickC3Uci9QOdVLmZOxCI+uIl8+wHNCJlq1XHxWPmXD0+0sPAEJ8LDHS69jAYqrEeeWgxR3rmgrNF6+mM4w+7WEFMkOWAedIMiNH6swbwBGsot/uuRdO+QZJg/9wvcDfaDXLBeCcZrOQz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(3023799007)(13003099007)(260925022911599003)(11063799006)(56012099006)(5023799004)(260925021911599003)(261022105027099003)(261028144727099003)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261009223027099003)(261009221227099003)(261102123227099003)(261009221727099003)(261009223327099003)(261009220027099003)(260925021311599003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r4MS2DhxsvSsvJixQ4kzvDe9ZfNXEEU+4U3BQdDzqz4KZ48X4Z8fPYX+mmPR?=
 =?us-ascii?Q?AmpjBRLbUA9KGoFLoynDTAZuzyB/uT0dhGF8w+4elBKwPDUG1E1alxvWylMr?=
 =?us-ascii?Q?W22aysUJOXKUO+8PYgyl7OWnLnl0OERlakBvoaYNuL5E4GtPpc0IY0E/jPdI?=
 =?us-ascii?Q?0EtQ7gyeV6wmX2uCbQJ3ckmAJE7RsY0p0kdAoWZ/xXihg7lIdsGzEcfJZtdH?=
 =?us-ascii?Q?qBShNWJhvad3cEdMFgv0Fw6Go0W3GbYbkV6UXxBzq40NHsMsA5bROu5uXvcd?=
 =?us-ascii?Q?GzknCQV3nQS3kD73s8sN4XXCsM3SWjg7dsIM3PZUgnB2YGS+U/OivI+1d5or?=
 =?us-ascii?Q?LUpxpawSO85LF5ySkspwqqZxtP+hzULE1CBaBFuZaCoG6LoaUVCObgJElpi9?=
 =?us-ascii?Q?aVFy6u54Y9Gi+SxxkVAM3eWz3iS+lYXpGHwqr787C1MbOOTwtTHnl0di4u0K?=
 =?us-ascii?Q?vStbrNOwDd0gXUQzV3bouQPD8rtIx0ZgGKVXZjTzKLyOQRQ3BxFonvv+mscA?=
 =?us-ascii?Q?zAKxw3qGYKvzbF6LU9hpNmff8BN7Ddis558qJ+WIk905lcz6ZMxzODDYaA7T?=
 =?us-ascii?Q?/htF0I3BYmFTJA364SRID8ku0qXfTxzzavlTatVELb70Z0AhZeLkKkcgpYJr?=
 =?us-ascii?Q?f4qiVzmuZPCoq6V9Shl8b8dg7QRmSsgUamouYDOSeQzYnJZ20orvQNeatuOG?=
 =?us-ascii?Q?Z2f9b6k1my6QrG8C921H1uKMGhuKiLSxTB+yETG/YUUJEbZuvM/0xwawmbBw?=
 =?us-ascii?Q?+0NEDE4nW2UAGp8+YK0+2tRAIMrIxAoJpVE/3HIa+JdJQfXD2D5uL+FQqUNa?=
 =?us-ascii?Q?lDO52ukZ8rwsmitAvKFsVh/pYi9H00HJGQ+AGroMgUodNwqfO0cQjqeldkuR?=
 =?us-ascii?Q?c6amE2+efdM45VkRA8mxVhWdzbeAjpt/Nah/WfnlrLa5yj4Fd3Y6YKACh2eI?=
 =?us-ascii?Q?+vwtuC17EebBJrovnmekDzTuf0qlmR4LXGHZPu4jqO74qNgzDg+gO73fNg7x?=
 =?us-ascii?Q?+DYZSPzfqLn0JzUPKb499ADtfnmqQLz5uP8tA/aWtUcM85sgxn9KCjm47TXR?=
 =?us-ascii?Q?jI7N/yEEja1ewRHwc+yuoybXHqzpnyS7CKSyTuxU+AayQQGYJYHSx+7WPdkL?=
 =?us-ascii?Q?XGNIkWmV/3Znag6QCviP70j3moQ0GM3yOhJbnBFsK6B9UKv6gYOg1d5KnjTx?=
 =?us-ascii?Q?9EuwTboEzXLDItsk5+edt5C1AwiTdN0/78VG5bSYzYReGP1J1/IeY3k8AqGe?=
 =?us-ascii?Q?F6SviO5cPIj4xvySxOZcwQsjh7paT3Mbxo64J/JiJkCT5LTU8Fb1MlGzK4zh?=
 =?us-ascii?Q?WWfquRZgXjp4w3d6/2ZEMqbFLvauvHLVN7cFfhTE4AgrS+pf7qe59N4TtvrT?=
 =?us-ascii?Q?rWg9SrO1339TLC3GGrPJdnphViP5PEmwl9b+wZx6ss5ilZxFHUUTDM8EdXzh?=
 =?us-ascii?Q?EQWes04ppkG6T3sHsBm+Y1OOYTFLNonSKBoF+B2h9woDpcMOY2Jt5pn+LRmN?=
 =?us-ascii?Q?JtkfDol26qC4NgDzYp8+knKzyr1RUWF3NHjkYK0QsyQZNyinMCOK0MH4/iaC?=
 =?us-ascii?Q?a1AvduZRR2hnLCXaxJH2DqTtr3UFtKJTpoOnZk7Sbv5o/RwcDorf+M3jZgLP?=
 =?us-ascii?Q?gsoxB/ss1Lsica0bZUKovdGUFi+tROPIuXcgMUvRjctPigwMVTwxYFvmTg8i?=
 =?us-ascii?Q?kPLX9xmpDLpJbwsabAJ/mXnG2JKemYk9noPU6U0oC3MG+YqA0pNDIE5a4jKJ?=
 =?us-ascii?Q?GrI0zZtbeg=3D=3D?=
X-Exchange-RoutingPolicyChecked: fU0ucziQq7FipWapjZyykOVTEoVqgCXsOogSbI+t1PhuO/WtqzNInpbdd10D+uDPyJ+DniRg2fbaHeJkfaXSRtBGCcBt6I5/SJEseArEqtKCUoB0WQts90liVv+h7/4WNeeKw05BPiW2Tec/ef9HSIvLEcv1W4d2XmWayaFl9tYOKz6q/mVzRJeMEpNznSV1jSbDLpDdxqTNKpDiIxBNdxxPalgJtzzOWluuaVJjx18KGUn9neaNyBWcOxxTLtsqzZt2munUK/fqRsQgjL7GOtL7Pf0+Veo9LN7+Wfdov2hD0eLKSlNxwHz7SLyGHEm0VDkwqag4lHmnCzApShVuzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f53ba279-4083-4bdf-23fa-08df4911c379
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 03:27:55.4224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHf33icJ1+LG0WI36cXVRXKljUJGlwB2okBKGBUlwcUP91yRQv4sQMEDuIZX8MOa9/7SKD30ifMk1ZKxiqiVdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4694
X-OriginatorOrg: intel.com

Hi Reinette,

On Thu, Nov 19, 2026 at 09:04:26PM -0800, Reinette Chatre wrote:
> Hi Everybody,
> 
> I believe that discussions around resctrl's upcoming support for multiple
> controls are starting to settle. This RFC aims to capture all the remaining
> items in implementation as well as documentation. Please point out to me if
> there is anything I missed.
> 
> RFC v3 of this PoC can be found at:
> git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v3
> 
> Please refer to the documentation patch for an overview of the planned interface
> changes as well as user space contracts/expectations:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git/commit/?h=resctrl/controls_rfc_v3&id=95ff9ff7430095cb7264946c944c750315db73d9
> 
> Remaining opens:
> ---------------
> - Ben: I do have a question about the formula used to determine the size of
>   a scalar cache control. Please see patch changelog of:
>   https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git/commit/?h=resctrl/controls_rfc_v3&id=8695aab0997d5aa60e104374fae9701f51156c18
> - MPAM only compile tested.
> - The same x86 "SAMPLE" code as RFC v2 to demonstrate emulated controls.
> - Add relationships between controls. For example, cannot set "MIN" control
>   value to be larger than "MAX. Unclear how to do this in resctrl fs when
>   considering that the relationship may span between emulated and backing
>   controls. This is potentially something that needs to be managed by architecture
>   and thus potentially without a consistent failure to user space.
> 
> Changes since RFC v2:
> --------------------
> RFC v2: https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/
>         git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v2
> 
> User visible changes:
> - Make scope a property of the control again, now in addition to a separate
>   allocation scope of the resource. Expose the control scope via a new
>   per-control "scope" file (L2, L3, or NODE) that tells user space what a
>   domain ID in the schemata file represents. Needed to support AMD's GLBE
>   and CPU-less memory bandwidth allocation. (Ben and Babu)
> - Name controls according to the scheme agreed during RFC v2 discussions:
>   <resource>_<resource_scope><control_scope>_<control>, with the control
>   scope dropped when it matches the resource scope. MB and SMBA carry their
>   L3 scope only implicitly, so their new controls show it explicitly, for
>   example MB_L3_MAX, or MB_L3NODE for a default control at NODE scope.

This is a little different from the previous version. May I know the motivation
for displaying both the resource's alloc_scope and the control's scope? Is it
because AMD GLBE might have different granularity between the alloc_scope and the
control's scope, so we want to show it to userspace? Maybe we can add a section
in the document to mention this, as you described at [1]:

"resource scope":
        The scope of the resource object being allocated, that is, the
        hardware level at which the resource resides and is consumed, for
        example the L3 cache, memory bandwidth at L3 egress, or memory
        bandwidth at NUMA node ingress. The resource scope is part of the
        resource name and does not change the meaning of a domain ID.

"control scope":
        The granularity at which the hardware is able to control the
        resource. One control value applies to one instance of the control
        scope, and the control scope determines what a domain ID in the
        schemata file represents. It is exposed via the control's "scope"
        file.

The resource scope and control scope are usually the same. They differ
when the resource is at one scope but the hardware is only able to
control it at another scope. Examples:

Intel RDT MBA:
        Resource:    Memory bandwidth leaving the L3 (egress).
        Granularity: One value per L3 domain. The value is a throttling
                     level applied to each CPU of the CLOS within the
                     domain - according to the spec, MBA control the speed
                     between L2 and L3.

Arm MPAM:
        Resource:    Memory bandwidth entering the memory of a NUMA node
                     (ingress), regardless of which CPU issued the request.
        Granularity: One value per NUMA node.

AMD GLBE:
        Resource:    L3 external bandwidth (egress).
        Granularity: One value per GLBE control domain (a NUMA node, or
                     the whole system with NPS4). The value is a ceiling
                     shared by all L3s in the domain. This is the example
                     that resource alloc_scope is different than the control
                     scope.

BTW, can we provide a control flag that indicates whether the controller(even
the new controllers than the legacy ones) want to display the alloc_scope/control scope
via schemata? On v3, the region_aware schemata becomes:

MB_L3_REGION0_OPT/MIN/MAX

previously it is:

MB_REGION0_OPT/MIN/MAX

On many platforms, the alloc_scope an scope are the same, and how about:

--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -5619,7 +5619,7 @@ static int gen_ctrl_suffix(struct rdt_resource *r, struct resctrl_ctrl *ctrl)
                 * the omission.
                 */
                if (r->alloc_scope == ctrl->scope) {
-                       if (ctrl->name == RESCTRL_CTRL_NAME_DEF) {
+                       if (ctrl->name == RESCTRL_CTRL_NAME_DEF || !ctrl->show_scope) {
                                ctrl->schema_suf[0] = '\0';
                                return 0;
                        } else {

[1] https://lore.kernel.org/all/bccb1249-e722-451a-9c75-8aa846713045@intel.com/

>   https://lore.kernel.org/all/bccb1249-e722-451a-9c75-8aa846713045@intel.com/
> - Report "max" per domain in preparation for systems with resource
>   instances of different capacity. A bitmap's "max" no longer has a "0x"
>   prefix. (Drew and Tony)
> - Drop the "min_bits" file. The "min" file of a bitmap control now reports
>   the minimum number of consecutive bits.
> - Only offer, and only allow switching to, "native" control mode when the
>   resource has emulated controls. (Ben)

May I know how we can distinguish whether a legacy control can be emulated by
other controls?

There are two scenarios. The first scenario is that a legacy control is emulated
by sub-controllers, and the second scenario is that it is not emulated by any other
controllers.

In the first scenario, in the current code, after we switch from legacy -> native -> legacy
mode, the msr_update for the legacy control is non-NULL, so program_backing_controls() will
never be invoked again.

In the second scenario, which is the region-aware MBA scenario, the regionX controllers are
independent of the legacy MSR-based MSR, the legacy control is not emulated by the region-aware
control, so in the current RFC v3 it fits well - the non-NULL msr_update will be invoked by
either the legacy MSR-based control or the region-aware control.

The issue with the first scenario is that we don't have an indicator to tell fs/resctrl whether
this legacy control is emulated by other controls. Although we have an emulated_ctrl list in each
control, that list is re-used by the non-emulated control scenario such as region-aware RDT. How
about introducing a control flag to say that the legacy control must be emulated by other controls,
rather than checking whether the control's msr_update is NULL or not in _resctrl_arch_update_domains()?

 if (!hw_ctrl->msr_update)
    program_backing_controls()

to:

  if (hw_ctrl->emulated)
    program_backing_controls()

thanks,
Chenyu

> - Only allow cache pseudo-locking via the default cache control.
> - Display the "size" of scalar cache controls. (Ben)
> - Stop reporting scalar control parsing errors as being about "MB". (Ben)
> - Document the control naming, the "scope" file, that control values may be
>   reset on a control mode switch, that legacy info files return no content
>   in "native" mode, and that non-legacy resources need not have a default
>   control.
> 
> Other changes:
> - Require a control and the controls it is emulated by to have the same
>   scope.
> - Require only legacy resources to start in legacy control mode.
> - Generate control schema suffix once during initialization.
> - Fix initialization of the list of emulating controls (Ben), clearing of
>   staged configurations of backing controls (Chenyu), and Haswell control
>   initialization (Chenyu).
> - Reword changelogs about CDP, allocation size and the bitmap control so
>   they no longer suggest resctrl will only ever support one cache control.
> - Fix checkpatch.pl issues, subject prefixes and changelog typos.
> 
> Series structure:
> - Rebase on:
>   - x86/cache branch of tip that is based on v7.4-rc1 with the queued
>     resctrl cleanups
>   - MPAM domain separation that was extracted from RFC v2 and submitted
>     separately:
>     https://lore.kernel.org/lkml/cover.1794283825.git.reinette.chatre@intel.com/
> - Squash four patches into the patches they support:
>   - "fs/resctrl: Provide control to cache allocation"
>   - "x86,fs/rectrl: Provide control when requesting arch to update a single
>     domain", which also keeps MPAM building at every patch in the series.
>   - "fs/resctrl: Expose bitmap properties via new files in schemata folder"
>   - "fs/resctrl: Include emulated controls when determining control field
>     width"
> - New patch from Ben: "fs/resctrl: Display size for scalar cache controls".
> - Move IO allocation control selection, and the helpers that display the
>   new control properties, earlier in the series.
> 
> Any feedback is appreciated.
> 
> Reinette
