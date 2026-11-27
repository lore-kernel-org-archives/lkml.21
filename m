Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795773295;
	b=czqTsOO+iy7WWJot+ZFbzNduVZit0tcKIuJVjR0RYCO0OoQTxV9cji+M6jm2Sw1rlhhp
	 33DZceVRPqAsLpyCKGQMtWlludqeKxbrJauVAmcxacyrMYOXiwCy4HdSNfZYbat6hzA8+
	 Lap0etCiZG+b0MIl3+N4T0u+6s15iWIKlg1+so4iVaCCp1210STUywFZsegAj1ho/NI7K
	 ly65JYgXKKl9oXDWpdkNKejmP7TSEQgFekIFloTIl4nDHABkicwZ9GchEjZ4lAOjD2He2
	 ZVb4/sgFJx1dsAnflWyfkirNRG0zYcQG+0AoOBjPFXH578siqonE5uEbyDBepO1bd9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773295;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=kkXzDaF3eaS6VJFvp7kAp6/ZENBv/khq1VHA8+CmPX4=;
	b=Xcn1ffoW9aLIenqputV9+Fslh/zQ5QE64ASplZnkDKM86MK/vhsAzI1QSJGQtaA0r25R
	 iKzRKdLhfNKXxtTaKqOu8kJ3vJQZnTHBIBRXi1D0XA8aUthZf5NdUlNK8egX/ICZ0/kH0
	 exk8L8ndp40NRxG4LaalknIUK3EAQ6zpshgwgpglTGBdGqIRectbP3OUvm0jM/poXItLq
	 xsHaZ1Yfw9FcbUBm+9Mi9h9NP/IUfIE4HACkx38GkZaP2KxP5lq8tCIGEyqREYPq2IOHy
	 5ZHq935GOz7o7q90f+2gvuKyRaiAtCGKd4sYJIC2puadwIZvp0Wbxu3D2WC6v/OMRhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gUQkMdfg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.13
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010013.outbound.protection.outlook.com [52.101.85.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410F7606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 410F7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gUQkMdfg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0DDpnqJRiDxp82Zm5lj9L8Rjxit38jwd0w7EEeXf/QxJ0tPvZ8PueJgBBNvk05aNJ2tRIOs77PckbEaNN5F3YZiJpWfSeecMPOOG+l9yA9K9xx+eXvnWS34gmKXtVSkRhF2MEQjEG8CwqHvLFB/mWi83/7IsO7KpTZH47Q81X+5aTiZRC30sFChgYtHm6UlA42H5MFB//TL0eGNfDStgY/ZsNUqdq/xSadQR0qGm+EVJcMyaYRSxz09eK4+TrrG72qDkwNqKuGSYBv8N1hNAm4ZPqr2xtKAiOjAMabRkIIfu4fnGyT2raLWJkEOtdhvA4eL9dhepCieDES2/pddDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkXzDaF3eaS6VJFvp7kAp6/ZENBv/khq1VHA8+CmPX4=;
 b=u+uZXoaMUvAwI3pZzGiKvoQ9daR6H3mPLA3b4sEGccio7HUVb4oo3u5Q1uRnyEDlGH4DzphfdiLTPTv191lUaQPLKd+vWfYd0vxr/UAxpczGIcoBMG/oQOeITXL3HP99KnH5Cc0GaqQ3bwVhtdqnbN0I67KWwrqLKdiOmzF7dsFQVSnr822ENBPPJtRttJvkvsnoaIzWXRnvGiTZ3dnLp/UCHThVW2UG39n6/2PNgkjRMg5siCF+NRDWMR7lb0OWwHcC2wpnLqYbnxoQ5L7h3N8S7Sq3AhzcOvwRjiXxoGtLI4E9m0SNixk9fx/NSTjbCk/RlbnPa8OQXIJRTrQsMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkXzDaF3eaS6VJFvp7kAp6/ZENBv/khq1VHA8+CmPX4=;
 b=gUQkMdfgXP+tANvbMwBWaYyUn7rMGIfoZb5IRDm8Ob4PG1C3Lb6cdV1OnJAdsjUiKY3Xh3KfpHpwj1+IQDaq30HesGVGlpFuahNEMqPb/Lw7eW6B+SarBfML63ommG6frTXun9p1Csn35ZVjjcjrrWYlGcBn5PtmvqsQofbIYiE=
Received: from SJ0PR05CA0003.namprd05.prod.outlook.com (2603:10b6:a03:33b::8)
 by SJ2PR12MB9140.namprd12.prod.outlook.com (2603:10b6:a03:55f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 09:54:52 +0000
Received: from CO1PEPF0001885F.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::5b) by SJ0PR05CA0003.outlook.office365.com
 (2603:10b6:a03:33b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3 via Frontend Transport; Fri, 27
 Nov 2026 09:54:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF0001885F.mail.protection.outlook.com (10.167.249.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 09:54:51 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 03:54:50 -0600
Received: from xhdipdslab46.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 27 Nov 2026 03:54:43 -0600
From: Abhijit Gangurde <abhijit.gangurde@amd.com>
To: <nipun.gupta@amd.com>, <nikhil.agarwal@amd.com>
CC: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
	<michal.simek@amd.com>, <shubhrajyoti.datta@amd.com>, <git@amd.com>, "Abhijit
 Gangurde" <abhijit.gangurde@amd.com>, Nikhil Agarwal <Nikhil.agarwal@amd.com>
Subject: [PATCH v4 1/1] cdx: register shutdown callback for cdx controller
Date: Fri, 27 Nov 2026 15:24:17 +0530
Message-ID: <20261127095417.282425-2-abhijit.gangurde@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127095417.282425-1-abhijit.gangurde@amd.com>
References: <20261127095417.282425-1-abhijit.gangurde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF0001885F:EE_|SJ2PR12MB9140:EE_
X-MS-Office365-Filtering-Correlation-Id: 638a4cf8-1fd9-4304-539a-08df4c6c7b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261102123227099003|261021121427099003|261026121527099003|261022075727099003|11063799006|56012099006|10067099003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	0pxJi/Sj/oVJEaaqIqswKOOIkDUntQLQ3oHdix8EPDU002gFWJi+r5ySR1Ik2t6g6HabXJdCjn5kGbDvwuvcIJm2osroa6y8qa4cT0Daq/tC+BIKWbqK/OoH+M4a97x3EcbURsiil2NDfz4+ICUnary+jPZeYKhZzSxEBDegrKxYojOUJCgVzL8jmQrTDJ9BVpLmEfDSs17br8sr/H15ZLTedx16K17zJUeaodGlTmY+1sMY8Z+lVnQrO/supzAXyUz1ImAHbF/GoIPJAdaIAoqmhEGLJEpQdQBo2X7TW7IFPNzJaG2DBTAeJZZbQlQjMCSiU499GndQod0jLl7A4cOljHgJmJ+ei0Hn7soY93M9nanz12kwIlSXRZTOjxNzIg5BDmoooH+/qTn8RuZydiJJQGYd9NCLr02RbRQD1JEvOMrJ9V6ccspBprHuvvXbPhXCYUk7OAEdg6n8CEIq/kJD3VPFa8bS+nGkJLB9HV6OhVVNv5r4ublz2SxVHzhkLcl6pZD8tN0oJMtl0XMmRo03VmPc67IaTo/LO2Q1OIfGjr9UBP408oDIej/vcCPj1Cn56FASHNvbk3UOsrOJGbIH3T58anvVIYGx7gbzcvJbI9tgJxRelis8m4Sc9jq7aRHnlRjyIDLxu2tY9otVgQnJ9U3rWS5/uq1ObFZl8gBR1ALM9wiLKz4ei9URdiLNzpC3jj+slaF242BLtKCCmQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261102123227099003)(261021121427099003)(261026121527099003)(261022075727099003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m7WvVc5CII9pJFtQM8JmdSSg0g7S9gtjBplsYgk3swZMtvmKTQ/CFfC6GrRk0hcYegxPYmYMEYkBch3fXmwEdklMf84eJ66vY2ehZ1GNSTd+mLAU7Q9a3t7MulrO7ohbv/+yy7gFmgEUFTaJy0N+natIuyks5O1yhCU+NmcolDuiI7QDnpFnEmGplThc89WFuDYsNVn+2vZ3jjDehQU3KESFvohAlgZGj27GlsJRl+HG2971koA9prLLAa4/6x/oGgTCjFdPa5T0h1JfggRboNrkPAlEDsJnu25NZkfcYhGKd8kjAJrvpO3LSRiqYpiUiVcqjIJpQZCPmk5eiO8zwDWHomGdJZbNBramnKpj/oaA9LOjtwGnBqp5q1WPYanPFhl9vwe3I5L3/mPfOjbHrgZ9ck2hgf4Z8zTqR0sGKI1D5UGvOPmCl1qMhhk55nVO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:54:51.8249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 638a4cf8-1fd9-4304-539a-08df4c6c7b5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF0001885F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9140

Register shutdown callback for cdx controller platform device
to handle graceful connection closure of rpmsg transport.

Reviewed-by: Nikhil Agarwal <Nikhil.agarwal@amd.com>
Signed-off-by: Abhijit Gangurde <abhijit.gangurde@amd.com>
---
 drivers/cdx/controller/cdx_controller.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/cdx/controller/cdx_controller.c b/drivers/cdx/controller/cdx_controller.c
index 960c4f8b6b30..8b7119d056e6 100644
--- a/drivers/cdx/controller/cdx_controller.c
+++ b/drivers/cdx/controller/cdx_controller.c
@@ -233,6 +233,11 @@ static void xlnx_cdx_remove(struct platform_device *pdev)
 	kfree(cdx_mcdi);
 }
 
+static void xlnx_cdx_shutdown(struct platform_device *pdev)
+{
+	cdx_destroy_rpmsg(pdev);
+}
+
 static const struct of_device_id cdx_match_table[] = {
 	{.compatible = "xlnx,versal-net-cdx",},
 	{ },
@@ -247,6 +252,7 @@ static struct platform_driver cdx_pdriver = {
 		   },
 	.probe = xlnx_cdx_probe,
 	.remove = xlnx_cdx_remove,
+	.shutdown = xlnx_cdx_shutdown,
 };
 
 module_platform_driver(cdx_pdriver);
-- 
2.43.0

