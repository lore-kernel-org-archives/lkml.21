Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795700620;
	b=U+66ViVM8Y9LeQWNBBwdIa7lCJuBTN8Evx+Pat1ajsF6fisEW+Q4PuTvyKYnbJVIReLx
	 aONz6Aly2TQzLDvqx6GFEjLzgqKQIzpM27HCw2gdxahrDGWey7yCOVWRykJjWOQRqf8OX
	 PEjNqskuM1k5hVADrkhkkHRmgrJne4Vogom9GcZet+VjnLjJRoc6Tal7fRUsiNE4ASj02
	 19SYRTIjghBYaoYWdGILjkzPgFKdsu1UImLYq8UcvUnikijAu7PWSxrCYio0QoJCQPnoB
	 yOLqX+UOABoQWc7YCoMnuj53SOMU9YJsFuOJSqqN7if4R4oEviYDXl6ToaoZVsBxDfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700620;
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
	bh=neCeI2GB6kh57UrLmWNk7KnB/3kW6NTRAdK2Z4AzDZI=;
	b=XI/poViEguGLVUjoD0X5v11p98mdQ8xjvFqf5P6aH0bvLJAbRchJFlyTIXUM4nR8wHPe
	 9REuw0IosRikuKlaJxTaqaykCMnG1nZbCGrrA5ny01qt3MEjNcje3166xMG/ZknN8Rm3v
	 8qnOBGtncJTZxI95VaAjMcsamAhPh9WgNdi4J7cHifWlAsSBz24IIYD6ynXZmjY71L3Ee
	 xNvwRdQBvBopLvlQaom1sBUcN52lBTaO9V+ir4hehvdD8+2erKUCNMiJQOtB1N2Lgds2N
	 f4dObxMLg2eOl+N4arM4TRvsv1Kj1mcx1eXxUbN9wZp9pvTvgVNTmMAyEdNCxlbc3RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TFbjlXV6;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Ca8dCC+5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B74D606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B74D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TFbjlXV6;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Ca8dCC+5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795700619; x=1827236619;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=CiAzPcRYU70mi8llFYOD1g9iQEBT4R/5/IEDPlfw6Ko=;
  b=TFbjlXV6RGlSojTAKOisNIGDPN219JEJSXT/SxyFtez9XBxRwq8IKQch
   LAE9cwO2Ud3OMCRrZdcbDhPgGikjn56SgnUqlV0/QfBk/iWIhI+8HvKMZ
   agPncFm7GHpB3zS1+TA/maZuOYfTcXAkEEXd5uWuE9X9JpGH/n00KGi6H
   6toAfkKKlDbqR5YYT+Qel+6Y8ZcaroQ+NXZmKIGPKR+knovJ5yQvBNWmv
   EGgrzIFM9f2GXdz3CliVOYoWZCkAGJtE99XKXHzazg3fOSfBVYGY7oC17
   jEVYmefbXXhY8jLk+xmal0hzgfo4ds5BRzwP2vhgAdTgUJ8swmNcg0HPw
   A==;
