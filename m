Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795561066;
	b=Bj1vX6BGwZMt/cLYLOPr5PWEqHPyfwXScS+8zVAjlHdMeBt718XAnM8oE3oL2F/RPA3R
	 fKSFR9Lm05dQMLLjmod8ZIc88mHwr4oljW2F3KNkmMkTA3H+5+4WIh8KaqQvJgS+MSsU9
	 Fpy6aQmkDpsE54CFZnzAjygq2reHor4Eh10zZr61N4PFHrKsegwwAoo7fwvwNT32G4wJ/
	 6vhPkaqmK3bH8NgO2Jd06M/jsUapZOoz7/gAo4mVs784NV6qDuqdkc43JaSJhN2IcZfd9
	 HBdfSrByYy0RP9AddXz2mSxGGpJm44QNpsVcFs4AGFNb28MdiQWgTFufQTwWOKTZg1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561066;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=wSIxE5qzlJlcSe/2MxNiBDKZf0L2x1IocJaRxr4suig=;
	b=cB4UbkEsVLt2Y5979AL07pEMGY//UukWsQ6Jc5lb8uOiwmUTbbM/Ark42gXFSKXqwBAx
	 F/cOCKJchTuAjADx6b9Q4TdZ8GfdELdNaoXqzKnVpzBYgynCoXpweY4rZagPEpDk3iz7F
	 84Y3SzOJ0tHR5WZZq3Hn94CoS9D2ZQe9di9WpeTLa//j7fmlJfQP+Y7f6nf/c+HbQ0M8k
	 s5SoIk7jioNp9J5aNF3LNyZAaNETHJ4YeinyKnS+7UyxWounNMP9rW+nNsOAGJOvYhsXy
	 DWfc3tWY4ZNJV/x1iS8PtM1cd/2JGS97PJpvbnPehh8kMM8rZpDskynWrskJS0re0+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cky8mbkI;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=GUaCejsN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A708606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A708606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cky8mbkI;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=GUaCejsN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795561066; x=1827097066;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wSIxE5qzlJlcSe/2MxNiBDKZf0L2x1IocJaRxr4suig=;
  b=cky8mbkITdaquAaEaggje07CP6hSnX8EEXY1R16AzzEkv3xP4puHxFLv
   qDrqhmWe0Lla8MNgcJCnWlZLDjMBTAkdKWpCPSOCutnIIGd0bCC2ZuycD
   c103giWIs0KgCa364zMBKFECDclINVV270v7h/hlRr7d/kJ95ZusBqK47
   swcU8ej9RaR6iGGWpmRc/0jRYPsyyRj12KvylbMcCBKcgtdjaDSv06Suk
   zDdRfTHpDnlU/h0vIBRKk8CHCdZWFzwPPK9Y/EKPaAHqbJ9zdQqUeddiD
   w2r+9l4rP9wgH39l84WvRFtUhNtE/DaX3b1OeYtGaa1xjP3v5n8lNmX2s
   Q==;
