Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795634427;
	b=hEJzQY6BeDWSM/LI6nqwm2HDHh//ON4N2zP6slxn6TbXN4qKCxHTmPgTPxRyqZMPiTOv
	 Tkz0zhRCtYh7xvLnf11zZAx7KTFNWTaeVv9xLRYIEvpoiDUinCFL2Vr2Pknw44PtjG4CY
	 s8O8uqU97AMtPegRsEGIGOxOqE5mpiQ6TOKv2ZvEszfwIV/c5SBmazIdvNtud6Xd+5Tuk
	 0VrWjmtGv7hoTSL0v5GdfRTEO8wmSIGF8xJKMevSVy3Zuc8n4pxWmArFr/xBlHaHgB/7B
	 6/SiSa491pYwk4ucpxsK0FMpLr2jD+GLFWUEoX3rsVA41VmFhQlgikl5a6IOh18D8iQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634427;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:CC:References:From:Content-Language:In-Reply-To:
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
	bh=nIGtg7vpd9en2zOcQ4QUllWgMTP9cYc9S+hwN3TzBlI=;
	b=fVfM8CAmLnMxmo3rIrwu0W6JWB8pr3PSAmq7W5Qp04awFmuQ+KqT7N5vHWIsk+3b0J9B
	 lhZP2mHwSEFFpOluHYSchMHv5CXuYsDVWNIkhTgtXlIjKPK78iArcMvsNaB0IGWOjgh5V
	 TUNtWLgaXAUB6EAA9TcVPbOhpjcyHWexYorU9TQe04fr0CRbKx7wU6yPuYoBlIJ3b/pp4
	 ZX3NwYtT4mcJ4yIWuS+lpCEbtisSzAQdQiRuXDJlpbqQ8XcZTozcCJ8M9hK6iqor1ifDR
	 0rJDSj0FvsygH08Q3/j4Xd67akpn7lj5C1YLV3gsVSjY+fMo80Jq4D14DliLdGq4FPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DYweqgJx;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Bmgl4iIS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E9E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E9E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DYweqgJx;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Bmgl4iIS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795634426; x=1827170426;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i+5g9SjI6lifgV7pfCm5zFMCzB0hDjkAg2dUaJwPcbY=;
  b=DYweqgJxJBUtWV+wk2EBkKoUEGuMNfp6316hwZ4T03gvznY1pQaKBJNL
   AOql1RW4jHNLZsIxsN6Sei5bah9W0bljZxioa5YgvZIdjIsGHZOCtidJi
   D41ESoomhcWI1aogCh4OM4khMu/YpILYNn6poHVR65V950A4tBVLCgY9y
   WndFWDS34Ce8Ytk03Pq+ShwXo4gkOXd4wzDmgK4BGkFZec6otXP90eFzs
   Bb+lg+oS0EkwFDsEFdvBFECYJNWpg1SHcjh1Fp3k3C+gOP+hOuUwLIKhC
   2uFCAuYm2G+8AF6gGEvRCsMUITehyEGPD2n120wSGCVkElCkfRlPUJHfP
   g==;
