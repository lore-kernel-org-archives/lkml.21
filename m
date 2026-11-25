Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795634379;
	b=IpMK3Sws2nKNfyIg/SfjZ3u60XYlWhljNpCUhc7iCOhNy8lEFJrJjBT2vDlzWRC/c8B9
	 3fBQnS6LENmTf8ifk11a+L50U4s01dgiCZ+QNhbTU7Br0QIIwd5EaG6hMTiIdz75KdhyM
	 Y4o3Vlj0oMS4wPsBf+ToywqIloRxqNkrjFR/wd7D03oY1z+ev5Wub09l3g0CEfIaTHAep
	 2Vk2oeMadA93Uk2R7EU9ZghN9DNLUQWwx8u3U7aGyW5vd6TZDkn3NKEMCyLhwSkCGsGcY
	 cEzYyWbPuSPk8M1o60EIRqNYe1o0bidd3l8Hn4CqZgSCbUR+gZvhWrNilN7qmvTGw0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634379;
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
	bh=aMeBwp9k6EehdmNuu+2XoiU74ThJwW1CsgAFOhM3YYc=;
	b=dlO5LUE1Ce+u02lZ49fgCcokk54c6lwiT3kjQbqHpzOrhFjfhOtLRcB37nnIyJIwRMZF
	 VXpoJxLxmUVJVYtSqoQsw0/Pw5BWTPXBfQo6/NrBMQRDfkMa0I750hAsu5IBq0Xun3t62
	 2hPtMAQMDfTcPTnPuR6YQVE3nkVip3XbTux/mO8reH8S3328S4FJl6qJDwHIHiSP7+L1O
	 xsyyU3dFUWMNhbXHDsT9w+BpCSF53IZ75QMO7KUh7E9u+vPzjHk0JulwrMms8rfN+2rQF
	 hzXGJ5lgezMlJ4PQAzfWtDYNrTlV2xxwucN/Lt8S/NkpYb0dwY6LVJiHl2yRQwmljUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IbMVyWEm;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=cDiXEJM+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8B606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B8B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IbMVyWEm;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=cDiXEJM+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795634378; x=1827170378;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EaOJoZhtGozts/K/CBgy1ch+boYsyUL8zMdPAKDaipA=;
  b=IbMVyWEmj5o6nPN9Rc2LjgTbDG/hNxtt7GDjRitdYcQKQIC+dM07z2cU
   LIyVYr4DjXcC4Ul58NpxoFJbDxWtBcIxdy7IUgNEUv1sBi2xO+O0btF6L
   ZKPVg9OSiO0tIdrygP1rQUi+lDzVkj4GfmUuwQj0w0dS2g+oiwXH7EFwE
   Wh/ALQA8jKmEmiC7ZhgbDsikX5+p3ekli5OOdBmfFQgbsy5l7K4Ib3QQG
   zCmNxElMHw02Z0CoE/E/SqxkSwUsL8RL8Ves2KIllMK8lmLl3Haq0WRKr
   7cRLQ+0eBQCrIf6yTFEqns7Qr2mPET4jPRsz963u9ARthJxfdrBCo79Up
   Q==;
