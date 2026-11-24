Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795560577;
	b=myR4y2BF/5wwqf3XF4dSnWoIxTWPJ+ZaG7j1kzzcdSVzSoSWfwmpzoMeE0eDuamNHNkL
	 TV8QixpzSFILoByDbZLYvtO/2SqaTf9Fx/SPyH/7VACY3Lyb5/AninySxirGQ4FbzYI4M
	 vr4JXjk4SWMh0Kbi9nNyBo8Psq3m/osrpAgaratNOtAVWns9LeFHhrihj3cZ2D5Cq6E4e
	 6+Ho9KYy9L7DycIRA9ToOJsjZxec5cat27ick6dSoJKhlWspUSRogxCueOG4lN9xizbY6
	 r8LD4It+iprXDgP2Yc8wdcliVynuuYIDVurT2wsWY7k77yxtnJnf6PHh6ezq1VToagg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560577;
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
	bh=KRHc52U+14ZmZUbkM2mbEzbqg+mKkUyit4eHRrY237A=;
	b=Dpuj2uFgLj3/ei+XopIyh8DoeBXNmvPND/NEkLPMmgS1DSRfOLZJ0tcrWv0JIc6thnj2
	 WfzQKUclhJJZ7IR5eytTnNCDuqO9SHBervtcFJN7ktLsarVkfa8ff9EP8hPpfIUs5b05r
	 Ah1xZkzAgkgrnJnLln1VDCBhCD1SZo9GdvY7Oq8Pcsh9bxo8HD/w24HkUAj6VJKQKqxj4
	 oTw1nhUMGU7SgeGtdNOY7P6jbvFkWE4AV+Yb2zNFtFO603f0xKRmOt8KxF6mYvzaPyRIA
	 OB40VDk7YDZOYnFSwVKq6PldDvPTo00IcOtM4oO9dmdeF9wiVfVeFEBszeZohZKpHTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RBQL26cT;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=MzHjmNF3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AE2606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7AE2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RBQL26cT;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=MzHjmNF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795560576; x=1827096576;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KRHc52U+14ZmZUbkM2mbEzbqg+mKkUyit4eHRrY237A=;
  b=RBQL26cT7NOLK/sfXi2VGUr4Aofvw3ViqOvGN+1BfPe3xu8AEFfC379s
   mOjcpzqV9F5HFd3lXBA5F7NH9VI4/qZmPwPo/3ixXuCUMTu9FWLfK9RQ5
   Mu8jJzYJSdAJL/m6ykOsKojQW7RIuI1WqjDlvzi6zOmPXQP/XHi2Z+hvp
   agnr8ibASxkqrSftXYKeDfahUaQ8iIqYwsl1Iy2w7mjKZds1Bn8D8Raql
   qlLzvcXWXep2Hbfa9GM0a8Dn7gw7n5xWGWpFrCqYC3z9x3eUPLn8P1zBM
   2U6r44WP5GBTNtHTFjbZWBnz9qNXZlHmQk+cuRCZBJjyC8HbHFJxOKXtS
   A==;
