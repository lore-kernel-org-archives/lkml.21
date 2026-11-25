Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795637245;
	b=M+we576xbpXlBn31koyD6v7+V74xrx0R94hokb0l5c+0x2oXjm/xnBuxQAieCEpPRs7x
	 Qm4cGI9Bdnyk+TBwS0yWnhzHaQkTSm4oXrKMQYfG/MD36adNkT629xwEm4n6uj5e6ffwz
	 UCJP/8fzMxCW23VxTbT2BhCBBBX+A55IBf1hEEgpECycMwF7VUfxT1kKt1oLM3u3NmOVx
	 EEbSCPzTFI6aBHbNbg4mD0R3m89J+N6r9dh+dtvq/qmevQUniOYWPTnqC/fHAwHMWBxpE
	 levYIfy5+OAqu18eE2nTNy5/n5rvJqjiDo5z64r0diZtXQpA0p7MWg8bFwf+cIcIggw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637245;
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
	bh=YyAheN/xgJ8IIk1YVslzcms6+5qofRQ9uJEBx1Y4thU=;
	b=MSa8It5oKuBoLDnCiL032ftb4fEd6VVrVcphn3ficj3edd3K2KoJA2TU5CMszuaFe9t8
	 STFffEG8bS14gJImFvXH4qdKA639oKdRTBbEW110V33sj6Kw1PacQDiPz/3ZxnPYlDlnm
	 XqcKAA7AbS66rQjH/0E1yFPrPAtKKd57N+jXTT02/7zCzWQLqh56yIitggWLVNRHz637T
	 A6Nfby9m3C3FAp+ofd3VttJyq57++62XHopCatz7DOBf8CWJNONO87YimFG5ppT88ZGxw
	 E6NHJ89nAsScKcqJ2LwsnLFAlzNNJ0lq7jmiUUyCOU0vbjm6TdADYyBBJbMab8Ex0rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WwDNiZlY;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="HfI+/A0k";
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C05606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4C05606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WwDNiZlY;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=HfI+/A0k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795637244; x=1827173244;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PttKCFriHxuBkKn6upY7b7+YBmmhRDdV3FQmuZNeFKk=;
  b=WwDNiZlYihqb5WyZmBVs4jm45CJoMFBVxX3XtYrZNcAdbywTdSAL6uRc
   LGHz3T78M9T9yS4s1ltjU9ZWuSWIbDstj7TdPlNoQ+q6I5GYlc7EbQFh6
   JYJwgXDPQWvc/ERBfiNmMEslf9mBQffDzwkCPUCZKCVvVHazOqLdSqtjc
   W9JuwnZ7/9gf+vncErPigsbbdtz1MJf9/+H00S7iCW6y4/fvGg2VU+M1H
   ZlOLmjIWbWIqnfBKadHtHnrIqQms3ROnuEvNu5Hd7+7UsMF9eOo0SWMCl
   qwTLCcY43vbwsWAC76s/j+65yR8LoNPu2JMp9AKkrD+JIkRt9Bs+Hm21h
   w==;
