Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795639230;
	b=guEh3Y1gO4uTs8LpsmVfN8i09LC1VoPJPv6HVeJkoe8b/m7470odwIBDnHqJYPoc+QEd
	 QSLdmes0xHwKgO5uKOjuFDKasSEbyF3ECJI8viXnTTy5F73FyaDgXGotgNPLZShfIA/1f
	 iusG0FSGhuzbxVyv51yNpehTvDYhQeXD/gKXTcN+QGe6K1GSy6xLrDlhEphP1SPmb/2Be
	 xwlqwdEtGm15NXMQn6/UuMVIEgaZSOnV5EV61BXaWOhDVVxwgnznN+3yyq4eRD3cmu0iR
	 rxMi9e4mKhtrV2RcK9qTEg5QGfUdwNArr5k44O2lbldfZlyJtTk133DviveC4gmrEIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639230;
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
	bh=j8UXrJUVq12XKhaxGWHd0Oays5kr8trWlcVXwXdDFcg=;
	b=Vlb9kelN4vWjPPR8enf8ahR1BTBrB9shdACn1zNI6EfUKmvqwTXHRnhoL8pRe2WWQa15
	 WqNJd9XTYuTMJvwTBs0BcOKbKklnysPzoUuHuUZv7l/0ua6cNfNeuEt2N2ouh9SiJQvvn
	 Nl+v5ilHfB2HRZKDwHau+d0RcO4xtkeIzS7gj8YCNl9ibPbvG8e/KGY9Me5b0PUlFObDE
	 WwbbuThxX+lo6valYzqmxAbveJ30lwLJBRrQH7gE7nzx3p6BmTTKD9ixMydRDiLjQDyN0
	 88Mxa9hkeP82VdSHpp0QsPOUTL6uVCQp/k2IECLmKCq5ucKh+Ow0T7WpBF4x8EK7Mlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=afw5mFi0;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=L7r53r2C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46779606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46779606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=afw5mFi0;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=L7r53r2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795639230; x=1827175230;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=j8UXrJUVq12XKhaxGWHd0Oays5kr8trWlcVXwXdDFcg=;
  b=afw5mFi0/c8Duz35HpmP3fGufN9++xQIxG1OCVSzdbghyTSf6HqJoBqI
   V1gnoUPy3XfjP8otVq+tU1sj30CABQ81Zj3LIs6G6ahLefCulpiGHBS5x
   2GbM3OtLOvrwM3hgR1b4QrLvciCEUwPjq2D0CRBlN7wMxVZCo7Md+Ugp2
   P5WdIDi+u1opqOwHyfvalrakisLjVJJQW4mrVc4jYKEXVDp3PirRkl36s
   CjzLbmxEIZpcR9X3/sC+TkFDbEKkeFna6jLGJSNaNdh1gwTqdA2PRoQ8y
   1NfyhvvLd32UjMfw+UU6+mUYhD3uFjSV/QEgBRHj9Zbq3vGo080sNiBn2
   A==;
