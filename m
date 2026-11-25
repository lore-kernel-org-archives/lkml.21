Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795584102;
	b=pcaUA3Te1xsaUGAeOb3Pk6OYnaw/nEL7acoDqCOFvbYQiEsR0jf2+T3vP3eV+CKMxauX
	 LjMmnNzsIxwCxmcoMVkCjSgcL/AnU/GMv5D5tELQltE3xZKVlCANydSmnLTv7WVtfKYJ1
	 4IENd5Zl7JUfVoDiAEBwVi/d30QC6LN0YimmqxQk7z95u/cgq1mlXdJzBZxoK732v/otD
	 2sKzOjzvAq6DL4ukM6s1cEj9CM9HYfy2s3vZSThgRrOfkqCFH1eOTsi4ChzrRPfI1JiEd
	 5jwTVwyzM+A1/R1eQsASE1538FJ+44b/f5m2GNc4KFbxcM6pD/1qhy6ivzDU5WqCEPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795584102;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=fChCVTA37l2JRrOcXp+BQVIISSx5Rx+ZZDD/45wEDd8=;
	b=suzWanX1OE8YQA+ox7o4W4uyOwYcvwc8VJ4vhVEAT9P529HtbDX5atQYLhgWeztMLU96
	 shs8456SmkrVTM063A499lOTPGLtFZEcTeP+LMpAihF/peRmH32So3G1QXq9LZSInlLHR
	 xY0QBeYhSq90WDmBsnXMxSzrbv8LErGncGaj2yEbnpS8S2MVTtXSzfqCo2s1bjR4OqPDR
	 ReVUPRZDjprC832JZ71FIe0YVGMV142wPiQYrNXcF8QTz3xYeUrTEqA8NUkGpFHlIbbma
	 e4VwKUNBS4iJLLuKOsgKpYHGyHZc2PBGzUIRmi8GzXBhCDq0HDRsLMUXY8+7luedzFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=boTUOajJ;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BmrTCvL6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410B9606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 410B9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=boTUOajJ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BmrTCvL6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795584101; x=1827120101;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=hvB+SE1sxUKuKh+d5Dxlxctts09uxxV4PfFdsj2tSQI=;
  b=boTUOajJoKBxpwLWNaE8veYkz/8gRUu+lfYGqsCRuGEHW21cHjTMgE4Z
   bCyEf4VEoe8uDLtgyGgodglhAZ+P4SKXGDFCEucxeLUksDz459KJnrkaN
   AowlkFTQwJGOEyIEnE84hqDNXDFrjx2Gsnd49mmpiHwolHWBaciuuKVz5
   LPM3+H8idqT6cdpkpCfuCMMXcXTIo4DrQSuADEdvY48cc+OHzLHqh+8UL
   XluTPScN+bkt5iNYmhZLIZ7i7mEsehfCx92GhQzIlMawzJO2o5wrD+Pz4
   9+Nhx4n4YDfsitJ+4MKPAuVXnCGOEUmuqjBYcIxI7cISaScX60TlBUjyU
   A==;
