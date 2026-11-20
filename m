Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795161685;
	b=FuBWjMwBG6V78CYEAsd+S00Xf5KbJbe8yjR8V3LIUwL5ZWWkbnxi9kLxSRHkAsFxjhye
	 qaHqAVIskI05vdx1rXMdxAYODQk7RyzK42FACzhXvZJpNWd2ZfgVdBhddOMS8/oNW9hjK
	 EXL4bkzdR4QRJ/z865Xfh3d1tdam1HyxxQvUm5KV3IKcYQBqKup/I7x2Q+xncD9AXOtDH
	 GTlY3D4eeQdC7Um5ToVi9bx0jxnThJd+wpKfrffcrTJ3jK0pAR4OXwlwpBdMauCGP5dTA
	 b+PaLL29mOc3rqvU6TfbM4ypyx0xLgss9EJLYbtYZ0VETHpRIKhwD9v8nSJBFl4wkWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161685;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=otmACaxxi3wYUEL0Wi4i1+ztOedBhO5NgdzSGwgsJRI=;
	b=L3Qfck3qied3U/Ckzx0suVkKow5W/DQxYtbU8TxiRVH7lj/wrhjmWAlZcpVmTww+KKYS
	 /YCdTXpdfLMixyZzCVMp+yXd6lz4U2zW960K0r+4E90wQCzoB0MEF1Hb0Oo4ymrnLOuuj
	 rmPUUpLvDGD23P0VYSUSsvQT3hV3xPCeX7WZ8+TkW4rpSK1Q6ikA5blpOMh+cL4ieI7SG
	 MbnxZhBgcDm0WbDDBKpXVoOejTYbmvB0UTZXNwxBjpAR6jza+93GH30uiycGGDAuIb0nw
	 yow0EKuf6CErMoyqLXtFUKDpYtmbUDuY5CJWtiuGfQZ7a7qD0Z+ecvuKA4D6YdvHzVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lIRzf2Ew;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Jt3E359H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6978C606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6978C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lIRzf2Ew;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Jt3E359H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795161685; x=1826697685;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nJPEtTyYm41J1XbxJjtvdz0D+YBqTPLluU06EyeHAbQ=;
  b=lIRzf2Ew/SfoZFhR92jZcRxjc+Tyxrif+E3BOPz53kwIoATt+Qc5bYl3
   aoa5jksvQVFJOdqoZzVKYT59CT6hVDV86tHvJSyoC0JPTL1XWZeehgXr/
   Pd7fBBGrIj6tPimzDmU4IQs3dzAwwFby9hth2nb/Xne5QaKrS/W7tmhTJ
   AC+ccLsgn7fE0CjX1P8E39HT5GY7DO43qbfWhYaSOZNy8KqeaJwNzvMDG
   jky6Km8Mo2ZOjbDh5YelhJuimUNA8ylQks1knfCtCuDnmJiB/8RlGvs6m
   +sMiSWDcjA+m4+tdWm3lPk3CEII5nibu5lLvplu80cHK/JI7ElEwP0GLh
   Q==;
X-CSE-ConnectionGUID: 70+kOHLBTXmdjbGl5t2D0A==
X-CSE-MsgGUID: n8o90zBuQkOLKm+BZJaVew==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4027280"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4027280"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 00:01:24 -0800
X-CSE-ConnectionGUID: mHSnb1R1SeO3offdbap0Sw==
X-CSE-MsgGUID: sc1p2SweTeOz0ixc9Xk3/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10576480"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 00:01:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 00:01:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 00:01:22 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 00:01:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+9qZ5uypjxjmkX2jss38n7Y04MCR4Ib+Y34kSojsJ8WUCMwMqCLF7jK0RmALd0azXDyBZioMseFIxZDhyCszO6CtFrypmIh+TOrO7EqHnlqXC+B2pOWD8ViPNoxxZkjWgZNGCspGXY3HBtlcm/lt2jfcp9cIRG7BXWaoQ1wxYnZEx5WZwYxxp01kf0luXNjvbIB+SQMe/FttaN8jsKo+GjjhxyRs47MLw6Z6T8pDrbGVA6FplB2zGphwz/JGJyR0MpBSma948URuH636tefSVEd4icjPpt92dqmQVJz4OQRkAwrHQev36cMiQd04ptvZWryn7bRMhCaXqnSsFSTkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otmACaxxi3wYUEL0Wi4i1+ztOedBhO5NgdzSGwgsJRI=;
 b=zGkmnXYHHkChw84HN2IAckkDHZQEHgtz+i3XY/72IMaR9458ufDajVehNqHqKa5SU72FdpGdkjdd+f9hPUID89kqKKzud1rNjOfIONN+JnBaGPPx3O9d5JFMK0PubjawaxoJtuZwYYWoqN5A+anK9u4JZHRa3pY1eIfewP4EfZAQ20C2lCVpuQjMHzdU05QXa5FU90KDPpIKwOkrcgvjJXPex6DjJwEpNMP0XEzV7tMI5exzwcb43TGKITRYtBLG5oIBtcCSYuj5RXjLQXMa6hbsFuUhfpUKxc/d7wz1hEZYKtGGFWZxhjPTqQDaoIc16w+dOEmu9kOGFQfsa4RICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otmACaxxi3wYUEL0Wi4i1+ztOedBhO5NgdzSGwgsJRI=;
 b=Jt3E359HyDyart3lk5q4tWgNI+XWrkJAzwxYQ4O2wCttU2lh9C36cVoSWEQKrRlJiLnQLwOs5RotHO+8iK5emHlxCzJoTdPXYu9v0UcmdVX1XYt0RNhjO/NOfQ/HN2cXcze954Srwq/DDUyn6Ru/f8kT+GrOWhEsJ31aiJRozqc=
