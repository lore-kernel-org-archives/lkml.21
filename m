Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795010585;
	b=dsxEVnpIv+SxmClNcUfvrdDvcwQ2K06LY2cibamvgAN6UJzzD+t3Y3qtW9mAblY9pwLc
	 j75KGrZcIaOboW8al2sFXSaqYJan7lf3v/Gy6D+rC7qH79GRAengDR34AL7KCEtGvwEJ+
	 YIcQrGEkstNswrr40HSa4myWCkfrUge0WjX6OdtQLy3IgHq+I+5LfSxqan4AWLQTZ0wTd
	 EqrFNlxcUevpfTeazcWZLIG8CYy8cVme1kjKgSDHVQTDxCcIGWseU3kQdj27h/jgMyCp9
	 v9t1V2epC+Z97pUXOMVIFalVmBHJ/jAUTCxbLkyk6RWBHaqcH2ZNCYG6oH+yREKoT9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010585;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
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
	bh=W5XvXkTbBLUk+G+5Cznia9o4JICxiDpJhk4pqVjbvmA=;
	b=rQONrL2joaXu8MENuFUOzVacGI8g3fwfRNdT4kkxEmWKMly/nvcOiJZNqM6Ql72YOxQ8
	 sghYnlEIDyy44aYXwqffchkzbZwf3wKKin88fRF4w+vAUIeZ7c+VmmFTbokzofK4fU6Hn
	 vMibp2B7S/Xcf+avobe6RjX79YbnnJW3cS6zfZrcEd+zloWT9bMZv5QB06+IvumMzI7Z3
	 V6mAYyjwm0sYh/qiBkspC/Ff4SO2vo2WlmPQGo3YWz5jFger4hbJwnLQ8PrXFpe/p3c+N
	 kXevKCbxq1tkNgEWibVStCvH3AdCJscYo0/IgbFTLMvnndtyGjCXnobCWHukQCgIE4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RQmAxkOy;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=AZedqMPo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6B8606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D6B8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RQmAxkOy;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=AZedqMPo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795010584; x=1826546584;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=AZPnkV1cRdBRKPTNSYDgAkpUWukGqeaCC/cqSDt/is4=;
  b=RQmAxkOyr4t1XxCuc9+yQMdGZjg1ZitIb/0KVeAhc/HBrFSC2NGHcNY+
   D28L83P4QmJlKqwlwBIP5ZdRaFBj5jbunmMPwXXHhYCEiuBMPAG28LLZD
   KGAnus05MQpHTB8mo4bxvYd3ovXTR9qYT2B/a+xIyLjyclwm2G+rchFy2
   w5rp2Gl3Zr4mzCXATqxXSPcefzXnclDq9nKkeBbbdUJ84chZR9n0aSXRl
   P37pCYzz2Yo/hvqw7FKUieBadQOx51P01dKrQuYuYlOFg+ToGuPCDQsH6
   aoY6avDNxcMpL0WFl4tRxIJShkThYFTJJd3fSc6wY30Fv9rbL4ZTWSGyW
   g==;
