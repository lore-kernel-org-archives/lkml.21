Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795171660;
	b=J1+qXJoKq5dnaWd2gbFMZ2KByh7WF3cZHxQ1XQlJ7FudUi11n1mcoi9h4qEUJkbbahuV
	 Bzf1EtO+uH7p6dQu/s29/f+YFo+vkvnQWMolhsHGfU5/piQFBWGNuErGue0oYJYbD4m1H
	 rOqCrKADy2Wq+bTR2rh1jGLnlwvM8/VN/3ztWbaV1AL3KpDJLNxF5dJLvLTXvZv2CsfuC
	 tEZrRc3Mf2XJspXmFYm90ru2AS7hAT4EBDLey8cUt8IpxMErop0wT6SmEH78enOhb8PRn
	 V+q6DSlI2bxSzcT3yPgc3lKUekFj1q8IDbgXkgSuuYri6iPqaJ4ueCinp1WSWN/yhQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171660;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:X-CLAM-Verdict:X-CLAM-Score:X-CLAM-Description:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=t/cJOtF5zbScuECBrYmxwbl4rj8yw8OSUnkcnO4Cg7s=;
	b=wlxFJxhRDOyIlku1jV1ewdW0ISRyAnUd1OPiumZwI2T8gSkuBPj/2vCFflP2mufBU2Db
	 IbmN74WgRILuJnnz5dYIr8SnnJsB/EVgQ8JHn8AkYEuAh9YFro42vIncASJQ/fFyjOtxu
	 DW47EbSRZaI2dwSL3Bmv0JJgAqeDpiI4ld1zEzCIDc3UVal36RpJDtkA2h4yQka/sHFFx
	 A3aqUoIVcQHgL55zUpER2SeQDflv+iL6Npy55y5Qsj99xxqL1JdV0T/OGYnh1bDxiWLL4
	 ZS6a5wLdvuxfiTcyLj+QhvtkQyOlcX8NkFbh5nRvmJFBB+Vt4GuKcfzYEvfG3Adjo0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=philips.com;
	spf=pass smtp.mailfrom=bbl.ms.philips.com;
	dkim=pass header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=IyrgHvfK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.4
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011004.outbound.protection.outlook.com [40.107.130.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158BD606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 158BD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbl.ms.philips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=IyrgHvfK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGt/LlUCRP1qHQ89ApFjrsD75Z+YNSoC8KIiO/PN4DRIid2Rs2EI+oxIZyEZOHle9f2artTlHufeMHDmUvH1Hig8sQCtJhJtipoRuP0Jm9fls1SXgAIrirOP5TVG6bAi70uqeRE/Um7M5dehkNOdWH3SOXaFKs9cJ4V3Q/aHy5BlfzNfLDaOjv+dLslvNW11Pqu9EV80YWiS4/KWkZ3dzyRvrx5lj0XtPuVPZIEffOavUP2tgjr2/5oyIsHUaA8O2qbZjovVr9+uDklBwfRuzs+j5q1HnR9O7XUskcEbzzWEXsY+tbVIT2oOq9VwFv2OKaVdjC2DGCi+9J1ReIVagg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/cJOtF5zbScuECBrYmxwbl4rj8yw8OSUnkcnO4Cg7s=;
 b=Ww0EaZwBjM7PM6UCUU6qtW14TRSNymo5gOhJwjRkMOxNP604GwScLJuAAQlOA2nyQeQ8EJ7UockRFbB0E2PkdKZ5kkugPoHJ9XGGaj8ZNvtnSemk8HXxMKQI+u86XqjEZyqpBIwbShPY9JAjn2ipJ152mGz7ImSWzq7YwSAn5OiNOB9tgURdBsQJjoUhKmchO0PWG7SmKo3J0isRMTKzDwdcu7e91755+o546wBHCmdQbjyIkp7hw/CTUs7LjPa+ZtAhq200u1F7QCXrDoZ7k0t2k1DqWmO8hPV0wXJABGWLJtEsE7A8yImu9rHYq86F1ikVrvMLefmv3D0XYUzUhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/cJOtF5zbScuECBrYmxwbl4rj8yw8OSUnkcnO4Cg7s=;
 b=IyrgHvfKhlKhWYGZLdaSDYPFxWy8eegNgI3ufQKgzvn15bXfsiRy+mvrbwyNuHtA1MSrQK1MNjpAjjemFre8c+f5bSkxYXHq2L4QMyaRtZvkcaOBVPtaro9nideEw6xNBNtxrvUm59h5lgX2hoeUvgmKLWXrMFq74X/KrGo3030=
Received: from DB9PR05CA0010.eurprd05.prod.outlook.com (2603:10a6:10:1da::15)
 by AS2PR10MB7852.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:642::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Fri, 20 Nov
 2026 10:47:35 +0000
Received: from MAD0EPF000008BC.eurprd04.prod.outlook.com
 (2603:10a6:10:1da:cafe::38) by DB9PR05CA0010.outlook.office365.com
 (2603:10a6:10:1da::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 10:47:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 3.248.88.141) smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 MAD0EPF000008BC.mail.protection.outlook.com (10.167.241.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 10:47:35 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id UBfHxpHWdf0UDUM9Xx0Fmw; Fri, 20 Nov 2026 11:47:35 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id UM9WxTZ7kbtn9UM9WxpUBY; Fri, 20 Nov 2026 11:47:35 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xvg1.bbl.ms.philips.com (bbl2xvg1.bbl.ms.philips.com [130.143.220.100])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id BCACF1803CB;
	Fri, 20 Nov 2026 11:47:34 +0100 (CET)
Received: by bbl2xvg1.bbl.ms.philips.com (Postfix, from userid 2884)
	id BA740FE023B; Fri, 20 Nov 2026 11:47:34 +0100 (CET)
From: Vishal Gupta <vishal.gupta_1@philips.com>
To: vishal.gupta_1@philips.com
Cc: briannorris@chromium.org,
	francesco@dolcini.it,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath6kl: synchronize scan request completion
Date: Fri, 20 Nov 2026 11:47:21 +0100
Message-ID: <20261120104734.7646-1-vishal.gupta_1@philips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028135818.4166538-1-vishal.gupta_1@philips.com>
References: <20261028135818.4166538-1-vishal.gupta_1@philips.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BC:EE_|AS2PR10MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: e007a749-47ed-42fb-5374-08df46f3afeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|30052699003|376014|36860700016|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	26BxNMuGzgR0/F0PTKZMToZqth00m4yLMQ8lGAvS2xzCh6NxrpzbUmoPen9QxTI/7h6Koz4VFNWZVsVpeTCLpzSDonsrXiepSA8DnNRmH8dzrTE9zhlJGMhP24eVDR7EtrmIRz/POzDawG1CiIRR09chpQglbmSCsuZuko6DjXcSv/xzpVPC+Co5HxTtFFw/17o1TX/WaFeniUunbjZUdY55gEpWo85q6yDvFgBiZ1l9Rz+QcY4bP11+g/vvohtZ2RYOHGY/PE8All9/SvXYyX0pl92mUcG9rpuqgQ654+LHDdw5MI1pbf5EjONKV0Z0dp/gKt8TzSugr7rldZRX69BbCDsSU8fCmf2Ych25oLb34l+0Px8IZwupNJAJc8ddXCjX11jSW1sZPqQXxkupqAthmo7X/83EpWrHLmKVCYqcJ5iBRIQbfky28FYXOPglZPRzYN5tdJB9Clo40EP7JLPWQxLjT366Ww8wwRlWLMwY15laUNL7l+Zutne7ZgVbwCLqn+iHJlvLCdxh5giOa8tv0NseKBYJXG3hat0OlkfQsKzzMxQgZHcwn8IjC+bLhXRqS1kYFiemf7s9HnqBDpUARWLE7r/4eGUUtBCRMH81ZGkPrtcVq/uBCyGmG8AeIXzD12e7N9Nmvr5JHuBnzMLT87+WP3RoN2MKJsK6fnExXDDYZs7e72piMAz0cawrY6bPbBOdFfZFeoeDgln4aw==
X-Forefront-Antispam-Report:
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(30052699003)(376014)(36860700016)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r9lvjeTwJFoke4E+2f+KdUDzlnr8AbqwY7DyBCKcmz6hr86gg6JDo4HllNSubGmoewfqbFPWFDi//pOj7Z549VYQUUqydq9opIyUFSgcFlUlIy+Gw4Yye0BGjnt+2p22Rf+XB/CR7DaKriuimHuGWxr+rR2Twweg5gsz9vq5y+VlafuB0i3LhWjXvtuC12bTpThzGon/usKsj59gTwE2wQAuGrmSTpzG7p+pIIMj8+ZBYpNR0UxLucCYctSxU6uL2aMNRb15cBQSOaleDOlnnY3uluX8KnwDjsWWaO+UPD38l7ipdNNLkAIn7WjuaNLcyyCzcT1ck/gTY4JjchmsVRNZ0bOOm2u3ihCSyiR4ULuJxkopjMq9Uw2ws7Vgglpnk/A76ts5o5TNItgIg8iqq8uSdDg5ZDpfvOYRXoB/jeHEctey/P962QArgQ/it7Bm
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 10:47:35.1335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e007a749-47ed-42fb-5374-08df46f3afeb
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008BC.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7852

Hi,

Just checking whether you’ve had a chance to review this patch. I am happy to address any feedback.

Regards
Vishal Gupta
