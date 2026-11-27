Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795790038;
	b=dLuOwGwrdcJnezYynu3pZj4HsrVWI7aBopvk5/Y7Z6fbiKPpEkNpxeeOm7R1AzW3bA+N
	 yQL8tl5byoVVJNOg0u9d/kIgIwfmXpwiAVb7zZWgmrZsjl251Od91yk0MN17ATtf4iHgi
	 G3dYyofp2UgF7GeuD4uoTrXhLR66dslcLmCzPcofNalMvGaM92g+pqzbrSUX4TDN7sIaq
	 P17jXxvBblmzR/J2lhrRokddRzOKEVJa9NUUztXx8wd6CwoWpQDLh8YmrzaOEMshj3Et8
	 2UQsm5wteCj8IIOnNo8cXQ097cLWa0NGLNoBTu94/GZxSaYjHD7crIeOUYv8xJmOiPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790038;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
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
	bh=9YkZeZHdgIYKsppNhtg5/stVn8EGNr3URdnsC2OlR5g=;
	b=NrfxIDlzHyhE7EgisFHgn2gXEJhN+kYueYO4x5zWZyep77KxsmZ8AMrFJDBrQUrIaDKf
	 wXTZz0a0h1eT2ZwJlZ6HSykN7+GaPwa/4o3e1EC1hkc3oizEAMTwdS78Cslf003Jr/Hm9
	 sxKbAJ6n0sC0vtW5oW+YqVIQbTz9uejPahtr0W1CekyYZ46Wqxam9ZbWSrB1TvOcSm1fI
	 tsjhpU1nEcSWEHgbeSM+eOiAI2NTdFt34+n5ASKTF29Tb16fbS87ahedGA0dSXu7Fkoa3
	 RA3ZL4miRIKw01D1DWh14LAmFxEwjV9TxJ/pWIc/DD9QcejKEBiMaKMY2lSfcKX2vKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MFpbVFp+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945E0606A329
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 945E0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MFpbVFp+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795790037; x=1827326037;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=GvTCk7sYRoE3JCcRtYDWMWEXFFilps8SzBQXQN2v82o=;
  b=MFpbVFp+kUex86sT0Eh269Th7k10oi1A3Uz7tdJJnf+AdGywcGMMglsn
   wP3pyMtXH3yvr7ViDMT5dztuWCaXKora4OAUjXi9tGqselVu79tfJh7Mt
   s5Zgmch2j4NXbtwL0FdQgDo8FJyJ8bpizWTk82gPb0ZV5A2peWAD+Em3Y
   NRBD9kqTBQTIM0qUmVXYYnP+R8YBgqmhUZVUGEeSSx7nk/hmVp0NlPu6J
   T8SpCrOw2wznywuHZp6y67aBELLdy8rV/wA3gJnwe+3QIMAdGY9VacKjB
   B5/YQ5g7tMNEA50pin/T+BCwecKrx61quH8QC+3F144/H3U0uzF2VPfKu
   g==;
X-CSE-ConnectionGUID: G0fPiT91Tau5V3tJ+BrQ6Q==
X-CSE-MsgGUID: 8Ej1DQZeTjCd1srTEld0IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4614792"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4614792"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 06:33:57 -0800
X-CSE-ConnectionGUID: cir62D8QQ1u4XAJi1I30gg==
X-CSE-MsgGUID: z/A43OSVTIiQJwAnRkRRSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12733864"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 06:33:56 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 06:33:55 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 06:33:55 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 06:33:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mu0XprTJnHMAGrD/ZwR0rrixgUa89e9LpyFLjBM4ifGkHaRP2M4Wz72zQ5ZdYt9wpPqE/oOAeeCfLSZIkheYHUXyg4XmopCxxnXcfs+glbKovQfGlTMjY15hgLTj41m69qePDMEvSXyCJqEGNind6I+8CwfYxKyrxuKPNYWeojKCz1M7YASlxwRNan+V49BH0ZAfY2N5bL252+pIDpLd5hjQW8jiRp8RwRPhW3C8/FLkht1wUhN7NsVm7vaha5DxOAdN45wbbfc8dJSmLrwNRqhi701dp5HJrAZI3A+ydrX+6rSwcYc2s+mRwZjNHiVZbZn1gfEkWFuvPw7V25boEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YkZeZHdgIYKsppNhtg5/stVn8EGNr3URdnsC2OlR5g=;
 b=Loo++50UUyptc8buuRKdNoz+rgpiqpgbufg7mIpKodv2wuq0IT+G0C/566uZQ+7qMAWk6E8+n3bFdm7Iik0/qxfXtROZxpUNogf92vEwH7LF8lRCoMHw0SX03/jxEHxpnQdsx4XSHEj1iZgw+vunJr56vTp8CTrLFIqBHvbShhVuem8+XjnUBgFLKOoeG4w6EhjoSwh3xS29pIEkh9HubSeNK1V88ftzoOgRuwFeJL9locrYfavUbwNzHZqd/C0O/8ynNQJjkO080JtwPpGTatctkBzkPO9K/Pxzsmuff0wpVF38qclfK6uUvH0Wz/FQvRWK3aC+FNzKrHmQfYvKGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.10; Fri, 27 Nov 2026 14:33:52 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 14:33:52 +0000
