Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033149;
	b=AMsURbBP5UAU6HNCkpWujiNawDacMVDz8kAvomR4gTg6W7VaXzB0556fsRjnzkZbyq0Z
	 0uBUdzuWhhfOei+sCmenG3CD8FaVSMP1FUSDd60NiMy5Sf2rd6ebn04QJvtFE7XsDGDof
	 XyXuc1LsjzjE8wiiNR57j5Qsl4S0J2QV3KZ/L4xO8rmwxLqXb6SGzWJe7ajZmSmn1HgZd
	 tymqr43P9jzTOe3bMVDarBD6FjrSKeS1NO2gUzb1y7UWkeGz1zpQsw9gkYqtK2Hto2P0p
	 WVY6eM1mQNPNFMZDXBowHq1bC97DLqshLAsFyyHrwY6tYK0csJUU6z0bbWmhEXwDxgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033149;
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
	bh=Tpfe1AjsJjNgVJXUQaa6/+27YoxOrSGe7o4dSpXL/0k=;
	b=XBmlsBjC+rBMJqsw1SBDhhGgzxP+VPdaaVNQawY5HcMKiu214EvTRYqo8stUYBToMwQM
	 rhfne6AW0v+VC5OIMnaK9fhEzJjShaYkd+TQtWCp5ABekcws9wKAuFE+xBQ4+yOzcsIHf
	 RVDhc65Bk4/DSSd1gLeYvAzEwFylV1k9gIQ+VvALEyB0v6XwnMneJ7rQ9GAXErdUrm9Fx
	 rSsbFmYxT8ZNFvIO/Y8/3TyVRnK86Xr99lMjhdHMMd+NbIhHSwS6CYjEDlZr/pRbh4rd6
	 sCWSGpQWUUGtRD2ALEmPPfey5d7jtvW+AG1rFctKTeYNb2nSq4rxBY51B5ye4zZZobA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IVUhhEKF;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Q7B50NOn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABAE606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ABAE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IVUhhEKF;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Q7B50NOn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795033150; x=1826569150;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DxQvWYYzN0FiswBQI1Dhhh0afG76Hy9W56ArmeTLFAI=;
  b=IVUhhEKFHi+evAbLSOoiyzWWYNDuAjrLdJg40Zo5yGk6ervT8ZoGs0Vl
   Ngzcp0gO5rcLs74L7HrwVpHzyBzhJkIYl7BS/gSqzBcj+hi+Xcl0vfVgA
   SaLFBRJj/GFbq4J4xM/kYpyqc7iyqKhYFPO+l1b+BTWI+tdIDTWn5fLQL
   7I6ARQWEyFmuAyu6St8JDgYfZYUgEz9Op2mpYmCeXXGc8O5dRJcNZURB6
   9i1Vy/nL4fyRtJMMDrPMpVA+Ysdf870jmblXogepLkDES37aMAtUq70jc
   3iMhiLmDieMBc4phDxF5oQ3XMwZDS3BNZMJABoWjpS13abl9KANSHi5NZ
   Q==;
