Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795552489;
	b=mnQKxTQXSN5Gr0UIRdOD7uJivE/U2BZgnPw935hCaq/bOUo1Y4U8wKZAZtRueN9RjVFQ
	 CISS69vEWjDbyNZzvc3VF4/0DcDZelf8CKqhJJUieCyXIrL90Ub1wyQ6ad/YKpS/TP5cP
	 N5givWoBWkG8B+BQpMklA2rz58buxKIbyO9YQLimko5PeyT8y1/LdE4tf2b7bDOy7DT/G
	 negEbMrZs98I5fBytj0BHa4cAPBjRiv/cJHX+E57vRjAqDZp6604+nI4UABue/4s/tJrK
	 e0/qpiJH156TXazh1NemCY2hU8r9yT/hJE+hGdGfDQ/AV6iWMHaJcWTt8TSsh2KgnmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552489;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=iguDQr8uSXFngLtSq7Lvgt5JztGsQDy3v0zTOov4JKo=;
	b=xyDi/LuadDxQUW9/PyhT03c7rliKM0keBxbc9+4ZjagjtqVAma9rL9mNx9hxHwNKzDb4
	 HXKPfm90LYYcUuytao2qvBOKgEfrypqcf4wLzV3IaSHsiwUKbSvJEaMon+BpByW/FE6gD
	 qgfSVREUAMsZWLwL6kYt1lh9U38Gc/lDg+XnRJjorLAdKiIBc4OX+q7Q7UyhFDp21QNnx
	 +8zy0W+ug0WJVwjd7OmsnUW8Ds0S5p5jRbnqAZ5JEdtDGOGVRngD0WNay6efizgMm9iex
	 u28ImNn6a3dOacwxycoZK01ihxDpRaktuatZB/jxUwbigeTVLM06B1YYIpF3licYLWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=frsBf42A;
	dkim=fail reason="signature verification failed" header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=dzjzGsIr;
	arc=fail smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E57606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E57606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=frsBf42A;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=dzjzGsIr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795552488; x=1827088488;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gm3T3OBmGgmlPsHxt0tPAx8+uI38PreCMGys4vcnC+Q=;
  b=frsBf42AzGOlITpEN9Dw5axmZ5hIQadDuRBa6Kwrh3AIOfeLpuifWXLr
   344St3KnTjB9pUFf3l5r1T03HLoXNsgs9POZWdvylulvfeybo1yAKLmF/
   0cfBvpZ9a6G8eLPNHWsnLifO7PEz2VraEs64QClPT/S85QdKNlPORs9hl
   YjL3XhGC296SM25YiPsnCIYogdKIyuvU3CpG7IfZu5hCCAmGIJR8K1856
   g8m56rIcs/5ggIpJem8yllkuHjh0fIdFugRqf+l+oKU0dypHnO1cxfB4z
   USPdjyYfTxXuqqFmikC0WorVv+GRYngPm5D3mvpqF/wDfVze1CVvJ81YV
   w==;
