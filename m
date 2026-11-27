Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795780080;
	b=0B2dAvc8BbncQNyw88SUdaFfCUrpqG1xLfoheJvMrtjPwmhuB2ePk3wy2ulJcGTJ+71N
	 wzaC3MTshzWR66fYIg+QNjoK5nOBSkk+hIchl+sZNfH+FtD80PN4H/5Vuf2lc6yTHkleE
	 HmCnOFQ10J/4ii/+91/++hxHRPssFhtW1oQamKcPDx3UugeOac5poOGj/rYjdh1chDzhU
	 X6Hs+LvNvhJHDS9F9aPLKPGkAfL4j6yfld5ZWIba+T8HhMoNj/fw7osMTFqQ1OG/tvghS
	 XSKW2iFWD4WnraLeC8Jsj9NHsogXxW3Q2j+aNt3hT6Nc330i65cBVp3ZAriwEMS8c+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780080;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=6JWgFZrzz9ARBF1ycttmTB4lPDLZl87P5apJKe4HnYw=;
	b=STR0YfoHBGgfy7YDohN+07g1mOC9G/Htdxl+6MBueqNg7BEjtipngiUxi+jVqrrpd+mC
	 d3fzb6iOlPqGS9r/2EE4rloMSsb0iE4v2B2E8hSSMHtnIxgrJZapghoXo4RzoFtk96OYI
	 CX3jXQw+cVYDgUfmWNxMA/qsVUrq3SnHgtYpPDAgJtLRBApWPnt0Q1pj+PLxplMCrh48O
	 y1f9W/gT8qy4/MJSjsRTcE2jukd73vqH5142KyN/2e+bcviktqYG+hheaaIZWf1wz35c/
	 j87dT73OJIQZ7vCRxC//b8PSVtR7ruEQeIAw9WX6u/Vf/7s6JHUudhwUffwpqIG7L+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="A9wLXR/1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.54
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11DE606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C11DE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=A9wLXR/1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yd5IeS4SpuoaoCaWkxsCZy9Bs0wScuSZaUdB50vTjUyOrBrTqjS4NykV8mnhJKW3t/zebjSLBET05hcohJZw+hDVbY6WW6soJjIgB9JPUtyfkaZ2QjgN8adBUP4x5dE8EQHFYuvo9r0pZvFkI7VRVCfM3zYxsT1hsUq5o1gdEyYUcalr1wl6acr8aVqwLXsAZAdfe2vflLnNgTfP2DAVpqMoNQtRaNUVblHQKTL/1Dv9k2OGepo93oREQzxcbs8q5XvTyQ0NrtDesFXQKnWY41RPs76PlN7Mh3QS9BJawdkI3o5nd0FLy3eZ8MmzyADjyL81vUd6FUX+gCglCzSs0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JWgFZrzz9ARBF1ycttmTB4lPDLZl87P5apJKe4HnYw=;
 b=THiCMzPUfhj1ud8ojcls3kR7q/PAy6yvjoXFFB+fYoCMQZR5RQUgBTwI+v2HtoCPjSEuQ/B9gq+K3Nm30zPogBqjulqQDm/etw2iVcuG4MgFD9gCzTSpgct0HdVcOWg/HCqeiZ3stGHKA4DEZ31UH7L9zegFKwwOfYLwFV9VxAxgUBkzK4fhoi+gSNKGCZlnKMbnpsg/xcetauVkUnfzJtGv5SWWOa5hmZEusVkyFKlC+pNpvOyjCZUtAaql02QxX8mTsV3x4ug5KKshuQNttJLm2PNecOCJULqWTcHV9GMlvT0lbCh7K9BQACAwJwYHWx72w8GsmrdFJMZ652YASQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JWgFZrzz9ARBF1ycttmTB4lPDLZl87P5apJKe4HnYw=;
 b=A9wLXR/132FTTmDmCCpO8/jdrBNosRFiK414Pp41jY75oGvq0+Ym2YJeSWu5A1OLXVY8mE5xpuGNLbO3/KBne7EqPwJW2LkGB1vlkzqwfSpqS3Kg/lMiGuKA3DTNx82T5ZFNq5K/3g/0HswLzxbkf6ck7V+ESGjP/3SKAPb2p4o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DS6PR12MB140904.namprd12.prod.outlook.com (2603:10b6:8:4f4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 11:47:55 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 11:47:55 +0000
Message-ID: <937b4d2d-9ec9-48f5-847c-4bf36c79dfc8@amd.com>
Date: Fri, 27 Nov 2026 17:17:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] cdx: register shutdown callback for cdx controller
To: Abhijit Gangurde <abhijit.gangurde@amd.com>, nipun.gupta@amd.com,
 nikhil.agarwal@amd.com
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 michal.simek@amd.com, shubhrajyoti.datta@amd.com, git@amd.com
References: <20261127095417.282425-1-abhijit.gangurde@amd.com>
 <20261127095417.282425-2-abhijit.gangurde@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261127095417.282425-2-abhijit.gangurde@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0094.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b8::10) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
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
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DS6PR12MB140904:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a04533-b4a8-45db-7839-08df4c7c462f
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|261026121527099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	lsNOfVHfNE5Qpr7CqPGKR4WeivfcJE7TnglbJcag/J9rQjybTluGoHlZUb3/tCc3xkDhecjD8356u7eGYtF3YTlG8Dp+xilID3CoHNrFkHhEG5dJNhFHDJjWlXQ/+uZdDr7onRTIno6M5tJGULylwvBXHANRWr1YHfA3spFkWRtin7WXJAAtAchQrwZcLm3LvtRfKIY2//46ZvWprD7HwlEdKsNA+Iqmjl5JvMz+TKsvlNs23g9bAaDQ0UimsSb8TrCG+9fq8T694yj4azeoG3DBdw4xiaAdZ1i03T7PxPVqr4hIxpCX3OQO5r/8GSNp3oTvwFQ4ngJtDXEy4GkeJ3/ptweMHwO7jBO/Qu5ZQOis266L2qwAEtRqrGHp+NxdQONilfad1PJ7U0z3RepLVyYMH+oGGLF6RXRt5Ow5woTjpvQP3Wj4W+PC3ELRXrliXCEO29Dj81dDC7lpI0u6RTWY3GxCuQBo+HN5MXOHgkvxMdORW6iI/b+6Q+/qAiV+2zzz6cZP1UYTsR9l2wJq45BArs44G3oOi+DiLozJ+I3Xvic6FgsjqlAUK287DIhCZIdTYM8w//3PhVwmJpgjomp5pg16nI69dyLaCHQIpQ7NubuBelmTMXeEEzVeIFkploxTZk7DAGsAehJluz6x9Hs4bjl1OKgux+lHnho2VRM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(261026121527099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjA0Q0loelhIN3Roa3FiV2ZIdTVsNm9MWjNueU1IOHAwU0drNE9UQVc4ZUFN?=
 =?utf-8?B?aC9nZEg2MmdpclNMMFJ2anIvVnVEZzlUblYrbm1BL1B1VkJhcHB5R3orNGsx?=
 =?utf-8?B?V2lzRXJzbmplT3J6L3VKbnVXc2pVT21KM1dsUW9scWJYa3laeEREYnkrdzg2?=
 =?utf-8?B?amZleXQvV1JuSEhTZ25IR1BhWDBscWdaK2ZLdndxZ01HWjJ0MENGT0gzZUFE?=
 =?utf-8?B?Q3U3OVFmL2xDaFROazJZbVRtV09lbldFcy93NWRsYkhmYnVqQ1pTNkpsSnBY?=
 =?utf-8?B?dHQ3d2JOL2MzcExnK2ZuZ0daNHkzcWVmeS9UTDNnOU4wVmlzbGRsL2dqRFMv?=
 =?utf-8?B?aW1zK1g1MUszdjJ5N1BnclZNMjNydDZncm02eWhkWGRxMkVNaVNtUGF2RXdv?=
 =?utf-8?B?UnB0NGd2b3drR25Vb2l4YlBuN2FQNUQ4ZDl3MGdvc2VZU294eEVIVDFOMnZI?=
 =?utf-8?B?WitnQ2RlSm9NMERDY2pYSytyNnhQLzZ0SW8rT29sZWhMclhkNStBNlVRSGVK?=
 =?utf-8?B?RnhXZm9yNGFiU0h2a01NaEVUUlloVXUwWmdzM1RTWE1FNGxPNW54YXUxK1Bl?=
 =?utf-8?B?bjJUQ2tGMS81c3YwQVRPbjlnVXNLQjY2c2lYS0IyODZTdVJvSTFBWjlRbTdF?=
 =?utf-8?B?NVdiTGpPQitsS3Y2NXhiL1I0ZUZaWUh5UGlpdGZCaDFRWVNiWU45VkhxZVkw?=
 =?utf-8?B?ZTIySk1OcE5KQS9RUzVaM1dCMDNCUndsY2RmaVBBcU5PVmZ0OVIzSmdrSU9a?=
 =?utf-8?B?b1BXZDZjRm1rUGg3dUczZHFGc1U2dEN4cXJScC94RnhTR3Z5VFlDa2w1Z3Fy?=
 =?utf-8?B?eWExTTYveXY3WEc3dncyOURpbVFKS0svR3dudS9OOEdBRXhQUWhsL2gzT2tH?=
 =?utf-8?B?TGdORmx1QzZsL1pwa3JMWWVKcTlpenhkS3UxTGdiUWhaamdhUTMwRDJ4djNY?=
 =?utf-8?B?QzF2bkFubVJQZFNTSHBoUXVscTloYjc1d1d4dG1JNHRVZ2NsRzRaZWRlRWlC?=
 =?utf-8?B?VktDZ0lSOUhvdVF0L3ZPYUdrbzlLQm9mblZNeHZuazEzVnl4NmliYmhia3oz?=
 =?utf-8?B?N0d1anVqSU04V2EzOTZ6K0VtUWpPY2Y3OW9lMjRjWnpiZ1dSbmVoUUZnZm1k?=
 =?utf-8?B?WUxFWURQWWJGOW83dktwMmJCQitlaXJsSzJvUUFwUUtrbzhBOEZ5Q1d3bFpw?=
 =?utf-8?B?N0hrQzcvT0hJcld5dDh3bUFzZnUzUGN3RnVyaWdITkhTZ1VReVVpSWI0dFNC?=
 =?utf-8?B?TEhGSnN5bmFML2V3c3NVdHVVRS9vY0xVSVVUV0pnd3ZQeEt3VExGT3MrM0Vu?=
 =?utf-8?B?Vi84bEY3eXVpU1VvU2UyNDUraTZQRm5jYStReXd0SUdWQXVJSkVNUzViaDB3?=
 =?utf-8?B?QiswRnJYeVRhYTUwRXdtUGszc1d4c0x2dTM1MFd2aEhwbXAxSk5QM1E2Sm9G?=
 =?utf-8?B?NXBScTBMR0gyZlBSZE9obGl1cENaaDVwVUF6TzhrbC9mazNUZFlBUmRLWWMx?=
 =?utf-8?B?THVxUUo4V3RLZVFidWtucUh2WmZmM0F1UjJnS3d3N3BQSlVWbGxEQzBPb1NG?=
 =?utf-8?B?TCtUT05oN2QyR3REU2hxN0o1QWtSanBDaDhBbGhqTG14NVFXMW9zNjVFckJ2?=
 =?utf-8?B?dDVjVlQxa2w1R2UrY2t2ZytXZ2R1eUNPVzc0SUQzdFBLQ0R3NVliYkxpVnB5?=
 =?utf-8?B?VkpTdVNqWFpqTGY2bWVYZmczSmxVeGJlenBiQ1lFVkw4QUdBa0JpWnBpUGRS?=
 =?utf-8?B?RXNIb25hMUxYRGJrb21uT29UQjVVMEhadXZ6UllESU9zNitRd1dRQ0RNSXds?=
 =?utf-8?B?U3g3Q0xPSVE0U0Z6K29zWkpiRm1BMXNhRkZMeTZSRWc5QkJ3UmcraGkwWXIx?=
 =?utf-8?B?NjBxblYrMmtvZ21YYzE2UzE1YUhQMXhaTk5SeE5JRFJVeCtHQUJkdWwvVzRj?=
 =?utf-8?B?dmpjUjhhdHRXODZjckR3QXNJUXlYR0VoV1o3aUZsUFZnd3VlTlBMazN6MmxM?=
 =?utf-8?B?Q1MvOEF0blovV1FraTFOMVRsNmZNSmZRQzV3K0M5SHhWZVRFMUQxMnh6YlRW?=
 =?utf-8?B?Z1EzR1ZMZEhwa1FIMGdTRjl3V2ZLSFVkZUZoSkFNYU9xTnI3bmcvc053REkx?=
 =?utf-8?B?V2Y2d3R0Z3QvTm82c0ljdkVmNlZtdm11QnNtcTVnTTdYVk4zMmEvL2pPVndp?=
 =?utf-8?B?amlvMEtwY0IwZVVoeDJ6RDRBRmdjeE11Q29qNnVMQldaNDRCdVFrREtYZjg3?=
 =?utf-8?B?dmJxVmhHZWxZOW9CUklHSTR3MEp0TXZVdWlpRTk4ZXJVZmZ1d01Ecm96TGdH?=
 =?utf-8?Q?/+8cOTFK5JSJJhAjwh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a04533-b4a8-45db-7839-08df4c7c462f
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:47:55.1811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbusLw/OgTn1ZEfRUXi0F6kDoqXKwzOIZM8jppnbBHvMRxsXCM2P7vEC90PXkJzd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB140904