X-CSE-ConnectionGUID: BgGVXWTgQCCuNbknjjbQ0g==
X-CSE-MsgGUID: LUTTVS3ATxSMMMHX+o8P7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3812239"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3812239"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 06:03:03 -0800
X-CSE-ConnectionGUID: WyczcsDqQt+V5HnObgs1gQ==
X-CSE-MsgGUID: xYDxaKwFSD+l7FtJFHMZEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10243675"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 06:03:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 06:03:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 06:03:02 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 06:03:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVPaxurA1i4aqK9FPRtVDdUl3J6fxOIiQNK0/Z/tN3DIOdacArhhs1ztFRbsYyzQclGpT51yDo0sDayQMfus+WCCtveRGtXxB1c4XEhZL8q7Rr41LIr1lZMAn5PdS0CoRp4/ywuKVHFTAM7m3C+DxmkwKDEDv+GG6weRGFnqHN66PboZ3ymn6/sL8spLxOeiQbgSEAPeqs2Jv+Om5C6yXfN4iVVk4HSASIylxfA0R1eBghq5Bzg+dy8GXTkWFe3fgqknFMFE8r6yHCzOruqNTyiI5i65PR3NJukZsYEtTwI9IGPDvUJ38D5MPwyfgJrpZXmvzQ1SWos1sWz6nvfgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5XvXkTbBLUk+G+5Cznia9o4JICxiDpJhk4pqVjbvmA=;
 b=WzC9HsGm0wATlMGeIPY1QCsxwmynujHXrz9b9dFOlv71BCUSh2r9g3HGgcStW0QToX+aQJyeUWG+s7qxVR0VO900HkYxGQUZyG4g+L9MiIYv8n4/zlioJ4rdBfaA95M/jGi28/uFphTGcqi6Qi6peyx3GtU5M2w6Vlyf0xySXXxb8cMuEFd/ly7AGeeydZmrHXX4orcjAtr+eiV2NfUmxu8i3/GCLgaSqcVXX4VX1o3kw+tKEjtT/Hh8FXX0+lPMikgIItfmgOwo67NSGRtk+m5e9oYXE7OEEw/1hokqOzhQW0bsDrfj5Y26duZ+ftxVgdopC+G6PtSs/IJaqdc/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5XvXkTbBLUk+G+5Cznia9o4JICxiDpJhk4pqVjbvmA=;
 b=AZedqMPojYnruh4JMHd39koJXTxGpu1DbE9Wb+3qb9frsndSBJw6pLVJyDQho04wzbqOhSeQ+OLsZdGf6ZpW9RpK7jaNm5/2zkPwO5YvqQDViq2jINlMN4qAzdkazyz61QPi4suiczXphvxGEru1f1Uq52gvM1cxiUXQQbplbNg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.14; Wed, 18 Nov 2026 14:02:59 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 14:02:59 +0000
Date: Wed, 18 Nov 2026 21:51:49 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Jirka Hladky <jhladky@redhat.com>
CC: Chen Yu <chen.yu@linux.dev>, Tim Chen <tim.c.chen@linux.intel.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, "K Prateek
 Nayak" <kprateek.nayak@amd.com>, "Gautham R . Shenoy"
	<gautham.shenoy@amd.com>, Vincent Guittot <vincent.guittot@linaro.org>, "Juri
 Lelli" <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Madadi
 Vineeth Reddy" <vineethr@linux.ibm.com>, Hillf Danton <hdanton@sina.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Jianyong Wu
	<jianyong.wu@outlook.com>, Yangyu Chen <cyy@cyyself.name>, Tingyin Duan
	<tingyin.duan@gmail.com>, Vern Hao <vernhao@tencent.com>, Vern Hao
	<haoxing990@gmail.com>, Len Brown <len.brown@intel.com>, Aubrey Li
	<aubrey.li@intel.com>, Zhao Liu <zhao1.liu@intel.com>, Chen Yu
	<yu.chen.surf@gmail.com>, Adam Li <adamli@os.amperecomputing.com>, Aaron Lu
	<ziqianlu@bytedance.com>, Tim Chen <tim.c.chen@intel.com>, Josh Don
	<joshdon@google.com>, Gavin Guo <gavinguo@igalia.com>, Qais Yousef
	<qyousef@layalina.io>, Libo Chen <libchen@purestorage.com>,
	<linux-kernel@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>, "Reinette
 Chatre" <reinette.chatre@intel.com>, Philip Auld <pauld@redhat.com>, Joe
 Mario <jmario@redhat.com>
Subject: Re: [Patch v4 17/22] sched/cache: Avoid cache-aware scheduling for
 memory-heavy processes
Message-ID: <av2tdXOhCjMgLHsq@chenyu-dev>
References: <a2d7e7b2-5a4c-48bc-b567-61e3cbd17786@intel.com>
 <20260410092057.GG3126523@noisy.programming.kicks-ass.net>
 <CAE4VaGAZavgRWDf=ukaj_EJvOO52hTpAYKPe1JEtUE3E2q0y0w@mail.gmail.com>
 <13d982ce42116f876f01a77bae7f02d3800f08fc.camel@linux.intel.com>
 <avqYbuJPHo4zLDOd@three-body>
 <CAE4VaGAL5FPGUrG76pzf=9pJTaMWa60pbkLv-ZXCFjr5H2JpDg@mail.gmail.com>
 <879c23213859f24b12a23530d6ae849bbe504b6b.camel@linux.intel.com>
 <avxDmPs4rs39NC9O@three-body>
 <avxGoEVvohbK0nUS@three-body>
 <CAE4VaGD2idBi35zDQWCY2ybB0spz+tKEX5=59O5U5tBbjGuYAw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE4VaGD2idBi35zDQWCY2ybB0spz+tKEX5=59O5U5tBbjGuYAw@mail.gmail.com>