X-CSE-ConnectionGUID: eR7kaf5BQCih/JDCympdDw==
X-CSE-MsgGUID: YVN/d5aWQH+CVX5zHBJFAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4421711"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4421711"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 12:40:29 -0800
X-CSE-ConnectionGUID: SnQ/pSQpT/i8tvwZfnXKjg==
X-CSE-MsgGUID: FQvvTNKZQMKT51IvesVqoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12094766"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 12:40:29 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 12:40:27 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 12:40:27 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 12:40:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/c4axg8CS3QmwwEDKVFM2TR/01i89NW6I+D/ZJL1oLGVceHX0l+T2GfmziVlxSWeL9uWCPslcpEhiqA9BWasFtsULU5rIIdPTbSlIaXbZu9o25Z18+h4+F7Dedqa7N782Snn4LPM65pwMeDskpsrd1Ziaui7Sfzs9VIyDVAz8wkAhgy0c1/3T9h9jzxUXutlgysCl7idPYQ3zcmKNygbzqhflS8pBJDSFbsUGqivQ3Ch1CsSG6u8DvZ8BJTRjGlGhf598C5gX/SxD3iYqBbFjktOuXD71qSQysB5qsq0ZU4K5EsfdtdluSE2dK1E2yCsVso5l9F8aCJrcuiEumfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8UXrJUVq12XKhaxGWHd0Oays5kr8trWlcVXwXdDFcg=;
 b=v4ogjqVVrOUlij7Nj1yWXj7JGkZVd/PTDODD/TNJgsSZNd2C1v0ziuP6Bqj929LbVXa00qLQ7oDh5YMvUFxNut6yilgCo2vjIIVZ3vomK8ajGX9rG10fV4eyQvBn0CgmKhwOwFx8ea6fArRJzvlFVjq42OWZziYqhCvNyf+h9l4uhBg/Ewzlb3F5f8Zo4NDXh3CTDsuAYMWBhnV8SRXZfRg+gPzwTtZQXHc2VoZVjvduGbhVLEdJNJFmaS2eu1kjEtUYeJUmaqBLqj7xYhkvrYeb6uIRtU0FYlQygSleuskbXF+ZYaXyZWtPM8BqDxFbVdI/W9jlRF9lsqfPtH01Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8UXrJUVq12XKhaxGWHd0Oays5kr8trWlcVXwXdDFcg=;
 b=L7r53r2CoCAGNSbo32FslQJyCtYoGcUJrcm2yU+phaCVqDxAjqeAPWgft8F4OD/YOq7Ed9txpAdySxIMZsTMP2WF3KFI9xyl05kmN7pFw72js+G6dTpqDUcFdHbqNfKUtLxRE1wtzfea5QR4ntCN4E8AhVoMU8Clas5Rn5XYaJA=
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by CH0PR11MB5250.namprd11.prod.outlook.com
 (2603:10b6:610:e1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 20:39:14 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 20:39:14 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>
CC: "luto@kernel.org" <luto@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "bp@alien8.de"
	<bp@alien8.de>, "tglx@kernel.org" <tglx@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/9] x86/mm: don't set kernel_set_to_readonly when write
 protecting fails
Thread-Topic: [PATCH 2/9] x86/mm: don't set kernel_set_to_readonly when write
 protecting fails
Thread-Index: AQHdcsNcgDNwHFfCL0SZnfiGgze81rc96deAgACo/YCAAMG0gA==
Date: Wed, 25 Nov 2026 20:39:14 +0000
Message-ID: <d17f02d54846e26cceae8f042756204b3dcbdb20.camel@intel.com>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
	 <20261112-fixes-x86-v1-2-791adb8d6670@kernel.org>
	 <afbc0c7a79e880947962fec09885a9a8937ba7df.camel@intel.com>
	 <awak8ysyQqt6jQ06@kernel.org>
