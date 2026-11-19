Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.91
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795086659;
	b=dT5RPWDzQgAX3b8t6SLznulY6N07++6M/1vp/L/Z5J+mrWjj944P20wnPo9SRg46t1B3
	 2+w+IGumn5FUj4hYuqcLcNjXIua7Qg8k61yjSCNIYp1oC1zxWRnCcrr4hxzKqzJI+jEYx
	 BLdJx2R26ikQhBZSLepdOE2BAExL9/5fI6jRkAk6Ucm3fkn6qTKJDwh3/8UNS2tTiO/iB
	 KhvkV000J6bXrhb5PQ3o2ALc+BuKSPH2JTCN/676Fmlhb0ZhxBLCzuc5GOEfhfsLe/Y7m
	 jNtolqHQ7eRHaGQltKljmm2P43scm488StnBwvkzR2PhipWHuy4V/Di5Uz4v66V89kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086659;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Index:Date:Message-ID:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 Authentication-Results-Original:x-ms-traffictypediagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-CodeTwo-MessageID:
	 X-CodeTwoProcessed:X-EOPAttributedMessage:
	 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
	 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id-Prvs:
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
	bh=vdguBDB+jiBRrQls6YjHCK68oHlxhhWejyIj93sc8j4=;
	b=0E/ox6aUBk/oqSBro3Do27KgwWIcyqJcXJOaPGQiQybaN7AaUJ+I0iEvfoJVcSdhWt0l
	 5gMk9vx729uKvt3iOULmFf3byLCnnPYsehaJuWIm8ZvLn/X7cZeltHWLULQxOHtuOOLUy
	 gdIoibSnRxf2pvjxBscIOaoQMTqJ8HDYUqNWvA/FNNiiNVOl3gB7AziK7hRH66ZLG5wbY
	 IjZvrbGBpmtkyNjne/guMvU8SpUuIw/oIMwLKowoJj4PHWqIpE96F4nW/y/ruqbwp3mQ3
	 MtWxlNEViKNjSiX+cau5NInd16tql0HdStoHGUIz2LqAwrFaxYIhgDto7blMkFlrA1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ginzinger.com;
	spf=pass smtp.mailfrom=ginzinger.com;
	dkim=pass header.d=ginzinger.com header.i=@ginzinger.com header.a=rsa-sha256 header.s=selector1 header.b=L8dIo8lu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.91
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021091.outbound.protection.outlook.com [52.101.70.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2D4606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2D4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ginzinger.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ginzinger.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ginzinger.com header.i=@ginzinger.com header.a=rsa-sha256 header.s=selector1 header.b=L8dIo8lu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyTE+QuO5tjZLfKjXYpgmxgrgQIEhASK7O3vh+mjaWSBdmhRTbsuil+0Kt5Ctur1eF3ZrnxkCTSPZcp1HRSl2dhuMHBiGGpC8ZIvVXubPk7ZwizdcAAIpo1aPG4+n5wLyIoaHVJB5EaNkpdqwTR+FCTDrS7SsoKqYF80Cb4aPrmYSoCbbrSzYtMF9tI0FcvKWjAadV2LSr28H3X1DYVfSkbAynObEkD2SJrYBkzFy4WBMtuoASOoZ3DQfnoS/W7YA+Z3QqtI4o+/LMQdM9+fL8YrXwyPXrFEaULmdCvZEjEd7mED39axn1JZ+/xzYRngMFhtxuVfAIJaJQ0ABZp5qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdguBDB+jiBRrQls6YjHCK68oHlxhhWejyIj93sc8j4=;
 b=HrchtOeegWfSYa6J9Y8G6dHhTTK1F/WpkSNzYrPzOH3XWhCEXnfuCpmL2BTJEO/z5P6kBVANd102cy5txwPLseLrwPXNz0PVbpZZGynz/mqjUPMlZdiiLS483sIDrcNUB6/BXwVSFQTDXQlZWkv0zIbLXsGo+bgxY9KnuHBAZs91qfAQt59tWsZ7nYwm60GdydIQEY6aPz7Vw6NHjdka2ZgI8qL/nwWzfZyDwvFRDjSgHGWXiqXJsl2bQGVQsTnAmMmyMUSj7zLrvIDJwqIQTPWkF5g10SSTihtWWUVYYOSk9PhVWScR0euZos1ikETuh4ut20cvbxmPwYzbx5kV+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=arm.com smtp.mailfrom=ginzinger.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ginzinger.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ginzinger.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdguBDB+jiBRrQls6YjHCK68oHlxhhWejyIj93sc8j4=;
 b=L8dIo8luv7rZUPHxPpXyngB3vx+YHcFDJ1XmiNK+/fwWqtSxUj5ldgnVLVhSZCPeXCtIgMBkvvRDS3mIkDY6AcY9V6DaBqChwJOOmu2ekBnO51k5vr+bfeoHBjDuCxctTiAVOy0ejqyN0cRGkVoqdmxcMYR2J0kgp3UUhwxayiDxJfpst4ptDAR9CsnP0DqazrDHz3eDOVCsPU3fTVC8thut0WStykaOk01xNi8Cme6Rh7GKvNHWFPGXTH30/1GEElGLxP/Jtccc6WJopJ+41cn1DTVOPraJqLg9nEiZ30R5rhqUJeBtp0jDZeraezQy6r7qGWpvrtjHUcNUVkZoWg==
Received: from DB8PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:10:110::22)
 by AM8PR06MB7650.eurprd06.prod.outlook.com (2603:10a6:20b:357::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 11:10:55 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::44) by DB8PR04CA0012.outlook.office365.com
 (2603:10a6:10:110::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.10 via Frontend Transport; Thu,
 19 Nov 2026 11:10:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.93.157.195) smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 11:10:55 +0000
