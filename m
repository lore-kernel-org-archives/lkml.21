Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795706796;
	b=OmeIGxMJLP+8pJsmIDJEShej4tE4j9DpnEL/6ZujTRs4+CJOUTW/pg9IRR+/3rPO95sd
	 P+kC6LotKq8rkscUzidaen1tGnQsu22zvMO8M7UFMpJbDlrzuQfV5WCUnuH0l0amgAtEl
	 rIE1+Ue59nwayMkoZkGt592Tgpx+LLQqBbyw42ou0yCO8LruFSIsVBMXhISapPgsBUk1+
	 ph2QNHVTfY9Dj5ExAPHuL/+83ZGyR5g3aGI7P9M6Fccc4UmpX40M3Omev+LKtxJxjJyjv
	 x7SolzXZXDMUmO+KwpHzMw/A8G2p1tN/Qn6pd/CemazULa8rhBWPcR4ap2UwX1aIxVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706796;
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
	bh=fbcVzQUMSVSOfv0CymJtxiQNIF6cAhLjbL6lte3FVxM=;
	b=DefQGsUt+V2FrmIHDErb/xyWWA+l9CiWpEoQaOudd1hsg4YQ/D7i+hQTmEg7qi7GsoED
	 JIy7yIF2EvCaF6LpAjGXdofFpnob/dDaEg54UDVDEN3NpbD8wj9bbGuMhlq6dUBxnxzxp
	 OhChvyplzaGuaZazHHu61nZdqW5KSJUuQOKh9AoQuAuW9Gwj9Dxqc39wuZv7Y1nXvU9Rb
	 ateEjM1rvykzx8GkmAWtgtocUAf+j2wYkaFmcnSTUQ7HfhFaDP384s7VqISxe3VtVu3/4
	 GC8Je62cXi5jXoP1faDe7ZSay7Izd3zzjA00cLrUGCXibnYE+Um+KRbFOB3Bn9+nS7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MCNpOanG;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Gr8RcfQF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7485606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7485606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MCNpOanG;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Gr8RcfQF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795706796; x=1827242796;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=F4epcA+GweGy0zOUFiq4tFHZWk2x375KhPlXtb+7HTU=;
  b=MCNpOanG3EGEqa1N3Ty1XSM/ywWmKGE4BgExgEpykddy/1rnIAOyrQGL
   60qRrlKgVPtJPZaUeU66ixapwK6SqonXTb4861Qn3aWiV9pl/bSjWqtUn
   5nv9NxwXT0i3MMiS1lyHWBPSc/L4C98iqx8RzZGl/dCjHCtv4LKrX75sL
   W0fvC5j5PwrpGQd4NeZLiessQnCytbjbqnr3/AuutGYL1S0DW4bm18BeP
   o+IEytgRmv8Y7Zi3YCoB93juwUsBt6etMxokk+FjNM5GgfTiEhFCuSysU
   d+u2v18fbN02TFxtSgsGhdldldRLKNND90NjlIJQMmehBS8l2Db5eFjZR
   g==;
