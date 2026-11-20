Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163885;
	b=0UzlOGP4jYf/F857Ple5TLgarOAp/D+Oatqq2t2AgOAybU4hP2IssPAY2VgVVYMrFkMU
	 3Y8MK3K0vuhxDjKblsVnR9F6zNY9kAOkvDVMRo8ZsUHtKZVjMGYAXNDuHw0IgYMNzS1Ml
	 6sXMjdMriWlDrW0+ByP9gR3uXf5UV3vOfaeEz7EXpGF6f7vgd/eqRIJSnq0dv37bdWA1j
	 5GaT8rbmewEZVKN8jeql+VV4IhxYoOl8Uvtfbj6s4b/UbfrR/xfBQaWa6pbUioG9gK9WI
	 iQLV4klexBvW9EWgy7gFOEYiYaNJOiIVDyLt2EmjZSX6a0xVL/oxAongIWZ/+tuf2hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163885;
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
	bh=AfFD+NtWvZBmcI0U6MXeLnORyprKkTtHlLBQuO6FVpY=;
	b=Q9VGW0RuXjrgrfjStJEMU8IfeRs7GYj3cIZUQ5Xu0Z3zUpp2wuNYr9gUXj3QqxKPdXhM
	 W3L1ujpVOZpuiVWi0oHZLEec0h2mh1SE3AV7AmjcoRkdwiPrGaOYo7zuNcOcRmN+VHzxS
	 6vyl/J8cRbYxbsGeMX48tLLRdgxu3PyoVIikbXunXXDkZh5LUjjkMa5Vc3/CUMmb4qV17
	 cIQ/2mSOLblY+AfR4AZQh7q61m1CPkNaxBg0b2DghpqjzHtuMJHVYCNYtH+3ddL9u0Csv
	 Ar9AEKwAtch0otz3tDXNzOZlECnPQa4tfhYVJcmk2RsJJZnARN1Pu/AH75nbVfJmGKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CjXlusRQ;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="E1KWq/aT";
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA572606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA572606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CjXlusRQ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=E1KWq/aT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795163884; x=1826699884;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=DDIxbN3urVDDTaq1ucJLCJEK5Ho/ZlpzRLFlYTEk9i4=;
  b=CjXlusRQnkYI2ab1GPYwnfOZlXqslLVuf8GkcJ8IKDK90Sg9ULG/tAZV
   5B2lwUHZaaHkCWKaVJJ5qhW4JPZV8hKuqILk8pOqDuvjIwMJEYPU41VyE
   A2zplaMAtofObm1qIN7kK2a8SGLW1ew0AtlaZInT4suxXC2ega00sjEn6
   lFSDTRtFAhPQKBGdXbs+xk8AY8eftEorYINFFvJ2k9QJ/m+cS3sR/SO1M
   216v2BkOEp7+PIQZqKPaMARiE0czk2hR5S1FUg69astYoox8GNoXAmOC7
   VlFtZGbUHCT9wFKBdCukMdtu5cgsjMGe+yI9ejjmuSGuBXtoBd52CioyB
   Q==;