X-CSE-ConnectionGUID: aue+ooR6TBmfyy8wSA8CNg==
X-CSE-MsgGUID: m0oxbOtES9u/uZz+VSKzHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4288142"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4288142"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 12:34:47 -0800
X-CSE-ConnectionGUID: Xk/ebV8mRdKZa7nEdPHtGQ==
X-CSE-MsgGUID: lVajXz/WRWS1J6pFydmfAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="12248756"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 12:34:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 12:34:46 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 12:34:46 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 12:34:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGhQK/htFXcRO/vthlxvcfOLyMgonNgUD2WfKdxf/SqGnc69Fe46bBaCLXJCKcAm2GeQE2q6oDpWGG7+4zPFIucI8vk7KiDSdskfmnbkZ/lCPEJxQkUh/ns4KoEbBhXvhwZclIbJ2rrD6ps4yhVheFY0udAWVJMy8wIOcyDdyAmljGlnHxOK8YaPTYF6/wea21JDWwlmoY1E2HxXG+pAeeWAASAXBXGTJ8gB2F2urLPt9eBDT7QOoq/nOlgZIk2IUgjTsvCN7mPUDJqbpNWTWptDDNxmDRrJZBn3TbcVdbWGN5he5j8a6vvRrkFuw3BZSmoYOzHlgoaPffO17RKYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ungqG/Yk6qmyDQc6IVGEd/mtmSbj7W63mNNNbnq7kyE=;
 b=u5vyZgzPkYNfaxEoaATz5ZJbSMt8v8KSu3BkNCRZPjKrNJestGGM8uosGjy2cqzR00acObqIJ86w/9mz+TbNcL4DCLE2nfnctFieRHSLspRhaDgPFOTP3BamHTajtVSNYdwBPNIWthIV/aZ+Gz6qmVycqDxZg/YcwTQIuMW8Kk5YNgCwXAFXiaMcuetAJjlriw6ddRrOI/8q3Bo0pht1ZF68atJlAdIeBaqjyUU/JIbXtPE8WXukjdwF9q0Po87xtUp3TV8c4baN91QmbZghpQLIGgVzyJGqGeBEVqLbXdK9MoKZ4GVUg6p8dEKJrHHjgjQs78WlrXPRncfrQL8Rzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ungqG/Yk6qmyDQc6IVGEd/mtmSbj7W63mNNNbnq7kyE=;
 b=dzjzGsIrJYnKQmmU6LG/OvFSKjGgdzHETRKrRscoBMgNZmcZWF1U5TZ/ZAZKKODa+1n0TMjbhtnh4Y/Dp8nXHHoV50d/vY38XGQHcGQWC0gaol6CH1ehxZRNv6e3M0NB4vvGK8hWpocKYjQcdv4uAy/EbHE2mb5CqzK6UE+kzy8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by CH3PR11MB7370.namprd11.prod.outlook.com (2603:10b6:610:14e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 20:34:38 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 20:34:32 +0000
Date: Tue, 24 Nov 2026 12:34:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	Carlos Santa <carlos.santa@intel.com>, Ryan Neph <ryanneph@google.com>,
	Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 23/33] drm/xe: Defrag using out-of-lock page
 preallocation