X-CSE-ConnectionGUID: IpnPlykEQ0OGzaHhIqOTbw==
X-CSE-MsgGUID: K69/S5S4Tmyl7YshsbCKcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3748278"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3748278"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 12:19:08 -0800
X-CSE-ConnectionGUID: vV5IOofpTm+Z0vjK1xKarg==
X-CSE-MsgGUID: g00sQrzxTAi1Ho6lVVNV8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10237096"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 12:19:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 12:19:07 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 12:19:07 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 12:19:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goZceukb9LEx947bqt5iI3g1YzzhjRU5MwGYcdF0friP1ud7K5XYFJR9/w1gixftHFeAheEcoNLoLXwfZPvnaSLGnYaQvIxKwtsYmoXjY0eVUvnE9rLMJoUm934TUXATlYU8stsN82yU6B1NkenGL0gMo5OthK3ytIYg9pl5evTWM4IaIH7SHY9CVSZKxiJS+3bWH6xMeA3C+P1HhPqKLaM2ySA84Noa1bJx90XIpd6Lu3PmOO/fiF2rDqo1PIdL7NCOrfktVb5elIiCzNfz2XdfhjjuxbB/xrD29yGtOYc53qUIADtQ36pLmAKWotlXEKuhfkeHo5h4RfHGhjF1uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tpfe1AjsJjNgVJXUQaa6/+27YoxOrSGe7o4dSpXL/0k=;
 b=QYePTKWHu97qCjOmRkFrLXtcTQ88Kf9RnOPWYpyjM4hCRGvZKIG47CPWG+qisMEhK96JwkPjPCbnDgRQJJsew6tdSgrgeAbOyE+Yy1uSb6F1AjmPw4rgaaHYilhnpHRHz5rJSy8fjmOiVkhulnWaM8IlzhS6NhEe0erbSPL8BiUTc+vibZe+IJxU1yRkqGzRup0dkxOIYOHObSKWSlU6nEMG8Me65TU066O/cU0kqAOuqGMwwWU0vDjOxlUxo0Yi6JYInIc7Gpuj/yl1eatp1nT/dPc1WNMFsUBfTo/GpqcysTCuq9vGNmhivn3QOUNIuR7YuLnsWdMUXWS7tBtKzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tpfe1AjsJjNgVJXUQaa6/+27YoxOrSGe7o4dSpXL/0k=;
 b=Q7B50NOnAbpZ65r+Dmt+wJocVe/sko/Jy1kNAPCvYv1CYF6vtpynZiNNw+7STC3x8n77wytLdj+4yBVkdK4zPMJS79TaPEh5DGlFgY75tqVPnRuTx4CPZt5P5Y53LJr7yk8jvA5xIkkLEXMaYSUmSRnDzwKPDigG8q95nqYacBU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB819107.namprd11.prod.outlook.com
 (2603:10b6:806:518::11) by SA2PR11MB5098.namprd11.prod.outlook.com
 (2603:10b6:806:11c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 20:19:04 +0000
Received: from SA3PR11MB819107.namprd11.prod.outlook.com
 ([fe80::e8cf:3b9e:d98:ee2]) by SA3PR11MB819107.namprd11.prod.outlook.com
 ([fe80::e8cf:3b9e:d98:ee2%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 20:19:04 +0000
Message-ID: <a0c51547-a354-4dbb-9194-0b359ea604cf@intel.com>
Date: Wed, 18 Nov 2026 12:19:02 -0800
User-Agent: Mozilla Thunderbird
From: "Chang S. Bae" <chang.seok.bae@intel.com>
Subject: Re: [PATCH] x86/fpu: Put non-enabled dynamic features into init state
 on sigreturn
To: Daniel Wade <danjwade95@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>
CC: "H . Peter Anvin" <hpa@zytor.com>, Andrei Vagin <avagin@google.com>,
	<linux-kernel@vger.kernel.org>
References: <20261117112640.1435-1-danjwade95@gmail.com>
Content-Language: en-US
In-Reply-To: <20261117112640.1435-1-danjwade95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::22) To SA3PR11MB819107.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SA3PR11MB819107:EE_|SA2PR11MB5098:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3d951a-aef1-46c9-86fe-08df45b13131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|5023799004|11063799006|261026140227099003|261028144727099003|261022105027099003|261026121527099003|261022075727099003|261022113327099003|261021121427099003|261102123227099003|261009223327099003|261009221227099003|261009221727099003|261009223027099003|261009220027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: /FJzi52pCRoawqfixvP4V5zvkaKIV0Co7xUSkFrECBUepl8H4rY1ySb1LAL/yC6vZ1PuTfUHhb9WB7OBFJ5BXz5bjWSzSOL8Y+tTRq+TBfWblXy3SSFJV5v4vDbsUsPyulq2Z/ko3ZWWG3ZaVwiDXPjgsq7Q9dp7TZ37KIPj69bTf6IF38ZnKDkUuVy00alr7WTuVU2DMZGU+xXCtNoyOKxEAoOP7e/SBqiXZvIAWAuFM2ETw+2QHkmCDfIWe+ewSxygmqqLHVMANuIg0nMqB4+nGERXx/GukW6sQcgV3qcMRs6BngOqENu3remC2Fm4Yg+wqg14dWkAqgg+dl55WON1cjultQo5HI4EMVssuMKFsl9CMxk2ucwgxY+6iHMMnVecAYdVuSS9o4pNDXVRkGfFksOcJsw2irw2yebmyA5w0tSX2OD7eADNf+T7Zi0jCxtHxAoBEmWiPEFHAZF+/TMYeAEbFDH1x+RHvsPiB7lVrPVdXDWVHlYa6a/qhpTmPEyerNYVCwLllH8DX2ZW3FwfZ3MxotpEhCMhvqkJpxKkOf7p3vnNnsHnPJLXsZlcLO11BX8MqRq54rMqVBHUkhwkeSFcHNpvqO+mXAwwYWpcvezPDh00cxUe5iC2r1qK15p2Uj1YrkkIYNfpe7NChtWp+8/qnwm1w4L9ZL12mqs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB819107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(5023799004)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261026121527099003)(261022075727099003)(261022113327099003)(261021121427099003)(261102123227099003)(261009223327099003)(261009221227099003)(261009221727099003)(261009223027099003)(261009220027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0hxMUNaQkNkckxielFmbXZHbktiSmFEQlRpZEMxdUlmOWJITWZ1a3F2K3pT?=
 =?utf-8?B?QmR4UStyM1ovcUhWT3dIallzcEJrQ3dSeUhmalRyUjh5V0p1RXZQclpDWVcw?=
 =?utf-8?B?WmZ1ZWphbWdydDNmUjVUTzNJTWx2NmN2bmgxUk93MWcrRFhxK1hjUzdQNnZu?=
 =?utf-8?B?SjROZUwyOEYvdzV5RTFORmFOVWZzMmZzeWRLRmpsU1pCdkQ1d2pFTWR0ME9V?=
 =?utf-8?B?MlA4Z3ZSemo4OURGYjY5cklCbzl1NnM1YlFORkNjNmFFWEpzYVhDK3F2aEhi?=
 =?utf-8?B?a29FMkFjQ2VFbVBuOXE4NTcyL0plWlYzdDRVMXdlQVlhV25OcWUydmxEY1ZT?=
 =?utf-8?B?d0pwUjMvdWNicUVOeDlGOGVIYVZnVDFacWdIYUlOcFd2Y1I5Rmh0YlVpaXNQ?=
 =?utf-8?B?MFNYUUdBekg4U2xCSFNOTXd1ZlN3d1ZxVjFNeGUvNk5Jd2VwclFiVUl1UWpj?=
 =?utf-8?B?L2lqUnhKY2FqRmxQTzR0Q1pURVU3aEY4Rnh1b0RKRDR5SU0wREc4TUR5TDl0?=
 =?utf-8?B?cnViOCtVTHFtNnNMdmVQOFI0a0xBbStxdXRpd1BXLytVK3AzWHNsaURkZzhm?=
 =?utf-8?B?Q1czVnFsT0FTTVk4aGRGU25oT1VlN0ludlBFby8vYmJmY0hucHdzV1BSL3dx?=
 =?utf-8?B?bzBUbERFSkpiWXRueGFpdUNLaVd2RDUrMTBOYzBHQWxFc0xyWXFJOGMzTW1w?=
 =?utf-8?B?RUlobzNHRFNLL2IzS1piTkUxRXVBSFBCenAycWpLWU5vZHFHM244THdyT1pU?=
 =?utf-8?B?R0ttT3o0RExTblhiWUJsN1ZLMGh6SzRHem9YaXdJTHBxV1FxRlRCQkdQWmRi?=
 =?utf-8?B?Zllmd1hzUE9IV1ZRWnExUWs4aVJFZFhTcFVrT0NIUWIvTHcrR2hZb1RYUDNu?=
 =?utf-8?B?eFNWVUtITDZWelE4RzVoMVBYUUJqYnFBcXlYWHlVS2JFeFlVeThGM04wbm91?=
 =?utf-8?B?eU0ydy9NRzh0VnpuTDlyNDhUUVh0c2FmNEhzSU1Md3JBMFliS0FwL21ML0k2?=
 =?utf-8?B?bjIrVUF4c204NUZYRTc3UVUyc2ZaRzdDSDRPTFptWEU0cEJQVGFZcmIwbHNi?=
 =?utf-8?B?NnlnVFkrRFl6MHliQkRxWnBoRVk3ajdNcFg1S2ZoRnZvNFUrcENmNlo2ZTBj?=
 =?utf-8?B?dmtndjh1WUk1Z3RGYytneXJmS2lSWmdqY2poVDk4dGFSRXJUb1FDQXJYb2dh?=
 =?utf-8?B?dXhmUmw5amtmQ3MyQkVtdDBVdC9pYUtoZjlTcUE1V3lSdlpRQUVJQ0dQOWtF?=
 =?utf-8?B?VXVBSHBIVzJaSmtQcWVRUXFZcllwa2g0Z2NERXlQZDY1UzFxZ3NCai9zRFNt?=
 =?utf-8?B?SlhVSUhnQW1iMWltcStURFVwdUJjU2dUSFNJSFJyMXpnQUpKY0trU3U4Q1ox?=
 =?utf-8?B?ZUhQRVBZdEdMYXFpUWg3QUNFT1FGUFJ1SGZDUXMvYkk0WUpnNTVVR3FJSWZE?=
 =?utf-8?B?UHN6WjRKVktLWEttQjI5RzB6aUYxMVlpbzhieVhWekRMbmtKa3d5TXRGaEND?=
 =?utf-8?B?OGdaMTQzTEkrREw0THNwekpzSHlDMlpqb2pKa2QvdDNKcmpLVms2YmFrZk1m?=
 =?utf-8?B?RWZRVEFrS2VVN2p2NmlZcXRrMTEwSWV1VGcxcTFFODhWNE1XWDFFakhnZXRj?=
 =?utf-8?B?RnRZRU9NK2xCRVFVN0ZHV2JnY2sxTFZvRXN4aVRVVDhvT3JMUHlBL2tKNTRN?=
 =?utf-8?B?WkNEdVhMbHZHSE5lUmRaaEVaZGhVVVFXNDFFeWdzZTJjZDRSY3BCenorYjZ3?=
 =?utf-8?B?ODFMakthMDdVajcwNkxtM2NUbDRGbzc2S25aVXhiK3o4OTNDYVgyL1l0SUJK?=
 =?utf-8?B?Tm50QTJvQW5HVWIvQXRHSCt5bm5BcmdFeVRhaTFFTUYxdjFwdHBHbFAxYyt0?=
 =?utf-8?B?SFJKUlpFRXVaaTRpdk1IMEJNZkxTVDRwTVhFbzUyeVpHakl4dU9GL0srM29K?=
 =?utf-8?B?MmtZeHJtclR1bDAvTzVKS0pWUUQxNlhTQ3BVbkNYc283WkNCSGNkNXlQVEFV?=
 =?utf-8?B?NnpnUmhhSXFDMkc1eE1Ka29aVU0vSE15ck1pYTVqUU8vek9jUzVuNDVvZmRK?=
 =?utf-8?B?WTgyb1ZvWEhEVWNzZGl6Qjk0SW43RlNPT0dicGlWT2RIQmUxeE9TN2dDYTBW?=
 =?utf-8?B?SDNqQmh2YjVmT1ZBOVIvdGxFTUIxOXdWSGZrYlhveklpeDU0Ryt3NHZWS1Jy?=
 =?utf-8?B?NUd0VHNKaVRtUE12RjVuYStQNWRsNzdoSXRpeU1LRWJWWVRjaHlPZUlPclZp?=
 =?utf-8?B?S1ZaVGNLakJLK3ZpbVBUYitmU2RpQ3BTMEVQc3hFOU1hcTFWb0dzRnpSWGZs?=
 =?utf-8?B?NkJRQmx1VWlNWFRUUjZ4TEt0cHZkVWozdzgxeFhDcVlVNDFzL05hQT09?=
X-Exchange-RoutingPolicyChecked: skuZ7MKVZGMfL6xIMeS8AYj0cdungYK2NLRPnLqUvGXTDg/L9ghAil216Uox7RxQjy4GOyjpzmPc1O8QiKTxiy3Z2G9m42StgYHW33fjc2e9lnbY6FkTvRUD2lQw7zHCgkb4LBkleOHQsSzCQJnmJwNggXgDyNHe5nHtNusIRT+BAHGmWZQTG7JrtNQravvQfPth/bXg8yc+7f86OnxvrQyXxB0006KQg87SjHDMkrJkxsX/BFDPnpBW6fakAhBdWDtofiwW/lEcaWU/AmgyafGOAl6Sq2w69p1/+pD/ry8SHfTWQuRt6C9WNXeSKa8127hAz2p9wRJ398k0nQX/TA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3d951a-aef1-46c9-86fe-08df45b13131
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB819107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:19:04.7601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRycfNM4XtBQ3I3/6hx3VV9VEtxWvFJNKt0zL8Q9NPCrnfaDus5w5sYFqnecP0xiKq19g4d8fl/N0k4XKqLLHwww8LowW7hBofffmvBJHB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5098
X-OriginatorOrg: intel.com

On 11/17/2026 3:26 AM, Daniel Wade wrote:
> On sigreturn restore_fpregs_from_user() restores the features the signal
> frame carries and inits the rest, but both masks are limited to
> fpstate::user_xfeatures. If the task lost the registers earlier in the
> syscall, a dynamic feature it has not enabled yet -- XTILE_DATA before
> its first AMX use -- still holds the previous task state, and

How could that happen?

> fpregs_mark_activate() makes the registers current's. The first AMX
> instruction then raises #NM and fpstate_realloc() clears XFD without
> reloading, 

Reloading what? XFD traps before the instruction accessing the state, so
there should be nothing to reload.

Well, I have a hard time following the problem...

Thanks,
Chang