Received: from SJ1PR11MB6153.namprd11.prod.outlook.com (2603:10b6:a03:488::18)
 by IA4PR11MB9154.namprd11.prod.outlook.com (2603:10b6:208:55e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 08:01:15 +0000
Received: from SJ1PR11MB6153.namprd11.prod.outlook.com
 ([fe80::d6e0:baf2:d31d:c812]) by SJ1PR11MB6153.namprd11.prod.outlook.com
 ([fe80::d6e0:baf2:d31d:c812%4]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 08:01:15 +0000
From: "Li, Fei1" <fei1.li@intel.com>
To: Yuho Choi <oss.patchbox@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuo Liu
	<shuo.a.liu@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] virt: acrn: Don't free a VM the hypervisor refused to
 destroy
Thread-Topic: [PATCH v1] virt: acrn: Don't free a VM the hypervisor refused to
 destroy
Thread-Index: AQHdcX9mD2CvFY/fYkCf6OcnawD3H7c2p1Ww
Date: Fri, 20 Nov 2026 08:01:14 +0000
Message-ID: <SJ1PR11MB6153C84754841451300463D4BF782@SJ1PR11MB6153.namprd11.prod.outlook.com>
References: <20261111015250.1037116-2-oss.patchbox@gmail.com>
In-Reply-To: <20261111015250.1037116-2-oss.patchbox@gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6153:EE_|IA4PR11MB9154:EE_
x-ms-office365-filtering-correlation-id: 9f8ed901-6363-41d5-f161-08df46dc7341
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|261022105027099003|38070700021|261026121527099003|10067099003|261026140227099003|11063799006|56012099006|261021123027099003|261022075727099003|261028144727099003|261102123227099003|261021121427099003|18002099003|6133799003|22082099003|261009223027099003;
x-microsoft-antispam-message-info: USSnZRADUW+/FgqqM9RHVB8PHrrEiaHjMREbqLpQc78rkReYWW0pJaOprGqEMTbQGXGiGVSPIl6lhAMuFNfFpZzQsZoltoLq10eWnl9OVY8S0/AtfzArSzG7AFosGTJC64ammhb4y1ymQPGM/U5HehL4i3ESO0KZtk2HWQBkFGPwsK5esJZEUSvwyyFGbA5lYasUrG4vCJzKiRy4PToJo1tyTgYUwaYSCxeTQeSeVvmyGeGGj9lIxepZFu2suyLeE0T19ySAhQfeyl4txcqh2+qGB0byU5ijWnOVBO/M5i/qSUAkBpXiBvTnmvTpFdQ0ndRzKnlqkKJCKTbLsOYU7pc2mXhDtwq7VuR3QY50o2t6iEGg53mpOcSHLq1qvoGiR+6NkoycpubCBGnPli+AwTR7YPG6VSoz41YHMP1wlb6r3UBLZz3GHnc38gDzQWD3N/DFSmQFfiZGfZQxO79OojePLMYu6wr+f9fsFR7M63ALN8rL6itVOmiW8s55aOMgFAeBC5f9kVCah4RPzCUY6pVdC7T775uZ04Ob1NLFqKLyt+6iyPaxbje9CT5cit9j06HNV8ruvWdK/du3gx91guo1TqcUCcyyVMbSnqVWtwaiV42tQDTNIXRLjuhh989ZAVe8DxQhqSCxzms1AplaIh78HO+XgqWunTaPatd/jEgB6aVWSJNqBprMaDM0ukUb6KaCJcdNO4xgDWtLkxflJo1mFqMXIJYaMOZfqWR7Fiw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6153.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261022105027099003)(38070700021)(261026121527099003)(10067099003)(261026140227099003)(11063799006)(56012099006)(261021123027099003)(261022075727099003)(261028144727099003)(261102123227099003)(261021121427099003)(18002099003)(6133799003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NiwgCAe1sTdDZGrHG23SQuMnsv/E1DmfPSD+aZcHm1PH4YzKyVXFk4lWGKdr?=
 =?us-ascii?Q?Y78DvnP48mygFm2gOnWwiJwrqUQsMQxEnVCNHTndek0GpXZ735espfoUUpPH?=
 =?us-ascii?Q?zc3nliHr6a8N+worAWl1pip6MdxL1EtP+A0sb0bV2XjABfVmnQu5P0Jdj16d?=
 =?us-ascii?Q?wzLA4Crp7ZMtdKLnTnJTfcQ21c/DwQeYR7d06KeiBD4WTNLcjPjg/2UYzZHd?=
 =?us-ascii?Q?yXcv3IjYA3EItDbeGbwrU5lGbl04kZ6/nwyisvWJwz5kxq2lsOV2Tx8M2i8E?=
 =?us-ascii?Q?NiK9yEkyaqBoTzhdN1RV3sHo4ege0IGjajryRyrpREpGyDXpdkoRdFmWdHd7?=
 =?us-ascii?Q?pdEKMIByfeh6IlAkEF/hohxUIMYW8+4IjyK3U2LkvGuM9O78HeqCgp7iNKkg?=
 =?us-ascii?Q?MHCdwcUAOLvaQxxRzn3DzhhXQf3r2ZdLI87BPSuAhrRxMREyB544fack+cE5?=
 =?us-ascii?Q?SZXVN6goSCJmUy6Natc3XMSqgTYn616vvYtMdHHwBojKvi7x0QragrYjUBmm?=
 =?us-ascii?Q?B+vO9Pd4DCHlsIG98wgPTUQipWT+gfk4mZ8HC/qLyHwc4wrHlivhYcR+hf8e?=
 =?us-ascii?Q?jsAzuFo0qqahsOiavLdurcaQ2tRYY+NDTbk6mu2UZEf/Eg4eKAQq4IdR+IR1?=
 =?us-ascii?Q?8ym30R+SOY2QkmPX6drZHWg2Z5NsVQTh81vTjQCQYvgl1bWykbll84DyjL2Q?=
 =?us-ascii?Q?EkmfhP3O+ox7w3k5NYWW0GfwWqCprvNmuh5M0kCdPg8QQZuXPR9cZ4Rxej4L?=
 =?us-ascii?Q?266Ggcz6l9876o/ub4Fb7UR69qDwptobxeimOoJqU/yxwOGyNoQaZ4KYMcEC?=
 =?us-ascii?Q?NYOINAzo6NjQfEYf76KRIRPU5wDx1wYZk0qUADmNztsfDVjPe1Khg6tXahar?=
 =?us-ascii?Q?0rWGvQqLumcovktBlV1CjT2tVm0XM35y2Z5L4ci2s4jtU2nM3sFyksbO1D+J?=
 =?us-ascii?Q?bf6kDYm4/E8gZKnXChHH91Z+N7pASWG/Z9W5Y2RkI8wqo0iIBw3D+mjIofrE?=
 =?us-ascii?Q?Le4Kvor0Vo3XBpFQwckGFIAUsgxY/Hl3+SouiFDXTEfSqJV38hIKqa0f7BL3?=
 =?us-ascii?Q?YSJ6SCYqIszbvcw+qywlqydtUxCsREgbjJ0scw0tW/B3omob4JZsCoZwwa1r?=
 =?us-ascii?Q?TlPcLZLvPANYT4FtxOn5QDHYQS4xIfs56o7I/albjf70quQvSjrAY7orcrzZ?=
 =?us-ascii?Q?tHl2PBjs6lXUgNJwZeqBQzKdpsLLH3rAu1PaU+EC8jfTVfWYJjCRyW0KcMhv?=
 =?us-ascii?Q?7FO9Sz1XXCMVks0PiUZYy2e4Shi4I2y3arWfucS6tRYlMCBhId0Nf7N4EHsZ?=
 =?us-ascii?Q?VsLdqLTk/9B1rZKaBusf6uZZFUrIP+th4d5VvR9V7PTmhqIrKVaRxh4ISKJ7?=
 =?us-ascii?Q?srPa7NPjs2BeFYNmvPHMq394k5wOxFj8bk0LJyrXy1rvIkjN/IgYZcAd1PQy?=
 =?us-ascii?Q?dzIUhcnQdQeRGGpLo0XO08PSjazRTBEMl9aB5HsjofCHvXWLmo/cipgUOqXR?=
 =?us-ascii?Q?p8xE4L5CwbzntkXZJRwM2KPppTccBd2yrxjeAM3lIwyHvnzVjRkUZVn3/O3a?=
 =?us-ascii?Q?WjX1gZ+VMX1tKS/20muwIlM7sHKOdsJPNb3AH/IxkwD8roMWZYXujtzkBCrS?=
 =?us-ascii?Q?PLcDpoSCnazOtcyBq+mDcHouuZ8bCkW8I7OYGfCkT5nJWyZ+R343UlfYC1FC?=
 =?us-ascii?Q?l9DzkRkGxSlZRvPYoqRjLlKnnJPOrNpEki0fx0z8Qc/t0pLK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CQw1a7t7vRLv5CRHonPGS9/05IwqymmPgW/NcO7/8UANs0ed5QwKZty7kmrJmEYInM8hwfVIGDag9B8Zf//xLLoQM4xYp7TcZclZMpf6/+ax4McW5T+Kb6uuVGX8lMeHp1aGul8s5zwfB7QpVsMHfyWm5P892R32xvCiu07zCSztsvTwSz/zmhoHTA+znrYIrmKa92khlgXzIwmCMx7pIUgNAoFDidT+zxr8+Pf5NxK/GIHSWYoUj497TED7OXVSFtkdltG8cgavarNWgOCAD9ZPLVzQ4UyMLBtllTlgz+dZM2pY+Bb/5Paeu5c1RPxGkT+XUl/259wT+xapebBUxQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6153.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8ed901-6363-41d5-f161-08df46dc7341
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 08:01:15.0214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZMmC2CEsoqo5z2cPX2KUaLLD1NjtL0IBH7s+fMXs04UUHSIQmKIHc+ubEBcrfMTiXHIz8+JQqExX4lUUEkBU1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9154
X-OriginatorOrg: intel.com

> -----Original Message-----
> From: Yuho Choi <oss.patchbox@gmail.com>
> Sent: Wednesday, November 11, 2026 9:52 AM
> To: Li, Fei1 <fei1.li@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Shuo Liu
> <shuo.a.liu@intel.com>; linux-kernel@vger.kernel.org; Yuho Choi
> <oss.patchbox@gmail.com>
> Subject: [PATCH v1] virt: acrn: Don't free a VM the hypervisor refused to
> destroy
>=20
> acrn_dev_release() calls acrn_vm_destroy() and then frees the VM whether =
or
> not it was destroyed.
>=20
> Since commit 4c4c1257b844 ("virt: acrn: Do hcall_destroy_vm() before
> resource release"), acrn_vm_destroy() returns early when
> hcall_destroy_vm() fails, so that the VM can be destroyed again later.
> The VM then stays on acrn_vm_list, and its ioreq clients and irqfds still=
 point to
> it. That commit names a real-time VM as a case where the hypervisor refus=
es,
> since it can keep running without the Service VM.
> The hypervisor also only destroys a paused VM, so the same happens when t=
he
> device model exits without pausing the VM.
>=20
> Once the VM is freed, ioreq_dispatcher() still walks acrn_vm_list on the =
next
> I/O request notification and dereferences the freed VM.
>=20
> Leak the VM instead when it could not be destroyed.
>=20
> Fixes: 4c4c1257b844 ("virt: acrn: Do hcall_destroy_vm() before resource
> release")
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>

Hi Yuho,

Thanks for fixing this UAF issue!

Besides your current change, I suggest:

1. In acrn_dev_release(), try calling hcall_pause_vm(vm->vmid) before
   acrn_vm_destroy(vm) when vm->vmid is valid and not yet marked as
   destroyed.

2. Call try_module_get(THIS_MODULE) in acrn_vm_create() (and roll it
   back on failure), paired with module_put(THIS_MODULE) when
   acrn_vm_destroy() succeeds. This keeps the module pinned when a VM
   cannot be destroyed and remains in memory, preventing rmmod from
   triggering a kernel crash via active ioeventfd kthreads or irqfd
   callbacks under CONFIG_ACRN_HSM=3Dm.

Thanks.

> ---
> Compile-tested only (x86_64 defconfig with ACRN_HSM, W=3D1); I have no AC=
RN
> setup to test it on.
>=20
>  drivers/virt/acrn/hsm.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/virt/acrn/hsm.c b/drivers/virt/acrn/hsm.c index
> f170ff4617fdd..8403859e0c868 100644
> --- a/drivers/virt/acrn/hsm.c
> +++ b/drivers/virt/acrn/hsm.c
> @@ -427,8 +427,13 @@ static int acrn_dev_release(struct inode *inode,
> struct file *filp)  {
>  	struct acrn_vm *vm =3D filp->private_data;
>=20
> -	acrn_vm_destroy(vm);
> -	kfree(vm);
> +	/*
> +	 * If the hypervisor refused to destroy the VM, it is still on
> +	 * acrn_vm_list and its ioreq clients and irqfds still use it, so
> +	 * leak it.
> +	 */
> +	if (!acrn_vm_destroy(vm))
> +		kfree(vm);
>  	return 0;
>  }
>=20
>=20
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.43.0