X-CSE-ConnectionGUID: Dum4XSwERXyct8nk4yDGXQ==
X-CSE-MsgGUID: sLPpnVn6ST6Ro5cjQ2oxfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4499298"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4499298"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:01:42 -0800
X-CSE-ConnectionGUID: y1Ourwe/TR+dcQn3pGv+Tw==
X-CSE-MsgGUID: d6blD+mHTsyljfpxYRoPjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13980835"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:01:41 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:01:41 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 11:01:41 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:01:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpJ7JnCM5gTOG2TY7CWjcsMl3Zlf9oVHvQI03zgMWrJTBihQgcNBpGSr1WleAa2oZloO5sloJjF+gY5tOlwH2yR9AiWcnMdF1pk8+EqJku5bSp6PMbSpcYLZ2BKBsaYDa8LhkNvJX4qViBbXIx4V/6AZNIetB6jbhWMTQhTsTOBo3pZsEqzHQdZmsxPIuFOVfwBC3o/AJL+MUAUINr9SlaJkzDJe0MbfoAXKac/CKzomneoQJgGe5IdLDYCN3uJE8my+4b+Fvbksdy5twcdjXzQWteNGms/248IdH774D288Ev5KnIG3aDLlPyvRwfGuTqTDb5zotac3LKEPVxFa3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyAheN/xgJ8IIk1YVslzcms6+5qofRQ9uJEBx1Y4thU=;
 b=jYwiMcEm4FZIFEFybqx7IEwSL9QHjtIYQnwn8Hie6twNvZLeRxx7lWT/+V5u2sgRLu4MNqQkFIW64p+SOL9+Z3UU+uPhsuAuRE8hjKT/W/Ogjvx2TOGkVALtU3lQE5rFCg+i50M0D45eCZNVanMyAC0xpSDdgc5F+pPRkKkNXrv+DLrz1fqJcbqksyIQ3yVKJsitzdcbIDnG3d9tyBfh4x3AYiAq/j2kMjJkSNoyllLBjBxCVbAzhezSxH5JMmdcrnd9r2tA1x+Z/3JiHfKXDa+xoq73DbZWWUQxPRC4VD5xhBdK1oBnb/3ZDRtr4cbMMG9jJRSmL14JxMwKsVJsmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyAheN/xgJ8IIk1YVslzcms6+5qofRQ9uJEBx1Y4thU=;
 b=HfI+/A0kPYeNz7sVbrN+BURzgyU++ZFu7n3AQHgzuhi+NKx1SolT40s0LaIURpdzRl+pmMvIGwjswpP3iFl5dC6pe5kxHk8gq6QXH+RiCaDxaJirNx5CzD7t5r7eoJZHECT6Iu2E78OkzXH4VzzmWoRxM+t/orTkFV1uC5Tyla0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 19:01:27 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%7]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:01:25 +0000
