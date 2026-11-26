Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795704955;
	b=iwbgaihqd3f2k6u5Z/XZ7TWseDskrxfGQj8anCA8K6oD8adXTat95uDZ+mP97uOMPJZW
	 c0aDjUDD47uQivOQ/raCC+SQ8NLpeMdWZxWdFDwLI4epVHjyQd9XmbPwZQmHVY9zPWVUJ
	 dkWfxxmlfTn4X0y23B6OaYUQMdMdyFZdVDLQNk3NacUFvI0s4+nFxKC4Opacmc3wTo1mS
	 OpnDM3uUo/HIpCz7kp1Vo9921eHzF3aEs1eSguvMH0bp52h+EyxVg2mOWTOxmRvXe+VC7
	 tyghBh7K60yEz/6eU4RMLj/eY+ngaKVz5D8D2kBFt6T5WbLZWjOA1FfW2xu/BJe9bsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704955;
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
	bh=3PtBMb0HcGxr4jCUY3V0ToPpJXpTWQ1kMIjGIaHl6N0=;
	b=ih9O6kwP4SrNoHRm69Hq1ZTlKaQQp6PK2sgdKc52UB1SZ0eIVU+IFNN4BcaLcLequNtG
	 TvSYfRPs9/JOPOp0A1+ccIg9JXXLUT25UtgmKFAItwVTw76iwGebRv9ddW6e+arNhtump
	 V5Ovc4w0tXcRmAgDK3xdch0C/Uh/9xkXQUYJdGXeyJeLKwOiGjWkfglGpFmF1IQWG/1IL
	 PMKAIWDvGvYgZN2kKSFigBGjTk9nqoiLSANdsvEJ3ad2NHIvZtlBvwd79l06ZVO6fu1YW
	 5/1kVEieWlGKVBuqwYPjzfFVe8QRkVQrheBfD4y073LuKB7Qp6rub8Ri410shTMSw8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lYHfUaLI;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=GyjzorNG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AF8606A336
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56AF8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lYHfUaLI;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=GyjzorNG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795704954; x=1827240954;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8FJ6JneOzyum9hMCWcclekF4oRkQsc9A/IUjc1Q+YmU=;
  b=lYHfUaLI+/21fYbuTtgrzalfS964F+B+pWyLiKQYlXqjuT1MGzPXaxwW
   n5YBW1Z9QIRc6Mx7wuIN/rQ2xaq0nkWOEHoxXTuuZlslTFuzwI2mwW1DR
   zCsneBFjojV61wrzWAIC3zlemrJLZHSwoMWuSesbXTFFapdhuy50J8V+e
   1UipvabmbWnZ2x1hPSgUp/dzOpAnbXbz26CoyrdN027SU+4NWHQbPaKcY
   bEtkRs64pcGP17KKMiJXga5KHqeUPBy9eaE9/mxq5GydFwmqtzckVuN5g
   0wagnH7o0Dp5eWT8VzOgiNAYKQunHs3EUjoh3o0pDnDZm9mWLWgmoUIR2
   Q==;
