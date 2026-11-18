Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794996831;
	b=Mmq/aSmWBVyWHtyYxynIhHOzb4Al+aaeLTxC0q5mQS9HEMCZ31BhhqtYFlgwPFl4jckv
	 Pu8vdvb9vOjFAJ+G5bbw58wLnrGZNqbxSp++eVOHPMKp4sgtFVSme1DC50NSj+cD8esqU
	 Ns43ClmQy6eOGMA12QniqImPU27JbcIFrsIe+WY6K1jTM4Cjot2weSkz1wS/a1leu4tXc
	 47sPRxtYGb3CcK+FCwkfbq390W2eaTlJaXb6y6jlJ24X+H4rakAiHnF2PyBNG1/Woxvxj
	 YV6+n5mh5osaueSAD43iqo3M9wMJfA3w41Ibqns4pFGsozSflVwGrgiBoPtkX5ROeAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996831;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:X-B4-Tracking:X-Change-ID:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=MD43Zh0YAsLNoG4GrO8OMDHzsTFxKN3fxr5Qq5LdC7U=;
	b=dEQMSJZD1h8Y5Kws/Hwt0VlGH70C/RY3LuEtpjz0g7lpTR2EUiTRc9zmYS/ECk6rTNM8
	 cz5USM8wL6A0EIAumHdT5Switsr3/kCco1cgiu+h287gqPnkMEEZa2BgnVIqBznSBlNgp
	 y2CCfYR1Uww0d19Eg9owLdW2FrlCarQlYhDSecQfu5uotBphXwgr7wM6zBo4dTtYwjN50
	 837HmcxILCBfuYf9GurUHCxySWw3nPbx1Y0Z4zpK6Y6keNtOnt+sZBqA1V3Nj0/BGerDL
	 dSXTDpJNB+8HeVlr2z6Q5XcKiNh3mEijs9LhROZ0VE/vZFDSzj9IOLWKe6HMVcaGjUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TeXcWe1u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.37
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012037.outbound.protection.outlook.com [40.107.209.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C826606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C826606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TeXcWe1u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BH4Tf1RM++K78KAhNtfMXy+zLP5cHssekzzK5Jsjorv+iNod8l0W/9ARPg4bFB7tQqoPPX+vnQdnJE8IvJCFoA6q8CzqzHJJBLbyK0D70OmYSxEZ0Z5Ld89oAplOxipUJvLmnQyZ3iZANe0U0SJemK9KmFrjBO/DFYoDX2IAGOCbd+og8cu6Fk25MC94X6hY/0ZdyFfBkXBPUxMbQZ1utqxv2aKP3bcO5v+zXtudiosbKmRt5vNYrMIfsAc304T325XsSuUm6ZCrFP0HwHeKGxKtH0raXVh5ZTycOuRN5oG/IRvGVPn1Or+Jofg5gqNMaEdu86HiTiTCyaZ1wN8lhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MD43Zh0YAsLNoG4GrO8OMDHzsTFxKN3fxr5Qq5LdC7U=;
 b=iURVT0OyXyfjEZMF3pdceGI3dwIRqVVKVYV/POgP4CajOM0W6A0HzS6fyBWBIaTzHe4IxO3+SRC5xJHB24jNtQbphgWtT68po5fKreAHAkgx3f1dWAKs6dOsnzcGwiLHKPiO/PQVUZPTdlUVM/++3duk7sFgmRBvDFR2ca0gMArjfFjzKFurD2l8/SpKa2YxeoRWo4a5zdhZDe969DQTSziAeQ5v1eVGu5Hu7hjyM3/sJhLbR8YrCIhg6G1rlOCHSachjEDxUjdSEpHa+ajp5CcBVwo9SndfJdsbu2N0M/r53ERJmoWe/X3c1i+9aS1IXU6yK1dRzoddCbAPzPlk8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MD43Zh0YAsLNoG4GrO8OMDHzsTFxKN3fxr5Qq5LdC7U=;
 b=TeXcWe1ue0DenRrosIXrINjpCqaIUNHKVD4sPvhE//gH+9wv1z5MmZi5Dr5MhPYKKXUmQORrapKTAPpj/tBi9FzZdIHGuvv48SzmOaqWRFavAy3Mj/2KMcwC6j6ZDf29JZxNH9K5XFdhpKutc+NA61uCfm1d+RYPPvc9pPHDaDk=
Received: from DS7PR05CA0101.namprd05.prod.outlook.com (2603:10b6:8:56::21) by
 SJ1PR12MB6027.namprd12.prod.outlook.com (2603:10b6:a03:48a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.14; Wed, 18 Nov 2026 10:13:46 +0000
Received: from DM3PEPF000265C6.namprd03.prod.outlook.com
 (2603:10b6:8:56:cafe::f) by DS7PR05CA0101.outlook.office365.com
 (2603:10b6:8:56::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.7 via Frontend Transport; Wed, 18
 Nov 2026 10:13:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265C6.mail.protection.outlook.com (10.167.23.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Wed, 18 Nov 2026 10:13:45 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 04:13:44 -0600
Received: from xhdtunimkar40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 04:13:43 -0600
From: Tushar Nimkar <tushar.nimkar@amd.com>
Date: Wed, 18 Nov 2026 15:43:40 +0530
Subject: [PATCH] .mailmap: update email address for Tushar Nimkar
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261118-mailmap-update-v1-1-b7197cd9d19e@amd.com>
X-B4-Tracking: v=1; b=H4sIAFN6/WoC/yXMTQ5AMBBA4avIrDVpmyhxFbEYOhjx07SIRNxds
 fwW710QyDMFKJMLPB0ceF0iVJpAO+DSk2AbDVpqo5QqxIw8zejE7ixuJIzMZZ4ZKzU2ECPnqeP
 zG1b177A3I7Xbe4H7fgA2w8U3cgAAAA==
X-Change-ID: 20261118-mailmap-update-6070756d02ab
To: Andrew Morton <akpm@linux-foundation.org>
CC: <linux-kernel@vger.kernel.org>, Jeff Johnson
	<jeff.johnson@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, "Radhey
 Shyam Pandey" <radhey.shyam.pandey@amd.com>, Tushar Nimkar
	<tushar.nimkar@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794996822; l=1054;
 i=tushar.nimkar@amd.com; s=20260917; h=from:subject:message-id;
 bh=J/AOhs9Mb2nsm4vFIVIINlZn9QtYyMqkF7GIlkHoQCs=;
 b=G3iMufx0gPGnFdE78XNScngyAXToCyZ3KZjeoXkODcsf8PPL1l6QYJrf8xFV6ksfbgEB69fy7
 VpRyhscB+kiBW+3nwEuJBVno625IBLx0ToIoEByY+jzQTLE9NUrduQC
X-Developer-Key: i=tushar.nimkar@amd.com; a=ed25519;
 pk=Uirerl/gKBwPgdWL9awJAJkw5FM33ZF2TlUTJ58DEYA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265C6:EE_|SJ1PR12MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ac5d0ab-8362-42c3-8f81-08df455ca13a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qKF/L7EcecmF51VAZvJqnMJDq1iWirSALGttgROO35jxS85s429libC3pB5Ltamg3EIRmHyAoYCqAsXaivWrD7Hvq0npY1aYySIr/fWh1CcM9h6XclhUvMpAcRiRzM136us/wtUDhi4o9DqTGpnkXBfB/yHXB0lJIRlmgxJFxyen+PxiqQJwdywvETWBpjpbVpstZzPMSiutv2rsR9kZ10vkFD/+qIkaJptgdbZBpOg1GHuunCVb4mJ6cYclvsJR6C4aVSi5XPOj15W171iVaMEA/psTXv5KNn7dS+t8KYZ1mpl+N4Do1j9aulJe45AnyogZnSInrlRzLQv1IcneBtVx72JL5mym8jkSsIpfxMaJVbgNIK9sGq6XNwBYUf1PJuMihntYYIfQGksonikK+n5KkhjbLfA691XTMNdxZwdPC6KJ3pEdg/xQPZ7sw9QKVN28AIk+AxtI7fwZegnKV16N96lutWhX46o3QT5qHE+mMfHIFUQMwKOFWoZ8Qd/EeAUwCXWmaJU/GHSf1cr1UiQCIN1dJrVbso20LXwlNS+w0hhRjVWmxxaVtTknH1WWnKtm5x4AAZcsIpyHnpUjU+gM4K+jH9xeRH6WNxzqw19Xd/H7U+C7Af9PM0vrbJnzKaKUSnHf88vVk260a5DILTv5KIJZ36tpiPNV6P/mh09ObNThe8IKrTO8XKN4VkKejaxddQa++5FKGQV12NpQmQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I5fkulmYXOpY7l+3JZZBwnMB9X8JlgBpKaLIdS5zCdRkc5NY42Zff7rmA6mtYHvw90klsiue5zRuS0GzUUhBsGFdwO2yGOdnwYaUKRJ4ywNkryi4L0HjYAY0H8XuG9P9vpL+ftUTYxjXbpb/axmvx4dQ3bu8XBdakw2jgap8A4jdn9eBEwZ8bOQ1o56cL0mxFZ9ouN/xgxN08BdOYA4J44ztBLb2Cz7XYQLp8mDleDz79fv28a9JD8MrFua0Xh9lFCdXHambXqIZdjNBPreKWytgdJXeG4UcWQV577BgF0+RA+1XKp1DgbGwcr0ByrKxmpJ7Jn55WcZ6PoJd0cGkbkZF0DXy/ejHtdeh8j1FSDNpc+y+nv/8Gt9eJnnJvHWDMLTWtHpbgVAFefeda1DQU8NeLtBF3jSUQ049LyqliZJG+W6IRCWzq3pAlxzSzPF4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:13:45.3428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac5d0ab-8362-42c3-8f81-08df455ca13a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6027

Map my old Qualcomm email address to my current AMD email
address.

Suggested-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index de477b76d6cc..17e7e7921ecc 100644
--- a/.mailmap
+++ b/.mailmap
@@ -975,6 +975,7 @@ TripleX Chung <xxx.phy@gmail.com> <triplex@zh-kernel.org>
 TripleX Chung <xxx.phy@gmail.com> <zhongyu@18mail.cn>
 Tsuneo Yoshioka <Tsuneo.Yoshioka@f-secure.com>
 Tudor Ambarus <tudor.ambarus@linaro.org> <tudor.ambarus@microchip.com>
+Tushar Nimkar <tushar.nimkar@amd.com> <quic_tnimkar@quicinc.com>
 Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@intel.com>
 Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@linux.intel.com>
 Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@sophos.com>

---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-mailmap-update-6070756d02ab

Best regards,
--  
Tushar Nimkar <tushar.nimkar@amd.com>

