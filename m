Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795422184;
	b=3cc3pwDe1CSe50AMrumGlm/RfJhxI+Bw/6onsqlV+MCjLvmRsfI2wzdsVnlUD6DvRgLb
	 lEnxBlx4ykW/Da8cZ+14MlWylCw3cx4JQs/zLBhmrSR13gHHPXrUZcwweOuJz3aQ//6/H
	 pfug1un2p1IUdyrrIqN3tD7lI2OorMyxic8E50pjSFTtyge7xy5pW2rYodaCLUYnSJm7V
	 3lrbze8KZb5+v9p5rvtYF+LBg1qyAD4+ZwMC281zMFCCXiUrfQgTljfSVdgtmK5gPcW7S
	 SEirGB8fOajNdZsGoBsrS5cYSItj0NvADfQNNN3hR3LJ2n6BX4fVf7xom1NKk7A3QJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422184;
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
	bh=1S0wkgbWv0nMnf5PNFnQ7OdPnLOUyB9HBHKe8V+npEg=;
	b=I4scc1amudjtjON+vnAJJ0NnxB8OzgiNxFZrQJI8FTlhTcjJndKoeJrw8DfPBMUpfEQ3
	 IPSIC8Wz83KbV2e86AN+GmCalXMGrAOytoKayKndZiFU1d57nqGVb3/ujRg9TAWGiHCgo
	 qmoS6ER6jQsQ2OV+CS9Sozs2YADGa3tSzAPRkWiTGkdWshOt86SSBHFbHNJgqiP2CvzcG
	 qVDFjiomeRO9ioLragARCydd38pXXx7y11Z639YCouljy0W0Pkrrg0k1WiqEa/v/LhsBN
	 y+vzPfsXQjjZl8ZOZZPwIcdkxRlNokXQ9bjVXW8MTriKo0Af7HnVhPNisV+cr6M0dZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="E3i/eoDS";
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=TRQ2fElw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084CA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 084CA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E3i/eoDS;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=TRQ2fElw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795422184; x=1826958184;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=apUzsPk1UOD0Qb1fnN1lr6LmNn6tWuUUdqTxdbLx898=;
  b=E3i/eoDStpnJfsn6a++Zaa9oyMnLEUUwheNTidy994P+9uLmZbldELlF
   ahaosDxwMjFnfU6Q5uXjPmSmNKY5+HHKkth9D4Ukj2EGh+hDuZWwNctMI
   rxs9+evhG3+PBf52rDZOfZ7J375UVYTKkmMHaJ4ddnid0GMnjHVg+0yDT
   Br42JLK6fVe73m8ZyIsGdrPVLEO2PxyKVVn6syCl9TijNNve5+T06TpBl
   ZDtimFDFwPGcMSM+dJFMJdC+H9Ot1e9tgIFPZRR/fBsZJdIKOn2Y9AkW7
   RWUxmoNUI3w0W6tn5bKlitji51Tq09b0DJkBMijP4sTTqjh3sLonVqtNj
   w==;