X-CSE-ConnectionGUID: dgN/L9z6S3qViN7ADi1zoA==
X-CSE-MsgGUID: 7OfFTToQTYiTCKkdJzFzXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4500937"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4500937"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 06:55:53 -0800
X-CSE-ConnectionGUID: D9ijbYWZQPaI0sAM2v2ymA==
X-CSE-MsgGUID: OP31YFwcTa6MsWCBu/iTNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12190918"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 06:55:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:55:53 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 06:55:53 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:55:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBMxWY6hVktF4nlGLzvHb9+gVQPTbnHEKzdXj0zHgTDmqV9QpXZ5Z4TwGx4q3MQZddVVhGDcb6ICSO3afntvoAeNK03GgkwKeY3lFIa4O9WfAmajw8iQM2lUhWA5Llk21jhqIv7h72H7ZpJ+JRj7vRSn7lcsdIpONgO6HlVpIlVce4Dke8zniLgFvjf/ea0J4r1l+ItzUZcLCWB0cdawEuyZpqRSu3Yehe6g0pdorWdTHT6q3Gdov/BEgOJTlnSLsFtaFNj9v7dCrFISuXseBW2+YuBaaF+VzDF8ARgi8OmuqvV8wrFktakGdZ1o5kSUkZHTc8seIN54BbZFdD0Rrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PtBMb0HcGxr4jCUY3V0ToPpJXpTWQ1kMIjGIaHl6N0=;
 b=AseJkd2uYV3euvM+nwUCbrqBN9kEbCS9ea/ufMQ84LyUTcguIuvIpEe6JDycMx8PjK5h4OwkzOCfjrGzXCMe4gVJ7wNhEzayMKUdHTOUqGIobKtiJrN+DiXsMWkF/Gw1XO68BQ7G0JAX+FVRiqWI6s+y9qYTATvia6iU9UnrUqyRU/760vn7tYNlFZDafXtNE1SEDYl/oXSSqvYMpBm5q2Eh7nSHnNMPl1KCct7Wn/To65lNS4iJQB91OzctfPjM5GE/WfNVl82TZM7xsSYdfqGATZjlJM0jGsi17mTV/jmn+LwOwqW47gj7iIZBCXi2r0LkjTDlFdZGtcTTSK0Jcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PtBMb0HcGxr4jCUY3V0ToPpJXpTWQ1kMIjGIaHl6N0=;
 b=GyjzorNGUrh8cfX6m6mqVlDOwIIArC+DwYiQJYsxNsc6f/BG9gXRSQXBxXMzvebxFbohBFuIR/EBTJwjLEgMvUnJuSpIn7CnajzS2nXzONnd1M6AXY47NUl1xaM5bzLDFhc/fvoNFeOceBkG44MD3mH0jto61XYT7KyZpO3Gp2E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DSVPR11MB9914.namprd11.prod.outlook.com (2603:10b6:8:45a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 14:55:50 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 14:55:50 +0000
Date: Thu, 26 Nov 2026 22:44:48 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 05/12] x86/resctrl: Parse ACPI ERDT table and save
 CACD cpumask per RMD
Message-ID: <awhF4HnnKJDEOSIj@chenyu-dev>
References: <cover.1793864720.git.yu.c.chen@intel.com>
 <f99fa409c6df92c54ce5a76f698154162b6a4e45.1793864720.git.yu.c.chen@intel.com>
 <cf2fb9b6-ff03-4e03-9a7b-e9ff4ceae190@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf2fb9b6-ff03-4e03-9a7b-e9ff4ceae190@intel.com>
X-ClientProxiedBy: SG2PR04CA0209.apcprd04.prod.outlook.com
 (2603:1096:4:187::12) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DSVPR11MB9914:EE_
