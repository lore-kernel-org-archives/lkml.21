Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795494429;
	b=B7z2T2CQ7Zso9pxMOFw0dM4DYW4H/KTStnRaPiPVg8wiNm4L0KAqmQaWQTJAalpF9Wqy
	 yANo0ufIQ+AgnZQ+XXxTed3New2fY3k0CSlsAr3e6uKjCT7yKtVITI9hE1RMIM5LG5brX
	 egrD27cJzT5lNLD/0Wc4DTC3y756c2N6ElmPF6MfpESklbLkhR2sQ00Eon1CaMqnSBqYt
	 MnuwuJXqsmMTaVEDa/uza+GStFRmQ0+wUbu1eWrIZfUWc+9d3/jHwmb45aJdvhaX2eOfu
	 fkY7dsha5G4EDdjMzMS5/PRrm69eEL/4t0m1DG6/7pz2z4JRNBJfP+h7sUGuHmUCCrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795494429;
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
	bh=Hlwqy2SmLFBO2yq6Ycks2h0wXcVY4epi+CS6BkKScD8=;
	b=Sd/mpIrM4gdTcFpN0sIwlCG1j6+OXp0+XFFq3/yEPxCNS/Ugt37A4i1lmsgtUsY0qJ21
	 sgoXm5qQ6Kx/wRWDhMG45lKSOZjO/aqFDeBlhpIBnrZaWQHgz52myqh5mDbSq0QFv0HOs
	 dpBVJDjQL1kxtH3ORZAkLcqaAB+8DsWfN8efQO6UN4Z1Z9Fl9pFM269JJyA9yAJjxYR/t
	 rkiQcGwhzfujwIdZzS1zdjdWmMOqE1H7tm7SPCMWJdD5WVQJGyKub7vTqbPzP9/N5olde
	 5S0JSdG3twu4QFmctWvAkVERp2sFi7be0HSdd2j2DXNsiz9pid2lCT8Uk1TK8Lud16g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MRPxx5QR;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=gFHdYud3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35998606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35998606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MRPxx5QR;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=gFHdYud3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795494428; x=1827030428;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eLaHl188/YccUcQTK8xUVfrvA2KuXHFiJKb5cwcKCOE=;
  b=MRPxx5QRTnmWG9ORFhNrqAPyJwZAArNer8WoqcmcCNO9fhhiiMPYtwi8
   Fa/DC0hUTB+EmukAPLQQQriHJi75VSAoxyz8/gq+d4tdJZSsDAK3VE2Tl
   Zb3O/GLzs/OIrCss3sXw3wTSUVZO4sAsdv/g/VDkqPnsf4ZxoPu4LU/ci
   gSPxI/AnqyegYKTP8Cf5Nrpp5MnfuLX2PVBDUNnC9NXSUddAheIoRZV3W
   logalLVFgjwN3QT+JDMZxJWiGuc0RvboaCprwZuWHimPRRT9FeTg6Z+I6
   5+vhRktq2AH/OuQsI2tuw+CIfqRePqe5WVRxBB56H9X0Syvgm9qQKgG0g
   w==;