X-CSE-ConnectionGUID: So9hAJP+ScmiojmhVxA/0A==
X-CSE-MsgGUID: PhtIYQRhS1K5c+Sts6X79A==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4529028"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4529028"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 07:26:35 -0800
X-CSE-ConnectionGUID: FaHPeEDPTJScvVXWbCYxLw==
X-CSE-MsgGUID: DEwrrdDqQSi/oTKG6uWo2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12427073"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 07:26:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 07:26:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 07:26:34 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 07:26:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vv4eDVOGjmZbnqPifOmoDt8oCC4g3j8e2RTf0BHaVmNTLE8rsXyLWqt+j5MEd9nhg9bO92ZEQBJCQt1i4lvPgLtjaVA6i1xSxImqzSSKn1v8rYAzj/BDhgRHmgxnuOLcC0cMdjOU/ZcAnus9RheDQBTr6oATBu3EnMG5sl+iCeGn8eCAm/IZeVEQILtlRGHImp+kr28IRYUO0M3sSMK7lG6agbZACgGfP1PXMy7or+X7sXzqi5k2RRin0PARjgR/b0hUVCVd1UDjLE8ia8TpNsDIDOjZEYJkwDtmRFn9+927z6kV/xehsJnxkByiQN9XFjLrmozNAqHT/odnFT7FNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbcVzQUMSVSOfv0CymJtxiQNIF6cAhLjbL6lte3FVxM=;
 b=PRFiHp2F4rQazqrH/VjGYFhFIfqTJLQyESzj/B3l6FP0UYMSxBCTeb5eM/4NhOGY5GYKq4Jmth32lls03CvOIb5UjH+p/yQkaNyDK4gnfF5IQm4bJyoyMMPqqIiCYguOGdNb3IHSAsPMntuemNVnDlr+k3GR1SWf6of0bEarQxq+gH5c4wjDeJACVJSMHCO4EqzNtH27BFC4W2mGLYCYZpyq9C/SL892tjTa1Sff0EvHz+YmYzB0fQCo0OoVx6jpGZoXNj6j28+C1bLHfZ1sGRTDxE86yN+1Vh9i4uXZ83O5pOfb3Ln4PeiTZZW0gGK5RvC1tYrOTLTYsXARwutKtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbcVzQUMSVSOfv0CymJtxiQNIF6cAhLjbL6lte3FVxM=;
 b=Gr8RcfQFuIjERef0MUjV7XJ0SO7gJ6s2yk/SL45C3Fjx1tulQoAWd9TpZ0THAVd+0iFp2VbFyMp8GqpJKYDcXKKQ0rm4pcQeK+vP3w2fLZ3t2qgPuWsls6tqzxwmitlQEfdNgoxChuZj6mcHmjQ+RRPqRxUmAPuIZR0c4iCzYIo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 IA3PR11MB8968.namprd11.prod.outlook.com (2603:10b6:208:57b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Thu, 26 Nov 2026 15:26:26 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:26:26 +0000
Date: Thu, 26 Nov 2026 23:15:24 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 06/12] x86/resctrl: Attach ACPI ERDT information to
 L3 mon domain on CPU online
Message-ID: <awhNDAzCfctFsUMg@chenyu-dev>
References: <cover.1793864720.git.yu.c.chen@intel.com>
 <ea099619212cbc4e58dc81b14476cc1af5bda880.1793864720.git.yu.c.chen@intel.com>
 <f821c042-1d52-44e9-8476-80671fc601b3@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f821c042-1d52-44e9-8476-80671fc601b3@intel.com>
