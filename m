Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795541795;
	b=cfBa6JjEvHtgJ1b666fj25wmJStgX+fi+Emb1X1+hZNHani9JQzOq5wmZGAxemVRqFOM
	 x3imK2RfkbUxBY49GxdvfzGoF72TFVJuPCicaUqfrebvsjnv6HljXhjIQaNFw6vTE/mvt
	 dORD1ccYeC5/JfBZf/vwCnT3uPNF4s2Mj6hPoUybAIWEZgHIOFJUHUbJyIpIKzme6ezwJ
	 GdNOEYyRjtAezhGISqbz7EriP7tbhpkBe5uFxLt4vFq2bBIAzZ5YjpISFFy8oG83KIIWY
	 zvNG+fClS/5F9Pl5uRfxa5KDYZHgrttHvUVneAYce0Xd4TjTBMT78rD8kcHUeAkEw2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541795;
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
	bh=UA+AtHE7zoBg5Em02WOc8bF7Q758cFRNeI4J5qwviqU=;
	b=xTaFFq8f94n4WeFc+yG9nx9Fe3l0MTsgXMZCFm2IBRglx2GkTXN6NrFaMNfIrnFIpneQ
	 VEUzxJhMPpbKFhjlZ5sOXfaobj6g6k5gDYbNOBHVrEmlcas+quVBM6HZAAmHDpIn3KiLg
	 2/a437ut2TZfqbvvl1rwuElY5yBQE7zk420g9oAyg5dlQi3mWv6vkAiRHPYqcPNznvj1z
	 CxUc2AqgQIAHE8RmdIS6AUheQy3mQ/l/tSwMvrSbSc+mXWi6ahHtG0qkRt7H0pmfWDwMD
	 W0HjUympxoTukr1e6HzP+MAoj498CraJ6IrMLuLhRery+uIdFAfuVU+7H6aD9GrEWrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C7CSnxlw;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kt2uKXFA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FBA606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1FBA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C7CSnxlw;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kt2uKXFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795541794; x=1827077794;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RwimJX3OMIupkD72LuPMEJcBYEQmCP04nnKoIKjY+cw=;
  b=C7CSnxlwZsCPTvO/2F4oqPDXngQcm98QbmW7Wkn5z4epphphvfvY3MRW
   rUDhRjymnuVG4bZxD5sJjgk+KaP+gJml6Nvb/xqSHoxFn2B4fbtTaVScZ
   CZjL057tItSEEJ7gx4X688GWJYFY+2OKCpXV2ySOSt3A//dvmNH/Ndh8R
   za9mbvlZHxAxuHgt4Bmui/12NWGlrwdA6JJ3+t6dKA5IQvbeGr3fWaRLd
   uuDeZ23VhfCG/cYjp+++8oWAiTsLJ1VNF3GYbbI3hv+9mQ2T2Ib2ZT51v
   0yqRShhxqAgv+6+IlWQS1OrawTSgp99u0EKnKT2TwUqj9M1pI3YEpw56v
   w==;
