Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795537436;
	b=TaOPFJyRzwlE5RilXPnflE67Qc+n7HlnakcX+EQ4A+dUAyw3FUOV/Acynle+M52A4Sh+
	 Ko4GJYVhAh+ENeesUxLFAJAnwBK3xjsvdKE3aD8SN5pFo8KNd5VbIpWZFt3k5I5F7hXCd
	 5BXgXmfE0VdJ7wmeE4iNrXTOP5aCjyAeGsyQX0QL4/BenZ7EpsEEPcq8NuRWo/Pd5n7KD
	 kE47Q1kK85Ta8CzxzEScUe04BkbApZ4EW2j5skMWJiKg2/wiZfEdB9DtxP1+PISGGRhae
	 lwFrBn+g8PZ06LtBu6tF9I0u73yz7XvsHXwd0JuTe+Z3pDe5OI1qalJ4crgexiiAtZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537436;
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
	bh=deJNHd3CH+fRkVEQPkNoohvWehHI1xZKjVVDnu/VGTU=;
	b=ZMChz9XjoX3QWk1Z0CqeQ2rVYgo9OO71uP7sWHFcUKwb7UEsGd4pgzFI8Ib0RiNMkujz
	 o57ZyGzMpZl8up1VQTmdIp1pUDo/jK2LXhJl+QjsmhzPDQ2wEJufDG6aRV2ZTdr7TB1Bc
	 r8rXO87ImiuBfIqjtosxcZPDHJPUQm2ylUYRDOhsKiA/fffp5TiBdWyYyyqjkS4cjLgmz
	 Ft9glKIEdYcUw0YiXVSNCYE3GRcvysQU4XntwTpXQROhQs4VASd3i9lqifOplSGnSy6Sf
	 NpXhYHKxU15OqQAzJXz3s/CtznMYg5XG2IoDyVwIVbLRQaabDSyeMFBzRNkw8upCcHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nsB84Wmn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.16
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013016.outbound.protection.outlook.com [40.93.196.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D2C606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1D2C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nsB84Wmn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiGNfcTYvKKo4csTUGrJ8jKXfwR4QrYnkEavQ3Un7vwOLRBpkyTXvkmZTww70AnOJTEAblbR8bE1n/QRjNCcPRALJtwlHH47KMwUyU27TN+foVwh5sIO0k3VouHj13SmZIaO2xRyWYomeWcHaE5fDAgAhcAKT+f0+R2LVzxkO84/d+U23atH0cJsU/QIUqtzFR03FNk8Fr3LOTmTxEqgvFWuX9f39pzMT3KPJMni6Jpa8Z+bgVBl+07LGS5Woco3d3GhQ+TTz3CaV0QlA9K9+lQxjMSpGrVlCcwT9gYzkJl6FeDbBefNuuFhL8wwDKad9L7M21TPptbfo57yx4+IfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deJNHd3CH+fRkVEQPkNoohvWehHI1xZKjVVDnu/VGTU=;
 b=M/E7HpuLiC8lBr8aHuhJoJTseJ+7bzmfdwnjDrCY0YKSpq9WbDnzNCH/r8r7J1iZ8uY+063S6o1tmcE6djC45mXecMEMMz7xOmb5kl+a7edbd3/97E272puvwuMoCU0SQ0lBAAtvuszsUYs/6TTPa7bf4LMI0VPHqLlM1sMcJLmaSvKC1NBBQAizX20//ndogvDQSvnNNRkCDl6EnB9ChEw69SC//pg9Qa8dtsm5j9GfwBuJgo+QTvKecH8e5q8Q1EV2Zfp9Sg7gpLtbDRJN9YkiLOWf4gfR6INZDTEog6hxvyK1PoosnZKfd+Pi9DRHfIYODntQkeVisHMPoGlu8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deJNHd3CH+fRkVEQPkNoohvWehHI1xZKjVVDnu/VGTU=;
 b=nsB84WmnDPtSwzLuwzJNozBTRopBU6sKKh5gP/6nFKY4mDppzxgRIjnZ4htNJnjdB3lZdjkW3GPqsYVoZ1Z3Vl0F7g5vAL2BgMGEiSY+ypCsj/Pj30/O3vn0gR+590udbAW2Umn4YukS9/H1RXSIrBQo3LMKR1N6H/eFWnjV4rM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15) by LV3PR12MB9187.namprd12.prod.outlook.com
 (2603:10b6:408:194::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 16:23:46 +0000
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167]) by EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 16:23:46 +0000
Date: Tue, 24 Nov 2026 11:23:37 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Ilan Bonneau-Zamon <yolezz.secret@gmail.com>
Cc: bp@alien8.de, mario.limonciello@amd.com, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Ilan Bonneau-Zamon <ilan.bonneauzamon@gmail.com>
Subject: Re: [PATCH v6] x86/amd_node: Continue initialization even if SMN
 reservation fails
