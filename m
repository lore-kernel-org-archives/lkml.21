Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.80
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795496500;
	b=2kSUdY/YDrxcSXbrWeyTg4UbPdBYybbnEB+8Cj+YVg108Ak19dXJRewZ75snsisCn8wH
	 zKONg/W/MpisXQgtbU9lN//si1iC6MjBaCeJj3mthHJGw0ao3Dd+xSz5ozjtdNpww9A8a
	 BZ/yx5Ds2oCZv3QjPfdujKhPeHWF8nNQI6YilAB5VLmGeVVaJmaWqN9RbRW/Rqq/RRBRK
	 kmM3D7NsTNscG9u0+UnnaaXoFhHj/KolmakCLk/kZkg2VTPYqVpStshlsyP1Y2Izl01Gq
	 tZ7Oz5t5XA1QsPBiW+hTeGpEwljUEOYkDapeGh9J0y52O+GHbu1DPUb6+b/9Pu2Di6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496500;
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
	bh=khjyCyCyK33/K1BQmnjnqLGBLFKXGcNQwOu5voCFTe0=;
	b=1/8H/KCGaDHu91Xl2JsqoHpbUppH0oZqe85OryhDP1H3jXL8UDpsSNN0rNsjkJmJ3dVK
	 UfH0RinQG7pL/cR1HnXaMD78uHO00RT6huJy43YQ25phNXiYuuojzBipyseSN2yqMmt+T
	 xZyp3P7VQrsfuju4hW4q9FiByX6fwWVgvL6HrSwkD23EV/cIuMp47dOBpYAylvDFB2tBV
	 9CdnCwUgPEUytdJKG3eJ/afJb4gL4e6TRpdRhoafwUW4yYXZfVqQK0EOiFHl8kmp/DLNa
	 k9EB59C+/9+gOc/0N2xJet3+CiLSQHrAXR3OHDR/HAhUN6oVwQjZsm7zSrRA8+GkNEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valinux.co.jp;
	spf=pass smtp.mailfrom=valinux.co.jp;
	dkim=pass header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=XbzgKSYc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.80
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021080.outbound.protection.outlook.com [40.107.74.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2131E606A339
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2131E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=XbzgKSYc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQBJYXRZj+J+pSn24kti7yT9XWWQi/nkTCCp6ZnRXIpEirj8L+Hu7AtKcJDWx/sCuNPeqa6F8sinpOtw8TkM0884hgnJaUf/ryIC/Ou4t/OK3iiv+TlSHG7Vd55fejMIUvsAgEqganykHMkLyeU0bs884ul3Jpb2qXaNpN4UFwry8LqjX7k0jfWPUopYOwWBe9KzyCIVWaKNtr8eupY9jGzUliMFbmNKPXVYEqOg0YOfdRtsltloyXKs5OTUYeubp9wW6T7Ul5+hRI0nYGWt+lRfNKLOnH2vBmoBpFTHWIrOXZuPk7OXjKkM1dgfLoX52NAUf3Eg9JtsCZGsKK7K5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khjyCyCyK33/K1BQmnjnqLGBLFKXGcNQwOu5voCFTe0=;
 b=E62OUDocjetreDU8ap7dnoazuEx/9Fw1uoqoJiq42XRADLtyyCNgR7dY9zsidcXbJao4IkKovFtq322yL1mJkVYngurKY1ugUGoA3QateyWqH5rDvTSGa8yow5RGCzitec1DsseJkex3m7j/aaDwf/2vq1LfmpFpViVMHuPH8iCpIsYgwLWQ+StqOT341w2MNUesdGMkHQ5kPJcH6UaI49w6FkrN2VLQSPPOqZkd0/GmZUBVG1Huffye8qtsqShrAM+dFnd8CiHHa7JFRKol/EeZpxIOEZWHZ2xnOkRe9Rif6/5tFeXJ+2b4tuPpBiQA9yEM8kEYynMAoAyWLSKuBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khjyCyCyK33/K1BQmnjnqLGBLFKXGcNQwOu5voCFTe0=;
 b=XbzgKSYck+84l3naKG9lWF4W/sgYeV4JRgpcSexKNpGyzNXavAcxIpWvInuPNq7CSeouAH1aUGgyo6eIybwMAAjquIYxjaIQRtsMIf9n0Slhr12sLpS71JduyJ7Lh5juNHSRvZup/jDgsDnggYE5ZqsA0bflFfCQPGJsZr9lcw4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:325::11)
 by TYVP286MB3716.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:36d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 05:01:33 +0000
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9]) by TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 05:01:33 +0000
Date: Tue, 24 Nov 2026 14:01:31 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Dave Jiang <dave.jiang@intel.com>
Cc: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>, 
	"jdmason@kudzu.us" <jdmason@kudzu.us>, "alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>, 
	"u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"mani@kernel.org" <mani@kernel.org>, "Frank.Li@nxp.com" <Frank.Li@nxp.com>, 
	"Maciej.Grochowski@sony.com" <Maciej.Grochowski@sony.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"trivial@kernel.org" <trivial@kernel.org>
