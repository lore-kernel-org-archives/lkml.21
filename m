Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795298927;
	b=A7wh9YNPsHQkiy0SE0NJg4GAJEM9oPd1IjZRpCMKj0Ud1mRzxf4L9RmOekTf/IDrSCFg
	 sx5m5af16CY7bXksV8kKO7PGoXPdmPVHpHewgFQK20Coy9HEgHgvqOsjstWd22OHLwNwl
	 McYfuelVf+vxVp6wzgfl/3Rs+zzVP17Ij3TA5Qlg6H1wp7nGqPn/kkUfmaep2xlcCpDIz
	 f5mBltgq8kmDHH28Hah8EGY1N5MXR7Sojk97SH1u55hUcTRFf9BHEQX/qzQ4H40KxMKh2
	 uQ4evfux1I0j3tmzruyZo9D3fg64xZ1jNknUKl+AdESvxY2TmCE7I6BNFZYjozherHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795298927;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 From:Subject:To:CC:References:Content-Language:In-Reply-To:
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
	bh=TwMPdbFO8JpnbPsp5RaYrTVm487IIAc9Oorswmm1ZoI=;
	b=JkiKBIHkqtx/zSbQDEOvUXA/Iq+x4yO6f/NPXl4fpWKDxfeE0oseRxKnCzajzD/fekSM
	 vlhi2lOHcdSxwipyfLDyE9hQ1qXCXNDtaTlzWWAfSiBnHzZipYm0VdxYqOKJ6FBVyCVY1
	 CPPU6ruAhGm/WsDC+hzJS2hrPaVW3b0WOqbUDpGzaGf9VendntEgaHhX/lUoE2L7XTc5t
	 kbOwsZ1KWpTuAOKb2Z/4SzyuoZhBuzWAj65eCIcCsb5KYA8MEqKAh3Mqg+jv3YYRmlJMj
	 43eDIxis9Lvgoygqfh5RDACtMB6swWUqu0TuumoqzC643hBQYl43UvBPwSQlcpMTv2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="A/mEnjRe";
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=WTUBOMoa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D831B606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D831B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A/mEnjRe;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=WTUBOMoa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795298927; x=1826834927;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=A65ET07136036t8yb0Hb4gF8zzDAaXZnHGVFoAmgRkM=;
  b=A/mEnjRe8fmgTvVzQfvHPvShQyCZpbS3Llc4eoBNiUCQ13iXwgXCCGM3
   N7Q4qY8FbetcNIG5kuGvCee3NlM+o8fEcIWB1tIRPz0eqqhlp+WvqM18i
   RY+GnURVkIQraqlxR5JcA0jaqJFgliSGi1vohONUukw054Ta0JbGrOpO5
   hglRXOoWOXWnPKHr9KMDtu7JmTN5+mIjVgv+b0AuV0YxgYrF/mLIbdZ6i
   WfOi7NRW2ZI/4AL6UpBRGz3/7LFwSsVcK8ZEvwLVkDOF7fLE8BnTEV5j2
   pyr0HhSZwMEw8wlu+V1xx5S5Bgk19faW73LRdN2DF/7BtekwmmQaaD7+i
   Q==;
