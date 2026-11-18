Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026948;
	b=rQ2x7IIpxRfH3SAZ+QYt30RmSYNpPhpiE5jtHII2gN1tPgi2iFjwuAUlSiLPa2A676Ul
	 ltYOIW1cSFj74XhaernrKSlbAxHZKkWSvsg2j4gpTl/pdW43vs/6dYLCHTE9zKsLLmsFJ
	 +gZn+mK4rcigrVuRdukULLgb0/jvBHXAqsCzvGqsSK/pFfallQB6TkJO2dmACV0kiW6Ai
	 GW+FOtyK8S7EEDnxQs/g4CI7aNLKOTMdPFtwEsMyCWkjqc+Torc5nD33kbfPC8IkdJx8S
	 0dLx0y0b8KeeZsuFwhoVEkRoJFOa1Rw1swYB7/HNHxIBDZGuq+vwMv4j5I6RAI6yudQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AMr/kZW4+kvAE0nS8oXztOJCwRpyD037PL8XekrkuT0=;
	b=GMjoiBIc0UsWQHhEAIsY7VDQBdqXDM5vXhHIEXA2hXDFPIni9L6aifXAwV2OHKv1PYYE
	 DbwecTZNb9buOLDJkwRPR+veyZ91Sl+tG4aYNbsyV9o1ybR2R1nfS8ONm+45xrnHl9bEr
	 fJPu5/rv7ILWPRBQDoieNOLbdsnX/ga8rm1narqLQV8mNuDVPnQ8Cv4cpO6aCPjt9Qn4x
	 dBqnUNdrU8Ssr7Bmof0nJ7wHm1jJHrsp7YU3b6KftON2ALZ7i1ZpaUAt4EmganMKT3sN8
	 teuGGI2f7bS7Jz+HBwXF/UKxtASX922DEF3mmbYrruwEunGlZCmLu85i6GMo58Uk1Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOXXHkg+;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767C2606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 767C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOXXHkg+
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1297605eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026948; x=1795631748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMr/kZW4+kvAE0nS8oXztOJCwRpyD037PL8XekrkuT0=;
        b=iOXXHkg+n/ce/O717VOf0Xpv9u+HmYUoznTml1fkw1ailXngV+JSSmjuiecNPvXkYI
         +kwzAjzb1lwmb9b61E/RI3iJTyrP45yIPuMI5j8hZ5FaLrM8KAAYH2BFhha89xo6K2B7
         O+prREh2tD8Nos7PPpAqytEVof0geSzpzC+9QKUXy7d7rUJaPX0/cCrHkNtr2p5eAaTl
         8xUwdPwm+iok4h8tAqKD5uUEO2rUD1EaNGaIxJAFFgAj8N41PgxbOgYJAmZuKo0/ZK+F
         InGKJfSFI8/PY2LwRsby7+zz1bpIWOL2ubwiMiaHQZ3Id3lIKc+R1ohAvxqSAob2xVVr
         IP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026948; x=1795631748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AMr/kZW4+kvAE0nS8oXztOJCwRpyD037PL8XekrkuT0=;
        b=KhtRTp2/mDJhNrPpp/VzuiVLmi5IYSK85AXSKSP3UXGlZGB/GB/4KAuPXhT/iZBOzu
         7aRheijT4nUzyV1RjZX1eq5IPI81FIbeshAALb5K3B4CAEyDjxJqwheQVvguTBivAOGM
         ZC0TxrPTTKQIvDYMEpME4C1X7MQ3YB4MB1uA0dJNTWA8NAM7PlRDlTpuF5/FvtJ7diVs
         JvbZDaPWah4lb59QqY06quVx1T9pPgjjN/d7EPyIUw/YvfwcEvy/ua3JOH97NxZFc4wD
         bBcX6mRTY2ukBMMurbqQT0zytjyhkokL/RHlvFyKh4yY3O/M9TwDFamHaxPMjEwHq5/v
         IqEQ==
