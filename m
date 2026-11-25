Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795648514;
	b=T3qHI779w9cyWLoA33L8HE3NVQPTwGZ1PEQL62RbAcXq4F2gPmwhNO/lovdsAwD007Hp
	 PUqx36dWfYbFqHatfICGkpYvWU9EBef+NDMAw7qbO2IGiJNEHTt5rDDfPnA8734HC3mlN
	 GOxB1I1z4BdkWBLW98G47L+QuODgzxf984nzUqXBtHq8XvubsN2lXwDLfEVi0zef0ofxm
	 wl7Z9VgYeMUZnYyoOpOWRYbmYbl/p2pf8//Gi7lNbfkqTU7CJyElSJ5qOzAZEnZFjXo52
	 916wejiELxo4yGLVXAONaYPcYEj9F/UMcy8Cqm8Watc+INYHyi7DYKq0CbygUCp0CmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648514;
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
	bh=RmU1nJA+wOkUTNee1boo+75PzOBt9JwlqV+KbYh/zw4=;
	b=FHSjJbFgwzwkhDxyIk0IuaWR8dyr5rKUUJ+LKLuuOSUikA07lgsXlDI+p8FIN8ehJCeZ
	 kyY98kihcJFC/oXgu6xsZH7qzJ6kw4VnskN5bEInl5dpmfljAfjaDeLvtJiObwt+SS0F6
	 0BCQSSgwEhGgPVdX3scuE6fV8fByXLZDwvYPwMqTzofYvSeqLAotVPv61RiEsIHNrCWt3
	 cj471nspgTZ2Mmhg8eZFRwyXklRivIbuQIydZzVIRhoMjs2OGCbOI2McLAqjiqbVQKsQQ
	 /XsnvlWf86ywpGF7rfO89fGRQyvG197sl7nxRl4FDvfMlEo1gUZeGyjKqGMFx7vL7Vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bl8HnGUp;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=cGjuIAYl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC31606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC31606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bl8HnGUp;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=cGjuIAYl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795648512; x=1827184512;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=a9kT9JE8ItIwf0eZy6kqTFEjwQ0FdILqRUJ5ZZYLe7A=;
  b=Bl8HnGUpI+CG3jJwrrTYbDbisoF2djrk+fOdA6ldEvWgokSPuiC+mS2E
   jOUOqGEZlBbdKQ8mZyRU5uA72CuM+H2yoicV3iEaSqm1wXs2PnU/DBaJ2
   IsmYymEZ2AG5wZAwbSBhDPljeCumxgoapENPVsaWQDdkyJEESz09qIjK0
   HGX4CM34efUHU4cSTkdhDrFizs626S2XnWj+uvACFtzPax6rHcUY9Hy50
   EMBmzWoRW9bjxa/x3nmgcNDhBriS8sRbNw56mRNRKUOgQtDZZYJroMGxF
   upV1DOTE/udJZ+vcN7Z3VqFpc5siT9BP+Vn2aFncWwQBk+vzTUtgTVSZR
   A==;
