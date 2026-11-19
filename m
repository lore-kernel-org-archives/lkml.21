Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795070703;
	b=0dCWSa+nlx09cfZ9zipFC7vtsL7frhqS8uesxMKY1ZVd5qZIYmvoqAfiPSwDJs+W3ERi
	 HXWEnpbSXa4pf1k17vc49/Iv696i/0RRuSeXUVlZW8EmxknSNZ4EYQCLcFLFV/2alCLeS
	 w4W+gwcjflM+Dm7Ycf3POhNItX+tyqMCWlEL/e0vUkkMPcb5szRYNXQ2Dm4AZOOtWXCMY
	 dkkoWXrnJEgEeazLdsbeo3p04HaMVUS6Vy55jCO7UTqRRjDiQFdUhcq9G0fd8XCgCB6o9
	 M7JeNVDHPy2P8dhP0mSZxWm3i0EtvzUx0FZ5pocxmmDKdUcVATXI9FuSTNgXvLEk4+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070703;
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
	bh=v+RtxuyjSESnReyJ2vbfhEGDnifBh9gTw6M70jE6eUE=;
	b=vUbvraQpvhOxzi1Y/rFTaVnkTGBCK5KUdbF7zdBPqNC0SHGZwSpU43Om6tyWyhPerJEE
	 35Q3aY9l76GwvaOF/dQWQAY4dU+eZvWXING32hSDyCcC64fAaohKJmughq5jYlvlhR/oV
	 LkQoiLfNT0VghcOLbGSHTPNqC7I59sEZUXMiLeuiyFpAUZTb1qFEIxNHgzZOdVwc6EYZU
	 SzxXg7iud0pZvG2Ha6zbp6CF2iWDKn5ZnPtcnVZHPh1E4J9TKOdvGD+TUbdA/5zprTAHr
	 OuGnQRdyIWf529AfNgcRYDYgZC/YtJRa/XITzVqWXIV56Asl4acN54oaYfxANQUMlYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T5dxfFhJ;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NRBWIK8C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752F0606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 752F0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T5dxfFhJ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NRBWIK8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795070703; x=1826606703;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hG6PTpBJ1a1+gJum/dbv7rFRtquFexDGx18LBqUwvdU=;
  b=T5dxfFhJwT4pg4RdvfZYQ6FpbZhQMMIfXnUrNnLx5GEcXDk7Dnn0LFjW
   JjaJvFq2rF8QdU032uZf+S3COXvTi74faXNF773pnYv26KPPZNMdlugNy
   /5lVKTN5wEMvAmO6I5FZ57QL5TzPRcde4pCJJxCMK9vHmsTvZNoh+tAj1
   zll0P0qBM/5D5f4F2hIL6FyBXLvOCU0uJoq+Z5mNr/aiHiZrHf67yZac8
   k9mlWNmruVsuSjPjb4GsDSZg65F8MvpBBxSuiX5If0THzFe/jKtkD/KMY
   8L8bYn5rm3kND0GfRTUT0Vne8QemcjuXjKnJx56prNX24qcDgf9rKKNjS
   w==;
