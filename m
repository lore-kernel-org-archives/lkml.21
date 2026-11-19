Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795129506;
	b=a08iMgHloXi5eAl8Yi7rhLCJynWMliGuXVzRONm/uCjruTuOxWckM2SKcEUSF9F5s9Bz
	 kvOIdg1DoFQtxzEmsCFxM2prmCI9kZtcPRdmX9HMf4+qFXVTEPyNxIs2uJM3X5CqPxC0P
	 ATLfoYpFeU+/N4o1h1eaHZPW99krlU8hop0gUTUGjwsXfcM3Z/RkgMyns0ev94Hudx2NN
	 Y6BdoGTknzoObhEbm44oWNpCEo3cFvdmS9tuwtslUFlYQaKJ/S1Tm3Qgy9jTyzMql4mSY
	 +V9TGAStKPjIAoEMBxSD4HA16H5/l+BTz0aDWphZHQK/35wyHJlmcBrmuidGma2B2ZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129506;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:Subject:
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
	bh=0NyHKzVcIlYgLLDOpxR1snFxzcHboyQ6jzc5FACH3jM=;
	b=AiP6yGwbeZbEgQRRq+q8FG5GvInphp4sE3XatNESISYEWzpmD1PsI2Dew7dw/9bwqYTq
	 F5P72h2TfNNhF4NtHjsZUgExNSE2BKe6h/H9hXaBmfUG/lqzbEWqMWlF8SGOBlrmeeGn1
	 FMynCPF31bhf26o9awvtIkWqMRDww/X8/5kZNSxuABa5zRNpuhqMbQfpiuEpMNPVtBYum
	 Oc1YBRQdiN0Yl+wyhuGAzM8/6GU+s4IYIdsMX4H95rrlKnHTpoTsWy1hQUabKZGXJeszx
	 QITLRZDiw8PwMrpK52R8Xbdme1q+hH7S2hjAVE+uUNxYpLQDHwsEiaHrg9rgR3PT8Tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KG6eqAgG;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=hA6l8D5k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4B9606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE4B9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KG6eqAgG;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=hA6l8D5k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795129505; x=1826665505;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=0NyHKzVcIlYgLLDOpxR1snFxzcHboyQ6jzc5FACH3jM=;
  b=KG6eqAgGGjtm2WLfGGnMzcWLNNXRHtQiyxulSMf6ZSbPhgnm3SDa7zl5
   Ha2q3kvOquTeywMvN0U2QJ/wonOgRk9jjt5t/MCP22bNmHARYnXNPW8lb
   17V4Knwfuo9JDIV2UNUQeHSfTx/Amx6mAJQbkY02CdiaLYr4BFaWg8Zy4
   RkXgrLlQS+o+Hr7i6E4uvIQtwkLtL/bZlCvkWRr+iORVEfnNzklHZ0cnE
   fzY11zzFedFMiDUb+WwP2+HOSyeKQu0BlSB2qccNUFbxnnh6ID80lwReh
   noXPWILKOofKTCukSN7chZEFwpKxdErh/kTfbMLljvzcjv71kzH4XYt7x
   A==;