Message-ID: <awX01VAvz1vsSdZv@gsse-cloud1.jf.intel.com>
References: <20260711025619.2540575-1-matthew.brost@intel.com>
 <20260711025619.2540575-24-matthew.brost@intel.com>
 <avO5S8WLjcUSGF0f@nvishwa1-desk>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avO5S8WLjcUSGF0f@nvishwa1-desk>
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
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
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|CH3PR11MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d57cd8-cecf-4f32-cbca-08df4a6a5868
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|18002099003|22082099003|261009223027099003|56012099006|4143699003|11063799006|5023799004|10067099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: 3AqmuMgrAFM05z0UkCLwrK13EJuUi+TevySkfdjsgO769//WRCzOFeLM5VVpLc368I3WYErCxz7gGT55rhjUxR1YejA0UBfDc6rxMTnnIAAa9i9dMq7W1bstafDXfZcU18VZ+dHi0E2KLtuyoCHOLT99EolTiq9rESEAKDVqolHoca+WnHG6PdAPRPulGdDD8kClmwNf6vUwr9CFOJ+b0l4w2t7TX3ht5YNXB+SRrGpxQPmXze+H2Tr83rYxt+LYxtYEXPClXMmbWM/dDh9gg0Sgl1OBxZmNKH/5AUKtOL80VDpPVAb/fKn+uB1feFqJ9RWyaFnblpe4KIHYBS/FBz7Bg1ZEVsg7mIqm5FHcP4VTn5FKLmsDl/x4p4Jr12AEfFVKTU4BEINPB69o0OFjPG1754nFdg499PEnEGuOT0DAv4MxHroAZTPnVidEHNGjjuJR/Ud9vjbDSsMTFwLmTtP9NEpxqwip/ww2yOAJyIFQf7mxA6YPwAv+myTjGH+L3ZLBmN7yPc0tmnk7q+PKkq+u8Ppb45s81uE+MObwTLR6YeBBD/U9QgLnToSj6itCg3Usmv38//wqkbZa/293FKiRJ5rvs+/7RJjpQK4T5EXV3sWV2bjIkXNOZmbtzL0BeA3Wvvlbh95u6grF15dOJK8+83x5tmmvRYymnFJc9to=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(56012099006)(4143699003)(11063799006)(5023799004)(10067099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BUqhNJ2sT9A7ZvRt2+UScBkUcA7vTZUijn7VMCsYCtgs+Dr5Bl3mTBfS+8?=
 =?iso-8859-1?Q?bD2rl+C0/dXO7aXDZPV6uJYoEWhstrRICywrE7QOPkRSlBE9e8DdFbUb7p?=
 =?iso-8859-1?Q?EsVII7f/6mAOpw4uCdaShD/oenqOdDXfgRa0cJ+ZMuqVO4bO8WWtvoer/O?=
 =?iso-8859-1?Q?hlDM1hQBRO3si1ZjB6JMZ1jkkXwPXtWzrSrBMZm1I2hjKbf8PoNUwlkgQq?=
 =?iso-8859-1?Q?1nWhoX5eE51xP8WeUMKQdIby+zMNY5ghJGBxrOEKVw10kNHsAm5GnJiQD4?=
 =?iso-8859-1?Q?rlBtxVNE/tezAQ/CqdrMxYu1aytJmNwW9XlLp2kS4sU+xpnCYksuPT8j4w?=
 =?iso-8859-1?Q?U7l9zK66IfzsIdSV2OjtcXDzbHRzVmNBAsodmaWJrqEOO8+KcmgZ29dt2K?=
 =?iso-8859-1?Q?YFMjhrYIm5PnDAGboZAzOencZBv1OHIoV8qPLvs0YbE8yqyYcsNbi835Gq?=
 =?iso-8859-1?Q?Rje9RNVQC84hRVdrr5BIxsOE6p8Ks0u0MoW3c6zTMq05J+RjfeUPZ+awO5?=
 =?iso-8859-1?Q?bVZ3um3dJs38iEy+QcvizpiQxEZ5Ew0e9JqeBKvVjxsLvKnk/2V5Hg7rS1?=
 =?iso-8859-1?Q?bWjb9ma+KTiN7DpQPN6ct4fp+/j/xyQipKHwVREoStmP1pQVRK0KKOztMu?=
 =?iso-8859-1?Q?JUot1TGVwh98xUmOcOy1uy3eqoeADisFu4fWnDo/sWUQz8bqoiUxg0deiJ?=
 =?iso-8859-1?Q?gh2Z2i7xMTT05x3vRhiGp71Jre3lhDyeMIQQ4nsMj/UPlJftGflcwkvG5E?=
 =?iso-8859-1?Q?A8coxZumjcz7NZP45vBXPF13qRe6Ag/PaBsgMnrzkLhSm5V0PbcsmBaCf0?=
 =?iso-8859-1?Q?pQBz6aUTYHaAcksdYZ9OwunN8VqU6RViwd958v1r4RbSQJP8oT3MiBAXIx?=
 =?iso-8859-1?Q?FwwASG2mJrJ0vnZIovB9u2Hu/bU/P2DACKB2ZXFhENTPp2zN+q6wZnct4g?=
 =?iso-8859-1?Q?xSPxscSEbyyvmcOQMdHWk35oaW0vZN4irUCbC3we54wvRQaY13Inrc0O8n?=
 =?iso-8859-1?Q?bAoPuXlFd31xJKRF6mG8oodOZVt7GnrKjX+eh3AN/3oCW8eLliXfgYqxpX?=
 =?iso-8859-1?Q?hA6P1LgaNVm0ec7CG+DW06Ne0iMB/MmOEjMOlHvV8fxkdacDMa1WkE6W0l?=
 =?iso-8859-1?Q?MFf0kur9POm5H+YccQGp9N29bNtCOAnC7+j6E5NMC/FzAesZPX38y7uREr?=
 =?iso-8859-1?Q?KiJQ9968wpRenuOE53AEFem3plffKCumC7Ja84EW4Tc2fm4xtu3vgXe8Cl?=
 =?iso-8859-1?Q?JdWAwRmPAOMUs3lV3RwgHrB/Lcor+qWDoxA1H71VoikIK/TML1CLY/PLbC?=
 =?iso-8859-1?Q?qufD2NQ4Iwhudo7asHzsESvn//Gq25nB6xtnY4Plcvl4k5C0Cp8DCpQoXw?=
 =?iso-8859-1?Q?zKCU7bajD/SEZqAXYXUmeGywgoImXGj4TQZFONBPo8nHaRdx5m57h5uDvE?=
 =?iso-8859-1?Q?xy4tBGBy3CrO+feutgYCsjQx1ydbWaDjxnILHTAUvVAezufiJsnO952dVF?=
 =?iso-8859-1?Q?0StDAENkHhTYTCNlak3JzTwPIzoTQ7K8+kDFiQgo4A7zP0NG3dYnYycsjG?=
 =?iso-8859-1?Q?PnQl8UV6l/FgbBQcwDTZPMOodknIu2ZMOGJpQ+J6wncPIsGzytV6eWqV5Z?=
 =?iso-8859-1?Q?fmjxqp/aybHIKiGzRQi1DPa4gFEK5CINPaia1tUcDW++M9wsD/0qXYphLr?=
 =?iso-8859-1?Q?sFfyIaBx1aI09s6uVFsH060Jo9n3AtAIjfiXFS+aa4vfWhT4c+uqlJYGHZ?=
 =?iso-8859-1?Q?/AlzWRRkrmdef9iRM2Jm690A8eFBKPdSMmDr0nSjUBM2kXNk7hx0PfqsQB?=
 =?iso-8859-1?Q?v/kWAcbHxZW5qDYcKWDei8//PRb2vU0=3D?=