X-CSE-ConnectionGUID: VoTqQkTbSLOKUOaEB/cfeg==
X-CSE-MsgGUID: D+ef0LK4SAqSNRX/oYS79Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="3994644"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="3994644"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 14:08:46 -0800
X-CSE-ConnectionGUID: VIEdkr3VQwa15G+f/UM68A==
X-CSE-MsgGUID: c1ZibTo1TIyri74+WbWxvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10760799"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 14:08:46 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 14:08:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sat, 21 Nov 2026 14:08:45 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 14:08:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFnxw0sxpVvnnYxdrfCnUMXhu4S4Tmq/6mVRSxSsFGnG2Y3s/s5WV3iUGDnXiiXWCbrCi+TD6A0GscFeadMv5T38H0L1Hov47jE5jI8ve12qyKQg8b5pQzvWWUiLsbKNtmwKTPRtzH2VXVAWCdSNknaoif2CNNQJ8tD7Ia45xmFbEomSCTbctZXRdY6KZHPcpsqAo3K0MVwiHx//EfNvn5d29A7zDsVSLW4pMabw99LlD1ChVzy74sMerQuASzpE+pL5roocEftOoB8a4phoD8R50JosLqhJrFBRlxwd5FZ4YZQyATRu4Hltc323QWrK9xIzKJTpcq3aUUkBgK42+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwMPdbFO8JpnbPsp5RaYrTVm487IIAc9Oorswmm1ZoI=;
 b=BoOrYjvTwFx8ORU3mb2zBd28LkQmyeIshcQuatzIy9tUgasfVdLEgCo+gsMdgaR0hsN55OdZRPfe/T0ehhyARkzgB6A6qG3sxaDZ/M/fEWNymzPBifiu1y2qDtmxw5Fuiz3B4brpFnfblyBfk3X7cpYXJ9GKTfC8JQAi7i/+Znha+H5Qx4FtUJhLj/9KX3E4BWbAcecp6R0UPoJBAmnbonz5C9ze72o2pRPyleGwpnhqupXriUz3obL0dIS+kJ3+ctrlsp6ZM/wtvwlyL3lWy2azq2oh1AWpqR5JD52ZDI5o720VKCr67lPjVo2LdCFTTyTCI1KBTPBiRfm/pJ/NxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwMPdbFO8JpnbPsp5RaYrTVm487IIAc9Oorswmm1ZoI=;
 b=WTUBOMoa9aSdnzm35G7ym9pCBpVettOzklL9o1XOmDsGbpxjTVdzJAidub1tZBIKJIN1sxwChDNPX0FfhCMWehqws7knG11FlYBAo9pyM939ODABuk6qd46h53d0/NcJXc+BZGprndKoa7ynh8u3EMHafpMZtB2Ypy3sGZQrsb4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB819107.namprd11.prod.outlook.com
 (2603:10b6:806:518::11) by PH0PR11MB5805.namprd11.prod.outlook.com
 (2603:10b6:510:14a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sat, 21 Nov
 2026 22:08:42 +0000
Received: from SA3PR11MB819107.namprd11.prod.outlook.com
 ([fe80::e8cf:3b9e:d98:ee2]) by SA3PR11MB819107.namprd11.prod.outlook.com
 ([fe80::e8cf:3b9e:d98:ee2%6]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 22:08:42 +0000
Message-ID: <88456eb3-9c58-47b5-8dee-fc6ad79334e6@intel.com>
Date: Sat, 21 Nov 2026 14:08:40 -0800
User-Agent: Mozilla Thunderbird
From: "Chang S. Bae" <chang.seok.bae@intel.com>
Subject: Re: [syzbot] [kernel?] KCSAN: data-race in fpu_flush_thread /
 skb_copy_bits
To: Dave Hansen <dave.hansen@intel.com>, Marco Elver <elver@google.com>,
	syzbot <syzbot+b07ec23d35be305855be@syzkaller.appspotmail.com>
CC: <arnd@arndb.de>, <binbin.wu@linux.intel.com>, <bp@alien8.de>,
	<chao.gao@intel.com>, <dapeng1.mi@linux.intel.com>,
	<dave.hansen@linux.intel.com>, <ebiggers@kernel.org>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <mingo@redhat.com>, <seanjc@google.com>,
	<syzkaller-bugs@googlegroups.com>, <tglx@kernel.org>, <x86@kernel.org>
References: <6aff5b8e.4ea6388a.d0c9.0001.GAE@google.com>
 <CANpmjNOBWLCJZsyc2WZoOaF8QOj8a+yE0Puf6skiLNbjUrANjA@mail.gmail.com>
 <cf3c512d-5b02-46fa-b1d3-a1a10a1f3a8d@intel.com>
Content-Language: en-US
In-Reply-To: <cf3c512d-5b02-46fa-b1d3-a1a10a1f3a8d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To SA3PR11MB819107.namprd11.prod.outlook.com
 (2603:10b6:806:518::11)
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
X-MS-TrafficTypeDiagnostic: SA3PR11MB819107:EE_|PH0PR11MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: d303006b-3874-4a5f-f1d1-08df481c0138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|261026121527099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|261021121427099003|261102123227099003|11063799006|4143699003|56012099006|10067099003|260925022911599003|260925021911599003|260925021311599003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HvXsNS4HlNG0K46UIMLHnMput0ppvX3c2TPCjECy6E5DamYasyRc8StqiYxDJh0gC+NHVlhO/9opvgOElwXRMnqbA321oQzI2G8eMNdujW42Ouj0AekgBOutTHkAO2d7Jmi4PzHG36Fop83uaSHeio4NSo2/15eMfTcO0PuGFkYTS1sDhbZ3TQtrNZjuWRZ4FHqT51BspUdVo/ouUJhHSRrDkoZlb/fo2P9vHKA9BHbgObSVwl2e9dK64D8Q8JwRf+YfoXAxkov1u/JLy3S8PJBm+zvG5zQ1o7vZBj7qkodfWmsPMs18TutU4q9yJreBjmMgnddFrDWpAPRpXFgbbb36ygFnlpKpbIKBsLU7GBxGjhrp2XvgKgZjnxdeAN7mA3iFkuokgHFDQe3axXs9aV4QPRrFFBFRjJfebOhTnQ2vUJ4P1zmhfg7HORzKvrnRXIiqE6e+8N551N3Z2aJps+oG//wfvEen6at40KSmUEe3mWxXjHuca05Ly9WxgXDuySKHviODGiuC5gkt36JP2MT6jRU/tZetF8Y8W3XrEJ6BZBx4nWN+/zJE9ywj7KRjR02LEp/zGHmLA6dMqH8IKhePsmxHGuLvgxNEOkC42gGk/7gR3I4lncmmjc17OeMr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB819107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021121427099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blpGWkxVNVlwTER4NjVsTGxlYytkcG9RL0pmVmVzYm9FeVlUSXF0eW4zQUNU?=
 =?utf-8?B?cmFxaTM3MkxEeFR0OC9PcFovT01qcUR6cFhoTlF3dDlsRW41bHVFODBVMlJE?=
 =?utf-8?B?MVJMd3hhZmQ2cDZSR1VLbElHbWpJeE8yV2xHMkx0eThZTWFpSmNTdldySExK?=
 =?utf-8?B?cU1ITVVWMWNEVHFDTVJxWUt2M21RMlkyVm81dkNUNkNQMjVrb25EN1h4bTBa?=
 =?utf-8?B?TExUZ1FGdUJzYzkwZWFKM1RUYS9FcTU3cFVrNDUxNzJ5SE1JL29NclJ0SVE3?=
 =?utf-8?B?S21iS1VLTGJGUm84Unk1MGRJRHVnMFA4OVVqSjdSdWozNk1UaGxkR2t6NllF?=
 =?utf-8?B?cVRMY3lweElyQzgvWkFZTkhGSUFnaWFMQXVteVBtOE5QTTBSMkhpcUNwK203?=
 =?utf-8?B?YXVmcURKcUVUWFNPRFNZU3ZmK1FzY2tZUGw3U3AvRlBXZGYvSU4yeEhDTFRJ?=
 =?utf-8?B?RW9iMDc3SWpFK3Y3RUlnbkdtUWpTMStIejhSWWFlSEc4QTdqVEFMMkRPTkpH?=
 =?utf-8?B?dUgwUzI0Y2tPRnk0ekp5NW9BSFJ4eFBIR3lVYzVteFJIVjJQVmx5R0VtalZx?=
 =?utf-8?B?eG5mZDJ6VHhnelMvMWx5VGErU1ZNRG5FT1JiVHlnZ3NCR29uTnMwTWgrWUJY?=
 =?utf-8?B?dVVZSnUvcUNEcTNSUUJBZ21acExlMXVxOVlvRVhQZ0R6eG9xelp0MmU0Tk11?=
 =?utf-8?B?enBUMDdTdnh5UDRteVBMeFBmQ2MvUnYrMnBiRVpTUng3ZkpFMmlqL1NSVm5K?=
 =?utf-8?B?dlJsTDl5ZGFZaWd5cDM1ckhSZkdZbVJqNElpQUFtbXJTcitGYjBqVVNzSUdk?=
 =?utf-8?B?NDZvZHdBd2NuT1hLS2RBR2VEQzVhQ2lNbno1N0RWaEtIcmFTRFN0ajVnQkt6?=
 =?utf-8?B?Q0V6OEwvTjJkTkJvNlZGNWZlNDJtVDB4UURkdDNFd2Vod0FFazhlQ2FTNVRI?=
 =?utf-8?B?dUQ5MEdSWE9qVlBSdEtaeHNRVUJOb0V6amo3eXk3MGN0cXdjdzdDZVM4UGNw?=
 =?utf-8?B?TEF5bFhDZVVQeERHYTRmUmFkVWFuQjBKUXlMTmZSdzYrSkwyWXMybWxUc2Nr?=
 =?utf-8?B?UjZvU25Sd2JmVTJaWnV5dUVaeS92b1F1bXNCbUZ4Wk1EM01Eemw2clFSckVM?=
 =?utf-8?B?SXVGaGNWaTZ0QURqM3JXT1E1a3p1bE8zK254TXpGcDNsMk5JQyt6ejBmSGJy?=
 =?utf-8?B?Wno4UE91TGQvZzF6aXlNbTAyM21PSkJ5RzRrMUxSb3NiY1pENGV5Tys4T094?=
 =?utf-8?B?RjBBM0VKNXZ0R0lkckkxemNxWnpQR2ZlSXMxY3pGdDRySDAwMnBXN0JsU0Fw?=
 =?utf-8?B?WmNQdlhocmFpY1JYSnZqejcyL0dsTU1LMUtneDc4aytuMjZWZ2FGUW01Z0hP?=
 =?utf-8?B?dkhNb1M0RlVoTCtOZjdwUlpSbnJ0ZDR2VjFwdnB0RGh6bjFGaVF2NnBubndv?=
 =?utf-8?B?S1ltcmxrZllCeFM1bUVnMy9qMXNKdTZucEtXQWNYNy9EcWhSMHZyQnNmUFVE?=
 =?utf-8?B?YmdJOHA3TzdtRCs2cm9IazcyV3hHVzd2aGRtcEc1QWpxaWpsa1p6VFJiQm0r?=
 =?utf-8?B?UGVXTytZc3VFQjVuSTJZTXI4L0J0aXFnV3dpdUY1THdNandXekkzVUN5M0Nk?=
 =?utf-8?B?VEVQM1RvNjdGcjhTV3kxYXNuN2JVbXB0eURUVHhBdTY1VFlyZW1UK3lzUnc3?=
 =?utf-8?B?Q0Iwc1dHUHFyc1RDRXlXaXJRdlFwVkVPR1FsbTdiVEUwcTRaRkxqenlqb0hQ?=
 =?utf-8?B?TzZpeWZmREszdzJRcjFrVUJNMDlJRTZkR2lCYWxsazZzNThkVGV0MGNXTVIr?=
 =?utf-8?B?OEx5ZlhQeWhLZ1lvdjZYRkpNU3ZoNmlZUHUwOWhaMUFZV0owOGozcTk1amdh?=
 =?utf-8?B?STNkZm1SODlrWXNQZEUyU1pOZlhjcXhFVmdyTGxYWW1lWVMzWURHV2N5TTR3?=
 =?utf-8?B?UzROQnV6Tmxqb1MvcWdCSHBkVFhWQXhNZWpBdzNVWDFaSnRpWk5PQWtqYTdz?=
 =?utf-8?B?SFlzdEdMbHE5Mk9nbFZSaytxdkVPdnRaZmUzMGxjejMrVDJWSTQ4N0djdnpx?=
 =?utf-8?B?anpWTE1lSVhsMkRweWw1M3ZQZm44T1NHa1JBcUNURnBuYmZaQW14WTFJR2w3?=
 =?utf-8?B?ZlRTVEFXYmZlSmduNlBEb0NsbEJTQkRXRW8wQ0pHSmhkUFVidFQ0UzlEK2ww?=
 =?utf-8?B?bU5xb1o1eWVzR1RUM0I5Sy9LcG5OUjlwNU9iZjhaTm4xc3p4SkpkMGN6RTZu?=
 =?utf-8?B?Z3FFV28zeUI2VmUyWjRZUmRJTG53WE1OTjVyVDZicm15K3F3UHlyQlVrWTBS?=
 =?utf-8?B?WUZoNFVSbjhQdU4rUTNpZWFDajdqem94VHdOQ21MSStETndOM291dz09?=
X-Exchange-RoutingPolicyChecked: IvTmbalB3FDdG7meK8Ldb11LUXEgNrhi2Qd2QjsH7GY/zCwsKm7SXNYw709kPaAG1rtJ1eudStYB2tinR0Ia2wUPr3XOy7Dib2+aP5s72vH4SWk4H6eD/O/XQDg6MJj0QlbigLF/XP7sYXD5ym8SHj4LGhIBf10IhfFIMBzCKV+IJc3O1HRc4uU6Bm+fjJtY1nzLkczc8C6kCfPPRyGxe4FavaHqfNS2Q257fmaZrUVzVZMAQVizlf7cW4uzaKZ2549efd/xTMiUgSzH4TkIHD7Z4kmC3EFm8rJyPwR7F4zLzzKLZ4rAKucVUjfqvNyFvVnlXTDeN1/0+SCb90TJkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d303006b-3874-4a5f-f1d1-08df481c0138
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB819107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 22:08:42.7714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pb5rwayP86nxz1kYvJL2dms93EbBIB1nu1XMtSH/eXtkgj8TijX8gTvP5WrXt+CW3CjfJbfCMWlR5DBKtip4y3md2BxBiLsWbxJ3bc2YW9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5805
X-OriginatorOrg: intel.com

On 11/19/2026 1:11 PM, Dave Hansen wrote:
> 
> Chang, any chance you'd want to dig in and make sure this is a real issue?

Commit c20942ce5128 ("x86/fpu/core: Convert to fpstate") had the update:
  /*
- * Use fpregs_lock() while editing CPU's FPU registers or fpu->state.
+ * Use fpregs_lock() while editing CPU's FPU registers or fpu->fpstate.
   * A context switch will (and softirq might) save CPU's FPU register to
- * fpu->state and set TIF_NEED_FPU_LOAD leaving CPU's FPU registers in
+ * fpu->fpstate.regs and set TIF_NEED_FPU_LOAD leaving CPU's FPU ...

Previously fpregs_lock() was required whenever either the FPU registers 
or the XSAVE buffer itself being updated. With AMX, fpstate was 
introduced as a container for the XSTATE. fpstate.regs holds the actual 
storage, but size/feature/permission attributes are metadata much like 
the XSAVE header.

Thus, the comment change makes sense and most likely intentional, so the 
attached change does. Now, commit e61d6310a0f8 ("x86/fpu: Reset 
permission and fpstate on exec()") which looks really ugly and mistep in 
this sense.

Then including fpstate_reset(), fpu_reset_fpstate_regs() could be 
renamed to fpu_reset_fpstate() perhaps, as it now has only one caller 
following the recent cleanup: ab05214025ee ("x86/fpu: Remove 
MATH_EMULATION and related glue code").

The resulting sequence then becomes almost the same to the one in 
fpu_clone(). Given these subtleties, it might be better to combine and 
centralize the reset sequence if possible.

I also think freeing the old vmalloc'ed memory after the lock release 
could be included there. So a bit of surgery seems warranted rather than 
the on-going one:
https://lore.kernel.org/all/cover.1793604327.git.weiguixiong@bytedance.com/

Let me prepare a set of patches if anything else.

Thanks,
Chang