X-CSE-ConnectionGUID: UxzlbacCRzGAWt1mNDTqfA==
X-CSE-MsgGUID: HUHujD9iR56AFiwwDWlrkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3991337"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3991337"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 15:05:04 -0800
X-CSE-ConnectionGUID: m73dkdZxTZeEhWMLveCQ+w==
X-CSE-MsgGUID: 0BCggUGASlO14F7G3yC5og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10685479"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 15:05:04 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:05:04 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 15:05:03 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:05:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swJSMLNFFIEMoxtdVLTbb1XR/vCG/roIftBcZD8GVQgGwrGCPouGnadohgVLH7Y5/boSCN6jV4MMF61ZGomZWFJWDop4JNLHKs/OIVHJ1vU32JS3cxDXRGgN/c5idR+d06td8/GEeNTcPravveqyeWl02h9gWt0Y0yI9mab//JrBwgwgnvatCRFm5MSzPsYs6Qwy/OMAQYqjVfCrd8TN8irWDZaw9Mj/b9jD42wo2EcIFV+0a+SxWxMFvV96FKLkdmVm8EqhjTazWFL9rJ+U9xNmUdcwvgkvd3RMFSFRvPhyNtc3EWI9mqSauWZfblXQhKRdYHHRo7ITJx4Lx0qdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NyHKzVcIlYgLLDOpxR1snFxzcHboyQ6jzc5FACH3jM=;
 b=C+kjiT3dB7eYE3k2MQanMXaSdYcD3KFJPR/AMUuhloH9n9SGMYUK8zT+I5E0qDZmq0uI3UeGppfZfUEoPh9xklL/w0Fy+EMT0X7rCXEl1TwGb4s9UldyualVZ7I2pkoKRBRHh8I/4LC2ABu+7ojVsBNdUSvHmCUYphrhXIRm3M12OjbeY+As1BeeP0NTJyHIkdtVXwZEYx8+aCubKwS2/xk+OGw6K4qnR2DFlpFW/oYg1FxIQ0Iy2VX+cqOlrxsSUxQaDmVtsRs+WBKAuigmzm9O+UKN1Cqbd+KoYZL9IOzCKw+fWTJ2I1A/fPC/dUrMt7NCyomhSIoB4jUR9/ia6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NyHKzVcIlYgLLDOpxR1snFxzcHboyQ6jzc5FACH3jM=;
 b=hA6l8D5kTbCckwjKpENgAKy8VuJdiW3htMRGZEoEOUAqirqkKzpZAkRFFzpvdJWfa5vboRfG8117aTozmU0wIQ4gEGZnW93zYIjt1wenVZ9GxfrpXIallTFIuJdyecojTgegToTxYdavECM8xZQ2LauZ6SbpZ/pN3Zi+LTfFJa4=
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by IA6PR11MB690409.namprd11.prod.outlook.com
 (2603:10b6:208:5e4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 23:04:56 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 23:04:56 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com" <hpa@zytor.com>,
	"mingo@redhat.com" <mingo@redhat.com>, "daniel@quora.org" <daniel@quora.org>,
	"x86@kernel.org" <x86@kernel.org>, "habilerenturker@hotmail.com"
	<habilerenturker@hotmail.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"jwiesner@suse.de" <jwiesner@suse.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/hpet: Replace sprintf() with scnprintf() in
 hpet_select_clockevents()
Thread-Topic: [PATCH] x86/hpet: Replace sprintf() with scnprintf() in
 hpet_select_clockevents()
Thread-Index: AQHdeHplMGcFpWXcQ0SKQAA3DFkrGQ==
Date: Thu, 19 Nov 2026 23:04:56 +0000
Message-ID: <c6105c6acd7d17162c205e51f67f29f54e077d37.camel@intel.com>
References: <20261117113916.57740-1-habilerenturker@hotmail.com>
In-Reply-To: <20261117113916.57740-1-habilerenturker@hotmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|IA6PR11MB690409:EE_
x-ms-office365-filtering-correlation-id: fb137145-161e-48e5-aec6-08df46918789
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|22082099003|18002099003|11063799006|921020|261026140227099003|261022105027099003|261028144727099003|56012099006|10067099003|261026121527099003|261021123027099003|261021121427099003|261102123227099003|38070700021;
x-microsoft-antispam-message-info: mlQsHpGRvoA6AuElHymfvCtp2Sm/p7AVhgCiyKUxbB7QiAFTOdPWhsJEmSxDjKuviMo8vFvYbhURzmA0Ub0CSbheGp1Z9xca4jHURO8RL8s3rZnfMwjo/Z6vT+EnTHcorerZbQW/HOka8DAcDijXzRc27/0zvyva8UMYgl8nCqjarBrJud6995w2qgXlXqsLlUJbPMow219D+UuyQTOkiofB//5xijEGwctbOqX3HEETcjUnkxyEgAnDM7QE9TBMiimlKloPboZUa8QZCyhklb33X+mmLQUurBjH2nJTFf0QjrwishldL7o6COErOsTCr6wPg5FcwUUSFXNhne2PmByt4XdsOziA5vl7jPhJXYL7gXgTIQwXwBtnWAAdMDjLc5PbUtglR0Oo9jnNfUeBmXquw1rDsPmPj9VOPu7PfVV55Foonh/Xpiuf7JH+j3aDTR/vTFjiWMCBBHvMNBlnEkdhEnfDOEF83Oaf5TkyERldr7WX03r2BNg0mQgj8pAkBe0shnGlTXgUQCfSosw3T1+g5PHbAXNso7+J6AixvXgyah2a2rOVexfFGZuNOkD8u+SZ7VwiYhydmUtVLGYrA73CybmZcK2pYMG4dQyFN/vI3bk65tr5HlZrZV3pFiDbMVoRQa4m05hq0AEDLczGwCoRI0l3eASqk9/mkXCT9dO5yuSr8HO4Qjpm4fJH6+hjm6IWapvdYGDTFE5oNf4PC+6dPK68oFXs6XSoe5pPR7V7qlAivQQzHMvfJ/IIHYdK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(11063799006)(921020)(261026140227099003)(261022105027099003)(261028144727099003)(56012099006)(10067099003)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVQzUnhBTkI0TWdQWWRUWURLdjkxeWYyejliYW5nVWFQdGo3UXF0aXgrZnZR?=
 =?utf-8?B?dnlDZzR5V1F6WVB0elhWRzZBTGY4amJvLzN6WU42eGo0QWZGdCtLK25ramxq?=
 =?utf-8?B?VmJCR2ozREZGREhrei9tS3BZeXliL3V4T2t6dC9jWGhUQXE4bmZyQ3djQlhN?=
 =?utf-8?B?VEVLMkFuTlVPeVlNY0FKTytUYk1JNEtiZnlScnNESUVyTGRVQU81QmM4SFpu?=
 =?utf-8?B?aXhnbjY3NDF2WFFXOEM0WVlqQmhtZDBtQmludEtzSlJZN1hrT3dLaHNWanB0?=
 =?utf-8?B?Y1pMTURKUEVSNEFOcWN3bzhjTXVJTkU1bThvTy9VSmpWYXBwNUxPOGNVYWR3?=
 =?utf-8?B?OVN2eWRjemF5RkR4SW1WZnBpUEFvSWUrMlVnc1BpQVJSYzBna1FOdjBIMVg2?=
 =?utf-8?B?TjdzUERNY0VyZ3pTeGY3TjFBYVorTDFYM1pvYkRXM2dINUNFa3UyVnJkdVVr?=
 =?utf-8?B?akdCeWdMS3hjUDhWc05aRDVGRXNIalFtdGtvR3RORGVyd2FUaFFQemQxK0hq?=
 =?utf-8?B?clVGdSszQ2VrSFVYVGhKSEIrWi9oN0dJTFByQXR5ZTVRL2VvSUEzZ1psVWFE?=
 =?utf-8?B?Q0xoTjhwVGs2MDdtVTViNCs5YzZrSFVCMlRwamltRFBGT3hrWUpSQzhJbHlO?=
 =?utf-8?B?RVA0RmxqOW8rWEFML0R4V0dwekZzNHpUcjFxKzE5WERLeDVsUENxUTR2SFpn?=
 =?utf-8?B?cG03RlZvcWFyUmkvcFlaK2lEeStZVnBVMGVZS09ueGxwdERBOWFOVEI5ejJq?=
 =?utf-8?B?RmxIaFcxbUxnNHVFamIrUFJyNDFzalQ2UFlQL1o3ZlczemZvL2JqOGl3TVcz?=
 =?utf-8?B?NmRiTXJySHN6WElEOGVqbVFSeVpXWnBkUy8wMFE3aWp0QmJPUlduL0d3aVdv?=
 =?utf-8?B?SytreXdlWG52VEJMeXJuSGpJeTBpVVNMTnZFRkRFa0FnczVOcituTG41Rk96?=
 =?utf-8?B?Q1lBMkE3dnlnR1RKeXQyM0lnc2wweFQ0bTF5WnZkZHB5aktVSW04UkxvYWZ3?=
 =?utf-8?B?UVQxVlF1Z21vcEc3ZHc3bmpLUUFQN0NCV0VreUJiVlZWYm90V1JQVlpsOWl5?=
 =?utf-8?B?MldBaDlFQ1FhZUZ5SUcwYXdhVGhZYUpGSG9rbksxNG5leVRsdDRMV1l0ZUxQ?=
 =?utf-8?B?RDlNUVlUenJLUkdvYXBjR1pzY3ZTMWZ1QXNIS3lFTmRjdng0NS9OV3RzZ1Jz?=
 =?utf-8?B?aWxqaFJNdWdTc3dkL2ttWm1aUXFzdVRSVUpoODV5RFZuZ0I0MU1LT1A4cGM3?=
 =?utf-8?B?TDI1S0prR3RkM01LMHJVUzJuK3F6clAveWdYbW0veVBWWXJoYUdBSmdsSkJz?=
 =?utf-8?B?THh6VkROUjQrN3F5Z1BnVlJEaUJSLzREdVJiRytKaUN1eUgzNnlBWmlqc2lH?=
 =?utf-8?B?QXZKM1pkWmFiVXFOdVdsc1FsUm10bDBzMCtKSDdvcS9wa1laU0RGQjBKOXQ0?=
 =?utf-8?B?THExMURRbUFCaHo0QkI1K1NNU2QyZ2hldzg5dTUxb1ZqdlNCTytZNW9ROW5m?=
 =?utf-8?B?L29LeTVlRHl6U0x0QWQ2dnJWTWRkWmZHcXNlODkzbFBwYXd0K1pBY2lDczFP?=
 =?utf-8?B?cTR3NWRvcUlNUUVnYkVNc1ZmWU9FVkZrUFYzaTFKa2doWTFRZFJYMVdyaUc5?=
 =?utf-8?B?czZpUXV0clZkS0FEeU5BV0UzcndhYlVlL2kxOU1EWjhQS09uLzExZ2lPQkNZ?=
 =?utf-8?B?TmdZanYxTVhtb3E0bkVCd3lnUGpnTVZxR0h5aVltYlJNczJKMm9kYU93c2RR?=
 =?utf-8?B?OEY5KzRhbW9zYTVBN2xUSVJEWmo0TlE2eU8zOURqZURqNmlaR2x4THlrZys0?=
 =?utf-8?B?Tk40S21jM0dkcENvdEpLbUhjcC9ZME9KWEpXRDlpQU4wY29wZThIQXh6NlN1?=
 =?utf-8?B?MHBIZzlnZDR6eWh5SWJUNCtZSlFrZHJBL1c5MkNENmtBeGVvM0VMNG9DbGYr?=
 =?utf-8?B?Q0JGMFlrR08yRlFwKzZtQndITDNveEZxWjlHMXluYUp5V1ZlamRCaFhyM3ZV?=
 =?utf-8?B?WmdmM1c1Q3hMcWIzVi9YTENScWcyZU9qKytZQzdSWGdnTE9LUG5ycDNURzJI?=
 =?utf-8?B?R25VY1lmeHJQRjdaMFUwOGIxOVYwd2xtYVBEemdvZHJxZWtSTXE3S3dDbFQy?=
 =?utf-8?B?QUt6aG5Qa05yNGdBUHdYcUVhdkRKWTBtUXBKcHFwZlFYcjlkczlwQU9nTmpF?=
 =?utf-8?B?ZkxSekFFVHVtU1dyNmxHTzdlMjdaUitFRDI3YnJnVklHWU5XdXBtYTc1SkZQ?=
 =?utf-8?B?NWFwVXVvS2t5dkNSTkVzTlpxZy9jVjJhajB2R0dPYVJ1bThhRFIvZ21YbmtN?=
 =?utf-8?B?VXFsV1RCSGpUdjY5MjArTExFWkJkNlVzN1NxcldlR1EyeUwrTkNhYzdCeDJG?=
 =?utf-8?Q?/0Z1d5QCKKXa4AS0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B85F31C05D95014292413705A5959FCB@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: yEm/SP48URInf5DrBRfM+oQtcPqQjkDYrvsOg0xSUTH78MyFMLqTeTj7N4+2NHBSa6rCorQPxVzeS1MqgfX7BFtX9a1LPO61/nMg8Jk8sZJoGMV0kAD/9T9JiZg88G4LC7Ov44iyuTxrX4b+rGt+Kl9P20taybCdLW7WO9aSXiH+BRBgh00Ho9M2T7QUA9rUEqqTWUmQXCCDh4KxW1ScXEZOlQuv63kq5A2x0vzaeBQXUwHJUNC+SoSDk97o5BIFT+85TV42a2b9NeHV6kJi7hzOTfRcVPyVz04Fz6og2mlBh3MatyfpwauGCmx1+yYWDbdzWYm5cm7tmZ0VB5t5pA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb137145-161e-48e5-aec6-08df46918789
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 23:04:56.7921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e3SyPXvJMiZ5hpo3shXcIItkBJ3mnT+GqxbNs6tiRzvGQCqL6Q8qk0r5wxm06opj3KHyf9ymcGq9AmR8r/PYFRE7Yorln5P277fevGFdBcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR11MB690409
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTExLTE3IGF0IDExOjM5ICswMDAwLCBIYWJpbCBFcmVuIFTDvHJrZXIgd3Jv
dGU6DQo+IFJlcGxhY2UgdGhlIGRlcHJlY2F0ZWQgc3ByaW50ZigpIGNhbGwgd2l0aCBzY25wcmlu
dGYoKSB3aGVuIGZvcm1hdHRpbmcNCj4gdGhlIHBlci1DUFUgSFBFVCBjaGFubmVsIG5hbWUgaW50
byB0aGUgMTAtYnl0ZSBoYy0+bmFtZSBidWZmZXIuDQoNCkl0IGdldHMgcmVhZCwgdGhlbiBtYXNr
ZWQgYnkgMHgwMDAwMWYwMCwgYW5kIHNoaWZ0ZWQgcmlnaHQgYnkgOCwgdGhlbiBhZGQgMS4gU28N
CmEgbWF4IHZhbHVlIG9mIDMyLiBJdCBzZWVtcyBpdCBjYW4ndCBvdmVyZmxvdywgbm8gbWF0dGVy
IHdoYXQgdGhlIEhXIHJlcG9ydHMuDQoNCj4gVXNpbmcgc2NucHJpbnRmKCkgZW5zdXJlcyBudWxs
LXRlcm1pbmF0aW9uIHdoaWxlIGF2b2lkaW5nDQo+IC1XZm9ybWF0LXRydW5jYXRpb24gd2Fybmlu
Z3MgZm9yIHRoZSB1bnNpZ25lZCBpbnQgY2hhbm5lbCBpbmRleC4NCg0KRGlkIHlvdSBzZWUgYSBy
ZWFsIGNvbXBpbGVyIHdhcm5pbmcgZm9yIHRoaXM/DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhh
YmlsIEVyZW4gVMO8cmtlciA8aGFiaWxlcmVudHVya2VyQGhvdG1haWwuY29tPg0KPiAtLS0NCj4g
wqBhcmNoL3g4Ni9rZXJuZWwvaHBldC5jIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tl
cm5lbC9ocGV0LmMgYi9hcmNoL3g4Ni9rZXJuZWwvaHBldC5jDQo+IGluZGV4IDhkYzdiNzEwZTEy
NS4uMGVkZjBmZTBhYzJiIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9rZXJuZWwvaHBldC5jDQo+
ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9ocGV0LmMNCj4gQEAgLTcyMiw3ICs3MjIsNyBAQCBzdGF0
aWMgdm9pZCBfX2luaXQgaHBldF9zZWxlY3RfY2xvY2tldmVudHModm9pZCkNCj4gwqAJCWlmICgh
KGhjLT5ib290X2NmZyAmIEhQRVRfVE5fRlNCX0NBUCkpDQo+IMKgCQkJY29udGludWU7DQo+IMKg
DQo+IC0JCXNwcmludGYoaGMtPm5hbWUsICJocGV0JWQiLCBpKTsNCj4gKwkJc2NucHJpbnRmKGhj
LT5uYW1lLCBzaXplb2YoaGMtPm5hbWUpLCAiaHBldCV1IiwgaSk7DQo+IMKgDQo+IMKgCQlpcnEg
PSBocGV0X2Fzc2lnbl9pcnEoaHBldF9kb21haW4sIGhjLCBoYy0+bnVtKTsNCj4gwqAJCWlmIChp
cnEgPD0gMCkNCg0KDQo=