X-ClientProxiedBy: OS0P286CA0161.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16a::22) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SJ0PR11MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a78815-65f7-4d79-051b-08df457ca70f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|261021135927099003|10067099003|261022075727099003|5023799004|56012099006|4143699003|11063799006|261026140227099003|261022115727099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: 94VKFY+zP97B5lf/GC5TZV59ke+qJnjn3RuxV768IusBIO87byxCOaXsyT38dLuRjlSpl2CjMLLnaAU+fcXlF13Et9RnUzjWkRBJjxqpQEVC02KR0/zQ/edp4rsoRga50pYkvw7ej9aXtxSZRoyYcQI+RqEJ6yjwKHT9RGbKmUTvigaPjhNtTn9iVRAhD9zXcyIV2idP7twOEdHDqDlELCqKi3qqFQ2iCTo8ZmE1l96VxrfVvcRsOjvt+7El/JXk8xp+SrsVTItYXc3KHp3n41t20pFPS59ZI5bLpcKz3jOzWifUEkTtTlHV5eOw++iujiRf+qazuNbwL1BRDXPx1V39eAZMBzCdA7fbieEua+Dm+QhlwJFmFfsKbnQO1Kyb2fhGpCSAlzITT2LCUHkzq7swWVuplZVLFhRY8SStqFkkbjFh8d5ztK3u+VJ6CODCoEvamW6trGv81ndaY9rV3VGbBPVfmEpqKG0v7nUL5VJ/joMHt+5iRN2hZf9pML/hqxXBxlr5e4+Vc0U90QlCUxd47UOWvTi96ncQ17Ze8LFp1VRtpJ31eFNDwnU9k+CAs33XQezvVW3jEyUe1YSHGJ6radbndM7SgKrN72IvV9fduVdHO0iWdRIXCqKeE16nPCZL4DyKXMsnJo3ijWjHWeaId8Zx3lz8mh6CGdSzyjQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(261021135927099003)(10067099003)(261022075727099003)(5023799004)(56012099006)(4143699003)(11063799006)(261026140227099003)(261022115727099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QEmmgeIzhMgDZfnzLQIdIGm5ivHW4pPdBPiUN38h0wOokFuerXXAsPMWi3kM?=
 =?us-ascii?Q?uY/+Acl5AdMxI1Ck/98mHr4l35i84UR9IPDMZ/ZWOpV2as7J2vQ+gheWu1b1?=
 =?us-ascii?Q?UkvIQz7e/pa4Wzslhqgt6hreyZ08XBThSS+d7ApttuSBN1lS9u2LtHFcXpL6?=
 =?us-ascii?Q?COELmkNj1mp8ovf+FtVeil7WC777xYQ4Dwen1L8eAGIbJDeohJ7iS/nNncOo?=
 =?us-ascii?Q?gAYK1iR/UrLcOYaic5eL0Fw+5LHe7gSd/E+R+n0YJnwgolt3zEN8h96FKsXO?=
 =?us-ascii?Q?MiHtt5L5gJEQHgbNgSTgxJcdPBzzGipV0bC6iqbgH64To6ogUg83DeRHs5O3?=
 =?us-ascii?Q?gkyFyGRTBdrWjsl44qSxU7zZ8t2Fj+LhtUU2LUIs5BUdETQRzvjKtpAlyGox?=
 =?us-ascii?Q?3dVNzx80UOoYAYYV+HHLPLEOkRxYtT5HOBu6NXuG8UlHbwruYS8W+22Gyrar?=
 =?us-ascii?Q?UZ/nuHFYGMZ9xq4pIliq5E1H26620o1+nyBQJxTyI661rYxJ8JCWMNCk+g0J?=
 =?us-ascii?Q?ytPo+OW0f+EL/LyvEkWWZRmH6M4iRvgdMtPYl+0n1FQr90YF6/kQHrFC0KOP?=
 =?us-ascii?Q?GXNncL26haXdC0sGlNKRYY+hRzT046FafYT2O/e20AhFzm6XjqiFuCbkOxN/?=
 =?us-ascii?Q?tGSfpXgIs86+MOpvT2rQYYenwd20U9cBqMz2F2+m5Get4SOi4MmVBVQuZ+W2?=
 =?us-ascii?Q?cwCjI0yUE9bA/rQIsvnPlCFZJbuUmyo5Ih/z+LBJS7ncNNzewMgG/TxVaabH?=
 =?us-ascii?Q?ADTwQywn4hWwF52VrC58HIiFo15waF8EWLTKYFmg1EEpTTCMpAF51BtN6j8a?=
 =?us-ascii?Q?5M6Pfil7gm4iE3bEUWxo4UIm/iuhD4ULCiqcy+ZLuHDeyBsBfcZLqgLD5Qta?=
 =?us-ascii?Q?U2YUu1jJW6tZ5pyN0c/p63pxP5O8FaQe8PeX/nj9ruy88VuTB7z+z+BUNM6w?=
 =?us-ascii?Q?F++VJhkIWG5gBVdPsPUrbwh46MUL28xWpdvBs4UE2GJ1NjKsSPyN47eax386?=
 =?us-ascii?Q?YquyeeWGv9/glRPqzkESu4kwB9OCWtr/7D5+FHxgT7k2A/NTNnO3+zgMDKdk?=
 =?us-ascii?Q?e8o+1ouvyopj9//lkOyFvm4b5ef6iAs06Hm5ybkZuougic3h+23WTfYoD94I?=
 =?us-ascii?Q?o6Jd4n30TD7uCI9jf/yz0nAmmAY54THhqMnB7DVZCVdxtydHiKL4sXm3i6Ht?=
 =?us-ascii?Q?QV3OhjkJ3JL04l3FxQnaMrVNeLsyRghnVl9SGHhWgNPaB86DhOnOfTSK/Lu9?=
 =?us-ascii?Q?kopq5CvU55gdO7wPeoZlpddys0rFOEoTpLejcyOQYVSVl1zFmSO0W6Wgf2Zj?=
 =?us-ascii?Q?O9PcjtrX4ls+tW41gOfWxLx8urasaBJzPkf2gzBNBwmx77BJNO84E/CunKC3?=
 =?us-ascii?Q?sRxXv2rOPDWH5hklb5k1WUxDW3ztf05FIoXVoKIW03dM1KPykrIDDw30yG8V?=
 =?us-ascii?Q?Pu8tnzrHeI2TqmSrWfZAfpuIU0Mn8cgJFt5o4d1tgN/8E/0lZcPcBLdnODuM?=
 =?us-ascii?Q?PRXRG0TbugWTQgnl/sQfktYUNt4+cVsJUH5maKG9o6BsOi2nDo0TWJZQYhxR?=
 =?us-ascii?Q?sLbywPXo1VSXt0Po55Ig5sRAD24byRoIY7Pf0NSsUiJmWF2JOGa4OvJDtmsn?=
 =?us-ascii?Q?856L+NtphSnHUKGhthWYBixpmNX6ipTfMA5BrI5it6JGKELphA0zhKtumv/k?=
 =?us-ascii?Q?cvw2H3qLJvwwvmuFVHhE18qtrvBf69dIl8illPTzFKJAQ27OGdmtLVLkTXJd?=
 =?us-ascii?Q?tw8ai3LOGQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: yL5FtZzsskEwTEcegRjhUIhhUuQjeL8OQrPYNJF1/w1gzxltIoHphycyJkBksBXPr6PZd9aJDsJhjZ/poQVpgBI0GtK8/VbH3vV65Eig6Vp5GVtssstjIYPU8g/hktQdzMfbaETCDCyhD4a3oWpIT+y5mt37mVt5Jl0Q5od4smAiE0ADVM1s97vEFuoc/2QnMnRFix+sQippb0rlPoaVp64VyZzavfUWxaOEb5Pf5FCgPP1bEMXleoYPF96o1zAq7XxgRKx76VCywJqr3/2Rsat/4klHxAJQW7nNZ4IyxNLh2UuFq5Di8okDN8VAI+v8TYzhcztlzjlrslMVYwLt+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a78815-65f7-4d79-051b-08df457ca70f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:02:59.3019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvUvbVykouHzcKYP5Ugxs/uzzA+nHuEwBPnb9qT+/JsikulJUKENDcR2KcxMP2x4a7xH4YZ+a+DK3weCGkokxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
X-OriginatorOrg: intel.com

Hi Jirka,

On Wed, Nov 18, 2026 at 04:06:55AM +0100, Jirka Hladky wrote:
> Hi Tim, Chen Yu,
> 
> Thank you both for the patches and the detailed design discussion.
> Two updates: the trace Tim asked for, and test results for the two
> patches.
> 
> PART 1: is NUMA balancing preventing the re-spread?
> 
> > Wonder if NUMA balancing is preventing the re-spread?
> > If your traces have numa_preferred_nid and task_numa_migrate activity
> > after the trip, that would confirm or rule out out.
> 
> I traced it on the Fix-2 test kernel (mg.D 1x64 CAS-on, two runs that
> aggregated on different nodes, same structure in both): per-thread
> numa_preferred_nid sampled at every context switch, sched_setnuma()
> and migrate_task_to() in the task's own context, every
> sched_migrate_task with origin and destination, and wakeup target
> CPUs, alongside the group state per epoch.
> 
> The short answer: yes, but only late, and it is not the main
> obstacle. The run decomposes into three phases:
> 
> 1. 0 - 4.9 s: consolidation. About 30 cross-node migrations toward
>    the aggregated node; the footprint crosses the threshold at
>    4.2 - 4.9 s and grp->cpu is cleared.
> 
> 2. Trip to sweep completion (4.9 - 35.8 s in the traced run): the
>    re-spread runs at about 0.5 net cross-node migrations per second
>    (thread placement 2/63 across the two nodes at t=4 s, 18/47 at
>    t=28 s), and numa_preferred_nid is -1 for every thread during this
>    whole window: sched_setnuma() first fires only when the sweep
>    completes and placement runs, at t=35.8 s. So the NUMA preference
>    cannot be what holds the re-spread back here. What the trace shows
>    instead: the wakeup placement keeps directing threads to the
>    aggregated node at roughly 2:1 to 3:1 throughout the window
>    (1264 vs 87 wakeups per 2 s at t=8 s, still 639 vs 380 at t=32 s;
>    these are OMP barrier wakeups landing near their wakers), while
>    the periodic balancer moves tasks out at only about 2 per 4 s.
>    The net drift is the difference.
> 
> 3. Sweep completion to end (35.8 - 42 s): placement sets
>    numa_preferred_nid to the aggregated node for 53 of 66 threads
>    (the pages have migrated there by then, so the fault statistics
>    point there, exactly your reinforcing loop). From this moment the
>    pull-back engages: migrate_task_to() toward the preferred node
>    appears, and the cross-node churn in the last 6 s is 8 moves out
>    vs 10 moves back, i.e. the spread stalls.
> 
> So NUMA balancing does prevent the re-spread, but only in the last
> 15 percent of the run. For the first 85 percent the preferred node is
> simply not set, and what holds it back is wake placement plus the
> conservative pace of cross-node load balancing.

I created a test case that can reproduce this issue on a SRF. Actually, it is not
the wakeup that aggregates the wakee on the local LLC in wake_affine(), that
is the expected behavior for fast wakeup. Rather, because the tasks are first
aggregated onto the same LLC by cache-aware scheduling, the wakeup then tries
to wake the wakee on its previous/target CPU on the same LLC. The problem is
that load balancing spreads the task too slowly: because there is only one running
task on each CPU, active load balancing has to be triggered to spread the task
to a different LLC. Active load balancing has to exceed an upper limit of 5
failures: cache_nice_tries + 2 = 4, with a min_interval of 192 ms because
sd_weight = 2 NUMA nodes = 192 on my SRF, so roughly every 5 * 192 = 960 ms it
will pull a task out. In your case, there are 288 CPUs for 2 nodes, so in theory
it should take 288 * 5 = 1.4 seconds to pull one task out.

The test code is a single process with several threads just doing a while(1) loop,
without waking up each other. First, bind all threads to LLC0 (socket0), then release
their CPU affinity, and watch how they are spread to LLC1.

So to avoid this from happening, we should avoid aggregating the tasks at the first
place.

> Resetting NUMA preferences at withdrawal would therefore not help this workload:
> the sweep outlives the run, so there is nothing to reset during the
> window that matters. And the wake-placement observation suggests the
> re-spread would stay slow even with preferences reset; an active
> re-spread may need to move the tasks and let the wake placement
> follow.
> 
> PART 2: test results for the two patches
> 
> I built a kernel from the same 7.4.0-0.rc2.19.eln159 source, with
> Chen Yu's sketch (as tested before) and both patches applied. Both
> applied cleanly. Same test battery as the earlier rounds, n=5
> medians for the NAS runs:
> 
>   workload             stock OFF  stock ON   patched OFF patched ON
>   NAS MG D, 1x64thr    26.45 s    41.78 s    26.38 s     26.47 s (+0.3%)
>                                                       (+58%)
>   NAS MG C, 1x4thr       9.34 s     11.99 s     9.38 s      9.36 s (-0.2%)
>                                                       (+28%)
> 
> Both reported regressions are gone. The mechanism trace shows why:
> grp->cpu = -1 in all 42,566 task_cache_work() samples over one
> CAS-on MG run. The aggregation never settles, not even during the
> warm-up: the RSS bound refuses within ~0.1 s of the allocation phase,
> before first-touch can skew anything. The hysteresis from PART 1
> never develops because there is nothing to unwind.
> 
> The VM reproducer [3], the workload that benefits from packing,
> shows one cost of the patches and one way around it:
> 
>   VM runtime:   stock off 22.12 s, stock on 17.66 s (-20%)
>                 patched off 21.81 s
>                 patched on, tol=1: 22.47 s (+3.0%, win lost)
>                 patched on, tol=4: 17.70 s (-18.9%, win back)
> 
>   cache-locality: tol=1: -4.6%, tol=4: +24.6%
>   mem-bandwidth:  tol=1: +2.5%, tol=4: +30.6%
> 
> The win is lost at the default tolerance: qemu's RSS (guest memory,
> all anon) far exceeds the 108 MiB LLC, and the first sweep of its
> ~25 GB address space takes ~100 s while a reproducer pass runs ~20 s,
> so the bound governs throughout and aggregation is refused. At
> aggr_tolerance=4 the bound is (1 + 3*256) x 108 MiB = 83 GiB, qemu
> fits, and the win returns. The tolerance knob thus doubles as the
> opt-in for large-RSS workloads that benefit from aggregation.
> Splitting the two, so the tolerance scales only the estimate and
> not the bound, may be worth considering; either way the coupling
> deserves a line in the documentation.
> 
> On Chen Yu's question, whether Fix 1 is still needed if Fix 2
> accumulates the RSS bound: the data says yes for the regression
> class. The bound is what refuses aggregation for MG D and MG C,
> because their fault-based estimate never exists within a run (the
> sweep is too slow), and Fix 2 alone recovered only one sixth of the
> regression in the earlier test.
>