Date: Fri, 27 Nov 2026 22:22:50 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Christian Loehle <christian.loehle@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>, Vincent Guittot
	<vincent.guittot@linaro.org>, K Prateek Nayak <kprateek.nayak@amd.com>, "Ingo
 Molnar" <mingo@redhat.com>, Andrea Righi <arighi@nvidia.com>, Juri Lelli
	<juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, "Steven
 Rostedt" <rostedt@goodmis.org>, Valentin Schneider <vschneid@redhat.com>,
	James Buck <jbuck2005.linux@outlook.com>, Usama Arif <usama.arif@linux.dev>,
	Tim Chen <tim.c.chen@intel.com>, Yi Lai <yi1.lai@intel.com>,
	<linux-kernel@vger.kernel.org>, <chen.yu@linux.dev>
Subject: Re: [RFC PATCH] sched/fair: Expand SIS_UTIL scan depth for small LLC
 system
Message-ID: <awmSOioQd4gXbtqJ@chenyu-dev>
References: <20261127094038.3422499-1-yu.c.chen@intel.com>
 <20410c3b-3057-4cee-9dd6-5c3f69ac0a27@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20410c3b-3057-4cee-9dd6-5c3f69ac0a27@arm.com>
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DS7PR11MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 5efd7db2-0fef-4051-1cc2-08df4c937525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|11063799006|4143699003|261009223027099003|22082099003|18002099003|10067099003|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: KYDASn+1FxOel5JvsIERPy3nGEB7lXFhPaVvwYCbOngQv7ofszqRCWsLwqsfYMDcUo3pIyk4DxLG6HMv45pwC/Si6o0UlXxvMXtHOXOdjajst4TTASuqpzaEs6e5EJGsug6FpzoMzx2nUd9K376QdedeY5pvOLMwR6gRGCu9FiyZ59AJKCDOeSqljfj4rIGX0s8LrF+Lr0HOtfeLuXVMvUjTkk+7flRFdiX41JOnqBlyUNDC8BehxFzBpHjJABRw0yL1CtgDC4R7SnWS4iKYtAKf8afiQovGHmLEJip4wxmUWNN3aSnG8GxpjEq4rHHh92PWI01toz+Wc1HwvXH1+MYedUqlJRU9udokRtPIkL8OUmq7yUUi0VxXQoLsT2LWiOxATEjA67MQG7MbEvvfv6l2ceIMArHmGj8cCrLYfAU0g46i7pnFzaehk0AaUvmZhTR5jXI/bszd8z7j7aVvPCCv/9g8KGAe+6VZyaldnKOq86XHlkWiH7iQqcS9GzslaDJJeee6LFZnyn5DYLSX/GjgRMUjDi9qdq2Vpzx3w9EzRWEDvvadrm4tDpSWZCnoJemzqMChD06lDirYjxXtaWChrz/6xz0nRg//cvq7CM/hBYwjpNVduRKhsk+1XKpk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(11063799006)(4143699003)(261009223027099003)(22082099003)(18002099003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CXjqoyf+IJddZnmDLzPv8EKbFgRPHqAQVPsPxrbxYhfHRGFKPABHugnqsERx?=
 =?us-ascii?Q?MCRuzDi7pfLXb3wQOKiNn/HyAxR5eVvd/5zuJVeHWVYdJn7sNtDxIeYvgBYp?=
 =?us-ascii?Q?YdwAkz3TO24I+Zoux3EZhPdzbtnB/tXR1K/YVGruFptOW2DrgIOqLu5Dgcdk?=
 =?us-ascii?Q?ghSXgGiZuQfn6HocaA5x03gY0MkhKbQZgd/8qUysaazhrBnpfBs43sIjkIe+?=
 =?us-ascii?Q?nNON4MMJtqrV1DbVEpJjOZUIJyrZTmnJnQ4dOc4ycjwyOAfjuGBxPHsj/pkh?=
 =?us-ascii?Q?ClHCZDpWG/2qGcgG7zZxvnb9mJoDYSHpoEVEpkzBo/x21jhOwgIRvyPlG0FR?=
 =?us-ascii?Q?cOsjOOB6KwmQxFMLYq9V6mkEak7sSZPIZggMvVkiDeyAyfDlJ/2ghed5zf3S?=
 =?us-ascii?Q?f0Vsmx/nKzOKJkQQitSmTh7XPHCktWao//vq78CEQYDqRgkEX0KY93RFO7CR?=
 =?us-ascii?Q?VHkjW8QFKuUnyzdIPAigM68zToASU7VcewGivOzpuF/rHCJJfSvfgWYgzktC?=
 =?us-ascii?Q?ebpqmTof9AYd56FazzsOtL58VpaCYLz2LDF2en1JE79+dn644f+/z3yltHaY?=
 =?us-ascii?Q?aOtAcpkwSh6AVfuBEeP1eGWSDRxITdXoecNeS90KcVzBQSSulo7pY5FYAFbU?=
 =?us-ascii?Q?Xyb6NLWcEnW7cGW6olL+ZaeOgqyhLvEvxafRJqZm9OYQbsfBydQmmnRMExKB?=
 =?us-ascii?Q?2Xh/mUrwwM75ziMklJB2G8DZ7SO6gOyPT34siMN6gsWz6tqVHLhos7pfs6h6?=
 =?us-ascii?Q?6BusXMcEwKgX1hAmCK5tU2naUNqK5TojI6dYaC53WZdsHyOOcmrqgXMmuFKp?=
 =?us-ascii?Q?xoHwBtQXF5EjAiWToxNrDtbt2Y5VYFfWMnFjiY21Y52P0PJT/g6w7o024TVG?=
 =?us-ascii?Q?5Z8Z5hcPkr1/JvxHltop6QcKHLFxjru7ESZeLsptOKTeHcvcbdFzDiUWsYzQ?=
 =?us-ascii?Q?Yg5h73eEYgHy4bx1yV26EgiNuJSccs7883pfSCv5HWMO7IZ79uguAp32UDRd?=
 =?us-ascii?Q?Fox0EI85OUUQxfZk6eYXAjfKSMQJh0B01lKIwZQxhLsP8T87w3icEHWPXmYP?=
 =?us-ascii?Q?FNr+XgSiyUJaEmz+sSuGCQttGU9yl6hx2+haQ7xfCAwmgyO7FFfyiXEPXtLu?=
 =?us-ascii?Q?MHxLS9FNEdP8wX/CfGms6Yvo2tHURZHQipZfPtaa87YnUXh1T5OD942JRrO3?=
 =?us-ascii?Q?zBK+zd1mstwBfOah0ew5Cw8kS+c6fv2xMiFtwv5vchT64zqps5l6S4AglHJ/?=
 =?us-ascii?Q?95iUVpv5eE1k4odTA/4uQqDZxYIkV5Z7AwcLElVdclTX4r+1bvsLoGqbPH9P?=
 =?us-ascii?Q?RsVleeQnW7R6byjJMXvYsmtQ4z1PDjb1ciK2XOGVSwJzXDATgY4o7JCzC02r?=
 =?us-ascii?Q?eRkrPvYY95BoBIOQ5Zs1VM2weHW8t2J8vJR8FUot1itiVlOkaGjBQHgodkJ2?=
 =?us-ascii?Q?9HKf/mgw/Vi3FDAi4YkEZlkdCIZNH5yUl96DDBDIX+nq1BN8zNBMgI+KawAW?=
 =?us-ascii?Q?XvlazOP/g3wO9HMRoHy+yxnyELPrWDlIo5z3t8sQ+ZXrphs7iIWWfW7BaBab?=
 =?us-ascii?Q?xMXDsAnjmwGPzzE7c37Jh+HaYzM88m/XDq5fjmuK/JktNTFLo5ESGA0Ff7LZ?=
 =?us-ascii?Q?M528siZl/OJ2gnnqJmb9EHX3DQMi6aRMNgWQ6QUWhZbi2vvTObBBsuQ2HiAU?=
 =?us-ascii?Q?xKUkISslIR0FaEj16hLw70sRvq4y4B1kiroAc8saWhb0jSFATp1ZXOUqlDFy?=
 =?us-ascii?Q?Ubee0N6Zzg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Ko+MBpkSrssn2s2Izryg4WWek22c9IAkqPNfvRVjV7752z6B5I7jgdb5ucygRTJwtrnTOtmKwDFQs1TWxetAy2J29nEF19CCzoKr5o99ciLM9SgTbH4TSCgeySQ2o6/J5/KJKu2GnT/HqC8OmPNeF9j4s40N1FR7nJ8GGuk5Nd0Yp+TDnijtst3gTo+i9/H0/sZXNhuUy81bkFOKNfJ//203WxJ/oKf+Xdb9JTvLhdMP39CV+APa5qYCVOjFtn0DmhJlELf4vxyWUiYvu/17DXMaSkkfeHt4sy98ZTGvPbNZ3Uj4wgEVZScxoU27oBNzMkOco6jFst/ibJRE2S0Bog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efd7db2-0fef-4051-1cc2-08df4c937525
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 14:33:52.0666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /z+lqfzwYr/G0NAbloNOyquJ9IGGI3YSh3TPmPcx6CoumCZ2noWZZtP/1EWDakL5OB2Tj8pJ9Q/BSZ7xzXp2hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
X-OriginatorOrg: intel.com