X-MS-Office365-Filtering-Correlation-Id: da2c765c-7e31-4551-465d-08df4bcd5c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|261022075727099003|261022105027099003|10067099003|56012099006|5023799004|11063799006|261026140227099003|261022113327099003|261026121527099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|4143699003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: WTxAUJMrpeZYKTTFNZnXSdwPHXjmqjDfLrzOwLYXPdMJJyErkvSLrhybwOLigKgc8NIZan6WKMqIMSX+1CJ3cfVMFJu5x83GsEtzp67/2m+gP+hhWT0Z73yEyhziT7VCi/ckxS0wM7ctHG1M5wsOyfNa3PrGzWuNJy9n+SaVIk0ENt7ZlJZ1E9Jq6G0kBnrFu5/DYwSDbO+cbK4gzVAiDUfK1KQ+AHw06OC6ygCZkeqZY2XNw9bUFKSRzQTUhxLjSOu6Kne5Rd86UUYH1TyD/1zNws+Iom4VV411I6V0jUzDKikWzW5/n4/aZOsvkwVdUuf4GjRyIeC0afLW8ydmuEON2hu1EEpSN64VbBE+Ag5+8c22c4z2w3zFFDqAi6SACEs+i5YVZQy927ukAW4uFAnw0j+CDxJJleYv4Sm0B71+KwwZF/CIAtZ7+T5MirHmIU/fwrOHaywyAtETf9P/cI+NGjolQkgzJGa+0qD26chcXrv2QVHdw+ws9quepPsd28eM8v59SfZF/OZDhZApqh4uRfUN88xMOHpyTBvnZAer6GTZky+8mwOn22KZgh6/exnK1ue9RU2rUuMGhrM4JTeMF7g0kvDKgoyGqXRt/XOR0qf1RDf0J9KY/A6dJKxDn5iAB28c6v9Q1HLQU1lN+ShgAcRItoGICnX79m5uDsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(261022075727099003)(261022105027099003)(10067099003)(56012099006)(5023799004)(11063799006)(261026140227099003)(261022113327099003)(261026121527099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(4143699003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GTzetBARJjfqJ/71j3bzihyn+v66C24hRVQ5BocFtC7TLvmbu9xuo46VWRyP?=
 =?us-ascii?Q?Pz9RVdzkUsx4lzU5mCxFISV2BtkRqAftljgJSTQk4qio6n9m8VMLgyX5ihOl?=
 =?us-ascii?Q?1nKl5YQugN5xOCivODe9XpijTmIZkg+zVrVwUBjVssuXR19CBxOBrVJbBa1e?=
 =?us-ascii?Q?MzS4HB/GCUprYqWyjmgZeVoZwg9gN8vQXAgFfFa8V1MbcIzwDQC9FEXAAnWV?=
 =?us-ascii?Q?Az4VP2OAbxfkoxhSWD6xB2YafGYk5LkGGF3xIx7edimSrOa8ewWqYJuSUy7Q?=
 =?us-ascii?Q?VTq+XcnpIjId5Y2/RsK5f1qweJhI/F3qEkyt6+xZ77XiBBXvdle6g5DdUdQT?=
 =?us-ascii?Q?xlcnU3FhEsyGS4xXJwQg2/ZDVZhWU3f0eixruXo7PJXlcgox4D4e9FwYjo4C?=
 =?us-ascii?Q?44K0mV2GukozaewIRkNpj4tt9N01HY5eM8KxtH6+Xiih9xkvXkUig8Gqril5?=
 =?us-ascii?Q?KjslMaztUtrOmiWqBolbs1RObzdC7FAjh+OSe1NLYDWEH+kbhtlGwRMGs6W7?=
 =?us-ascii?Q?84tYGS7Ekw5ftkB4y9puI0fqdGqqVJimdXhpYvql8B+ZLJUDaRMUY/h6G2rT?=
 =?us-ascii?Q?Eo+DhkXKwMvwW7k+XEJ4r+1ZeaclBA14wSlkycRj1H5AD1zoZ7b8UwnH9AJc?=
 =?us-ascii?Q?LmpeYVpAQCfubYZXoDkoBhR49nf0i03CwCplUWdfheuF5zBYMul2kq6iYYBw?=
 =?us-ascii?Q?LQo91QUSBzRu0CuxBEkraxO0myOsvEPXf/QlLQhvRf4iZJw8dAN9ymNXvSSe?=
 =?us-ascii?Q?5nhWzp85gJ4fZwikNLX1qhq96aILX69qzdWsq6ji65mDaavkjHjz+peHcCr2?=
 =?us-ascii?Q?l9AuiqJ2xMuBPAqIhtJxYS/1O5ne+fVAusDE41Bs/iquApjTSH20ccuQbEwu?=
 =?us-ascii?Q?FAEHcKUTYgH80jhQrWNfIEmJrnLBg42Gl0RPUXKW4mNvfa/WBUXTlL0lCmlG?=
 =?us-ascii?Q?cG71pAafGmljper3KRmRur9+KiembVGzB9Zd9h7ELZ0Duc47vbIw52EcEIC6?=
 =?us-ascii?Q?Qz6qMxBgV2dx9ZzJYe3ovaCs6IrH4fWCxFCSbJc1YlDrevbeHtpfvkckS/NW?=
 =?us-ascii?Q?F21YORe/OsxGxnOvJ2sJpayBn87zwGyLwhh1J2H0bkopLqQKZ42KBNTlav40?=
 =?us-ascii?Q?qATMe5yHWt2mydBdmUJLCK2BIwY201vVY8VDcXC43Owl8ewRF9LK2TzTwV8t?=
 =?us-ascii?Q?55pUeLYtdML5WPF8322yfljjs+s7TNFU3qh4OVBBuFQJMbYHyzrP1hNWTsB0?=
 =?us-ascii?Q?2S8EmZjPTws/XwbeU0J8cXPL28v/Mdxso9AvrpyNj01DqlI/fKUzj4IkMDnV?=
 =?us-ascii?Q?W576ILftBcjhjgxvvY67ZevAgWoyUiE9D7wSS1TqHdTON8HyJ0v9Rv53QSPP?=
 =?us-ascii?Q?XZBY5fKhjHDxHcR6l6xw/HghgnVCwg3UGqMIZboYF4agfWiBF/2pzujLSRu+?=
 =?us-ascii?Q?ygHZCCh6Et5isbVH603cOXgYo0z1EbQa0CSwbMG4AcRf8Hrl6INX2oN7N3A/?=
 =?us-ascii?Q?l6oHOr/ooxm5jBiT3/KROqRLJWxkypkTIUTpiMDBhDZ6GucH9Wb8lm4iqLgk?=
 =?us-ascii?Q?3O95/XM4oLu6gz4uZqLI8IfkvT838TNjGMJGfj6uuT6w6gzNBj1A6As7c4NO?=
 =?us-ascii?Q?FeSo8JhugqxkR1tnTQPEWPmXq3/A9ZU67aPNdKm7iRpRGRBXrgGcithS9QEj?=
 =?us-ascii?Q?oi2M9BEunGWSHkL2EBXK2zq9yUdUQdU+E9WImgIzPW+b6ioQgzhgIp+zfjEV?=
 =?us-ascii?Q?JekONmbluw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Mc/Qa0ougaoI6o77zxoGUfj6p5sBKdT0ynY7qHlWeAbnQwfnYKfHUXj8qKb44zEkJUXEETHlHR5QALAQvbc8B3LmBKRSPr1v8jO10zO7uWA0LFBb/rpRq4DB3rfJtmkdZhLe/wZG4IAUwMOzC0vO1za2QB+KVbmTHOn4AHXKVS4uVKdungJ9mPETgDrAvFRYIzuTSQ3tt2n+iYfcgTlXBFHdXHha+leumHOnzDpOA80AJtGrgFcuPikNvYhoCfONVFHLxK99jSNFGHfPkA54s2yTCct4amF9Km/AljLWlvF5otPHk2Ar88VBNJ1YIWmMz0gxN7Ec+lCX53nUGAUhLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: da2c765c-7e31-4551-465d-08df4bcd5c5b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 14:55:50.2552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJo4wz7BIFdqSR7wcnQxpcJrTtngkmaHog2ZVM9meS2vQAkhaEGublokYWI0U45GSAh2LigQqv3OaDvOBgE85A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9914
X-OriginatorOrg: intel.com

Hi Reinette,

On Wed, Nov 25, 2026 at 11:04:38AM -0800, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 11/5/26 2:08 AM, Chen Yu wrote:
> ...
> 
> > diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> > index b5a86e5aa4e3..2b9a13be5975 100644
> > --- a/arch/x86/kernel/cpu/resctrl/core.c
> > +++ b/arch/x86/kernel/cpu/resctrl/core.c
> > @@ -1018,11 +1018,18 @@ static __init void check_quirks(void)
> >  
> >  static __init bool get_rdt_resources(void)
> >  {
> > +	bool ret;
> > +
> >  	snc_nodes_per_l3_cache = snc_get_config();
> > +	erdt_init();
> >  	rdt_alloc_capable = get_rdt_alloc_resources();
> >  	rdt_mon_capable = get_rdt_mon_resources();
> >  
> > -	return (rdt_mon_capable || rdt_alloc_capable);
> > +	ret = (rdt_mon_capable || rdt_alloc_capable);
> > +	if (!ret)
> > +		erdt_exit();
> > +
> > +	return ret;
> >  }
> 
> Looking at the solution as a whole I do not think that this enumeration is
> ideal. erdt_init() sets erdt_enabled irrespective of 
> erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC) being true. Specifically, a user
> may boot with "rdt=!cmt", which is the only ERDT enabled feature, and that
> will result in erdt_enabled being true but that does not actually mean "ERDT
> is in use".
> 
> I think there is a real problem because of this when looking at the CPU
> online code that gates the domain binding and configuration on erdt_enabled.
> If I understand correctly a CACD inconsistency drops the CPU out of _every_
> L3 CAT, L2 CAT, MBA and MBM domain, even though no ERDT data is ever read. 
> 
> This looks to be a recurring problem and so far the solution has been to
> add additional gates based on erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC) at various places,
> but I wonder if this can be simplified by changing the contract.
> 
> Instead of erdt_enabled meaning:
> /* True when the ERDT ACPI table describes at least one domain with at least one CPU. */
> could it mean (something like)
> /* ERDT is in use */ ?
>