X-CSE-ConnectionGUID: 4mbmzCmpRleWjo0YKSGoow==
X-CSE-MsgGUID: jpSZmkOSRGeoyBP6X88RgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4431790"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4431790"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:04:44 -0800
X-CSE-ConnectionGUID: MbXANgJPS+2nCoxSJe3QZw==
X-CSE-MsgGUID: IrHTeL4lTHG4KMEN9fSbXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12411531"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:04:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:04:43 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 11:04:43 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 11:04:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSlX/jzkksuC8GtaCAhNUEX0lS5zP3hKHvb1S6jRR9rjnj2yrLF3X7wdp8QAQbn4hSp14UHcif4qAe67bDx9DKOGlQjbrWv1ESSW4J0v9M1A7olw4gIuNgJpHeTFnLJtGa0XlTdtH8tWF85qvCtvSDdgxlJ0kmPged05XFcDO9ZDGTmW0oYVSMAAZFmAWJmP8OgdFG5Dze1t28Yw2S5By9NY3iTXrT6K2ddC+uty/aCfVTHx+hgv38Uyhpr1IvZgY4pXsh1uNk7pL2yCXSJxSQAHAp4jyCy96kn8pWdPHqnEBKFXFCuPXrKpqZLGBKr5ZtZIO4YiqcY0XaPZZYjH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMeBwp9k6EehdmNuu+2XoiU74ThJwW1CsgAFOhM3YYc=;
 b=I+xIhZXIcRqj+mRZ7cLgIo4Iq4x6P85q4Y/3jVN1/LzWObsMcwMguT01wUFKynpOiIt2Idd9raOXcS4ES6L43O6iHQU5VBfF6KMKHoonilRkwggxMZlx6PDuWcbJw4eryDbzgd3eWII6qMSjarTqMzk95b8vgG1nFUXQbTDZgMVonQo3P53EwJajkNaDGIqDJ1bXscsOuTGriFSLCRASldwYPCr0LxWGwTlDQYpivBnhjkAEuGG1eXlci5wAyizIxv+ORDlHr7y5ecdZfODVQF6m6mziAaqqjn7s6v91Yfy2COqah6+t4wZDYri+dzHWPg4ScuqBWZMvNTezsWm6IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMeBwp9k6EehdmNuu+2XoiU74ThJwW1CsgAFOhM3YYc=;
 b=cDiXEJM+FKhyWOJIaXXNbNf8hwx9GYPKTsnwkA7MWcQFdfK3XFpYw1FXPxz7JUqGDGdGqQ227ePxVsb7cOFUx6jS3/dBzUxLV9ZGVodt8EgOs51e9tjGONns6IwiWHlRfim2ID6xYQ32lJtaEnowPIwqpivyubK0VjEe0xM/3iQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 19:04:40 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%7]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:04:40 +0000
