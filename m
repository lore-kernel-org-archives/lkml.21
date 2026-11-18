Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026956;
	b=xgZn05qCho31IX+NZGX3zB7neoPg/HujNqWsg4XVX+4I4PygUo3nvTRSr7NhB9ON8rAN
	 f5Qfq+X1DU1Nk5GhSe3s/I9DYthgHpNZFZ/sGnqBQokRPPGde8jl5YG7Cgt+uHsfqPmt2
	 MtL46jxPvXelZYcp/WSGH3s02Ltc3u1ccV1v0MDolTLu0iYsgUzSBvMevsyScAVEfL3JS
	 JoZOJw+/NHxE5zXXq4p+US1rCC7TJJ14q7ntxVVUp+sxuqiCMb8msH1gcHalE5b1JfiC/
	 YKZDNkSCsc+aY9es/wRSoPU/D0fc1/HgP8TUVkQmmB/PksGdIGhNgQDaoO1g/CRLktg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mP54NqX1yA2UP7uMr6LAS3zfC46Nx8rGJsFCoNbtzuw=;
	b=eoqKuPx8Euv2xXNEFj4sZhIFB+oHfrlnG46gdJE+2b0Xe2/2gEf64CCEEtBg5NuEvghd
	 GnOIxKhllkNrN9UFnHEq658vt1DvTOqdlOoxetLV++fVYoeuhf8UP9Wfe8KOM973uTHgs
	 EPybxaxk42A7vUgYcH5b5aupuFNfNO9EuHue78VVlBjr0XeASkDvJBqRUGO3NkNr0NVyP
	 zb+SKO2WaI+aJo1S7SxkiytaQl6N68OzLEew27fvb/7oRSdVAJghrpffBS7VHjLi1yl1X
	 4e9Ah0ivbBKBUB/tGtziehA+AZf9Czmh7jeoE3C4P57RJeeroEgUNzVHvtEigeD72YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mrU3nHra;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758E9606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 758E9606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mrU3nHra
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3170603eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026955; x=1795631755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mP54NqX1yA2UP7uMr6LAS3zfC46Nx8rGJsFCoNbtzuw=;
        b=mrU3nHratFm0M6YIukvWG4ZZBjASiv/7L+CzXozQ2wp7IyNP9SAxTgKwovudjdkiIS
         /NvxfzZrLyQyBBBGc/QvtTALhIM7Czf3e6361Lbt3Mk7UbeO06E1yJMgsVOldHBlicFm
         APBCJzbNEykJILVtaRMYFCKHWhXPjNaCUVNgkQA0T3+R+7V1EZHcQIPC6emfgbGa2rz6
         reqCiGOiGVspEtlqzmgvctm6IHZ5BYTfLuYcq4z6674W5DnC7obQqBrh2a4TNPaV6qHO
         2ac2e5v6m6+WLYHwrOJ5EIo9KYYAIq9TIDAzwPhUKtCAdyDVwnqF9Bi5nhiBz+Q+durH
         DV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026955; x=1795631755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mP54NqX1yA2UP7uMr6LAS3zfC46Nx8rGJsFCoNbtzuw=;
        b=FN16EaLHyknXm+pEkrEEtfHz2l6wPow0jKpt8/mUYGsvM8egBfNHWQAk25e1GaNIwx
         +Qoi42buRHBMb2h3/y7tRYuVGsDIYsV1yStwWwHnDqrtNO2h5GugExL+SPNtGTu5o4th
         dChzxvv4GDdgXbBkRZ2EIDatZMyYgIyTKBC5jDar9VBAya0hgF31SAbfmh/G9v7Ip3ic
         vXDqcRSc6MvU4/X4uS7QdRT4dWXYIg/WSP9AAug2bo2Td5UBf83Bztir9g3xAQlgEND2
         B5ds72lSfqFtnAhzC+q4ygOIuaO2ji5HQ9U3o1r9AIPb2o757UiAP4Q3k0mHUDwsYZIT
         cUpQ==
X-Forwarded-Encrypted: i=1; AL+hErEoDX72nzHYjd5CeKu7PjHa/FybmdIWRq9gV/lRfDW/hOc/O3Q13iJ3DkYiyZShFVvNKc8NAdlHzMZ6pNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MnPFLx6aZ+ffQljaFB0WKdDc2x4lrAo2STXE9x41hEtPEyDFz
	HQP4vK3Bvo06wmtcBURrBLpdefCIk9gWGDYI6hdyfxYwbeUCd0sf7tEq