X-CSE-ConnectionGUID: RH15rRpkRveni9Mltjvi3w==
X-CSE-MsgGUID: rf/eQDbHSYSlnGJ0ifQTRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4609534"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4609534"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:15:11 -0800
X-CSE-ConnectionGUID: oKYues4lSpyx6SLJbpFiaw==
X-CSE-MsgGUID: WCLqAPNXTvWsYJHPVfXgmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13665280"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:15:12 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 15:15:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 15:15:11 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 15:15:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDhl6rA8iQlzk3yxFiMriYmONfag2rpI8FIphgIWsiYJJSlofrXRSM4thBor2KTp0ClzLw+Whx+S4vB8fEQ5kmlIynHY4CTVvl4LXtfK8aoTbivxbxhTYx/GBfn57K/ZRc3JR+B5HFLbZpWeB5e+imuLhy+CxyjGC3fCp1g93OekxQBUjSBB+6GOxlLyyQ11O5S5dFPumi1vkhdjCOu2ZcbG+0oMTVFWalAC+7C44XEvjZf/wTAnyBFvhOMV3gAbrNMe6XKhOGdZUC7I/bkuRI871hph3UZaLvHtoDPwuq1LteRFhQALfVnyEBhA8HUSknZzyrnCo4+NX/eLx4Nufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmU1nJA+wOkUTNee1boo+75PzOBt9JwlqV+KbYh/zw4=;
 b=Kw3T4lCxodOtAXd2EODJv3o3qV4r+dLmHArvYsmwKotVffiouFHczAgZMHX7/UxwzzuWylvUL4rUx4J9ZAAWqRI1Si79zuGMsO5jm6gC+LQ1GbMG9Qzc4+Ct7lB2fa/EVPPLphdrlT/R9x60mzTRTlfAMqABIwRlivMZyCKbppD7XCfv12AXFC8BuCzbiUH7t87PH4LdqkeddFBMXB4XrfKz7daGA0DXMDLgFrtZoa74JlELqlG1ARj+i2e7lZad8lFegaHveyOXH2YleRQ2Z1XJ1UrcnRW59msfsKy7gjhwgXgo8YkuXCYTlxJvaM5f2Ywit/erBnFoLeoWgnyfQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmU1nJA+wOkUTNee1boo+75PzOBt9JwlqV+KbYh/zw4=;
 b=cGjuIAYlP6s1+pwty0g8OQBRShCQolwWIspH8zEWq+iQsHjUhaJMRrCUsER8B8PiLHJ0wLmERxx7cUUiMEp1Tr8jXeEyikqxx8pz5biKuQhEp6ZSm6yj2ExSxflA0qyX7EQW8QtLLdS7kDo590wAFtEbwpIJV7D+vaqUWPigKEU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CYXPR11MB8753.namprd11.prod.outlook.com (2603:10b6:930:d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 23:15:07 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%7]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 23:15:07 +0000