X-CSE-ConnectionGUID: rczVVCbsSU+5EPMIQD8Y4A==
X-CSE-MsgGUID: IL67BAVuTamV92Kj9bJb3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4431968"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4431968"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:05:35 -0800
X-CSE-ConnectionGUID: ALp0Gy9mTiyqEDB7bsM3+g==
X-CSE-MsgGUID: uSP5gZPjSn+0fu+4ZwOwEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12411613"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:05:34 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:05:34 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 11:05:34 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.62)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:05:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/2pywvkl9utVnuYrFtu5aLfrZgm7sHNFhf5exr44LYR0U0Xt94OeNIQ9A3DP27BIc0LLmHTHIE1WcWedBQFkAdzO46xl7OmjVwz8Lha0wqnyslXRhhijZJYoHtPtMtrFlL77ajZBNbcwHPJyiJEG0+y8jdX1miKI0ZmwBJvqKKlZtuluLVCiSGHbirRf9FVFEQvL10p65R9E+dedH7EZIImOGa6B3LvFKPliylKcOahuzawB/nfeHzKvbqQ+57FwoRs+fHMHnMFE1fBLBBW8SUP1PEBEjVEI9EcEMHW8Kb48ffu8ERduFk0LcYSZaIY86qbgtKOeFKLw/E1yXffpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIGtg7vpd9en2zOcQ4QUllWgMTP9cYc9S+hwN3TzBlI=;
 b=OJ8YaF9n2JipYtYkWOREYt6DUsEpmF16sowbJ3XYpp0ssuyDYEG0dSVsZ7T/H3zJEpLgkCw3yj2CQjghSa4S/LrgCDqsN1lt1dMDTSEKsp83DLLn5KGXTteHvD/jHcgeXzXPajPHsFFc3+UyomqQWzjb/IRXPizbVk+cdgAnPoyWpFKArQAVCPQ9HxTYrpDQiglYaqzj2cgekLKpQlOvNX5UnAhMN4PNQYw+lTGMWzG5I6EzidgRBEjBfTtTws2lQzwKqJTcoqpaRaU+dRn3KDCYOgTTktsYo5PbiXTCC3pV4+Y3vcw64jvuDzgDsG+pAO64IkyQ089V9UqmORUcCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIGtg7vpd9en2zOcQ4QUllWgMTP9cYc9S+hwN3TzBlI=;
 b=Bmgl4iISt2c2nrlEwME389c5rUMkXdg6BKAkyxNovn1JvshNhnAm2KfbAODORf1VasLVxk3oFvoebTELCJgNyxxf3qVPOzw2xN2lFApOQ6tlrt4gb6tpAiLFINfkUBFXUIBnAQgzIii2i3x8M0CvRIb7hhSF5Y+hRlu9larQfs0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 19:05:28 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%7]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:05:26 +0000