X-CSE-ConnectionGUID: Sbb2gPqiRE2qsDjj8tm60Q==
X-CSE-MsgGUID: JGTbAOoTSJCSPsTf1xvX7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4324690"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4324690"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 14:49:36 -0800
X-CSE-ConnectionGUID: q4ZtXooJTcuONit0YRSg/Q==
X-CSE-MsgGUID: OGB78279RpatoG7W415S3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11742799"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 14:49:35 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 14:49:34 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 14:49:34 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 14:49:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlCu0B2Z5Bm7+F9CdENkKvQiNkj4NOsED/NhnzEfbQlVrb2fyP7f9YdXf/B+NxFG5Vd5tAXHz6aj8AFU6hzo8ZOffT1t49XcF/VJLUSkaTj8o/oWT//6RT4zL49G7VIAaUfEW+NAZt/Y2UcH3rXUZ1UgdtK8iRVw6Oq/u3ojfX6IfX0oXXJTnIC4LrsBOxyutbAIk5pfmg8u3B3xbgShYBvZDXHK5rni2QYhfH+eJRAAr6WtrEI5oLifCmH/l1x//RJVQtpEpa0K4wvzRT1M7BSQ1dqKX3PbtYybioc/P6eTXKSxn0kCg1D6chj/Iu2RNQgXVQbtXPGyTMxunV3zVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRHc52U+14ZmZUbkM2mbEzbqg+mKkUyit4eHRrY237A=;
 b=ann6HEpOJ/w83khRhrraxHhO1LFWVWRN80GS05j3HN9qtPGGRJiSkabKfpYdW/iUjyD3a9d3o11tf407I+qjaJnsR2KwVlsb/yoC0IIaLFZ3hkW9LWwccsuiM8+MgjN+8VgoqBqSHhSqBcdHdRSdiZNQ7sDXDX3ykp2FoSbsqVUtnKCYGDr6KfF8efWB9pa/959Zz/6xlKl3RaU0QKBSin4X6Bd1AaNDXkypwaeuxyWELu41iichXxzUDb3St0RWN6BHPQyGobWKagorjRrOxo6TLHWvzvV1v718E0XSCUS4gom474o80bc8cr/YjHDBjGsLMLqLQDPTFRM5k6dTFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRHc52U+14ZmZUbkM2mbEzbqg+mKkUyit4eHRrY237A=;
 b=MzHjmNF3vAWzAsKwdAOxG0rGgyBx6iO2b1qt93+2y3Pq+KnRlmY0jjVGCFqTAQbevvWAvfLvv88zs+WjwwW85fkzVtIt0ZOkB8h5WEQt8fq8bMzrg2rfN0z+vetGyqLN5wIcmZuiHg4+Ty2f2naOAJQb4I4FARgbeql1QAlTu5M=
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by SN7PR11MB7114.namprd11.prod.outlook.com
 (2603:10b6:806:299::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 22:49:29 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 22:49:29 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "luto@kernel.org" <luto@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "bp@alien8.de" <bp@alien8.de>,
	"mingo@redhat.com" <mingo@redhat.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>
CC: "hpa@zytor.com" <hpa@zytor.com>, "thomas.lendacky@amd.com"
	<thomas.lendacky@amd.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/9] x86/mm/pat: flush the TLB when only an alias mapping
 changed
Thread-Topic: [PATCH 1/9] x86/mm/pat: flush the TLB when only an alias mapping
 changed
Thread-Index: AQHdcsNTwQm1C6E9DEuvLmaIGq2Pnbc95pgA
Date: Tue, 24 Nov 2026 22:49:28 +0000
Message-ID: <b7bd4a18c420fe65728f4d50b69e2be0d1d39aaa.camel@intel.com>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
	 <20261112-fixes-x86-v1-1-791adb8d6670@kernel.org>