X-CSE-ConnectionGUID: npCFOaJSQeu/GLD5X6e06Q==
X-CSE-MsgGUID: VMHB9jLmSNaI7mvAPL92ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4313354"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4313354"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 14:57:46 -0800
X-CSE-ConnectionGUID: p5kJbZlWRVGqlv7rE2d53g==
X-CSE-MsgGUID: tlI5qvXZROmQewsDfOI6Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="13722643"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 14:57:45 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 14:57:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 14:57:45 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 14:57:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oh16WsbdEm+2Yoj0Dv9aXMXjzilPpySg4cCOAnVs1dqcWurEQcQFDu6ARD2+hTLim8tusdPfn/mRTnABgpZI0WNxKfnLJc8kFkun+TfPMeGknVj5mTEkmU3P1hEWTJEGFBuVyMoK5JtciF/o/ZsbWYB6rKfAPFw3+PDNJWc1sQXXur5o9gPaHlDzk5McGmbTMvIN0wKDEWN++aguaKthu0COUKXdB8zxtdhw45LPDoLZJVvB6E5hupHVtLYbOgFHUlN9LwW0vnHDwgIoApjjoLVNjbRC3Jl4gH3M3nq6YvFtABo1WOeZ0qHvVgOGPkBmzY0HHxBMEafNVstWytegsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSIxE5qzlJlcSe/2MxNiBDKZf0L2x1IocJaRxr4suig=;
 b=IWI7gvg/JJKvFhVFqD6b0f6vIlYahSWhCXlGFOG1oQDnh+wmQxm064CwTpkQAQ9jZjBDxpPy/4DvJdWwWLda3p5AV0f6CBZIDe5fZdMsHPh3QPaekBocKdbKT3hAKFsHAiGbc3GgvNNFemck1Z6nakn062pxFmFYRdYKiIgJ36gNhrPrbvnehp9UdJE4uvsPtIYRtJKjddEPVd0OGbUJYeD17z1nCQaNHLhgLAGZEeUF+eynes7Tp6Kv5dObfgbErAdml3U5xFIYdrRZTP/DezsPUK2tKISk4QSt6cgi4+SIW6AwVSb3bDnI5Hr+fW8dK4aEjYSCgcfnBXHpssIDkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSIxE5qzlJlcSe/2MxNiBDKZf0L2x1IocJaRxr4suig=;
 b=GUaCejsNqkzsXewmQ8eNraQj55mny2EH8YHLIApvNnKzrNTlC8oUGZwCBypza5K9n3nnz46uye/zXoUVxK7WpM9rHiwLoemVgQu4yTBOmTiPKFimm0jQZUx0+uMAcdXxF4MTcGbDx3dQj59hc6qpbmnXz/shv3w/U0LUeHep5SA=
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by SN7PR11MB7491.namprd11.prod.outlook.com
 (2603:10b6:806:349::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 22:57:41 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 22:57:39 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "luto@kernel.org" <luto@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "bp@alien8.de" <bp@alien8.de>,
	"mingo@redhat.com" <mingo@redhat.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>
CC: "hpa@zytor.com" <hpa@zytor.com>, "thomas.lendacky@amd.com"
	<thomas.lendacky@amd.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/9] x86/mm/pat: don't BUG() on inconsistent page count
Thread-Topic: [PATCH 4/9] x86/mm/pat: don't BUG() on inconsistent page count
Thread-Index: AQHdcsNQlpkZ5Gn0bUayj0GZ9McAD7c96OAA
Date: Tue, 24 Nov 2026 22:57:39 +0000
Message-ID: <4edee4db91a92b3231644688afbc950bb880ff8c.camel@intel.com>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
	 <20261112-fixes-x86-v1-4-791adb8d6670@kernel.org>