Message-ID: <f821c042-1d52-44e9-8476-80671fc601b3@intel.com>
Date: Wed, 25 Nov 2026 11:05:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 06/12] x86/resctrl: Attach ACPI ERDT information to L3
 mon domain on CPU online
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1793864720.git.yu.c.chen@intel.com>
 <ea099619212cbc4e58dc81b14476cc1af5bda880.1793864720.git.yu.c.chen@intel.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <ea099619212cbc4e58dc81b14476cc1af5bda880.1793864720.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::12) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: e446d355-8b23-410f-1136-08df4b27105f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|261028144727099003|261022105027099003|261026121527099003|261026140227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: ugIz2qPakTj+mnK9Sg94a6rCMJc3EqXUH2dSvIhc3STvnlJj0nJjIrD6Bc252rGzoRMxklUUxJl6KJqhof54vg8ThLNCNbHuTuzr81e7vn4Aj2vETca8d+OtpCDn2aydUUPl+JYpuR53JbCbRsoma5dOn8HlsQv19mU+58Wv2L8l6T1+fXUmDg9LJAqrxaeQg88yT48heTQgJAnfSbJaL9QZPfyx5eeVCCdGMwpT/Q51od3OTpOJT5Q7Z6uFrjYK09Wmol5xZ5XoWw5yxHOKAbwebhxLihmuAdlz6YyWIfw4QtYE1hxtW3b98yf/OXvXZROHBLNDbotzV8qWXoIqqcWnuwi3uLnHXADT2JpnA9DUSEWBnBEyJpNAooBuU/8yTs/NpcUcJoQKelfSKlKVMLI7C1n/7f4bM9Bf+539wXRuyVa5Sgq6hBqGhG/CjnFFwheJX6yvLmHXg5NlHQl6FkcPqTWeh9pXScWGEw8C+FDRahLNd8aTnDtKIrT/JMj7SecpD2y+W67k1mIfbNZQUTz0kWFXt3VIzmlWeqdMRdQ32psb46WkT8cJSdktDD+hI7RRw75l8s2/XlXxQaJgPnm7WhqIEuI7AvkEl2ItEexEXBHdcvkdN5BIm8mqdZvvxGPnobzBmb5im4TyevrvdiM2F9pjNnS7EyOoN8u23Uc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(261028144727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVZOYVBiQVkxZjM5R3ZUNlJ0cmd5cGJoQUlvNVBJNDRrUGJIOEtESlV0ZW13?=
 =?utf-8?B?ZlI3NHlmRkpCRFVQeVNqVXUxRXpTbHJvWnlISmdMeWV0VktVTm5rMVYrSFg4?=
 =?utf-8?B?OVpMdmd6RjBxWi9tRjRaUld1b3dxNTcxSUVRY3U2TDFJVjFTTXVheXZtZXpy?=
 =?utf-8?B?WWtsSlZyTytVVmp4VkM0Y1hTQkhPMVhyV3pxc0lNVkFTcC83WEt6T1RJN2xC?=
 =?utf-8?B?c3M0VGluSmh3UytJTU5Qb1NpSXJmSk1aS215K2YyaHQ1Vk5PeDcraXRZakpo?=
 =?utf-8?B?OXU0NlAxVW5Xa29HTzdtOXI0YnhHa1h4d3RRWVl3NmQ4c2d3eTVmMkY1TVcz?=
 =?utf-8?B?QkZiY1orTUx3MUREVW1pMFMrbjBTMjdUdUg5ZXh3VjV6UVlhMEs0dUdOR3lx?=
 =?utf-8?B?c1AxVm5GamZXeWxoQkxSdi94YTBwQisxK0Z5NjAzdDZzdHFUZ0NHNHlHKzlR?=
 =?utf-8?B?aEdHRFY1b1JLL083L0RBQ0U0WUtyZUIzUmUxNVRBanlmVEgzZ3R1cnRBemhH?=
 =?utf-8?B?dFNtL0doOWlTWGQ5YnRwQVFrckZ3M3IwUkF2azAzbis3OE5ZUEtLZ2RUT3hM?=
 =?utf-8?B?aWV5Y3kzL3hHMjJaejVlcloxTnF1MWpJL3BYdXlGTlVyczg1eTNYbE12eU5q?=
 =?utf-8?B?V2VHQTNvakJTWUpjQ1QyL3RGUlpFMlJITW43aFVxUmVZTHJHQi82T0l2ZCtp?=
 =?utf-8?B?OUFta2thMW9OSERtMVB3T093Z2NneTFKbDF3T1pkOWpLNEVFTVhmNmo2RmUv?=
 =?utf-8?B?NHEva1hWTmZDeE43b1c2V2dvK0VGZVluR1NGaTcxRjlVdVgxQU00L2h4R00z?=
 =?utf-8?B?RUhtckZDakNicC9NOVgrYlZrT2pzQmR3VlBwUFpIZTFtYzErTDNxVUVMZ1dO?=
 =?utf-8?B?c3N4bU1ITlh1eGhOdEdOTzFkdDh4TzJXYVhQRjhoRlZIZlY0b2xPNkRUYTZl?=
 =?utf-8?B?MkNoeHlkR3I3L1U1NHBmTmsvbUJ5aCtwcjlpSUVEWFFrOFFMSW5GUDFMalZH?=
 =?utf-8?B?eW03UnFhdmc4SkdBQnI0WHdoRWQrWHl5eTNSRUh1ekRXVmxlSG5BMGVoRjRh?=
 =?utf-8?B?T2tWd1NERVFGVHl1bFByd0tiaEhUYTdMZS9nMndoSVdtVVlyT0lJYmlqaGY0?=
 =?utf-8?B?WmZ1SVEzQW10RTQ4UlB4SUxGY0t1dFB1U0kyK2p3cDJSck5ZajNSaU5IeHhz?=
 =?utf-8?B?NDFtb3lvVGhVMXc3cWZibmttNFkrczBHNVN1V3gvNnRYNGZ6UDF0TUFTaUdI?=
 =?utf-8?B?cWdQd1V6MlhIWS9CaHJtQW90NzVvNFY5TWg2blcydXVZVDM4RnJSUUZkTXFB?=
 =?utf-8?B?bk1tR1Avb0NuR21SS2xMR0lSVUQ4VThSdGp5a0tkdlhzRjF5Y1ZqcmpITWox?=
 =?utf-8?B?djg0c204R1JDZVRTT01RQUdBc3d0eElsS3c1Q01MdnFkeDFieDQ4UzRLNFg0?=
 =?utf-8?B?ZWNUS0RZV2k2V2VqNDVqakN4WU5IdGRyMFBOUkY5M21vR042dU5QUlN4WVNI?=
 =?utf-8?B?b1hyYmg1TVNmbmJ5V2xPdzlIYU5xWjg5RmdnQ2tuOWJBZURQTmNodVNLczdq?=
 =?utf-8?B?bHF4T0JmOTRrWUFZbnpaTmxOQ0Rkcm9iZzdyY3FYbUVtMk14cEhtTzBXS0hE?=
 =?utf-8?B?dTIyWnV1NWNMcys0WkZKUVRERWJ0UkdtZnlVUGcveXF2ai8yQTJyeWtCQ1Ar?=
 =?utf-8?B?SFNzSFQ1THlHQ1JwbW1JNWZud3oxblVTWkJOVWRDVzNmV3JPMUFYZ1Y4MUxB?=
 =?utf-8?B?ZWE4aGdiOXJZU1hqOHQ5bjh0YkN2RzVBc21XS2srblhOTGxhZmFDcWpTRDNK?=
 =?utf-8?B?aUhXZjJQTmdWR1FEN1FKYWVaQktkeHhEQXZ4MzN6a2lGdlRoU1Q0REJETkdk?=
 =?utf-8?B?R3V5M1NGNnNheC9rdk9aODBIWGV0V2F1cEQ0SDlRa2JBTXV6bVJRaUk2NEt1?=
 =?utf-8?B?SlRFeG9yeE03TFlvSVoyUGdNVUUvcXpjN3gva2h0Y0JGdFkvd3EzT3B1Nk11?=
 =?utf-8?B?MkpGeWZ3dkR3MHdwUC9vS2FBNTRLM0h0Q2hOQytrdmhyMGhIbDJueEhGVThw?=
 =?utf-8?B?eGpMU0d3eFBRcW5EMGk0WnRwMXZKV2RvV3F0THhJcEpsWUJ4TXVac1MwNE9F?=
 =?utf-8?B?OTFBTnN2Mjk5d2JNV2tHa09LMC85aWZrY0xTTUg0SUI3VmhEdC8xM1M3RHIx?=
 =?utf-8?B?UmZxQmQyRzUreFh2VE80NWdTM1FPWlhHZG03RUNBeDdmZmZ2Ynd4emh6TEhD?=
 =?utf-8?B?R2x5aEp3Sk1rOEtXRGdDOTJsT0NmTGxHMFU5RXRhaGtDdXdUY2dXaHo3bk1Y?=
 =?utf-8?B?cEx4OFFEbU10V2s4YWZ6VGR3ZnIxSk9WSEs3bEtCcmQxN1Y5eEtTalJENUp6?=
 =?utf-8?Q?6M1v+ezfCMNevIvY=3D?=
X-Exchange-RoutingPolicyChecked: D5UkSLsGMqc237nAHQfeTJSw73GoTt7SUHiRtzU32XSvZEl/zsTCoEPA83i3LIV0RWPwbKuYS/PStasYAvr9vyrfhIZNxUB3ttspYuw0ZDlhXR2f3n7G5vCYgbmFTG9Kcylk53LMuAtk7NIOYhDx+ZCzDqXN2NoYShIzBhhMHTyJkU4DqEmo8LAa/TDsB5/L0c2GGZSULiyiCGGyZrF9OZhaM2UR9et+pTw/K/cEAGKFLEUfcZYavVwpCp8uUn2uCcr4OsokDChJiQrWAlq40MAwikuiD/6XV9VJb1FIyuXOd42Ncb7Ov6pYa3SEPTVMNv456FySL7zWRe8TV/1giQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e446d355-8b23-410f-1136-08df4b27105f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:05:26.1533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ucyv1xOLRu/ary0rcOpIcZrhC2Ah/GcNw5e4flMwskRiNMdy88WBWVmn8Yg+a/RHewO+vtLDtDVtGQfumokPOK1vucKrzbBNHtaF1lbn2tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
X-OriginatorOrg: intel.com

Hi Chenyu,

On 11/5/26 2:08 AM, Chen Yu wrote:
> Each ERDT domain provides MMIO registers to read the monitoring counters of the
> CPUs it covers. A monitor read is issued against a resctrl L3 monitoring domain,
> so the read path needs the matching ERDT domain to find those MMIO registers.

There is a missed opportunity in the above context to associate the resctrl L3
monitoring domains with the CPUID cache IDs they are created with. Establishing that
in the context will make the rest of the changelog much easier to follow. Consider,
for example:
	With Sub-NUMA Cluster (SNC) mode disabled, as ERDT requires, resctrl creates
	one L3 monitoring domain per L3 cache: CPUs that share an L3 cache form a
	domain whose ID is the L3 cache ID derived from CPUID. Each ERDT domain
	provides MMIO registers to read the monitoring counters of the CPUs it covers.
	A monitor read is issued against a resctrl L3 monitoring domain, so the read
	path needs the ERDT domain that matches it to find those MMIO registers.

	ERDT enumerates CPU-to-L3-domain membership independently of CPUID: the
	firmware CACD sub-table lists the CPUs of each ERDT domain. An L3 monitoring
	domain can only be associated with an ERDT domain if both views agree on the
	L3 domain of each of its CPUs.

	...

> 
> ERDT and CPUID enumerate CPU-to-L3-domain membership independently. CPUID leaf 4
> describes the L3 cache topology, while the firmware CACD sub-table lists the
> CPUs of each ERDT domain. An L3 monitoring domain can only be associated with an
> ERDT domain if both views agree on the L3 domain of each of its CPUs.
> 
> ERDT is not enabled in Sub-NUMA Cluster mode, so the L3 monitoring domains have
> L3 cache scope and their IDs are L3 cache IDs.
> 
> When a CPU comes online, check that its ERDT domain and its CPUID L3 cache
> agree, and bind the ERDT domain to the CPU's L3 cache ID. On a mismatch, keep
> the CPU online but out of all resctrl domains. This matches how resctrl handles
> a failed domain creation: the CPU still joins the default group so tasks can run

No, this does not really match failed domain creation that only removes the CPU from
one resource's domain. This implementation removes the CPU from domains of *all*
resources. After considering sashiko's feedback about AET it looks like this
can be avoided while addressing the issue with AET. Please see my response to
your answer to sashiko's feedback found in cover letter thread.

> on it with valid CLOSID/RMID values, but it is not added to any domain's CPU
> mask.

Needs imperative.

> 
> When an L3 monitoring domain is created, associate it with the ERDT domain bound
> to its L3 cache ID.

Having the solution portion start with a verb helps it to be impactful.

> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> ---

...


> +/**
> + * erdt_l3_mon_domain_setup() - Associate ERDT table information with an L3
> + * monitoring domain.
> + * @hdr: Header of the L3 monitoring domain being created
> + *
> + * The CPU creating this domain has passed erdt_try_bind_domain(), which bound
> + * an ERDT domain to this CPU's L3 cache ID. Without SNC the L3 monitoring
> + * domain ID is also the L3 cache ID, so a match is always found and
> + * hw_dom->d_info always points to a valid ERDT domain while ERDT is enabled.
> + */
> +void erdt_l3_mon_domain_setup(struct rdt_domain_hdr *hdr)
> +{
> +	struct rdt_hw_l3_mon_domain *hw_dom;
> +	struct erdt_domain_info *d;
> +
> +	lockdep_assert_held(&domain_list_lock);
> +
> +	if (!erdt_enabled)
> +		return;
> +

Could you please add a struct rdt_resource * as parameter and add a warning here
that will complain loudly if r->mon_scope is not RESCTRL_L3_CACHE? This function
currently has an assumption that is enforced elsewhere that makes this flow
difficult to follow, considering it is called when SNC is enabled but subtly
relying on being gated by the !erdt_enabled check. 

Reinette