Received: from AM0PR07CU002.outbound.protection.outlook.com (40.93.65.70) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 19 Nov 2026 11:10:54 +0000
Received: from VI1PR06MB5549.eurprd06.prod.outlook.com (2603:10a6:803:d6::26)
 by VE1PR06MB6879.eurprd06.prod.outlook.com (2603:10a6:800:1a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 11:10:51 +0000
Received: from VI1PR06MB5549.eurprd06.prod.outlook.com
 ([fe80::2c95:365d:522:dd25]) by VI1PR06MB5549.eurprd06.prod.outlook.com
 ([fe80::2c95:365d:522:dd25%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 11:10:50 +0000
From: Kepplinger-Novakovic Martin <Martin.Kepplinger-Novakovic@ginzinger.com>
To: "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "mike.leach@arm.com"
	<mike.leach@arm.com>, "james.clark@linaro.org" <james.clark@linaro.org>,
	"leo.yan@arm.com" <leo.yan@arm.com>, "alexander.shishkin@linux.intel.com"
	<alexander.shishkin@linux.intel.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "coresight@lists.linaro.org"
	<coresight@lists.linaro.org>, Roosen Henri <Henri.Roosen@ginzinger.com>
Subject: [BUG] coresight: during reboot-loop-test, boot hangs during 1st us
Thread-Index: AQHdeBaifF0kKSQwekSOv3vY1w/vig==
Date: Thu, 19 Nov 2026 11:10:50 +0000
Message-ID: <f3e3c30ef76310fb6fb7d00019a8ef11e91ee1e1.camel@ginzinger.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic:
	VI1PR06MB5549:EE_|VE1PR06MB6879:EE_|DB1PEPF000509E9:EE_|AM8PR06MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d253446-d38e-42a2-c6f1-08df462dc7fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|18002099003|261009221727099003|261009220027099003|261009221227099003|260925022911599003|260925021911599003|260925021311599003|11063799006|56012099006|261102123227099003|261028144727099003|261009223027099003|261009223327099003|261026121527099003|261026140227099003|261021123027099003|261021135927099003|261022105027099003|261022075727099003|261021121427099003|38070700021|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 WIEkTyed+kHcM0q37ffIQMvwkfcWvJttoKG55Ljdwf0nD1Er2vpF/tsDoLElpsdjTwh7BLwBLp6T8gALXQACnTYL4gu3IKBmbSI8IQae6A+RcewFBYQXd17qwyMIX1l9hUPecQcJqDHdNXOX0hg4G57vAWuixgUv2YW+IhiL3LS92Lf5Nn2UvF6PZ6UgK7KNGIBcMjt5fZJw6Ojxl9jqlZYkNBuXCLB0pfVqg2M3Ue6Q8eE/Gp07dcV/0QDqT6DmF32sLunyHAbfd+/zuPtwnTlsyykEMwYWGsmV6FkxEiJ3v212wj+QT/o/dS8rHbCx47fyS+8ILijKOtqTQWgZDrVdCAWOdYDhxVbCAth7KGh6raeiylpqB2dfFn3m/J2o6IKZTAP1wc3hTugS2ZoGwAuZ9C5yZax5LmTfUpV5Vbxk8Wr6NnVqDDJatmuwMiAYniJXZIbG/6gs14Z0i5Fw6BAPsbyQCqa9McEfY26rtnFCtocCBE68uFrHddtA2/o4Ch4wCkkfV++zum0yQRnWHLuR93KqrvdfmHV/EBKZmk652WagPunxqlxYvay/YQjyzhCuQ8HLYt4OhHJxumI67+mxpPJyEJyDv1u3jQmkR+45FDb0bDVfuF9erVgHiXmAIUL9L1L60jnYZfbJCivw5SGa4NqBvjcEFb6Fznh7wzDGF1arpKxRvYcZeH/p8FUtZvXYjFF19pjQIHzz3O0lm6levVAAf4tRiqOU8r0Uu7I=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR06MB5549.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(261009221727099003)(261009220027099003)(261009221227099003)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261009223027099003)(261009223327099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021135927099003)(261022105027099003)(261022075727099003)(261021121427099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3081A20B458F042A82B5D8E9FC2E51E@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hQlp4h6JMO9lQiEk3oujCqMO17+YmI/ouqYetAoH/WXpgDyTqeIRhi5aqCQ6EQO/NH1+5bVDLtqbq9/oEl9nj8gEfgbIcOzVizabOeHjzAgv2bmX2SA+wNz3uf/mAGzvDbG1I9PS3/0QjimFxsI7fKUq1FCE5bn8FvhG3DdF9hFiHyiFHFGGpFmAoRwRaeEr/PXRJhscQxpUz+oDIX3z1T+FfKaRWzssNhCSa+xPFh0D+kuNCV0sw1J/skS8abUeUgmCK93sNPeawS0KDZ5b30nKkNNwtzJihfaX79xCZdVTTQAZQLvacgwT173HIQCXVGSR8XLYKjo9GsgBaDcR7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6879
X-CodeTwo-MessageID: f1660c16-98a8-45b1-b802-cc25e09a1d18.20261119111054@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e41d7586-6514-49a1-d969-08df462dc54d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|376014|35042699022|23010399003|1800799024|82310400026|10067099003|260925021311599003|11063799006|260925022911599003|260925021911599003|56012099006|261022105027099003|261021135927099003|261021123027099003|261021121427099003|261026140227099003|261026121527099003|261022075727099003|261028144727099003|261102123227099003|261009221727099003|261009223327099003|261009221227099003|261009220027099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hLfcccBR7/RNAc4y7JjFPSHJ78OVaBZ85a5Csw53NBzVHyE1pPj9lbRqQVaO6NxUWLj+SkM4S+aSEiPkrfMSbnFjz5vT8z6TjumUfaOniBrCBe+h2vRCigwX8ILzSe0Hs/CnGQl4PeWPSTxVUGOP9G3Cz9m7bKSWm20cIjwIx0OevJihZpO3O9itTgjOlVuW3OosssXYuMBiY/qDm18uAh6+8fQSAnKHC/cJ0iIUDwQ+XRLtPMPQlG9CMSQHoUbMPvJJgQA0Y4j3FKKUIARz1kxW3m7UyxNM2UexIO+ntzPOLMSEgCfgfIzJfEiaurvoIIJ+5YxOIcCNtbcN76HJWu4K3ZQGdLFGeRAoPgAZ7ERnvHb3ulBorkSGLS3RkutQz9Hn4mMMnkNL0qYU2IrxlqeIgu1XBW+X4ZrV6o0V84LkToqo6MntTJ2cQ4HbW9RGtWntqwdwDzqhwF9UOUjj1xe9JJCwn8h/QPNATXsMcc3Ux7Lm46VetPq0lW5LfMcdslr8O9qv7kAyTntlJK1Gi2Yhw48XHewmOPaY3+qZuhvSYjkzzWKIrhI7sLYZLDpjNQiwCRyZ0Bo0mNiGMFWxYjt5iP43p8nucHJ0NdbuS43CSmvRmwdvb7BhNpMGAw9h190FfkmrukJzjH50euDsV4i0fzz2JPrs0621LXiKeM1J0+fL1pOZD1BDYUbN8GS5VEl7ETxw4qUnQRHt4JuFfg==
X-Forefront-Antispam-Report:
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(376014)(35042699022)(23010399003)(1800799024)(82310400026)(10067099003)(260925021311599003)(11063799006)(260925022911599003)(260925021911599003)(56012099006)(261022105027099003)(261021135927099003)(261021123027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022075727099003)(261028144727099003)(261102123227099003)(261009221727099003)(261009223327099003)(261009221227099003)(261009220027099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E3DEDiPc578Bvj0878BmE2gWcFgRZxJNlVamer7488/EDIuLQ4tfhZ4so8qGwMYsB0BNFrtPwsNKc6Ms13zEtCCrMQr8f2Crcfw7X3fFc4tqwET3EQD3eiWwo5u33VhmcOuG2Jmrb2RZ801W02tQuposmAAEGumcsYvGBwjCLiyMss1exFxIn3duWSy/6FDqfkpo9geMbqLyFj7dLrgXPvAXZXiz8+Ptf2VMwc0XuTl063rzkGq2fuGy8Bg/C1hCqe+HBBI/PIFgCd8Df42NkuOVTPIFAMuEdDcU0lrodUUVi1SIyIm++Gi/BUB6aXVPzOwy12ogBlGuVCn4v/fqnY7X93h8cJOaEmTA83s125u5OeE9CpFaWzBqhDGWAzgQFjINualkunfOm1tgKU/bbcNYM4jGV+Y/27lUS9xT8BZfw2l+2jU37pLo3gSMuemG
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 11:10:55.1241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d253446-d38e-42a2-c6f1-08df462dc7fd
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7650

aGkgU3V6dWtpLCBNaWtlIGFuZCBvdGhlcnMsCgpJIGRvbid0IHJlYWxseSBrbm93IHRoZSBjb3Jl
c2lnaHQgaGFyZHdhcmUgYnV0IHdpdGggQ09SRVNJR0hUIGVuYWJsZWQsIHdoZW4gSSBkbwoicmVi
b290IHRlc3RzIiBvbiBpbXg4bXAsIEkgc2VlIHRoZSBrZXJuZWwgaGFuZyBhZnRlciAocmFuZG9t
bHkpIDIwMCB0byAyMDAwIChzb21ldGltZXMKYSBoYW5nIHdhcyBzZWVuIGV2ZW4gbGF0ZXIpIHJl
Ym9vdHMgYXQgKmFib3V0KiB0aGUgbGluZSBiZWxvdy4gQnV0IGluZGVlZCBub3QgZXhhY3RseQp0
aGF0IGxpbmUuIHNvbWV0aW1lcyBpdCBzdG9wcyA0LTcgbGluZXMgZWFybGllciEKClsgICAgMC4w
MDAwMDBdIEJvb3RpbmcgTGludXggb24gcGh5c2ljYWwgQ1BVIDB4MDAwMDAwMDAwMCBbMHg0MTBm
ZDAzNF0KWyAgICAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA2LjE4LjYzLWdlLTI2LjEwKy1nZV9i
ZXA0LWV0YS0xLTAwMTk1LWdiOGJlYmM2OTJmOTYgKHJvb3RAZ2luemluZ2VyKSAoYWFyY2g2NC1i
dWlsZHJvb3QtbGludXgtZ251LWdjYy5icl9yZWFsIChCdWlsZHJvb3QKLWdmMDAyMjg3ZikgMTMu
NC4wLCBHTlUgbGQgKEdOVSBCaW51dGlscykgMi40My4xKSAjNDEgU01QIFBSRUVNUFQgVGh1IE5v
diAxMiAwOTowODowMyBDRVQgMjAyNgpbICAgIDAuMDAwMDAwXSBLQVNMUiBkaXNhYmxlZCBkdWUg
dG8gbGFjayBvZiBzZWVkClsgICAgMC4wMDAwMDBdIE1hY2hpbmUgbW9kZWw6IEJFLVA0IGkuTVg4
TVBsdXMgaW4gTkRNClsgICAgMC4wMDAwMDBdIE5VTUE6IEZha2luZyBhIG5vZGUgYXQgW21lbSAw
eDAwMDAwMDAwNDAwMDAwMDAtMHgwMDAwMDAwMDdmZmZmZmZmXQpbICAgIDAuMDAwMDAwXSBOT0RF
X0RBVEEoMCkgYWxsb2NhdGVkIFttZW0gMHg3ZmRiNmU4MC0weDdmZGI5YjdmXQpbICAgIDAuMDAw
MDAwXSBab25lIHJhbmdlczoKWyAgICAwLjAwMDAwMF0gICBETUEgICAgICBbbWVtIDB4MDAwMDAw
MDA0MDAwMDAwMC0weDAwMDAwMDAwN2ZmZmZmZmZdClsgICAgMC4wMDAwMDBdICAgRE1BMzIgICAg
ZW1wdHkKWyAgICAwLjAwMDAwMF0gICBOb3JtYWwgICBlbXB0eQpbICAgIDAuMDAwMDAwXSBNb3Zh
YmxlIHpvbmUgc3RhcnQgZm9yIGVhY2ggbm9kZQpbICAgIDAuMDAwMDAwXSBFYXJseSBtZW1vcnkg
bm9kZSByYW5nZXMKWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwNDAw
MDAwMDAtMHgwMDAwMDAwMDdmZmZmZmZmXQpbICAgIDAuMDAwMDAwXSBJbml0bWVtIHNldHVwIG5v
ZGUgMCBbbWVtIDB4MDAwMDAwMDA0MDAwMDAwMC0weDAwMDAwMDAwN2ZmZmZmZmZdClsgICAgMC4w
MDAwMDBdIGNtYTogUmVzZXJ2ZWQgMzIgTWlCIGF0IDB4MDAwMDAwMDA3Y2MwMDAwMApbICAgIDAu
MDAwMDAwXSBwc2NpOiBwcm9iaW5nIGZvciBjb25kdWl0IG1ldGhvZCBmcm9tIERULgpbICAgIDAu
MDAwMDAwXSBwc2NpOiBQU0NJdjEuMSBkZXRlY3RlZCBpbiBmaXJtd2FyZS4KWyAgICAwLjAwMDAw
MF0gcHNjaTogVXNpbmcgc3RhbmRhcmQgUFNDSSB2MC4yIGZ1bmN0aW9uIElEcwpbICAgIDAuMDAw
MDAwXSBwc2NpOiBNSUdSQVRFX0lORk9fVFlQRSBub3Qgc3VwcG9ydGVkLgoKVGhlIGtlcm5lbCBk
b2VzIG5vdCBwYW5pYy4gSXQgaGFuZ3MuIFRoZSBwcm9ibGVtIGdvZXMgYXdheSBhbmQgaXQgcmVi
b290cyBpbmRlZmluaXRlbHkKd2hlbiBJIGRpc2FibGUgY29yZXNpZ2h0IGluIHRoZSBjb25maWcu
CgpJIHNvbWV0aW1lcyBuZWVkIHRvIHJ1biBhbiBvbGQgdjUuMTAtaW14IGJhc2VkIGtlcm5lbCwg
d2hlcmUgSSd2ZSAqbm90KiByZXByb2R1Y2VkCnRoaXMgaGFuZyB3aXRoIGNvcmVzaWdodCBlbmFi
bGVkLgoKV2FzIHRoZXJlIGEgcmVncmVzc2lvbiBpbiBtYWlubGluZSBvciBkb2VzIE5YUCBoYXZl
IGEgZml4IGluIHRoZWlyIHRyZWU/IEhhdmUgeW91IHNlZQpzb21ldGhpbmcgbGlrZSB0aGlzIGJl
Zm9yZT8KCkknbSBoYXBweSB0byB0ZXN0IGEgcGF0Y2gsCgp0aGFuayB5b3UsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFydGluCg==