X-CSE-ConnectionGUID: pXNESUgkRuqd2Dr6ULGhwA==
X-CSE-MsgGUID: P0s72pFXSn6V+kxkcALDCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3797701"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3797701"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 22:45:01 -0800
X-CSE-ConnectionGUID: El14bj4ISQafnsORp9rrQg==
X-CSE-MsgGUID: D6BsS1jZT3SIMw5BNlEdag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10573551"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 22:12:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 22:12:44 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 22:12:44 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 22:12:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B32WwmEN3AMvmxObwnIQjNpmiOC/MGLra8f/5sqk/FZ71EuNBb90XaCO7qFFWNYot0ofzRPS8jjpCWjBdZqplNj8rVtEyWozbdMbrfoYDV4F8pcq0hZLC/5omMPj2LK4NiDHmfd5DGA+E5DnlbuShXhpupKrerYGlqLijgzTIqE3ECCi+AyEf0hl41jjqFXAf+uYFfIQHwyvkg8l6fhCajZmiJH9j9LnF0xAvTDQVXSFFFTr6xCOWqDde/IbVv+kK60n/k4CJTU25EPGZwlQ1PMG21hjBDy+azDFsI2z+lFRt5L2ji76nlJObGEIq88uFLP50sm19g4XRJbMey0iJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+RtxuyjSESnReyJ2vbfhEGDnifBh9gTw6M70jE6eUE=;
 b=neEG8XwfFynzYwv9gosvNBA1iBg/ozxJfH8GqYAT1MsSzFyvJoUK+85VFDgdSwJJ9resZ3+hjlak7dfnt0lqT03S+ooOh24HcjxOb96p85SG0+KXPslvIY33yP8Y7UxQPbIgmd9yzjIPAPBQYtYOcn99RFt201tizHaSvpSMiE7+S3Ji1skXypRALoGCbNpahLuYZ3rg/Xifzf4810OejNNTdQPoQbo++UpKKRfH6wGbu/kIwc7nvRYp4vgDU1ZQzyZWR606UDQk+0vTZFSCKeVB2tYIWXqmpw5aePYDXyPWWWEF1AIMJBFfaOaGXKOlovqe/CZQHOmVmrkV5bB1YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+RtxuyjSESnReyJ2vbfhEGDnifBh9gTw6M70jE6eUE=;
 b=NRBWIK8CqND4c3HemAQj1mUbI3DHCfkjyKVZu0DbdJC+Ene2C6dE50/4CY9Qf+noFgnn5MPGHFohpT05gD03AxrogyXh9nFSvlt/IedxJ1iW3xC8NlbippbyDPPm9+wI0dSsVIqKGss1ebJc8Cc5TxayUG/Erjl+ZlLR/81tYVk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by LVWPR11MB9882.namprd11.prod.outlook.com (2603:10b6:408:3c1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 06:12:42 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0615.009; Thu, 19 Nov 2026
 06:12:42 +0000
Message-ID: <4aea42b8-991d-4f7d-832b-1c92d87bcda6@intel.com>
Date: Wed, 18 Nov 2026 22:12:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] fs/resctrl: Add schema_name to struct
 resctrl_ctrl