X-CSE-ConnectionGUID: n+I7AggeS+qI5eXoMUfYyw==
X-CSE-MsgGUID: jYzqsEHjQXGmi8Wku4gZhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4229847"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4229847"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:21:58 -0800
X-CSE-ConnectionGUID: 6cvyRqOuSxuyW8kUdavJkA==
X-CSE-MsgGUID: eyiztBXHSSCTSyMNpdd7QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11112867"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:21:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 00:21:57 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 00:21:57 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 00:21:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHRfvBNAcXtcbr2LTxViccDVvqskS2LjKKO3Ay7/QZfNLxamobEE+8BpcBJ2YijEdbX9HP/l5vXXZwcxFtj2JWbqKKKSuC6NKB+2wtUnKDRCKssoVsW5WCf74UvtV1BXQCckADZeu3hao6o3/yKRD25d+DfElMVY2k3z61lOI3z5ITiCenR4hn7TbzrlkW0xe0+rsa2cRwI11Wn9RGx4nE0jLiZEEXmMeOyvff7iShwKM/H7DFhs/ICsfR5K7u7Kc31pToMiPy/v8tZ6BVGf+uuzvRg+Sh6MiLyTXx+y2I0k64GNXZsEMCrpnlhI2qvz+RCOo2Ttb/WY9EqI2G5ZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1S0wkgbWv0nMnf5PNFnQ7OdPnLOUyB9HBHKe8V+npEg=;
 b=AX70TeudhrQ6jZ9BZla3y0N3N137yzDnCLdCvPUjFmAaApd4mY4IzGe+QRlYlpNzvCQ+zn5IyhmrR60IgInXkymtnqTKo8Nes6Bc4AEwhmR1FRUy6l/fBcVw45Du10SJ0x2IL7hJkxgt8gEmQZR1ApvWrdWcmTEoYdGhteVLEl1Ou+ZRuCRj0wqzGtDp+tFfBbZLL/T2t0+UlAvQKkaRcN3/r6JbB5rmWhEZoFGj48NqEhC2NuxagD3AhDh4KNR4fUX2tJxS84Nfb6xR8o3EYZrQjMWX8n3oJoJ43XjYgtT0B9V4hUjjeqfAqpShhl7FaxFO1LeExlvCI2YVltlREQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1S0wkgbWv0nMnf5PNFnQ7OdPnLOUyB9HBHKe8V+npEg=;
 b=TRQ2fElwzUeTU/rQ26T6WJB7Ica4Q32HUXhymZjJgDT+AYFe8GE4TgAAc8jpG/BPjBfHm9ichiJjjspRnK+V/Z5XF73/gdAZVjEhvlwWSMExFEsOS7BSPYJpu+TRoCwk/j4a0BUhH7RsFkExEDNexrSsHgNjdc6llSdHGhvuUlM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA3PR11MB9510.namprd11.prod.outlook.com (2603:10b6:806:47e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 08:21:50 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 08:21:50 +0000
Date: Mon, 23 Nov 2026 16:10:46 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "K
 Prateek Nayak" <kprateek.nayak@amd.com>, <yi1.lai@intel.com>,
	<linux-kernel@vger.kernel.org>, Prabhakar
	<prabhakar.csengg+renesas@gmail.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] sched/fair: Fix h_nr_runnable leak in dequeue_hierarchy()
