Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795192474;
	b=qNaQ9J0A8CS5bywSkiWw+cKpgUXn5xnW09VjNMc/03/C3oNOjzVQTbZKFeCPdiMjMX9O
	 Zbg/wyRQ4iu/f0MDvR0znr2nwuKi9lh0YU48GE40WcAZLbvGT+sLMp68V8jobCuwjiG0m
	 vwP6QlgWaf8KBpPNHfC6zBYVvvLU7vv+vBGlvsuwii6hL8PhF0i/Ln54qLrA/MUPF4WE/
	 yuDkQHtkEGyDxrxYdQnPmC5LrWVfRPxK5XHmmkpIcbMpyU3fUPcPpUCl0H8YRh0QDu/9l
	 K2IBzdTBTdUEkoKpcR86xitUQu+05fjGisUrQ9CIrQlxD/qtHKVq110QEZUgkXsl7og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192474;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5YgSM1Bfm6sTr09/dx4LJ/bM4ulcwZYE3/ggcsIkN5M=;
	b=SrbRSBKT2DH43OvLXVRMsdW54HRoETPIZCuOX+Pyys0r697yNo8CHY8CIXC6D8CiXWQk
	 4CvQk2hlBkyQnMXYP4JRR1FFtxix2G5Q7zqfzu2hatLE5onfrd4EVtvKt4yqMwTUiZ10u
	 vU4MFu1v5Fv/AHA2uRJBwDd8lAPE2hj+PUU1uuKNNRHrKVgeSFCyyNOudT6CM0TPiCVnd
	 X0zMkANo9m3tO2qSrAOP6+VCzGCipZE+e7HJYgN1CMajtm1sZ5c7z4pGLsC7CnC/gmDf/
	 DbZ6vK6Gl2QQ/gq8ctKz9/zsSRO8xFUGyqDLHXCW0ZNWwxI54QbbT0rAn391tEJ8fxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valinux.co.jp;
	spf=pass smtp.mailfrom=valinux.co.jp;
	dkim=pass header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=GC3P0wsy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.72
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021072.outbound.protection.outlook.com [52.101.125.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1057606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1057606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=GC3P0wsy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/0/8+xiDc0ogUcP+hwt34coPf6y3wJJecgXyq3ts7WQligeiCy9Knh/36AYhKp5uG7X++OhLOFRjyjY9o/+PSVcPZS10mA8bG9IPHtkG40J1Q6L3r41vHsMES07d4B+iv9G6JkDbytZ/PKnVmTOBiK3182fRpqXdoMHfdds5gGmK4GblE8W4J/JIkcAdxNtsk65nctV1MeWG/CI/T9+KP6LpyKbBRr04h9M+YzE+v+x+1nkpPhDlNC331RlCSQIFBvlvcCTIsBMd3hukNWCNViWA2R1Rlcv58Bc1dmcVAKKxzJD4A7xf+HtDozL73Tlt0K65YYo+Ei4M93RiZ8NjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YgSM1Bfm6sTr09/dx4LJ/bM4ulcwZYE3/ggcsIkN5M=;
 b=nCTAJCMTGiIGxRosi5+U7MwbF7Pv1ihHQChCy+/jVfjO+yEf88ss4Oz1aHxM7oP/JLoeiFvAx4LJbyFQA9LMS1q4+zF/tWyj947XJ2ArlAgOMO+9jv2qvCo59Es/swFA+bdPHxXPGSAIHYkWScqUfL3GXw4BY4hShx6mgCB1e8iDcW9hBD99IyGBOuRJz0t5HFzipBHMNQpuZR+KTu3y4vaQvTL1ZQm5ZIgxhQmvX1EwNefIVoSbUT/vxt4RJgBsBRB/xN4Gb9EWYoXMZCXQ9ULY74rd5QofTmSA3KVuMRTSJE9oVNGm3OpLQ/o3n4Ul1V4Bo0Wroj2milef4s3dSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YgSM1Bfm6sTr09/dx4LJ/bM4ulcwZYE3/ggcsIkN5M=;
 b=GC3P0wsyvPkXOl44NBIzZS8e7RA/vTWW3eNseTE4FWubVTdb+8ufzaQoQOSkt9ZaTMNG3iHjY668+Qjc0RmnLVEmEiEvu6jJjdfUT2TvON+ApXhnWbp1x8I5TcQ0bhjCpbs86xM7cYDeZCktitkLUOzaHIzY43K7LhBEPe19V/M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:325::11)
 by OS9P286MB145579.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:54b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:34:30 +0000
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9]) by TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 16:34:29 +0000
Date: Sat, 21 Nov 2026 01:34:28 +0900
From: Koichiro Den <den@valinux.co.jp>
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: "jdmason@kudzu.us" <jdmason@kudzu.us>, 
	"dave.jiang@intel.com" <dave.jiang@intel.com>, "alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>, 
	"u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"mani@kernel.org" <mani@kernel.org>, "Frank.Li@nxp.com" <Frank.Li@nxp.com>, 
	"Maciej.Grochowski@sony.com" <Maciej.Grochowski@sony.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"trivial@kernel.org" <trivial@kernel.org>