X-Gm-Gg: AZFdTZc+zL0Fnf8widED6Aauqyq00nrQEfpX6kbad5v2BxnGfyGIMhkX72xogcMw96V
	A5WcCyWXw6ZXlHLGHOyaBt7n8Npo9FUnViZi88XvHifQqCetUUUav4cOdQoR3GsrM/HnLBQ4f/W
	FtDk/lYde3Yp1+B50MqXkrG3W7y1W+EgqWmWerDeSu+/FVAj4uLZHJRKDzz++bX8t2hLWU5Jf0z
	0JnYQRfdf7DMz+0vQSyQOmunWckqzXDIT0UwCcIpXXd32sAGLj7QZAuEUrsp+he6Drr84CZsf3o
	Xwhos9Q6ULyeqJYBsuEdDUaXV6wdWSMhAbHI4KQAr+9+NLlIgCnKykC9kKFivLPJtAfbUc9zK39
	eg6qPy5e4CMOy0W5xeMoLl0kS59secABSSvpIl01rFGATb1TSM77Mo95JD73VHJxWsqRuNGPxJD
	Jb3f9JGAk6inzghIkUWukw2u0kzMCSY4NPrG8fmQGzjelwmode/7KOqR8RgotgIP+rPgVWzDGw6
	KjRKlMzSaHE8JM7dwhTf4YxFd5wGS2iHSzORJdFetLEWTlO71aL6YaeOi3ywbtF0jQ/BKQ1hnUp
	Qz1ELRvDqhZ0G/fEi5zach2G8SytlIqz6Wgg22DzEyyS5cCI5w==
X-Received: by 2002:a05:693c:409a:b0:382:48a5:cd53 with SMTP id 5a478bee46e88-38281217ff4mr3614000eec.31.1795026955041;
        Wed, 18 Nov 2026 10:35:55 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45274aesm10450189eec.2.2026.11.18.10.35.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:35:54 -0800 (PST)
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
Subject: [PATCH wireless v2 3/4] wifi: nxpwifi: own beacon data used by channel switch work
Date: Thu, 19 Nov 2026 02:35:05 +0800
Message-ID: <20261118183506.45749-4-enderaoelyther@gmail.com>
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

The channel-switch work reads the new beacon data after the cfg80211
callback has returned, but the driver keeps only pointers into the
request, which can be freed by then. The IE parser then reads freed
memory.

Copy the beacon buffers used by nxpwifi_set_mgmt_ies() into an owned
cfg80211_ap_update. Free it when the work finishes or is canceled, and
return -EBUSY while a switch is pending.

Found by code review. Compile-tested with W=1.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/nxp/nxpwifi/11h.c      | 14 +++--
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 60 ++++++++++++++++++++-
 drivers/net/wireless/nxp/nxpwifi/main.h     |  2 +-
 3 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/11h.c b/drivers/net/wireless/nxp/nxpwifi/11h.c
index 058c319ff910..a6c87dfad9ee 100644
--- a/drivers/net/wireless/nxp/nxpwifi/11h.c
+++ b/drivers/net/wireless/nxp/nxpwifi/11h.c
@@ -301,21 +301,21 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 	if (!bss_cfg->beacon_period) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "channel switch: AP already stopped\n");
-		return;
+		goto out;
 	}
 
 	if (nxpwifi_send_cmd(priv, HOST_CMD_UAP_BSS_STOP,
 			     HOST_ACT_GEN_SET, 0, NULL, true)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "channel switch: Failed to stop the BSS\n");
-		return;
+		goto out;
 	}
 
 	if (nxpwifi_cfg80211_change_beacon(adapter->wiphy, priv->netdev,
-					   &priv->ap_update_info)) {
+					   priv->ap_update_info)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "channel switch: Failed to set beacon\n");
-		return;
+		goto out;
 	}
 
 	nxpwifi_uap_set_channel(priv, bss_cfg, priv->dfs_chandef);
@@ -323,7 +323,7 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 	if (nxpwifi_config_start_uap(priv, bss_cfg)) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "Failed to start AP after channel switch\n");
-		return;
+		goto out;
 	}
 
 	nxpwifi_dbg(adapter, MSG,
@@ -336,4 +336,8 @@ void nxpwifi_dfs_chan_sw_work(struct wiphy *wiphy, struct wiphy_work *work)
 		nxpwifi_wake_up_net_dev_queue(priv->netdev, adapter);
 		priv->uap_stop_tx = false;
 	}
+
+out:
+	kfree(priv->ap_update_info);
+	priv->ap_update_info = NULL;
 }
