Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795780155;
	b=IKsGo1CmAE0SVk5DT8H77R9l8lMVQInlLPwl6VfxAMwzJfD7qGF0SzcO1kE7QVVjAoa8
	 z8vz5AWCAeAmSIg8GX/Nkkp++GRzCMLu7+Bik2jltFs+zEuLGz3rb0RKiPy+/rPi6qRR1
	 IHpJybb3ovRcj+hof1zK4M6NabU/gBc74z45YawfhZGA0or3MY9ydQSTT2O/yYH4S8m4R
	 VUus0fjz01Tf4ooMkdK+R0jQINCB8BNV0XdbDZa2UAh3muv/5hI6sOfJce5IajVeq1zee
	 9VUvZOHzAvVxUVC9gT9fr6mcfCTqH/N6DLWB/lGPBIworkjHN3KUfumiTAfpcqY7+yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780155;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=jF+Z5fsF4t5yz/R24VlutE/bzu7437U3f6kGx/k/IHg=;
	b=ukH17khJlVlaAP2+826LNcxt1G/LK7DNLUMbfZRHI3Mntix8D0IOO6iPfnx4Bm5sat+z
	 eXtAZYww793Cu/bqx4Cv8s42w9WSj+aEJCaGV9wh01LkDb18jmlrbHBPCZMY0DgimDUkr
	 oyYaxlkigpAcJs4VJP6oNm1yBcp1653p4Qg3WNIf5kJOEjp/C8f4IGI0mrJ+MY90j0wqB
	 iLKqjwviOkU+RceXCTIwRSJozn70QzJ6WOZdfnN4glqAuouDnh2RduYVFbzu7coGGddJG
	 HkYo8OteTJgq0P4cL3V7Hj9p1sNZwiZthI60HOcg1+HLauAmvo+5quxdgGze/Egcb7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=U6H8R0Fl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.28
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A156606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A156606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=U6H8R0Fl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Szp5dS7CoZti+4qRot3lDSeuzhDb+CcMQfSJkA3okqJjtAu4U711f5AODFGBkIOQ4SZtNKMqcIRjcV8hv5tRoVsnL3DH2g/vylngVsscrpf2W+8fx7ImDjHUAQXYuMaxfQ72oIlMJ2N+Wq7AD3UU/aqs5qGAuoyo40iwtBNjnawbQP8lwHor07QW7jO3abhcNOuKBj6lQlqiB262HidPJ5BcTlBKNnuNJQ/4aiBaKuGXKIST/fAufN2wq660fJnuTALMDnNeZUb1Li2dNCGe0UVkYPDuZkHGG9gk7Y1Nqx+ZM3ivkbVFeLyALodpKsaC0Ze2FLWt6bENLtNl/uSmNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jF+Z5fsF4t5yz/R24VlutE/bzu7437U3f6kGx/k/IHg=;
 b=U6OXpDNcLJoDuAmWPMu92hOH6+UI0K6silgUh1ars6Qjlwz0q5LBxAf1T+y2gTVxfcKuE2RTzW8Axbst5j0ynJskIXdeSqVkvLORUsHPCggBPLP2mBNe9kEZg1k1p1xV/IIq1TRUeo/82NnruKG2ZmxHz8oJQYL5WMxEgluo0rpBqyhTYsdDZwTWqoVD2avCL9k91kL2DttAys3CikitmGOgAmrqf6WvD5wInyIoDUbo36PcTtQsKVlB5mdsILpkg5rKWuZEiO/B1g6fYiBzbjBZ8PUmX4qwgF0CHLPFUaQHXzXFSBIgDhHKMUCPec1pUQB+vpL902h4/EDiT4iw2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jF+Z5fsF4t5yz/R24VlutE/bzu7437U3f6kGx/k/IHg=;
 b=U6H8R0FlJD53DJ/XP+ZRuyDlOy2OoX1TzrZXRoVZAXUHxvhzZYDIzO9xffC6UPxE6S0mWra/j2T5S7tzw8pD9kCHULvMcbWmdMcoMDY1mOvkj93nprYXNsoZlFSMtYQJBjnmNm0Naz9y89pT+qbl2sSkKWZNwqODVUJ+2y51abk=