OK, does "ERDT is in use " stand for:

At least one ERDT feature in "MMIO-based CMT, region-aware MBM, region-aware MBA"
is enabled on this system?
 
> What do you think of changing the enumeration to something like:
> 	get_rdt_mon_resources()
> 	{
> 		...
> 		if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
> 			erdt_init();
> 			if (!erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))
> 				erdt_exit();
> 			resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID,
> 						 erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC),
> 						 0, NULL);
> 			ret = true;
> 		}
> 		...
> 	}
> 
> Wouldn't this simplify the enumeration and subsequent domain management? For example,
> with ERDT established by the time monitoring enumeration starts the values for RMID and scale
> can be returned directly (since they have been reset, if needed, by erdt_exit()).
> 
> I understand this ties erdt_init() to CMT lifetime while ERDT clealy has bigger plans.
> When the ERDT scope expands, so can its initialization.
> 
> ...
>

I agree that erdt_enabled seems to be independent of whether the system finally
decides to use ERDT - for example, rdt=!cmt will leave erdt_enabled = true, but
the system does not use MMIO-based CMT. The root cause is as you mentioned:
erdt_init() is unaware of whether the user wants to use it or not. Although moving
erdt_init() into get_rdt_mon_resources() and clearing erdt_enabled in erdt_exit()
if the user does not want to use it would be doable, the code would have to be
adjusted when introducing region-aware MBA/MBM. After all, erdt_init() was supposed
to initialize ERDT information for all features, and should be called once. Do you
think it doable to move the erdt_cpu_has() check into erdt_init(), rather than
moving erdt_init() into get_rdt_mon_resources(), and invoking erdt_exit() inside
erdt_init() if the user does not want to use the feature? After this change, we can
remove the erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC) check in erdt_get_cmt_max_rmid()
and erdt_get_cmt_scale()