X-CSE-ConnectionGUID: gGDdGcH2QNW4d5bM6sQIKg==
X-CSE-MsgGUID: 0Kbj9rf2SDKkV5U7YGy8/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3935397"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3935397"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 00:37:41 -0800
X-CSE-ConnectionGUID: O4ke4aAWQRO+i+9ZZX3ZYQ==
X-CSE-MsgGUID: My88zc0tTT21dVA/uuvq+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10983375"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 00:37:40 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 00:37:39 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 00:37:39 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 00:37:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jm1SS8buY6Bmh63dxUpNzVjKFUr9Vdh3hBMd1O61ThhRzm2v0rJc3LFD3AH5ct542LC7m/mbiGXZBKFDmVHGyEBQIKk22bWaM7YHvEkHqrkecmHKL5hyEfnQXC4VFazLuc+QjhCO1gVJCKMPInFAGB4f7rplVGh4MKaiFdjS3tnzdD/qyxqbYwttRJ0GaBdcKOweTAUXghL56Ojdm30nPx712waQvqiG94MaNaLB11FKSlcYgVxF4axo4xGL1zCWxEizL/FGVkszPGfZfK7Pv+q+WTq7Xf+4oxjOfDoMVqDrxPHzuwEQ/FWjNFEeDV+18oAKy+RcQSrfq0p7+CQkzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfFD+NtWvZBmcI0U6MXeLnORyprKkTtHlLBQuO6FVpY=;
 b=Qp5qNTVsKKP21jo3N1qMIUC1+oQZH18K3aGEf8jpBovJsWE1s+69ZI02rE/FvZZ3bLpCv6ZD1NdCoNWPm03mX53CofYGrF0GohaOQTAqXryt8oRTNxpt9ca8n0BzuxIVmz8wg+5Hrkt6T/rPJkE74maz7DorNz7C5u6yNjb5vvfqii1jnSu5D1zBPMj5I9yQ5dLnVWbYMSkAW8rwbbpMuH0PF7Ge+lnA/HijDhd7Z57LzanCHsgejYpOKeGFXRKtdX4v6zuM+sw0ZBnlOIXTisyNIkyco0KQ1MPDk0h0elVFEU0RDr5ebforOHXYJu4l//NDog2l9g9t24WQNusGWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfFD+NtWvZBmcI0U6MXeLnORyprKkTtHlLBQuO6FVpY=;
 b=E1KWq/aT7rK6HKMpUswyjOEqrJzE3auecJBgnJNvssdB7r24cJjmm9nKlIqdhzgsxL6VtqehTfwsjy+orgsJmrna8FO37mpFzO0rrY1UXQ4+ZfSejsRAz0OcJ2V/mVd+tPdfOPzqQPfF4ahB8BMPEDBsMAnhszxocG0yKErOaw4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8380.namprd11.prod.outlook.com (2603:10b6:208:485::21)
 by DS0PR11MB8665.namprd11.prod.outlook.com (2603:10b6:8:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 08:37:35 +0000
Received: from IA0PR11MB8380.namprd11.prod.outlook.com
 ([fe80::ea8e:eec4:f8d3:f95d]) by IA0PR11MB8380.namprd11.prod.outlook.com
 ([fe80::ea8e:eec4:f8d3:f95d%5]) with mapi id 15.21.0615.009; Fri, 20 Nov 2026
 08:37:34 +0000
Date: Fri, 20 Nov 2026 16:37:24 +0800
From: Chao Gao <chao.gao@intel.com>
To: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)"
	<peterz@infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/apic: Use the physical address for the local APIC
 resource
