Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795639613;
	b=jZvZwPcVzScCPWltthleksIhfmF89vqG8BbH1vVAbD8oN6xsugwhu8fz/quxThINn02Q
	 EO1W8JLiauTP/YgwjnM5D0BKXeptpNZGRsVASB8VuevNPZfZltjRTO0B9yLqy5OQ61yml
	 23/QBDZ8OGkm3evCZ+gyhzLFLTO5issfPDi4w3srjB0BM8j5V80sL6ye0a20wwQ3O8xqs
	 WJZivBsbJ/r5jy1/c7qPQsIoEsaH/9HeGkekVi0dxUG6mIhd+ayX+1c1w4NrbXo+LX2Wm
	 AC88f3uATngF8onf5IUO9Si3biPjWr1NcoryNi9hQ1n4X2gg4vw0YkmZf7uj9v4PFJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639613;
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
	bh=AvC0mZ4J9km6vNNECkQTAZTuxcuYxB1rNj72kKD7/vQ=;
	b=cCf/0ZHlXIEwPUDeHIkMvO4iPX35qhIfe93l2ngIibhU6Eg17l2XEVKsnY4qdS3sFhXV
	 NGGSZoLZGk2kUV4BSWy7uWozJ92/gweqoXmtJ6hlcHDv/7xEicJQKulNbSPM2IQSrdrmA
	 xkrCOYsyV2CFEcb19u7Dy0qtFH3FQ3bc9i4JIqmsdlFG2akVlGTEo5o1SHuGZLKSvfvcn
	 6pE2atUOafOdiUxUBftB+QBW6OeH+8F2bKSs8Sx8GVwWtgCf3XaDwsa2jl98dRin6znCZ
	 jB2DgXvkRGkWgR2pUJelV2TGtudxaqZPWsRRQdklsBjur6X33fel22jM7RYYciAoLFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lC0uSWXe;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=UDfqa0Sj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8372D606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8372D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lC0uSWXe;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=UDfqa0Sj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795639613; x=1827175613;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AvC0mZ4J9km6vNNECkQTAZTuxcuYxB1rNj72kKD7/vQ=;
  b=lC0uSWXeZ1F967tOTsNK6TeaeRKQR/pax+NPqvoNqki24gPLY1ZpmsHz
   OMk2dYOwQBPzzJ9CE4V5oi3qYFM94blnReSRJliitnAFUyHK6GL6lrtDj
   WWKQT/GBgGYsm22ND4qpr+SaX1kx5ukaqyDLoIkx9Hyeo42lT5gtP7+1t
   gKprXTArI74V4WWXOTJcAgpG5eZEYim+/tAKTSa7UVqcMF45S8rXZ1Vgf
   sbKTx2/c1nufTDjZay7t0quoSO3JsDh30K7iFM+Nn9EzlX5u7zuujGdma
   IRqTzrd8YbSaRSxBR0/obVkv5rELzWoU8KFtBEzR0Xt1XrNdwzUqUfkvh
   Q==;
