Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540805;
	b=OzHgfttVPRvAm/OyNuwr3MiMSOS7Gga0i2ZntcDuG4Jh99nnALwBr89+lEVkqOK30OxF
	 wW5iYdgyKGYQ1YvU/E/UY7UY02qETCRCB4G4nNDge8ypddnCyeko8bOlGpAcY/L5So9PI
	 8BLPcvnYHGmgtUNJRrM0PI6XCZ0Y0zRbT4MCuYZweOlShTbnGtkvrxmriyVyi2RvewiYW
	 K9UW1V5FzRNzvhtxptApf74cWc2G6sLpGOP/d1fj2ANM1o838ZZub4WWP3+4ZuViEwB3u
	 yCjwOcLWXcpaIYRMZeCNqduY06wHcysPSrJYg1N6bdVYo/HSBWSum5Eg2Uh9FJg6NPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540805;
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
	bh=2fwxuE3vBqjw4Z/HvQr2yU+gFiBcFZ98xRJ1g2dqkVU=;
	b=dDpCFXMXh2obZj+jAvzYASvs/pdMZs9pp6SHeJ5yeuYLp9yr/lYTYPXczYcMh1Azkk69
	 n0PiBekt4XmjMknVw2C1VPIFY4nptjrafekpeSKUyru8f/vzbc6/x5s3Ye+bvhVAv99cp
	 IecUg57l2zEE6aIw5na/9YimABn7v0QYB3ORPyeN70kpMUwvt06AvFAyR9Pf68RlI887Z
	 BLOYZEFBdsehqAJbmVYa3vcu/GPYJq09ZtkXYaxRBzsFHpjZ3Dg4xEkXjw/vZYeQrvYQ5
	 31U4CZngqzI4u4+pSMVFkHRlnBlO2to+ZvZPYVA+26kPAA6+/pPJ1DDq3jZBiRWsnfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gHsvqnuR;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=iyYJ58iC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8E6606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C8E6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gHsvqnuR;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=iyYJ58iC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795540805; x=1827076805;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8eQ5tc4s2kJKqdeS/s82+KooDVbCbqFcE/OMdpv09yE=;
  b=gHsvqnuRZ0p5A86Gm5d5ElU0AqFexg3xdlWjhxijco1kbVz/3BmiNwOj
   YEXf1NOyOifDpQLMbEEJCipqjqf56bG80IMi7GfcrmmE9NM6tZqX4DBWt
   1hIk+dTzrmdE22+FCicZSRdL8w17//Umi7ZG5Uhj0tncBXSFHE6MsSey5
   6FDO0PlvmlmleJERblLho7Ya3B1mDhQJaV9dVja2rKRseQ34f1YGAnhrA
   0DME05wbk9fbbFdbSf/kLsuo4Vx66XiSQ3+4BLB3k66l8mjNdsToh797J
   1MPSdpCezPtqPYe8p566JZaQJ/Eb1utFX6TZnngd66MwUh6ERIQpmHhGT
   g==;
