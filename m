Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795206396;
	b=Ct2VrbXHxEJVQIKsgEdNSQ8bwRTQOoHMyBjmDIiTNbfEUxBXrcOcDGTddf7gUBygc951
	 9loXXMwNnKcazJs3XRai7InhuVwP3ShwrS0O/60HQIf+q6rbM+uNUrmFzbIJo85LlCeYu
	 u9quub7h0FynoQJP5c6GudQwxLsTcn0H+QuxpAQQEYgbPlovBRSmpWpdmmGSbfqm7RXeV
	 jsWhnmUK1tmydJuHf243H6sbkBmQWQezwErYZ4Gq78CoEd7BUhaOBUgijjsjBcCQ8+YTx
	 h3DxYeRCHtbMBhnRQ2l/VQwbZsH5tvk0pDUXwvOnQUT843NKTnnbgjrVxFa2ld+0j/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206396;
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
	bh=pole++P6D4VgXaNhGnH0z8fqZIvdPfXxOPuR6ARXERI=;
	b=Mt3Qxy+G0WaH3INHF7VMVOYFt2IqdYY+aMM3wYRvZASkzpk5ZA+6fnrBrl16ruxeRcg1
	 u6nJ9hTvG5NTGkznhwaTKKUKqqud59A0c7klLUABHdf0aPcP9pRc7olAtMYQIxcx0JU4+
	 knNXSerIju0hWMOY9YWAaU1zIKoEpOFqTzoyoCSMSA5sgrpb/2eaD9FHgrhKMrcMXgqo4
	 3svkVsnqexuFQB54nJclQkDsmCeXwujVEGQ41vAW31YuWUqOPAR0XAeXjwk/C1diPYROT
	 tyrMML5eVbfnToVBFvcn/PyiZ2VtXHGHH7bdV8kU4ksGnGl5dSohi9xSRqpX5VFpLtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C53kHrCZ;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Ov+1PVII;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2519606A339
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2519606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C53kHrCZ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Ov+1PVII
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795206392; x=1826742392;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VGP/UQX2CAdKwIvGtlhhsEnmT87gLnwXtQih3gbyBKk=;
  b=C53kHrCZXcz/jYblLXAaM4yhql3/NAKPPtXH3IzDtB01EdooPvCOe1tf
   xsM2jh4KRz48/sM2DqjbRQPc00HDamASfEnAtkt1eCl1IDcFT+yw+fPmt
   3vHFOHlPe8yhBsoFjJEJGRoRP2lT/kwv0JYmeU5h5kMSLE0cTSMOr1ZIe
   pECpYkUfCwP9CnV8h7Icg3a0OxZIx0PNEh42sQnXvAfeYlM23DSCYm6sG
   Lwy/V2IQMQjsbaYNZ3ANs01sORhuRZSwAdzx3z4P+daLzD3Wd3a52k5IO
   jMRI5diOmpGiUn7eRKSOagkO/YYwf3YNMypTzyovxqL24ggMy3O1bkVmU
   g==;