X-CSE-ConnectionGUID: sJC8Ln6gQBCQAU4D2Ve6PQ==
X-CSE-MsgGUID: DFwDGl/5RN6Q8JaCnVGJZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4521986"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4521986"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 05:43:38 -0800
X-CSE-ConnectionGUID: RzXf8bMPRfisWqRi8HesQQ==
X-CSE-MsgGUID: 0j8ay7bzQMWu2AAwXX7F1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="11955868"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 05:43:39 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:43:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 05:43:37 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:43:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILTcxIloN6PTDw0kXiYoVoWLbAnTWTq+Oe80zbQF5fidyQwu6wwV7mCLDQwI/euJuitsEpGJHN2nEHD0wvPWgrXeZjZB+3wxfIHJZjARR2zBHQbeXpLF/zpH+eOKRxFpG/QxK3925oTtq21bd5T7yRTRF/PQ0K19DDqr9WfMK5Wv+3JuO4CQKdmNjMK8tUb0oTh2HhJBgDLpE6KOP4SPYOSgQQG+bhToSjvePzd5BPK/tQTQEOkYsVsRpIzQMVl0OXixBi5U3hvu0+nNqwC1ruK/VmmT1bdG4W2ejz+HOPJZDf2FiMk4LnBB7pOHMGjPDzYejyLHJ2VWHGOpCYUMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neCeI2GB6kh57UrLmWNk7KnB/3kW6NTRAdK2Z4AzDZI=;
 b=qRmYhFVPCxhKDpGKGb+KsQN5R7/VAkV2tJOQuJ+9m6stbaoygnUn4MJoVkL1f/TM1t64g7P6uSCPqrHsgY66YFH3y9Pwd+rnAqAXjiPRYX5yIuO2jH/w2hd39XA0ZUTv52wpQJcrty3q5niQcQ/WH7uXJxSuBEkbLEOCSX3QVvRumztwPL+0Lz7S8jJBXKfdh5Nl+E5gvAkzO5YwEvtIed8pJqEfS1+7imI37qSGtLH8lTuGU8Dc7gL7Di/5RVVJy4CtyTZ0zmq2WX53SoE+nP/iSO8/swZJaiRx4lh68aMB1zSpTa8KfS0A5qV3gXEBabllu+MBM/hdzBro1B9xgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neCeI2GB6kh57UrLmWNk7KnB/3kW6NTRAdK2Z4AzDZI=;
 b=Ca8dCC+5Wk+2/9lUerJK86MI7x3IOhkPv9DAXXZFm7GQoBHv3/k9PxK3T4YS4vv1D/mwtuIeG5EW2rnsYBeY5iXsIOjD2KwdIvRQpAVfKr+2QVgAM6VWxBDOnmt2f6cuCtPetzR2o9HE7d9ERak3D8DfvH8KZSjBnsv+Tct7v0Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 IA1PR11MB7272.namprd11.prod.outlook.com (2603:10b6:208:428::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 13:43:34 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:43:34 +0000
Date: Thu, 26 Nov 2026 21:32:33 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: Chen Yu <chen.yu@linux.dev>, <tony.luck@intel.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <babu.moger@amd.com>,
	<hongyu.ning@intel.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 00/12] Introduce MMIO-based CMT access for Enhanced
 RDT