X-Forwarded-Encrypted: i=1; AL+hErGxkZlDj5td0aZO1PnhEgRgULvPnT0JP52Ec3MUp+KfM+w9B/tbtXIgLF3OsBRwPHqduSMPJ9eGRoJanm8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vmJBc4/QElaw2Ha5PWXvi/lu0Dq4WZnJetKg0pNSABu3+JTzr
	X+C6Ej/7FACoDGNBBLOUd5xI19ls1GGvibXD04xtqWbuc2aNjX2M2c+d
X-Gm-Gg: AYBFou0QQGuwrpiTFPGVopnZIWeNWh+ZUPe4oSsTl2JotalzhsTKZeBZyIiMLITn3ZQ
	MQmwXCSc7K8koeXb5bALaKQce1RPMCRDUUWYXV60iNu8SsASgZvG3/Zk/wri9RkoGEYDItyXbwj
	c9e3OAfFaBuSChDMj/y/glbIuu3Em6e4Ap3I25Xzwjj7s/82+BGYuaJzNwRljKUPhFWfIKv6yLq
	uo/tL5NKjOfoZprrXARFjzyDi9d742RyJg8Rott+bmuRNoynntxny4LGQlW0KTU7SdsG9qFHGlH
	8gfWVTHKK/rqNLp5IHohzN1YSnfWyEJujf9Urv9VmKgyuuziRVXKJhrh1gRQHIR6y3V81uCGoY9
	3bDTmhefVU62IdMycGyHFxNCvCrwuVZaUVMYifIG+jp/gmMphHLDI8g64GIKAv6zJA2pPz+cK4Z
	dFmIO49lgnVicwrWtmpoVWpZJUndhnj9ux8g5hUC88TWS/67xu2zRo54A6e6e3A9B4hOYd6Gs49
	+TNTinJRTYEKGRtJyxKZatKVTj+wH5Xxr0+0pjx3QHw6rV07ouraiNj5sACi4PIX1bjp23hatxL
	VKGd56cocrtzwsMX1b+FR1Ludeho2SFx66Fdd3uvJBRvh4XXOQ==
X-Received: by 2002:a05:7300:c7c4:b0:36a:1d6a:596b with SMTP id 5a478bee46e88-382818137a5mr3475399eec.29.1795026947011;
        Wed, 18 Nov 2026 10:35:47 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45274aesm10450189eec.2.2026.11.18.10.35.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:35:46 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	Linmao Li <lilinmao@kylinos.cn>,
	Kees Cook <kees+treewide@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH wireless v2 2/4] wifi: nxpwifi: stop AP TX after preparing channel switch
Date: Thu, 19 Nov 2026 02:35:04 +0800
Message-ID: <20261118183506.45749-3-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118183506.45749-1-enderaoelyther@gmail.com>
References: <20261118183506.45749-1-enderaoelyther@gmail.com>
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

A channel switch with block_tx set disables the carrier and TX queues
before the CSA management IEs are installed. If installing them fails,
the request is rejected but TX stays stopped.

Stop TX only after the IEs are installed.

Found by code review. Compile-tested with W=1.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
index 5b8fb37c3f3d..a9cee7e602f0 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
@@ -3117,12 +3117,6 @@ nxpwifi_cfg80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 				       &priv->dfs_chandef))
 		return -EINVAL;
 
-	if (params->block_tx) {
-		netif_carrier_off(priv->netdev);
-		nxpwifi_stop_net_dev_queue(priv->netdev, priv->adapter);
-		priv->uap_stop_tx = true;
-	}
-
 	ret = nxpwifi_del_mgmt_ies(priv);
 	if (ret)
 		nxpwifi_dbg(priv->adapter, ERROR,
@@ -3139,6 +3133,12 @@ nxpwifi_cfg80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 	memcpy(&priv->ap_update_info.beacon, &params->beacon_after,
 	       sizeof(priv->ap_update_info.beacon));
 
+	if (params->block_tx) {
+		netif_carrier_off(priv->netdev);
+		nxpwifi_stop_net_dev_queue(priv->netdev, priv->adapter);
+		priv->uap_stop_tx = true;
+	}
+
 	chsw_msec = max(params->count * priv->bss_cfg.beacon_period, 100);
 
 	nxpwifi_queue_delayed_wiphy_work(priv->adapter,
-- 
2.56.1