Actually what I mean was if the RSS(not footprint accumulation during
numa page fault) is used as the last resort if the footprint is 0,
will this change fix the issue anyway? I guess the answer is yes,
because you mentioned that the major fix is from the RSS gating.
 
> Fix 2 correcting the initial placement does happen for a
> long-running VM, and I traced it. I ran the VM reproducer with the
> in-VM workloads scaled 10x (about 100 s per phase, 4 minutes per
> pass). The group state over the CAS-on pass at the default
> tolerance:
> 
>   t=0      VM boots; rss_bound is 0 for the first epoch, CAS
>            aggregates for ~0.1 s until the first RSS sample lands
>            (435k pages), then refuses.
>   t=16 s   the first scan sweep folds: the history becomes 27,298
>            pages, the VM's actual hot set, within 1.3 percent of
>            the 27,648-page LLC. The estimate takes over from the
>            RSS bound, the check passes, and the aggregation is
>            granted: grp->cpu is set for the first time since boot.
>   t=19 s   the bandwidth phase grows the current window to 23,576
>            pages; max(history, history/2 + window) crosses the
>            threshold and the aggregation is withdrawn.
>   rest     stably refused; the estimate stays above the threshold.
> 
> So the mechanism works exactly as designed end to end: the bound
> guards the window before the first sweep, the estimate corrects the
> decision afterward, and the flat combination catches the growth
> within the sweep. This VM is a boundary case by accident rather
> than design: its workload data is tiny, but the guest kernel and
> initramfs dominate the hot set, which was never sized against the
> LLC. Either way it is precisely the flip territory your max()
> smoothing addresses.
> 
> The aggregate numbers reflect how little of the run the granted
> window covers: the long pass ends at -2.9% runtime, +2.4%
> cache-locality, +6.0% bandwidth, against -20% for the stock kernel
> and +3.0% for the same patched kernel with the short (~20 s)
> workload. A persistent VM partially recovers the benefit.
> 
> One race worth noting: rss_bound is sampled at the first
> task_cache_work() epoch after group creation, so for about 0.1 s
> the bound is 0 and CAS can aggregate. In the traced run that blip
> was enough to set the initial vCPU placement (the threads clustered
> and never moved afterward; the box is idle and nothing pulls 8
> threads back). Sampling rss_bound at group creation in
> mm_init_sched(), or withholding aggregation until the first sample,
> would close it.
> 
> Putting the three rounds of testing together, my recommendation:
> 
> I vote for keeping both fixes. They do different jobs: the RSS
> bound is the only thing that protects the window before the first
> sweep, which is where the memory-bound workloads take their damage,
> and the within-sweep accumulation is what makes the decision
> correct afterward and recovers the beneficial cases. The cost
> asymmetry settles the default: a wrongly granted aggregation cost
> us 58 percent, a wrongly refused one forfeits a 20 percent gain.
> 
> Two refinements seem worth considering on top:
> 
> - Hysteresis on the grant/withdraw decision. The VM trace showed a
>   boundary case as it sits close to the threshold, so the aggregation
>   flips as the window grows and the history decays. Withdrawing above
>   the threshold and re-granting below half of it, the pattern imb_pct
>   and overaggr_pct already use, would stabilize it.
>