X-CSE-ConnectionGUID: +6r09QmKSomSdPwcncv6YQ==
X-CSE-MsgGUID: JXITvTlwQdKvXd+2djwI8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4258755"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4258755"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:20:04 -0800
X-CSE-ConnectionGUID: mll+hAJsRFKaCCobehQhJA==
X-CSE-MsgGUID: 7KFZEf0DQCmytE0u6i5tsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11613631"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:20:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 09:20:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 09:20:02 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 09:20:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfZ2WGGlX0XFyfZyd23tzN49Wc5MhzZb4mL32taxtLZ66G0HWhwqK0u7Q2rgPsWeUxvq/2JSai+gS+BQPr99DZfruJ/rf7fMPG+UpzscbxSL5qkQXzGPR0mntZ5gY7JyzCk0JRDGn1B7jfk+bXTkWiejhqQ4rpHXfI3stxb5DOpGu+KJWDJzVP7l8jX6QDAmAIzbhpYV2YmosKix7VaWPCoZUXXJLFNKYx44vbP8CSEuwPTO9t28x6AVW0lsH3FmAQgX9K/niMFvSWU1BuNcH3+yAsGjWAWqzejc4CLHI17pV/PzMjzQtvbiOw7fjKPBxB5fPNr7frNnEgbWTvLkvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fwxuE3vBqjw4Z/HvQr2yU+gFiBcFZ98xRJ1g2dqkVU=;
 b=RCQI7OvsbG4hhG2Io6YWZZ8Kj2xccCK9vllsOP3g8qZEZfFkWcXCZ/K4clKcoP/ApBJNXPoQCJM2KxMns8yRqtwET85GQuBx8U/hHyXr2mlGfrwRaOjLwc7YqXmFmAYaCd9wGWRhe0v7oG4lMMeSew9VixRzb1vbGCI36NJ2x2VG4widoVKKd/iVnGB2M7bhad2Sa40hX87+Ap+gc3lqW0iwhEPmfJ74TmDzA0okh4mrBEvaM16m2V+eu9kdEfwuD0Vip3wAWgBbicme7l/ahLPbtAo9rG9C2xawKlDiQWxxU+GDHAg1mt3tzNAJPvg/6uGfIBM7dCV8FJ36SiObUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fwxuE3vBqjw4Z/HvQr2yU+gFiBcFZ98xRJ1g2dqkVU=;
 b=iyYJ58iCtZN8xBpcUQVhHsmVgzdDUF+9DzNUpMTl8MeCi7URqesYFHJkxbspTKKK8ZDBWPCPxjp9+kYkIiLJI1qBr7hMXBxzd1mDzh057ILnVq/v4RqPOJeEJVpAeMepLTrC6A3uzNgvKttnr0cOXVpWHzr5kWnauwPP30TczOg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ0PR11MB6695.namprd11.prod.outlook.com (2603:10b6:a03:44e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 17:19:59 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0615.009; Tue, 24 Nov 2026
 17:19:58 +0000
Message-ID: <0e2ed698-d636-4cbf-829b-5d1e09a59948@intel.com>
Date: Tue, 24 Nov 2026 09:19:56 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/resctrl: Report unknown schemata domains
To: Nirmoy Das <nirmoyd@nvidia.com>, Tony Luck <tony.luck@intel.com>,
	<x86@kernel.org>
CC: Fenghua Yu <fenghuay@nvidia.com>, Dave Martin <Dave.Martin@arm.com>,
	"James Morse" <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, Ben
 Horgan <ben.horgan@arm.com>, Drew Fustini <fustini@kernel.org>, Thomas
 Gleixner <tglx@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261118205825.3339003-1-nirmoyd@nvidia.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261118205825.3339003-1-nirmoyd@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:303:b5::12) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ0PR11MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ebac79-2056-40bb-a92a-08df4a4f2a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|22082099003|18002099003|3023799007|261022105027099003|261026140227099003|261028144727099003|261026121527099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: IizbUvLpIHI0LGhoopjgvtHwUuiSJygCj/KhmMVVgH1PxldrxC/+tXpJrs2A6ZGhRtc9CJQVinyFkh2Z2uYqBFaRWpyarWfRYdqxt9xg2ebRDNfrff4T2j0//GISMNsqIiB03SF9zETrjDeAJ/Xh+MIYyDwyT/lnhA41fUTd0z2QG0Hjisl+ANWgbmXBGaWcsglJQSR4avO3PQCmxngl5E7PvtL50HhO4tSHBByCU40XKNNCRq03cSolZ3j/zNtOyjihIh0cnRhgxA/pakAg7icjl1STToVi/XmK8owOUclBF3ZRoMreCLK9VesRQgNsJdvnoRb8HA1KY8Aa6NBSksI/zna5brDZYWd3u91Nl6zmp639vktD+uHvo/SpN0dZQAmMfGSdwikA2YSlx9OHwl5vqoSf4Mnzf8BpRLTJKwwQx/oFRsQfMhOpvEjjiQFZuOCopDZWGG0KRMrw9gM3ifR5bXIMNjR8dSq5TuRdfTRUld1ZxTcbfeHmCgJyQRMCgTxg+Odc5bCGpprOQQgoic3xIcICZRxtqHq2UnXqVAIxhMhasnWXIAhGagBm97Epen7EZdIHQ8ywnEt3HrhZ//DfGBYQgLQq67zNXirZ+ChhfTxhOaY1+mLZ2Jq8kyZHEPS3MxUnSnr9TnrhtjQNklFyyISpzalrrGFzGp8BTvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(22082099003)(18002099003)(3023799007)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THNNY1IrS2pqalR3ekVoekhKdDBOTFY5eTFGSU9zS1k5ODR1Rjg1TlRRUS9P?=
 =?utf-8?B?bjc3Wm12MzB0K2UvZVdwSXBnQ1BxR2ZtVy9BTmluYk9nbUJYRDVlSDZHV0Jm?=
 =?utf-8?B?VHJ0YWdTQmF4NmZKTk5RWjNEejJlZCtnTjMwbXAyTi9iTldMWXVra0xoS0VN?=
 =?utf-8?B?YTNxcTFHQS9qMGVNY3VOa2tHMVlXd0ZFckRjOS8zeTlGaFEyWkRua2planJH?=
 =?utf-8?B?TkpibFNOSWdjcHYvOW9DU003N1M5ZWpKMG5GYVU4NGYwa1ZPVHlQTTNsdTgv?=
 =?utf-8?B?U29vcWljMW8zcXMzRytJUlIwYnROSFNuQW5uTGFZUjBCVmppMk5vVUF3YVk5?=
 =?utf-8?B?amMwY1hTTFpTT0U0VnZicDdmOWlKQVJjcFNGL3BZamNEQTY4clBOU1BtWCtN?=
 =?utf-8?B?KytIcW9zZlA1Ym1JSWw0UVY1VGQ0ZC9yU3ZXWUJyVmdXeGZDNk9tdWtJUSt4?=
 =?utf-8?B?SjUvNjBldTJMVVM4TVk4WXp3TFR2R3NyNEZVTzFXeEE1d1dhVHdocXk1K2Zh?=
 =?utf-8?B?OGRZUk9PUXdvNndiZXdHMUVodjlYWWNvRFZDYitIM3dvRjNQQWpWN1BsZzl4?=
 =?utf-8?B?eG1aRU1FeFZiYUdSQjdvVWcvWlBIY2QwaVVBM3I0RkV5bExsVS8yU2MxMEdF?=
 =?utf-8?B?Vm1heGMzNy9Fc081YjVaeU03R1czVDdkL29JeXcvWVE0a05Uei9VcXpvdzk5?=
 =?utf-8?B?UjB4Z2R6TXkyVEhTNFo4NkErSGFldXord0FnbU8rMkt5ajdLd25uT1VFYTdy?=
 =?utf-8?B?VFNGR1FVcGtIcGlibGpNSml6aEdkSmdCbmJoVEtUeEZEWGZiMzVXWW5uS0kz?=
 =?utf-8?B?bWRRNDJsWTVCLzNxMk0zMjZ5SGsxTlE2djhoYW8xVnowNWtLTUZXaW9Oc25q?=
 =?utf-8?B?STVKellEd1RjdnlXNDEzb0FrTVNKQk54WktwOE9ERnZBYWJlNzEzWW5RVS9U?=
 =?utf-8?B?WFAzVCtPY0RaVkVJNzZFSjNDRGRjcS9xRVErTzRQM3QrMDdZUmhjZ0VrTU9K?=
 =?utf-8?B?SmVPZlVUTFlYWWwwNVJ0eko5NmhFQ3JOcHlvQWNvYlpYWDBSM1RmNW8zTGdr?=
 =?utf-8?B?UkMrc21xR0NBNjkzNFB1R2M2eEJ1VW9UbW4wdjRsekV1c2xhb2I0SjkvWmZF?=
 =?utf-8?B?eXVQREsremlTNzh2N3ZodWRuWHc4R0x1SEp5dE5ZVTdGd3dJdzU0dDM5Q3Bl?=
 =?utf-8?B?aDVlcGEreW9yaytNcFBmakZhRDh1NUdaMnRuc3ZhWm4wNEpRWHBsVmVXU2lE?=
 =?utf-8?B?R1BLN0pSMUpxYWtXVmN2WHBXNGF6akVkLytDaWNDRTIybnZVU245eStUZ0U2?=
 =?utf-8?B?YmV6WkY5cmN6YTh1VUJNTFlMYmV0S3Boakxsb2F3M1VxeG1qVEl3M1VLYW5R?=
 =?utf-8?B?d203aG92L3YzbTVNeHVNTlJCVmM4alFGTGFqZFdyQ2pteFdVYnExK2M0NGJz?=
 =?utf-8?B?TVVyb2xZQk0zbXVab05FSVB4YlhLZTc4dVZ2QUVidmFjYzJUMy9Dc2NEZEc5?=
 =?utf-8?B?Y0MyeDhGQ3NYSHBrWVVJNHpoSnR2TExleUNYZVFMalFOZ3Q3dnNJdVh4cGR6?=
 =?utf-8?B?cWF5UVI1ajNhVmF6TERFY2VHRHV4WXJmSWFnTTdmWEN2REVncVBKN1dESFFK?=
 =?utf-8?B?VHN6VWpPUnJ4QjI5dnBxL1JBcm9SVFd0MUd2VGFYcGdlNHgrSUluYjN4NC80?=
 =?utf-8?B?WllWc1RQT3lhQjU3T2FhdFgrM2xWV09ZOXQ1TUI2UkpjRU9WSDBHbkx3SkM2?=
 =?utf-8?B?cVZPYXFvVUJJdTJEVitpdXp2ZXUrU0t1cEsvbHFmeE44Tm8wckh1N3Jqcmc0?=
 =?utf-8?B?Z0RnV0FjRXpaYTFTbWxvc29IR0ZWcWU1ZW5YbS9vWU4wZTNOSDNWdThWUEdz?=
 =?utf-8?B?K1pLOTU4UU1ZdGhMRFhjOE9DYmZIRlFwQmNTckJRWEpoZElPZE51NzUzVW9r?=
 =?utf-8?B?Q09peTRHcVR4MTFxQjZPb0UydXk2VS9GcXU3WUhWQjZSRUt2NFk5ZTZWOHVW?=
 =?utf-8?B?OTVvZDdXN1dGNVRhdFdNekhwcUk4aEdXTlBDVXo5UVFGS25LbTBEaDBXY0Jh?=
 =?utf-8?B?T3YxOGl3VExGMTdkUFpHQmRtdDA1UGdtSG1kM2NTL1JBdmx0MktqSmppM2xV?=
 =?utf-8?B?OXZyMURSZ2J0SlBDdHVIK0lIdHZ3bC84bnRWMS81WnU0U1c5YkV3NWJiYlYy?=
 =?utf-8?B?a0VsTC9QNlhpcHBwV1B2NlRISnJ4T3U4b3Vwb3lKZTM3N2RlOEo0WDJ5Qjc5?=
 =?utf-8?B?WGE5RmhRS0FwcURmUzRjbVRTY1JRU3ZwMkJzM2dnd25FeTNwMXFRcnQxdURi?=
 =?utf-8?B?c1U1MitsVmdldXk0VHZ3Sk4xTGp6NkQ2Y1I1R1AwTTR4R2h5dEtVN1FGTU1r?=
 =?utf-8?Q?tfWD6qiOSpav+jAs=3D?=