X-CSE-ConnectionGUID: eHgG+jOJSCOAGonxCjeThA==
X-CSE-MsgGUID: +sz//cYXTwezoKW3+Oy2Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4135385"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4135385"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:26:31 -0800
X-CSE-ConnectionGUID: bDUUzREdQlKgcY34w/xqyQ==
X-CSE-MsgGUID: 4An/OdjAQ16UCO3wnK20eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10670716"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:26:31 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 12:26:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 12:26:30 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.18)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 12:26:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qug0Km1rnJBtez3atVxWu+WiVDIPlSkwwgKMzjhb072JQBiNcWhkhypjoDfRWb0AS9NFzk+tsfq687tDmY4JNJa+VBE7DaPVtBrYwoNSGp+wz6hUOgsr97UjZ/BZs8L9Pb92omd22kTerZLBPKcQ4KGvYusx79ue8UCNy1RmGo9rNsIqMYwIH+D1DmPdwFHdGxmPPBTvcABvlQGRSYCJ2gW1basD0C/00m9tVGYn5x79AdWyyN1vtwgMxsBCTjbpIl2Ab5fRhe3KoB9sSmFYQGxknZyQ0Lt0lx+i8gCIhGJoGLdRNwRbHOU5Y/N9N/JFvBlkN7ZswsYYZhA6zNZ98g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pole++P6D4VgXaNhGnH0z8fqZIvdPfXxOPuR6ARXERI=;
 b=QNcej+ECAgmPu5uWl/qOuwPmv+M1y/Mk3JPzJXDteFywsy7rO9eBaNpuB4WKAafUEZO3z+fKhuVzLY+xTiW8F8a+mpKsP+mmrg/+EkXmSMgJLzN18rHQtc3AIsnhujVyvlzir+iA+d8Ju5pFmmW7fx94EfkzD/XXviFHC7CnzUttkQLTiiQ0kG/KIc2kVz8sdMVcF1ZtD1DhVAiSbuDB1IBGibHNkRxuknK5E3/dSEwClGd2Bssh5pJSZPUuNo0Exp8iH8PGzfaV9cXJtRG+8WIoqTh2V+c/K2o1CFhYgRi/M0GHygoLA6ZPrPdRaIxtjSoVcLNlsYpvEl6ZXOmApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pole++P6D4VgXaNhGnH0z8fqZIvdPfXxOPuR6ARXERI=;
 b=Ov+1PVII1z24U+VzwOkOZhY8JKXYHg0iWQcQkNsMVvNYGXhRdixbVisuZsfRgWznJr94wUBn9P7HZ7nFIMXOOe610DNG5C/+Ydgbj+eIavSzIFlKq6KCtv1VPM6q+4q0QMugQR4+2RjYZ3HXDJHFi+Za2P6POhMjN3MOK9nKmXQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CO1PR11MB4980.namprd11.prod.outlook.com (2603:10b6:303:98::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 20:26:22 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0615.009; Fri, 20 Nov 2026
 20:26:22 +0000
Message-ID: <5303aae7-7886-42a8-85f7-78f62e538f0a@intel.com>
Date: Fri, 20 Nov 2026 12:26:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
To: Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>, "Ben
 Horgan" <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Dave Martin
	<Dave.Martin@arm.com>, Babu Moger <babu.moger@amd.com>, Drew Fustini
	<fustini@kernel.org>, Chen Yu <yu.c.chen@intel.com>, Jinjie Ruan
	<ruanjinjie@huawei.com>
CC: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, Peter Newman
	<peternewman@google.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <b06e1fc2-87f1-4004-8102-c8cc8928345c@intel.com>
 <cd2b8441-e438-46e2-bc2b-9623d5d6abf2@nvidia.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <cd2b8441-e438-46e2-bc2b-9623d5d6abf2@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:303:8f::29) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CO1PR11MB4980:EE_