Message-ID: <awP1BtwYsj0lLDAk@chenyu-dev>
References: <20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-ClientProxiedBy: SGAP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::27)
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA3PR11MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed0691d-d9c1-46eb-1838-08df493ad2d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|7416014|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7H7DhYYIxw27kavL/T09LqK86J7e95kPZzfrW8QeJf+gKkOPIgIz9IltFeQq2MGmTOH/SCL6gYF7nYeESVAsKQOsRtI8edUyHEefMujnBSB5xkJeLHA04lGFf8WTSnyjIh4mGYULraioJDX9qgTrE2/f2P0YXdaLu9LQM+VlQ9Hahd8HUlKGdYgw0AY5+I6usc9B7pHD2q17ZKzsmO3sIXv33Bx/v3arXgH9e5b9wSn6ruoZG5E4C7xFpuK3A/Olwp10qv6m+ssfeWeNeoF/JuX4TlFIDt/RloeXuGop8inlshgyTc/qugaEfiKYlyMdQZL0AWcKTv1PkCxd0w/JsBWxYCkhPEjJTUsx/V8icPML2jqTQVJajGscNJMqHo6DkG7G5HJJddgLOmHNK1Ad3/p3K47abs8aq4pBMXP6BE8Q1/SQGtgJmm+gjNLsZv8BfgFW5hUv3PSzsg31rhkvnj85T7EdDqTt9i9DaeZokAC9CPuqyuWHf5BgsF64xFzJZGus0+7w35AHbxW/CBG6KgvWn4nzl3QhsZBh5Gy2975ywh0XhEPlVEf+AgZTWlfMwBiBki9ulk4n6OWXQ9j+ZfY4C/j+AwE5nqNpWjIm3C1uoWQP34Z62usfPFZsZC4t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(7416014)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+25W2SyE7zMbs5+Biy7HOuAU80znkpi/NpWtjj+I/1Y1n3Hl/lyBRmHVjW2I?=
 =?us-ascii?Q?08eUNxxUEDVgEMP3sGNh+L2cTzMC9BMWtCgwsthrMkkQNgGRfIeT7PSBySVv?=
 =?us-ascii?Q?n5LsTYfIxx9KN4BZ41LtdyBokT5ujOt4RU8jhYH23/pktX1V7e/CIWhjtINp?=
 =?us-ascii?Q?ysof9XnN4QDOkPeljA76APV95flseum0kc/8oPsKghPQiOmiTlJ6nC/P+u+J?=
 =?us-ascii?Q?JaB4wcnpbAC8HyyvaFQ1FLuGXEKiIACS9xctEyypwx8zDCUIW7MPvJpxkXt6?=
 =?us-ascii?Q?efZVaiJurZ/0EuO90MchQEseb5YSsrY4a+r9BD3aYGu5+9ViIZf79yWZkFyE?=
 =?us-ascii?Q?TAi8W93XcnFtHFU+LHvyrYXb/NemehAmO6t3ujptTxVtv7NVznr4OBrg4GSt?=
 =?us-ascii?Q?GAu4xv4PZYJvkUjcVvku/vP7i7Ou6/Apwvxrcom5QC8j8CeWtXZQs9ZY6YR7?=
 =?us-ascii?Q?/djEiIqJ++QKCdKT5T6WmQqNC925FR/Yi0+HbyLaCkjrgQIgQ1joIzMH6+Ou?=
 =?us-ascii?Q?VRhken0FlCN16mSH+kDEfI6lePMklp9nl8ewyUMe7t0o++CX0Nx4+/kXMMwr?=
 =?us-ascii?Q?iMHofUyv5VmsqfQyCwu25M/Tphu86Wb+37TuHCV1m3A2ht2UvUMrBbcpLsaD?=
 =?us-ascii?Q?HeCUULvSmOe3vcRwTLcsF2NqILUZpV3L8UJJRcG0fbNsEXZ7QRlTLpciMRLy?=
 =?us-ascii?Q?67E/hvsaAPsDRrVJ/YQrX1fxzvqDQRi8XqqHg7KPCed0mk3W/DvXXzmj1aOH?=
 =?us-ascii?Q?5d1AoG+IAbOAFNevgLIGGK1v8KgLLha25RKWQ0aDa1o6YqXKbYYJpNAMRi9a?=
 =?us-ascii?Q?g8HMVmo31gImVZKGbXWKaq9iqAKKACgoxkkjwI4JysPDI+mYxN64VSqCEnoH?=
 =?us-ascii?Q?Bwtgm/xU/D+C+5LDksqlCJm7EeR7OgHv2zqTwT/IYSeW4JbEUiE8sK862zEh?=
 =?us-ascii?Q?CF5ffeOdJPpwVteAFuGLgnJauo/hxXVlL5sUEtDy2xNcWabJb5o9HXdqFBex?=
 =?us-ascii?Q?dbQzCtqJiRshQOhAIrGGmmZfYWAd0sFBJFFUZCwF+Ak/awHzbze5QqDSW2C1?=
 =?us-ascii?Q?KNNtt2pl37IalIwYeVZKmOlZaLsyDgXQOl50nJABOCQhEHqYRQwqdYVJjXIB?=
 =?us-ascii?Q?v5q4GPX9X+l38f9Au17ujyR01lG+huKH+o98yN29Q44c1XGLnHLCGekPniYc?=
 =?us-ascii?Q?GYeAQwlUQ7YKvU4/D9Z+3hgZXUwEYBjoTQMyVD1J3EBgI1jA15swaM12svf4?=
 =?us-ascii?Q?pNUeXDfYDc6Y0wlmlYF7sNFJ4Qd84GuPMKJR5lrf3WBV8taYSZP/hMcGOfsf?=
 =?us-ascii?Q?QwGMVlSLq5v4cKnBanSkL/1YqV4Uw5ZtMn2wHusI/tWsePiMcUhjTjNNVOnF?=
 =?us-ascii?Q?5/OgNA4JRFsyb5NBwyOX0HUsEDzfN84Oxwl8AEyON70yKxVDiMmyo7yGWwPX?=
 =?us-ascii?Q?L5tJDD6cjywAOSFrole0NTQgKLO4Y8x1PsIL6qlYhCoWfpDYcOpHxCgeTgON?=
 =?us-ascii?Q?8tYxxnqDRWWcTt8SijrjHNx/zriAnhYDZqDV3+/NYbEMh7MJVqftv+qKYipv?=
 =?us-ascii?Q?Gw4SJyOFvoK+8QQ32+dFfr/HmU4jMpEcREDjUkBvaMz0buRZ0lI2QAAebkoW?=
 =?us-ascii?Q?lj7ZlRuX+7VGBIII6X2jyZUP9gf1M/Uk1xIrrqE9nYtXaLd5tJeB20O7Uc85?=
 =?us-ascii?Q?S8rQjgPlv99U752LcW2gUkVPLAwYzEPZXJS6dcY3KXA+OmXYyNbj0YPF45eF?=
 =?us-ascii?Q?mgSpV2BiHg=3D=3D?=