To: Ben Horgan <ben.horgan@arm.com>
CC: <Dave.Martin@arm.com>, <babu.moger@amd.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <fenghuay@nvidia.com>, <fustini@kernel.org>,
	<james.morse@arm.com>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <tglx@linutronix.de>, <tony.luck@intel.com>,
	<x86@kernel.org>, <yu.c.chen@intel.com>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <20260921135702.2874931-1-ben.horgan@arm.com>
 <20260921135702.2874931-2-ben.horgan@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260921135702.2874931-2-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:303:6a::6) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|LVWPR11MB9882:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d2d3778-de60-4763-8f29-08df46041ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|22082099003|18002099003|261009223027099003|3023799007|4143699003|56012099006|11063799006|261026121527099003|261102123227099003|5023799004|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: ElwYBfWcjVUc99cPbP/DTjLfZZeAAFbDQYlo46qiiGeGL5j5cXk8JOdr3sRVhkEEcRnZ8uRqLtn5Vk8TdGfc+B49CSfRGQVnt+BzOadVNCrMupdPXk8sYxeUo20MsUXytHsT+PjZv94NqSWYvgvDwSLQItG2T+kRNi+SqYDYtMJoC5C/2guYV+F+GMevx0ZHVz7yHUeTCUBhi/Iyj39iLKlR8ufZIU943RpSyfYR5wj1WnJC7Yb+gkVaN4bu3x3R56YBtl+oYx7bQhmPSmXcjwME0z+8tQ/o1AFmVXWIN19iNyln78e3Ab/1CiHxLw2/C0LKlIx3wy07gTx8JDbrjYDLOnDwo65CKpHzWagNm9Aa/RfSjAD+TFwUe9wa9k3RQg25wez0M//70D3M7dE+f5Bj2U+O2a2ykzrn0BU9p0ugMUeO0MPbOnawTmhsiJHHBkW0l7U5i+j+90Rlg+ShPTvynUFwWuO8JgBhAMeu4zQbQ4sKZtxsGnR3Hm7hAO6goPuIC1IIdVWuXb7Hrpyc+kEiINIZmvslkJsV7fk2cT4LrzpNDi+n9/l3c2GpyWW7Qe9uPFd+UffYIkvaEIwvOozVkIHP6UuV8xM3FXlSk+75nSV8l/13a1FYILfEVqN6FP+cXyUVQWTej2BktYrDg6qvIS5CZykrUJrbmegf/VQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(3023799007)(4143699003)(56012099006)(11063799006)(261026121527099003)(261102123227099003)(5023799004)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTZtcFB1OWxmdFQwait0MEZBN1RIbXVYUUtvY2VCSjNkd1Njd0RSUFNUUDd4?=
 =?utf-8?B?NjdJN0FJYnczQVNMSnR5emlXOTljOFRTTHJWSktMSmRSZDh5dnhINXhkQTFk?=
 =?utf-8?B?cC9ablI1bk9rbWg2WXJmZmhsVTNmNU1EaVc2YzNQWEdHSFJaTFVjTkNrMGZm?=
 =?utf-8?B?Tzlzb0krZmNTWmlwVXk1NHlwSEJYOEVpQTF4UEZTbEsyQVZTVEdZRnRsd0lQ?=
 =?utf-8?B?N2pGNzhBcC9MdnRqOGhGM1BEejJOQlBXZkZkNDFreC9hR0d2VE5XYW9IdzRB?=
 =?utf-8?B?Z1crWUpkbmhGa05tUXFqZFJrS0dmbnB6eWZtVHB0OFhtOWNPVkhWV05kTTFk?=
 =?utf-8?B?ZUx0SEJPRWh6Q1dXMXZzeFRwbSsySENZUmRLWGRLMjVJMGlJTC9aMGZybTcz?=
 =?utf-8?B?MW5tdFE5RTFvU2VXbExrU2ExRWVQS1plL0pFMVp2anhzaWFVSXZyTnl6M01J?=
 =?utf-8?B?Qy9LaVBkWTVzMmZVWkYrYmF0RVN0MytlTEZ1YkJURmtMdTNCZkZJeDFDQlF2?=
 =?utf-8?B?K2R2ZzlCS2hHQ3ZLNldjSitxenpldlVBbG9nYjdCTmc2UnhTTFpNSTV6SE9m?=
 =?utf-8?B?MS9EbVBMcnlRVmZ4ZzZUVEltK01pOHBRWGpwNmxpVThwMHJNZnVnVzhOQWJm?=
 =?utf-8?B?ejQ3TmRYeG5WbTlSMlVrR2ZsbktDOFJjWWdsQ1M2OTZ5ZWJCdUFPM1ZQVmFU?=
 =?utf-8?B?SkJ4bmNIMzBNbVpMeWYyQWpnZWlZVFk4b1pNWFIwKzNmRGl3dklkWm1IaWlw?=
 =?utf-8?B?T2ZqNVFLbkFBdHVvZG5qa2tLNmJOY2xqenBWQlhMZm5OeFlZL0FGWUxtQk1n?=
 =?utf-8?B?VStvVE44UjVIbENJUGUwSy9BME81VG9YWXZoUWxuMEpyK2pOcU85blNJWnMx?=
 =?utf-8?B?eEppY2ZaODYvS1VHSHduekRRTXRoVU5EaUpaV1c1cU01N3R5NWNWcVhzeHl0?=
 =?utf-8?B?R3Yrc3pFbmhnNERRTThQejVib2xieGlUM1BvS3d2NGR1ZysrMFFPd2lPQ2sz?=
 =?utf-8?B?K2N0RFVXUVN3enFSWHowWkFKRjk5RjBZenA5UEZScVphR1JubllBZFIzR3do?=
 =?utf-8?B?VjFwMDFpQ3JPL3lFcUNOdklHSmFGV3Zmb0lnYTNrME1JOGx4VFJMc0NVSU9L?=
 =?utf-8?B?V05oTWU1Ujd2aFFpOWZFZEh2U0kwUi9aSU5XekpERVl5RVdraVBRRjRGcW1r?=
 =?utf-8?B?WXFwNnpzVmFEKzhNYTczdDFQV0E2azc3K2k3SkgzanRoNHdQc3FKa1FFRUQx?=
 =?utf-8?B?TzVIR0VjRGFDTFdTNzRpZlp4cGNOa2kwTkJtUG5lQktSYWFJZmxYd1VsR0hk?=
 =?utf-8?B?dytUNHVrdFpJVS83cmdxNndJL0lpSHhzaWVrWlUxbFNhQWd5UTM5UWJTRmp0?=
 =?utf-8?B?RE5JWEFUVWhHSzBUZmhENTdaNjBwY2JZLzdwcDVQQ2l4VG5KVCtiZ3NEUlgz?=
 =?utf-8?B?S2NiZjFQamFOdXZvcURrQlBoNGd2Nm8xVkJuT1ZZMjk5SUswOFFWSHhzK0VQ?=
 =?utf-8?B?US9SVDdkaWhQQ3pMb2FXcXZEbVZOcGNXajZiSHIzQTl2MzNnZUdDamhJQ2Vs?=
 =?utf-8?B?UENzeWtjYitkQUhGd3VmdGJZL2RBeXFjWm1lRWRJellSazg1dmJCcU5EVkxB?=
 =?utf-8?B?L0xyR2QvaDhoOEZ6RUFQUTJKZ0hyWk1rSU5DNHlteW1ZRUk0KzBQTkFvK3Ax?=
 =?utf-8?B?cE1rODVXTXAyWVZSOVhGZ2xjK2tQRVpaOHBMOGg5UU5zcjZJN3FsWXI5aTl4?=
 =?utf-8?B?TlpUQ1JNWGx3OFdnTGh4MFlYSCtlYzdJN1FTVHBtWjQ4dkRvMVNCbTNBSjVs?=
 =?utf-8?B?bmVwTE80VE5SeUc1VWZTdm9uS21pMUJRZVpPcUFiSUtZbGdhbDEvVTk5ZDU1?=
 =?utf-8?B?aVYyUmhUeUdmbHdnc3RTOGJXSFNIcVhDV2tLczVTVzRyQnpBR2pBMStwQTNk?=
 =?utf-8?B?OGhFenZzQ0lxL2dRVVIrdXgxQkdDWFBsWlVFVk1HRVhod0lVWU5URWUxTC9Z?=
 =?utf-8?B?UlpPY3ZoalRucjBzSStaL2Z4c0lDcUFsSFhUaHBya0U5ZG41L3czVjA1WHNF?=
 =?utf-8?B?ODM1T3lwZVpNd3FRdmw3SGlWbENWVTNqRTI3SFVORXJpSjRVMTE3YzN5dEw4?=
 =?utf-8?B?dUtBOW1TNmVDT1U5anVBMkpQSXBzaGNCeEF2MExMenM2eHRlcGluSmVhL2Mv?=
 =?utf-8?B?TldtNzBVcjJFcHRBREpxSVZtRzh4YSs1cnZ6dmJUdmFFcnc2clVNRlRRemw2?=
 =?utf-8?B?WHRIR1FJeUx5LzhQS0NxUkhmYjdpTHpBRDBhUlZtQkcwZnE4eUpoWHNwTkVa?=
 =?utf-8?B?OXlVYldvcE9DRDQvaGJpS1pOQ21obXdKUE9zeVh6UlF1dkVMVWFjWFdmZ0tz?=
 =?utf-8?Q?CpXEmJlcGgmqkKEg=3D?=