Message-ID: <38ecb50e-0020-4d9d-996e-0bf6d43b33ef@intel.com>
Date: Wed, 25 Nov 2026 11:01:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/12] arm,x86,fs/resctrl: Move
 resctrl_arch_round_mon_val() out of line
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1793864720.git.yu.c.chen@intel.com>
 <672dbb3622255ee7df0a64ef4e74b4c9b51db02e.1793864720.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <672dbb3622255ee7df0a64ef4e74b4c9b51db02e.1793864720.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0344.namprd04.prod.outlook.com
 (2603:10b6:303:8a::19) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: b069ce1c-a325-4321-5b37-08df4b2680d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|261022075727099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: C2LEKMqh1KiC2VEAKibtaBvJBFMxZP9X/u8ummelNqTch25iozBPSZsBS+vkfZXjjGaFBERGklubNOZ3NlD8PNhlABoW1qsannYPspmE6oy1ki/4n09K2KA+p0h7VMGn7h/NiQVukpDNS5c5nrtJvPXzZQo4rUuQl6TjapzHNiW8WDH8LKjA4rkel109bBvBRj/T2YzPZ0TYZGlW/ug69UsrlHsqF1K0jjmWxpbXTApLZy4hRzjsWAqDhyKdj8xItRKxX2Cj8Flh5EMOr1KnqGjbN8Gl83eUBB41XkIy0++YT1tlX9nz4I0+NpuuGX6HrS2zBDCGgDBHs4jLynCNddech3kViSFKFVU2vnuuBd8vEMOWFyVb/ZkC9BNFfSQ4ZX9zszd/RneKbGw9kYvh3hCG5AEnbtdGzJ928Oa96L8NRvHIpriqMhd6gcu6BTunBsz4PZ8ZNOtwd4cYBRvWPt7bY714i/zBuXOXrvwZChAfqM2ZHUX1N/jR0lqy2qRaA5USrCzui7gwgk/Rb3De7kyVXkypYrr9m5lL94hBZ9ukbOxYbPmCfbG7gNuV6zLXQoe3KgqOd8NHM28+DWFBKvGnbqpJBUfZKKFunD957W8iXetfLsmIWjqAeZHtCIS71pC6ziizbA9bpyxqyklgStioW5RK6I75t4ju18Kf2vM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(261022075727099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1lvd0pHcUROazI4dEhuYkJwYjdqWjd2NXYxNnF5ckxMMWh5VlFBQWFQalFE?=
 =?utf-8?B?NTBaZ0NtOTdaZlRQR3ZTMWJUemdPUU5saThmMXpEbWUrUmMzcVBrdGh1UEE4?=
 =?utf-8?B?SzhDQy9HSDdGbUF1eDNjTVZTTHNuL2lFVklTQlRHSkVoS1psU2ZGdWtOeDA1?=
 =?utf-8?B?RGRTbWNKTHJLb200R0gxSTU1bG9ZU2srS0ExTHdqallGbVNENFhwMi9FNmRm?=
 =?utf-8?B?SFpaZEF3NkRaSExuVDRnYytxZkpDemYya2NhM25QSTdrVFhjeEhNM3JJRm5W?=
 =?utf-8?B?M21mYW92NUVZS1I4M25sai9NUjAzWmcyY1l4NnFGL1gzU1dqTW1WRUJ2S3Zs?=
 =?utf-8?B?amV0dXlMK2hVQ2dLZnU5ZkZXeDBlK0QzdFByN1ZKZ1J5M1BLUEN5WE9lcys0?=
 =?utf-8?B?Q1VZNndOSlZ1MXNqK3RuQTZVeVlzR2JWZWY2NkZsU1BDYUROZU43blNRcGpD?=
 =?utf-8?B?cEduU2ZycjJETXE0L2t0VHh6dXZTRmFES3Z5UFkzSWdJSk5RZjV2SFBUbGc5?=
 =?utf-8?B?MVFOdEN4UXkrbEltSjVvQlZDOXJQbVRmY3hjUkR5WThwNGlqN2V4TWdVQWU4?=
 =?utf-8?B?dUZkVUhQb0dsUWY1MGRmYU82dVBvNi9ZbTNoME1hL1JJL09uVGpyTDcxZ3FM?=
 =?utf-8?B?SGR2b3p4YjJNSVRzT3ZTVVBBT2R5MXBOWm9ha3ZqdTVZQVhOSW80ZlVmcFRO?=
 =?utf-8?B?cTNBVlFSc0J5Rm90UE5yUDFUUUU3bzFzWmNwWXNqQWFqazhOVm41S2tVdVc0?=
 =?utf-8?B?aERmajNER05GVlFhTzM2UEFUWGdMbGZGSkpscHRpcVNQR0JtcmNGVGlEaklN?=
 =?utf-8?B?ZUxoSmxMS0ZzN3VGZXg2YlFlWVltTHZRdU5yRHluTUNhQzhNMFNzOW5tTkx0?=
 =?utf-8?B?aWEzd3V4M2VLa2xTN0xTQXVoUmV1VUpWbnEvZUwybXRCaFlhc0syVDFjUFBN?=
 =?utf-8?B?cktpZFpxblVHS0s1cmtOcTFXQVlYWGZhbEVQbCt4MGMzWlpiZkViVUpzdWhD?=
 =?utf-8?B?cGY1NE1JS3pySE41aVF3NWJUbnNMcjViVTgvbDBRbmhXMWo3ek9kQnJHSmo1?=
 =?utf-8?B?WnhpNm14ZjdGM0I4RHY4UmYxRXNMeHNtRzB0MGhYb3BoZElWWTVCaUt4Qytx?=
 =?utf-8?B?MmdTY3BUNFlJMytCR244TUZ6M2dubnZybzVubFdYc1VlSzF2bEtvNDZPY2RR?=
 =?utf-8?B?bmRUMUVaV0ZMSlE4bXJSNmRGMTU2czUvVUNWU20zaHVtdHhsb3p4TEI0WjNp?=
 =?utf-8?B?dG1vYmxFZGlBbVgyZDhnWElKd1VweU91dnB3SWNSbEtrQWhPMHgzejJLYjVL?=
 =?utf-8?B?YUhOR3VDSm1oWTkxNXNINFlBSlM1Q0t0N3FSQ3k3czRwR3Z3enZMNWR0elNn?=
 =?utf-8?B?eHRITGtMbldpN0l2bmZCRkhUZ2prTmhVWWdSRVlGbGhXSFVSOFQrRVNtWldG?=
 =?utf-8?B?OC93Q3FUQ0I0bVJxaHhtK2txYjAwaEpSdjc0VUZCQ1oweTN4Ni83aHlPM2FQ?=
 =?utf-8?B?MmY2Z095aXAyZE40WHExU2psQ2pPd0VxYkt5enFvcE5USlBJVkZiN1VZL2FE?=
 =?utf-8?B?Y2ZYOXBXRXNGMGJPc3c1RnE3bGtaN25aWjQ4UlllN1k0YUdDQmMrYkFFZjdo?=
 =?utf-8?B?T252YW54dEVYb1NUVzdjRU9KWFc0ak1NR1FuNVd5T1N6eXU2Z1NkNGRjZVZX?=
 =?utf-8?B?WnArOTgyRndMdWEyWmpjbk5Mak9QekZmYWE3SUZ0b3dPZWI1SkdnQzBOMWp3?=
 =?utf-8?B?YjV5NStCKzJkQzhHQ1hkSTlpZ0ZxTjF5MUJMeG8xeTdDbGV3VVEzQkJPNWdo?=
 =?utf-8?B?MFhBVVMwTGVITWNOZDUvNlpwNGJ6eEFMQ2ZMZHNxSmpjUTkwVFFzaUJ2WWJ5?=
 =?utf-8?B?c3l1emI2ZkRtRjJJazRDWlhSdXdJaGl6NngwTGFzc2hFd2c2M2hZOTh5YXov?=
 =?utf-8?B?aXVyU0UzOE0xUkRBUGpnSnlFUkJkOWJyOVF4KzlFY29SSXl5bi82SllRVmdE?=
 =?utf-8?B?SC9yUURRd0lrdU11TlN6bVhJa0owdGVYeXJLT3JZZHJyVlM5a0NWd1FmZlBh?=
 =?utf-8?B?RFVLamo5dHFxOWZkL1c4VXpoZnEvTkVLMk5RdHlhWjN4RFZuL3o4bXJpOVgy?=
 =?utf-8?B?bndnWEpIWmRMNDNCbnAzWmxpN0dyTDltNFpRd0dHOXFUQ3k4MzAyakpmL3RS?=
 =?utf-8?B?a2dtc2xzTXAwTkgvS2NjUTUwaC9wOE5ON0g1bzFNa0RBMkxPNjlCbTl4USty?=
 =?utf-8?B?aDAxZjZ1R1dpa0VNcjF4NmsvWVdWblpCZlZVbUVMcHVxNEc3WWpqSXp3aWJp?=
 =?utf-8?B?SzlhTk5ZSlozYkRjRUtMekRvT0RRN1h2TXhMT2dVZHA4Qmk0TFF0RWUwWUpa?=
 =?utf-8?Q?F7bVd10O1xCmiA5U=3D?=
X-Exchange-RoutingPolicyChecked: QLx7O2fG6qL2Cw8/G4zixitKBic/JFPHVy/2D0dbzZSZuYkN8UjNx1jhDkYa3hHiYWIN4vhuzCzAg4GFZayKj96VmGmgssGml8g973WrdXD5cLLraZlVOTmNtQ2hqVm0xYVvjNs1i44wSNEAkiazUaEAWluQZqfCRaWz8XYJ9Q/1rTs+o6IIvEC8jOI2lmD/vZmPTG+Oah72qBMNO94lCaGrQra465/SAnOgAvyCyGmTpbDZ/Chk6RtMvsgtqbdKcYFjP11sXvuPtQ9Ias21fkgn5nKGxS4hzFJY2QJAyLWamVGm9fDb7PFADAZcJPOuJgrUOohOOMQKgmFPxPFWZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b069ce1c-a325-4321-5b37-08df4b2680d0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:01:25.3347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qinYSlgnlMD0Po5pqBNPuyWSkiiWRFCQurox/8ard82+dkjDMA1SYsjTjOYo18lRLcR9nwVI8Xk5oPBXB+TPLY12pOTFqkBIC+Mmzfqxms4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
X-OriginatorOrg: intel.com

Hi Chenyu,

On 11/5/26 2:08 AM, Chen Yu wrote:
> resctrl_arch_round_mon_val() is an inline function in the x86 and MPAM
> architecture headers. It is only called during resctrl initialization and when
> user space writes "max_threshold_occupancy", neither of which is a hot path that
> benefits from inlining.
> 
> Upcoming ERDT support needs resctrl_arch_round_mon_val() to consult
> ERDT-specific state. Keeping it inline would force ERDT prototypes into the x86
> asm header, fragmenting the ERDT code into a header where it does not belong.
> 
> Move resctrl_arch_round_mon_val() into monitor.c and declare it in
> include/linux/resctrl.h alongside the other resctrl_arch_*() calls. Move the
> MPAM stub from arm_mpam.h into mpam_resctrl.c accordingly.

The final paragraph narrates what can be seen from the patch self.
How about something like:
	In preparation for ERDT support, declare resctrl_arch_round_mon_val() with the
	other architecture interfaces called by resctrl so that resctrl no longer forces
	architectures to implement it inline in a header. Move the x86 and MPAM
	implementations out of their headers.

> 
> No functional change.
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Acked-by: Ben Horgan <ben.horgan@arm.com>
> ---

With changelog fixed:
| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