Message-ID: <awAGxH0bwT1xLNLy@intel.com>
References: <20261107-x86-apic-lapic-resource-v1-1-28de4cb3fb1e@ahmedabdelfattah.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107-x86-apic-lapic-resource-v1-1-28de4cb3fb1e@ahmedabdelfattah.dev>
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To IA0PR11MB8380.namprd11.prod.outlook.com
 (2603:10b6:208:485::21)
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8380:EE_|DS0PR11MB8665:EE_
X-MS-Office365-Filtering-Correlation-Id: f0ff077f-eaa4-46ef-255e-08df46e1865f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|5023799004|11063799006|261021123027099003|10067099003|261021121427099003|261102123227099003|261022105027099003|56012099006|261028144727099003|261026140227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Yx9ABTaXx90wjXYFNG1IyQoaLR3ReJBfCf2ExOLgHOSxUQSpDru4UaNSPNx0m9BmcNmwSodzFtG/n/A2kEpSw953kKmBPqYc7qQauibZ4H/H/L3w6dMWmH88h+GjSani7fNFjuSbUaUBkqb46NrlPndJqQVanNPEeLcOyYWFW8+P2rpGGfvravejQcmeUTavwHnKlJ8lzgXdFmHD5yXhuxjmWUJ23BFZV2Hk4CtcsVfAYKr5hXH+daSTiYIWarv//xSRyNJZ1iCgL9Z1zyQrwGgasdjVG98WhhVZP014tXRIQXGIpTRmXmdl62IQ/P3pZPO9+dzxuCwedGctp1YkzZgm9NBMzG6CmxeQlSpGfyqCQzwOQXIExcwfNzn3ws4y3f7UExbfx+rLXBaiQw1RtrYgBCS2FIBclW8c3zn6wqkzEFXXwRR7QLwEltTVZVfHi2tGHmRaYvSDyOX0U2+/O9XWRnQRHTEFG3pOkk0TUOfigbnfeHRn5U3fJjqJSJHVF/DYgI0fcba7Oo2Ebj+j1Y9hUXcWStZS9Al2NbHZTI6HxcL4TQy1C7T1FVIXByrE5A9eiImn3cqsts7rrQlQkf99LVB1xu0fcWEL+M2FXJ3e0dviZt22/ITpqMf6QkC3umvZTJX+yXOooLVhRc5UE5Ea+V8G11NRIdi+zW0O8+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(5023799004)(11063799006)(261021123027099003)(10067099003)(261021121427099003)(261102123227099003)(261022105027099003)(56012099006)(261028144727099003)(261026140227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MO7nlgxUg+ghwmPo9SqJ/gQdo7rXfUhXPH2FcRn+prLelwvB8b6MTTT6e2I4?=
 =?us-ascii?Q?tL2UwRvm+sOGUtqOGw23qvYBSj45qN6eme1Fx9ssSgx8vbaVCDxciNnCnyVX?=
 =?us-ascii?Q?23ArNufEgbG3NQruaRlQquKnBmyav/y3qOo6niXzgz1c60W4GMLNjcEC0Wn8?=
 =?us-ascii?Q?UGVvO1BBxC88JHLif9dTEsdsm5TSpbNwJHeXqjnFAvRsONxQ/ORvG4qjzSbV?=
 =?us-ascii?Q?8pOd8vpUXlypR4GiM1dyeund4Lh2/tfTc+D6IcFvqUaEV255HOaNfIfU66ZV?=
 =?us-ascii?Q?SposcuVG+Sz0xcT8rfK16oSQjb2Av5hwQ/VMjQLHd4riSgIl9HnF3tDft31r?=
 =?us-ascii?Q?ePcRMmNvst7YkOnftQARl+NEwALfFT56pEsJ2GazhRMw3wnxNNHbqr/+A+WG?=
 =?us-ascii?Q?S9lKD9XgWXB+ncUOgXA92ZlUip+tgbSezEBO95mPqzZQPDPhAYdO99Dz6t0y?=
 =?us-ascii?Q?KlAIMNnEnJmOzZ18o48jvers9T3kD5ympU5bTQtmpuMf/S35RU/+yp58Pu3Z?=
 =?us-ascii?Q?foDJnLz4JRPsYG4vn5KBR4C9195xofUVcBhuBBsc9Fec8V/ttK5ynGV1OtNa?=
 =?us-ascii?Q?hJLtg1n8ThNy9TdmJBsSEmkHGjKbr3/FnCrL43iljZbeIhE23OFAa5lP2DxJ?=
 =?us-ascii?Q?cq+GhRhv3plnPGddwBnl2f44TWtBc1fua9raxW36wO4oJgf7Uj3w/8LmwHcA?=
 =?us-ascii?Q?kdOXe7cFNBCPsS86b5ondTDXcTzBCH7jG3GOucoxUQOw1j83YZQb7pPH/BkL?=
 =?us-ascii?Q?D4qZW6QAZQ6QqMn7mRIFDvzp/IJC6zbvfz5V93XdUa2r72hKAaagKyyvwlR3?=
 =?us-ascii?Q?YvijCf7pUf99OT8ItOm1jgkomRGdyaj6UlM2axz2sGWGEfhbfxnB6quZj64A?=
 =?us-ascii?Q?qVanG0GUKQjI2ovwrp/UvTVY2G/10gdw6/zJxa8npVqPqvLZVojqSExd7bBQ?=
 =?us-ascii?Q?ez2L2lwRZV184QMRpkS5COfkTm7rmBVlQ2BWZrE7kTmAYc/w+aPRuA9xcIns?=
 =?us-ascii?Q?bq07ZwqpOLrqY40X9KGaYYuxx++3vkNia7ZXnOStBBoDWPFMrJ1c08LyPLLt?=
 =?us-ascii?Q?vzeAAt2lGvzeUzh4XLvIW/Y7hQnJ0Fz/VtG3sLNc2oR2M445gymo60zk/TN7?=
 =?us-ascii?Q?6pd5uk++Lxz/O+mtOocOWMHoiIQIzXCDqdFk4xhJXvRhNUwDbNrnAX6jQeIu?=
 =?us-ascii?Q?ETASxzmlWVABHTj3WbTkcX6qUEzHIwtdU7v34d11mTovtJTQ6TTEvOvjyvK5?=
 =?us-ascii?Q?F3PuQVw6yC0zjz44WCPzEY4dmdfkZOch+sWEQOtXAU7x8Zk8pYPpmpYbxjXr?=
 =?us-ascii?Q?HQ24uOUkRdb1yATJxSVtt8thCa5LnUxhsAFgsmOWvx0GtiNHY+rxez9ja/TE?=
 =?us-ascii?Q?Hiw/FHhmBLdN1OaXpH7ySoxKdhUQli5HsscWytrMs/Wlkh6RCCoQDC1bfW1g?=
 =?us-ascii?Q?XYmJcqPerL5lJ3CAlWs6QdbAqiUTuLUu8ofgHTVaO/HsUWqhhTIAQr1KHodq?=
 =?us-ascii?Q?RDR1zT3zuapzUx+gFTEbkdw0+MmSBJXiJBH108XjcrbmSTVwu4+WVJeLfJWi?=
 =?us-ascii?Q?7OhBNM1N+PpifX/qJs3WwxcmvWWtKy7g1llBeRjnAXtEVMqSo45r3DIgEWDg?=
 =?us-ascii?Q?DpK6pKTLJ3mbNgQD7J+Oyc6oItuPz5VKHyDaZpXeMel1goozMZsT1nex0+qV?=
 =?us-ascii?Q?z9WtIrR84XWdpIm6nViA9/OY24zUGpBLQJYnHQ+quaRb6VCW6fxntRU/+sfo?=
 =?us-ascii?Q?U8d8XQgXKQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Q2O22JqRCTUZhLa0QNJvWcacJMckkYEBDDk+0bNS0Den35mg1NLy+/Lo2PW/2Vp7e4KG0una8YLSLjS4z3c+iVhoEnHkYgGkpnYqE/Vxdl7tgavuYuN1P4LW1ZSXK2goykPgXLyl1JQpTg6I+C5pz/zYeksJoMfRvYt/yrqjf/QNfueMK/twpgIB+VLPMVZEqSEx/UPrl0hGswguEy6Hcn6yuQRnWMe4wed83GGnKPCsG0iuTyKfDMz5/U6O8R3oByAgTWD8hNxVGWU0ctp/thTFhNQbrBLL7AuJoUZrh/Wo1T2wZPpw+vi5tBdvolj1m7mdDf74Z1SG3fEgR11vSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ff077f-eaa4-46ef-255e-08df46e1865f
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 08:37:34.8415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dxN7QOIyuFyCVBDKVVH1hSPJnzyGDKIlVrcZs8t9b8F8bVYQ8qtey6CvoaqLE8N0ucMijkP5UgUNpHByYs2dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8665
X-OriginatorOrg: intel.com