X-Exchange-RoutingPolicyChecked: J3D8+eocq1tI1RknqyalcF3zNrX5fR27CAqBYid3iEAWFV3Me3N45Yav8NOX90Dw00yzmT3Mw9mG1FGrz26Nh0DqsHPHxLmpQnCz9uDYJoab+zwWWZEoFb6TPWnXd5M1LeMrdMP+j6VDheaLM5JfO8puEBuShUgCFXFia4V6wJ80GAOMmWOGbMAjrTGL7jBRrE0pvm3A+x+P+Kp0mK3cS2oC1BWcJw48Jj5sjxPa5j5nws3DDvnAfe7Yw7WsKCEhWaGktJsGjD3LzTiPIUbyDL9oAACKosbiPf++SPBYD5p8OjpFERmqMpe76m760p2pdyjlhhE+de6LlWn0BTUb1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2d3778-de60-4763-8f29-08df46041ecc
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:12:42.2552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpxGA1Pt/IqPn3fe2/DtDc0TpyN4qfNRNIgHSaq9Qor02As5D8WcEcp00Y8fEBcu20qGgP6m61RHiuv6mxR0GAeyNkHp/XsqUG8NOfivalc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVWPR11MB9882
X-OriginatorOrg: intel.com

Hi Ben,

On 9/21/26 6:57 AM, Ben Horgan wrote:
> In order to properly align the schema in the schemata and size file the
> maximum of length of all the schema names needs to be
> known. resctrl_resource_ctrl_max_len() makes this calculation but stops
> short of actually constructing and storing the schema names. As the schema
> name is based on the resource name and the schema name with some special
> cases for legacy controls this leads to a lot of conditional formatting
> when displaying the schema name.