X-Exchange-RoutingPolicyChecked: LKxWZYYifqErkY9Y5JPkFF4Q11PeSI2YxO9Dlfm5D+7Jaoy5fdXTsHljh8hlBWcoLZVDPs+0/TVKAQ/nrmhu4+cVJIqPA1bJDu01nC2NiYEZ/lLnLnQIjn9hjwb7MiW8fyJD8LfKsvA3mxdBxEO1A2cQjKlNhn+60+RLA60qbRJGqeuIXQP9NtzOXa/Lvm2NDknwSQoCrJlxhOD/9vs4/PwsITCoMKaqVxBjsAOwYsGtasGPtBaXBpKC5bmPSmXdotFr1xryyiuHS2TwTi7WsdNkQy8EQ5eqE+eyV8jbht1hXYuL4FmHeTZbeeelO9qJfFNSDbqmaUNQmU8dQujvKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d57cd8-cecf-4f32-cbca-08df4a6a5868
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 20:34:32.1658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Br3dhjVyU9ctQUj8Ykzc6G5ZrhM7wS/XA0bvEnrliOCN8Daywrmk+0zX+lr39H5lc/po5HSUevC8FHgJa/+s2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7370
X-OriginatorOrg: intel.com

On Tue, Nov 10, 2026 at 04:39:39PM -0800, Niranjana Vishwanathapura wrote:
> On Fri, Jul 10, 2026 at 07:56:09PM -0700, Matthew Brost wrote:
> > Convert xe_bo_defrag_one() to a three-phase scheme that moves the
> > expensive beneficial-order allocations out of the BO dma-resv lock:
> > 
> > 1. Under the lock, re-check eligibility, capture the tt cpu-caching and
> >    read the exact sub-optimal page count (ttm_tt_suboptimal_pages()),
> >    bounded by the run budget.
> > 2. Drop the lock and preallocate that many beneficial-order chunks via
> >    ttm_pool_prealloc_fill(); reclaim/compaction stalls and the cpu
> >    cache mode change both happen here, outside the lock.
> > 3. Re-take the lock, re-check, and validate consuming the prealloc bag.
> >    Any shortfall harvests the old backing instead of reclaiming, so the
> >    move never stalls under the lock; the BO re-queues for a later pass.
> > 
> 
> Assisted-by: LLM
> 
> But as lock is released between phase 1 and 3, there can be BO mismatch
> between phase-3 and phase-1. More below.
> 
> > With both allocation and caching hoisted out, the BO-lock held time
> > drops to copy-bound (median ~0.27ms, p95 ~2ms); the remaining tail is
> > lock-wait behind active rendering, as intended.
> > 
> > Cc: Carlos Santa <carlos.santa@intel.com>
> > Cc: Ryan Neph <ryanneph@google.com>
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Huang Rui <ray.huang@amd.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Assisted-by: GitHub_Copilot:claude-opus-4.8
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > ---
> > 
> > v3:
> > - Use DIV_ROUND_UP_ULL() for the 64-bit preallocation chunk count
> >   (Sashiko)
> > ---
> > drivers/gpu/drm/xe/xe_bo.c | 46 +++++++++++++++++++++++++++++++++++++-
> > 1 file changed, 45 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 0bdd1c920404..8b89d34f37d4 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1258,16 +1258,56 @@ static int xe_bo_defrag_one(struct xe_device *xe, struct xe_bo *bo,
> > 		.defrag_bytes_remaining = budget,
> > 	};
> > 	struct ttm_buffer_object *ttm_bo = &bo->ttm;
> > +	struct ttm_pool *pool = &ttm_bo->bdev->pool;
> > +	struct ttm_pool_prealloc pp = {};
> > 	struct ttm_placement placement;
> > 	struct ttm_place place;
> > +	enum ttm_caching tt_caching;
> > +	unsigned int order, want = 0;
> > 	int ret = 0;
> > 
> > 	*consumed = 0;
> > 	*needs_more = false;
> > 
> > +	/*
> > +	 * Phase 1: under the BO lock, re-check eligibility and estimate how
> > +	 * many beneficial-order chunks the move will (re)allocate, bounded by
> > +	 * the run's byte budget. Then drop the lock so the high-order, possibly
> > +	 * reclaim/compaction stalling allocations happen unlocked.
> > +	 */
> > +	xe_bo_lock(bo, false);
> > +	if (!xe_bo_needs_defrag(bo)) {
> > +		xe_bo_defrag_remove(bo);
> > +		xe_bo_unlock(bo);
> > +		goto out;
> > +	}
> > +	tt_caching = bo->ttm.ttm->caching;
> > +	order = ttm_pool_prealloc_order(pool);
> > +	if (order && ttm_bo->ttm) {
> > +		u32 suboptimal = ttm_tt_suboptimal_pages(ttm_bo->ttm);
> > +		u64 cap = min_t(u64, budget, xe_bo_size(bo)) >> PAGE_SHIFT;
> > +
> > +		/* Prealloc only the beneficial-order chunks the move replaces. */
> > +		want = DIV_ROUND_UP_ULL(min_t(u64, suboptimal, cap), 1UL << order);
> > +	}
> > +	xe_bo_unlock(bo);
> 
> As mentioned above, BO can change after we release the lock here.