On Sat, Nov 07, 2026 at 12:08:07AM +0200, Ahmed Abdelfattah wrote:
>Since v6.6 the "Local APIC" entry is missing from /proc/iomem whenever
>the kernel maps the xAPIC itself.

What is the impact on end users if this isn't fixed? Please make it clear
in the changelog, even if it is minor.

No one else has noticed this since v6.6, so it looks to me that nothing
depends on this "Local APIC" entry.

>
>lapic_insert_resource() used to take the address from apic_phys. When
>apic_phys went away it was switched to apic_mmio_base, but that holds
>the fixmap virtual address, not the physical one:
>
>  APIC: Mapped APIC to ffffffffff5fc000 (        fee00000)
>
>insert_resource() rejects that range because it lies outside
>iomem_resource, and as the return value is not checked, the failure
>goes unnoticed.
>
>Use mp_lapic_addr, which is the address apic_set_fixmap() maps. Keep
>the apic_mmio_base check, so the resource is still only added when the
>APIC was actually mapped.
>
>Fixes: 78c32000848c ("x86/apic: Get rid of apic_phys")
>Signed-off-by: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>

Using the virtual address is clearly a mistake, so this fix looks good to
me. But the Fixes tag is wrong, as "apic_phys" already held the same
virtual address before that commit.