Message-ID: <89f56594-9088-4b3e-ac7f-0cf911e08731@intel.com>
Date: Wed, 25 Nov 2026 15:15:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
To: Chen Yu <yu.c.chen@intel.com>
CC: Tony Luck <tony.luck@intel.com>, Ben Horgan <ben.horgan@arm.com>, "James
 Morse" <james.morse@arm.com>, Dave Martin <Dave.Martin@arm.com>, Babu Moger
	<babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>, Fenghua Yu
	<fenghuay@nvidia.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Borislav Petkov
	<bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, Peter Newman <peternewman@google.com>,
	"chen.yu@linux.dev x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <b06e1fc2-87f1-4004-8102-c8cc8928345c@intel.com>
 <awOwIrJLVLJJVWNq@chenyu-dev>
 <c8f156fd-bf29-463b-9b42-fa572ce87c5f@intel.com>
 <awZtxwVxIRx/oyOB@chenyu-dev>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <awZtxwVxIRx/oyOB@chenyu-dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0233.namprd04.prod.outlook.com
 (2603:10b6:303:87::28) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CYXPR11MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e60bf69-fc72-4f09-af5f-08df4b49f196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|6133799003|18002099003|22082099003|3023799007|56012099006|4143699003|11063799006|261026140227099003|261028144727099003|261026121527099003|261009223027099003|261022105027099003|261102123227099003|261022075727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: I+LwnS0Gj2hXEJt8FAwcm7TlbOXWPJzWzSJR9/wik8JWxgNq2NcfZeovOAbHSIpwd//gZ9HzFUO7O/0jVyXAii8XDA/CHASMDBZmbP0bkT6ZrCf0Hxj2YNhK/jUKnkx5qLrAJsXV5U4LYHPpEZJli9rOqQ/iJShU3u2vSg/mqQMDIiIWjyhxU8V6GxU2tBbN9NhZqg4NYxcrfXFZtzRByh/91V/HptOwlPWcd7FM5+89/U2IIHeR6DVwXxT96D8fro4tHKsQVSf07fKjcMYecPu2+cJc1vAUOSlF02QpUFCM4S4Lj4gHQaK2lIIvSigswVxtQKd2W1zIcQNgWWRT3wRaqsrVoQ96M0wp0dIYD77jocHbHEiLOVNgxWrz1d7n9/dP9Ill++6DZuiaAao2Fq7eobNH/f6VevxT5W7u8RQNn5t7eqatMfqDKUSkGfwz+x+L+8k+qCq6sObaXMzDeyBCYamr8C02ddGr2xxlpItKSVtPG94vRuTG0XxojwCJvM4mmtkT3hj7H0j+KbHNUI+54K7vRf0QWLHqBAND9TXoh26opKNBvlSgtIamWBPmelIOgmSSqEAmKKvKIMU44VYqy69dde1pfTlLKBOIcbKC7/AFnemqNJWrVLOfWCWT6ApEmmc1D5x1/CF7weyXxWpf/hE6vG1Tj6Ps5gWSplQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(4143699003)(11063799006)(261026140227099003)(261028144727099003)(261026121527099003)(261009223027099003)(261022105027099003)(261102123227099003)(261022075727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk43eTBBVzVyM0xONzVXejkzYnlPSDVtUW5tWUJFTnFteE1COEhPK2hIQmUx?=
 =?utf-8?B?UmVXbkZHL2Z3di9JL3FXMjNEcGljSVBsbFhGK2dXeEFERG9uYll2WVh2VVVD?=
 =?utf-8?B?VGNobkJ6WVpVTU04dXJDbzBwWkxlZ0tjQnJIMEoyM0VHSDU3ekx4WUgxK2lY?=
 =?utf-8?B?RHZBcThLZHpZL2RkK3huMG9tU3JLS1BsbFh1ckZHZy9kSkNMU1U3Z3FRT0tZ?=
 =?utf-8?B?Mi9zcVR3UHltWHZyaGtVTGplNitZOWdIaDArT3BmOUo3NFpnQ3NrYXBOc1hM?=
 =?utf-8?B?MDRvWVpYUlY4TE5nUEVjWXJFMkhNZjJ2UVhmYVN3SFBDV2JaUjVzZzIra0po?=
 =?utf-8?B?S0dCaTdtNjJyWEZ6Y2x3MTN6c0xEdXNTYzYyUGpwOHk4blI3Z2E5VmJJbi9q?=
 =?utf-8?B?WUNkcGJWRzdaYkRWa3BCMlFQUzhTMTFxbjl3MVhqZkZvNE5xMTRmVFJXZktO?=
 =?utf-8?B?ckl0clFQTVlmcE4vNlBMMzRiaXRkRHEwdnI5dDJWbVlkUVZBSFcraFZFMC91?=
 =?utf-8?B?NXkyTHNiUnRPWWNaOFVlV2lSa3BBSHg0Zm5ielAzWHIrMnBsbEhqVGRoUHBJ?=
 =?utf-8?B?QjBqMGY3RUs2dVNWbWRmL2MydDRtTDhrZUNsUnVuME1FcVNiOG5oZlQ2bmpD?=
 =?utf-8?B?aFMzcks4d0JFSS9vZ1JtRXVEcnZsclNwV2lsZ0hQT0d5N1p4VHp3c093bXVt?=
 =?utf-8?B?ZE5RSSttdFJXNlV3cEd2QjByemV4OHNxajM5VHZNMDZnUkY0SmIzb0hsQTdR?=
 =?utf-8?B?VlFWek8wVkNDeWhyaVZPWDFpbis3UEZyYTFKQnE2MlpNMlV0UllDYUttd3JB?=
 =?utf-8?B?MGgzVmpFbWpJMXRNTFZBa0JHZThpaHQrVVU4U0RhbDdacHNpVlQ1b25PMFpL?=
 =?utf-8?B?TnkvWXZqTk91S2d3WDlPc3lrZmpMaGZkTGp0MTN1ejROcGhza01teTJiY1hN?=
 =?utf-8?B?Y0ZpcHQrU0xrVDNpQzVDUk9relExZVpQdVB2cHJNcTRySnp4V2ZCdkthWXBT?=
 =?utf-8?B?blBkaFpURW1kcW5MZWZLeXVOTW9pQjFuenJ0TWh0NlY5NVVSTFphdXJGT2Jh?=
 =?utf-8?B?b0ptWjUyRlhEeFhSb0M2VXJuakhGaU5JamFEREt0eVZKRHNuTjIvamYvYVZ2?=
 =?utf-8?B?NVF6anVXNWJkOG1CdjZWVmxYNTBWM0VpZ2x2aVNkRGlKUkNId2RIZ2h4L1NS?=
 =?utf-8?B?NGoxaWw2VE9hVTVsWU1kWVBjOWMzNmF4ZHdoclAyU0pKUXAxS2tKV09VSUZF?=
 =?utf-8?B?UmZjM3FvN3FEOGdoZUI1ZVlwU2FwcklxU3Q1NnVYaVBJdC9zdTRpdDJpTXF3?=
 =?utf-8?B?M1d1cENYZTBQUXNsbjRrY3A0VkJsY3Y1MUJFeDZkb0JHWGtuQVh2VmxkOEUz?=
 =?utf-8?B?R2xMTjQvL3RiS25UdXd0akFDK1paMFdrWWdlN1ZyNVdocFMvM0JzYm52d3NF?=
 =?utf-8?B?bUF4eGVId3phTFlsTGdJdHJsT3o1cExKem9keWZkajRJQmgrN01yb3M2U3Fh?=
 =?utf-8?B?SVMvZWp1Ry82YWhtZVRKdEIrY0Rjc2IzMEIxdEdoYzhKYUVZK0RDTzlyb25N?=
 =?utf-8?B?cm5lRlI5akJRSk51M05tL0NXZ05xZXdwRy9HejA2ZjBtT2VKcWVUZWQ1ajhL?=
 =?utf-8?B?c2w5blZzUEk5RnlnaFNCa0NHVTM4SkRBKzlmMkZZTko1TS95cW5aaSt5WCto?=
 =?utf-8?B?TDM5NUlFY0c3ZURlL0t1K1F5UTV4ZmptTWVReGtLbFd2OVE1emYwN3puRTNG?=
 =?utf-8?B?bGxseHNFWWRXc0d4eUd0MzJ2T1VLNkdnZXNBNFVET28rRDBDMzFZeGFQN2Nn?=
 =?utf-8?B?dGUrNUhQSnI2MVNoSUtLSEJ6cnQyQ2pPckZlZ05nWm9ieEFCWTk5L2NwUmdN?=
 =?utf-8?B?QkRhbEZlV0RaSW5LNGRnY0dGQ1ozRGVYR3p2WnY3dllyUk4vUGptQVJyZmZx?=
 =?utf-8?B?NGk2elUvcHVEa0NEQTA1SmVTRUpnQW1BQy95T010ZkwrNmNZTTQxbkhjV0lo?=
 =?utf-8?B?QUN1OURHVjVHUE92RHNZWUJVR3ZQQnp6MDZIb0l4eStYWEh3U1BmOUZDaGVz?=
 =?utf-8?B?TFJ3enNwTUYrWGk3WS94djAzTVVOaG9tZmFkM29yK21oWG9WelpmelNEbnIw?=
 =?utf-8?B?TWJpRDJGMjlvREpuVHFJU054YzdqUUVVRElZcmczVUxEbkdTTk5IM1NUd1Ja?=
 =?utf-8?B?L0V2NHdEbzZKZ0lyb3czMU9tZXBFVXhMQTFMM3RpZHBZZ0o0bFB1azhac0hX?=
 =?utf-8?B?VjR3eVVGckhldHI0ZElJNXdDVDFxOXNiRGsrdUVqRmtCTjI4dVh4MmpVTWtq?=
 =?utf-8?B?OWhRYjF2a04zcjAxMjFUTW5ra0RiWUZDQ2c5cTRndlFpcmFSU0tDOUFjdSto?=
 =?utf-8?Q?OD2rgtSrW99Au4Eo=3D?=