X-Exchange-RoutingPolicyChecked: QeyNL1n99Hbf+yIq3hkMPrRZ2gCa7Uv7fJe/rS23a4FDZaW6FHtSN5S/zZzVqf+l3Q2NcnzIhufMpErwQiNYs78K1v9HVa8sXHER7JeisGC6QtEECdpckITNCMm4dqhnm7rgHnFutNxSvQlHqQvWf9feLiSpx8PTFs2VunzPGb1MT3BG4d2FsC7u40p3U2ueEjYUjTYhrL62uNuWEc0lRUmzfGrcYx2p6R4ycDIRhOhEbxQnuG/6yXW27ZNwQXz2yG76LtkfQR+rOAHCwZtmNQBdqh5T4oqpPNaCoS4wEOYH1frgbZjVSiiFqyK9/ck2LOebUMilMHXSyLX5m3X3tQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed0691d-d9c1-46eb-1838-08df493ad2d0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 08:21:50.4728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFOgdGFbhG8J4bBoW33S7dlX8TQHqH1wxwTn7NmAMBeAzSKR/dFpFaqVZDWQ2TUjc3S8LDzDRrb8RKlG6SP3GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9510
X-OriginatorOrg: intel.com

Hi Lad Prabhakar,
 
On Mon, Nov 23, 2026 at 12:12:13AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Commit 486c3d06b902 ("sched/fair: Avoid transient double accounting
> for delayed tasks") changed the h_nr_runnable logic in
> dequeue_hierarchy() from "set to 1 unless delayed" to "set to 0 if
> delayed", but left the initialiser at 0:
> 
> 	int h_nr_runnable = 0;
> 	...
> 	if (se->sched_delayed)
> 		h_nr_runnable = 0;
> 
> h_nr_runnable is therefore always 0, so dequeuing a task that is not
> delayed no longer decrements cfs_rq->h_nr_runnable. The count only
> grows, which inflates se->runnable_weight and skews PELT runnable_avg
> and load balancing.
> 
> Initialise h_nr_runnable to 1 so that only delayed tasks, which
> set_delayed() has already accounted for, skip the decrement.
> 
> Fixes: 486c3d06b902 ("sched/fair: Avoid transient double accounting for delayed tasks")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>

Thanks for the fix,

Tested-by: Chen Yu <yu.c.chen@intel.com>

Would you mind also add:

Reported-by: kernel test robot <yi1.lai@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202611230853.e2e6401-lkp@intel.com

thanks,
Chenyu
