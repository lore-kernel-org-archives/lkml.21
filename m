Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795210494;
	b=s0EVV9s47HOJIgASx+2HhnrH9v5/8YQGdzhQnTpQW7z9ir+pcFtTtXtoKbYPUSpfkBnF
	 t3cBquPq1eWw7uSKJcXe9KKP1/pMhMr/a/+9pnuDlYtxIXFtbTc+jJ4rQxnw1xavDuihC
	 Pz3Op+Vcd8SUM+fwO4JCdo0dL86OBQdOBbn+JWySQmL8JFj17BXxSn7KPPolM/eHvI424
	 zUMYQlHhFGKUcArHqP9SVG7r6lYFlWilhYkAfJtIb+Bv+LXpxCqKUiJLiS9MOGP0uyScf
	 g8U2WlU2LGl8dsqbPCfUgA0Ws6NxqlbvklXYCyZ2qfgKONLq/k5HhlRqvy+S8onX2bw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210494;
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
	bh=wI41GWPxU2jM9ILUOM6VnSNkTLsP6oKztunoAj5K+Lg=;
	b=SkG7ZqymJl1MBTHEMP930kUTZyK0aeSILHS8lm/WrFWgNftmFmgVvUqQr2oYLLcp+/6x
	 YdHBvNBziFf1IwW48TuYsrTADXMApaOx4CAiMwKrLZ0AuLtssjKOCj4Pz8kiFjezZ1Qoy
	 VhB/LK4aRwruO7Ti/ZIJjNq98sXBWjiwxvKsO7v+jsJCAQAwEbTyZgsT4YCrTFZlVYcxW
	 o/gYda6D0jgJlAAKEmwhcX3dfxOUC2ZJzde51sNoUtqEc1s1ChdzK2NqLg0nzpNVJoBw8
	 jxXbeCIdQguV16AMlTHyuKbHb1tCmQsTPWXQ5JUZCK9jwrlh402t3BGuYzZtjFzptJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U4TheqaV;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=R53SxyIW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B884B60A2610
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B884B60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U4TheqaV;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=R53SxyIW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795210492; x=1826746492;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dsbeMG7K69Dr3RJT3RuPql6l50a63DHkj8AfWFF5RrE=;
  b=U4TheqaVGat3GG1UR7eo8qxDFwUQDTP4lxKYgPZ0zRSS4GNjgucQrShR
   hd84kAgTG4ega6ch/kECmDOsOJ/SVzJN+Yecwv0NxNDYNGnBX32fTpuDy
   BMsja6jyYGE99jsVJe8MwgjDQROhWmYk0bzwlM3+yUuJcIrjZ0f199APQ
   1S+O4QoG0EKXpex/4EMZjn91IXL6Yk1SnRaEn7VmKp4m3hY+T6PTdaluS
   SeIOK1Ge3ueskyPmuXJEEYMo/HnWC8NfSAhojlzj4sWElpTmBxsQuknoJ
   ha8bbHTvd7Xa4ogkUX3bwSLXRvMDJezfuSBTcuXqTaJ1QVkeICohJ9PNr
   A==;