Subject: Re: [PATCH] ntb: fix peer_spad_read() returning -EINVAL instead of 0
Message-ID: <awUNZZkL14UtDQOx@z790sl>
References: <20261120084546.2018-1-zhangjiao2@cmss.chinamobile.com>
 <awBqDjJJGgYt6Azq@z790sl>
 <4c1e85d6-891d-4240-a705-da896fb4877d@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c1e85d6-891d-4240-a705-da896fb4877d@intel.com>
X-ClientProxiedBy: TYCP286CA0323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::15) To TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB6866:EE_|TYVP286MB3716:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e9a0c0-69d2-4c76-1ae6-08df49e8022a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|7416014|23010399003|366016|6133799003|261009223027099003|22082099003|18002099003|4143699003|56012099006|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261021123027099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	UJjKbZ0HznwUT2vQGJEx2QnbAwPUGC/CYAn95rUiLGfR6vde8PoYH+WivEDYDwZWn5fUjRl2B/V1wStr4rAlGFR0YcXApbSOQ+qwvfx5jeSqYKNqGLh6z/7iRn1/Su2e/xTfidJqwam39gB7DTFyzU0sXAU7CHgClOvGpJG4/yOLiFBEgrZh2yWY0fQrx+Xzh4LJa3Bra9W1BlhRMRQBfwhvuiZsj2NBOQ3QX+/1qDHXjN7T00Y+QuRN/6TO5kt+u/hpHAUUa+Yip6Ly+E01j4Lb3G5Q+v83X02A5Iml+ZxpCnSEXq25lOOp13sCLwAW8z2N3eCpfSEU0Esso0VHu+2X8pgTx2fij/cekvJ1/QWEPTqDaxZS7cuVWqFTq5Tk77yYoSfDHvZa1PeImpkRtaKil1NLJqzuQKomJf6o2ouX5YAzjAYJ4X25i8RvP4pmbQkF6x76DVLfVCNdiIxvcBlJwO0+9jnltoPQCy9mVcM1WdlldnDDGIGwUKv54PfzNN3pSJmRLLSmwRTali6GGEduZX1/aCoyzStgXI288mUi66CYTBogh+eFh/30cEzNr29mmMjavtvs9REFAvXRrI0drpB2yuGtiHKP73FPJ++FHnXvZJKo9g2JhHJcQE1Dab95zDwucqqKYpjUKr/eAfmcm7rXj/LSt0NvqEXHW+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(7416014)(23010399003)(366016)(6133799003)(261009223027099003)(22082099003)(18002099003)(4143699003)(56012099006)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qOjU+mL9GNQyhGCidI46dFFRCDivoBMFizmqDh+ETKewIedAROVNjt/kAFik?=
 =?us-ascii?Q?IH2ssWUePDnpGPQ2Kj81tb1sftTX3HLG+W1gaZMRtUPy0beFmURQSMwSpnNx?=
 =?us-ascii?Q?LRFA4oZjsXuFTl49NqPLhd6lrm3e9WdRIW03WDTmzvOT04DAK3mM57+clgou?=
 =?us-ascii?Q?bU9lpunkM85ZIQJqJx+ScBF4dF0lGXYGqz2k8s4v54UdI9vn1RxJTJZFqKIT?=
 =?us-ascii?Q?dAHm/GYx+O4MQYETrpUTN23l5+VJCt/2/j+WHEU4qsvY4TSVzE9JFqL1kyKv?=
 =?us-ascii?Q?j5Ewbx5tYX6mhh+1zEMYKtIDPSJFSlIqPDyHCjjjKqvEAD1oDzPfD3dUnRrM?=
 =?us-ascii?Q?miUQVLvmQhcIZeYl9PTfBZ64DKzxg9JI+WW5BBR5YRbskRcb6iCZQfubpCAa?=
 =?us-ascii?Q?teYNusm/ZFxNcZKQkflV0/4r0JxDKqIjlT8XO5BuymLASiJcaMynB3f0dAZO?=
 =?us-ascii?Q?AHPi5Xg0m3p/4bDPyHx2ZX+Wqz1BTTLYHlYxASoCqyDsNzv9xcSdJwIHLPIG?=
 =?us-ascii?Q?LMfvZoCuO0nQ07VooaJRcgY72NJAbd1AfukXZ4s+ZuZ8/LKgnoSU1RdE/+Gb?=
 =?us-ascii?Q?3t3yZtbEcbRODyMJW8bBgI7kg9PmoLiGg3QqxvYDk2AbO6f/4x+WtulI4p8M?=
 =?us-ascii?Q?7deMfgSrcqJp/bqxq+4zcilDuDNdK3W+ZvcJRa8nP1uqrpWmToqmFeDw9tsH?=
 =?us-ascii?Q?cVsSYKg7PTYcPhKGAukFQoMUToUuPjQQ542DK7HK6v/S5dBX8NjInljuZEA6?=
 =?us-ascii?Q?xXAR06qVOajR0oHvnlihCJDMkotjtWZoLo4FwkuLW0U+bBH+ol9cVivXaW7h?=
 =?us-ascii?Q?JnRPeACDY8ZcygHJH7y3uL4WJR1u3gQwSuU13zwtsC2ns0qVactJeGN0Lr8U?=
 =?us-ascii?Q?SSbKDBcvVcfJAALCZ3sDjZHNXWa6FQeseEE/0LEmR+Re8K4zID1314gLt+ff?=
 =?us-ascii?Q?8P/U/4A0aZ7a/h+HGR+NHQ2EjOZQwmpTC8TAYTrbk/7/2CTO5z7Svn5oQes/?=
 =?us-ascii?Q?TyGY01J7iIJvXFrmw7JmXrXDWCJlt3APyrgM5IsNQyc3cGDH+jDR2ME7RfE2?=
 =?us-ascii?Q?Q6qj2nkrD5Qjdt+iurRzaM3PNRfhXkvhNYNUj+nSo4AuixR+eokflOsquqIs?=
 =?us-ascii?Q?4gtfQ/WA7QVJin1gGhoIcjNYBA5biC2NsZ+Ke5zkPLFZkZmblJJboRVWKTcH?=
 =?us-ascii?Q?ZDtQD0BF0vGUYMSJ1mVp/LrEBTwvmgXiGKQ4GdcQWyvRH5lRNSarVanh+HUk?=
 =?us-ascii?Q?Tzo4xbJ3X61HXMawUKZ3S0buQjASnl9DdQK5Grsn/uulZF5JH2rGvlWmARQ1?=
 =?us-ascii?Q?PJXreBfYL501eZbZT18C/h+dhA6B+MQ/SM7NsqargysARRT1P7piV85F9i2q?=
 =?us-ascii?Q?B2YbgDRkihuQdrxujz6/Tno0CuVSfMBGfZMykDHgXjWttXRS8vLtgWmwK7kB?=
 =?us-ascii?Q?hEyHXlsa688YwnQicTStpxM37T+P4eiWZO2Fnpmngyx7lAMujFH8rbB9995i?=
 =?us-ascii?Q?y0OZn2STA0KxHcorz8ol0uKZaAWRU/J9k1pkgGGbXqxl+ipcF8UmlFDlum0u?=
 =?us-ascii?Q?uGLOboq2rhlXzA+z4KEkWKeYskJS8UzR6QtuZs/lfW/hqC8ZqigI1rVggmfR?=
 =?us-ascii?Q?nKytgeaeL3BXa4NLv1SCGsHdHqapnjs1m4iPhHemSzBtIjfBr2aoviqRbTY9?=
 =?us-ascii?Q?ReG4w92E5qjFuVmMVtfjtAYJ44Taxon5uHbZn4+saRJDDPCgqQBiNCAOPzpS?=
 =?us-ascii?Q?P8NbIfZQy5TRdvXd8W6o3VO0hIeU5EDLmy4kokrpk9TW7KyYlN99?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e9a0c0-69d2-4c76-1ae6-08df49e8022a
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 05:01:33.0218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpjIt0FmCeVH/++cwzL/Gz6sE0xXuEHdMUXvQL6Ku7bErqFS9kK7MtG96ssfaCrFE8+2L/Pglc2F+kG7SzxYsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVP286MB3716

