Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795662947;
	b=0EBvi/KHHLWktbBATtyB3wozDYgjtsQ3wGPANrNdGW32LYZHE2VnjNeS9JqYgFx8cHXp
	 x5/NITy+Zy+vQRxO4lWliyULqqRQS+tdQhzTNtQhGhVJezuE6N31OK0GAoGDt+HYBIOtH
	 oqxUnFvtHduDqDo4RdKbq3o4XgOGitGaDYpVOjR+b3vJt8nTsgHTPDQg5BacPndYSzI7M
	 Ua6f10qo5dJkCaVUvPqJf1eFShsI1SD43RNk7yVqLjh11J8t5wEQNg3+0ISDTLjNiFEUH
	 pgv8OTX7mWnFNaIbrNVANHJoZD/0NDDQjz3ZkBryzZ5JNvQcw+z15j41G+MAL09sjDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662947;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=0/ufY3zZei5D+1oZSH0r0Rl/3IgBUoWO7UopM5swggA=;
	b=VaS2aoid6EYT6TWEUVL5IJIz1b8WQgWntfvTgw6l8LPnufgdl6/ivJYOxlAw4xePUytS
	 K4RAoMw4fYAZlxrG2ZEOx0ogT6XGugsW5BlAPxFAMlpwhFDUJWE/OxZGMkS64HS6RDX86
	 EX1nr4/LpNsOXFVWMtgpZuosiibdXfOYOHjscPKkYJ4F2wZP2bCf48jFrAqwS883dCdRU
	 Y0logDVQauqPCoI66W0dLlFyYuQuvtdt19CrzTNtz1mr9iof3sRdKs+BXfIu3LZLl7LaZ
	 cUg2s1t1HKXNAuOHR9/+hlxlpMGp7HM01bj3jm2fcpJpeoNahJMF5VvcBEg7jguyb7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=DDZRWdQc;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2615B606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2615B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=DDZRWdQc
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0/ufY3zZei5D+1oZSH0r0Rl/3IgBUoWO7UopM5swggA=;
	b=DDZRWdQcjmzcfWo+2sBUfVi5SmUXxWnsLeiwCzBrxrAfnawT2FBATO2dp8kZo55ygrhDrmy7H
	G27s+yfok5R6DXJih8fpYjW8/PfEOSotiiWQ77CKaCQdaBgbLcRqUgT3vy6oLDRs1JKs0/iQmDj
	aYenjyLM9DrvVTgh4ZyLT5M=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jZhVc2mtZznTW8;
	Thu, 26 Nov 2026 11:14:48 +0800 (CST)
Received: from kwepemk200005.china.huawei.com (unknown [7.202.194.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 001BD4057A;
	Thu, 26 Nov 2026 11:15:36 +0800 (CST)
Received: from localhost.huawei.com (10.169.64.31) by
 kwepemk200005.china.huawei.com (7.202.194.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 26 Nov 2026 11:15:36 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <tzimmermann@suse.de>, <dmitry.baryshkov@oss.qualcomm.com>,
	<tiantao6@hisilicon.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <shuliubin@huawei.com>,
	<chenjianmin@huawei.com>, <fengsheng5@huawei.com>, <shiyongbang@huawei.com>,
	<helin52@h-partners.com>, <shenjian15@huawei.com>, <shaojijie@huawei.com>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH for drm-misc-fixes v6 0/2] Fix some bugs in the hibmc DP
Date: Thu, 26 Nov 2026 11:06:46 +0800
Message-ID: <20261126030648.3231196-1-shiyongbang@huawei.com>
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
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200005.china.huawei.com (7.202.194.71)

From: Lin He <helin52@huawei.com>

Fix some bugs in the hibmc DP driver.

---
ChangeLog:
v5 -> v6:
  - Use a cleanup-based lock guard for aux_lock. (Thomas Zimmermann)
  - Use cleanup-based lock guards for gpio_lock. (Thomas Zimmermann)
v4 -> v5:
  - Invalidate the link in the hardirq when an unplug is sampled, and
    stop clearing the latched HPD status in hibmc_dp_hpd_cfg().
    (sashiko-bot)
  - Serialize a whole AUX transfer with hibmc_dp_hpd_cfg().
    (sashiko-bot)
  - Append HIBMC_HPD_UNKNOWN to the enum instead of prepending it, so
    the existing HIBMC_HPD_OUT/HIBMC_HPD_IN values do not change.
  - Only set the enable flag when DP was initialized, clear it only when
    it was set, and do not request the DP interrupt if DP initialization
    failed. (sashiko-bot)
v3 -> v4:
  - Fix the data race on hpd_status between hardirq and process
    contexts with WRITE_ONCE()/READ_ONCE(). (sashiko-bot)
  - Delete the HPD_IN early return in encoder_enable that breaks KMS
    forced modesets. (sashiko-bot)
v2 -> v3:
  - Delete irq_status and use hpd_status directly for hotplug
    detection. (sashiko-bot)
  - Add debug logs when hpd_status is not HPD_IN in detect and
    encoder_enable.
  - Move hibmc_set_enable_flag() before drm_dev_register() and
    hibmc_set_disable_flag() after drm_dev_unregister() to narrow the
    race window. (sashiko-bot)
  - Add spinlock_t gpio_lock to hibmc_drm_private to protect all
    operations on 0x0802A4. (sashiko-bot)
v1 -> v2:
  - More states in HIBMC_DP_HPD_STATUS are added to the
    'hibmc_dp_get_hpd_status'.
  - The call to `hibmc_set_enable_flag()` has been moved before
    `drm_client_setup()`, specifically before the connector detection
    triggers the I2C bit operation. (sashiko-bot)
  - A read-modify-write operation has been implemented instead of directly
    writing to prevent clearing the I2C mask bits. (sashiko-bot)
---

Lin He (2):
  drm/hisilicon/hibmc: Modify the method of obtaining the hpd_status
  drm/hisilicon/hibmc: Add a flag to indicate whether the OS-side driver
    has been loaded

 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   |  2 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 38 ++++++++------
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  6 ++-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 32 ++++++------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 50 +++++++++++++++++--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  2 +
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   | 10 +++-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h  |  3 ++
 9 files changed, 108 insertions(+), 37 deletions(-)

-- 
2.33.0