X-CSE-ConnectionGUID: GC3w9H3GQSmcXvlDacLfEg==
X-CSE-MsgGUID: Q8T0ffIxRVqfTEhNpwp+AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3982586"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3982586"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 13:34:51 -0800
X-CSE-ConnectionGUID: aUrd/voJRWepglrqIISqHA==
X-CSE-MsgGUID: 96M01KQ8TWGjs0qxC7dBvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="12619289"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 13:34:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 13:34:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 13:34:50 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 13:34:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubEboOUzfCPuCBMUc6AlnwQ8KR2STnKYEicCZBfhT6/fAGGySFsvSnOJIEpE2zBt3TC/nemu6cv9U9p/qa6yQX4trwAtJWYnweS+c5xE6M6y7jww+HjLp82lThAxPUW/v4NlWck168Y2d83zIIQ/BAI/RTEPBSAGpi7UREa0EJlDxN2ems6cIjUixeZHhqjpzh4vns5NMCFNwFSa3aV8O6fY6spblPQYUwjkayAryB/R4C7730qzKrLRQL/VC/AtbvHlYYBceVg2d7aJMMEB2RhERrkOcD/qYklOTtzjQvIyl7tDhRWsFtn4XzdejK5tELyHoor5hLdNR0vCHS1+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wI41GWPxU2jM9ILUOM6VnSNkTLsP6oKztunoAj5K+Lg=;
 b=TwaFQ0ywCizDMqZP5kY7QGuTCnd+vD19vyax0sH0dSfO9MWhoS/wLfjQ/xMXjGA9vBo+tHZhbinU7iJpk83v8WEYjYxjVybzlbSIXrXSk36qFyoPKEs/Kw6DY9JskuHUFUuJFdJa5ysoKfd0o67K/yB6hiKQlzOe866sgwL6PoYGQu/mtMM2yt6/3Ew9JKlj0r+5GzaGF+JFhylKUSQA2KXF6yBgVskYUxssJjlDsCWpT2JcCjVN0NMh6P7cvdcHnNtMiBfCsc4H0F/1wxF0JoP/8yaHDK5OHfl2tMs9zQw83jeL372FWZbj96yGNpes5IzMnhF78/56qd9JcPO/6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wI41GWPxU2jM9ILUOM6VnSNkTLsP6oKztunoAj5K+Lg=;
 b=R53SxyIWekTz6pO9AqJtTTMUEWL5NBpKxYmeeBhnqoC45UN1Qd2P8I+DnCY8/cSJopWK8jEsU9piYNrgvfvTz1ryEXpb8kOFtAk0eo8jzV+sgZyA2eyQyJ36eBzmDeyrbLHmxF/Sd5iQ6ULskoO2xA6jzEHaCNQJkvuh0V7AZQQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH8PR11MB9724.namprd11.prod.outlook.com (2603:10b6:510:3a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 21:34:43 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0615.009; Fri, 20 Nov 2026
 21:34:43 +0000
Message-ID: <b2fa5415-c41a-45b1-918a-1d49ee4ef9c6@intel.com>
Date: Fri, 20 Nov 2026 13:34:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] x86/msr: Switch users of native_wrmsr() to
 native_wrmsrq()
To: Juergen Gross <jgross@suse.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>, Ben Horgan
	<ben.horgan@arm.com>, Dave Martin <Dave.Martin@arm.com>, James Morse
	<james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, Drew Fustini
	<fustini@kernel.org>
References: <20261116160259.1579333-1-jgross@suse.com>
 <20261116160259.1579333-2-jgross@suse.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261116160259.1579333-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:303:8e::11) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH8PR11MB9724:EE_