+static __init bool erdt_in_use(void)
+{
+       return erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC);
+}
+
 __init void erdt_init(void)
 {
        acpi_table_parse(ACPI_SIG_ERDT, enumerate_erdt_table);
+
+       if (!erdt_in_use())
+               erdt_exit();
 } 
 
> > diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> > new file mode 100644
> > index 000000000000..2bb187255630
> > --- /dev/null
> > +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> > @@ -0,0 +1,274 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Enhanced Resource Director Technology (ERDT)
> > + *
> > + * Copyright (C) 2026 Intel Corporation
> > + *
> > + */
> > +
> > +#define pr_fmt(fmt)     "resctrl: ERDT: " fmt
> 
> When you rebase on tip's x86/cache(*) you will find a recent cleanup from Babu that
> made all the x86,fs/resctrl pr_fmt() alignment consistent. It is a simple change
> to keep this consistent, could you please consider doing so:
> 	commit 712f55054986 ("x86,fs/resctrl: Use a consistent log prefix")
> 
> ...
> (*) Please note that this series does not currently apply cleanly
>     on top of tip's x86/cache so a rebase is really needed.
>

Yes I saw the print format patch on the LKML previously, I'll rebase the
patch using the x86/cache.

> > +static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
> > +{
> > +	struct acpi_erdt_rmdd *rmdd = (struct acpi_erdt_rmdd *)rmdd_hdr;
> > +	struct erdt_domain_info *domain_info;
> > +	struct acpi_subtbl_hdr_16 *subtbl;
> > +	u32 subtbl_mask = 0;
> > +	bool ret = false;
> > +
> > +	if (rmdd->header.length < sizeof(*rmdd)) {
> > +		pr_warn(FW_BUG "Invalid RMDD length %u bytes\n", rmdd->header.length);
> > +		return false;
> > +	}
> > +
> > +	/* Quietly ignore non-CPU-based L3 domains */
> > +	if (!(rmdd->flags & RMDD_FLAG_CPU_L3_DOMAIN))
> > +		return true;
> > +
> > +	domain_info = kzalloc_obj(*domain_info, GFP_KERNEL);
> > +	if (!domain_info)
> > +		return false;
> > +
> > +	domain_info->dom_id = ERDT_DOMAIN_ID_UNSET;
> > +
> > +	for (subtbl = (void *)rmdd + sizeof(*rmdd);
> > +	     subtbl_valid((void *)rmdd + rmdd->header.length, subtbl);
> > +	     subtbl = next_subtbl(subtbl)) {
> > +		switch (subtbl->type) {
> > +		/* An RMDD table has one or more CACD sub-table(s) */
> > +		case ACPI_ERDT_TYPE_CACD:
> > +			if (!cacd_init(subtbl, domain_info))
> > +				goto cleanup;
> > +
> > +			subtbl_mask |= BIT(ACPI_ERDT_TYPE_CACD);
> > +			break;
> > +		default:
> > +			break;
> > +		}
> > +	}
> > +
> > +	/* A CPU-based L3 RMDD must have at least one CACD sub-table */
> > +	if (!(subtbl_mask & BIT(ACPI_ERDT_TYPE_CACD))) {
> > +		pr_warn(FW_BUG "RMDD %u has no CACD sub-table\n", rmdd->domain_id);
> > +		goto cleanup;
> > +	}
> > +
> > +	/* Quietly skip an RMDD without any CPU, e.g. all excluded by nr_cpus= */
> > +	if (cpumask_empty(&domain_info->cpu_mask)) {
> > +		ret = true;
> > +		goto cleanup;
> > +	}
> > +
> > +	domain_info->base[ERDT_MMIO_RMDD_CREG] =
> > +		erdt_ioremap(rmdd->creg_base, rmdd->creg_size, "RMDD ctrl base");
> 
> I am not seeing any users of this mapping in this series. Did I miss it? Is this
> mapping needed?
>

Ah, that is for region-aware MBA, let me remove this mapping.
 
> > +	if (!domain_info->base[ERDT_MMIO_RMDD_CREG])
> > +		goto cleanup;
> > +
> 
> ...
> 
> > diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> > index 4436b976aedf..e081ebdbc5de 100644
> > --- a/arch/x86/kernel/cpu/resctrl/internal.h
> > +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> > @@ -21,6 +21,33 @@
> >  
> >  #define RMID_VAL_UNAVAIL		BIT_ULL(62)
> >  
> > +/**
> > + * enum erdt_mmio_type - Index into erdt_domain_info::base[] for each MMIO region
> > + * @ERDT_MMIO_RMDD_CREG: RMDD control register base address
> > + * @ERDT_MMIO_LAST: Last MMIO region type
> > + */
> > +enum erdt_mmio_type {
> > +	ERDT_MMIO_RMDD_CREG,
> > +	ERDT_MMIO_LAST = ERDT_MMIO_RMDD_CREG
> > +};
> > +
> > +#define ERDT_MMIO_NUM_TYPES	(ERDT_MMIO_LAST + 1)
> > +
> > +/**
> > + * struct erdt_domain_info - L3 domain ERDT information
> > + * @base:	Array of ioremapped MMIO region base addresses, indexed by ERDT_MMIO_*
> > + * @cpu_mask:	CPUs belonging to this resource management domain
> > + * @dom_id:	L3 cache ID shared by all CPUs in this domain
> > + *		(ERDT_DOMAIN_ID_UNSET if unset)
> > + * @entry:	Links into the global domain_info_list
> > + */
> > +struct erdt_domain_info {
> > +	void __iomem		*base[ERDT_MMIO_NUM_TYPES];
> > +	struct cpumask		cpu_mask;
> > +	int			dom_id;
> > +	struct list_head	entry;
> > +};
> > +
> >  /*
> >   * With the above fields in use 62 bits remain in MSR_IA32_QM_CTR for
> >   * data to be returned. The counter width is discovered from the hardware
> > @@ -256,4 +283,7 @@ static inline void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resour
> >  static inline bool intel_handle_aet_option(bool force_off, char *tok) { return false; }
> >  #endif
> >  
> > +void erdt_init(void);
> 
> Missing the __init storage class attribute?
>

OK, will add this.

thanks,
Chenyu
 
> > +void erdt_exit(void);
> > +
> >  #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
> 
> 
> Reinette