Message-ID: <cf2fb9b6-ff03-4e03-9a7b-e9ff4ceae190@intel.com>
Date: Wed, 25 Nov 2026 11:04:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/12] x86/resctrl: Parse ACPI ERDT table and save
 CACD cpumask per RMD
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1793864720.git.yu.c.chen@intel.com>
 <f99fa409c6df92c54ce5a76f698154162b6a4e45.1793864720.git.yu.c.chen@intel.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <f99fa409c6df92c54ce5a76f698154162b6a4e45.1793864720.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:303:b4::25) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 09093f82-f580-43f1-d5c2-08df4b26f528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|5023799004|11063799006|261028144727099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|261026121527099003|261026140227099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 7TLw/iFBjWKb5exTSlafa/HHX7vSsXoN3RAKHytTTr3ixI1CXF3cPuo61vK06s2+PHsNtMlqObNRX2dwVJIAm6P4KHR3GL5pomvOk0wRb8CrwbnWx73rs6j5mrx1SbqQkpLqlcn75NDzzpujPHEE2JmjaF+wcxeHwobCq6Q1DBl+DI11jmYDScMRydtK5JbYAq+gnSHDQfcdHpFoeUzBhWYb+yl9HimaBcqd9KSbNWjngTmtkiGbXwRsw1wfaT7K8XzybjlAHyWmIf/NxJ1f7Wulqhyi4jAn1BObJQXaZV66soO3IeGGeHDtru706WqJITJbuoiaVdL6r8IVlwjgpU91NaPzZdOGDzO6OAN97LNSjVVz2REzCM70H3M9ZG5SYa8wAcpjxqXS3PDtqt/Yi1dtI/dRuQZ8MvCAAplUWocm2/x1C9JMgOUCzZ3Xm9rBsKND8JjMqI941CJkgZcJ4gPrx6r+l4OCEnX2CLe35ATLoOQqN7eU20mHcTH+PR7EN106MkfZ3LyLIjvWtH0znY0JxmbF1nkQ4Pi5o3R2/q3p9PXnsSJizm6oVkzKlblrFSfbsTXggr0kQM7q2PHKcJ9KbPoP0Uj3pvalLd+fdel9gzHW0G8oOi3Wj1c8SqXxFAfZU2e99TodATgu5z+2sZuS+WbIgGLlC5wW2YjqAGw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(5023799004)(11063799006)(261028144727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1N2VVYvWERwOW5LSDRBbWcrNXhUdlA0K1c0YVFDbXBEVnR4eTltVDg5eWN3?=
 =?utf-8?B?WEhkQXhJTzdVSll2aUtyblJ1TmZaV2poTmgwSWNLZ2hTY2VDK25VajZqdHR5?=
 =?utf-8?B?TnZscnUrWmxoS2Q3ZGZMcEkwdUlzTzdLMmNDRUxhYzg1eXA2Lzh5YzhjNFV1?=
 =?utf-8?B?OFlRVkt1ZVlQNHdodzRNY1pBYWRaN1g2dWNOMkU1d1E1Y2VHT3haN21JUXNE?=
 =?utf-8?B?WER4eFBJVXJ3NXJVV3MyQXozeWh4Z2JtRlEwdXIrQlhTM2pCL2NPMnB5WEw2?=
 =?utf-8?B?WkRrc3BCL28yU2ZHZUFyVFNXTnZZN1l3dkUyNmxrWGpsMlB2VHgzMGt4RjhW?=
 =?utf-8?B?Yys3NkxMd1JBbzc4YVEvdjQxSTByRVhlbmFQVndscGYyQ0pwb3hncTRZWU0x?=
 =?utf-8?B?NkZDQkU0NTcxekpveDcwRk9qR0FWa3FFRmM0L0N4RmJJVHVVV2FrR09XRzdM?=
 =?utf-8?B?NEpidkE3a2dXaTZxbG9ocUlmRGdHRXBSZDlCU0daZUFCQkVjSk9VbEF4RVZG?=
 =?utf-8?B?MHRObmdLeGlsOXpvbmhsK1p0VWdDcGhGWm5tQ0t1aTQ0TFZmakVkNklwaGIx?=
 =?utf-8?B?SXdPSmVPSjZXK29OeEI3Y2ptbitYR2NFVG5DMmJZeFc5TFVJdVZJVFZIelA2?=
 =?utf-8?B?c2I2WE1XeFk5VU9mcW9tZTdaRW5wQ3NpeXMyN2lkSk9qNUh6cHdHRHg0azV6?=
 =?utf-8?B?MmpuTStXOEtlZjRlakxtNDUyMklkL2N4dlRkZUJ4ZC9Ca0V3MWpkSnpNb2dZ?=
 =?utf-8?B?emtoU004VzBBbXQ3ckQvT1hSYTdkRFd2bWJlK2JmVU4wS2J3U2lSSmthaVRB?=
 =?utf-8?B?NDQxYjAxdkJHRFRUaXQyaENna0tRak1RdmhDd21tVWI4dTNXL0hva1FtWUhC?=
 =?utf-8?B?bGZNY1NHTU8zVFhtbDNSTjBTQkxsWldRRDJ4MWlCcWRDQ25TT043cTFzdno0?=
 =?utf-8?B?d2kzSFhlOUkwUHppRzBTY2xHenh1eUVTdUxMQVdBUU9VV04vYmF2WGdnWmZM?=
 =?utf-8?B?TFFPblhqNFhxd1MzcDVCeGRpOWs4VW9GV1ROOHdoWUZVWEJHOExZc2RCTVhE?=
 =?utf-8?B?OGJXQkd0QjBwTTJZdzZOMmZiZUlna2hUWnB0aHBtWjFKNmNDT25RZm4wNVYw?=
 =?utf-8?B?Q2ZkV25XL002N0tmdEg2czNWSVFVNm9BYU5xQjh5blczQzFST01XUXVCYlFm?=
 =?utf-8?B?MkhUV1hELzU4M2l3azVrZVVPT2NaeEhrS1l0UnJBbXUxdWZZeGpvMUUwZHll?=
 =?utf-8?B?SDdMdmR1N2h6UWVxNkxGZ01rT0M4dVNpSkh3MTQza3o3VnZpdEZhVEZWT05I?=
 =?utf-8?B?YWdsUWd5ZitBbU5LZTZpNElaa0VndFcyU2JaYllCdC9BdXF1d3hCY0VmSzh1?=
 =?utf-8?B?VTJSYXFWMkQ4ZjlzSXpvRGwzYVlQWTRQSkcyN1FQNy9lSE1uV2xUczdOaVZR?=
 =?utf-8?B?bmFCc3dnVHNGL0FFUnVHcE1lUUtVVWpVbktRbURqV2NYYXNlTks1NTZib1ZR?=
 =?utf-8?B?YWx4TWpUR0NTd1lOYk1jNTB1ZFFDR0JsY1E0cG1yemxYMXNIdUVzWWpQVGpG?=
 =?utf-8?B?SlM3UVJzZkhRdWRvWVRQSURCN1RtZmhQeFRiZjlwbGcrZFdjV0YvOVlPbkFl?=
 =?utf-8?B?UWEyZDhYSXMvRmdoNSthZnpVQU10Ym1ocVJVUlJSNElsYkQvT1FCZmozVkNY?=
 =?utf-8?B?L0lxOGVZSVdYU2tqSzNTc2gxREpqNEtCOXpIQW8vU2NMQVJmb1lja2txemxs?=
 =?utf-8?B?M3pLZUIyM2ZMTXhBWldySnRWQVQ4MDZ3d0dvQkNGNkNRRE1LTUNXelBVSjE5?=
 =?utf-8?B?dmliZXlSWjV6dmlpbDkxVzErWE1oZGdoRHhpa0UxVUxzTmpBYnRZeHhudEhK?=
 =?utf-8?B?eEEwc05Pa1dvZ05uT3B4cG9kaGlFMjZEWXVwbkRPMlA0bFNKNlJLc2RRcUdO?=
 =?utf-8?B?eENZWktwZHAvS1JFOERYemJKRGE5RmRZekZTUkxPSUhNaG0zWWl6ay9aQ3c5?=
 =?utf-8?B?Y0E1QUVCMlZBZ2tVWlk3RlhLOHBqZWhDaFo5M1NKdzlqN1QremY3VHRhZzZh?=
 =?utf-8?B?YTViMW5nNmU1ZklZZVlQa0w2Qm02QkkwTG1pNE5OYjhGdmNUN0w3MG0zeUpq?=
 =?utf-8?B?WXRjYmVpVE5hR1MzU0dIbGI3aS9pNGFvY2ZrSU44VTlZMkJEdTU2Rjk1QzdR?=
 =?utf-8?B?ZGdlZGpkNncrVXpjZGJPNVRFbFJDRGx1Z1lFM1k0azRKZ2pIcFExeUdTUm5a?=
 =?utf-8?B?b05wbHNDWlpDSUhUVWphWVVaVFF3Tk1FRGVGS1hGYnRVT2x3TkFzaDZObzBZ?=
 =?utf-8?B?anFpWWpJc255eGFEZEtxR1BnZ0JpNms4RDNIbEFMR0k4VnlRM0NNTk9kRGhu?=
 =?utf-8?Q?6G6p5taAI3VektP4=3D?=
X-Exchange-RoutingPolicyChecked: c+aABhCDQjrkIHwyAcJOlbpp7otimAioTpp4h7s57f4DeYm/si10jjyHBX4XFzSTeTCCwPtF3zC1V0fpcpk/r25E7zFTCITckK2/O0BCnp04bRHR2te0uDYz2sqIZIvijUJ0giJ0bVirUwGWAeMA1hbKZv+U80xTtNw7RuKLKHnnJldFijH/n9aMiaacGZUpdKnXasgu9vWeRqQx8dYQvoTM+8+7bZWEIqaONqlbeRBbENikzZ7oMvpVqJWMk4Pf+mOz6mhbij0NHuMVC3pVI68Q/dP3SwXTz6LhZencXJtPN479c2JynILoy96mMQw6pMB6Bplf42cpG/6E5ZqgFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 09093f82-f580-43f1-d5c2-08df4b26f528
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:04:40.5236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbYJMohO+39Qg+6s0IWdqeJbkwxcR3snjEwknf5rENSNUqlbtg7nsoWK/LG4zRFns5Z7DCmBp0Q3UY1IE/3QzC8mxo3KiBOjDDR49q4hXHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
X-OriginatorOrg: intel.com

Hi Chenyu,

On 11/5/26 2:08 AM, Chen Yu wrote:
...

> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index b5a86e5aa4e3..2b9a13be5975 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -1018,11 +1018,18 @@ static __init void check_quirks(void)
>  
>  static __init bool get_rdt_resources(void)
>  {
> +	bool ret;
> +
>  	snc_nodes_per_l3_cache = snc_get_config();
> +	erdt_init();
>  	rdt_alloc_capable = get_rdt_alloc_resources();
>  	rdt_mon_capable = get_rdt_mon_resources();
>  
> -	return (rdt_mon_capable || rdt_alloc_capable);
> +	ret = (rdt_mon_capable || rdt_alloc_capable);
> +	if (!ret)
> +		erdt_exit();
> +
> +	return ret;
>  }

Looking at the solution as a whole I do not think that this enumeration is
ideal. erdt_init() sets erdt_enabled irrespective of 
erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC) being true. Specifically, a user
may boot with "rdt=!cmt", which is the only ERDT enabled feature, and that
will result in erdt_enabled being true but that does not actually mean "ERDT
is in use".