In-Reply-To: <20261112-fixes-x86-v1-4-791adb8d6670@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|SN7PR11MB7491:EE_
x-ms-office365-filtering-correlation-id: 0292f1c3-0a02-4705-d7a5-08df4a7e56e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|22082099003|18002099003|4143699003|261009223027099003|11063799006|56012099006|261102123227099003|10067099003|261022105027099003|261026140227099003|261026121527099003|261021121427099003|261021123027099003|261028144727099003|38070700021;
x-microsoft-antispam-message-info: Ry+4j6UxyMdkkYO4nBFia6m4kmw+zHXklhADT4CfWJdP1J1n5g9pJil+Um/KQRYPn5P5HUQsxiIUOtFnoAwftuf7Q2JcIo39dEBb4zTDQ2QYKZ/NBtkqyf9CtN2uLV7KYjx9aHqcAOncEIYR6yJiPrhpI3cVg18Xq3ES70BpEW/3dWDVqniE162Yrh6ZL76D5QowVr7jPecoysDprq54P7/aeWkMO3wOK0L7LnsVMFz/qSNdLzdMwW0KIb+w+jhN6upomR1AkIX1SwLweRqgi4V9xnR6zWJBjtqc7D/kgRk1lzyx+NQcV1c3bxZEcUHKDminG//u8AOY8fGNv5iYAZkihdFURtKDrIqRlBrkyNq3ZCOi4c2uL3IZyhsqEubNFURZRXIQXAleHGMqWFgc+XygXfEP8BM1eggd5SA6DCWFG5mm691B3U2CVZTZ7bntDMlTIShcHpmrQH28fLXf70Gx3eXWf1VOiaa/Swnw5XAot1b7yM2385qzC4fggK1a7Qe9DqdqqO6yEUhRGonFRBeFi0RJ1qmYlFwiwHVc0EuJVh5hsuQEwUwxT9/amUWNQRmxwCSIjaZQ8LIG4gn8HL+ZtA4ir0PRnk1DULlNU5YboS46+RDPBhni+b3o6O+fzSwng+66ubovz41i7GW+xhbMNCsG9RyZLq7wFHKIdHFKeBG8b2Pkk0fRZ/+2Y9mLMl/NeVmJDpdWbl9AyNrBwXUCi95yZWCTrGFWbTWthqo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(22082099003)(18002099003)(4143699003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(10067099003)(261022105027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261028144727099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFppZzZkeVhCQmhkcGVmTVQ3QURNVy9vSmRpZkNjK1phSzdwSHZSOUJMY01m?=
 =?utf-8?B?T09OY1gzM3FGN1R5U3F4akFheHExVFV2aGRLY2hIOXFjTEM3dUJnUHdlRGho?=
 =?utf-8?B?VkNhZ1NoSS81WTJmc2dhNGpmMGpBYTFXREZKL250bnJ5aW1tMWhIbjQ4Zndu?=
 =?utf-8?B?TmRLUURoRWRZc1luMzh1aEdKUkQvNWV5dUJoaE13V2NFZmN6QXdaK2ErRUEx?=
 =?utf-8?B?RXoxaWxkd2FycEMvUSs2U00zVE1pc3JuR1ZVd1RtRjRFQXdKRVNoMWpwTXJT?=
 =?utf-8?B?UXBLZXczREFMMnV4amIyUGZNODlwdGdOZnFNRHd4WDVYMW9nMlpEN0xrcmlV?=
 =?utf-8?B?THExTkg2WVBHK0c0cnBTeE0vZEt2ZTdQZU5sbVRHY2lnOFJMeUpPNko1MmVv?=
 =?utf-8?B?eU5uOTBISDRMTU43Mk5ISzRsL292REVneE9IN0dhR1BNV0pRR3poWmk0Mkpr?=
 =?utf-8?B?MCtLQzdlc1dHYVV3b0t6M05vckhsMDJZZ21LdzBFYnQrZENYZ2p0bGxqbWVS?=
 =?utf-8?B?Uzk0TndweCs1OHpPd1loTDdIaTZLVHB5ZStsdy9BSzIzL1Y0ck4xbHBqVXM3?=
 =?utf-8?B?YkZBV0tGVW5aeEZVbFNsdkFleHpHdTNqRmNpVHRiSXUyVlFVdUROUkp1UEpB?=
 =?utf-8?B?Q0h5dHN1WnJyMlFUY1BuM0ZJNHJIZUNXUCtYUjlsWEEyR09OWnVYMnNTV3pB?=
 =?utf-8?B?MDZCcGFyd0xWV0Y3aGpsUXB5WGppVzhQYXZ4Y2ZJMWFUUEdRbjJJZ0FtWU9p?=
 =?utf-8?B?bjRxSHg5YU9TK0ErTFpod0QvMlBtQkFXTk1ieDJBSGY2b3Rkc3puZ0l3VTJo?=
 =?utf-8?B?ZXRwVC9GUUliekxwK1RSNXh2THRmeUhnQm02emc2STdYU0tvWlJYTXBod1Av?=
 =?utf-8?B?WFMxUm5QN2JFRXNTS1BvUUs4L0d6UklUd3NvSiswNUVsZEtCTnJNNUMrdWk4?=
 =?utf-8?B?QXFaSjdCWjNUem9ueWdJYUhNNG1sRTdGV2VZZ1BNWU16aW9VbDlIc0kxcVM0?=
 =?utf-8?B?cUJqeWtCY2JFUlVzS0RXaFBIMTRpc2FZdGhEMjdnSnRsVmsycGN1c1VoSE5B?=
 =?utf-8?B?a3NCaG56SE5UNStwOStGVEY2anNzR2NJNnVNeG5FTGcvT1IyeTVLOW9TbkEx?=
 =?utf-8?B?bkFXOUJjcG1LN1Jpazd5eDQ2cnpRY1pPRU4zcm5NSDh3NDlVbThYTFNMSExq?=
 =?utf-8?B?aklVVlU3QmJaa2lTQUpHYWZHQ09KMUpjMlJicmJZcWNpZDZlR2diVTBSK3NM?=
 =?utf-8?B?MTRjL0pDaWJSYnJhVWg1Vkdza3dQK2c0c1FHekhmYTVTSkFMbVhsQkU3OU4x?=
 =?utf-8?B?bHQxckhnUHBnY09uOGZMUUREdzZXWjVLMG5XUkwyc3NoVkgzeStHRFAwNTU1?=
 =?utf-8?B?UHVxRkNRSWc5UmRMT205NEhndEJJeVVmVU9sdzNVdHJ4M0JXbXFic1J6cjZw?=
 =?utf-8?B?WmlVU09nWHhpM2U0VnE0RW4xRm5HNHVQODBTZFN0Zk1IVFB3b0Myd0FpbnBE?=
 =?utf-8?B?dnpnc2ltb3V6Rmh0QWhlSXdlNVYxTzdQTGtuVTRGVFVobHVJeGRheHRkVG8y?=
 =?utf-8?B?OUFLWHUrcjh6STVPdU9mOVMzWTBKK1AxWXo2WENMY0xsa0tWYmFrTUxQaUR3?=
 =?utf-8?B?SWJFc0p4emd2STVmVTAvcHBScmZrclBVbTY4ckZ3OGVVSTVJNS9zQU5INTUv?=
 =?utf-8?B?b1J6Z0xQbjdvVHQ3blB6NDcyMDhYSWpvYWsyeFpSbUwzZ0ZCWU44RlJPN1d4?=
 =?utf-8?B?TXlYV28wWTljSTVIdkcrS0FlcE5CQXVPbmJnbXFZYjl5VDZXMUUvdkp2NXJC?=
 =?utf-8?B?d1p5OWo3eGxqR0oxRU10SFRqTjZZTXlhMEpXNXZ2eTZhWWMxZXdOellseGdl?=
 =?utf-8?B?NnNuWXRqa0ZyOElOeHpoQWY1L2h6ZGNHOWl0eHlYb0o3SmJHSGl0bnFtaUwr?=
 =?utf-8?B?bmFKYWhxbldYbjNJanRQUCtQcWExV29BSXgvYlVaWWpZOGl2MWt6L0VCVHow?=
 =?utf-8?B?L0FYQ2oraU9YQnZqTStnNnIwTVQ5SlZLc04wbUwvS0NqbktJc05RL0liLzEr?=
 =?utf-8?B?eHZObS9keERpMytOQzdTL0o5WlI0T3BoeFE4VDFNL1VNTFdMbEl1alAzaUJC?=
 =?utf-8?B?Tk1NNmZRN3JoT3ptcm4wMERWSVlIeUJZVi9OdEg3eEJRbGpEd2pJZnE2T2Y0?=
 =?utf-8?B?QVFSRVZEalFXc3RCa2VUbXEvMFZDUDFKVUJPMEx4bGRpZjRFT1BrVThzSjVM?=
 =?utf-8?B?Vm5CTWlHZjFnK044YzJDSkpxVm5ETlBmSDR5ank5Q2dKeVJCVUlhWDFnWTlB?=
 =?utf-8?B?eXYxcnJSSnIrcWtUWlphQjcxbk53dGJLOU1YYkYxTVlIWlVTbXNIcFo4WTB0?=
 =?utf-8?Q?q7j7aP1aCwE0w1WA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B394A3DF37ED9240876E4D9435B6C823@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: J6hqFzVZVTWyLPANAmxq5uwzXSGBC1EKjA0432uCtYOTYjXNd8YN4BiWs0Ik7+PJDrIhtxnR6IUqU75uehdWtJqweTTuaeXgBBZ8PQfQGrQnbz7a+jKiUHJ8L8W1tVniTjy0VWokFE8otBdDqezgiDQeKVv4J72QS3ltaWv4XssM8yGv2CeVP8LfLIAMW+jr9HDEjWzj0u67VCZhh2LHOpqHyfvus5+aUyXdf2cu644UNKkYfaJq5V1Bt5xiXDNtCpOFpJaSSpEiUbQqH31reaJi89QHWHW6LifagEaiYDNNb1EJfKtKTduus0abUK7ZVU1JAIus6yFYFfjhUftWGQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0292f1c3-0a02-4705-d7a5-08df4a7e56e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 22:57:39.3896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mdLgTiPe7qXkptBFOgSFrMSKYSsbbi0fKCWcpicbB0sCnLnWRfLrETaOc0aU3BUlnY7EcPGkUs1oaUoBqzfhcjdsKLxm7hWNXghElGBNauk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7491
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTExLTEyIGF0IDE4OjMxICswMjAwLCBNaWtlIFJhcG9wb3J0IChNaWNyb3Nv
ZnQpIHdyb3RlOg0KPiBJZiBhIHN0ZXAgb2YgX19jaGFuZ2VfcGFnZV9hdHRyX3NldF9jbHIoKSBj
b3ZlcnMgbW9yZSBwYWdlcyB0aGFuIHJlbWFpbg0KPiBpbiB0aGUgcmFuZ2UsIG9yIG5vIHBhZ2Vz
IGF0IGFsbCwgdGhhdCdzIGEgYnVnIGluIENQQSwgYnV0IGl0IGRvZXMgbm90DQo+IGp1c3RpZnkg
Y3Jhc2hpbmcgdGhlIGtlcm5lbC4NCg0KQWdyZWVkLCBidXQgZG9lcyBpdCBhbHNvIGp1c3RpZnkg
c3BlY2lhbCBoYW5kbGluZyB0byB0cnkgdG8gcmV0dXJuIGFuIGVycm9yIHRvDQp0aGUgY2FsbGVy
IGFib3V0IHRoZSBidWcgaW4gQ1BBPyBXaHkgbm90IGp1c3QgY2hhbmdlIHRoZSBCVUdfT04oKSB0
byBXQVJOPw0KDQo+IA0KPiBXYXJuIGFuZCBmYWlsIHRoZSByZXF1ZXN0IGluc3RlYWQuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IChNaWNyb3NvZnQpIDxycHB0QGtlcm5lbC5v
cmc+DQo+IC0tLQ0KPiDCoGFyY2gveDg2L21tL3BhdC9zZXRfbWVtb3J5LmMgfCA1ICsrKystDQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L21tL3BhdC9zZXRfbWVtb3J5LmMgYi9hcmNoL3g4Ni9tbS9w
YXQvc2V0X21lbW9yeS5jDQo+IGluZGV4IGFhNzA1MmQyNDdlNjAuLmExYmVhMTZhM2MzYmIgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gveDg2L21tL3BhdC9zZXRfbWVtb3J5LmMNCj4gKysrIGIvYXJjaC94
ODYvbW0vcGF0L3NldF9tZW1vcnkuYw0KPiBAQCAtMjEwMSw3ICsyMTAxLDEwIEBAIHN0YXRpYyBp
bnQgX19jaGFuZ2VfcGFnZV9hdHRyX3NldF9jbHIoc3RydWN0IGNwYV9kYXRhICpjcGEsIGludCBw
cmltYXJ5KQ0KPiDCoAkJICogQ1BBIG9wZXJhdGlvbi4gRWl0aGVyIGEgbGFyZ2UgcGFnZSBoYXMg
YmVlbg0KPiDCoAkJICogcHJlc2VydmVkIG9yIGEgc2luZ2xlIHBhZ2UgdXBkYXRlIGhhcHBlbmVk
Lg0KPiDCoAkJICovDQo+IC0JCUJVR19PTihjcGEtPm51bXBhZ2VzID4gcmVtcGFnZXMgfHwgIWNw
YS0+bnVtcGFnZXMpOw0KPiArCQlpZiAoV0FSTl9PTl9PTkNFKGNwYS0+bnVtcGFnZXMgPiByZW1w
YWdlcyB8fCAhY3BhLT5udW1wYWdlcykpIHsNCj4gKwkJCXJldCA9IC1FSU5WQUw7DQo+ICsJCQln
b3RvIG91dDsNCj4gKwkJfQ0KPiDCoAkJcmVtcGFnZXMgLT0gY3BhLT5udW1wYWdlczsNCj4gwqAJ
CWNwYS0+Y3VycGFnZSArPSBjcGEtPm51bXBhZ2VzOw0KPiDCoAl9DQo+IA0KPiAtLQ0KDQo=