The schema name is based on the "final" resource name. This becomes significant
when CDP is enabled since there may then be two "final" resources,
one per CDP type, but they are backed by the same underlying resource. 
The two "final" (CODE/DATA) resources thus share the same controls. 
> Construct the schema name and save it to struct resctrl when mounting
> resctrl. This makes displaying the schema name easy whilst control of the
> naming stays within resctrl.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---

...

> +
>  static int final_resources_list_add(struct rdt_resource *r, enum resctrl_conf_type type)
>  {
> +	struct resctrl_ctrl *ctrl, *em_ctrl;
>  	struct rdt_resource_final *f;
>  	const char *suffix = "";
> -	int ret, cl;
> +	int ret;
>  
>  	f = kzalloc_obj(*f);
>  	if (!f)
> @@ -3409,24 +3420,32 @@ static int final_resources_list_add(struct rdt_resource *r, enum resctrl_conf_ty
>  		return -EINVAL;
>  	}
>  
> -	cl = strlen(f->name);
> -
> -	/*
> -	 * Maintain tabular format by taking into account the names of all
> -	 * the resource's controls.
> -	 */
> -	cl += resctrl_resource_ctrl_max_len(f->res);
> -
> -	/*
> -	 * If CDP is supported by this resource, but not enabled,
> -	 * include the suffix. This ensures the tabular format of the
> -	 * schemata file does not change between mounts of the filesystem.
> -	 */
> -	if (r->cdp_capable && !resctrl_arch_get_cdp_enabled(r))
> -		cl += 4;
> +	for_each_resource_ctrl(ctrl, r) {
> +		if (resctrl_ctrl_is_default(ctrl)) {
> +			ret = snprintf(ctrl->schema_name, sizeof(ctrl->schema_name),
> +				       "%s", f->name);
> +		} else {
> +			ret = snprintf(ctrl->schema_name, sizeof(ctrl->schema_name),
> +				       "%s_%s", f->name, resctrl_ctrl_name_str(ctrl->name));
> +		}
> +		if (ret >= sizeof(ctrl->schema_name)) {
> +			kfree(f);
> +			return -EINVAL;
> +		}
> +		update_max_name_width(r, ctrl->schema_name);

When CDP is enabled final_resources_list_add() is called once per CDP type. Since the CDP types
have the same underlying resource the two calls iterate over the same control objects with
the second iteration overwriting the resctrl_ctrl::schema_name generated during the first iteration.

I am reworking this area to address the conclusions about control naming reached during RFC v2
discussion. These changes that you have not seen yet make it difficult to discuss new ways to
make the schema name easier to display. I am working on addressing this issue as part of v3. We
can revisit then.

Reinette