X-Exchange-RoutingPolicyChecked: BhxwoYTZWeTje60vPY+hOsvXFNGbV1K94g1Q2g02LG1ra0CIlnXwKPapWp8mErnqUgLLaMLlJyGpS8lWFz4Mss2vMAM73Lv0d8X5/W/2X5alvHnvhHfI1BGSX6hjWj50lSFGhM3FVjbWWm8ZffPNoslrT5HNv1HtF2MVYeWUkp+TSCeoeyAwfnyUAUUYCgP3z/XYbI6fSTkd5oQjcroSOHkI7x5w4j43YcxGUbekzoC83SuDla0/ACP8CGiaUupqGgAmzT7HOzDCWDKJ9Lhjay2dQY/Imvfr3FLEY2F0tmSmP+UGp3dzSnqQxBdX48+Jptu03zLOlz8ROJL/RRCYZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ebac79-2056-40bb-a92a-08df4a4f2a61
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:19:58.8736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRiC96t3ceB7nkAqs7G9N3EygtlfFxQNpn5gq6AQCpouAa1YN0z3xKv6gQL/zXnwnC4IrPQOqkReJ/8qnI32XHYPXtP0hWNOgNzNGjGtLMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6695
X-OriginatorOrg: intel.com

Hi Nimroy,

On 11/18/26 12:58 PM, Nirmoy Das wrote:
> A schemata write to an unknown domain returns -EINVAL without setting
> last_cmd_status. The status buffer is cleared before parsing, so reading
> last_cmd_status after the failed write incorrectly reports "ok".
> 
> Report the invalid domain before returning -EINVAL, matching the existing
> I/O allocation parser diagnostic.
> 
> Fixes: c377dcfbee80 ("x86/intel_rdt: Add diagnostics when writing the schemata file")
> Signed-off-by: Nirmoy Das <nirmoyd@nvidia.com>
> ---

Thank you very much.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