X-MS-Office365-Filtering-Correlation-Id: 254b53c4-9d8b-42c7-94d8-08df474e16de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: L0yAgTtLr9hnHx97PKX8wvTZt25G2gryYRF/cKfQvyuHHMRLQ1DX8C/7akxlU0gqoVdfkgfH5y7zdB0NqBTclwUxGJib4f8sF4mePiCGOzO1SgncCRT9EDYNZCZIUiW88QIiJUqt4ZzC3uSM30nAetgAeFrDLPiSSYk5gDczS9YJgJ+prJNt6HNWoabY7TtR3WGDAIH3u6VXN2LFb+8djIkkQLcuZYILHsTRtXjQwav+CTrdtlCK96qOQHosIg0JWYBJVq6L6ptY41yDjhmgOwd6q7G0/pp/xQIg7s6+EJ/bkBy2gO8DIn3tGVY2jOMN/ScrWYCaWOviE34CfMfbMJkrSlXDDW3ztV4YlMl+ekh078mb3TW6tBolgFGBdVUFUea3w3wGMMz/1Gzp6F4ormM4M89q5T37mrP4INiMBQMoLiWF5kNQkbxvtAaiiLtjuVHD59khm9HD0me6wTuhl0C+lDxHSg2a/a9Pv1Q89pFCRO6f+qIJiJH4JMmeOQ/YB6beZwnbnlTHdqrwDl3YY9+BEs8XZPafH6TCzn38ya/1NVovFpEEXU8UYfL9SE7Kn+HQQ9BgJlqms4eUh6u2ZezsXWkOM+pXRDIX1L3MaLSKOGj+RjWcNvDwzsdOQGFSms8SLSulJYMlSwz1DKFNeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enAwM25MREMwbDAxR2FPa2FQTWxLaG91UDRkSDBoUm8ra0M3TDVrNThwZXdZ?=
 =?utf-8?B?dXNoNzdYNDJqYVh3NlVBVGZicTI0b0p5bU1tMmJZWFB3R2pyQnBiQXN3cGRO?=
 =?utf-8?B?VFJOam94SkM4NTM2cS9RbFZWL285cUUvRW5iZHQ2T2pYdTFmcHRIVExBYVNq?=
 =?utf-8?B?L2plOXhtMWJoVmg0a25oNUtyUUxueFAxWmw0NWUyTXA0aFhOTkFNb0RFelZq?=
 =?utf-8?B?bGRmcUV0TGtub2xrdTVCZXRNVlVQbkpVNWhuU2dDWkQydjZLallZd1FrLy9E?=
 =?utf-8?B?bmFSQU1NOVIyK2lhZDh6Q3ltbUREMzlxNWtuTTU5QlNxY2xxZDcxakN3TzBC?=
 =?utf-8?B?N0ZIL05GOXl2aE5jSzI2Y2VGc05SUy9aMndjdFNZYkhUdS8rZS85R0NSWGto?=
 =?utf-8?B?ZTF0bFY4cVdodHF2ZEtlb3RmUTAzUkIvRFJ0YjNubGhJSUt0UEZWWkU1M2g5?=
 =?utf-8?B?STlKYjF2eHM5d0lmVGkwUVBydjE5VHAvRUU1MlNZN0I5MmZrcTkyL3FCbk51?=
 =?utf-8?B?cGprUHNmT3V3QmZGaDczNmxZc2tYd2RVKzBPN1NIc1EwTVgxSmltUWVJWUxl?=
 =?utf-8?B?TVA4b0pEdHJGRklyL0IrYkVPNTc0Nk5zK2dCaWJiRjJYSFJ5TUdKOExVaGNY?=
 =?utf-8?B?SDdadjlFdkZPRzdFbiticlpZM203NXZ4dTQ3a3I2eitLTnlqQzF4NzdEcGJO?=
 =?utf-8?B?eTN4ZnRGUWIwTjJjaWhYQTZjQnJhVzEvRUwxV0I2Y3FjYmJCVXJ3ZjNmVjh3?=
 =?utf-8?B?cEFYZjNnU2VsMWJXa0tYVFQ5TC8yU2toak41VW9JT3M4d3dERUJaeVY3bXJ6?=
 =?utf-8?B?RWEwZUErY1JmZkhFNmd5S0JsMkpzQVEyUUJkcFhHK1RtUnA2TUlCRVZIcjJh?=
 =?utf-8?B?eElRKzZleGJ0U0V0elhaQVpGRGJQc3grV1N2Z25mWEtWMlFOdG8zOEJjWGZX?=
 =?utf-8?B?Q1c0R2JSMk9qQ0RobVc4Y256Vk8zQWZIamxlZTBDRG81L1BmNkVrU294QUQv?=
 =?utf-8?B?WHNJelQyaDlsZ202ZFBVaXhjUmdmakZZd3NodGEwbGdOUnhqMkpoOE9uOWxN?=
 =?utf-8?B?OWk1VDBSZElnb3lhYVJvZEVUa1VyY1Axd05pNUN4ZkpCd3d1Y1V2aGtHUzdD?=
 =?utf-8?B?TEFBZXQ0b3VGa0pHUWIzTnBrTGZmQ0RGZTU5aVJjTWIxMU1MMURwd0czTjVC?=
 =?utf-8?B?M2kyb0R2TVl3L3ZKVUxhM28xajR3QkVMeU5zMXU4OEtodnpkTDFaNlkzdGs0?=
 =?utf-8?B?SlFJRmMrVm9pV1BjNGJpYmQ4WndIWWJ2a2haZjgvSDBnelplZDZyMUxJN0o0?=
 =?utf-8?B?RVl6dmNzZ0drb0orMUQvZWRvUDZaZTNJWDVtVllvOWlSUGcyb2UrSWtPckRa?=
 =?utf-8?B?KzY2aEd3TE91ajU4ckFiNis1S1hhZ0p2ZzNUK0dxVHVrM0tFUW5KbFBnRGN1?=
 =?utf-8?B?ajZ5YmpZLzJLYTdSdnRKLzZnbjdMZDJvbENXSmZYYlJ2TXZWZ0h2T2E5MEdR?=
 =?utf-8?B?N3BoVUdRWVkwN3ZMWVU4RVlWbTlNRkgvdk43dVVydWRhQnZ0c2ZNMk8yYTRj?=
 =?utf-8?B?M3RDdkRvQ0hCeEFLRUM4Q2h6YjBzaEptU0Y1K3FlMG5INlVPYWhLNG9Qb0lB?=
 =?utf-8?B?YWd4UTFNOGdya1NyVTJ2eFBCQVZLYnZUZ242bm5HSGpaOU5CbVNjNWNyRUZ6?=
 =?utf-8?B?TS9SaXhGVDdIQ0NkWFMxeFRhemxGOFRxRWJ6Smc2cyt0SDZNbjl1ZVA4MWtO?=
 =?utf-8?B?bVIvYnNVMHRDdmZHS2luRThDV3VCbERVaWRac0M2cU9uUlNXUmgrSkZzaVov?=
 =?utf-8?B?Njk4WExBK21UeHhYT2dKWm5xM0FkYThJQXl5UFJzVXp0VzFtOXZ1VC9oYTBn?=
 =?utf-8?B?QmpiN3FNc3ZUUFdZWTNuQ0tSRU41Y1JUcDcwK3FMTG13a3QzVkx0UjRmTHFF?=
 =?utf-8?B?VlpRLzBvdUkyUi9nRUgrY3NmMWdNNFlFcDhvTVpTK0tzUHRjMGhSMDc4RGIr?=
 =?utf-8?B?OUxqUFlhTFR4UGE3c05xYTA5YzZWQzdaOHAyOUVkS2ZoU2prbXBTWDk4cUJJ?=
 =?utf-8?B?NitFdlNuQ2ZQNmVzMUZIUnZUM0lTU3VHNFRXODdIb085NkNXRmk0YmRaa1RY?=
 =?utf-8?B?ZFBYWVk0NS83SGJ3eVJ3Y3Rkd3JadkVNZWc2YzZwMXBwWkgydHY3VFBxMm9U?=
 =?utf-8?B?akljcjR1ekY4cU5NdXZBZGw2dk9vbDkzRkxneWdQb3dPNFF3aXB0a3R2S2hW?=
 =?utf-8?B?VTVwbFBINTVGZ0h5RjBnZGdQUElVRmZQZUluVStISndvTDd5cU5LOTNKY1Zi?=
 =?utf-8?B?RWlFUnZWRGswUXJMS3cyWHRUNWI3b29TREFqTXV1ZDE1ejdJbng0ZVVnWmpu?=
 =?utf-8?Q?Ppm3gma3DjSftMxo=3D?=