I think there is a real problem because of this when looking at the CPU
online code that gates the domain binding and configuration on erdt_enabled.
If I understand correctly a CACD inconsistency drops the CPU out of _every_
L3 CAT, L2 CAT, MBA and MBM domain, even though no ERDT data is ever read. 

This looks to be a recurring problem and so far the solution has been to
add additional gates based on erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC) at various places,
but I wonder if this can be simplified by changing the contract.

Instead of erdt_enabled meaning:
/* True when the ERDT ACPI table describes at least one domain with at least one CPU. */
could it mean (something like)
/* ERDT is in use */ ?

What do you think of changing the enumeration to something like:
	get_rdt_mon_resources()
	{
		...
		if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
			erdt_init();
			if (!erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))
				erdt_exit();
			resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID,
						 erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC),
						 0, NULL);
			ret = true;
		}
		...
	}

Wouldn't this simplify the enumeration and subsequent domain management? For example,
with ERDT established by the time monitoring enumeration starts the values for RMID and scale
can be returned directly (since they have been reset, if needed, by erdt_exit()).

I understand this ties erdt_init() to CMT lifetime while ERDT clealy has bigger plans.
When the ERDT scope expands, so can its initialization.

...

> diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> new file mode 100644
> index 000000000000..2bb187255630
> --- /dev/null
> +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> @@ -0,0 +1,274 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Enhanced Resource Director Technology (ERDT)
> + *
> + * Copyright (C) 2026 Intel Corporation
> + *
> + */
> +
> +#define pr_fmt(fmt)     "resctrl: ERDT: " fmt

