Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697779;
	b=JSlmjhtVhlggOqoGhL0M1Q09CqM3oQ92Jd9gcOl3kUU4j6hLZqmhCBuO2CEXChiRou7L
	 N/6UvHNlkX2vsQkLGFnchwxdeuWmqYWJAm+esUJpjl34K/E28EQ192U4XF2/cdzIfXhIE
	 uTQ2Xmf4hjyz5IMb4UnTCeOSenehqZXn6334mxsIxFVEb6/rLyGfvyTfT/WehfWel5qlG
	 YEgNOE5sriXyoZDviLbkaEHjxcvqhyJpPBpRlOimzovL1CvhxJAPyNT1Qs3DVZNhTd/Nn
	 P6UafuarKqRdpFRcfEhtM6xdDXljXqybWRfRefzPJz89Smsv0q8RpHibSACC3W4OBZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697779;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=iqm3te1UR2ujnjZtMygIZQEOrWGGYyAcufMmQQvLEvY=;
	b=z4riTuV0MoLb9WeYZjg/rgAAaNGCalwJ8BviR4OknuP1um2yaRn9sKeMKcltXxVyiOOc
	 R6vQffskjOu2UltUpdkbx+G/ThajUME861luhexkSJcC0+WnvgIPlAtO+8lW4VNtbGdzd
	 piWUt6PO+/W3xdH8ddzclEghdylwLCH/08DVMBk4Nugo+mAXR1buXJ/KaxsweegNVoFEX
	 VS3K6F7DBQBvWVmXe1WW3xR7b2pghjJBf+l2teV/tYv+clhteBtEh0pUhg//6GRjCwWf7
	 hy/NLtutUzpYCLDeLGgwmb1zJS7WA9z081tF10IjuTZhJYDJzqYcW0kJ1cFBy00Vrcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tHz6dPBS;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A45606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A45606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tHz6dPBS
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iqm3te1UR2ujnjZtMygIZQEOrWGGYyAcufMmQQvLEvY=;
	b=tHz6dPBSXZcWMmdNq0vb658AsLd2eh6WDFBR0sEU9WnD0bYs30b6m30oQTLxToUoXbhI4+/dS
	+RSJJ9JtUy08yWHpcnG1/dI3g1ygaoW8E0iGLn75shERLSn2MiMlO8y+yhxojRgdOQO5Aa5V2ky
	UHAsatQM0npFBt97LqL+2xY=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jZxP72ssTzRhQT;
	Thu, 26 Nov 2026 20:55:55 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B9CF540575;
	Thu, 26 Nov 2026 20:56:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 20:56:14 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <jic23@kernel.org>,
	<catalin.marinas@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 0/2] arm_mpam: Save and restore the MSC state across system sleep
Date: Thu, 26 Nov 2026 20:56:05 +0800
Message-ID: <20261126125607.2304487-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The arm_mpam driver only saves and restores an MSC's state from its
CPU hotplug callbacks, which never run for the MSCs reachable from
the CPU that suspends the system, so the configuration and bandwidth
counters are lost across suspend-to-RAM and hibernation.

Add system sleep callbacks that save and restore the state while the
MSC is still accessible, and stop the unfrozen resctrl workers from
touching a suspended MSC.

The first patch rework the CPU hotplug path, and the second one fix
this problem.

Changes in RFC v2:
- Also mention hibernate (Ben).
- Extract the mpam_msc_power_on/off() helpers first to make it
  more cleaer.
- Fix AI review issue [1].
- Add fix tag.
- RFC v1: https://lore.kernel.org/all/20261124082708.1705024-1-ruanjinjie@huawei.com/

[1]: https://sashiko.dev/#/patchset/20261124082708.1705024-1-ruanjinjie%40huawei.com

Jinjie Ruan (2):
  arm_mpam: Factor out the MSC power on and off helpers
  arm_mpam: Save and restore the MSC state across system sleep

 drivers/resctrl/mpam_devices.c  | 130 +++++++++++++++++++++++++-------
 drivers/resctrl/mpam_internal.h |   7 ++
 2 files changed, 111 insertions(+), 26 deletions(-)

-- 
2.34.1

