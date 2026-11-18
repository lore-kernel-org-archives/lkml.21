Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014179;
	b=WPwIRmvUrGsNnhhQcKjKJlmR2lByRaPfcRoUqgjVlnRzW5m1iA/PBDGiUtA1fzFJMyL0
	 W7NgpQTngXMO1+dfFj9X0vXiS6zxN59wAzVFP0WIsS/7obBk3PitgpkxzZr3fbrmh+zMr
	 vmiin6dzAe9riOsfypLsND4bgjDhcYMZCyTX5vJBjwEDwHuC4kc8hx2Pii90RA9WJfdX2
	 Iq/ZyNz9mZBqSvniWTU94oij68+1uJgkjmzK303DTmvSkHppx/2DolrU3JGOiK/9SVxWF
	 x86w4KOFIIjX3JcXZSBl3I5astBKcHTcaKA1E3LIWOPGrvaF9eenqGZsJ+O0m5zk5Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014179;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=aFdQfitX5kqFFj4LEjeWDFgKXwo2yxAJjfPXDJoFef0=;
	b=CO+1bOKLAX5+zvRwhsWyofoKH66h+IH/pyQ7BlhHSfZUI4hfrdEZJ2acqD0AA+IhUeq5
	 gAT71+t61HXK5LRHXw0b30WH9jG8HD0HXq6KNzdNrWEkXQBeVOSR2YSxd+DthXOigWkLN
	 cIGkwqRJqtnUY5hJlwXKtugio47KSOcCgBtr7iM9Vod4aaHzh3KA/Z3sci3jCC/trHOvZ
	 /qZk4m1frtHLVtYZHZaEVWk+bf2Bvmn88UV+vt1ynaoSbBeRH6eZqbYk7oBnCzchuDD/3
	 h+WTSrEFVNhXw5e5KXx5XSWcnHzOmNZhg34sO29UqZU/Qlh4gTyD5BZT04o7BsLJVOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mBvUnD2v;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A417606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A417606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mBvUnD2v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=aF
	dQfitX5kqFFj4LEjeWDFgKXwo2yxAJjfPXDJoFef0=; b=mBvUnD2vdZwRZqqJrx
	Ioh2enMq8o7pxbMdycdk/+D3jVViY1KIWb2ql8SqYtr8TYUrVP7yviSDAT6fnWfV
	vaWlvQLzE8MzkrwvGYGxE0vlMNYUQE9wqitjbPi+YqNUBgQVOuQvRPh2E/A9UlPi
	ubA5C/hqo5tFHDHVpTBk4RVfc=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnDnyfvf1qxRLhGg--.65352S2;
	Wed, 18 Nov 2026 23:00:49 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: dianders@chromium.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	luca.ceresoli@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Fix DSI host node reference leak
Date: Wed, 18 Nov 2026 23:00:45 +0800
Message-Id: <20261118150045.2414052-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:PygvCgDnDnyfvf1qxRLhGg--.65352S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtryfGw43ArWfKF17Ww17Jrb_yoWDWrc_CF
	sYq3yxJrs8Ars2gFsrAw4a93yay3Z0gFWkKF18Ka93t3y3Zry7W34S9F95Xr97uF4UJF9r
	A3yDXF1UZw13AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRtpnmDUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7gGxIGr9vaEqhAAA3b

ti_sn_bridge_parse_dsi_host() acquires a reference to the remote DSI
host node with of_graph_get_remote_node(). If ti_sn_attach_host()
fails, the probe error path removes the bridge but does not release
this reference.

Call of_node_put() after removing the bridge in the probe error path.

Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 48b83df9aed6..f4cf3b4af876 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1465,6 +1465,7 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 
 err_remove_bridge:
 	drm_bridge_remove(&pdata->bridge);
+	of_node_put(pdata->host_node);
 	return ret;
 }
 
-- 
2.25.1