Sure, but that is why we recheck the BO in phase 3. If it has changed
(e.g., a user closed the BO, it got evicted to SYS, etc...) we just
throw away the prealloc and move onto the next BO.
 
> So, 'want' can be less than what BO needs. This is probably ok, as if fetching
> from prealloc fails, TTM will fall back to fresh alloc.
> But if tt_caching changes after releaseing the lock here, it is never checked
> in phase-3 and page cache setting will be different than that of the BO.
> 

Caching is a static value for the lifetime of the BO.

So I'm failing to see what the problem is here.

> > +
> > +	/* Phase 2: preallocate outside the lock; */
> > +	if (want) {
> > +		ret = ttm_pool_prealloc_fill(pool, tt_caching, &pp, want);
> > +		if (ret || !pp.count) {
> 
> '!pp.count' is treated as error but 'pp.count < want' is not. Should we?
> 

'pp.count < want' is not an error.

e.g. We want 32M but only get 2M from the core MM, this is still forward
progress and will prune in that 2M into the BO.

!pp.count is core MM gave us no 2M pages, we have nothing to do and
backoff the defragmenter.

Matt

> Niranjana
> 
> > +			ret = ret ?: -ENOMEM;
> > +			xe_gt_stats_incr(xe_root_mmio_gt(xe),
> > +					 XE_GT_STATS_ID_DEFRAG_FAILED_COUNT, 1);
> > +			goto out_err;
> > +		}
> > +	}
> > +
> > +	/*
> > +	 * Phase 3: re-take the lock, re-check, and validate using the prealloc.
> > +	 */
> > 	xe_bo_lock(bo, false);
> > 
> > -	/* Re-check eligibility under the BO lock. */
> > 	if (!xe_bo_needs_defrag(bo)) {
> > 		xe_bo_defrag_remove(bo);
> > 		goto unlock;
> > @@ -1277,6 +1317,7 @@ static int xe_bo_defrag_one(struct xe_device *xe, struct xe_bo *bo,
> > 	place.flags |= TTM_PL_FLAG_TEMPORARY;
> > 	placement.num_placement = 1;
> > 	placement.placement = &place;
> > +	ctx.prealloc = &pp;
> > 
> > 	/*
> > 	 * On success the move reallocates the backing at beneficial order and
> > @@ -1321,6 +1362,9 @@ static int xe_bo_defrag_one(struct xe_device *xe, struct xe_bo *bo,
> > 
> > unlock:
> > 	xe_bo_unlock(bo);
> > +out_err:
> > +	ttm_pool_prealloc_fini(pool, &pp);
> > +out:
> > 	return ret;
> > }
> > 
> > -- 
> > 2.34.1
> > 