Received: from CY5PR19CA0008.namprd19.prod.outlook.com (2603:10b6:930:15::11)
 by CH3PR12MB8075.namprd12.prod.outlook.com (2603:10b6:610:122::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 11:49:10 +0000
Received: from CY5PEPF00000E84.namprd05.prod.outlook.com
 (2603:10b6:930:15:cafe::e) by CY5PR19CA0008.outlook.office365.com
 (2603:10b6:930:15::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.10 via Frontend Transport; Fri,
 27 Nov 2026 11:49:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E84.mail.protection.outlook.com (10.167.247.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 11:49:10 +0000
Received: from xhdlc220225.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 05:49:05 -0600
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, Ronak Jain
	<ronak.jain@amd.com>, Aravind Thokala <Aravind.Thokala@amd.com>, Harsh Jain
	<h.jain@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>
Subject: [PATCH 0/5] drivers: firmware: xilinx: Split ZynqMP firmware driver into modular components
Date: Fri, 27 Nov 2026 17:18:34 +0530
Message-ID: <20261127114839.1428778-1-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.16.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E84:EE_|CH3PR12MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dacd1f4-1e08-444d-476d-08df4c7c7328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261028144727099003|261102123227099003|261021123027099003|261021135927099003|261021130227099003|261021121427099003|261026121527099003|261026140227099003|261026130827099003|261022105027099003|261022113327099003|261022075727099003|261022115727099003|11063799006|260925021911599003|260925021311599003|260925022911599003|56012099006|10067099003|18002099003|6133799003|261009223027099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	8BD9a38RMM2RrWFqTnlxsrjhLEgCY7yatLg91MoF0bdEZBj+JKVBA5Jumof2rDDQBWZAsbK85gtNqm5GOw+Kg0Yl8jMhFwAaC+nUlQSOTe0ytA3gMo24nGiVQj8py0TzFtR8OBUkwS1y8UkmyIKjtKC8bz2XpQX4PZ05LctuPe7xgvdo53JwcL6JjoTbRECUy9PKfDw74TivzIV2S+mCvj0Zis4nbqaoMGCfpnIhzMsU+WXdxsxUodqXwYppGWHHYAQXh7N5BEwQd1Z4/4DHg1rG+itp9Qrc9ygh5Jkh5e/anmdXoPP1wJVgraCcImj9VtOyWdqLIU9DtaLFpMyAP3eocQD7mVVUwuxsCpGzBpW982J2N4irsI0MyIuhdlvniqRU52bu/iSL3H1+FLfA3Kweym//HoZQT6eNsuiWDw7MxITgbuT20NL1m5bX1YZ5C5vuY1LEueaWKLOC7adMGrMlmg4jWvwjZdaD8y+xtadNgsyMvOyN7U2Zdjp8JYrKuA+ICVefj48jCoH2i9nAzHLLmUVjxBLEQFEZGZ2p5YWccnWKranGQS0/izns/L99Fce2IZe7qqaCYfzUT5u2FUfVNtXoV490NloikRk07KbBQydAHm/SDy/MG7/yCla83zb+xsI7L62gP0a9hq8nnKlthU7Cc72Y5njSviVnkeM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261028144727099003)(261102123227099003)(261021123027099003)(261021135927099003)(261021130227099003)(261021121427099003)(261026121527099003)(261026140227099003)(261026130827099003)(261022105027099003)(261022113327099003)(261022075727099003)(261022115727099003)(11063799006)(260925021911599003)(260925021311599003)(260925022911599003)(56012099006)(10067099003)(18002099003)(6133799003)(261009223027099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6Iq0hRxKlaUHel8mGngCQ82wZkUKx+be3sNQEuBNPv9sf3becFKgZh5700Ozuvp7GNQgQkgGGzSzuc53efoYlt3Nwx1Ngrkel72JjEJaRnGujZ9fH0j/YCsCBWmCySxXeBbDtreHlsUEaVEmC+1aSeYVp+zZ1BHkmh6hFtvPJLKQS5l2ZwOzQXnCfuibGLprxL5/0sCo7II1QEnCc7G9eCCE4ZAmXAwBouLLmBJf2Se3gRNBIRgf0tZtrXIdwvXYhUd1Z0OSMIw+ORuyFywlDUeQgeuCFcFIVA7lFUvm4t/skD+eeHAb312zOCHEZ7fUj7HXUzvpOQFKgilRQe6qPlwK3/EBlpVZY8SB1xMyCGQ7Y6CVnQ4MbMwatdLvZvy2d5ybPT242P/XVwe2gy4wGdthdDcpystZDlVtpegzNFjHK3jDbfFy3wi5/THpwsJD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:49:10.0932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dacd1f4-1e08-444d-476d-08df4c7c7328
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E84.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8075

Split the ZynqMP firmware driver into focused modules to improve
maintainability and clarify ownership of each firmware interface. The
driver mixes platform core infrastructure, PM EEMI APIs, PDI loading,
FPGA management, and NVM access in one large file.

This series applies on top of "firmware: xilinx: cleanups and debugfs
fixes":
https://lore.kernel.org/all/cover.1795094242.git.michal.simek@amd.com/

Split the driver incrementally and keep each patch reviewable:

  - Move PDI library APIs into zynqmp-pdi.c with a dedicated header.
  - Move FPGA library APIs into zynqmp-fpga.c with a dedicated header.
  - Move NVM library APIs into zynqmp-nvm.c with a dedicated header.
  - Localize the firmware version caches.
  - Split core platform/SMC infrastructure (zynqmp-core.c) from PM EEMI
    APIs (zynqmp-pm.c).

Jay Buddhabhatti (1):
  drivers: firmware: xilinx: Localize firmware version caches

Ronak Jain (4):
  drivers: firmware: xilinx: Relocate PDI library APIs to new file
  drivers: firmware: xilinx: Relocate FPGA library APIs to new file
  drivers: firmware: xilinx: Relocate NVM library APIs to new file
  drivers: firmware: xilinx: Split PM EEMI and core APIs in firmware

 MAINTAINERS                                   |  28 +
 drivers/firmware/xilinx/Makefile              |   4 +-
 drivers/firmware/xilinx/zynqmp-core.c         | 797 +++++++++++++++
 drivers/firmware/xilinx/zynqmp-debug.h        |  20 +
 drivers/firmware/xilinx/zynqmp-fpga.c         |  89 ++
 drivers/firmware/xilinx/zynqmp-nvm.c          |  35 +
 drivers/firmware/xilinx/zynqmp-pdi.c          |  27 +
 .../firmware/xilinx/{zynqmp.c => zynqmp-pm.c} | 937 +-----------------
 include/linux/firmware/xlnx-zynqmp-fpga.h     |  55 +
 include/linux/firmware/xlnx-zynqmp-nvm.h      |  28 +
 include/linux/firmware/xlnx-zynqmp-pdi.h      |  34 +
 include/linux/firmware/xlnx-zynqmp.h          |  52 +-
 12 files changed, 1134 insertions(+), 972 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-core.c
 create mode 100644 drivers/firmware/xilinx/zynqmp-fpga.c
 create mode 100644 drivers/firmware/xilinx/zynqmp-nvm.c
 create mode 100644 drivers/firmware/xilinx/zynqmp-pdi.c
 rename drivers/firmware/xilinx/{zynqmp.c => zynqmp-pm.c} (63%)
 create mode 100644 include/linux/firmware/xlnx-zynqmp-fpga.h
 create mode 100644 include/linux/firmware/xlnx-zynqmp-nvm.h
 create mode 100644 include/linux/firmware/xlnx-zynqmp-pdi.h

-- 
2.43.0