X-CSE-ConnectionGUID: iPwsIRMZRuCbhC/yvcTeAw==
X-CSE-MsgGUID: ZtsRIp2lQGOpWL4juvOfAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4529135"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4529135"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 21:21:40 -0800
X-CSE-ConnectionGUID: eSFwmCtVROKu1JZDUoMIHg==
X-CSE-MsgGUID: 4G+S+FKESHuDTZhz9vA97A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="12205684"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 21:21:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 21:21:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 21:21:38 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 21:21:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKdu1GYGqC5W28E59IQE5dhJotGDea6xvxbsDwNHS31g47gh5oC5ziGWCRx864Yg7HMKLBcdNUYZdHynNWGl4w5B4wqdar2YCzWNAkvJVW5gruQRwY1N1g3q1H/kP7/OGEHoou8TeRIGINLG2Emy7C60ih0Z0RDIcNkmhdEwbEqznPCgvjNGh9m7f8m97T3eYTSBQdnfu8big05/hXgflhoLHWrj2ThrQLANcsBZtv5R9/JD3YkOM6KooIdEpiCXvpjLDl9bHCSDNBX4k5Aj+wxd4dSmdpy38aZj8/8h+QKOK+2p/wzJL3sncQR88Dn5SQULN6rsss6E05xsBGUoaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fChCVTA37l2JRrOcXp+BQVIISSx5Rx+ZZDD/45wEDd8=;
 b=NN19x4/jSS8LQgElbEyUNEXGfD6gH6uBKykeENYAlTcxRTSdxuAHrOQw7fQySLKT2oxJgUcS+WwWu8mVbUConpP8BnGmXHGj45PmtShraVd2nrjdVL4iPduy/xZbgDoLUNn41VepZB3D/LHW9NpREg/WZg9EBCw8Bsyzd9bnC036ODGXAHOUTYJubH0E+RZeRPMp7sPeUhceu/mSOSHtyOoBgfeuAwkCItGyegnX7oaRUPpcnCqmVuSG61ZWpv/JKczraOmEwSDZgj08uik+nK2O/ICycLSwM9atwmyki2M60efDHp+NO2GqnZoyQzg+VF7SOGPBy+/1BEeqEMhCdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fChCVTA37l2JRrOcXp+BQVIISSx5Rx+ZZDD/45wEDd8=;
 b=BmrTCvL6sAABNXCJD/QS2Qxi0W7vXEjUt+PQTkAxNEbPOWYs2mhhqjJ67sJIc45fg9tnFXFNOt5mMl3ww9saaYgJA4JCZwZnwWtll0Qy5MBLIxgU+7aW8lp8CjgTRT6vV6ZfRFiKPx+1AMJksglia0dVe3OQGHjSWkwZvIeBpms=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA1PR11MB8812.namprd11.prod.outlook.com (2603:10b6:806:469::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.6; Wed, 25 Nov 2026 05:21:35 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 05:21:34 +0000
Date: Wed, 25 Nov 2026 13:10:31 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: Tony Luck <tony.luck@intel.com>, Ben Horgan <ben.horgan@arm.com>, "James
 Morse" <james.morse@arm.com>, Dave Martin <Dave.Martin@arm.com>, Babu Moger
	<babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>, Fenghua Yu
	<fenghuay@nvidia.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Borislav Petkov
	<bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, Peter Newman <peternewman@google.com>,
	"chen.yu@linux.dev x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v3] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
Message-ID: <awZtxwVxIRx/oyOB@chenyu-dev>
References: <b06e1fc2-87f1-4004-8102-c8cc8928345c@intel.com>
 <awOwIrJLVLJJVWNq@chenyu-dev>
 <c8f156fd-bf29-463b-9b42-fa572ce87c5f@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8f156fd-bf29-463b-9b42-fa572ce87c5f@intel.com>
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA1PR11MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 5936a37c-a386-4222-c809-08df4ab3f8b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|23010399003|1800799024|10067099003|4143699003|56012099006|5023799004|11063799006|261021121427099003|261021135927099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|261102123227099003|261028144727099003|22082099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: GyZaCDtkeGz/tz8krYyHCXzJvQnfm7PoY5FgaOgQplIQfWGFhY8o2OQOBdNUdEd0QDBg+d0f9IdMyjUnYEH2G/L4U192Lbud+nZXyWgoun4/c8el85hae+mKT1PluXhui9goHQSbCEZIclgYEtlEDcHBv20H/MlSNCmRc+Z20paG7QxLBAvQlefztsZ3W/h6Sr/dLIFDW8UwnoLcuY6IALHYVzBMbq73ll0RLI6I7Q0cdVZKC3aRwDDGRiGRv2Rt2N/Eue2HZr6ImJDJ9RtkbUnxM/BE5fxA1ycqda3LrmAIPRLc/ZXKwK2WD1WAxQ4ObyAFpmOx5hBkNMjSg132T12JrCu4bzXw3ipz82xqsHobzjJiiCtOJzlkTcQ2V4HvKkl8iAHePGgkq2EXkx7uEOUBp5+AxUgYobPHCNyod4dRlgCuKoRr6o49A3V5xXuXUrGmGEC9vU50qbyy8dmfA38Sr/JGoc4OJeqddzJ4q7YSKLy8q0xdvQrITmZcmHEbdHkpnOCA5+Ujc0i3RfngGMarRacXhea6P5pc69dcewUi160SE2W86yl8tAP/QSP9epOmSGoxR0Ptf1OVBLRET0zApBIJqA+ZNvPi258ZMNxVs/uu+FIJF/qh1+WUqnTn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(261021121427099003)(261021135927099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(261102123227099003)(261028144727099003)(22082099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KTqO5ObV6k7C6W819BbfUpiT5n3qd1YIkk2mf6Aguf8VCbC6FFMuxXuCEBv1?=
 =?us-ascii?Q?u/Pe2vykD22VOLlJQjNMDcvRg7kznZ/AqkPyrXJL8ghYJyONAdxwk075jtPY?=
 =?us-ascii?Q?V3Ab2VaCL4akxMoepu7pfevuFbaAI4cf5wJgJ6vQki6iTwooPCGs/3aEmmvV?=
 =?us-ascii?Q?3yg445cHs6jQljxDj8JgjY+kuN7wVMv+YEdO+3Fg+z9WIBh5/FY3nOtLRQ0z?=
 =?us-ascii?Q?tof+TUUaAoBK63Ya/hqTowTMa6TRzzjseVaKZ2xfBtUICKw6jIOuJyyrMAOM?=
 =?us-ascii?Q?GkQOYebAIyTeQjFiYMeyCwgNX0C0CXUpv7YDsEr7Ee2ALDgn4oJ3hoCvd2x6?=
 =?us-ascii?Q?9ByzCZVbEWTZnoSIVSohXaNkr79Pz63Zz0gZvFUTqGEWED/NT7AB7U3WyHio?=
 =?us-ascii?Q?qBD+dAHOKx+66yzJcCsaEHkyIr5bt0G0qok0sDuXW64/xh6I22ObOhhoon3I?=
 =?us-ascii?Q?ddetj6EWVObSiU9AakFRcrGekQFcyqehWdkCg1+hoMy08g/wb1rMRLqG3DuQ?=
 =?us-ascii?Q?dinGX74g4vYDkTMiExPYHrIPXWBbbCRGVkhpxOybhdc8UPSfLKAMaSPV1ycP?=
 =?us-ascii?Q?h4VwuFzvEDrpHDhV1W0TuRDXYHOJcRpz7WUrYQwqFw3HIjZb6TUSjZszpQaR?=
 =?us-ascii?Q?9RhfHRvtdsx1N0LNapWWVZZHExgE+MJ/XzHUKIeoXNivUBMZ7OFm68ZJFEQa?=
 =?us-ascii?Q?nzcUYvNa+/yICPpkFkxEVCwveIx862tTvglNRHPc6TpgW3uTyyIpjEKKSx13?=
 =?us-ascii?Q?wWgtoeLH0wpeIKfs597soUcXrvyG7fjqTPhIp0YvUOnRcFmOOVPwA+yWMc35?=
 =?us-ascii?Q?HIEKvPDZ2T/XFwMdQ4dzjkICcDTR2Wya/ut4+5dr1e7MGx6DEO+oe9j3WLQx?=
 =?us-ascii?Q?NBDP1VJzNBbCHS1xNeEYv9YzBGrVU8VfNyz4tj14O4jXx5gFNIuz0hkzER8W?=
 =?us-ascii?Q?XPTwwWZ4/XNOlOmaOhJOefuRuQwGy7CPy5P80n/EzbZPgfHBb2X0NU6NVoxI?=
 =?us-ascii?Q?qVk/W1FoPwC+PRQU5oP+xnMWAbwG0txZ7hyzr7OzxBrf8/NgEPxYLxbCqEeZ?=
 =?us-ascii?Q?vJBUW624boAtBNBsDvpo0WO1DIf2W5p8p+AetbZB4TnBq4G8ocbQRY/y2ls+?=
 =?us-ascii?Q?hS2sMQDIx8KXqDF7YnegEr/LaIPJ+y0Ac0wof3AAUP8Uui4ahAv771gLaXLL?=
 =?us-ascii?Q?MpuezU3fdjgm6+OLgl3jO3VlunT7vQvbvjcbu+XfHetI4jO6JIDntbwhIAi/?=
 =?us-ascii?Q?AwzvxNaTxAEF3cz9GkJYi+rvYoYK1MZJ+ewFaW8t5NvVFnNM6XZwqZfJWSaV?=
 =?us-ascii?Q?BxN/LYV8ph9mc3gC0jv9Vv0pV6+2TgZXtpI6I+62vJp3aiEU3uwhTg5EXW3v?=
 =?us-ascii?Q?3OVWoGMgfxK3k5DaF6+v74rqMZkwwxgkn4XTHleHNDm56O0MOSy80QjmSOy3?=
 =?us-ascii?Q?DKK32A8wLgJvrjGmaBXgwYEzJOM17ovT16RpED/imhkjQL5NzwSAKysQrY2A?=
 =?us-ascii?Q?uJ7IyUqbVR9+DsviLFg66LwkwFxuClo5N/odtOJqG/CHAyjVBmlZRK4hZnk+?=
 =?us-ascii?Q?Ghmg8op7RixT2jXVP7yYsdAmlCYB06/f2yBxGbAioKJRnF4qM0LMcu6l2a4A?=
 =?us-ascii?Q?Gx7OTq9VkGYees1xZX0d7bX0OdENd5OHCGFID5C69Exwa5mkluxpuHUUftjN?=
 =?us-ascii?Q?554KwksRlHAwc9IRAMo+Sp9IM9PQp1p+01NTOq8++hmh89rK+VU2KAKCGmlg?=
 =?us-ascii?Q?IJPhiNZV8w=3D=3D?=
X-Exchange-RoutingPolicyChecked: GLKzdBJbtE9tnm67J8hRsihmeMiBd4tVsrW7z+ZPOPusgBTfmh4L+jFSLLbDM1p2QXnV19k9I84hWV4BzCCemTr1Ox976DxI7WHE6qeGrVon0Zm9O6AhaXWYJs9pdG+e7ALugPYvdv+RXD2nNC6JWKSGieIKUMedsMxemwaCx0xxWobV9btgGqv+OZ1X78b2QMrkBjHqiWqTjZSkD86F1vW2kRZpFg8oBZX6F3KgJvscFn9EDrD1VEaaYTXBW2vVwV92v5LJCGENIgZicI6Kzln6eeINBh+ObMHQp4VOk39E5N8PyxWtZV27EEypgup3o5gDKBFSrn2gSW0xB9nYNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5936a37c-a386-4222-c809-08df4ab3f8b0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 05:21:34.5225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMYXjp04hqPA9nhwwRx3/QYc0dn1XySr8aJYMn+rRdrQWjCpwwXUBD328vpgR437bLtTTuMbXJpWS+maj7ti5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8812
X-OriginatorOrg: intel.com

Hi Reinette,

On Mon, Nov 23, 2026 at 08:26:50PM -0800, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 11/22/26 7:16 PM, Chen Yu wrote:
> > On Thu, Nov 19, 2026 at 09:04:26PM -0800, Reinette Chatre wrote:
> >> Hi Everybody,
> >>
> >> I believe that discussions around resctrl's upcoming support for multiple
> >> controls are starting to settle. This RFC aims to capture all the remaining
> >> items in implementation as well as documentation. Please point out to me if
> >> there is anything I missed.
> >>
> >> RFC v3 of this PoC can be found at:
> >> git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v3
> >>
> >> Please refer to the documentation patch for an overview of the planned interface
> >> changes as well as user space contracts/expectations:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git/commit/?h=resctrl/controls_rfc_v3&id=95ff9ff7430095cb7264946c944c750315db73d9
> >>
> >> Remaining opens:
> >> ---------------
> >> - Ben: I do have a question about the formula used to determine the size of
> >>   a scalar cache control. Please see patch changelog of:
> >>   https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git/commit/?h=resctrl/controls_rfc_v3&id=8695aab0997d5aa60e104374fae9701f51156c18
> >> - MPAM only compile tested.
> >> - The same x86 "SAMPLE" code as RFC v2 to demonstrate emulated controls.
> >> - Add relationships between controls. For example, cannot set "MIN" control
> >>   value to be larger than "MAX. Unclear how to do this in resctrl fs when
> >>   considering that the relationship may span between emulated and backing
> >>   controls. This is potentially something that needs to be managed by architecture
> >>   and thus potentially without a consistent failure to user space.
> >>
> >> Changes since RFC v2:
> >> --------------------
> >> RFC v2: https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/
> >>         git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v2
> >>
> >> User visible changes:
> >> - Make scope a property of the control again, now in addition to a separate
> >>   allocation scope of the resource. Expose the control scope via a new
> >>   per-control "scope" file (L2, L3, or NODE) that tells user space what a
> >>   domain ID in the schemata file represents. Needed to support AMD's GLBE
> >>   and CPU-less memory bandwidth allocation. (Ben and Babu)
> >> - Name controls according to the scheme agreed during RFC v2 discussions:
> >>   <resource>_<resource_scope><control_scope>_<control>, with the control
> >>   scope dropped when it matches the resource scope. MB and SMBA carry their
> >>   L3 scope only implicitly, so their new controls show it explicitly, for
> >>   example MB_L3_MAX, or MB_L3NODE for a default control at NODE scope.
> > 
> > This is a little different from the previous version. May I know the motivation
> > for displaying both the resource's alloc_scope and the control's scope? Is it
> > because AMD GLBE might have different granularity between the alloc_scope and the
> > control's scope, so we want to show it to userspace? Maybe we can add a section
> 
> Exactly. 
> 
> > in the document to mention this, as you described at [1]:
> > 
> > "resource scope":
> >         The scope of the resource object being allocated, that is, the
> >         hardware level at which the resource resides and is consumed, for
> >         example the L3 cache, memory bandwidth at L3 egress, or memory
> >         bandwidth at NUMA node ingress. The resource scope is part of the
> >         resource name and does not change the meaning of a domain ID.
> 
> Yes, I can add definitions for all the components of a control name (also resource
> and control).
>

Thanks for adding this, which could help the reader better understand the names.
 
> The "does not change the meaning of a domain ID" is not clear to me. We need

My intent was that the domain ID is determined only by the control scope, the resource
scope plays no role in it. It is OK to remove the above sentence if it causes confusion.

> to be careful here while integrating it with existing documentation where the
> domain ID is already tied to the resource instances.
>

OK. Regarding the existing documentation, I found one minor issue, perhaps.

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index d4a77858a959..d06087af4c61 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -1066,7 +1066,7 @@ only be produced if creation of a control or monitor group fails.

 Schemata files - general concepts
 ---------------------------------
-Each line in the file describes one resource. The line starts with
+Each line in the file describes one control of the resource. The line starts with

> > 
> > "control scope":
> >         The granularity at which the hardware is able to control the
> >         resource. One control value applies to one instance of the control
> >         scope, and the control scope determines what a domain ID in the
> >         schemata file represents. It is exposed via the control's "scope"
> >         file.
> 
> "One control value applies to one instance of the control scope" sounds strange.
> The control value allocates a portion of the resource at the scope of the control
> so having it "apply to an instance of the control scope" does not sound right, it
> applies to the resource, no?

Right, the final target is the resource.

> One useful test here is how it reads when applied to GLBE - where the control
> includes more than one instance of the resource, and referring to that as
> an instance of the control scope is not accurate.

OK, I see. GLBE is a good example: the control value applies to one or more instances
of the resource (1 instance represents 1 resource scope).

> > The resource scope and control scope are usually the same. They differ
> > when the resource is at one scope but the hardware is only able to
> > control it at another scope. Examples:
> > 
> > Intel RDT MBA:
> >         Resource:    Memory bandwidth leaving the L3 (egress).
> >         Granularity: One value per L3 domain. The value is a throttling
> >                      level applied to each CPU of the CLOS within the
> >                      domain - according to the spec, MBA control the speed
> >                      between L2 and L3.
> > 
> > Arm MPAM:
> >         Resource:    Memory bandwidth entering the memory of a NUMA node
> >                      (ingress), regardless of which CPU issued the request.
> >         Granularity: One value per NUMA node.
> > 
> > AMD GLBE:
> >         Resource:    L3 external bandwidth (egress).
> >         Granularity: One value per GLBE control domain (a NUMA node, or
> >                      the whole system with NPS4). The value is a ceiling
> >                      shared by all L3s in the domain. This is the example
> >                      that resource alloc_scope is different than the control
> >                      scope.
> 
> I prefer to defer the Arm MPAM NUMA and AMD GLBE examples to when those features
> land. These new features should introduce new sections in the documentation to
> describe them and the connections/terminology of controls can/should be used then.
> 

OK.

> As far as the Intel RDT MBA example goes, there is already the big section
> "Memory bandwidth Allocation and monitoring" that uses the term "L3 external
> bandwidth". We should be careful to not fragment the documentation by just pasting
> new sections but instead aim to integrated the information in relevant sections
> (if available).
> 

Agree.

> > 
> > BTW, can we provide a control flag that indicates whether the controller(even
> > the new controllers than the legacy ones) want to display the alloc_scope/control scope
> > via schemata? On v3, the region_aware schemata becomes:
> 
> This does not sound right. resctrl filesystem aims to establish a consistent naming
> convention with user space. The way I read this, you request a flag that an architecture can
> use to indicate whether it wants to follow that convention or not? resctrl filesystem
> aims to provide a generic and consistent interface to user space, irrespective of the
> architecture. Passing ownership of interface to architecture breaks this, no?
>

I was thinking if the resctrl filesystem can provide a fine-grained control naming
convention for the arch driver, so the arch driver can choose which option it prefers,
just like the resctrl_ctrl_name[] array is provided by resctrl and chosen by the arch driver.
I was just thinking that for some arch, exposing both the resource's alloc_scope and the
controller's scope seems to generate a long name/format. But it is OK to expose this for
all the new non-legacy controls.
 
> > > MB_L3_REGION0_OPT/MIN/MAX
> > 
> > previously it is:
> > 
> > MB_REGION0_OPT/MIN/MAX
> > 
> > On many platforms, the alloc_scope an scope are the same, and how about:
> > 
> > --- a/fs/resctrl/rdtgroup.c
> > +++ b/fs/resctrl/rdtgroup.c
> > @@ -5619,7 +5619,7 @@ static int gen_ctrl_suffix(struct rdt_resource *r, struct resctrl_ctrl *ctrl)
> >                  * the omission.
> >                  */
> >                 if (r->alloc_scope == ctrl->scope) {
> > -                       if (ctrl->name == RESCTRL_CTRL_NAME_DEF) {
> > +                       if (ctrl->name == RESCTRL_CTRL_NAME_DEF || !ctrl->show_scope) {
> >                                 ctrl->schema_suf[0] = '\0';
> >                                 return 0;
> >                         } else {
> > 
> > [1] https://lore.kernel.org/all/bccb1249-e722-451a-9c75-8aa846713045@intel.com/
> > 
> >>   https://lore.kernel.org/all/bccb1249-e722-451a-9c75-8aa846713045@intel.com/
> >> - Report "max" per domain in preparation for systems with resource
> >>   instances of different capacity. A bitmap's "max" no longer has a "0x"
> >>   prefix. (Drew and Tony)
> >> - Drop the "min_bits" file. The "min" file of a bitmap control now reports
> >>   the minimum number of consecutive bits.
> >> - Only offer, and only allow switching to, "native" control mode when the
> >>   resource has emulated controls. (Ben)
> > 
> > May I know how we can distinguish whether a legacy control can be emulated by
> > other controls?
> 
> There are a few characters in this discussion: the user, resctrl filesystem,
> the different architecture drivers. Which does the "we" in this question
> impersonate?
> 
> > 
> > There are two scenarios. The first scenario is that a legacy control is emulated
> > by sub-controllers, and the second scenario is that it is not emulated by any other
> > controllers.
> > 
> > In the first scenario, in the current code, after we switch from legacy -> native -> legacy
> > mode, the msr_update for the legacy control is non-NULL, so program_backing_controls() will
> > never be invoked again.
> 
> This is just what the "sample" code does to demonstrate some techniques the architecture
> driver can use. Please do not build on top of the sample patches. The architecture code _could_
> use similar techniques, but is not required to. It is *sample* code. There is no intention of
> upstreaming those patches. If you find them useful then you can copy/refactor them to make them
> appropriate for your use - in this situation just modify resctrl_arch_control_mode_set() to
> set msr_update() to NULL when the control mode switches to legacy (if that is the behavior the
> architecture needs).
> 
> Any feature needing multiple controls is welcome to copy some code from the sample patches,
> but all patches with "SAMPLE" prefix are expected to be dropped. They only exist as a sanity
> check of the multiple controls foundation support that does not have a user yet.

Yes, in the internal region-aware PoC, the sample code is replaced by the formal code.

> > In the second scenario, which is the region-aware MBA scenario, the regionX controllers are
> > independent of the legacy MSR-based MSR, the legacy control is not emulated by the region-aware
> > control, so in the current RFC v3 it fits well - the non-NULL msr_update will be invoked by
> > either the legacy MSR-based control or the region-aware control.
> > 
> > The issue with the first scenario is that we don't have an indicator to tell fs/resctrl whether
> 
> ah - "we" is the x86 architecture driver. I think it will be helpful to your implementation if you
> expand the view to also consider the implementation from user and resctrl filesystem perspective,
> bonus if this view also considers the other features depending on multiple controls support.
>

OK, I'm also thinking of the min/max/opt clamp among different controls. As you mentioned in the cover
letter, this logic can be embedded in fs/resctrl(by doing santity check in the staging buffer)
 
> > this legacy control is emulated by other controls. Although we have an emulated_ctrl list in each
> 
> Why does the architecture need to "tell" fs/resctrl how the emulation is managed?
> 
> > control, that list is re-used by the non-emulated control scenario such as region-aware RDT. How
> 
> What is wrong with that?
>

Sorry I overlooked the place where program_backing_controls() was introduced,
and did not describe it clearly/correctly. It is not the fs/resctrl
that needs to know the emulated control, but the arch driver. For example, I
looked at program_backing_controls() and thought that the core of this implementation
is to invoke the emulated control's hw_update if the legacy control's hw_update is
unavailable. As you mentioned, this is arch-related code, we can deal with this
without telling the fs/resctrl about it.
 
> > about introducing a control flag to say that the legacy control must be emulated by other controls,
> > rather than checking whether the control's msr_update is NULL or not in _resctrl_arch_update_domains()?
> > 
> >  if (!hw_ctrl->msr_update)
> >     program_backing_controls()
> > 
> > to:
> > 
> >   if (hw_ctrl->emulated)
> >     program_backing_controls()
> 
> All of the things mentioned above (msr_update, _resctrl_arch_update_domains(), the call of
> "program_backing_controls()") are internal to the x86 architecture driver. I do not see
> why the filesystem needs to know any of these internals.

fs/resctrl does not need to know this.

> The x86 driver knows whether it is
> dealing with "scenario 1" or "scenario 2", and the code you point out is what needs to know
> which "scenario" it needs to deal with. This is all just private to the arch driver. What am
> I missing?
>

No, you did not miss anything. After a second thought, for the region-aware RDT case,
we can switch msr_update between NULL and a valid hook to support only ONE scenario at
a time, and the arch driver knows it. Previously I was thinking of supporting both
scenarios at the same time, and the msr_update() NULL check cannot deal with that alone.

thanks,
Chenyu