X-CSE-ConnectionGUID: vSpsgtL0TZefPQc3q/Sihw==
X-CSE-MsgGUID: /uqb2VbqTf2YeKQRgBSSjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4288550"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4288550"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:23:34 -0800
X-CSE-ConnectionGUID: PD6avghFQFOUPe0zUF/HEw==
X-CSE-MsgGUID: Fkhs0lysSVSmsUhTpz3v0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11822253"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:23:33 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 09:23:33 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 09:23:33 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 09:23:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huKclTRMZnp4A3+7MwAElBckbUsURrwm7RFn3K/3IHQAufnunrFzgRkdtUj0NFENR03SOUhlVVTYnYvCVfBMWenyC2yP6e2g+MYZWScf4729tCS+xSy7xQOEyR/TNN5y6sjP1DfrS6lrCNC9ltHRNRgfJevQirc8nKmC+WNGyYpnCq8fnewbFEI16A+yGZ71uB3t1nV74Ls0gVHjf5TOgTw1ruO7HviMWizyxmFP6RzKSRhhknHLTnoy8H+tKCxP988VZWdHnq/f3zKxUlJcu8RDTgLLLnvxyot7vFtvCJTgMd2cXruInKeiiXBKKgaT4pnt/1xi/4zVSN9sFpAzaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UA+AtHE7zoBg5Em02WOc8bF7Q758cFRNeI4J5qwviqU=;
 b=oI58sF4MpBdGe0b4SmGeCYdUUvBHT+5tdUg3VQ8Q9VNw+otC1cYvvZin9S/uOZvUgm15z9E5GApo8RRIsrCzgzVzNI6OUWeVe6vZpOlpyOgAEi2mrOEQfZU8KLygW723gpdvmvfcBi/fkP+UCXfMlQ+tVvCAYfcOiPghNJw3z5cRPFJfaHuLVBZtF7aNeRuR7goX71Lgz0uR0OmMyzK9qlk5LXn/98aJ79Hpl5M2ZhSicYcRly7JVilQ7nLzt7pppNz/ILvAs4kn0Tf1/qLVMo9b83hPE5ZhKVTWU6ilTRnP5JZfR9Sp2q5C7vaLiOnwpdK0IWDz6y1kzvZZvOYxxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UA+AtHE7zoBg5Em02WOc8bF7Q758cFRNeI4J5qwviqU=;
 b=kt2uKXFA3pG7AaSJYY7d1GfSVSGCUFL/afo0+73dlgn8Eu4g/Fo2/OVvmi3sW+juqvbHrPquwotz4N6XvtzSeL87KPr7rCR1eyL2g2GueJo0pP7W4uWsTEJvbQrZVD19RrLq94AvWCd/ROSE9bmSq1caQ6V+O1ucYzekNgc0h2U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DSWPR11MB9931.namprd11.prod.outlook.com (2603:10b6:8:3a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 17:23:17 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0615.009; Tue, 24 Nov 2026
 17:23:17 +0000
Message-ID: <ec1d62d6-bb7a-4c64-91ec-612f8cdcbed7@intel.com>
Date: Tue, 24 Nov 2026 09:23:14 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86,fs/resctrl: Rename AMD resctrl MSR defines to
 use MSR_AMD_ prefix
To: <bp@alien8.de>, <tglx@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>
CC: <hpa@zytor.com>, <ben.horgan@arm.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <fustini@kernel.org>, <dapeng1.mi@linux.intel.com>,
	<peterz@infradead.org>, <superm1@kernel.org>, <thomas.lendacky@amd.com>,
	<kim.phillips@amd.com>, <prathyushi.nangia@amd.com>, <acme@redhat.com>,
	<namhyung@kernel.org>, Babu Moger <babu.moger@amd.com>,
	<linux-kernel@vger.kernel.org>, <tony.luck@intel.com>
References: <9b55776701b2692772968a681a518ecd8326643e.1794946513.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <9b55776701b2692772968a681a518ecd8326643e.1794946513.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:303:b5::26) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DSWPR11MB9931:EE_
X-MS-Office365-Filtering-Correlation-Id: 180f38a8-3325-472e-2492-08df4a4fa0e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|6133799003|18002099003|22082099003|11063799006|260925021311599003|260925022911599003|261022105027099003|260925021911599003|261021121427099003|10067099003|261028144727099003|261021123027099003|261009223027099003|261022075727099003|56012099006|261026121527099003|261102123227099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: 7ZESkvJzyBZQ1F/uPMrklYrNb3MIpGGj47fRkjSaWCwnW60Ys2dV26D3c+rVnVhPCdrRezEuxpFdRcNMB1Yt2S3v3s88A1DhIiAy2z/sIi5xm1W/3k1GF05KOWSrsCJhhA3HVRXteu897CalWL/z+dng0Tb5xZhiZJczKE0bDsF6ph2OfXOR46/+odWGjlnp6jYC161MTz5VlJu2RXSo8Wf8Z5mvTZPNaNPbGTeemZzRZbqWrgT+Y9ZuadgZvnPML8Jm64azDEuwuyKYSavlO9691r5Wvxzbhx8rFj7IrCkkZpiOfpbRE/qST+2wgGLpBIh9S7FWwaF+EqxvMUPRKUsicfJGWonIAY71f+Cd+/UQKcbYPJVs7K+Dx3qIWvPFotAde8GPOqHsylJsbaqOIiNcsve62X1BCzvogeb9VJJrs25Lb66SvwnHfA8BKSpH1Sxeb0Dxu5yYviElxRaySFC34hf07z2MMOsLZLqGEtez/bHa7fX7ZNHk115oy9jbxqECIFtczOCWRbNyW1KffudwDicUTAzP785mWzSts3+NkQUpPKcTruWGcEDnHbfCjTP66nLeHgUmjRO9J7qD+OxAjSCCRMXsEojRxf+vyK0B9ifcZsdWt84coGovgu5c
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(6133799003)(18002099003)(22082099003)(11063799006)(260925021311599003)(260925022911599003)(261022105027099003)(260925021911599003)(261021121427099003)(10067099003)(261028144727099003)(261021123027099003)(261009223027099003)(261022075727099003)(56012099006)(261026121527099003)(261102123227099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUFvL0QrQ2k0R0FQVzdvUWI3bnJWYmNUV24xenNXWVprd3Bab1NRcTQ1bHky?=
 =?utf-8?B?OFErNlhnUC9SZm5USk9CWjJrU0VsSHc0Yy92SWFwM0pEbFR0NjNnOWVqeG9k?=
 =?utf-8?B?eTA2ako3UGY1R0o4VDgxSUdPRm0xTy81R1d4T0kzRzgzU054QnZka3JiY2FF?=
 =?utf-8?B?RlhEK3crcHBxRXl4NCt3S3VqcnpjM1RFMXVTNkRHdXpDd3VhbGtYcTMrbjBF?=
 =?utf-8?B?S1ExUEhFL2NESCtRbWdpcjZvWTRXRlJ2MDZLd3MwOUFvRGlKL0lIckRZZVY4?=
 =?utf-8?B?YjFSdFE2dlVkUXVxSmI3NTl4WmVSQmNtc1ZLU2gzWlBINU9PV01XMjdQemRn?=
 =?utf-8?B?eE5LZ2pVbEJkL0drblk3UmVCeEN2MzZKbG4yRUNwcFQxN0dzeSttdTI1dmZl?=
 =?utf-8?B?S2xZZjVDOW1QVXBHeTg3L1hONVI2NS9XamFEbk96Vm10NWtVclFqTFA2Y1pT?=
 =?utf-8?B?b1VUYXk3RXFHSVlRK29nTkFjTTJWUnZUMlk1RUZFdVh0SDJ2cGFCK1czdGxR?=
 =?utf-8?B?YWttTWJQMVFHMjU3RmZ0eDVZSkl4NW5hVkdTaWpaR082ZThMNHUvRTFRYXMv?=
 =?utf-8?B?dWNjTWZBZDlyanpNb3VpckNxS2VBdFozRVUrMWduaE5kWXFnd2VUUlJLcDI4?=
 =?utf-8?B?VlQva0ZldmlQNTY2d1I5dFBwdFd3azVEWXFwT3pIeTMrcXdTdGxoeEI3Zk4y?=
 =?utf-8?B?R3d0SGRDQ0NoamNVaTNJU2VBWWczSGhVR25MZ3NZUCswMXI5YUw3ZXRIcTQ4?=
 =?utf-8?B?cHRLODhrRzVnYjFHdUs5ZDhpQkI2Ly9zSkNISFlPT09oVkFQM05yUmpoUVl6?=
 =?utf-8?B?dWZBVEJhWW5wQzMwVjl1MVpwajVsN1B3RGRhMzcrd2UwUVBnZmdhSGo4d3JB?=
 =?utf-8?B?UXdDTjlYZ0Y0Ykh4TW9UanhCRGtHV2VGcm1kZHBkK3NUbDZuYys0bkRzdWpC?=
 =?utf-8?B?bllwNnhpZkg3VWZzUWpBWE5haUViYlRENmV1a29QSEZPZ3R1UElPdnBFaThu?=
 =?utf-8?B?dFJTdlQ3bEZOdXZvSVVTeU5nZGZ4ZjZncFpIcmFBSkorVlA4RmtmUkJSWE9R?=
 =?utf-8?B?dHRQc0l6ZkNCRWVjSjNtMUwvL0FwRlpnV3pUVjBEcXArVzVNS291S3NMU0hT?=
 =?utf-8?B?SVVRZStDSnZaWC9CdVpEN0pXWk04eDY1SVJBaDZ3aERBckYzK1lJUUk2eklI?=
 =?utf-8?B?VGtWV0ZmODdVWjlYSUdFdFl1S2lrNXZaTHlyTHN5aXpWb0FJZ2Z0Y1N2S09H?=
 =?utf-8?B?dmhuWHliU0k2RU1ZTlpvY05yRnpSQ2RWWUppd3p0RFpSd3o4QU94clpYUkYy?=
 =?utf-8?B?WkZHaEY0Wi9pcDh3T1VESE5KaUFncE9KMU1wb0svV0VKRmNrMEJUTVNkNGdn?=
 =?utf-8?B?TndSL0NVYjQyb0hKN09VTWVpOThZTXhidUdFUVlXdzgydHRWOXVRTXNQMERU?=
 =?utf-8?B?VjJxRFo2TWtwMFVRUHg0MHJEUWQ4ajZlR01wTjByUG5hb1FnaWhEckVZM3Nx?=
 =?utf-8?B?Si9FUjVVdkhSUjIzaXFzL3RMOFZQZTVkWFZSNlVORWNKbnRvMlY3YWsyV0VG?=
 =?utf-8?B?OUxPVG9NYlhLTS9LY1BlSTJMRWdCZjFNQW80dHdiY1R5eE5BMk5vRHNXLzFp?=
 =?utf-8?B?S3hZSGh5N3dJT2JwakJiTXh6ZGw0S2xDRDVTbnRzN0RrTHZqYmhLM1BjVWpE?=
 =?utf-8?B?bm96SjlCMVhQNFQzNVZOWGMyS09sZmUzZFFQdXA1cVdnMk9GdGlMQXVGWUho?=
 =?utf-8?B?VUdlUllOSVFlVENRUFNtZUNkZ1dpL3ByTTlNSkZWaytmcnJ6a2VWd3JHVjR0?=
 =?utf-8?B?ZXFxNWN6ekUyanZHZjJjYnk2UnplWlFyemdBM0NkZ3F3QWVNUlFabWUwcVVL?=
 =?utf-8?B?ZndEN3phdDBDVW5PZHVDdmFTOThHUTdsOGdvN2srZ0VHdlJMRDRmUVdMblkx?=
 =?utf-8?B?U1BBcUh1UlA4ZmZvVmtRR0hCUWEwUzdLdzYrV0tQeG5GeTdBRHlIekZyZUhF?=
 =?utf-8?B?OTIzZDhxTnMwcXJUalQvQnhkSiszZEowYmNFeTd0TEpQTjkxYm5jcHBiVXQ3?=
 =?utf-8?B?QWxvTTc1T1BML2VHWnNXekRrTXRGNVRMRHdKWStYUlp1bktEaUlCWlkvT3ZJ?=
 =?utf-8?B?b0QxS3AvTWxBaUx0V0ZkajBRUW1kZ1BhZE1tb1N0MldjM0RIaUlFbys5eTFN?=
 =?utf-8?B?UytRSk02WCs5Ym5Yb0M3TlN0TFVDS3Rsa3pPYzdLSzcwbVR0RkpPRDhIVVBv?=
 =?utf-8?B?TVdsUk9FbVhVOGtpNUFRN1VJczFYYS9SMHg3MG1MaTFiekEzcUZJNEJvM25D?=
 =?utf-8?B?cW44YjlYeE5UWHNMM2hWWkZyS01UbGQ3WWJnSXhUTWJDOVhTWklqWlV3NlhP?=
 =?utf-8?Q?3LMxElvAkJ0Xn6rY=3D?=
X-Exchange-RoutingPolicyChecked: c3I2Al3Bibpe/3l496inODmbg5b5ZjTCzthqcZycpacpN8UnQf1jntOnouILy6E2LHaU1/VNynpjAb4cTHpwpaIpS/+XmFJzkpBbyKMG5F4q2V5etKk6/pLfl7IwTxTywFDNwPu+TA+CYCuLaIaj4itaoLDAMKkLaOeisf1xe54foP1krTGE4zSNhHOi5E84QLK4xFyb5ay/53GACA7/k3FtOf5DTifMbDZdgRF1Y92e2px+s5sUxsAFyAHFvflKRSQzHiHlM8PRPnryt42MCo14iTKK2KsaCVNYpFtsTqMyPuCmmaa/8Xk5ipb7yY+DbWwgMQZ/0BJ+LszNc+O9vQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 180f38a8-3325-472e-2492-08df4a4fa0e8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:23:17.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHPBOWr/I2IHsovflm8PFfRIEK25pr1t4GcHEFEn1cEvPTBU+HXizzlYTUlKyOedTwEC83kZ8OxS7o/J6y6ANr7wTo+CsWgmLVgUQFDyvHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9931
X-OriginatorOrg: intel.com

Dear x86 maintainers,

Could you please consider this patch as well as "x86,fs/resctrl: Use a consistent log prefix" submitted with it for inclusion?

Thank you very much.

Reinette

On 11/17/26 12:15 PM, Babu Moger wrote:
> resctrl MSRs in the AMD address range (0xc0000xxx) are defined with an
> MSR_IA32_ prefix even though they are AMD-specific and unrelated to Intel's
> IA32 resctrl MSRs. The MSR_IA32_ prefix is misleading when reading or
> grepping the codebase alongside the Intel MSR_IA32_* resctrl definitions
> in msr-index.h.
> 
> Rename the AMD resctrl MSR definitions, update all call sites, and keep
> the tools copy of msr-index.h in sync:
> 
>   MSR_IA32_MBA_BW_BASE      -> MSR_AMD_MBA_BW_BASE
>   MSR_IA32_SMBA_BW_BASE     -> MSR_AMD_SMBA_BW_BASE
>   MSR_IA32_L3_QOS_ABMC_CFG  -> MSR_AMD_L3_QOS_ABMC_CFG
>   MSR_IA32_L3_QOS_EXT_CFG   -> MSR_AMD_L3_QOS_EXT_CFG
>   MSR_IA32_EVT_CFG_BASE     -> MSR_AMD_EVT_CFG_BASE
> 
> No functional changes.
> 
> Suggested-by: Borislav Petkov (AMD) <bp@alien8.de>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
> v3: Added Reviewed-by(Reinette).
> 
> v2: Fixed few redundant 'MSR' texts.
> 
> v1: https://lore.kernel.org/lkml/96992e30d6c02ebb7bdb58f2d8060bfd61274649.1784739398.git.babu.moger@amd.com/
> v2: https://lore.kernel.org/lkml/9ef5ec08d79c9c84f36b11251bd3189af1a38d52.1790721445.git.babu.moger@amd.com/
> ---
>  arch/x86/include/asm/msr-index.h          | 10 +++++-----
>  arch/x86/kernel/cpu/resctrl/core.c        |  4 ++--
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 +++---
>  arch/x86/kernel/cpu/resctrl/internal.h    |  6 +++---
>  arch/x86/kernel/cpu/resctrl/monitor.c     |  8 ++++----
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c    |  4 ++--
>  fs/resctrl/rdtgroup.c                     |  4 ++--
>  tools/arch/x86/include/asm/msr-index.h    | 10 +++++-----
>  8 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index c0914829a925..eda6029d4b56 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -1304,11 +1304,11 @@
>  #define MSR_IA32_MBA_THRTL_BASE		0xd50
>  
>  /* - AMD: */
> -#define MSR_IA32_MBA_BW_BASE		0xc0000200
> -#define MSR_IA32_SMBA_BW_BASE		0xc0000280
> -#define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
> -#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
> -#define MSR_IA32_EVT_CFG_BASE		0xc0000400
> +#define MSR_AMD_MBA_BW_BASE		0xc0000200
> +#define MSR_AMD_SMBA_BW_BASE		0xc0000280
> +#define MSR_AMD_L3_QOS_ABMC_CFG		0xc00003fd
> +#define MSR_AMD_L3_QOS_EXT_CFG		0xc00003ff
> +#define MSR_AMD_EVT_CFG_BASE		0xc0000400
>  
>  /* AMD-V MSRs */
>  #define MSR_VM_CR                       0xc0010114
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 3294b18ba45f..5730e23e03ea 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -1024,10 +1024,10 @@ static __init void rdt_init_res_defs_amd(void)
>  			r->cache.arch_has_sparse_bitmasks = true;
>  			r->cache.min_cbm_bits = 0;
>  		} else if (r->rid == RDT_RESOURCE_MBA) {
> -			hw_res->msr_base = MSR_IA32_MBA_BW_BASE;
> +			hw_res->msr_base = MSR_AMD_MBA_BW_BASE;
>  			hw_res->msr_update = mba_wrmsr_amd;
>  		} else if (r->rid == RDT_RESOURCE_SMBA) {
> -			hw_res->msr_base = MSR_IA32_SMBA_BW_BASE;
> +			hw_res->msr_base = MSR_AMD_SMBA_BW_BASE;
>  			hw_res->msr_update = mba_wrmsr_amd;
>  		}
>  	}
> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> index 62044489b052..25a5f0c8dc56 100644
> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> @@ -108,9 +108,9 @@ static void resctrl_sdciae_set_one_amd(void *arg)
>  	bool *enable = arg;
>  
>  	if (*enable)
> -		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
> +		msr_set_bit(MSR_AMD_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
>  	else
> -		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
> +		msr_clear_bit(MSR_AMD_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
>  }
>  
>  static void _resctrl_sdciae_enable(struct rdt_resource *r, bool enable)
> @@ -120,7 +120,7 @@ static void _resctrl_sdciae_enable(struct rdt_resource *r, bool enable)
>  	/* Walking r->ctrl_domains, ensure it can't race with cpuhp */
>  	lockdep_assert_cpus_held();
>  
> -	/* Update MSR_IA32_L3_QOS_EXT_CFG MSR on all the CPUs in all domains */
> +	/* Update MSR_AMD_L3_QOS_EXT_CFG on all the CPUs in all domains */
>  	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held())
>  		on_each_cpu_mask(&d->hdr.cpu_mask, resctrl_sdciae_set_one_amd, &enable, 1);
>  }
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 03cb22f4e607..0efeb3312d9d 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -40,7 +40,7 @@ struct arch_mbm_state {
>  	u64	prev_msr;
>  };
>  
> -/* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
> +/* Setting bit 0 in MSR_AMD_L3_QOS_EXT_CFG enables the ABMC feature. */
>  #define ABMC_ENABLE_BIT			0
>  
>  /*
> @@ -49,7 +49,7 @@ struct arch_mbm_state {
>  #define ABMC_EXTENDED_EVT_ID		BIT(31)
>  #define ABMC_EVT_ID			BIT(0)
>  
> -/* Setting bit 1 in MSR_IA32_L3_QOS_EXT_CFG enables the SDCIAE feature. */
> +/* Setting bit 1 in MSR_AMD_L3_QOS_EXT_CFG enables the SDCIAE feature. */
>  #define SDCIAE_ENABLE_BIT		1
>  
>  /**
> @@ -191,7 +191,7 @@ union cpuid_0x10_x_edx {
>  };
>  
>  /*
> - * ABMC counters are configured by writing to MSR_IA32_L3_QOS_ABMC_CFG.
> + * ABMC counters are configured by writing to MSR_AMD_L3_QOS_ABMC_CFG.
>   *
>   * @bw_type		: Event configuration that represents the memory
>   *			  transactions being tracked by the @cntr_id.
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index a6a9090c4808..3ba9c8c26d5c 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -498,13 +498,13 @@ static void resctrl_abmc_set_one_amd(void *arg)
>  	bool *enable = arg;
>  
>  	if (*enable)
> -		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
> +		msr_set_bit(MSR_AMD_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
>  	else
> -		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
> +		msr_clear_bit(MSR_AMD_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
>  }
>  
>  /*
> - * ABMC enable/disable requires update of L3_QOS_EXT_CFG MSR on all the CPUs
> + * ABMC enable/disable requires update of MSR_AMD_L3_QOS_EXT_CFG on all the CPUs
>   * associated with all monitor domains.
>   */
>  static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
> @@ -542,7 +542,7 @@ static void resctrl_abmc_config_one_amd(void *info)
>  {
>  	union l3_qos_abmc_cfg *abmc_cfg = info;
>  
> -	wrmsrq(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg->full);
> +	wrmsrq(MSR_AMD_L3_QOS_ABMC_CFG, abmc_cfg->full);
>  }
>  
>  /*
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 6e4eeccd4891..8d0db76bb6f8 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -96,7 +96,7 @@ void resctrl_arch_mon_event_config_read(void *_config_info)
>  		pr_warn_once("Invalid event id %d\n", config_info->evtid);
>  		return;
>  	}
> -	rdmsrq(MSR_IA32_EVT_CFG_BASE + index, msrval);
> +	rdmsrq(MSR_AMD_EVT_CFG_BASE + index, msrval);
>  
>  	/* Report only the valid event configuration bits */
>  	config_info->mon_config = msrval & MAX_EVT_CONFIG_BITS;
> @@ -112,7 +112,7 @@ void resctrl_arch_mon_event_config_write(void *_config_info)
>  		pr_warn_once("Invalid event id %d\n", config_info->evtid);
>  		return;
>  	}
> -	wrmsrq(MSR_IA32_EVT_CFG_BASE + index, config_info->mon_config);
> +	wrmsrq(MSR_AMD_EVT_CFG_BASE + index, config_info->mon_config);
>  }
>  
>  static void l3_qos_cfg_update(void *arg)
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 443b41a4d467..a2047e7c4dba 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1794,8 +1794,8 @@ static void mbm_config_write_domain(struct rdt_resource *r,
>  	mon_info.mon_config = val;
>  
>  	/*
> -	 * Update MSR_IA32_EVT_CFG_BASE MSR on one of the CPUs in the
> -	 * domain. The MSRs offset from MSR MSR_IA32_EVT_CFG_BASE
> +	 * Update MSR_AMD_EVT_CFG_BASE on one of the CPUs in the
> +	 * domain. The MSRs offset from MSR_AMD_EVT_CFG_BASE
>  	 * are scoped at the domain level. Writing any of these MSRs
>  	 * on one CPU is observed by all the CPUs in the domain.
>  	 */
> diff --git a/tools/arch/x86/include/asm/msr-index.h b/tools/arch/x86/include/asm/msr-index.h
> index 9c26d4075c5f..87dd00bbc905 100644
> --- a/tools/arch/x86/include/asm/msr-index.h
> +++ b/tools/arch/x86/include/asm/msr-index.h
> @@ -1297,11 +1297,11 @@
>  #define MSR_IA32_MBA_THRTL_BASE		0xd50
>  
>  /* - AMD: */
> -#define MSR_IA32_MBA_BW_BASE		0xc0000200
> -#define MSR_IA32_SMBA_BW_BASE		0xc0000280
> -#define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
> -#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
> -#define MSR_IA32_EVT_CFG_BASE		0xc0000400
> +#define MSR_AMD_MBA_BW_BASE		0xc0000200
> +#define MSR_AMD_SMBA_BW_BASE		0xc0000280
> +#define MSR_AMD_L3_QOS_ABMC_CFG		0xc00003fd
> +#define MSR_AMD_L3_QOS_EXT_CFG		0xc00003ff
> +#define MSR_AMD_EVT_CFG_BASE		0xc0000400
>  
>  /* AMD-V MSRs */
>  #define MSR_VM_CR                       0xc0010114

