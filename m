Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795773295;
	b=DyCZfOnpeWMxftNY68Arq4dyTjC4DTiQnXMyRVQX0ASmLQHSwAvapvM7eN4t0vfPqxeV
	 tp+SOXKENDZ5yntZEvpbtZ5ItVN59Y7GvloBMHbbHYD9yaI1w/5+xfU4krUWX0WO69OSk
	 q6l0Iy0q3/8p6oa0KziTjxx20LOnfRpZY9VcPcnUjr1gUw7qo1TjkbG6WdnCQFEnvU0TI
	 +eyLaXtqgqpDrhcs+lwNaaTgpezTa37GCNyAzY+r+FugX5jZj9Njmxeb8PFiXAeSNy28z
	 kS7EP7BfN/mOv1pcJ0HswHXxHZ0EDQAT/hzrFeTFHKvkWk05xQqPAUYgewtyNL3Uikg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773295;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=rHglIdeU7OJv7MkgFgbRxNpz5600CMlTzwOsFEdsSNI=;
	b=DM2QdcqzByjNs8iugFexaUXHzAB26QRr8GlaKJQ4l3hI603u4gNsxxJ28yYabgGvh/n5
	 Iw9yRBTrU5FkLjP9OV2SKgLcHkHxpFXFk0oFQzqTqgwFEcPi0EHxpkgYtCmezkQGWg3f4
	 D4DkK/igQmx3nQR38Gbl4AStp5o4zeOOP6Uw6mA0bX4/lNd72NBtMy+Ozfy66Cl3r8elm
	 axrjaiDpNgIsdlOFzMLOgkGPhv3jQuHFbqJ+1Kg0KBP85jWdYrN6U1h1sxrr5ajMOW4To
	 IxC9XN2TypRbT2Udzk83DJ8fFv0csKPQT9vdCdHbDAQVZ1jFlIeFH89UxJM+YDUCACQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nMDdmphg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.44
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010044.outbound.protection.outlook.com [52.101.56.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119C8606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 119C8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nMDdmphg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnjtsCLLl+cyjcOkUSmXx6Co0TbtrZagG14H77NaYfO73FE5rpjws0Rmk6UsleOWT5zR1DbXPvBQmYXez5WyBUSRdzxnB3PvqovdwncgegMYUnzYlIUkJ4wXtPE5GSgUz3dI3Iz7z5WF2e+03L7MtFmkMhU7JmROOEgaNA4nGF2h0rL0EUgI3y66F/fLwc2coft9fSn5rYBNZpdjqGzNG0kO5NPHY0LrDwnKrVrcSOPb3QKI0t2KZZcwMRH0qqhjI9tP56TTdBGgHaAY+bD0hEsgb0aEn02DLNHqe+PhkN8GQSOZfI9cz61tCj3+0pyx+iaK1UoviGFAm3wlno+nPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHglIdeU7OJv7MkgFgbRxNpz5600CMlTzwOsFEdsSNI=;
 b=gXgawXdcMSm0MESWTTv+DQpfSAm5YdXu6aIEGnnMlYPeb9BXBZQZ6E7dGO0P1eaYuyoNw/7ewdyIY0/BUY8hNGPLxWi1EjwuVpwd0OASdgca9ecFpGh66FCeMs0rpTDTYHa5uFeCbGk4haqiTsqFEM4Gb7XsH+8PzkoFQGmAQWKAXqHxPpgpLHwQ5Sb/Rn1fSoJ2GjGoaOSxpE0EQ+2X/UmvLFa1rK4HlQ6TU7GkhjX5NMv9XoPOa4hF1Dn4sjyGSqQgeXElluRekiRFXL14RVrR7kWKf1IaGEoDq/rFANjQ4C2L9Nk+TXp/F8+t81GwISBO7saGqAkb54Zu8rtPnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHglIdeU7OJv7MkgFgbRxNpz5600CMlTzwOsFEdsSNI=;
 b=nMDdmphgdP1vGqW2syaK41KSSCXnFpFMMlaPVyyIQtrhJKWVoHHSbL1gHUcSGPkN4CY+1mM+wxDlzTImvyTXcMRbnAOaheEolJiDd4FufOfGWFHaygS9ClR0lnqfWOWmSH+nD8Im5WNA7uEizmkJ1U+MoMBex0BKXG9eASK7ajg=
Received: from SJ2P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:5db::14)
 by SN7PR12MB7345.namprd12.prod.outlook.com (2603:10b6:806:298::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 09:54:44 +0000
Received: from CO1PEPF00018860.namprd02.prod.outlook.com
 (2603:10b6:a03:5db:cafe::87) by SJ2P221CA0004.outlook.office365.com
 (2603:10b6:a03:5db::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 09:54:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00018860.mail.protection.outlook.com (10.167.249.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 09:54:44 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 03:54:43 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 03:54:42 -0600
Received: from xhdipdslab46.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 27 Nov 2026 03:54:40 -0600
From: Abhijit Gangurde <abhijit.gangurde@amd.com>
To: <nipun.gupta@amd.com>, <nikhil.agarwal@amd.com>
CC: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
	<michal.simek@amd.com>, <shubhrajyoti.datta@amd.com>, <git@amd.com>, "Abhijit
 Gangurde" <abhijit.gangurde@amd.com>
Subject: [PATCH v4 0/1] cdx: register shutdown callback for cdx controller
Date: Fri, 27 Nov 2026 15:24:16 +0530
Message-ID: <20261127095417.282425-1-abhijit.gangurde@amd.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018860:EE_|SN7PR12MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f5869b-d51a-4e26-11ec-08df4c6c76b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|10067099003|11063799006|56012099006|261022105027099003|261021121427099003|261028144727099003|261026121527099003|261026140227099003|261009223027099003|261022075727099003|261102123227099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	9DqfjU5ZBhcnfl0XVaiU4Kuu2mpURyDmq8PjrncRTrL3KzVogVwPf1FnpGqBShI1mdpQHp+u8FK9huv64pT88e+et4hXprSQmU7UCdXLKvzRPh5bxKAVKxQGcYhW1JIbETCXsgqFRulSPFy9Bxxot2dcTlspM93yhgbuQ3As3Jax33cXW1YOllG0LNQ58zBMEkppnlWNOYPYv6h+nwHP2gtgRDayT3RMhJpO/QrOYSsWckbbTIyJKbHBuuwSjhjOms7YqSCgx6t6pCJBxw0w39fMuwDa0hWrFHgRKV97wnb+mgoahUpXraer/OtEuqldp6vEpjce3cRYzp22Md4eHfiyCZDifgVzDdttPjVJXc9TOm1rPdRr31+ERGJo+LhhhewR0XnOpdDcvyzbfOR449ThsNM0cs5Re+CwhUrPh+rsFvO8j54e2r3VZa0YrcsrrnP6m4edwQKhKm71jF57ssneId/EftOaIdTm1P4975Mfgb6aqzsFugJeL/SXC7s4WM4Z4E/SYvWQR3n/x/K0jWKTkCs/Gj84TVxxeaOrYfxYA1MOWlXOQ2iu3Xtl1RIVDl6HsKfBbAzwgdqUaxs/al1fnob/rrRZsTA5X6BmTEL1J0B34YLIAQ9UDlompVzsqKKWI+Y75VcmHL650qhDBcY5lM2atMJiZH/JJK+k8qI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261028144727099003)(261026121527099003)(261026140227099003)(261009223027099003)(261022075727099003)(261102123227099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6Nlo1FXditZewuKvZuWGR+F1IIAQHdIQwTuEW3luLMEtzamdqgw7J9/AK9vFHvFUSe+f8RRqIXm0EfWzbxqHpcDRDM+gU4Q34QNI1i2GqNU2koFWOSyJwHWpDH+yb6f8A8BbX2jlhzXgoCFqbNWcKlgdvBjrMdSZAiX7kVzN21NhHz6iajdL3H8gqjyQ8vh/30sqBcrirqb/DcdIMLZZtxFWEhxn68Wwm1wLNiDkf3j+/70kXvjR21WfTAg89ekMwr2JenttUEBHHdgRn2xoFMnAtU/MKinVIMo8Hmu7YjwfZgJTvebxzjJUADiuUlsw3BhCL2aKjaZAKoBkqtbU/H3zP/1R52MNn5J2ZM/rGWWf7v1zxIaeBjuRykJBJB/PrsPPCIKZPg5M4HOkbVCKFcW6beHObBHQd3DWzmlYYtuzng/HkIbLEJhSZYhUJ6rr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:54:44.0438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f5869b-d51a-4e26-11ec-08df4c6c76b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018860.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7345

This is a resubmission of the remaining patch from v2 series.
Patch 2/2 from v2 ("cdx: disable cdx bus from bus shutdown callback")
was already merged as commit 6d2478a103a8.

This patch registers the shutdown callback for the cdx controller
platform device to handle graceful connection closure of rpmsg
transport during system shutdown/reboot.

Changes v3->v4:
 - No functional changes
 - Rebase to current upstream

Changes v2->v3:
 - Rebased on v7.2-rc1
 - Dropped patch 2/2 (already merged)
 - https://lore.kernel.org/all/20260708083920.4029369-2-abhijit.gangurde@amd.com/

Changes v1->v2:
 - Split single patch into two
 - https://lore.kernel.org/all/20241203084409.2747897-1-abhijit.gangurde@amd.com/


Abhijit Gangurde (1):
  cdx: register shutdown callback for cdx controller

 drivers/cdx/controller/cdx_controller.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.43.0