X-ClientProxiedBy: SI2P153CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::17) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|IA3PR11MB8968:EE_
X-MS-Office365-Filtering-Correlation-Id: b68d3e9f-26af-44ea-bfbb-08df4bd1a2d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|3023799007|18002099003|22082099003|261009223027099003|261022105027099003|261026140227099003|261021135927099003|261026121527099003|261028144727099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: Qs4HFpPVdbpk/vk/57a7CurZgdtT0H6u+5ofxNi+TkGHUA+gakNY3DA8tIR3WdMZIpRziZC1oO8EVqMB9qEh+iKeWbqUmLxTa/zqz7XBq1t4fNPEZx16NYcAO12Nv1GAdz3cvm9pXf8Z9oK6Z972xolE6PzKGEhTsGT6p0Nk8KVX77E5phgjXlrxB37cZ/uSLqD+G12VeeW7m7VVkCYuH5LJSHReSHKplCpetH74xtk+u1vhuBRJQKzwmu0K3Y/4NplfMrMClNqR42CZ+PEQ/Eanv6Qw4CZIkN6bfgLKrBzsWhyr6NKdwXzIXHJjWwAlEExj0FTr0VmzIQJJRWXPtibZBvVHO4kVz1Zl92mKcrT3E6tONDg6iUTY4Hx/6Om22E4QaE7qcaAuVgERNeulwDZ3DywfYASsss6wfvy+MIwFmlB4PgLo8XkX4ESC15sQC2MkprQft4FxLQNoNmJEHF8UBYQKLSYmmJncU2OyLT7hocxRbpmCgJppvbGBEOreyN+DmhbLF9tELsjvjQi0aoLbV9JGE+QZPcsL7Luz9AwjrT+6Z7unDPi42p0yN1T9RQNuOWlsDPmC9jMEqcp1opsvuUzwXRQKun7AaVZ7SeOnQo7M7FoqrSTakJF6RXHyx5hpjrUxQpD3Kcc4DDek5KUYtbH0EBKo1qmdjgJPxF8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(3023799007)(18002099003)(22082099003)(261009223027099003)(261022105027099003)(261026140227099003)(261021135927099003)(261026121527099003)(261028144727099003)(56012099006)(10067099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ug7MoEgqiYtdJtpp11TdIT8VYyjnhXJoejkFqL836KqhxUA4fRRx5Mh+z4ii?=
 =?us-ascii?Q?y/XOjcWdhIpK+UgEmKMwBndVCImNddXW5trA4+XTkVySZA8T51skjm7rmuSL?=
 =?us-ascii?Q?N3YQUnx4kpzMmZjd6xlRhuNPdKnAPXanrr7WCnr76u/UHQgShKqb8XIJWSfh?=
 =?us-ascii?Q?1JLptIbB5fBeSdQaE0Ppbd87QPxKXV1mKjISJEsJ0haacBpGykepMAzvGZlJ?=
 =?us-ascii?Q?ynfkoVQILAnMYXWQRYgfK8TPBzD6vX3eiqJm+xMQk8xSDlDIoShu05wCytMV?=
 =?us-ascii?Q?JykVFU8QVnLJVZWMsE6GNQYUb72liuR+4nsC9Eufh3Ic543QUXGLDBFaf+Nk?=
 =?us-ascii?Q?llyDt4Pjry9je1bFJiHtQVuIA2KAaI4BEVgm5s/xokgfNFenhq890jCfBhEa?=
 =?us-ascii?Q?7z3YmG2broI3hLFeH9nNh0cGxtKGQnQYBhBpA0wEGMPOJQlUriJO4tVf/oVu?=
 =?us-ascii?Q?3l9bwbNcTKBhYaVIarSpjT016hNMINAmuSZelo2KAqr4m1zxwXTWX5IOhXiO?=
 =?us-ascii?Q?5ngKkKE9Ymf+wqoMV2hQJehswK5GmFMhf2LpJnKo9G7eUtVMyDiUuW5D29gT?=
 =?us-ascii?Q?/VfLHBMSWteEWOWOEjH9JdVnNbB8tXrqjWLBZlbi4b+G7fsK7+kziNuMGGUz?=
 =?us-ascii?Q?8v8wqHu3efqmyNNxuIGgNt1cJiIPvyvMRn9VWc5i2CsdwHZ2VEmtdv44EkZv?=
 =?us-ascii?Q?dpmuwMiK8BOA3/6uwGz2S7+EM5F2txRpyiJvW28YQens3vY3haIjWtcUesD+?=
 =?us-ascii?Q?JM0zAD8zW84EJ5eKWhJFzSPraWSIupKLpEoEGfubyIi4d+OYar0i7Xy/j4PU?=
 =?us-ascii?Q?TbvD9OsGiRus2Xr1+8KXjj9C6Eae4rSVjcVSBdoD3DJD6s+v6tK32uANZH62?=
 =?us-ascii?Q?grp7nnmW5/yWZCG6+0FS8dCL+Cpx8xq6I0x+g532tbWYQvqvUfFRZMoDdkcK?=
 =?us-ascii?Q?tOTOuEmRcXlSrRYIiw19gfc9J508lSYCC5led5g3vBj3dOW1V8Qy1uZelahJ?=
 =?us-ascii?Q?FTW/yhagoj/lmjW3YZ4f2l9CkUcxaOurMkZOesedq4Gjx7uSrZwj5ixWc4kj?=
 =?us-ascii?Q?GkPmCtpceqcrr3bNbtCqyYYyCkPk4wmbN+8Q6wMC92zQQI8GSFJQNGznoGUO?=
 =?us-ascii?Q?pK2ScgqaY7/7EzUtLHLIgDU+TWGQZ9Z8csKk4Y2WVu4iCQmhwmVhZJ9GdAzl?=
 =?us-ascii?Q?d7QNFaK6LGYC2d669kHozGsap94EdFtUrSqFBRZfb1NJeuL83U8BsQBk4v6J?=
 =?us-ascii?Q?1RcIylwPqJgLl605gqKDGnRNSt5awzo4VYsW2TK9t5ixrHcQQ0fNrP2oDxVx?=
 =?us-ascii?Q?QDHwaINWbLitoe6FTRFilgD1iohkjVob99MCAIKR4G8GJ61XEIu7nKRxSTDJ?=
 =?us-ascii?Q?uswo1xztdHMwdl9WYepEn9oJlN+qar80lBgAWOhV3a8q6BPCGpT0Q/pLY56v?=
 =?us-ascii?Q?i0VVq7uN8HDXmXOorwyJ95+D+LzGGSezn312xqkv9bt90NXq4cm+wJOTUjif?=
 =?us-ascii?Q?JwKcqDXd0S5MS5LfX0AiGV79bBDvWa9MNhT4Ldrgiim2uAqQgmOaH5Z3T+6v?=
 =?us-ascii?Q?ikF57/MDhOGnB1TYCKQpHV4/REOscIBuN0K2F/FXEI3oP6Tn7xB4dVVvaVHh?=
 =?us-ascii?Q?0TF0/axfZ8gUxEyqeP6JVxGt1qbvI72HpZ5gopAZrstvhzdQkFAT2FkiEpAd?=
 =?us-ascii?Q?rkbRJcw9XZNJCJnLPvj5EZ1PWJgVJQKAQdu/3sm3CQpAX5MecKrjOPd7QpC8?=
 =?us-ascii?Q?cwVXD5okzQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: FNHX4GrNPhrgfkwsaFN9Wx/VNF/zSldYFCU/LJtgGi6b2QMVYjKa7TB1cJlE7hyRiW5j3WxUgxp/pa914LaVaQPsJy0EoDsqqMkwlyFc4Pxt0VWarlRbOvJXA+xFUW3d77sen7b2Ct0KQMjPbmYoWq3KXAizc//rJl9Ipqlavsx/Z1OK83Re0bpPWQaXtDihvRIlWlqpzcX5GyweHlho2NUkUZXyYiahcHmb0qN/cBHYv66GeizRXiHGnOIL/cK+MVcBk837kxOmmohIntZJJF6Q229ZrR4ocBYUD0ydgFXw8qbQYkJE/9jU/hWTZliVA6v9hZChm7OMar6UVBItwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b68d3e9f-26af-44ea-bfbb-08df4bd1a2d4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:26:26.3893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pppt+ROjWVeE8C/UtAW8JFVDnTqSC8XNIPWiTaIXxWDkDXG3c2y4mKoVN+02MTtfvijFuq/qHwWsE2YBDB1aig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8968
X-OriginatorOrg: intel.com

Hi Reinette,

On Wed, Nov 25, 2026 at 11:05:24AM -0800, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 11/5/26 2:08 AM, Chen Yu wrote:
> > Each ERDT domain provides MMIO registers to read the monitoring counters of the
> > CPUs it covers. A monitor read is issued against a resctrl L3 monitoring domain,
> > so the read path needs the matching ERDT domain to find those MMIO registers.
> 
> There is a missed opportunity in the above context to associate the resctrl L3
> monitoring domains with the CPUID cache IDs they are created with. Establishing that
> in the context will make the rest of the changelog much easier to follow. Consider,
> for example:
> 	With Sub-NUMA Cluster (SNC) mode disabled, as ERDT requires, resctrl creates
> 	one L3 monitoring domain per L3 cache: CPUs that share an L3 cache form a
> 	domain whose ID is the L3 cache ID derived from CPUID. Each ERDT domain
> 	provides MMIO registers to read the monitoring counters of the CPUs it covers.
> 	A monitor read is issued against a resctrl L3 monitoring domain, so the read
> 	path needs the ERDT domain that matches it to find those MMIO registers.
> 
> 	ERDT enumerates CPU-to-L3-domain membership independently of CPUID: the
> 	firmware CACD sub-table lists the CPUs of each ERDT domain. An L3 monitoring
> 	domain can only be associated with an ERDT domain if both views agree on the
> 	L3 domain of each of its CPUs.
> 
> 	...
>

OK, I'll replace the commit log with the above description. Thanks for the nice write-up.

> > 
> > ERDT and CPUID enumerate CPU-to-L3-domain membership independently. CPUID leaf 4
> > describes the L3 cache topology, while the firmware CACD sub-table lists the
> > CPUs of each ERDT domain. An L3 monitoring domain can only be associated with an
> > ERDT domain if both views agree on the L3 domain of each of its CPUs.
> > 
> > ERDT is not enabled in Sub-NUMA Cluster mode, so the L3 monitoring domains have
> > L3 cache scope and their IDs are L3 cache IDs.
> > 
> > When a CPU comes online, check that its ERDT domain and its CPUID L3 cache
> > agree, and bind the ERDT domain to the CPU's L3 cache ID. On a mismatch, keep
> > the CPU online but out of all resctrl domains. This matches how resctrl handles
> > a failed domain creation: the CPU still joins the default group so tasks can run
> 
> No, this does not really match failed domain creation that only removes the CPU from
> one resource's domain. This implementation removes the CPU from domains of *all*
> resources. After considering sashiko's feedback about AET it looks like this
> can be avoided while addressing the issue with AET. Please see my response to
> your answer to sashiko's feedback found in cover letter thread.
>

Yes, I agree that we can make the failure impact only one resource domain (L3 resource).

> > on it with valid CLOSID/RMID values, but it is not added to any domain's CPU
> > mask.
> 
> Needs imperative.
>

OK, will change it to "but do not add it to L3 monitor domain's CPU mask."

> > 
> > When an L3 monitoring domain is created, associate it with the ERDT domain bound
> > to its L3 cache ID.
> 
> Having the solution portion start with a verb helps it to be impactful.
>

OK, will change it to:
"Associate an L3 monitoring domain with the ERDT domain bound to its L3 cache ID when
the domain is created."

> > 
> > Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> > Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> > Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> > ---
> 
> ...
> 
> 
> > +/**
> > + * erdt_l3_mon_domain_setup() - Associate ERDT table information with an L3
> > + * monitoring domain.
> > + * @hdr: Header of the L3 monitoring domain being created
> > + *
> > + * The CPU creating this domain has passed erdt_try_bind_domain(), which bound
> > + * an ERDT domain to this CPU's L3 cache ID. Without SNC the L3 monitoring
> > + * domain ID is also the L3 cache ID, so a match is always found and
> > + * hw_dom->d_info always points to a valid ERDT domain while ERDT is enabled.
> > + */
> > +void erdt_l3_mon_domain_setup(struct rdt_domain_hdr *hdr)
> > +{
> > +	struct rdt_hw_l3_mon_domain *hw_dom;
> > +	struct erdt_domain_info *d;
> > +
> > +	lockdep_assert_held(&domain_list_lock);
> > +
> > +	if (!erdt_enabled)
> > +		return;
> > +
> 
> Could you please add a struct rdt_resource * as parameter and add a warning here
> that will complain loudly if r->mon_scope is not RESCTRL_L3_CACHE? This function
> currently has an assumption that is enforced elsewhere that makes this flow
> difficult to follow, considering it is called when SNC is enabled but subtly
> relying on being gated by the !erdt_enabled check. 
>

OK, this is to protect against SNC I suppose? Will change it in next version.

thanks,
Chenyu 