diff --git a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
index a9cee7e602f0..e42f0f9b61dd 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
@@ -1641,6 +1641,8 @@ static int nxpwifi_cfg80211_stop_ap(struct wiphy *wiphy, struct net_device *dev,
 
 	wiphy_delayed_work_cancel(wiphy, &priv->dfs_chan_sw_work);
 	priv->uap_stop_tx = false;
+	kfree(priv->ap_update_info);
+	priv->ap_update_info = NULL;
 	nxpwifi_abort_cac(priv);
 
 	if (nxpwifi_del_mgmt_ies(priv))
@@ -3068,6 +3070,52 @@ static int nxpwifi_cfg80211_set_coalesce(struct wiphy *wiphy,
 	return nxpwifi_coalesce_cfg(priv, &coalesce_cfg);
 }
 
+/* Keep only the beacon buffers consumed by nxpwifi_set_mgmt_ies(). */
+static struct cfg80211_ap_update *
+nxpwifi_dup_csa_update(const struct cfg80211_beacon_data *beacon)
+{
+	struct cfg80211_ap_update *update;
+	struct cfg80211_beacon_data *copy;
+	size_t len;
+	u8 *pos;
+
+	/* Each length comes from a bounded netlink attribute. */
+	len = beacon->tail_len + beacon->beacon_ies_len +
+	      beacon->proberesp_ies_len + beacon->assocresp_ies_len;
+
+	update = kzalloc(sizeof(*update) + len, GFP_KERNEL);
+	if (!update)
+		return NULL;
+
+	copy = &update->beacon;
+	pos = (u8 *)(update + 1);
+	if (beacon->tail_len) {
+		copy->tail = pos;
+		copy->tail_len = beacon->tail_len;
+		memcpy(pos, beacon->tail, beacon->tail_len);
+		pos += beacon->tail_len;
+	}
+	if (beacon->beacon_ies_len) {
+		copy->beacon_ies = pos;
+		copy->beacon_ies_len = beacon->beacon_ies_len;
+		memcpy(pos, beacon->beacon_ies, beacon->beacon_ies_len);
+		pos += beacon->beacon_ies_len;
+	}
+	if (beacon->proberesp_ies_len) {
+		copy->proberesp_ies = pos;
+		copy->proberesp_ies_len = beacon->proberesp_ies_len;
+		memcpy(pos, beacon->proberesp_ies, beacon->proberesp_ies_len);
+		pos += beacon->proberesp_ies_len;
+	}
+	if (beacon->assocresp_ies_len) {
+		copy->assocresp_ies = pos;
+		copy->assocresp_ies_len = beacon->assocresp_ies_len;
+		memcpy(pos, beacon->assocresp_ies, beacon->assocresp_ies_len);
+	}
+
+	return update;
+}
+
 static int
 nxpwifi_cfg80211_uap_add_station(struct nxpwifi_private *priv, const u8 *mac,
 				 struct station_parameters *params)
@@ -3101,9 +3149,13 @@ nxpwifi_cfg80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 				struct cfg80211_csa_settings *params)
 {
 	struct nxpwifi_private *priv = nxpwifi_netdev_get_priv(dev);
+	struct cfg80211_ap_update *update;
 	int chsw_msec;
 	int ret;
 
+	if (priv->ap_update_info)
+		return -EBUSY;
+
 	if (priv->adapter->scan_processing) {
 		nxpwifi_dbg(priv->adapter, ERROR,
 			    "radar detection: scan in process...\n");
@@ -3117,6 +3169,10 @@ nxpwifi_cfg80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 				       &priv->dfs_chandef))
 		return -EINVAL;
 
+	update = nxpwifi_dup_csa_update(&params->beacon_after);
+	if (!update)
+		return -ENOMEM;
+
 	ret = nxpwifi_del_mgmt_ies(priv);
 	if (ret)
 		nxpwifi_dbg(priv->adapter, ERROR,
@@ -3126,12 +3182,12 @@ nxpwifi_cfg80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 	if (ret) {
 		nxpwifi_dbg(priv->adapter, ERROR,
 			    "%s: setting mgmt ies failed\n", __func__);
+		kfree(update);
 		goto done;
 	}
 
 	memcpy(&priv->dfs_chandef, &params->chandef, sizeof(priv->dfs_chandef));
-	memcpy(&priv->ap_update_info.beacon, &params->beacon_after,
-	       sizeof(priv->ap_update_info.beacon));
+	priv->ap_update_info = update;
 
 	if (params->block_tx) {
 		netif_carrier_off(priv->netdev);
diff --git a/drivers/net/wireless/nxp/nxpwifi/main.h b/drivers/net/wireless/nxp/nxpwifi/main.h
index b25a6a4f2936..4d5718ed5031 100644
--- a/drivers/net/wireless/nxp/nxpwifi/main.h
+++ b/drivers/net/wireless/nxp/nxpwifi/main.h
@@ -619,7 +619,7 @@ struct nxpwifi_private {
 	struct wiphy_delayed_work dfs_cac_work;
 	struct wiphy_delayed_work dfs_chan_sw_work;
 	bool uap_stop_tx;
-	struct cfg80211_ap_update ap_update_info;
+	struct cfg80211_ap_update *ap_update_info;
 	struct nxpwifi_11h_intf_state state_11h;
 	struct nxpwifi_ds_mem_rw mem_rw;
 	struct sk_buff_head bypass_txq;
-- 
2.56.1