Subject: Re: [PATCH] ntb: fix peer_spad_read() returning -EINVAL instead of 0
Message-ID: <awBqDjJJGgYt6Azq@z790sl>
References: <20261120084546.2018-1-zhangjiao2@cmss.chinamobile.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120084546.2018-1-zhangjiao2@cmss.chinamobile.com>
X-ClientProxiedBy: TY4P286CA0126.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::19) To TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:325::11)
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
X-MS-TrafficTypeDiagnostic: TY7P286MB6866:EE_|OS9P286MB145579:EE_
X-MS-Office365-Filtering-Correlation-Id: a84ed788-9834-41a4-be74-08df47242639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|10070799003|1800799024|22082099003|6133799003|18002099003|56012099006|261028144727099003|261026121527099003|261022105027099003|261021121427099003|261026140227099003|261009223027099003|261021123027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	i0+0dsTd9vKsE4etHoxKae4dhLOC0EafiGHpxi04erMbL+FwCAaNbyEKKq2buzLG9AAoQ+lo4e1ex33BDR98TLI0ctwVg98JOVllpFjwoN+SOQxDN79rgg/NPM4ywE6uCp1xU4yX0vTf5wdPqSzk1uQyBLWO5GfftqELwGxM+doo4ex/uo+r8VR5pNC8SOdCI9j+d/m8DG/vikJhk6/frgOReMaZBjU8I2ofMyxStpioZEVYEHZuMfcZFChHVjtpmWk+WY8xwkydfK6o2cg9Crzvw7FVMFGB2A63oFNchhPcmhe94tXExX5tefD47c+Rlug3Cmi7k18cONvaD1jYCLttkk1gg2VXHX/h9Z2cFFYVaS45a0ISDnAfC/fr+H/TJbkt3/mJHkONAIZQIqu8zbZONSCxCy0igkTiGmsLTVcvlHpixfOt+bpnIxiqY0uZR0q/U2qSghvavf8APBdPqQpYl+9YBQmzkpYfclubxcSvFft1NOzSL2Bl/aw/7lsmzrxZEaXaYsJ95F5VH2+VP0eKsmBYWgsRkklsI6Eu7gwx6ATSBEVA9Pjvum4yYYA+jYd5lfmFHtKegWOn54GvEi3GePAArMTwfHMHBnYkmp7Y2As44dH2MTWjJsOciGS4ZkrtxWj1gwIAAuiBST9mFaNCPK2pLGZ7Ko8G2vndT9o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(10070799003)(1800799024)(22082099003)(6133799003)(18002099003)(56012099006)(261028144727099003)(261026121527099003)(261022105027099003)(261021121427099003)(261026140227099003)(261009223027099003)(261021123027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B4f+YYl4h9DYWPSINBu9uLaFGkAjbL6GNvOSTN4t/f3ekiJvAebnDKLj5mpV?=
 =?us-ascii?Q?clOjSTdOlB6l+YRkIkjyqI9PvTNd2E2BMDxAENr5Rs9r9zJn/iOFQXI0nz0b?=
 =?us-ascii?Q?ZX0OgUPxtOH6WGitXNU79VHgek3B5Ith3fTFx1EAynJ51I8yCT2epswhtlRg?=
 =?us-ascii?Q?9cUbgsWoPxNTgTALbXxNYaXMOTlJdCVpS8vpxIYZlbzzisbfYaI8FDnnlOt6?=
 =?us-ascii?Q?eXzOITSE2V1yF9mOD0VF2zDNCzLD6WzKXS9FtU5gSSdC/kJ4Rq62FqMIsh1t?=
 =?us-ascii?Q?tKZpGhew0DEj/Bkl9B10pV9BAwZ902CzQ5AWujEsV1cXZxGrrdC7CCwzg2i7?=
 =?us-ascii?Q?zhhUYakU47Rnb45Kz1ocHNFA0Nb37xitopSMgqqiky3u7kenWRxREu9fCxBX?=
 =?us-ascii?Q?UhyME23NPAw8hkmbZkK7RZIouJwhoAVJvaUxXRfaAREPeXXbCxv1feN/4Jsr?=
 =?us-ascii?Q?qzF0wBcWXR54rakI6vMwFnYD2Bre4nHhd06MUkIo229Q7GwDhb8IpiNFROPG?=
 =?us-ascii?Q?nNG6LDRI2BzHF0u6jQ/sZU4wEcbZ2i0rmJ+Xw3YHE/dwXne31cC3JDLnN0rk?=
 =?us-ascii?Q?X9/jiccUt8Xy+LnPNDj2m7C1qcdo0gbTnqC4jdedGr0R5e8PYBmjxJITVc4/?=
 =?us-ascii?Q?NQfic5C+QyUD20mlMpOh9MgCxxFwZIu0lXD6DplgzK7VRW40D/i1Ytvd0RXG?=
 =?us-ascii?Q?0QmTUOthqKOYBZgT4PnQs0TjcAtH6fSE5ob7X+f12lqLkuJ8K1zN7GTYbEXU?=
 =?us-ascii?Q?YSAgHp+d1X8HKt22HJUVlN8JZSNch61HPPc3xPdmACORuioSGTGfQ4MHRegV?=
 =?us-ascii?Q?YsJcfYqeoN+wwKnGExIWjasfqFRoW6lmUiIYdhhreqTg6gWVGYhaNmiFWJGi?=
 =?us-ascii?Q?X7tiJ7ull7sFpX6W/vND01/kM9pN+XE3WPpPPaYkLYQV1DUfeLa880wNZkCz?=
 =?us-ascii?Q?pL4Pbxa3jTOVVXD6McXlxV7Znny3x4qqNHnvrBuDPEbzQoUio2Eb5bH+HINr?=
 =?us-ascii?Q?QNw2dOQ4Q0A56SPdjfAEunt9JwvDw5FPI7FhN1ghawvvlGxOZTXeef5Bgg+d?=
 =?us-ascii?Q?+WkKWV1EfA34Q/yLBYGu9R16l5TZ6McYzuhiyU26NfqipGPb6ytbUjCe/77c?=
 =?us-ascii?Q?IvkgNf6KlwcF1YD3tMK/h9qW9KaueXWBihuLjpqOME0hlrOzyP0fUmXHrGiL?=
 =?us-ascii?Q?5W6OfvgngB25JSQqKJ5jlbITzvIFZbfU75GrCvY1Lq6SZMwiRR6PyQhoyWLZ?=
 =?us-ascii?Q?ypj0Fvk0/CIzFSc4S1mfVUr+JBUpo7wYBTUJ9+SwYl0/VYmrx7O9TKGplA3B?=
 =?us-ascii?Q?ADhM+lO3RAnnzzZJjcibRxg8sPui/GEL9G/2F1WHRVi2Ad98z0Y98l9uMA01?=
 =?us-ascii?Q?cEcv15AWoQUw1twlD4P9Q8n8mhtmlDNZWldrn2kTEYf4Sw3rXFgOUY7NMXb/?=
 =?us-ascii?Q?EOrz53LYFzYkFVIl6zAbJM31VU/3jlWMKakS8RDjJpE+PPDZPoCkn10MMORX?=
 =?us-ascii?Q?cRSkJk0S8dU+FnxA/hNzsuQhbFgkcv0BJRJF2wOdvlvYy3oV8O01gkF6wlvF?=
 =?us-ascii?Q?+0ICxwrQgD0tk6KmfG4/dsPha9DaUoqpQRO6t9u9MXXtTtZRtQuNT3S06nNM?=
 =?us-ascii?Q?0naUGxO2kkiYYJIh/zEU1IuSWo4YOQ5eUbiPVn9fhEdw5EboNASVLPRoQaOE?=
 =?us-ascii?Q?y0u1zBgO2PlXSDGh74qvE4h3+pdHl9SEpSgMDdOX+6hAiWqMKxruyNuqMh2G?=
 =?us-ascii?Q?G5jIgpxbHnf3GtqxhnC7q+/tHhSegzjEMQGZeBuPrp5gF2xFidYl?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a84ed788-9834-41a4-be74-08df47242639
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:34:29.7945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuEePt0/EqOzJxhzqpDrtPtfn1QciRohMqlJAQUoETkkzmnyCwOCFs+b4o0OncXm0QZ1VIZBhaQIkXgbR9GFxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB145579

On Fri, Nov 20, 2026 at 05:45:45PM +0900, zhangjiao2 wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> The amd_ntb_peer_spad_read(), ntb_epf_peer_spad_read() and
> switchtec_ntb_peer_spad_read() functions have a return type of u32
> but return -EINVAL on error, which results in a garbage value
> (0xFFFFFFEA) being returned to callers. Other NTB hardware drivers
> (e.g. Intel's ndev_spad_read) correctly return 0 for out-of-range
> scratchpad indices.
> 
> Fix all three functions to return 0 on error, matching the
> established convention in the NTB subsystem.
> 
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>

I wonder if it would make more sense for ntb_peer_spad_read() and its callback
to take a u32 *val for the result and return 0 on success or -errno on failure.
(The wrapper could then return -EOPNOTSUPP if the callback is missing.)

It looks like ntb_msi_test can legitimately publish an irq_count of 0 to its
SPAD, and ntb_perf uses all 1's for an empty command slot (ie. PERF_CMD_INVAL).
So I'm not sure overloading the return value to signal a failed read is a good
choice from the beginning.

That said, I agree that returning -EINVAL as a u32 is misleading.
One thing I'm not sure about is whether switching to 0 is really harmless.
In ntb_msit_db_event(), what if the doorbell bit isn't a valid peer index?
From what I can see, on ntb_hw_epf or switchtec, the old value (-EINVAL) makes
the allocation fail, while with 0, kzalloc_objs() returns ZERO_SIZE_PTR rather
than NULL. Wouldn't the code then use that invalid peer index in nm->peers[]?

Best regards,
Koichiro Den

> ---
>  drivers/ntb/hw/amd/ntb_hw_amd.c        | 2 +-
>  drivers/ntb/hw/epf/ntb_hw_epf.c        | 4 ++--
>  drivers/ntb/hw/mscc/ntb_hw_switchtec.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/ntb/hw/amd/ntb_hw_amd.c b/drivers/ntb/hw/amd/ntb_hw_amd.c
> index 36bee0d8ac6c..40ced4043340 100644
> --- a/drivers/ntb/hw/amd/ntb_hw_amd.c
> +++ b/drivers/ntb/hw/amd/ntb_hw_amd.c
> @@ -529,7 +529,7 @@ static u32 amd_ntb_peer_spad_read(struct ntb_dev *ntb, int pidx, int sidx)
>  	u32 offset;
>  
>  	if (sidx < 0 || sidx >= ndev->spad_count)
> -		return -EINVAL;
> +		return 0;
>  
>  	offset = ndev->peer_spad + (sidx << 2);
>  	return readl(mmio + AMD_SPAD_OFFSET + offset);
> diff --git a/drivers/ntb/hw/epf/ntb_hw_epf.c b/drivers/ntb/hw/epf/ntb_hw_epf.c
> index c47607d4f8a7..dcc5eb4bea74 100644
> --- a/drivers/ntb/hw/epf/ntb_hw_epf.c
> +++ b/drivers/ntb/hw/epf/ntb_hw_epf.c
> @@ -273,12 +273,12 @@ static u32 ntb_epf_peer_spad_read(struct ntb_dev *ntb, int pidx, int idx)
>  
>  	if (pidx != NTB_DEF_PEER_IDX) {
>  		dev_err(dev, "Unsupported Peer ID %d\n", pidx);
> -		return -EINVAL;
> +		return 0;
>  	}
>  
>  	if (idx < 0 || idx >= ndev->spad_count) {
>  		dev_err(dev, "WRITE: Invalid Peer ScratchPad Index %d\n", idx);
> -		return -EINVAL;
> +		return 0;
>  	}
>  
>  	offset = (idx << 2);
> diff --git a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
> index e38540b92716..a9fc94869aeb 100644
> --- a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
> +++ b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
> @@ -762,7 +762,7 @@ static u32 switchtec_ntb_peer_spad_read(struct ntb_dev *ntb, int pidx,
>  	struct switchtec_ntb *sndev = ntb_sndev(ntb);
>  
>  	if (pidx != NTB_DEF_PEER_IDX)
> -		return -EINVAL;
> +		return 0;
>  
>  	if (sidx < 0 || sidx >= ARRAY_SIZE(sndev->peer_shared->spad))
>  		return 0;
> -- 
> 2.33.0
> 
> 
> 