X-MS-Office365-Filtering-Correlation-Id: a8dbc7be-6999-47a9-df17-08df47448ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|261009223027099003|22082099003|18002099003|261021121427099003|261022105027099003|261022075727099003|261026140227099003|261026121527099003|261028144727099003|4143699003|56012099006|10067099003|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info: IIpLdnwNQdn1OJIyuk8CBREMv62wVPL8N/0O+noQWzfr/qxJgXXnZckqBc85tjsBi/+Tm3023FvBYfvu76gt5Gl09Qar/eKEMt0bEFMD9W5GQRG0CMiNYOLPpzY5ftsiQV2HS/uaMOFn/RvD792NUJpsbykbG4JzSr1DZgBVLhL81L49iNgyDVemmMJMWW8729mddyW1eB9cVB+7Z95ZbX+nXz+NxxRFyvZ8UQFCwmfqFFAUsTvFpuDykYk54737hc+mAALp5juJMvUHyp/UOOJU7Sqjzts5Mw3YqwpljO2HZ4XnyPDwl92F2E/Mt9Wm/3QsBVZl6LXdfxJQ2oNqKU38pHsWiUlxToXdxMyLHl+DL0Rn8wKlVTyd0s9/XVNTejI9f8jMJXqWIDCUvHWJfr7HRhw1eBhzFF5f5yo5MkWvCB/e3AbQgOtMK8Qu2nNt/vzGVrbFQdGCgcueG1EbgFNKp/JQZFTl6fM809fhYoWMwRM7sqPE/lgIu61XUjUXS0AlOtAnENMctYc0JZywCCU6ryv3PzTyTGnk5R6JIO1srTojMdO9Y9/W4N7JfRXmsiDb9AmogUGuxxvY5gfzKrtSeuvI2iVpunUQuabzBx8hmACDt0H0YGPT8NDl7NJY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(261009223027099003)(22082099003)(18002099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261028144727099003)(4143699003)(56012099006)(10067099003)(261102123227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkR3bW1jWWNOaFgxT2VpNXBNODJ6b3pYK2RGckliUGFGbjhIRVZEOFdLSnJx?=
 =?utf-8?B?SkZmNC90OFFXQjlWbW1keFliMTNiSlVKOFJVc0JOUndUMEdQZnV6WXFuS2NF?=
 =?utf-8?B?bi9PQ2Y3MmNSS0VsODgzZlh4TytRelJJaUFESmtRcXQ3V0pDREhkZG1jcXJp?=
 =?utf-8?B?aU1DNUZuZFZCSElmbW5pbXhQYzNpbnZydENXSk5vOVg1ZGQ1amlaK1dLaXhn?=
 =?utf-8?B?NTZyWjlTMHA4TGIydTVPZ2l5QVR5dndJTjJBdlZwb2RjWVkzV0JKYzQ5UWla?=
 =?utf-8?B?Q2xQZVVlanlDZm4rV3p1UFFud21xSE9ONnBGNXV4amVzRk42L2lNbnFlSmRj?=
 =?utf-8?B?Q2FobWh1R25sQ0xSZmVFTmdpenQwME9jaVd1UWJXamJzek0rYmMwdlg5c1JN?=
 =?utf-8?B?TWZhd2xSeFJOeFVYNUFKMDJNOCszWXNWTGc1UFBoSEJySk5PemdoUXM5WjVI?=
 =?utf-8?B?ODJWWk9jRnZwMGN0K2g3bnRPQlRwV2dkT3F2Qk5CZm00ZFVvR1JVbzUvTjNr?=
 =?utf-8?B?T3U5bjBPUzBQTHVZZmFocExYa0VCU3BmL3EybkRZa0dORVdGVThlSHVxbHJV?=
 =?utf-8?B?dUd6QUVjVnNiNngrUGk5bElGVXIxOWN2WnA1c2RqaTdTenFPR1BRcmRwRFNw?=
 =?utf-8?B?Ym9kRk90OVRHNyt2c1pYdG9xME5kVFhtSjB0ZlR2TXZ4MTdFRThZZEVFNmFu?=
 =?utf-8?B?cThETGRmVW0xbHo0N0N3aUpqa0xrVWtFZStJUnozb3ZwclMrenQrTnhKbTVx?=
 =?utf-8?B?dUpTdncvaDBSN0ZUamRjbVpidFNHZXk0eU1yZ2d2eFhkTnNVZlprUTdiaFdT?=
 =?utf-8?B?WWFTa0ExV0Nkb0MxTG9FK0QyR2QyY3kyYkNqLy80K1BLcmJNSSsxS2REazd3?=
 =?utf-8?B?RGVwWVhmQnVOTlZrNmNPMTFxdE0xd2RXSEI4dEtOQnVmNnNHa20wTjVzdzh3?=
 =?utf-8?B?MW56bEljcFBuR0pkOFpuaFlVYkpMY29kTTgxZE81blNOWUgrR3NtNXJTQS90?=
 =?utf-8?B?cmVjSU1GSzgyaldoZFI1dzVhNVBGSGZscGdpcVhOdURVekQwOG80bW1wZGJh?=
 =?utf-8?B?YnVJN0VWRXlxNFVDMk1kVWxPeVlaamExRDRiSWxuVkppbXVUMW5yWmVZeEpt?=
 =?utf-8?B?d0gySVF4NFJCRU9TSzR3K0p2K3pSZHFMbUN5VkJ0Ym0wU2MrREY5aHdlUHVC?=
 =?utf-8?B?MDVWdmtsYkpZSHpqOXZZTDk2ckRRdkQ4ZGdIM1ROTTJpMGtXcVdpQ0NsdExo?=
 =?utf-8?B?djgzVkprYVNjRlVDa0RlUFhBWlVwTWZaOENFeXppV1A3bzJWcC9aQVVlMFNq?=
 =?utf-8?B?VUdUQnN5YmpQZDB4OHhIQUQraE5rUzVGT3k2b2dXQzRPb0FVSXc2SHJJeXJV?=
 =?utf-8?B?UlhHcURiRVdVMngwYklna3M3SGNUandRcnFTQUpTTVhNSG55bTZMN3h4MDhK?=
 =?utf-8?B?RUQrQVBXWTRibWtKS2ZkeUNrYW44bk9tWGdkUWpoY2lQVkp5UUE4YjNUdEgv?=
 =?utf-8?B?dzJ2YmgwT043ZWQ0bjRQZk1QZ1paaXlWR2g0cmIxWmIxZng1RnJaVGpuM2p1?=
 =?utf-8?B?b2Uzd2tPWXUxMW1RTGtVa2FuY2pDTUEvb3BmYU5BVllpWmlPaWl1OWFOLzhG?=
 =?utf-8?B?OVhyaUJHU0tiNlVXWnFaOUZULzc1YnZZMzlFWG5RS05wazhUNDBvVzM3Tk8x?=
 =?utf-8?B?a2g2Ly9oNmpNaGM5bzZoZ2hFNmhTWUR0NmNkYnRvcStxYlU4a1RtditTeU00?=
 =?utf-8?B?b2NiNnc5NmZ3OG1hVVp1Y01YZTVkRmd3VzFIR2Q0ejMxMmljMWY1aGwzWjBD?=
 =?utf-8?B?MXprUEdRL05Yck9tQUdnZ0lYc0hYQUxsYmRRMFhVZ2ZCSkIzODRTaTg3WE13?=
 =?utf-8?B?RFVNYUhRaDNqTDVzL0lNejZiRGYxbjh3Qm1uMmZGMjlOSEp2RU5qZGhVdUFF?=
 =?utf-8?B?K3JqdFo5UnR1LytaQXlFMFkyS29IZWRyRGRlR0hockIrV0lFVU9nKy85bVla?=
 =?utf-8?B?aWhRUmRGRW9mVysyNmlZeEEydTFwSFpLMzh6bnRkQWQzVmMyTkdtMHJIVHIx?=
 =?utf-8?B?RlFQd3hWYmFYL1lEbTdwUnFpd2FTZG1LNk1hYXQ5VGZKeXVXSjVON1EyQXJD?=
 =?utf-8?B?S3ZRakora1ltREZUK3dET0FWdWlycmJzR0VjdWFkdTNwdjhJRTFoOTBUT3Iy?=
 =?utf-8?B?WHM2bnowcUxZdG9KLytQQkxTSlFMc3dMblhTOWVNcWw5bmV5cDdmYmpSdjdJ?=
 =?utf-8?B?cEd3SytrM01zYnJGS24wdll5emJHQ3RQbHFtb2h0NHVRbU1MNk0rZUlnempD?=
 =?utf-8?B?Vkh1bmVkNk1mS1hOazlicyswV2NJMElRR1Z1MVFTQXFhZUcyWVYzbGdya09T?=
 =?utf-8?Q?JwKK2ytYoWRWzTGY=3D?=
X-Exchange-RoutingPolicyChecked: XehBxQe4CGrKMaWEzWPPuQOD4oYU+G3viklABGGG5lYF3YDWAq2cyNMBrNWGuhn/SxcbVyId/pQbbReE4OG2Eey++K+RzZI7Bnf6a4zEgqR1QVFvFne1Xb7WmzXddLdFbo5Aa007jaMqLKVgDqqw5g4Hd4/OICKdvNVciHt5fLEUub/lHCXTboQKLpaSlpfHzu/BI8sWzvfsa8QCRANOOegdhZ91n53fFphKknvl7Ny4TobnD1B8Am+9KmE72vnsqWvVbxuPazBVo5WJtOJ9pjk4wV/e+w+9qYmimIHm869b1gxsEpTYyr3j0yuKdIHSVkU5dB7hJe/qV/0O70sxfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a8dbc7be-6999-47a9-df17-08df47448ab0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 20:26:22.2965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djZv2EaeNPKa5Hpyez+VwDmLj24hKvaj6fNi6KOFm8iMNQI/X7E0ynHeX2Y5wYn7OLAI7FP0zKNpOEo0GErcNrocVdBsLi2dLsA0xxgzddo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4980
X-OriginatorOrg: intel.com

Hi Fenghua,

On 11/20/26 11:48 AM, Fenghua Yu wrote:
> 
> 
> On 11/19/26 21:04, Reinette Chatre wrote:
>> Hi Everybody,
>>
>> I believe that discussions around resctrl's upcoming support for multiple
>> controls are starting to settle. This RFC aims to capture all the remaining
>> items in implementation as well as documentation. Please point out to me if
>> there is anything I missed.
>>
>> RFC v3 of this PoC can be found at:
>> git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v3
>>
>> Please refer to the documentation patch for an overview of the planned interface
>> changes as well as user space contracts/expectations:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git/commit/?h=resctrl/controls_rfc_v3&id=95ff9ff7430095cb7264946c944c750315db73d9
>>
>> Remaining opens:
>> ---------------
>> - Ben: I do have a question about the formula used to determine the size of
>>    a scalar cache control. Please see patch changelog of:
>>    https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git/commit/?h=resctrl/controls_rfc_v3&id=8695aab0997d5aa60e104374fae9701f51156c18
>> - MPAM only compile tested.
> 
> Basic MPAM tests work fine.
> 
Thank you very much for testing this. Much appreciated.

This version implements the naming format that Ben pointed out to you in

	https://lore.kernel.org/all/10d97df6-ccfc-4025-9773-0ebe7421cbaf@arm.com/

that points to a discussion during RFC v1 of the PoC, which continued in RFC v2
and finally settled there as

	https://lore.kernel.org/all/bccb1249-e722-451a-9c75-8aa846713045@intel.com/

In this version, the driver is required to set a scope when creating a new control
and resctrl filesystem constructs the final name. The new naming should "just work"
for features built on top of this. Please let me know where it does not.

Reinette