In-Reply-To: <awak8ysyQqt6jQ06@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|CH0PR11MB5250:EE_
x-ms-office365-filtering-correlation-id: 8417b15a-85e5-4396-f750-08df4b342b68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|22082099003|18002099003|4143699003|56012099006|11063799006|261028144727099003|261022105027099003|261026140227099003|38070700021|10067099003;
x-microsoft-antispam-message-info: IVKolnw5JkwAUvrogYoo28xof/i45G1gDcEyBarK1cSR7CHbaWELOY4HcnQUh1fuVzR8b/GvkAvVIy3Tebt+tpGBNQhyxR1rGa5qNXnPpJB9d04NqYYCSlQc5IXGipT9Fb/9vWHa531L7vICrJSpGglu07DdxKUu7dWSQP4Biqzf3gD3oMPsiqbzzstNtTxxehPB2//Y5raci2sdUdq8Q9Ka0y/ZQ2Fevuyxfw/QY9knM0O0jmf1VjBsnwAXSYFDLrOqb/wsB52H++BQltMTVLnL6luLrfB3jdKl/RQIiX1r2djUTx1iobvalpaklNhWx8lcBuKZJnEy/c31ee8d7gt/Fh+ryI1zk7dzGRH8ycbiWdqQgcblHx7jI2HqAChnnmff5w/LEB+jdn+LXJvLpnZoxA9auRZlIuoOghPEErrSs1n6+5I4v2sqWH2M6G0Lx5+3S6NRcut/+IWMp2HF7KbbAhk6/SIzn7csNt8dHfBfvuZwAOoxGzhEsaOJO7Z9/Gan5wC1CcMNpQTKO131W1oESk+0fsqb98gg4d/YbzNaXk2eAlKVneNbR8YXW1kiIinEtye8tEvEm+14gXzXTaiyUTKLLTDUGOFMNC5vP+WUx3sYBjTQBRjZL6H5WryaOs6d0uILpNu/WhCl7J6lkMo4vyCBy6UAjnurSTUl61W8wNJbm/w6/EAisJyR5KcRVScHzRdhAz/QgigD0V6iwCJ7uMXWSwoA+k5YydBg3Fs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(261028144727099003)(261022105027099003)(261026140227099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWkxRmRZVjRSRW1CQzM0ZFBTZSt4cTRBajlvQllSRjJIV1JPUGE0VEVFTHQ0?=
 =?utf-8?B?ZXVnaTRPV0c0S1JOOUhZRllLeW1PZkYrVEhxM28vSzJBMVRIQW5Ta1k3TGdu?=
 =?utf-8?B?TnlybjZVeTlLbTlsQlBDYTZNS1JhTFFBWk9ob0hxUHdDWElmc3pZSzJYeDdE?=
 =?utf-8?B?SzhWLzg4NHlHS2gxT0s4TWI2OU9VNklmV0V6RkFtVWJJdm94WDZVclB2aWRC?=
 =?utf-8?B?SUEyNEY2a3IvTTNlK0t1WlJnM1V1akRIT1BId3VTZy84V2pjb2tPdnNNSzgz?=
 =?utf-8?B?WnNnSFl3eDBuekR2Um1CVlY2SWlNUEE3ZHNhRERwUERFUDJpOXdmU0ZObDJa?=
 =?utf-8?B?RjBjbVF1ZldubWRxN2dwWHZlWWpWTWtIdnV0b0psVDR3ZHo3Zi9jU25VTk5r?=
 =?utf-8?B?ZXAxMG9ucmE2L0ZSclYyUHFVQXBSN2lWdTNmRjM1YkY3TE9SdVhTTklRVWxX?=
 =?utf-8?B?YlA1SWxKdzFFT1huMmFWM2RoQUlEK1c3VGJ6K291OHNCSlJzNHVodkpVYm44?=
 =?utf-8?B?L0JMdzYrK215a0FhclpUYWVIYmJMQlZLL09jT0NlQUJXZ29EcnM2cVd3OGxR?=
 =?utf-8?B?ZlR0SHF2MG9DOWdpbVNOa0podkFuQXhzYlpKYkluUlJnY3JQLzRHZ0RKMmNx?=
 =?utf-8?B?dmNNRTRKY0lqU2drWnRHUFVCTVJDTFNHUzh1bFRSODlQeDZXQ0RaVUlFS2lz?=
 =?utf-8?B?KzZpNW1NNFZzMzdRU015QmNaZFpjbHlSb09LWDhSZUhJVG1FK0d1QjFzbUlS?=
 =?utf-8?B?TU1hQ1EySjFvS0xiTGRIUEdwL2thMmNJQkNHZVdXd3hmYVd6THZiVW5oMDB5?=
 =?utf-8?B?a290anM1NFd0U2FXOVJUKy9FeXd2VGxGc1cxSFh2ZVptZHNyQjcwQjVrWWh0?=
 =?utf-8?B?dE9YWXlyektmbHhJUjhTRnpKbjV2UzduU2grdXozSmhKMEtiZUQ5Nk4zekha?=
 =?utf-8?B?RHZaVjRmbGZsRlFFOVFKd0RkMVA0U1lZWDRwVkRvYVR3Q09VVnhyRlEwSjhy?=
 =?utf-8?B?bjRjVGU1QitoYzB1ZnJRN1AzZkpQZTY5MWhxRHJIYmduR0lCL0VoSlowV1ox?=
 =?utf-8?B?Njd4OWRxZy9BKzlZNkNqS0ViNlRCZFY0N3c0K2R6UG16d0FjSFEzc3RBSlJE?=
 =?utf-8?B?enROSHhBR3lTazZrVFcwa1dZMkcxWDg5NjdWTmtFcHdVendrV1pocnloT1Rk?=
 =?utf-8?B?N0xCeUJJV2lYV1Z5S0h2UnA3dlV4Q0xPUmVjQ1VjZ1REby9wVnhMMTNlL1RT?=
 =?utf-8?B?dHBjK2xINGYvL1VuNnFaVS8vT2NGZERNcUN0ZjVmZXZnclpHeWFKell4ZUFh?=
 =?utf-8?B?VWoveUtpbEh2bzVrV0IzZjR5Z3JlaVlUdTJLcVl2KzQwUUJ0K2YrNjVKOWVi?=
 =?utf-8?B?N0dNbktHelpBNDJTMCtRei9tV3dBVjZydVlZUWkvdDhFRE5FSndYbzZpay9J?=
 =?utf-8?B?eHd4UXpSZnVVcDdIa3IwWU1NNzU3U1J5OXVNc2xiRk1PNzhzZEpqUVJiNE5a?=
 =?utf-8?B?VkdndytDYmQreXo4UnFXeHlwZklnQkVwTUJSZU1zTnY2OHhMK1NwcEJkb2VK?=
 =?utf-8?B?eFNtL3diWHU4U0M1bE9pRyt2WkdSVUZFODZQQ0hjb05Rekw4a1ZXWklIY3gv?=
 =?utf-8?B?dS9KUjhObTJCZy9SY0k4V2toTW9jRzdiTVdlWmxqeW9PeXRNcWFKZ0laNUZj?=
 =?utf-8?B?ZHhxNGJaNEVyR0pHTTFLTHRMdWN1amJTN3pQejF5b0pIbDFIRm5ndEhOQ3Bj?=
 =?utf-8?B?eFBMUDBHU0d5R0cyMDdNdDViMmtyajJ4YnJzeVN0OWl5SVcxMjF2RVNnaG1G?=
 =?utf-8?B?UENja2I3Q1lseTgxRnlMWGtlanYyTjNPS1ZhTDN2dys5ZmI4QVV0bGJmN1hS?=
 =?utf-8?B?Y0FuVy9yQmZSMG1JVmRJb2RrSHRraElsSm1kVzFWbVRKcDRrMEFwSU01aU5D?=
 =?utf-8?B?M1FIMjJvbThqUExZdUJDSTRVcWYxc2RHeFR2Yy8zMnQ2K0xOOS9yZjY5RXpP?=
 =?utf-8?B?UzFqRkFrOXRTOXAvUkFXcFVNUm1oQzhjbFNPZmpaZ1NoTFZxaUdmQ1ZCMmFr?=
 =?utf-8?B?VSs4Mjl2aXN2RGpMRS80ZWZid1NwSmdXR3RhYkJUN0h6SXA5OEFFRXg3Umkz?=
 =?utf-8?B?aGY4bkpCemdUV3drWGZSdEw3bTJXKzYxeUE2SGdXSWFGcFA2UmMzSTI5bnd0?=
 =?utf-8?B?NHZxVWgwMDZPZkduenc3dzRyeDU5dERXU1FLbVJvL0dZYnVPMzUwbWovakE0?=
 =?utf-8?B?WTRBNGM1K2N5V3NiK0VuNi9sTkRNYWpuMTdRYzJUZWJXaTVwSDRFZ2YrRG9i?=
 =?utf-8?B?SmFvRGUrOGJKVkVoNXhlMWt4T1VSUDNLcXBUSUVkbXVkc3BsNHU4aXVRQVdx?=
 =?utf-8?Q?fjwBtNKpNaTYlvL8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4C7E7D274B2A247B6C421D2B1EFEBC8@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: KEaKEHdbai7IqdXPJiEdbmqDtMtKJF/hzeGnC2uimWsiL/MRkYlbr1jzhw9N9G5/bSOcQLRgzuJeRq52rTW1/URsWpVZ2CIQeIwH8hNNUcQMm93TkJ9g/HTDyaUxQ6Z8qikJUI0x9/zezfG2P2ixoE7IrvjTTI3Q9iESM+8dWk356skRLkKHqqKSCwML03/ODxZOg4M/ux4g/5TKAxpBJ+3i51LmskWRG52kzjEOhQzCdbYWxcoGA/T0YdSSP+LC9KIgq5mVttGTGHfkyk99+V9kQJbUX173aXHCUe4eJHKgPqiten/STE5nZObeUdhitZbWu2pNcdpVFc0VAXtH6w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8417b15a-85e5-4396-f750-08df4b342b68
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 20:39:14.8243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a+5EGX9iGwDleyALnQ437vgYjoqI08Zm7AblOVqe7Pc1W8gmQ7sg5OME6w2M3dRk3tZA7r8a6JnKNBTSIJxe4SlVwGPkNWq9qrCAWyHGnE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5250
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTExLTI1IGF0IDExOjA1ICswMjAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0K
PiBPbiBUdWUsIE5vdiAyNCwgMjAyNiBhdCAxMTowMTowNlBNICswMDAwLCBFZGdlY29tYmUsIFJp
Y2sgUCB3cm90ZToNCj4gPiBPbiBUaHUsIDIwMjYtMTEtMTIgYXQgMTg6MzEgKzAyMDAsIE1pa2Ug
UmFwb3BvcnQgKE1pY3Jvc29mdCkgd3JvdGU6DQo+ID4gPiBtYXJrX3JvZGF0YV9ybygpIGlnbm9y
ZXMgdGhlIHJlc3VsdCBvZiB3cml0ZSBwcm90ZWN0aW5nIHRoZSBrZXJuZWwgdGV4dA0KPiA+ID4g
YW5kIHJvZGF0YS4gSXQgY2FuIGZhaWwgd2hlbiBDUEEgY2Fubm90IGFsbG9jYXRlIGEgcGFnZSB0
YWJsZSB0byBzcGxpdCBhDQo+ID4gPiBsYXJnZSBwYWdlLCBhbmQgdGhlbiBhIHBhcnQgb2YgdGhl
IHRleHQgYW5kIHJvZGF0YSBzdGF5cyB3cml0YWJsZS4NCj4gPiANCj4gPiBTZWVtcyBsaWtlIHNv
bWV0aGluZyB2ZXJ5IHVubGlrZWx5IHRvIGhhcHBlbiBiZWZvcmUgdGhlIGtlcm5lbCBoYXMgZXZl
biBmaW5pc2hlZA0KPiA+IGJvb3RpbmcuIFByb2JhYmx5IG90aGVyIHdvcnNlIHByb2JsZW1zIGFy
ZSBjb21pbmcgaW4gdGhhdCBjYXNlLg0KPiANCj4gWWVhaCwgbW9zdCBwcm9iYWJseSB3ZSdsbCBj
cmFzaCBhIGZldyBjeWNsZXMgbGF0ZXIgOikNCj4gwqANCg0KSXMgdGhpcyBhIGxvdyBwcmlvcml0
eSBBSSBidWcgcmVwb3J0IHRoZW4/DQo=