X-CSE-ConnectionGUID: ImcuBhc+RSifkhKe6ugMxQ==
X-CSE-MsgGUID: Ra6dtumFRmynSgtAIOgxcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4543117"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4543117"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 12:46:18 -0800
X-CSE-ConnectionGUID: RoWYG5wyTvW1Y9YpxBb/xw==
X-CSE-MsgGUID: y/D2MXruQQ+g34Th7j0dUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13631385"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 12:46:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 12:46:17 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 12:46:17 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 12:46:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQXc8PCz/pTiSRsimdbhfI+LVpEnQC22dgCNEa0zrxMPqxqvj9bV61y7xU/2E7pJcaa3/s9GLVZxB5fE9PDYUtwnD7XG5Cx7CZ4/OaKd2FRehea/Y35t/sImc/Ih8naEUirhu6r+w/FPGqTAvqUpNcEP6eC1pXcGK4Zhhe495FsyUSsu/LY4ABdfKdhR/hF3iHoGZitgR6yS5R+EkNK6KlwAXOPHL8jjWpjedw2/9aPkF3bPv3vOtwBeE+wa5NE2RIO4rZbAZa/Ae79Gcl24fxmsalw2PWQ9lid0tOH7GiOvzCc1sX6XbhWdEhbvdZFqcxgI03RQofwZ9jEm7G46wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvC0mZ4J9km6vNNECkQTAZTuxcuYxB1rNj72kKD7/vQ=;
 b=Q/jvQtKN8a4BOYOFQV+TPXT2rTb7qs3iNm/8X2LXxtof0P7jJ+jLvQsTPZ72R1AvgtIGi5Gmj7zyRp8MeGWyUw0AYCaX0FzoADuz/KI75Mr0z8WDGsl0bDQgWip82jcnbofmp1uzcqqdrsesVZl4YHzJ62UISdWbcxernENrSmF1gWwvVqlY8fxagGz7hUgKDPVTvK5mdYnV4JkGux0tK7w/64+L1PRtBGK5wPhzv0wAGFiKbKL/oV/8/Bjsv1QEqsG3ZI1xbOX3+2UmvMO6RIKipIYanUKt25f79sto9symdrBcxWyYhlV16QMrNVQDc7iJpR+HDJ63aFvINHvgvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvC0mZ4J9km6vNNECkQTAZTuxcuYxB1rNj72kKD7/vQ=;
 b=UDfqa0SjCirerw6CUigge8S720mif0QrAf1ip24GIQVNlDSYNC0dHwtVqGup5fOvMFMUq2Q2jLlR85YCzLfC+NYJMu8JgIS23bPwZU24hz0o0MWOL+fw9pQVq/KejatvkGDKxQDyNDz5RNlW1JIqL7Q6Xn08g0FvdM8szaqvGiI=
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by SJ1PR11MB6153.namprd11.prod.outlook.com
 (2603:10b6:a03:488::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 20:46:14 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 20:46:14 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>
CC: "luto@kernel.org" <luto@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "bp@alien8.de"
	<bp@alien8.de>, "tglx@kernel.org" <tglx@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/9] x86/mm/pat: don't BUG() on inconsistent page count
Thread-Topic: [PATCH 4/9] x86/mm/pat: don't BUG() on inconsistent page count
Thread-Index: AQHdcsNQlpkZ5Gn0bUayj0GZ9McAD7c96OAAgACrfgCAAMIfgA==
Date: Wed, 25 Nov 2026 20:46:14 +0000
Message-ID: <be835cb27636fab892e60c50f7231bb6ba1de0c0.camel@intel.com>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
	 <20261112-fixes-x86-v1-4-791adb8d6670@kernel.org>
	 <4edee4db91a92b3231644688afbc950bb880ff8c.camel@intel.com>
	 <awamPtNjztFml17Z@kernel.org>