On Fri, Nov 20, 2026 at 09:45:57AM -0700, Dave Jiang wrote:
> 
> 
> On 11/20/26 9:34 AM, Koichiro Den wrote:
> > On Fri, Nov 20, 2026 at 05:45:45PM +0900, zhangjiao2 wrote:
> >> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> >>
> >> The amd_ntb_peer_spad_read(), ntb_epf_peer_spad_read() and
> >> switchtec_ntb_peer_spad_read() functions have a return type of u32
> >> but return -EINVAL on error, which results in a garbage value
> >> (0xFFFFFFEA) being returned to callers. Other NTB hardware drivers
> >> (e.g. Intel's ndev_spad_read) correctly return 0 for out-of-range
> >> scratchpad indices.
> >>
> >> Fix all three functions to return 0 on error, matching the
> >> established convention in the NTB subsystem.
> >>
> >> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> > 
> > I wonder if it would make more sense for ntb_peer_spad_read() and its callback
> > to take a u32 *val for the result and return 0 on success or -errno on failure.
> > (The wrapper could then return -EOPNOTSUPP if the callback is missing.)
> > 
> > It looks like ntb_msi_test can legitimately publish an irq_count of 0 to its
> > SPAD, and ntb_perf uses all 1's for an empty command slot (ie. PERF_CMD_INVAL).
> > So I'm not sure overloading the return value to signal a failed read is a good
> > choice from the beginning.
> > 
> > That said, I agree that returning -EINVAL as a u32 is misleading.
> > One thing I'm not sure about is whether switching to 0 is really harmless.
> > In ntb_msit_db_event(), what if the doorbell bit isn't a valid peer index?
> > From what I can see, on ntb_hw_epf or switchtec, the old value (-EINVAL) makes
> > the allocation fail, while with 0, kzalloc_objs() returns ZERO_SIZE_PTR rather
> > than NULL. Wouldn't the code then use that invalid peer index in nm->peers[]?
> 
> Yeah maybe return int and pass in an u32 ptr. Thought about MAX_INT as error but we are reading a u32 spad so any value should be valid.

Thanks, Dave.

BTW, taking another look at the ntb_msit_db_event(), it looks like there is a
mix-up between port number and pidx, which seems to me a much more serious
issue. If we fix it as a prereq before Zhang's patch, the concern I raised as an
example of a potential regression would go away. Given that I haven't seen any
complaints about the misuse of port number as pidx, I guess no one runs the test
on affected topo, so now I wouldn't even hesitate to just add another R-b from
me, if it would help.

Of course I'd still like to hear Zhang's thoughts (analysis) on the API rework.

Best regards,
Koichiro Den

> 
> DJ
> 
> > 
> > Best regards,
> > Koichiro Den
> > 
> >> ---
> >>  drivers/ntb/hw/amd/ntb_hw_amd.c        | 2 +-
> >>  drivers/ntb/hw/epf/ntb_hw_epf.c        | 4 ++--
> >>  drivers/ntb/hw/mscc/ntb_hw_switchtec.c | 2 +-
> >>  3 files changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/ntb/hw/amd/ntb_hw_amd.c b/drivers/ntb/hw/amd/ntb_hw_amd.c
> >> index 36bee0d8ac6c..40ced4043340 100644
> >> --- a/drivers/ntb/hw/amd/ntb_hw_amd.c
> >> +++ b/drivers/ntb/hw/amd/ntb_hw_amd.c
> >> @@ -529,7 +529,7 @@ static u32 amd_ntb_peer_spad_read(struct ntb_dev *ntb, int pidx, int sidx)
> >>  	u32 offset;
> >>  
> >>  	if (sidx < 0 || sidx >= ndev->spad_count)
> >> -		return -EINVAL;
> >> +		return 0;
> >>  
> >>  	offset = ndev->peer_spad + (sidx << 2);
> >>  	return readl(mmio + AMD_SPAD_OFFSET + offset);
> >> diff --git a/drivers/ntb/hw/epf/ntb_hw_epf.c b/drivers/ntb/hw/epf/ntb_hw_epf.c
> >> index c47607d4f8a7..dcc5eb4bea74 100644
> >> --- a/drivers/ntb/hw/epf/ntb_hw_epf.c
> >> +++ b/drivers/ntb/hw/epf/ntb_hw_epf.c
> >> @@ -273,12 +273,12 @@ static u32 ntb_epf_peer_spad_read(struct ntb_dev *ntb, int pidx, int idx)
> >>  
> >>  	if (pidx != NTB_DEF_PEER_IDX) {
> >>  		dev_err(dev, "Unsupported Peer ID %d\n", pidx);
> >> -		return -EINVAL;
> >> +		return 0;
> >>  	}
> >>  
> >>  	if (idx < 0 || idx >= ndev->spad_count) {
> >>  		dev_err(dev, "WRITE: Invalid Peer ScratchPad Index %d\n", idx);
> >> -		return -EINVAL;
> >> +		return 0;
> >>  	}
> >>  
> >>  	offset = (idx << 2);
> >> diff --git a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
> >> index e38540b92716..a9fc94869aeb 100644
> >> --- a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
> >> +++ b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
> >> @@ -762,7 +762,7 @@ static u32 switchtec_ntb_peer_spad_read(struct ntb_dev *ntb, int pidx,
> >>  	struct switchtec_ntb *sndev = ntb_sndev(ntb);
> >>  
> >>  	if (pidx != NTB_DEF_PEER_IDX)
> >> -		return -EINVAL;
> >> +		return 0;
> >>  
> >>  	if (sidx < 0 || sidx >= ARRAY_SIZE(sndev->peer_shared->spad))
> >>  		return 0;
> >> -- 
> >> 2.33.0
> >>
> >>
> >>
> 