X-CSE-ConnectionGUID: ynthp2uTSDCPDnqoetJT1Q==
X-CSE-MsgGUID: 3DhcGcmJSfmOfPJcwiD/hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4363872"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4363872"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 20:27:07 -0800
X-CSE-ConnectionGUID: XbBqsOBNTza6DnSuAkDPaQ==
X-CSE-MsgGUID: 3Jr/NYjOQhSY1xTrcwf9uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11441116"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 20:27:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 20:27:05 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 20:27:05 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 20:27:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=na7LoOjh+zSCleSfEy/JayEVl4z+qPlUdTrt7nhbB6Wbwp31tBj+oV5/iO1QLKo3GiEaMgTzKneMzKKG/ShcKYCfdMhy9So5fl8ioF6Bz3AxmwxtXMmqAmMe6wRXy/BQcbzifyvSYKdbXXXc2wtDX86O65E5LDkrYSXhud1hecZe2ALd0/Elw6nzQMBKG0e+HwXZsjJEyrwTweyosjYkic7NU0wwGIlBhxBuYf4hnAcYbRnyH37/HRu+A0pVUwtcMgCFDUcguIb53VyoxuZ1LpJXenHTiQ3wpU449wOaDkLwA5+ZG4uIvnJn23IfC/SlWnvOeEhe0cH6+7Ru4L2LKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hlwqy2SmLFBO2yq6Ycks2h0wXcVY4epi+CS6BkKScD8=;
 b=R3lDEu8ZGoZskU2sZ3sGc3fpn3hEAseD/tdHJO7GHNIFqUB3kk0xDNZ4T9Rulv2bwHC9OClIpXw1X+EvvjzufE4FKb9UN6qogm+1GPJ57FBTYaBIV0y276f8k8UdELvrJvArZYlYIZcUUspbWBLmSUjn5G1vHqQJi0v2U4frmWiLwO1YQNNp3vB4Mu0gYMgCUBC6BEXuXfUCIjiYCeHUqCRAP69/eq9v7noY2vHn++1oQ/+H2iXMmfX3cZhx7Gwe+3N9u11XBQeuXrh77DTNLgE/MW1/oyUm6cc3fDqXejV65UymIEByIpIDa6TixSu+qR7FGR5UF9thlvMPsTF1HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hlwqy2SmLFBO2yq6Ycks2h0wXcVY4epi+CS6BkKScD8=;
 b=gFHdYud3gRu9qPxrJeEEm3qFZPU3IYOiva+LH6OY+uyue4f+Mzr73n2wPDIDuXSKgjK0yMcCI+bPc1LVMbSjsxmzVTCXROXM7jDd4+r4Uy7g4WiRG4zcU7WeLBtzZFefDeTcbAZLXb0rMO/p6WOB5WDeosiWKm4kukFO4ZZr23g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MW5PR11MB5763.namprd11.prod.outlook.com (2603:10b6:303:19a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 04:26:52 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0615.009; Tue, 24 Nov 2026
 04:26:52 +0000
Message-ID: <c8f156fd-bf29-463b-9b42-fa572ce87c5f@intel.com>
Date: Mon, 23 Nov 2026 20:26:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
To: Chen Yu <yu.c.chen@intel.com>
CC: Tony Luck <tony.luck@intel.com>, Ben Horgan <ben.horgan@arm.com>, "James
 Morse" <james.morse@arm.com>, Dave Martin <Dave.Martin@arm.com>, Babu Moger
	<babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>, Fenghua Yu
	<fenghuay@nvidia.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Borislav Petkov
	<bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, Peter Newman <peternewman@google.com>,
	"chen.yu@linux.dev x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <b06e1fc2-87f1-4004-8102-c8cc8928345c@intel.com>
 <awOwIrJLVLJJVWNq@chenyu-dev>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <awOwIrJLVLJJVWNq@chenyu-dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0272.namprd04.prod.outlook.com
 (2603:10b6:303:89::7) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|MW5PR11MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: c796fe22-63bc-4d5b-b68f-08df49e32a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|23010399003|10067099003|5023799004|261021121427099003|261009220027099003|261026121527099003|4143699003|11063799006|56012099006|261021135927099003|261022105027099003|261009221727099003|261009223327099003|261022075727099003|261009221227099003|261028144727099003|261102123227099003|261026140227099003|261009223027099003|22082099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: /ml0uFK5tObbhFi4PdaDE9sM9FcouNjehbQTRvGPSK71IJg+QOvfEJ+PdwA7qpAATNjvuTQZJfShGG7gUdCBgqrMJUiXBe8jzlXrsZvg+UrQBkSoxojcvuG1LOrRCDYUQh4ulk26wN2OBrAWS6XdD5vJTx9yUScBlgjDO1v3xvCA3YhS+829xs25rFxEhzbI6i3nr/rrVWg30mAm9oBtCQ7kT6Hm4yYdzRc2BLfaLGRPuIIzY60+lReHF/r/GnLfdCS4vdATa3EZXrQt5sg4TDD7td3X8EtK1C52ok/kXFr75I+MvkUVHRarOdcg6Z7JBGVMMOwZWPnNBMJ54oFPcfTdoTtGtlh4f58ws+Wc7gttoAUkThtdoEhRBHK2Me2mavwbZ4xjfwPdULkAMMJdJkqu8aer2SDnxljbaH+X6DByxPPTH0zV0DKnlwszdJ6ZPn9qVxpPim8nhi+dS+PZFJ+4gCLOMTegRlopsmD5SPMzgjSpZCTlaSeQBBZEJExMrf4kHEH7SXQ3eYZ37gdet7njO6U+/9IUnJ+Rzn2G+WaWTUOAX68/fUgNUmzQfth6yB+nQBhFIZ73FpqiTQkxlpjytxnlA2fU1YWuVrMNnD9KJi8SCE0LY5lFgqBJXad2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(23010399003)(10067099003)(5023799004)(261021121427099003)(261009220027099003)(261026121527099003)(4143699003)(11063799006)(56012099006)(261021135927099003)(261022105027099003)(261009221727099003)(261009223327099003)(261022075727099003)(261009221227099003)(261028144727099003)(261102123227099003)(261026140227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjhBbjgwVDBzYlA1UVNxL3BvTE4yYWNqZ1drajllblFGQmQvSS83RkJwY1Z1?=
 =?utf-8?B?K0xxdFlNV1MrdGJ5cWExN3pOeTZ6S3pPOG1OeVpEUFZtc1hMVDlONzUzM3A2?=
 =?utf-8?B?czZWYUtIWnBoMUY2ZFVKTE52YnMxZyt5b0VDeFhRaVJ5T3pWZnQ0djl2NUNp?=
 =?utf-8?B?RTQvcmN3ZlBpLzg5dEFmdWdUK25LWUMweU5yNExlVnNiWllRTGM1OG1JYllM?=
 =?utf-8?B?d2tHTnJnNVVpNk5TempQejI0QkNGa0tXbDY2TWtlVVNNcVJjR3dCYnRlRHBU?=
 =?utf-8?B?QWRqZnl5UlFtMW5xY2xxWDFRL1RvK3J6R3hRa0NxYkRJQnB2Mk1BNE5aN21P?=
 =?utf-8?B?VnFDOXowNzNHV0hVOVFGT3FUTjNNK0psZW5wRFZuemRONU1xc2tJT2pWU3F0?=
 =?utf-8?B?Q1NlQ1dSQzdMYUJtbFQ1TW9aQXNWTWVYdGE3MzNZeVV1UnFkZllsTEdiaHE2?=
 =?utf-8?B?cGtydzZlcFVzcFhaQ1N4OTRUOGNXRmtSeFJFN3pxS2dxdlhRUUk1SlJZTDAw?=
 =?utf-8?B?b29qVEdITVRNdXprejQ3NjNrREFya1p6dlNXaUxzZExiMFZ4N3pYbGNZR095?=
 =?utf-8?B?MndsS1o3ZmJ6eUlTSlBGOFhlcHNRYm5xSll1ODdJbGF1RFRrMEdGZGxtdFJi?=
 =?utf-8?B?SmRLVGk5WUpQUkdoejRtcjM4NWswQXNhZnhBZzllQWFyOWk0U2F4NDh1bTRk?=
 =?utf-8?B?MzdSZUFtR0cvTFMyODl1TU12SDRDUEdiOGxmeDNjZHBjR3RsYzVsM0VWRmQ5?=
 =?utf-8?B?dE8ycno4Uzd6WUZVZ0xUMTNuNjF1UW03djNZU1p0TUxFYkJOVlkzVVZTbDNQ?=
 =?utf-8?B?a2NjaDJSakxmNjRGWW5Vc1ZzNkYwaXRiK0YwTzUzblFCcHJybU9jTmNTeTF1?=
 =?utf-8?B?Vys0TmUvcW1ONE1IV1lya1RtVFFDekNPNTFWTVZhK3hSOTVqTXZuaWhVYkNk?=
 =?utf-8?B?R2Q2cS9nT1kxTDlKOVpUUHVhbytlR0VrVVJYem9GWE56RGM5bDJVMEJFRUFs?=
 =?utf-8?B?bHdxd21HcEUyUUpJNXBCUmZ4b1VGdGx1VUJoRWdHNUtwTmFzSjZpdjFKMmVn?=
 =?utf-8?B?Ymx4VWJwK0M2SGxtVnE3TGxSZXB1eVUzR0gweFhrRGR4ZTQzbnB0bDZmU1Nh?=
 =?utf-8?B?c1hvUnlnZDZHenZadTdoYmtrdmFPSGhjdUZQS2dyVThSZDQvNmt2RDR6SXE5?=
 =?utf-8?B?eDJUZmZVSCtvOUJqZ09pdFA0RjM4ajF2TWoyd29helgxRVdPZFRBUzJqTVR3?=
 =?utf-8?B?WHR6Vkl2ZUFrUStOV0JkdmFITm9iOEF6N0hZam1xQ1UzWVFXYzZreDJpQVpE?=
 =?utf-8?B?SzM1U2NhcXYra2JnMkxLSityeFJ0NFVOcllTKy9IeWZIblJMM2NlKzM3cGFX?=
 =?utf-8?B?WmtEakRrcXFKNVdpUE1JUkZiaGxJeVdaSW5IM2ZDL2dyVmZ3VmhiWEVjNlhX?=
 =?utf-8?B?aFZ6TG1sQjdXNUZtZTR5cHJGenBmYzEwbU1EWUJFaDVnVzh4TDNUdzJ0b3RQ?=
 =?utf-8?B?amFxU3R0ckt0aXdNcGpSejZIK3htUHJkL1hoRUNOYytKNEl0anZWRFRlRGNH?=
 =?utf-8?B?OUdsL210K1BaamdKNG9tK1MyM2pscE9scm91Q29PM284NjMxQ3h3ME5ZZ1h2?=
 =?utf-8?B?cjkzcWZodTVidDAzZzBkREJySkxCcUdiSnB2dFdwaWwvaHJ6dnJDSG1mdWx2?=
 =?utf-8?B?bGF1bTg1eGh5MUpqUmJlQTljZ2lWTVhNWWd4eWZOK1hBWitqUjE0em9ISUQx?=
 =?utf-8?B?ejJHNDZ3eERZZG5oN1JEWXJ4bTY2L2hUdnVvakZiVzU5cEttb0wxTzZnRUlX?=
 =?utf-8?B?ejV6cVE5NE5PTGZkeFpELys5ang3M3hoQzFwYi9YV09zSUhwNWZXbW8rODRy?=
 =?utf-8?B?VEdRd2RnczB3LzJkdkNLYzdUNmFCdVY5QStsZklvaTAxSCtNR1M1MzhzbFdS?=
 =?utf-8?B?Y2d3cDFLODFPL0lzREU5K0VEZVluZm82ZjdmWTZlbjF5amdCSktmOUNDbjRH?=
 =?utf-8?B?R1hUNkM4Z1VRZk1kZDR3b3JMYzZucjUzUFRRUUpMTkM2Y0RSRDh4T0RwTnJE?=
 =?utf-8?B?T0t0UVlLWHJDcXVYNDFiTWJLanpNdy9VSlEzV3g4cC83dDdYV3lvdkNDVmJn?=
 =?utf-8?B?Z3ZhNlUxUUpRQUZRcW5Za0pjT0dVUUNoVjZ4MThwbjNOUGFTTTBnRWt3c3ZC?=
 =?utf-8?B?NTRIbGRoSzBkMCtZbi85cyswZlcvQnViNWdrYnBwaUZlaG1XRGxaaWV1RjJY?=
 =?utf-8?B?QjRVR3RyRnpxekF3ZVpqc1FJWiswQ0ZCU2VjR1lxeURPQ3E0VEQyUGhxdkJ3?=
 =?utf-8?B?RUtnM3I4Nm9USjd6bnhXaGNtVGZNK3NTcFR0UE9HcldSUWt6cWtzdWtML1VD?=
 =?utf-8?Q?TpriyxHRYbyoFAnA=3D?=
X-Exchange-RoutingPolicyChecked: hPYkCvklMsNn2xZOmw/Q5QO5m+0XLfLzNB8jLRpu4XqnldRVeB/xCj0rybz3c0TpxCuRpO/jxbn4ktRl8DTtMY0Ef1oC7JT5nYzUOeMtdiHrG4xwZGU2wO6P0URcAIRuqkWdQQ29AsVPcu1HC1oUjYhIOht1WxwIXMcDOlhJJNk6kox8EnWmC48dxddT51jC4c3uwu9eg86rz9QSPxlp7KKzWWUq6rANSMFx3df1AjZpGCem2LikGPOow1NcUKivr7GgfPWOBWtmMDwNvzO0R708qduBwGTzikHmTBNhihKZA+3w7X8x8uWEg+bt4/g9+HPbyaQrq6nGw6jYpr4JPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c796fe22-63bc-4d5b-b68f-08df49e32a2c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 04:26:52.5635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbHVSj3SbDmINtVxejqt/p4fDUNgOlSVUavLomNF5IGr0WdfSI+RUFD/ErgPwrpF6GANhtAsQ2p9RlNSl486i/If1utk5rD51gQngrdN12o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5763
X-OriginatorOrg: intel.com

Hi Chenyu,

On 11/22/26 7:16 PM, Chen Yu wrote:
> On Thu, Nov 19, 2026 at 09:04:26PM -0800, Reinette Chatre wrote:
>> Hi Everybody,
>>
>> I believe that discussions around resctrl's upcoming support for multiple
>> controls are starting to settle. This RFC aims to capture all the remaining
>> items in implementation as well as documentation. Please point out to me if
>> there is anything I missed.
>>
>> RFC v3 of this PoC can be found at:
>> git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v3
>>
>> Please refer to the documentation patch for an overview of the planned interface
>> changes as well as user space contracts/expectations:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git/commit/?h=resctrl/controls_rfc_v3&id=95ff9ff7430095cb7264946c944c750315db73d9
>>
>> Remaining opens:
>> ---------------
>> - Ben: I do have a question about the formula used to determine the size of
>>   a scalar cache control. Please see patch changelog of:
>>   https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git/commit/?h=resctrl/controls_rfc_v3&id=8695aab0997d5aa60e104374fae9701f51156c18
>> - MPAM only compile tested.
>> - The same x86 "SAMPLE" code as RFC v2 to demonstrate emulated controls.
>> - Add relationships between controls. For example, cannot set "MIN" control
>>   value to be larger than "MAX. Unclear how to do this in resctrl fs when
>>   considering that the relationship may span between emulated and backing
>>   controls. This is potentially something that needs to be managed by architecture
>>   and thus potentially without a consistent failure to user space.
>>
>> Changes since RFC v2:
>> --------------------
>> RFC v2: https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/
>>         git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v2
>>
>> User visible changes:
>> - Make scope a property of the control again, now in addition to a separate
>>   allocation scope of the resource. Expose the control scope via a new
>>   per-control "scope" file (L2, L3, or NODE) that tells user space what a
>>   domain ID in the schemata file represents. Needed to support AMD's GLBE
>>   and CPU-less memory bandwidth allocation. (Ben and Babu)
>> - Name controls according to the scheme agreed during RFC v2 discussions:
>>   <resource>_<resource_scope><control_scope>_<control>, with the control
>>   scope dropped when it matches the resource scope. MB and SMBA carry their
>>   L3 scope only implicitly, so their new controls show it explicitly, for
>>   example MB_L3_MAX, or MB_L3NODE for a default control at NODE scope.
> 
> This is a little different from the previous version. May I know the motivation
> for displaying both the resource's alloc_scope and the control's scope? Is it
> because AMD GLBE might have different granularity between the alloc_scope and the
> control's scope, so we want to show it to userspace? Maybe we can add a section

Exactly. 

> in the document to mention this, as you described at [1]:
> 
> "resource scope":
>         The scope of the resource object being allocated, that is, the
>         hardware level at which the resource resides and is consumed, for
>         example the L3 cache, memory bandwidth at L3 egress, or memory
>         bandwidth at NUMA node ingress. The resource scope is part of the
>         resource name and does not change the meaning of a domain ID.

Yes, I can add definitions for all the components of a control name (also resource
and control).

The "does not change the meaning of a domain ID" is not clear to me. We need
to be careful here while integrating it with existing documentation where the
domain ID is already tied to the resource instances.

> 
> "control scope":
>         The granularity at which the hardware is able to control the
>         resource. One control value applies to one instance of the control
>         scope, and the control scope determines what a domain ID in the
>         schemata file represents. It is exposed via the control's "scope"
>         file.

"One control value applies to one instance of the control scope" sounds strange.
The control value allocates a portion of the resource at the scope of the control
so having it "apply to an instance of the control scope" does not sound right, it
applies to the resource, no?
One useful test here is how it reads when applied to GLBE - where the control
includes more than one instance of the resource, and referring to that as
an instance of the control scope is not accurate.
> The resource scope and control scope are usually the same. They differ
> when the resource is at one scope but the hardware is only able to
> control it at another scope. Examples:
> 
> Intel RDT MBA:
>         Resource:    Memory bandwidth leaving the L3 (egress).
>         Granularity: One value per L3 domain. The value is a throttling
>                      level applied to each CPU of the CLOS within the
>                      domain - according to the spec, MBA control the speed
>                      between L2 and L3.
> 
> Arm MPAM:
>         Resource:    Memory bandwidth entering the memory of a NUMA node
>                      (ingress), regardless of which CPU issued the request.
>         Granularity: One value per NUMA node.
> 
> AMD GLBE:
>         Resource:    L3 external bandwidth (egress).
>         Granularity: One value per GLBE control domain (a NUMA node, or
>                      the whole system with NPS4). The value is a ceiling
>                      shared by all L3s in the domain. This is the example
>                      that resource alloc_scope is different than the control
>                      scope.

I prefer to defer the Arm MPAM NUMA and AMD GLBE examples to when those features
land. These new features should introduce new sections in the documentation to
describe them and the connections/terminology of controls can/should be used then.

As far as the Intel RDT MBA example goes, there is already the big section
"Memory bandwidth Allocation and monitoring" that uses the term "L3 external
bandwidth". We should be careful to not fragment the documentation by just pasting
new sections but instead aim to integrated the information in relevant sections
(if available).

> 
> BTW, can we provide a control flag that indicates whether the controller(even
> the new controllers than the legacy ones) want to display the alloc_scope/control scope
> via schemata? On v3, the region_aware schemata becomes:

This does not sound right. resctrl filesystem aims to establish a consistent naming
convention with user space. The way I read this, you request a flag that an architecture can
use to indicate whether it wants to follow that convention or not? resctrl filesystem
aims to provide a generic and consistent interface to user space, irrespective of the
architecture. Passing ownership of interface to architecture breaks this, no?

> > MB_L3_REGION0_OPT/MIN/MAX
> 
> previously it is:
> 
> MB_REGION0_OPT/MIN/MAX
> 
> On many platforms, the alloc_scope an scope are the same, and how about:
> 
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -5619,7 +5619,7 @@ static int gen_ctrl_suffix(struct rdt_resource *r, struct resctrl_ctrl *ctrl)
>                  * the omission.
>                  */
>                 if (r->alloc_scope == ctrl->scope) {
> -                       if (ctrl->name == RESCTRL_CTRL_NAME_DEF) {
> +                       if (ctrl->name == RESCTRL_CTRL_NAME_DEF || !ctrl->show_scope) {
>                                 ctrl->schema_suf[0] = '\0';
>                                 return 0;
>                         } else {
> 
> [1] https://lore.kernel.org/all/bccb1249-e722-451a-9c75-8aa846713045@intel.com/
> 
>>   https://lore.kernel.org/all/bccb1249-e722-451a-9c75-8aa846713045@intel.com/
>> - Report "max" per domain in preparation for systems with resource
>>   instances of different capacity. A bitmap's "max" no longer has a "0x"
>>   prefix. (Drew and Tony)
>> - Drop the "min_bits" file. The "min" file of a bitmap control now reports
>>   the minimum number of consecutive bits.
>> - Only offer, and only allow switching to, "native" control mode when the
>>   resource has emulated controls. (Ben)
> 
> May I know how we can distinguish whether a legacy control can be emulated by
> other controls?

There are a few characters in this discussion: the user, resctrl filesystem,
the different architecture drivers. Which does the "we" in this question
impersonate?

> 
> There are two scenarios. The first scenario is that a legacy control is emulated
> by sub-controllers, and the second scenario is that it is not emulated by any other
> controllers.
> 
> In the first scenario, in the current code, after we switch from legacy -> native -> legacy
> mode, the msr_update for the legacy control is non-NULL, so program_backing_controls() will
> never be invoked again.

This is just what the "sample" code does to demonstrate some techniques the architecture
driver can use. Please do not build on top of the sample patches. The architecture code _could_
use similar techniques, but is not required to. It is *sample* code. There is no intention of
upstreaming those patches. If you find them useful then you can copy/refactor them to make them
appropriate for your use - in this situation just modify resctrl_arch_control_mode_set() to
set msr_update() to NULL when the control mode switches to legacy (if that is the behavior the
architecture needs).

Any feature needing multiple controls is welcome to copy some code from the sample patches,
but all patches with "SAMPLE" prefix are expected to be dropped. They only exist as a sanity
check of the multiple controls foundation support that does not have a user yet.
> In the second scenario, which is the region-aware MBA scenario, the regionX controllers are
> independent of the legacy MSR-based MSR, the legacy control is not emulated by the region-aware
> control, so in the current RFC v3 it fits well - the non-NULL msr_update will be invoked by
> either the legacy MSR-based control or the region-aware control.
> 
> The issue with the first scenario is that we don't have an indicator to tell fs/resctrl whether

ah - "we" is the x86 architecture driver. I think it will be helpful to your implementation if you
expand the view to also consider the implementation from user and resctrl filesystem perspective,
bonus if this view also considers the other features depending on multiple controls support.

> this legacy control is emulated by other controls. Although we have an emulated_ctrl list in each

Why does the architecture need to "tell" fs/resctrl how the emulation is managed?

> control, that list is re-used by the non-emulated control scenario such as region-aware RDT. How

What is wrong with that?

> about introducing a control flag to say that the legacy control must be emulated by other controls,
> rather than checking whether the control's msr_update is NULL or not in _resctrl_arch_update_domains()?
> 
>  if (!hw_ctrl->msr_update)
>     program_backing_controls()
> 
> to:
> 
>   if (hw_ctrl->emulated)
>     program_backing_controls()

All of the things mentioned above (msr_update, _resctrl_arch_update_domains(), the call of
"program_backing_controls()") are internal to the x86 architecture driver. I do not see
why the filesystem needs to know any of these internals. The x86 driver knows whether it is
dealing with "scenario 1" or "scenario 2", and the code you point out is what needs to know
which "scenario" it needs to deal with. This is all just private to the arch driver. What am
I missing?

The sample code already demonstrates how the x86 msr_update() can be used in the
region aware feature. It looks like there is a need for the x86 msr_update() to be more
generic not just to support region-aware MBA, but also GLBE:

	https://lore.kernel.org/lkml/6e440b7f-66db-4c4e-a6ac-2cb418739bad@amd.com/

Reinette