In-Reply-To: <awamPtNjztFml17Z@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|SJ1PR11MB6153:EE_
x-ms-office365-filtering-correlation-id: 508977d3-ca0b-4a4a-b50e-08df4b3525ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|22082099003|18002099003|4143699003|56012099006|261026140227099003|261026121527099003|11063799006|261022105027099003|261028144727099003|261009223027099003|10067099003|38070700021;
x-microsoft-antispam-message-info: kOMrkLgX+7CrA3V4TuAQoeqTZLJBNKYfprhteHYBYHkrZ2dVEMe3bWH/ieLMw4STzfrDPFhJG8Z8BWbRUQ/3T/07IJp+04gNYeS8gbiOpK65pnFv4IyZhkf6ZdMQMAffEfRjXszExlLXnOYCHrninHJkb2dKAf7oiF7Yvhgv9yV28tVAU/FxlP+pt27fV/oGlfZaAgEIXGIluqholK5cu7xiksX7jKdJiCt50SIkhS0Yn+ulRTa0yYLCISvVulTnqHoY8meCNFc2JemLixVc2sJpHW3Hs2pMxIK40bFPDFJXYILxL3CrS9ik1Q1eezoNDyy4xMJnmaS+zHfAaQe3fif6yoeWi+lQSWYaH3mZJEF0fMy2zHIWYTum6NenBy38ZWFwuXbMzgp/IurG0ezntdQugppBDDHJ9BDU6ro8bViEWtQczcDbfmGa99TOS68jfo5wnKRRl/ehkBIpetgttVbkRfDbOYdQwkzMCarSdMyIr0IShbnRHwYPwLjB/vy7Ycnxg8xVvNojXV3liTeW+aOs2UY3Tzle4gzgGpEuq0ZQPxQ3n9rxQAIWwXy6jHPXUOLlQM+cESW7J3xWmc6e0U/ihcH1iw6Qm9wuVeP4kWDlDiUqNAq9FPOd2uc+wtuZRxYFcZazQ2jDKtGZTzBn/jj8M9UaeVptKP5n9jNXiL7XqNHZdjjC/QjnEfFmXBKPxKcuDPnBdUuSAD97QWPD81uah6KSYl0N/Zr1bapoDGc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(261026140227099003)(261026121527099003)(11063799006)(261022105027099003)(261028144727099003)(261009223027099003)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T29Bd0dYZFQ4MnpVS0lIZkxlQzVsaVhoZUJKdmhBbnJFMVZqdklEZFY5cTFH?=
 =?utf-8?B?dW9ndmtTR2ZxNGRkUVp2a0hhN01Cd0RJS1M4czRCYTRIZmE2S0g3TGFRUkhT?=
 =?utf-8?B?RmdTVVJMaUdFOHQ0Y0krYVlqV3B6aUpKUm5aU2krdE5ad2lkNVpDYXpjZ3I5?=
 =?utf-8?B?WXdUTXQrdjEzMWlUMWJlY01ybG91MkNGNTJySjh0ZUNhSW9xbkJtU1FhYTNV?=
 =?utf-8?B?MHFEUDJ2bjVXcFF1RlVHU0MvSk1tUVZZWG5XU1QrQjdJR0FXRFJqVk5LZXhM?=
 =?utf-8?B?MEs1UzlURkxFUDVWTmNPb0ltSi8wSGcvemV2anBDZUpCeGxxMlo1cFQzUm4z?=
 =?utf-8?B?UXJtcVFlUXordzlMN0NUYUtIZUVIOHA2SzlZTHRnNVJxeFIyNUhRaDFGVHdN?=
 =?utf-8?B?SHRGYzBiUjhZYmNvaXJvTFlXam12N1hseVFkeDQ1RWFlUkhpUEpJdDFYTWRM?=
 =?utf-8?B?dGJVa1Q3NkR3Nk9RdFBvekhFMUlIMHU5Vnl3RzJxdk94dVQxK0VJVlIvM0Vz?=
 =?utf-8?B?UEd3T3lNVEE0UjBLVGpROUV1VGV0ZFcwL0w0K0s3RXpScmpCNHl3ZmpKR1FX?=
 =?utf-8?B?M1ZDYTNnTnF5dVYySnhybDMzWHc5MjNwRE9nVzBqYTBYbmtlVmpWQ2dKaW1m?=
 =?utf-8?B?azQ1VTl6Q0xIdVJCQWFUVGMvUVQ2eXBGTnRUeVMrMGdEcWNuMTBJRlUySHdo?=
 =?utf-8?B?T1N6MDM2L3VPMEhoR2RKbm5MVGNERHR6QXJoRCtPS1drNm0rU3lWbytJZFJw?=
 =?utf-8?B?cDErdkZiS1hvNFFZUnFRc1UvaC9YVjJOYWZCR3lkMVlRNGxlWUtHYjh6Q0F3?=
 =?utf-8?B?U2JxZFg4a0JDNmF5SUswdDVUNFN5VnJTbFBDaWkzNWV5QzY4amdHMk9NbzlC?=
 =?utf-8?B?OHAyV1RrNXJGOHJMWVgzemVPeU4zLy9qVGsyUlhJZFZ5UjhHWUFmZnFaeDZz?=
 =?utf-8?B?OVh2S3dTVTBBL3FkbGpzQVVFbGtCYzU1WWxqcW1MbXVScGdiRmp4SFAwZFFi?=
 =?utf-8?B?VUJrMXVBdXc1M1YxS00zMTJtOXk1dXlkcG1PTkNYNVNsak0yWStmM3RCWWdM?=
 =?utf-8?B?Q2doMnhORENmYmM1RWdxN2dGbjFPT1dWMVRNKzJtOG04MEs2b0s1d0h4L2ZE?=
 =?utf-8?B?ZXY5bWQ5TWJvaVBJSVdRU3I2L0ZVU2VLOUUxNDNMbzI1ZW1jQUxrSjNuQXFv?=
 =?utf-8?B?bGxoMmFTRUw5aUlkbUIxNVpIZzZIaHF4dU9mQ2ZNLzMvQXo2OUp1d2R6dnVR?=
 =?utf-8?B?bkNrMFNDaHZQWU4wYU91U2JQQ3lTc093WnNtdXpERzJTUnRpZkV4ZlI5cEZG?=
 =?utf-8?B?RVMrMmwyR3NjaGIxelA0KzFjQ3EyUlBpZHZPMWFvQ05hTHppUFNVdm5LY1Zr?=
 =?utf-8?B?ZnJVb3IwUG5hRTR2QkY3YWx3TmlFeVd3bkhOcFh1UTRjV2Zzb1BPRjZQVkJG?=
 =?utf-8?B?cmg0VVVDZ0pNT08rb2VOSy9NL0grUE9EUDFUZlpvQ0lqcUxROXZaZDVzQzVC?=
 =?utf-8?B?ZUdYOERIS1ZDUERBODQreFRkMXZ2aDJBYWRkL3R2cm5ySzlKTUVLR1JCaXM1?=
 =?utf-8?B?MmNCcWtnQnRWUXFHM2cvM0JSN1UrbzBVVDZlU0NwN2tVd0Y1eUJFTW1EUGdM?=
 =?utf-8?B?b25jcEV5K0N3TWpraVJPaGZZdnVkOFN0aWFpZ1FKam9yQ1RDY3RpcWhjNkYv?=
 =?utf-8?B?MVdJaUtpNHozeWludTdQSFlzRm05VjFReTNCVktsSE5GYisxK21IL3JhM3cv?=
 =?utf-8?B?NHhqM2lzeWhLWEFGYVpSVkllaDkwd0xmbW1qVUVTUjBIQmZwVE5kZkgwV0RR?=
 =?utf-8?B?Tnh1UUw3Q2xxdUhZYzUxeWNOcVp0WW5WL2VWcUdYaU9pQ0ExdHdLcmNXUkNh?=
 =?utf-8?B?VFFCeTRQcW5YaG1FRUczdGhwc3JPVkJFZnNVR3Z3bGJUM2ltOEVEMDdscWNZ?=
 =?utf-8?B?dVVyRisyUWlWWWlaVzd5UEV6T1BVaE9Da3JMUkVoNWN4T0dpcVhaRTRCdmd5?=
 =?utf-8?B?ejhjTzQ5QjExcm8xc01KT0w1THF1T0c4KzJGanI4Si9KVkh2RVBMclpsaHNU?=
 =?utf-8?B?bXdJVUxiTW1HS1ZMeUNSUXBuZk1BSXhaVCtTcTUxdHZkMGV2bkdyUDNyOWk1?=
 =?utf-8?B?RDQ3S0MwYmk1c0d5SjdjSFNORS9ycUZjSjlLeG9VUG00TzdoMFJBeWpDS0Fp?=
 =?utf-8?B?UWpFRFJYcTNBeG5URFd0Wk1qNkdHRDhiUDE3QXEwK3JVakhhTHJxYk5aTksx?=
 =?utf-8?B?ZDZzbHRZVThRaHVuUzNzQkh3Q3d1V0x0RGRGUGFmakphd3lYbWJ3dWFGZ3Ex?=
 =?utf-8?B?WjFTU1JjZXZoK0Z3Nmh6NTEwbDI2Sit0enlxdnc5WFJ6QVVLeGwyZjZnOUNB?=
 =?utf-8?Q?yReDCNBQcD89KCJI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FCFE7D3C178074DA2F8ED96B5E1ACF4@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: JecWXq2L5UXf/R3Wl6yEfVJkIt6mJmGexq1KNBdwJgUxofeiK4p5PH03m8lDZpxWQKMbdr1mocP88mK5XzL1qxv36EoDcz1rmQjQuVS8UaViUB8FSYf+EDYh2B3Jwq9Wgr9EKAGXSoKSjMaazrL94Xm9WznfLlLNNx4J0oKmf8qr3LWrB+OTIFmLuoQ/5EqqVAdD0DG0Qm+KShjAre322AznSTtvCVdYrlEsqzw5zmJmodPXSn+h8YKtuINmgqxyfSTzmr56bHItZhWDuFJfK4Tyk0bU1bSlTlaz3vfXcS5OJOWRat2shked1oFnCk0P/HAG/zVUkBuwZgWqVLubVg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508977d3-ca0b-4a4a-b50e-08df4b3525ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 20:46:14.6915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OjJYATKHhrsnUJqi+dd3ULxQrmzpKI9mDaE+2yrd8dbJxR3Y4bCTyOHUeFRjeNk19aSYotDECfeV/Q2FqJd2MQpM6RxJrlyW31Lb1VmuTkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6153
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTExLTI1IGF0IDExOjExICswMjAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0K
PiBPbiBUdWUsIE5vdiAyNCwgMjAyNiBhdCAxMDo1NzozOVBNICswMDAwLCBFZGdlY29tYmUsIFJp
Y2sgUCB3cm90ZToNCj4gPiBPbiBUaHUsIDIwMjYtMTEtMTIgYXQgMTg6MzEgKzAyMDAsIE1pa2Ug
UmFwb3BvcnQgKE1pY3Jvc29mdCkgd3JvdGU6DQo+ID4gPiBJZiBhIHN0ZXAgb2YgX19jaGFuZ2Vf
cGFnZV9hdHRyX3NldF9jbHIoKSBjb3ZlcnMgbW9yZSBwYWdlcyB0aGFuIHJlbWFpbg0KPiA+ID4g
aW4gdGhlIHJhbmdlLCBvciBubyBwYWdlcyBhdCBhbGwsIHRoYXQncyBhIGJ1ZyBpbiBDUEEsIGJ1
dCBpdCBkb2VzIG5vdA0KPiA+ID4ganVzdGlmeSBjcmFzaGluZyB0aGUga2VybmVsLg0KPiA+IA0K
PiA+IEFncmVlZCwgYnV0IGRvZXMgaXQgYWxzbyBqdXN0aWZ5IHNwZWNpYWwgaGFuZGxpbmcgdG8g
dHJ5IHRvIHJldHVybiBhbiBlcnJvciB0bw0KPiA+IHRoZSBjYWxsZXIgYWJvdXQgdGhlIGJ1ZyBp
biBDUEE/IFdoeSBub3QganVzdCBjaGFuZ2UgdGhlIEJVR19PTigpIHRvIFdBUk4/DQo+IA0KPiBJ
ZiB3ZSBvbmx5IHJlcGxhY2UgQlVHX09OKCkgd2l0aCBXQVJOX09OKCksIGVpdGhlciByZW1wYWdl
cyB3cmFwcyBhcm91bmQNCj4gYW5kIHdlIGtlZXAgY2hhbmdpbmcgcGFnZXMgcGFzdCB0aGUgZW5k
LCBvciB3ZSBsb29wIGZvcmV2ZXIuDQoNCkkgdGhpbmsgdGhlIHByZWZlcmVuY2UgZm9yIFdBUk5f
T04oKSBpcyBub3QgdG8gbWFrZSBhIGxhcmdlIGVmZm9ydCB0byBzdXJ2aXZlDQpidWdzLCBidXQg
YWxsb3cgZm9yIHRoZSBwb3NzaWJpbGl0eSBvZiBrZWVwaW5nIHRoZSBrZXJuZWwgcnVubmluZyBp
biB0aGUgY2FzZSBvZg0Kb25lLg0KDQpJZiB3ZSB0cnkgdG8gaGFuZGxlIGV2ZXJ5IHdhcm5pbmcg
Y29uZGl0aW9uIHdlIHdpbGwgYmUgZG9pbmcgZGVmZW5zaXZlDQpwcm9ncmFtbWluZyBhZ2FpbnN0
IHRoZSBrZXJuZWxzIGJ1Z3MuIFNvIGlmIHNvbWV0aW1lcyB3ZSBsb29wIGZvcmV2ZXINCihlc3Nl
bnRpYWxseSBhIEJVR19PTigpKSB0aGluZ3MgYXJlIG5vIHdvcnNlIHRoZW4gdGhlIEJVR19PTigp
LiBJZiB3ZSBydW4gcGFzdA0KdGhlIGVuZCwgdGhlbiBtYXliZSB0aGUga2VybmVsIHN0YXlzIHJ1
bm5pbmcgbG9uZyBlbm91Z2ggZm9yIHRoZSB1c2VyIHRvIHRha2UNCnNvbWUgcHJvdGVjdGl2ZSBh
Y3Rpb24uIFdlIGFyZSBqdXN0IG5vdCBqdW1waW5nIGluIHRoZSBtaWRkbGUgd2l0aCBhIEJVR19P
TigpIHRvDQpzYXksICJubyB5b3UgZG9uJ3QgZXZlbiBnZXQgYSBjaGFuY2UiLg0KDQpBSSBwcm9i
YWJseSB3aWxsIHRyeSB0byBnZXQgdXMgdG8gaGFuZGxlIGFsbCBwb3NzaWJsZSBidWdzIGlmIHdl
IGxldCBpdC4gSXQNCndvdWxkIGJlIGEgYmlnIGNoYW5nZSB0byB0cnkgdG8gZG8gdGhpcy4NCg0K
PiANCj4gSW4gYW55IGNhc2Ugd2UgbXVzdCBicmVhayB0aGUgbG9vcCBhbmQgcmV0dXJuaW5nIC1F
SU5WQUwgc2VlbXMgdGhlIG1vc3QNCj4gYXBwcm9wcmlhdGUgYWN0aW9uIHRoZXJlLg0KPiDCoA0K
DQoNCg==