Message-ID: <20261124162337.GD2156781@yaz-khff2.amd.com>
References: <20260916163618.GA1395@yaz-khff2.amd.com>
 <20261105135448.40695-1-ilan.bonneauzamon@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105135448.40695-1-ilan.bonneauzamon@gmail.com>
X-ClientProxiedBy: BN9PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:408:fe::26) To EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15)
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
X-MS-TrafficTypeDiagnostic: EAYPR12MB923140:EE_|LV3PR12MB9187:EE_
X-MS-Office365-Filtering-Correlation-Id: 53df47a7-587a-4e98-53ae-08df4a47504d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006|261021121427099003|4143699003|261102123227099003|261026140227099003|261021123027099003|261022105027099003|261009223027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	EccCtAd8rexdNQAeocrnme5/xbxAnvNA5fE33R8jCo/iNvXp9oOU+hYbfymZpew7RQMw8lQJcEJv92WHYedK5VS/k10uLhaoh1XVXZYc3X9/Qqi8xau1GAySVMAx0Mufh9E1ImcVEgCy7sbGrZ+G4QdkcR2KSyKwl3D2k6HfvnOYA2kWQ3/32UYs0pGtDSMYELAkMzlsSwKN4BOLfOrnh3mZ7WbJTBD3M03Sx/yvxYLfSfRyMTa3ezUiXiuSvMmEC3oX1+xuOfY7UP1x+9XRYU3GU4S5mGCV0ckPH5bPZnXEw/OUsK9qW4CPPZzJKblMkzOlI6hNF5EIMqXnPQ+qzUs+E4p4hsXl7DCi0oqF/cw+3XWPh0dFj0NkDgl2GBi9QMCz4z4mInDAw7r8zbibcV4YBTbWS9XcVoSBbxmzd5d1oFjPAWsuafEIuG/KXsMlh8d5LaHSBRAmFhjpQu5ZRrd6F46H19ENmur5TzbMmASEMBbqJyPhXNEchQDXAVULe2OmG2X/foLshI5RxlQePUcREJAmVjDIJxvnRMXEZXFI7EtMoffKrLE+ONudY7plSJkzx6kovE5v8b925oiuR4hHp+oJnIkV2Izl07b2lit53nbI7tFmGggeMBwJiX51yWLvOkbcLvQsx6YgHovfbNjRrXHDuQ1z2VhKEN5Pm80=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EAYPR12MB923140.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(261021121427099003)(4143699003)(261102123227099003)(261026140227099003)(261021123027099003)(261022105027099003)(261009223027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?towWYdVFhTcNzP1K13ziVr8VQ5t5Zi++lCJ/N+qXrTpT8ZrGZi13RkRcss+4?=
 =?us-ascii?Q?sz5HlOJI8jJXBeA80S3X+NQA18uWrPNzE+yXTqbcWbmToO/7OVWwEfvyuFmj?=
 =?us-ascii?Q?34N3kCAkvgrjXarxt0zBIDnfRxncqO6KVaIZ+ukvsy1ZaAMS0772k6mNvydp?=
 =?us-ascii?Q?49cBIZeQBHDIMN51JsbHPzw2AMbvSlxtolIu1NfRy5MrD85pW0DbosjA1Gic?=
 =?us-ascii?Q?AzRzWSdv1wmhuoKgROMTaM3oIu14RmLTspGgDSZYSuYMpyBINGVOLlBbX8Mh?=
 =?us-ascii?Q?VihjdgRz1PMLGy3QBAiCjsRxofQMg+kfaPYewBATkrdq/xugyfXlge2SzFI5?=
 =?us-ascii?Q?tubUz/nnKYm6q9URUDEFCemGObk+WA0L62NKjPMl3XYmSNh/0W78pZl60bAS?=
 =?us-ascii?Q?X5V67KOfnPefYCJD+H+Pluc2+tkYuyWrdbw6K96TsKauXZc8uP6RddVKnFEf?=
 =?us-ascii?Q?cxJHUwKcpMqNZAYJNmALzYw9CpBnzWlM/QQ1sGbmwEFIEqKpWoxMVBF792kf?=
 =?us-ascii?Q?L3L7v15EyurX2FCuKCNay7SMQHrVzaVcPDr5Uf2Iq06mrMoXRVFVFzs3WS6/?=
 =?us-ascii?Q?wRCJsoCRNNunedzLhxBHvWY0j0M8x+8jPul786AWQjZf0+bXCKUWtqK3gLa4?=
 =?us-ascii?Q?ofrlTUKyMiVjonOromzoyt+Ke5UWLVHA76VfLVTyTmBOQWwUgPDqclBFd7EB?=
 =?us-ascii?Q?y+ceB6bMgw5iIOj4ris2QqQyHxGsev9rV+G8noWneQvPvBRsuQ6zqm74yPaV?=
 =?us-ascii?Q?bsSSQcdrh8NgmCY6UUrsg8hvhEBp8s0ScI7Dd3X3eUT7HjH6PsSM4veoZXU3?=
 =?us-ascii?Q?bBbzqiI5jQPpvfXFrKF8oaN2XdFkAczipDXUsuJ461+PwKKBImBLx8EZdda6?=
 =?us-ascii?Q?jcI5c8docv8qsjm6wPqOLIzaVW+mff+wHYKj/Xnqrjt5cCTDV6e3YT1uY8MO?=
 =?us-ascii?Q?T3irWeR7iQ68NotCVvNXkKG4eLms7NOu/xaBv5fkopxPp9FIbS3S3YD6YL5U?=
 =?us-ascii?Q?tFQBBJaytNdR5lWEMkOEc1TvRT/wtlnJQuSkQiS6MDrXum6mo4r91viB0qRF?=
 =?us-ascii?Q?ezc8EnVUKSjoKtz6djvTp85trwT2Q4YCYDcPf2Ktqh1UuOU9X92nYbsjmbyy?=
 =?us-ascii?Q?33lq6grryPZSy5O9llprHzXoHgkGZWu8VDk5yDso7VUSMk/s2ou4N+EVorYH?=
 =?us-ascii?Q?IJF8+39TDuTZOzxuRlrJTdaOIIYMCSgxa6xaGlBfI7pn8bVB6hp3iChgor86?=
 =?us-ascii?Q?wNMBp8c9GvdAEmQYFevKAiUSbO7y0y3upCF05voWQXqrKyy5rl00jfR0bANn?=
 =?us-ascii?Q?Lw30iflkCahqAxOuiAooqE09toMChFtHVLhkqmCtgQb/nHXElG32dlE5rgtT?=
 =?us-ascii?Q?zEg2cPGub7rcep64KN8jqwci79tJZFoWGjoFPaZbPtkrF0lyCkWmyD+MzWOX?=
 =?us-ascii?Q?EFVOoaxHZILlEtLkHWfLAj3EUWxyfg+7kXynLUj4rJ0NQSM19jaDPzbo36+C?=
 =?us-ascii?Q?KN7ISAbVuajtFl0fpdFc7GuQu32QZ/OU7NHwSb7rb9flWuvDfWXt6RBOaLC8?=
 =?us-ascii?Q?gC97mCUTdxLcxG2ycrMW3EkQwA1Wr8K1wbaKQRNpvQYzrpj+HJm7vyNaDosp?=
 =?us-ascii?Q?Nw0dsTfU63hWgr7LUCZb4rzR9zALWWOEQruSB1cTszkCLXIFgC9ACUV4rieX?=
 =?us-ascii?Q?hIr7z8Mesqf1dNVXB1knZeyWqqmvEHT3JxWGuTQ8WyPrL8Wo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53df47a7-587a-4e98-53ae-08df4a47504d
X-MS-Exchange-CrossTenant-AuthSource: EAYPR12MB923140.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:23:46.1051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBq5cyWV69/tXMI3sx1E4Zf/N0DxrTC3xOA4CebM3TYvUbr78+XlGJPwJ5cqEjsnFslw9IA7qbLH9A2dUyxemQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9187

On Thu, Nov 05, 2026 at 02:54:48PM +0100, Ilan Bonneau-Zamon wrote:
> Currently, if reserving PCI config regions fails for a node, amd_smn_init()
> exits early. However, keeping successfully reserved regions active helps
> prevent userspace from accessing those registers even if one node fails.
> 
> Change amd_smn_init() to attempt reserving regions for all nodes
> unconditionally, logging a warning on failure instead of exiting.
> 
> Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Signed-off-by: Ilan Bonneau-Zamon <ilan.bonneauzamon@gmail.com>
> ---
> Changes in v6:
> - Attempt to reserve PCI config regions for all nodes unconditionally,
>   logging a warning on failure instead of aborting initialization.
> - Remove obsolete error cleanup labels and release helper function.
> 
> Changes in v5:
> - Drop __free() cleanup helpers and custom release logic, switching to
>   traditional goto cleanup pattern (as suggested by Borislav Petkov).
> - Fix changelog attribution regarding brace removal (noted by Mario Limonciello).
> - Update author sign-off to use legal name.
> 
> Changes in v4:
> - Remove unnecessary braces around the kzalloc_objs() error check.
> ---
>  arch/x86/kernel/amd_node.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
> index b7926ba3610a..c0391b081c0f 100644
> --- a/arch/x86/kernel/amd_node.c
> +++ b/arch/x86/kernel/amd_node.c
> @@ -250,8 +250,8 @@ __setup("amd_smn_debugfs_enable", amd_smn_enable_dfs);
>  
>  static int __init amd_smn_init(void)
>  {
> -	u16 count, num_roots, roots_per_node, node, num_nodes;
> -	struct pci_dev *root __free(pci_dev_put) = NULL;
> +	u16 count, num_roots = 0, roots_per_node, node, num_nodes;
> +	struct pci_dev *root = NULL;

Why make these changes?

>  
>  	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
>  		return 0;
> @@ -261,19 +261,20 @@ static int __init amd_smn_init(void)
>  	if (amd_roots)
>  		return 0;
>  
> -	num_roots = 0;
>  	while ((root = get_next_root(root))) {
>  		pci_dbg(root, "Reserving PCI config space\n");
>  
>  		/*
> -		 * There are a few SMN index/data pairs and other registers
> -		 * that shouldn't be accessed by user space. So reserve the
> -		 * entire PCI config space for simplicity rather than covering
> -		 * specific registers piecemeal.
> -		 */
> +		* There are a few SMN index/data pairs and other registers
> +		* that shouldn't be accessed by user space. So reserve the
> +		* entire PCI config space simplicity rather than covering
> +		* specific registers piecemeal.

Why change these?

> +		*
> +		* Continue attempt to reserve regions for all roots, and log
> +		* a warning if reservation fails on a particular device.
> +		*/
>  		if (!pci_request_config_region_exclusive(root, 0, PCI_CFG_SPACE_SIZE, NULL)) {
> -			pci_err(root, "Failed to reserve config space\n");
> -			return -EEXIST;
> +			pci_warn(root, "Failed to reserve config space\n");
>  		}
>  

I think this patch could just be these three change lines.

>  		num_roots++;
> @@ -298,6 +299,7 @@ static int __init amd_smn_init(void)
>  
>  	count = 0;
>  	node = 0;
> +	root = NULL;
>  	while (node < num_nodes && (root = get_next_root(root))) {
>  		/* Use one root for each node and skip the rest. */
>  		if (count++ % roots_per_node)
> @@ -316,6 +318,7 @@ static int __init amd_smn_init(void)
>  	}
>  
>  	return 0;
> +
>  }
>  
>  fs_initcall(amd_smn_init);
> -- 

Thanks,
Yazen