Agree, this is a good point that we should also apply hysteresis for
footprint/RSS.

> - The tolerance splitting. aggr_tolerance was designed to scale the
>   footprint threshold, and it now scales the RSS bound too, so
>   tolerance 2 jumps the bound from 108 MiB to 27.5 GiB. That works
>   as an opt-in but is a blunt one; the per-group control from the
>   prctl RFC seems the better tool for "this large-RSS workload
>   wants aggregation", with the tolerance kept for the estimate.
>

Agree, BTW, if the workload has large-RSS but does not share data
between each threads, this is an indicator that cache-aware-scheduling
should not take care of. This information can be given either by the
userspace via prctl, or maybe by leveraging numa_group in the NUMA balancing
mechanism.

thanks,
Chenyu
 
> Happy to share the probe scripts or re-run anything.
> 
> Thanks,
> Jirka
> 
> [3] The VM test boots a small VM directly off the host's own kernel
>     and initramfs, with no guest OS install: 1 VM, 8 vCPUs, 25 GB of
>     guest memory. Two workloads run inside it, in this order: a
>     cache-locality test (process pairs exchanging data through FIFO
>     pipes, reported as ops/s) and a memory-bandwidth test (cp over a
>     216 MB buffer, twice this host's LLC, reported as MB/s). The
>     test records which physical CPUs the vCPU threads land on, which
>     is how the packing effect is measured. The long variant scales
>     the in-VM iterations 10x, to about 100 s per workload phase.
> 
> On Mon, Nov 17, 2026 at 12:39 AM Tim Chen <tim.c.chen@linux.intel.com> wrote:
> 
