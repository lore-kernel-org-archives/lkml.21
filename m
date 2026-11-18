Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026940;
	b=Trh8XfiLuaDat0GN9Rm/vCoVwyGMGWYD50nppuX9u/TlD9kITZdjp0Jf6PXRGgfsRE4Z
	 ojDREZwqtWa5HizNH5ZOzfbB+JXnytvObGE+rjseJdrR2i6UQ4Xt63dneCmUVUI4ZlVTH
	 cFfZ7zM7/Mz9QOfDbbhdY5gQQUbx4PSdK3KXSIGxA8kgpxcHLy92IiXwwwTBXdAfvLVgc
	 w3tA91gH9j2H7KhskhYL1aRbKskz4ULHItSKiYzC7dFvXB/fudZO2TNvCF4vIxhdMk0qM
	 NqENJ2yT5t0OQ52mKxMJBoJs/q6guUtli4unPAPQT7wkOXlQp5lDmfdQsTevpozMM7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L5wbkUZYtMNXPJXdaccMgVd27DQ+KICM3eePhOc5nqU=;
	b=isHK+qtH0Nlfdk1V5LClLGw9244tduzdFwNx7ZOuw9W9lr99IRUw8MhCaSHNIaL3PWcK
	 OUeqNvQ84wgoE9SqaSsM0W7i41Tfz12Ekn1ghFbapqiV6vTx9o4yOE/QPfGbgXwOJKBLD
	 Y5uvIBH1zC7mpPtqx2MNOl9aAs0tRn1S6bXcPNLK5Kusr5y/tgwskNSHq1ABmpH8fhQcY
	 KR6VaVsfhR7z/UZbHerzFBbZBUtlT/Q7+Zz7mm16nh5+9IHKEn7j1wOExY7Iq62CKeBpu
	 BqMeLNlRvgds3LUtge8SK954HtQ/5gNGgPA4xw5fslShRDtxZoYmUVFmXbinsd/ggVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owPzAo5C;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20D6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owPzAo5C
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1965021eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026939; x=1795631739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5wbkUZYtMNXPJXdaccMgVd27DQ+KICM3eePhOc5nqU=;
        b=owPzAo5Cg0da6pCBa733ICnomz11iMfsff7eGNc8Eisr8s6IdYXTrGUM3bfW+dZ4lM
         UqXDChlXfUlvUtAf62HTR+6ncUKr/qBFoBYP0nkdHXjXjEZMbZlVfT5+T9AcRrODbjG9
         EoUNb9yqsDIFLHJTFByntpYJ8xTknG+QjnU3Z1L2NW+9ROpqVKZ5J9RKiF/ypswAO3u3
         rgb9641P84uBfjfbHb0ZQ9wsaFY/qNo8gUq4taChL/Gd5lUae9LylZeL7IorzcvEkrhH
         ZSIdOMqn624WMxXwxlkSGvAi5WHzVkY6Ks8Q+q7xMRcWsUxDd+nX5CarADj2HMOHpxVM
         eNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026939; x=1795631739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5wbkUZYtMNXPJXdaccMgVd27DQ+KICM3eePhOc5nqU=;
        b=Om9CId98A72hav1xdNvpiK3PTs75vo8XyEsHwS8vVvKxXBF5IeWrNlTf5GDRE6dRSA
         6aueyHo+q6a0ucJ2zauMikKZ4pOo69FwIIIdIrHLNPeahK23QT78J4UO0/SKVTHze4OR
         xTNFhhyZ33oVu0U+gTMczZMvL+LYhiCSOsUTe/p8r1w2A+3WFUMnGmn4NwaRsH+JxzUW
         Xed/nSaNOUoSC5iTtnZJpNX6UZZKQKkd+4h0gWcCXRFWsvNvanI2nPTcvyVM3TT0E3Yq
         QMA/oJNEblCIlAwgL2aifPnYg1HrC/vyERCikgJlGTa6pxssgrjs33Q5uZzrqz98JO2W
         4P7g==
X-Forwarded-Encrypted: i=1; AL+hErETLy0r+H2DbfYNlUqgXLIIv/mhkG6C5tHge2A2J3b/ah33taNWeBUVpCPOoYQQjXXJnMtYR3grlj83I4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PTPyHFOsqufZf/lR9QXAWf+adKmbZ8uvP1fznpp0bLWctb6br
	oWEJlyuoOfwVeAZ5fHnildHLZlQAsoBhWn7Fasg487Y56M1RL+Ft+8sg
X-Gm-Gg: AYBFou2CbyZEz3iANsAMTXk3p0mGyrD7CE1rMxRzZT/TGD/oATwUHFdZ0m2ZASogZfJ
	c8JgLQNWDzff0M9auC4OJzJE4Fmb/gxFwP+gu3B9BkQJSnAT7ZXNNUBuogeVM3ynLZkKXAqR2J9
	zOOyZ6ZW7A+7Qy8yvDruUakVkSCGbxsoPwyDCrRE63/tzua3taKnh+6divmu0bHGjH74icrXjTV
	VD38fbh7WAn5rLgo0AbklXx25k6DkuyW95FqgCN02DAxh6luyLrMWaMdE8qqN5Ns4eaCH/P/hFu
	3xN/BvJK+OhN/NgxXeOwj6pU2sVU2QrOAW3nCBrCK5EqulU/mWhotyWLPA81W2P793IOEUjUUoO
	bhIj4i2VPxxo213qRTHqB7n23/k6mdv8uKeGxWZLVRwbl7HnwDU2MicjJyPZSneAssDdk7LXbW1
	QGkClXuGuXFaaQkBbFolENpfq81wrCXqf0KglqtsPCwgcw3Rx8OEAyM7RUgE4eErPb1iE83yhlr
	Me9ORDlofIUICXPyAMSiUTBAI6lQOot6+rYar/EajkLnScpYBeT3yGPf5PLRmcXArzqqAHbj3mB
	N9pwq2EqTyQoI2Shl8ak6Klhh7ju0ohtWdRPD7oOYI8VBioM5w==
X-Received: by 2002:a05:7301:d816:10b0:380:fd90:e660 with SMTP id 5a478bee46e88-382815240efmr3105334eec.14.1795026938437;
        Wed, 18 Nov 2026 10:35:38 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45274aesm10450189eec.2.2026.11.18.10.35.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:35:37 -0800 (PST)
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
Subject: [PATCH wireless v2 1/4] wifi: nxpwifi: cancel channel switch work on teardown
Date: Thu, 19 Nov 2026 02:35:03 +0800
Message-ID: <20261118183506.45749-2-enderaoelyther@gmail.com>
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

Stopping an AP while channel-switch work is pending leaves the delayed
work armed, and the callback later runs on an AP that is gone, or on
freed driver state after removal.

Cancel the work when the AP stops, and clear uap_stop_tx, which a
pending switch with block_tx has set. Interface deletion, type changes
and driver removal all stop a running AP first.

Found by code review. Compile-tested with W=1.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
index ba54078b082c..5b8fb37c3f3d 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
@@ -1639,6 +1639,8 @@ static int nxpwifi_cfg80211_stop_ap(struct wiphy *wiphy, struct net_device *dev,
 	struct nxpwifi_private *priv = nxpwifi_netdev_get_priv(dev);
 	int ret;
 
+	wiphy_delayed_work_cancel(wiphy, &priv->dfs_chan_sw_work);
+	priv->uap_stop_tx = false;
 	nxpwifi_abort_cac(priv);
 
 	if (nxpwifi_del_mgmt_ies(priv))
-- 
2.56.1