X-Exchange-RoutingPolicyChecked: LMBeIT32h49ecvs0Zj89HfCG/Za9hgK2wW4noGXZkQ9jciozPRUtFV/GJf0LQv9F70OBEYnzOyni3tRDQQj/qqPHDcu4NKhp4L1FlBhBr3Ap920CQiTueFec7WBV7QBF/b+h6PmnM/G2DqWOgxyoBaCTIl5DB1AGwAB/UsPMlskoMIJDzRCBBEiPs7m27a8p/2q0or4Q1jnzbGYaF31Irc79geniSCbsjf7UatWf6lekgHdK7zj+4OoDfynt4vo8ONqa+8NtP/dkVTlGwf8Vcmk0SRqL1p4CvHCtSs4LYd2OcxcmvfSnqsIMjNJJZgwEInH+OYIMqkNETDNyqFCFZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 254b53c4-9d8b-42c7-94d8-08df474e16de
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 21:34:42.9608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SUWvonP1Yssx1bz0IZ4WF+Q8Voja9M0EtsJiGCHkl9SY54+lJqjXPcBMMdN3RqtQds5Xr7X0CB2YIG3nRNjdkRu1qWlalp+xUx0YAg8hb5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9724
X-OriginatorOrg: intel.com

Hi Juergen,

On 11/16/26 8:02 AM, Juergen Gross wrote:
> Switch all users of native_wrmsr() to native_wrmsrq() in order to
> prepare removal of native_wrmsr().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
Thank you very much for the changes.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com> # resctrl

Reinette