Message-ID: <awg08RKSjK8gyk6w@chenyu-dev>
References: <cover.1793864720.git.yu.c.chen@intel.com>
 <avrTiSvpFSqLqCh-@three-body>
 <44ec9227-47de-47b1-be2a-575e059946d4@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44ec9227-47de-47b1-be2a-575e059946d4@intel.com>
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|IA1PR11MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 568596c5-3e5f-4f2b-b1fa-08df4bc34436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|4143699003|261009223027099003|22082099003|18002099003|260925021911599003|260925022911599003|260925021311599003|10067099003|11063799006|5023799004|261102123227099003|261026121527099003|261028144727099003|261021121427099003|261026140227099003|261022105027099003|261022075727099003|56012099006;
X-Microsoft-Antispam-Message-Info: fAU3l+jOa8zy2JJBRO+dbcMXgyWScsIBKk4vB3fjAeEtNpvGRG+gthZc2Km214xS9YLs2R0cYXd/+7Dbccs3UVfC9yTOlvM1iB4a/sCufUGii3QRTjL5drraAXOeDcPh8v9NY/j1+7p/5ouzNqovVmJZas+LDZXTyObAtTr06gEyjG9ypDAC/cBmF0iuEC7Fnzbr45iTN2+G3dp7/7bzVgNAbK0lrxkupRkxdJAhPiFFm5Js5aSbL3ugokjF1YNXjFwOtton9m6wx7CpwT/0zgcpqaM+f3H2Uw2Cn8LH5zNFC9rwRSSdOvXXqKmDELFngDGfM/l/p0H/6JW5CS38ZoaE7NqnDYJtUDr5BUm4+0BIuwW3KEMQnZCw6DVbvRN5MItxrh84zLjt/AnPF2w1vcwScP78wAyWRENW+tKONnLPq8HjsI9ZneNNgdaIzjLA8HxV1esnTSyG8ls06baeCBw867+styaHXflUpSt7MGkP6JLz5F4InwHBeXMK3gk+GSZLSMMvdcKUGuDnlVj1po8RgPbL7Es5vL73SB9uNUEs7g5CJ1sJObRLLyvX8Dax2jpYrUfwctPDEXCtSYhthRsBUNhvYYz6M7pwFZZVC70=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(4143699003)(261009223027099003)(22082099003)(18002099003)(260925021911599003)(260925022911599003)(260925021311599003)(10067099003)(11063799006)(5023799004)(261102123227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261026140227099003)(261022105027099003)(261022075727099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q4gtiHHiQl8dSkR/iGZvXa/JUknoFnmPqdK1RR2xJLFb25paausGnSO2pTyw?=
 =?us-ascii?Q?Zdzb4Lgd6tlcDqQG4VLEvfzfvBTq2fhbO45/lcmXjFojypUAW3knEr+EW/C2?=
 =?us-ascii?Q?5zT5hbQyuJNALYD+c0/dW5orqD2rDg742aIokhI+oE2n+j/KrutwmhqK0chc?=
 =?us-ascii?Q?FyKhtMO4JawEuJPM8Db7XkOzQDzBcoqFQ69bMFas+NyDtwyuRLepsUJIEa2+?=
 =?us-ascii?Q?BfEdW6xmVogaB3XobFx2RiLDzZcxABqKLkPoNG0evZCsUVKn5O7/h00JdJw6?=
 =?us-ascii?Q?S92omSGFatQBbeHmv/bN8v/kvt1my4cgAVgOzRMz+sGLhxUxmOYRM/aVhDSh?=
 =?us-ascii?Q?Ir4IiTcU/yg0iiuS0mruvIeDpPk5lcVEtcsi/QADdBR1XgJ1+En9ka/sfAK2?=
 =?us-ascii?Q?g9U3RNhlGOaC3UqvIgbx6wMw+K7vn8R6T8im1DeyHNlnt51IqZOr5iaiGZOr?=
 =?us-ascii?Q?JADdpwzcvOs8lP35o8dsBi7NNdvATgCkBqS6OyDif4MKjQoj0edTOQ63lcVS?=
 =?us-ascii?Q?CqPJepjJ/mjU1MuhShAhPZTQFTs8AHCT2Xuyq8wgAqHXRCDe05i+6AD806mw?=
 =?us-ascii?Q?TH9Brx0b3FwztAjALxBomMYMEevu3DJ91io/uLB3uqw06l2K6UQWZNKA2x6N?=
 =?us-ascii?Q?tPoWM0/8WCHNBAr8Jht2CyDu9EzxBfUodjugKiAwziefaUgP/Ix5tMkP9WdC?=
 =?us-ascii?Q?kyfaxFddNnqE2J/w4vogOHtrMxdW5dIQWoZ04sY6pQNXwdoVRYSqFoyraCHQ?=
 =?us-ascii?Q?cRPMOyZAZnQRDF81ffTqG4oIBtziDlZ/qJ/JYzFFQvzLiMgO6wcJXqh/orww?=
 =?us-ascii?Q?tZyl0DL68RW8S/j4FB9WPQv7ZziC3MXYvHGrC3vZfNoF//h/Leix/3dF4AMT?=
 =?us-ascii?Q?/N7m+fdOfZDwmZdnjfwc29y77ynOKpa2sOGdo/1STE/nY0s4SrLTcPNSQPiZ?=
 =?us-ascii?Q?EnJE3wYb8ELItNszamjZ9318wo0WNjEisFke756xEpkbUJokO5TNzM4Ugz3t?=
 =?us-ascii?Q?QAFNG/8Zl9kzymHIcpdYxSA1ZYjWUBjnUNPAZANrDkxGfIDxPtglDymadD1Q?=
 =?us-ascii?Q?OkVtDfcgdx4nnswyfL6yNhJA1+6Oi/XXVcNocACht9xkumrbB4noXJlm6Wdw?=
 =?us-ascii?Q?yAb95e5dQhPKSeKbz8Ys5aTYOR1y7HCr5/wvi5JR7221jawY/vwyFHiAn3xG?=
 =?us-ascii?Q?QWUg98AtClS0oIm+m+4lcN2N33n0WALAhfHPpGfsxZn/BLpIf+bZRMu9PgAf?=
 =?us-ascii?Q?V/SHY+xTupzmjDXLsI5Tx686aMeOd8MeM0wZpRdV3FSIBNyZR40x98Ohne90?=
 =?us-ascii?Q?V/NkYvjWPa+0pwYsRmjsriXb4BKGLwDHb3fDAotONSAczZ+ANdqUaLoBt6/W?=
 =?us-ascii?Q?rfTGl+vrqqu6+OVPyPSgejndRirE/oTHCY/m4Bvc7GAlntb3LJuurnC0RlTg?=
 =?us-ascii?Q?ItCvaOOaVKgf1xerKsA0j3mw6rRCbCk/Tft0MTfQDRPOWVWcWcLggRJZnCyn?=
 =?us-ascii?Q?qZvN9R7pK/+Nh9Ip8cqWTGJbY0awgt/QiCFb8wFasiz8vOYo99rYbnguBHNy?=
 =?us-ascii?Q?h92jfswfc35lx3gsAfdh6jiFvYWiWcWRCRg4KQbDPril2rjjFBXBDm4pPT73?=
 =?us-ascii?Q?/d5gNTocgyRjMyXoU9ruxAMq58ZWo507RLd0hpKWuCClhTzKtRSEyMw9BBvS?=
 =?us-ascii?Q?+OKDNdMPKWBDmPw3RUSIqb9MkrS5H2W6Zyr8s7g4cHF7gH3Yk7fJnxOwwdAk?=
 =?us-ascii?Q?kMC5+prg+g=3D=3D?=
X-Exchange-RoutingPolicyChecked: PhMy5aYDXXzz2VL87+zcQi6MYB0dF6MOSKEh/MJ7CTpEoz8IZLJdZQJwJzTYPFy7KK2luvCSRYpUhAHCiAM8a4IDkGsXdNsZhjEo6pixr6xSGDKKo1YY8PRq1JE/gtOu88TGCwIhyjzm1ZIUh5uHmXixWQL7H+7obZmmOTIK6rIJuj6PCN+AnJ7OH0DOeSVihoSV8Wh5q4pc1RvoUyZRsrDUjp9VdnCNSjCvyn3cLgo4sMcW4Gqnt5BzxI0CsSJrf6K4zfgPymdD2jFGOVBuysAqyOCs6Xajc6ZU9PKxI5Q6ks7fYdfRGGedH/CQoHtZ7QOQaXqYBxBgPXszup1qTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 568596c5-3e5f-4f2b-b1fa-08df4bc34436
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:43:34.6497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qjBEdoSlWKm4nTjHQ0pQpwI3XUJDlAC18sXf04iDOyaskPwzegtRn+Z9V0hZI6TDAlCyZPlquu4+OHCS7M30Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7272
X-OriginatorOrg: intel.com

Hi Reinette,

thanks for taking a look at this,

On Wed, Nov 25, 2026 at 11:00:38AM -0800, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 11/16/26 1:57 AM, Chen Yu wrote:
> > On Thu, Nov 05, 2026 at 06:07:59PM +0800, Chen Yu wrote:
> ...
> > 
> > Response to the sashiko 2 review feedback at
> > https://sashiko.dev/#/patchset/cover.1793864720.git.yu.c.chen%40intel.com
> > (false positive IMO)
> > 
> > Review1:
> > "In resctrl_arch_pre_mount(), all online CPUs are then added to
> > RDT_RESOURCE_PERF_PKG without checking erdt_try_bind_domain():
> > arch/x86/kernel/cpu/resctrl/core.c:resctrl_arch_pre_mount() {
> > 	...
> > 	cpus_read_lock();
> > 	mutex_lock(&domain_list_lock);
> > 	r->mon_capable = true;
> > 	rdt_mon_capable = true;
> > 	for_each_online_cpu(cpu)
> > 		domain_add_cpu_mon(cpu, r);
> > 	mutex_unlock(&domain_list_lock);
> > 	cpus_read_unlock();
> > }
> > Will this cause an online CPU that failed erdt_try_bind_domain() at boot to
> > still be added to the RDT_RESOURCE_PERF_PKG monitoring domain on first mount,
> > while a CPU onlined (or offlined and re-onlined) after mount is excluded from
> > RDT_RESOURCE_PERF_PKG by resctrl_arch_online_cpu()?
> > Should resctrl_arch_pre_mount() also check erdt_try_bind_domain(cpu) before
> > calling domain_add_cpu_mon(cpu, r)?"
> > 
> > Response:
> > PERF_PKG(AET) does not care about ERDT information, so whether to add the "broken" CPU into
> > AET's domain does not impact the result - the AET monitor event's any_cpu is true, so
> > any CPU can read the monitor data without having to be read from the CPU in that domain.
> > We can keep as it is for now.
> 
> This does not sound consistent:
> - First, above makes the claim that it is acceptable to add the "broken" CPU 
>   into AET's domain since it does not impact AET - this contradicts the implementation
>   (specifically patch #6) that instead _drops_ a "broken" CPU from domains of _all_ resources,
>   even though not all resources are impacted by an ERDT issue. How can these
>   opposite behaviors both be justified?
> - Second, adding the "broken" CPU into AET's domain is only done during AET enumeration.
>   If that same CPU is offlined and then onlined again then it will _not_ appear
>   in the AET domain. Whether a CPU appears in AET domain or not thus depends
>   on when the CPU is onlined.
>   
> The place where AET enumeration and general CPU online flows meet is domain_add_cpu_mon() and
> adding a check here means that it needs to loop over domain_info_list which adding
> erdt_try_bind_domain() to resctrl_arch_online_cpu() attempted to avoid. Does not look
> like this is possible while it also has the consequence of removing a CPU from domains
> it could actually be used it.
> 
> What if changes to resctrl_arch_online_cpu() are dropped and instead domain_add_cpu_mon()
> changed to:
> 
> 	domain_add_cpu_mon()
> 	{
> 		...
> 		if (id < 0) {
> 			...
> 			return;
> 		}
> 
> 		/* Only L3 monitoring reads ERDT, so only its domains depend on a binding. */
> 		if (r->rid == RDT_RESOURCE_L3 && !erdt_try_bind_domain(cpu))
> 			return;
> 
> 		hdr = ...
> 		...
> 	}
> 		
> With the above an issue with ERDT will only impact L3 monitoring, albeit also MBM, but it
> will not impact the allocation features or AET. What do you think?
>

I agree.

Previously, I thought that if the system provides the ERDT table, then it is a critical
indicator of system robustness. That is to say, if the firmware has provided inconsistent
information between CACD mapping and APICID information, then the RDT support on this
platform is unreliable, and this CPU could be quarantined from all the domains. But it
seems that this is too aggressive. So by only allowing the L3 monitor domain to be impacted
by ERDT, it has minor impact on other resources. In the future, we might also need to deal
with the control domain for MBA:

@@ -483,6 +483,9 @@ static void domain_add_cpu_ctrl(int cpu, struct rdt_resource *r)

        lockdep_assert_held(&domain_list_lock);

+       if (r->rid == RDT_RESOURCE_MBA && !erdt_try_bind_domain(cpu))
+               return;
+
        if (id < 0) {
                pr_warn_once("Can't find control domain id for CPU:%d scope:%d for resource %s\n",
                             cpu, r->ctrl_scope, r->name);
 
> > 
> > Review2:
> > Should cmrc_init() in arch/x86/kernel/cpu/resctrl/erdt.c also reject a zero
> > cmrc->up_scale (for example, !cmrc->up_scale || cmrc->up_scale > UINT_MAX)?
> > 
> > Response:
> > The correctness of cmrc->up_scale cannot be guaranteed, because we cannot distinguish between
> > a 0 value up_scale and any value between 0 and UINT_MAX, they have the same effect, and we have
> > to trust the BIOS/firmware on this up_scale. We can add the above check but are not sure if it is usable.
> As the report highlights, this series indeed assigns a different meaning to a 0 up_scale - it means
> "ERDT is not in use". Since it is given another meaning then it does not seem as though an
> value of 0 is actually supported and adding a sanity check for this during CMRC parsing looks
> reasonable to me.
>

OK, let me add the check for up_scale in the next version.

thanks,
Chenyu 