On 11/27/2026 3:24 PM, Abhijit Gangurde wrote:
> Register shutdown callback for cdx controller platform device
> to handle graceful connection closure of rpmsg transport.
> 
> Reviewed-by: Nikhil Agarwal <Nikhil.agarwal@amd.com>
> Signed-off-by: Abhijit Gangurde <abhijit.gangurde@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
>   drivers/cdx/controller/cdx_controller.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/cdx/controller/cdx_controller.c b/drivers/cdx/controller/cdx_controller.c
> index 960c4f8b6b30..8b7119d056e6 100644
> --- a/drivers/cdx/controller/cdx_controller.c
> +++ b/drivers/cdx/controller/cdx_controller.c
> @@ -233,6 +233,11 @@ static void xlnx_cdx_remove(struct platform_device *pdev)
>   	kfree(cdx_mcdi);
>   }
>   
> +static void xlnx_cdx_shutdown(struct platform_device *pdev)
> +{
> +	cdx_destroy_rpmsg(pdev);
> +}
> +
>   static const struct of_device_id cdx_match_table[] = {
>   	{.compatible = "xlnx,versal-net-cdx",},
>   	{ },
> @@ -247,6 +252,7 @@ static struct platform_driver cdx_pdriver = {
>   		   },
>   	.probe = xlnx_cdx_probe,
>   	.remove = xlnx_cdx_remove,
> +	.shutdown = xlnx_cdx_shutdown,
>   };
>   
>   module_platform_driver(cdx_pdriver);

