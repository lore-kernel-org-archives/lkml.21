Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001747;
	b=Zb3Ent9DCp6OHqkFXFAF5N9MFQ3jsz6y2uk9QzKTNSKgu58iPyMm/iCjfBG/xQxeJspf
	 IdLtxtCPAuTw9Gve/eOZqtzqRxSdZKRxjcmX4QYeOe3r4dNfoAaKjBj9KZ08ji9AemHm6
	 MH2E68XP2GX4KwmuKfUG4RvDFulIJNeQQk545aMDiNIxmcitklL+q+QOyC7a8W68X4kCr
	 ZBSkKx3q72acGLyspcpvxZmkAwo3ko3T90kmAYlVzp481G1d5XOWOjWTi4SpeRx4MfXZf
	 Is5/4AtqqksycyuCMQ66TUBRr2Nw2/kvmeobLH5lgcpJZfRc8LmpxXJg7Vc7awuSsJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001747;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=RJkBieSQOuKW201Esz2nbY5TuThXbohwekU+5kyjExQ=;
	b=n1BIa65OZ8bjuimDvnWGmEMkk3R9uLEHT6FKtlwfV6vtw6hS+lnvU44VeQFvIHwUKyMM
	 DD7Qjir04ssVnUN6pBnWd4AaCVZLrYN6K9UusOEFU7pARfvAzvO731vN+Nq3AEtjWNRHh
	 G/s+I+XfqTDLIFWZHNvSAkXPdmoHo6nXKW1wL3APUzlhroWhLXuto34TIUT75Ozuhk4H8
	 UrRlzjHQ26/PeGoUn3QOp9Oyn3RSi6GJO5taICXxCgIjgK5a9M9oPDFS+Cp10UDPOxRJo
	 8RyRXRBUP52VKbyFCxvGG+5UC60MosdC0po67DphzhZ7Nr/uH6jSSMxIevbDGt+NLnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=enaC4ze2;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C55606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98C55606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=enaC4ze2
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RJkBieSQOuKW201Esz2nbY5TuThXbohwekU+5kyjExQ=;
	b=enaC4ze2wnB7QXaCwsr6uQmdExen2ZpkpBc/c+MZgl1xgta4AhfRa+RfwOJt++DZvMXhVqAGm
	oVwU1dUt3NWPpMMigzYdGU8nzsz+SW7HMB6MN2MX2t4UUeaTehKDpkDuEOBZ5yc74L6XuObr7S1
	7ZrmhWsKlFkU/6zNsia/qLQ=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jTzzs5HRPz1cyT5;
	Wed, 18 Nov 2026 19:35:21 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A1A174057A;
	Wed, 18 Nov 2026 19:35:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 19:35:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<tan.shaopeng@jp.fujitsu.com>, <gshan@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v5 0/3] arm_mpam: resctrl: Fix several CDP bugs
Date: Wed, 18 Nov 2026 19:35:29 +0800
Message-ID: <20261118113532.638039-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Fix several mpam CDP bugs found by testing and AI review.

Changes in v5:
- Add Reviewed-by.
- Rmove alloc_capable check when switch cdp.
- Remove the unnecessary stable version.
- Simplfify the commit message.
- v4: https://lore.kernel.org/all/?q=arm_mpam%3A+resctrl%3A+Fix+several+CDP+bugs

Changes in v4:
- Only enable CDP on a resource that supports it (Ben)
- Limit num_rmids to the CLOSIDs in use with a simplified fix (Ben)
- v3: https://lore.kernel.org/all/20261106081923.2333070-1-ruanjinjie@huawei.com/

Jinjie Ruan (3):
  arm_mpam: resctrl: Leave CDP off when there are too few PARTIDs
  arm_mpam: resctrl: Only enable CDP on a resource that supports it
  arm_mpam: resctrl: Limit num_rmids to the CLOSIDs in use

 drivers/resctrl/mpam_resctrl.c | 39 ++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 16 deletions(-)

-- 
2.34.1