In-Reply-To: <20261112-fixes-x86-v1-1-791adb8d6670@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|SN7PR11MB7114:EE_
x-ms-office365-filtering-correlation-id: 3122121f-96ea-49e7-c1b3-08df4a7d3296
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|261026121527099003|261022075727099003|10067099003|261021121427099003|261102123227099003|18002099003|22082099003|11063799006|56012099006|5023799004|4143699003|38070700021;
x-microsoft-antispam-message-info: NC6y3t+BRmqx6HHJ/8fVKUmnYIozoGlKC2ZK8h9MtKW6WOKzzbsu0MQtS//KGSh8/oGNDV/MwMQxt/SqIgp9xo9SIyHWrUdUwn++PvcVsWuWUatHwBXEvLFw3AWMDEeZATV04ROVA0BmpVoLvt2eZSRxFq/uMTZbfPsyRbCbmZBNCxLCt2XeoFDSpzH4fJykg43BOBwQwU5deRE3+EsPHqkRIfUdtPfeRsSeVRvcd6WpkishUcVatUYCbsSS8SmtmiO5rVO8O/3bYZ+TnNNlXn8+VHg7HPzWVLzb8VvV0VVQRUX7JYq/rWbwDldJlh2/0qSBDgJRFP3oVNqRX+gkhCxgglasFUtLdKAPxglHufvqVlyrttivqbaH9+zrIhBYqcN6qzqRJQ5+Vn0brcCYOYytWQU21GYQw51lVc2feJm2l7GIo+8BU8z0HZf1UjbZZ541mLwQKezgpJHqi1NXC1j6V2cO0/STplMm1hlzmubP/gJIwJ4RHae9I1NqmevsEUY31u8QqAULv3VJAFwbPrMrfYNvppyqURPRVf8oIEfuDDn+SJafuGOPD3JeLITHFC9ofJ1BCoOUgWRnXY/wDM54z8ANPfvM/Ij50QF4PwFhCiPTtJzzSTZTNKifzvTVTPxAwTOWpo7VSKR8ctIt/j4bBwiCOiwwmvR9wd2awENzjEkeA7SS/5Ejv1y0Qb9j9tnLG+ZO54+5UkkNDNzcnVs7Siw1ogWKBzJ+XFS4mos=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(261026121527099003)(261022075727099003)(10067099003)(261021121427099003)(261102123227099003)(18002099003)(22082099003)(11063799006)(56012099006)(5023799004)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGdvVmh1TFpKT1M0M0RPRWhVKzRJY1RuYzFZMmU2cGV2eUhBb3RySmhaZytG?=
 =?utf-8?B?aGRSaHhpeFRBbzBNa2hzSUVXN1NRUFlUbC9QeVVSbmdiOE0rSHJsOHFIem5a?=
 =?utf-8?B?RjkyZ2RvcUswQm9iY1NodXppcmk2UkRqdldYRmVWYjh4aldZNjlUb1h6Q0hW?=
 =?utf-8?B?emZoMkxUeklYaGZHV1psOFZnYnJNZFNMOWE3TSs2ZEdKdC80eDRBa1dkc3gv?=
 =?utf-8?B?a2t2MlE3NWNqbCtNaE1XZTNlcGdBRFdQRjEzaDViK0g0M2pKblNhY0RGd2p5?=
 =?utf-8?B?MHNPUlhTMmplSHc3RWFzV1piQTdCWVowRi82QWk2dmVlQjYxQ0E3U1BLOHdv?=
 =?utf-8?B?bjhTbEZNZG1VMFJXb1ZGU2Zsdk0rby9oZVEyQzZDTSs2MGErNWVITU1RTmNW?=
 =?utf-8?B?akFSQTZFT2hZVzZnV1lSc1p3bUVKSnJOWEdTUVFIMG5kQnV5OE12c0dXejgx?=
 =?utf-8?B?N0xBMHNYVXlIN00vbUtkR2F6cjROV0pPQTdLN2dSU3NFNlZlRitTalZvQUwv?=
 =?utf-8?B?bUcyM2pUeExiLytDUG94dFNZOTZvRFArMlpCdVBqS1Q0Z09LL2hPTElkWmxD?=
 =?utf-8?B?Q3duVENHM200NUlvRXk1bk4reUQxMHNOZ2V3OE9TVldqd3o2R1B5RHc0c082?=
 =?utf-8?B?cEVvZlVSeEpwRE1SUjhoSENqOWNuTXVSMEIyMmVmVXpNRmlYUlNZT2ZxVGxu?=
 =?utf-8?B?UFp5MVF4amZ2d2kxZ000cXIyM2NIV0NaM01nOTdzVWREeW5yenlLaG5iOGx5?=
 =?utf-8?B?SHRTSXdMU1I5Q1JMTkhCMnR5UFRWbDNZUXpqeG9LanRaRms4aWxEM2xHRjVm?=
 =?utf-8?B?WkZzMk9nZWYyVkZENGptYzZscmVtai9tVk1MT1RqRy9jN0gvSFgxUFlMcjR1?=
 =?utf-8?B?QzNIWEJ4bFlWcFJSUFZ4a0FjdFRuUTBWYW9CZWpGRU5EZGZnSExxenYvMkVm?=
 =?utf-8?B?MEhKL0tacU5xbUpGckhiL3dsZThvRnphVklsRzhUVjgrV096MW9QejM3M20y?=
 =?utf-8?B?UWZIYjNJV3EyTThzakQvOWVOS2ZlUG42a1dEU0R4NlV6VU4wUWVOTWdVOGpp?=
 =?utf-8?B?a1NuMENpOFdXQzQrTlZhY0NlT1d6S1MzTlBhcFRlV2J1K0FJSWgycHBSR0NL?=
 =?utf-8?B?eU5NVUZBUUVXOXhadkt0bFFBeGpGM0JTQldSb09BY09NWkdIZnArOUpHODdq?=
 =?utf-8?B?K2Y0bUxmaW5tazJCWjVucERvMmhrM0FnWU13WWNSWVplem1UaDFHNjdkZUdM?=
 =?utf-8?B?engxZHY0ZXF4bDIyUHNabUlHNFVjcmxGWTZBYUpJWW5WUWV1bXM5V1pZbllZ?=
 =?utf-8?B?WGtKN3dKVEJsb20raXhpMStvNEhKNkZzSnJGbW9XRURSS0RSMXNKaXpDOUVr?=
 =?utf-8?B?RGU1SW5BeVZ0dFdvQWxVM1BZdmw5S1dFc0Y1dHhKZ2sxemxOL00xTHhUVDhJ?=
 =?utf-8?B?UnNrNkwzNFBlaDlrdFFXNWdOTFJabFZROW5od0lZSnlOaTREeG91R29uekI4?=
 =?utf-8?B?T1NrNVhzemYrajEwL0JtZEdrK1JIWmhPSGswUm55VVh5K0hWaVg4YVZoNm0x?=
 =?utf-8?B?RVZ4RGcwL09yYzEzT3ZBMVBXUDRFc3gzTGdZaWtQRnNTQ01JMXlJakxtYldX?=
 =?utf-8?B?UWZhRkg0K0c2OHJGNkJzMDdnd0g0Y1daRGhXYzBUSDBhMVljSEtUejM2Q0FL?=
 =?utf-8?B?bnllMFArMkIvY1Bnem1nckRYakZlMWtIYTNMQVEvbzZ3cEhtWGJWdTQ1RHd4?=
 =?utf-8?B?MzVBS0IrOVo3cWdhMWgrK25EZUFCeHBBV0kvYSt3WGZDdkVzNTY5MWJPdGZy?=
 =?utf-8?B?elFac3l6dndZNzZIbE1sbEpISFdIZkt2YmhnbmY4cWJHeTU4VlkyMnZ0d0Y1?=
 =?utf-8?B?cHNsckpMaHIvVElxSW1GbW81MnFxTVlLelpwRDFZNGhmVHVBSFlXZ3lDaXNR?=
 =?utf-8?B?ZmJlc3ltallyYmFXYWZWM1RmbXBoajhiQ0dSQzliMjJGTnNVQTJTazI4SnZH?=
 =?utf-8?B?V3d2disxamordU54a0Ewd1hreW1qRlJnb2Y5ZUx4b29VU3EvR0xYMWhHMUFk?=
 =?utf-8?B?QlJ0YWpOM2xmZlJaaFlXb0lSK2RmL2djU0xSbi94eTJvUTlLWE1uUFBKSHow?=
 =?utf-8?B?T0VjQjRSanlCVGllVHFSREZRN0ZUK21JbVhVOFEwOUhTWUY5SURRWHc2MjIy?=
 =?utf-8?B?cVRLSzlLSFFoalBzUXRESHlqM2RNVk9WWENRb1JveTQxemdJa0piN2QvNzZr?=
 =?utf-8?B?ZmNUSVpzb3lYdmRYWWNKeFVqNnBtNlNoU05xcHVyWUFSMzh3Ny9iU3k5QVdM?=
 =?utf-8?B?NFBFQ2R6eDM3VUc1VE42cW8yblRibTJrb1IwUUo2cnM5dW8zWjRqVmFLVWhS?=
 =?utf-8?Q?iMI88Vt0/EIAAmXQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF8C32AE2FBB0E4BAB0C98A2D3A14E63@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: ARNVK34h5GGIxSPJoUd4TGfmlG6xriGax3uF6zC1eova3D89kthWTWMwm4N3AmEVkNLA9dnxTaNPPMhMzflgD+vS2lazxCoK51jsGA9nMy+AAQnPOCgFJgHiPY3hGHo9c/1ifLtAFHpzv8yeRQP/Gy+XGrSFrkTCHuwVtVJr2ox8Q1hapwON7svoN3kDamz9QAkOwcqDImV5l8kw5/YUDh+nOClVIITntocmc1bMEf0BemyIoBlZgwh084TGihKUDR8bPWQHYHN30Qx+VRZbr8vXYlPdTNpxPgsXRItXKAKPsR5JT6448MLzQIba3X0dmjrJE2VjRVs2bolLf6GhPA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3122121f-96ea-49e7-c1b3-08df4a7d3296
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 22:49:28.9702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vOcwe+l46/iLpRjNcGl+tn+0uHOgejlib/klUi04bqaBm/50MQ1b2BYziBfsITdiNfi0k0v43Agu/h7TrWAyNV7kkH7NUqQG6dWMBziPPOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTExLTEyIGF0IDE4OjMxICswMjAwLCBNaWtlIFJhcG9wb3J0IChNaWNyb3Nv
ZnQpIHdyb3RlOg0KPiBDUEEgZmx1c2hlcyB0aGUgVExCIG9ubHkgd2hlbiBDUEFfRkxVU0hUTEIg
aXMgc2V0LiBjcGFfcHJvY2Vzc19hbGlhcygpDQo+IHNldHMgdGhlIGZsYWcgb25seSBpbiBhbGlh
c19jcGEgYW5kIG5ldmVyIGluIHRoZSBvcmlnaW5hbCByZXF1ZXN0Lg0KPiANCj4gV2hlbiB0aGUg
cmVxdWVzdGVkIHJhbmdlIGFscmVhZHkgaGFzIHRoZSBuZXcgcHJvdGVjdGlvbiBhbmQgb25seSBp
dHMNCj4gYWxpYXMgY2hhbmdlcywgdGhlIGFsaWFzIGtlZXBzIHN0YWxlIFRMQiBlbnRyaWVzLiBG
b3IgZXhhbXBsZToNCj4gDQo+IAkvKiB0aGUgdm1hbGxvYyBtYXBwaW5nIGlzIGNyZWF0ZWQgcmVh
ZC1vbmx5ICovDQo+IAlwID0gdm1hcChwYWdlcywgbnIsIFZNX01BUCwgUEFHRV9LRVJORUxfUk8p
Ow0KPiANCj4gCS8qIG9ubHkgdGhlIGRpcmVjdCBtYXAgY2hhbmdlcyBhbmQgbm90aGluZyBpcyBm
bHVzaGVkICovDQo+IAlzZXRfbWVtb3J5X3JvKCh1bnNpZ25lZCBsb25nKXAsIG5yKTsNCj4gDQo+
IFNldHRpbmcgLT5mb3JjZV9mbHVzaF9hbGwgaW4gY3BhX3Byb2Nlc3NfYWxpYXMoKSBkb2VzIG5v
dCBoZWxwOiBpdCBvbmx5DQo+IGNob29zZXMgaG93IHRoZSBUTEIgaXMgZmx1c2hlZCwgYW5kIGNw
YV9mbHVzaCgpIGlzIHNraXBwZWQgZW50aXJlbHkNCj4gd2l0aG91dCBDUEFfRkxVU0hUTEIuDQo+
IA0KPiBXb3JzZSwgd2hlbiB0aGUgYWxpYXMgd2Fzbid0IGNoYW5nZWQgYXQgYWxsLCBmb3IgZXhh
bXBsZSB3aGVuIHRoZSBwcmltYXJ5DQo+IG1hcHBpbmcgY2hhbmdlcyBmcm9tIFJPWCB0byBSTyBv
ciB2aWNlIHZlcnNhLCAtPmZvcmNlX2ZsdXNoX2FsbCBpbg0KPiBjcGFfcHJvY2Vzc19hbGlhcygp
IGNhdXNlcyBhbiB1bm5lY2Vzc2FyeSBmbHVzaCBvZiBhbGwgVExCcy4NCj4gDQo+IFByb3BhZ2F0
ZSBDUEFfRkxVU0hUTEIgZnJvbSB0aGUgYWxpYXMgdXBkYXRlIHRvIHRoZSBvcmlnaW5hbCByZXF1
ZXN0LCBhbmQNCj4gZmx1c2ggdGhlIGVudGlyZSBUTEIgb25seSB3aGVuIGFuIGFsaWFzIGFjdHVh
bGx5IGNoYW5nZWQuDQo+IA0KPiBGaXhlczogYWI1MTMwMTg2ZDc0ICgieDg2L21tL2NwYTogRmx1
c2ggZGlyZWN0IG1hcCBhbGlhcyBkdXJpbmcgY3BhIikNCg0KSSB0aGluayB0aGlzXiBvbmx5IGFk
ZGVkIGEgZmx1c2ggd2hlcmUgdGhlcmUgd2Fzbid0IG9uZSBiZWZvcmUsIGZpeGluZyBhDQpkaWZm
ZXJlbnQgaXNzdWUuIEkgZG9uJ3QgdGhpbmsgaXQgaXMgdGhlIG9yaWdpbmF0aW9uIG9mIHRoaXMg
YmVoYXZpb3IgZm9yIHRoZQ0KY2FzZSBvZiB3aGVuIHRoZSBwcmltYXJ5IHRhcmdldCBhbHJlYWR5
IGhhcyB0aGUgcmlnaHQgcGVybWlzc2lvbiwgYnV0IG5vdCB0aGUNCmFsaWFzLg0KDQpCVFcgZG9l
cyB0aGlzIHR5cGUgb2YgcGVybWlzc2lvbiBjaGFuZ2UgaGFwcGVuIGFueXdoZXJlIGluIHRoZSBr
ZXJuZWwsIHdoZXJlIHRoZQ0KcHJpbWFyeSBhbmQgYWxpYXMgc3RhcnQgbWlzbWF0Y2hlZD8gSG93
IGZyZXF1ZW50bHkgZG9lcyBpdCBoYXBwZW4/DQoNCj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBv
cG9ydCAoTWljcm9zb2Z0KSA8cnBwdEBrZXJuZWwub3JnPg0KDQo=