X-Exchange-RoutingPolicyChecked: JmZfHwTRm8LBDSflrTgcHwsRQ0aNoPWrcRj/8EDmjetBfUrx5hDvjbguLMQsRahgp5Mxja221kWjdJSu+BiSMo14RvRubqs7tXfbwjPONohag8On/BrqbM45N/0oNWIeLln7lZEBJk8toYT27H1LUoFXNW21nYCFNp808dVDJ7L6hrNevh5XR5CW7jeay692gqqBW1OGSXgyZK5ex13ZU6aCIqeiuh7NVBRjo+1b5/y+JOU0fJ70+Ja8Rqf4SmnW3bSdatc4F8hiJAUP4RQ4B0L0SSDb1V8b7M6xoDfVYCdFJyt2PIh0r4DoB1Q8zPXQYXw57Fw1cmF3yZ88ZEezuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e60bf69-fc72-4f09-af5f-08df4b49f196
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 23:15:06.9584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JxFWV0F+vkjb6e8AuDx1o+sc3xo4HvxQk1U1cKum/JIIZUu/jLTGrJZeR55tuH1NEJe+jrvihYxda1sSbbfvJtvW110P4VcXwnk0fPHWhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8753
X-OriginatorOrg: intel.com

Hi Chenyu,

On 11/24/26 9:10 PM, Chen Yu wrote:
> On Mon, Nov 23, 2026 at 08:26:50PM -0800, Reinette Chatre wrote:
>> On 11/22/26 7:16 PM, Chen Yu wrote:
>>> On Thu, Nov 19, 2026 at 09:04:26PM -0800, Reinette Chatre wrote:

...

> 
> OK. Regarding the existing documentation, I found one minor issue, perhaps.
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index d4a77858a959..d06087af4c61 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -1066,7 +1066,7 @@ only be produced if creation of a control or monitor group fails.
> 
>  Schemata files - general concepts
>  ---------------------------------
> -Each line in the file describes one resource. The line starts with
> +Each line in the file describes one control of the resource. The line starts with
> 

Thank you very much for this. I am confident that there are many more changes needed
for the documentation to be consistent and coherent after the introduction of multiple
controls support.

>>>
>>> "control scope":
>>>         The granularity at which the hardware is able to control the
>>>         resource. One control value applies to one instance of the control
>>>         scope, and the control scope determines what a domain ID in the
>>>         schemata file represents. It is exposed via the control's "scope"
>>>         file.
>>
>> "One control value applies to one instance of the control scope" sounds strange.
>> The control value allocates a portion of the resource at the scope of the control
>> so having it "apply to an instance of the control scope" does not sound right, it
>> applies to the resource, no?
> 
> Right, the final target is the resource.
> 
>> One useful test here is how it reads when applied to GLBE - where the control
>> includes more than one instance of the resource, and referring to that as
>> an instance of the control scope is not accurate.
> 
> OK, I see. GLBE is a good example: the control value applies to one or more instances
> of the resource (1 instance represents 1 resource scope).

That is based on an assumption that the control scope is larger than the resource
scope, which I do not think is required.
...

>>>
>>> BTW, can we provide a control flag that indicates whether the controller(even
>>> the new controllers than the legacy ones) want to display the alloc_scope/control scope
>>> via schemata? On v3, the region_aware schemata becomes:
>>
>> This does not sound right. resctrl filesystem aims to establish a consistent naming
>> convention with user space. The way I read this, you request a flag that an architecture can
>> use to indicate whether it wants to follow that convention or not? resctrl filesystem
>> aims to provide a generic and consistent interface to user space, irrespective of the
>> architecture. Passing ownership of interface to architecture breaks this, no?
>>
> 
> I was thinking if the resctrl filesystem can provide a fine-grained control naming
> convention for the arch driver, so the arch driver can choose which option it prefers,
> just like the resctrl_ctrl_name[] array is provided by resctrl and chosen by the arch driver.
> I was just thinking that for some arch, exposing both the resource's alloc_scope and the
> controller's scope seems to generate a long name/format. But it is OK to expose this for
> all the new non-legacy controls.

resctrl filesystem controls the user interface - its goal is to present a generic interface
that user space can rely on to be consistent across all architectures. If there is any
preference, then it should come from the user, not from an architecture.

...

>>
> 
> OK, I'm also thinking of the min/max/opt clamp among different controls. As you mentioned in the cover
> letter, this logic can be embedded in fs/resctrl(by doing santity check in the staging buffer)

In the cover letter I was actually trying to convey that doing this reliably and consistently in
resctrl filesystem is difficult and leaning towards this being done by architecture. resctrl
filesystem should be able to handle relationships among controls if they support the same
control values, but that is not guaranteed. 

Consider, for example, the example of MPAM's min and max controls (I think region-aware may
have similar layout in legacy mode?):

info/
└── MB/
    └── schemata/
        ├── MB/
        │   └── MB_MAX/
        └── MB_MIN/

When in legacy mode user space can set new control values for the MB and MB_MIN controls - since
the MPAM driver manages the conversion from MB control value to MB_MAX control value it is not
obvious how resctrl filesystem can enforce the relationship.

For now I've just left it as-is - the filesystem allows user space to write a control value to
the MIN control that is larger than the control value written to MAX.

As noted this is still an open so we can discuss now as part of this RFC how best to handle this.

...  
 
> No, you did not miss anything. After a second thought, for the region-aware RDT case,
> we can switch msr_update between NULL and a valid hook to support only ONE scenario at
> a time, and the arch driver knows it. Previously I was thinking of supporting both
> scenarios at the same time, and the msr_update() NULL check cannot deal with that alone.
The solution as described is not clear to me but I am glad that you found a strategy to support
region-aware RDT with the new foundation provided here.

Reinette 