On Fri, Nov 27, 2026 at 12:49:52PM +0000, Christian Loehle wrote:
> On 11/27/26 09:40, Chen Yu wrote:
> > It was reported that scanning more CPUs on a system with a small LLC
> > benefits the workload more than limiting the scan depth, because
> > scanning more CPUs does not cost much and work conservation is
> > preferred.
> > 
> > Expand the scan depth so that systems with fewer than 32 CPUs per LLC
> > behave like a 32-CPU system. This way, the scan number can be scaled up
> > for such small systems.
> > 
> > The effect is as below:
> > nr_idle_scan before -> after the patch
> > (LLC = 8, 12 and 16 CPUs for example)
> > Cell format: util_sum : nr_scan before -> after
> > Load% = util_sum / (llc_weight * 1024)
> > 
> >   Load% | LLC=8            | LLC=12           | LLC=16
> >   ------+------------------+------------------+------------------
> >    10%  |   819 :  7 ->  8 |  1228 : 11 -> 12 |  1638 : 15 -> 16
> >    20%  |  1638 :  7 ->  8 |  2457 : 11 -> 12 |  3276 : 15 -> 16
> >    30%  |  2457 :  7 ->  8 |  3686 : 10 -> 12 |  4915 : 14 -> 16
> >    40%  |  3276 :  6 ->  8 |  4915 :  9 -> 12 |  6553 : 12 -> 16
> >    50%  |  4096 :  5 ->  8 |  6144 :  7 -> 12 |  8192 : 10 -> 16
> >    55%  |  4505 :  4 ->  8 |  6758 :  7 -> 12 |  9011 :  9 -> 16
> >    60%  |  4915 :  4 ->  8 |  7372 :  6 -> 12 |  9830 :  8 -> 16
> >    65%  |  5324 :  3 ->  8 |  7987 :  5 -> 12 | 10649 :  6 -> 13
> >    70%  |  5734 :  2 ->  8 |  8601 :  3 -> 10 | 11468 :  5 -> 10
> >    75%  |  6144 :  1 ->  7 |  9216 :  2 ->  7 | 12288 :  3 ->  7
> >    80%  |  6553 :  1 ->  4 |  9830 :  1 ->  4 | 13107 :  2 ->  4
> >    82%  |  6717 :  0 ->  2 | 10076 :  0 ->  2 | 13434 :  1 ->  2
> >    84%  |  6881 :  0 ->  1 | 10321 :  0 ->  1 | 13762 :  0 ->  1
> >    85%  |  6963 :  0 ->  0 | 10444 :  0 ->  0 | 13926 :  0 ->  0
> >    86%  |  7045 :  0 ->  0 | 10567 :  0 ->  0 | 14090 :  0 ->  0
> > 
> > It was reported that with this change, the regression was fixed on Orange
> > Pi 6 and Radxa O6. Since Intel servers usually have >= 32 CPUs per LLC,
> > this change does not impact Intel servers much. AMD servers have 16 CPUs
> > per CCX, testing on AMD Milan showed no significant difference on
> > redis/mysql, and a slight improvement on hackbench/schbench:
> > 
> >   =========================================
> >   hackbench threads+pipe
> >     num_runs:      5
> >     host:          AMD-Milan
> >     kernel:        7.4.0-rc4-sis-patched+
> >   =========================================
> >   G   FD  | baseline s/se% | patched s/se%  | SPEEDUP | RESULT
> >   ------------------------------------------------------------------
> >   1   1   |   6.352/ 7.57% |   5.680/ 5.74% |   1.12x | noise
> >   1   2   |   6.225/ 8.75% |   5.624/ 7.27% |   1.11x | noise
> >   1   4   |   8.834/10.23% |   8.799/10.24% |   1.00x | noise
> >   1   8   |   4.833/ 1.70% |   5.060/ 1.72% |   0.96x | noise
> >   1   16  |   5.471/ 1.61% |   5.551/ 0.60% |   0.99x | noise
> >   1   20  |   5.220/ 1.17% |   5.298/ 0.82% |   0.99x | noise
> >   2   1   |   5.558/ 6.23% |   6.114/ 8.63% |   0.91x | noise
> >   2   2   |   8.056/10.44% |   8.029/12.53% |   1.00x | noise
> >   2   4   |   5.292/ 1.26% |   5.152/ 1.89% |   1.03x | noise
> >   2   8   |   5.493/ 2.15% |   5.403/ 3.38% |   1.02x | noise
> >   2   16  |   5.557/ 1.68% |   5.407/ 0.88% |   1.03x | noise
> >   2   20  |   5.224/ 0.68% |   5.341/ 1.19% |   0.98x | noise
> >   4   1   |   6.047/ 2.89% |   5.797/ 4.41% |   1.04x | noise
> >   4   2   |   5.597/ 2.19% |   5.791/ 1.77% |   0.97x | noise
> >   4   4   |   5.397/ 1.62% |   5.501/ 1.18% |   0.98x | noise
> >   4   8   |   5.468/ 2.67% |   5.155/ 0.95% |   1.06x | IMPROVED
> >   4   16  |   5.989/ 3.31% |   5.507/ 1.36% |   1.09x | IMPROVED
> >   4   20  |   5.267/ 0.79% |   5.101/ 0.60% |   1.03x | IMPROVED
> >   8   1   |   5.322/ 3.12% |   5.273/ 1.96% |   1.01x | noise
> >   8   2   |   5.531/ 2.38% |   5.367/ 1.64% |   1.03x | noise
> >   8   4   |   5.672/ 0.70% |   5.814/ 2.60% |   0.98x | noise
> >   8   8   |   5.037/ 0.93% |   5.100/ 0.97% |   0.99x | noise
> >   8   16  |   5.455/ 0.45% |   5.290/ 0.39% |   1.03x | IMPROVED
> >   8   20  |   5.388/ 0.36% |   5.285/ 0.18% |   1.02x | IMPROVED
> >   16  1   |   5.519/ 2.49% |   5.296/ 2.10% |   1.04x | noise
> >   16  2   |   5.398/ 0.77% |   5.503/ 3.05% |   0.98x | noise
> >   16  4   |   5.274/ 1.72% |   5.363/ 1.72% |   0.98x | noise
> >   16  8   |   5.416/ 0.37% |   5.185/ 0.20% |   1.04x | IMPROVED
> >   16  16  |   5.596/ 0.41% |   5.337/ 0.24% |   1.05x | IMPROVED
> >   16  20  |   5.292/ 0.88% |   5.076/ 0.55% |   1.04x | IMPROVED
> > 
> >   redis (redis-benchmark -t set)
> >   =========================================
> >   THR | baseline rps/se% | patched rps/se% | SPEEDUP | p99 ms b/p  | RESULT
> >   -----------------------------------------------------------------------
> >   4   |  1492165/ 0.76% |  1480823/ 0.00% |  0.992x | 0.541 0.546 | noise
> >   8   |  1665556/ 0.01% |  1665501/ 0.00% |  1.000x | 0.490 0.489 | noise
> >   16  |   984279/ 0.60% |   974545/ 0.00% |  0.990x | 1.124 1.109 | noise
> >   32  |   887091/ 0.01% |   883212/ 0.44% |  0.996x | 1.713 1.721 | noise
> > 
> >   mysql
> >   =========================================
> >   THR  | baseline tps/se% | patched tps/se% | SPEEDUP | p95 ms b/p | RESULT
> >   -----------------------------------------------------------------------
> >   8    |   151897/ 0.76% |   152428/ 0.54% |  1.003x | 0.07 0.08 | noise
> >   16   |   294014/ 0.59% |   296699/ 0.28% |  1.009x | 0.07 0.07 | noise
> >   32   |   386817/ 2.18% |   377835/ 0.31% |  0.977x | 0.09 0.09 | noise
> >   64   |   560950/16.97% |   481494/ 5.68% |  0.858x | 0.19 0.23 | noise
> >   128  |   752079/ 4.92% |   729685/ 3.89% |  0.970x | 0.36 0.38 | noise
> >   256  |   772771/ 0.62% |   771630/ 0.21% |  0.999x | 0.79 0.78 | noise
> > 
> >   schbench
> >   =========================================
> >   T   WRK  METRIC   | baseline/se%   | patched/se%    | SPEEDUP | RESULT
> >   -----------------------------------------------------------------------
> >   2   8    rps      |  1683.8/ 0.04% |  1681.3/ 0.10% |  0.999x | noise
> >   2   8    wake_p99 |    10.2/ 1.96% |     9.8/ 3.82% |  1.041x | noise
> >   2   8    req_p99  |  4904.0/ 0.00% |  4904.0/ 0.00% |  1.000x | noise
> >   4   16   rps      |  3369.0/ 0.03% |  3353.9/ 0.44% |  0.996x | noise
> >   4   16   wake_p99 |    10.0/ 0.00% |    10.0/ 0.00% |  1.000x | noise
> >   4   16   req_p99  |  4904.0/ 0.00% |  4904.0/ 0.00% |  1.000x | noise
> >   8   32   rps      |  6724.6/ 0.04% |  6722.0/ 0.16% |  1.000x | noise
> >   8   32   wake_p99 |     9.8/ 2.04% |    10.0/ 0.00% |  0.980x | noise
> >   8   32   req_p99  |  4904.0/ 0.00% |  4904.0/ 0.00% |  1.000x | noise
> >   16  64   rps      | 10933.0/ 4.10% | 11179.8/ 1.80% |  1.023x | noise
> >   16  64   wake_p99 |    12.0/ 0.00% |    12.0/ 0.00% |  1.000x | noise
> >   16  64   req_p99  | 10051.2/ 0.13% | 10051.2/ 0.08% |  1.000x | noise
> >   24  96   rps      | 12970.1/ 0.22% | 12971.0/ 0.48% |  1.000x | noise
> >   24  96   wake_p99 |    13.4/ 3.81% |    12.4/ 1.98% |  1.081x | noise
> >   24  96   req_p99  | 10179.2/ 0.21% | 10185.6/ 0.21% |  0.999x | noise
> >   32  128  rps      | 12613.1/ 0.09% | 12667.2/ 0.11% |  1.004x | IMPROVED
> >   32  128  wake_p99 |    37.2/ 3.55% |    34.2/ 1.43% |  1.088x | IMPROVED
> >   32  128  req_p99  | 10467.2/ 0.59% | 10358.4/ 0.06% |  1.011x | noise
> > 
> > Fixes: 61ea17a63719 ("sched/fair: Add SIS_UTIL support to select_idle_capacity()")
> > Reported-by: James Buck <jbuck2005.linux@outlook.com>
> > Closes: https://lore.kernel.org/lkml/CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM/
> > Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> > Tested-by: James Buck <jbuck2005.linux@outlook.com>
> > Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> > ---
> >  kernel/sched/fair.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index da0d9e19c457..1c0e2ac7751d 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -12937,8 +12937,9 @@ static void update_idle_cpu_scan(struct lb_env *env,
> >  	y = SCHED_CAPACITY_SCALE - tmp;
> >  
> >  	/* equation [2] */
> > -	y *= llc_weight;
> > +	y *= max(llc_weight, 32);
> >  	do_div(y, SCHED_CAPACITY_SCALE);
> > +	y = min_t(u64, y, llc_weight);
> >  	if ((int)y != sd_share->nr_idle_scan)
> >  		WRITE_ONCE(sd_share->nr_idle_scan, (int)y);
> >  }
> 
> Reviewed-by: Christian Loehle <christian.loehle@arm.com>
> Tested-by: Christian Loehle <christian.loehle@arm.com>
> 
> Also agreeing with Vincent's nit.

Thanks Christian.

Chenyu