When you rebase on tip's x86/cache(*) you will find a recent cleanup from Babu that
made all the x86,fs/resctrl pr_fmt() alignment consistent. It is a simple change
to keep this consistent, could you please consider doing so:
	commit 712f55054986 ("x86,fs/resctrl: Use a consistent log prefix")

...
(*) Please note that this series does not currently apply cleanly
    on top of tip's x86/cache so a rebase is really needed.

> +static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
> +{
> +	struct acpi_erdt_rmdd *rmdd = (struct acpi_erdt_rmdd *)rmdd_hdr;
> +	struct erdt_domain_info *domain_info;
> +	struct acpi_subtbl_hdr_16 *subtbl;
> +	u32 subtbl_mask = 0;
> +	bool ret = false;
> +
> +	if (rmdd->header.length < sizeof(*rmdd)) {
> +		pr_warn(FW_BUG "Invalid RMDD length %u bytes\n", rmdd->header.length);
> +		return false;
> +	}
> +
> +	/* Quietly ignore non-CPU-based L3 domains */
> +	if (!(rmdd->flags & RMDD_FLAG_CPU_L3_DOMAIN))
> +		return true;
> +
> +	domain_info = kzalloc_obj(*domain_info, GFP_KERNEL);
> +	if (!domain_info)
> +		return false;
> +
> +	domain_info->dom_id = ERDT_DOMAIN_ID_UNSET;
> +
> +	for (subtbl = (void *)rmdd + sizeof(*rmdd);
> +	     subtbl_valid((void *)rmdd + rmdd->header.length, subtbl);
> +	     subtbl = next_subtbl(subtbl)) {
> +		switch (subtbl->type) {
> +		/* An RMDD table has one or more CACD sub-table(s) */
> +		case ACPI_ERDT_TYPE_CACD:
> +			if (!cacd_init(subtbl, domain_info))
> +				goto cleanup;
> +
> +			subtbl_mask |= BIT(ACPI_ERDT_TYPE_CACD);
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	/* A CPU-based L3 RMDD must have at least one CACD sub-table */
> +	if (!(subtbl_mask & BIT(ACPI_ERDT_TYPE_CACD))) {
> +		pr_warn(FW_BUG "RMDD %u has no CACD sub-table\n", rmdd->domain_id);
> +		goto cleanup;
> +	}
> +
> +	/* Quietly skip an RMDD without any CPU, e.g. all excluded by nr_cpus= */
> +	if (cpumask_empty(&domain_info->cpu_mask)) {
> +		ret = true;
> +		goto cleanup;
> +	}
> +
> +	domain_info->base[ERDT_MMIO_RMDD_CREG] =
> +		erdt_ioremap(rmdd->creg_base, rmdd->creg_size, "RMDD ctrl base");

I am not seeing any users of this mapping in this series. Did I miss it? Is this
mapping needed?

> +	if (!domain_info->base[ERDT_MMIO_RMDD_CREG])
> +		goto cleanup;
> +

...

> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 4436b976aedf..e081ebdbc5de 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -21,6 +21,33 @@
>  
>  #define RMID_VAL_UNAVAIL		BIT_ULL(62)
>  
> +/**
> + * enum erdt_mmio_type - Index into erdt_domain_info::base[] for each MMIO region
> + * @ERDT_MMIO_RMDD_CREG: RMDD control register base address
> + * @ERDT_MMIO_LAST: Last MMIO region type
> + */
> +enum erdt_mmio_type {
> +	ERDT_MMIO_RMDD_CREG,
> +	ERDT_MMIO_LAST = ERDT_MMIO_RMDD_CREG
> +};
> +
> +#define ERDT_MMIO_NUM_TYPES	(ERDT_MMIO_LAST + 1)
> +
> +/**
> + * struct erdt_domain_info - L3 domain ERDT information
> + * @base:	Array of ioremapped MMIO region base addresses, indexed by ERDT_MMIO_*
> + * @cpu_mask:	CPUs belonging to this resource management domain
> + * @dom_id:	L3 cache ID shared by all CPUs in this domain
> + *		(ERDT_DOMAIN_ID_UNSET if unset)
> + * @entry:	Links into the global domain_info_list
> + */
> +struct erdt_domain_info {
> +	void __iomem		*base[ERDT_MMIO_NUM_TYPES];
> +	struct cpumask		cpu_mask;
> +	int			dom_id;
> +	struct list_head	entry;
> +};
> +
>  /*
>   * With the above fields in use 62 bits remain in MSR_IA32_QM_CTR for
>   * data to be returned. The counter width is discovered from the hardware
> @@ -256,4 +283,7 @@ static inline void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resour
>  static inline bool intel_handle_aet_option(bool force_off, char *tok) { return false; }
>  #endif
>  
> +void erdt_init(void);

Missing the __init storage class attribute?

> +void erdt_exit(void);
> +
>  #endif /* _ASM_X86_RESCTRL_INTERNAL_H */


Reinette
