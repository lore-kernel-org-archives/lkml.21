Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095678;
	b=SDMJHeHBtKzvJ+u94wG9Mj8oeWvaciBDTG2vC27kn0CxOQB5K23v3BQW6+TrbsqCMX4p
	 5woAg/gDZO7UbnnHDqsteYIA9+j+LB3cUTu0+UvcpSU2N59teFAtZv6rPj6laMYaKfHOz
	 uj+3I+yAmVnd29wsoY3j9mn5Uvvna6Vmxh06XsqfvlDgJDoIPZtAgZTzis/qjTN2+CkJs
	 RKPLr/VtDTaRBKtHL4ezD5dUcbVIlpWJIyA8u3xl2To2rSAvCdCTAooh+7nbR3OrF/+6b
	 nCXkfo2Ttb5idD8Cf4pYHkwUz/KT+K8RaPZax+WZf7cJXAq3Cx5kpF5f8WtsWlrC8RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=whGAW20c8uVzEqkH7Pgwmyhm5R9nQD5NUUfYKtUiNBM=;
	b=jkEFDIpR6Omss+lswKftZ32SKnneKrVzj9Y1HnSi1SeL1WMnN3GxIm8ogKqlC4Tp7IB7
	 PfsePfpMy8Y9kCaP1F5hudg8bFVGwV7zHpau7F1bZR/P6KJpM9kLs9Vyt1MuRTEvi44fj
	 3/9ztN/QYtV5lOhoG0V0w8yvkfXzg7iXJ81R4howJDsnOOCZgEUkUb6b3SUdFPqYIygqj
	 Lark3GUpI3SWRiAmib8ZOcbqezoHwqb0801Z87CB7TPSw2dqJCY+zguyrfd5RD0NUSsOR
	 kfvB1hdbMHlr9WbfN6AMYvN1UVnRI4i6AGaJ2v9lgm/nWyr1cLWLvQvLX5RCjHgRxRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUH2TQHU;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF39160A2602
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF39160A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PUH2TQHU
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c506a231b88so316562966b.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095676; x=1795700476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whGAW20c8uVzEqkH7Pgwmyhm5R9nQD5NUUfYKtUiNBM=;
        b=PUH2TQHUcApim1vh5tI0/F28nASnNy5HpwuwCVBzRxDobKrlkJcZ931TVNeKrRsinS
         e4khw5V+ujLPzcYX7MovzQCP6jUAdvFX05n0fyjJVVFXcXIbfNziIfLcizPAP8y9sY2F
         e+reXE845OK3/a6C1T6KcXK5USO2g0Qj68jBp4l7+ayrUT3WvdcPzG04TydjoOfFzWc9
         jH0PXjKBNbpEM2sXy2/uTfAC4bS0JzIcl+kFryOhgqSl7JZP1/YGC4pB2XBKc7NedBnI
         7jXMUEs+xuiJ2oypDDVs1saKCmExdylNDzLiHG1YUGvXPZ/yYdoY2doNoAJMwQkUdSFr
         HRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095676; x=1795700476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=whGAW20c8uVzEqkH7Pgwmyhm5R9nQD5NUUfYKtUiNBM=;
        b=zNY4gSJ2QRaygFkk+6Vr/Z59K70kaP3MaWpLagbN+2vhBxScTYgjrfbn0yoco6r2Td
         ZOr+CsV8hCjIRqU6XGLV0oz/fIVFi40twYxgjQzT4d3NOlKdWWaKhP5/MQB+QK7lq/2a
         y2SMUm4BZ2mfQtGNo5gqiRXn+MNFw8tiO44MX8U/IHEnIaJwsaU2K0+oK/4JxrMC1p/c
         cNd54Kp/zGLUNwyiN/PZFHso/nBvXPC6oPehfnVdkZYXg3vppNTGGK7yyqbOrysJ0QW1
         Oo3da9Pypl4a1cYikfhpKEpdYZ6EMfmOAkNQTLKKN+yyTZR63XHulR25czUoliZLTHY4
         doHg==
X-Forwarded-Encrypted: i=1; AL+hErE6xWzMbvFw9PR2iqkXGvEd5JvlGoQvBBT7219vEcrNSUMEUAm7GnMP9mUabWJNRnMZLmyPzpYzVpW6V9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AmmX2BXBrnUG4Ab0LjwMiGc/57LzwiojbK15ZCt+JFcDgdrwo
	05K4l7gwxnKQPX5ey2O4YW4Je+WEIKNM1Qvu8MAaNPXC7p0rWqsUXbM3
X-Gm-Gg: AYBFou1TtR76r9xZ/F92kPtGWzE6bAwc5nR1qjOAEoiRQiTcs3fJNZCBt9HnAvH+4m6
	fsC05qqGjj4ig2wdRTPR3C6EVPfd7Pa+wnqbFyLsUrz8pniL3tie4qPkSBjSmIf1+uPT+VILiU8
	dkvezD6DRQdEnyajt3fZQLUg82wdXj6aBxy28Xi4GqFquxbkOhAeMvYWB4+Ngnv/mBKl5+l3gtv
	MKkYtoo9+ibfkBOPPgjt1LK8IoioOwrI8SQCbKaXHTilRS/3rxR4x6t9XbVwTYXB11i7x3W/iqA
	hIhPlfOp5DW5EoN3tmTCV4xCE9r+9n6V1u1g7iRUxY9ib4BfQzLnjHaiu1kZ7CbH2ambf7fNNlC
	mLRD8VggQSy9EE/NBIR5JKfqaxg8e9UaOmjsJXDHAgmqqYT/3yXTyBVCJYZt9Si15vbSgJvUOAs
	rV6MGny1NWVh4dD6It7SC3ltlPpP9LQkR6Xd/ejdSKbeKd9r9rZhIb08Uj8grPGF52BIIaoubrD
	vTYZyfiHwXVoIHf29VUll/5mRGppWckf+WPtENwoZfxgOh6SMHhG43gy5NsqXB64FQ3r/Bg4ox3
	0jzyBfQUYd/YN7XpAtwK8dRGvZN0fpBsTGgKpLX/SBoXuaJplEwCW9MKPs/MbD1pt0UBQXOK4h1
	przTwNQqs3ZtI4g==
X-Received: by 2002:a17:907:3f93:b0:c46:88ef:2e46 with SMTP id a640c23a62f3a-c510debdbd4mr511238566b.1.1795095676017;
        Thu, 19 Nov 2026 05:41:16 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-31-175-182-49.play-internet.pl. [31.175.182.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c512346fc3fsm105582666b.59.2026.11.19.05.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:41:15 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	Alexey Immoreev <luixo-public@luixo.me>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 2/4] net: dsa: qca8k: drop MIB autocast frames once the request is over
Date: Thu, 19 Nov 2026 14:41:08 +0100
Message-ID: <20261119134110.15048-3-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119134110.15048-1-kuncy7@gmail.com>
References: <20261119134110.15048-1-kuncy7@gmail.com>
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

qca8k_get_ethtool_stats_eth() points mib_eth_data at the caller's
ethtool buffer, asks the switch for an autocast and waits 5 ms for the
frames. On a timeout it returns with the request still published, and
the caller falls back to register reads; ethtool_get_stats() then frees
the buffer. The autocast handler runs from the conduit's receive path
without the request's mutex, so a frame that arrives late still writes
the requested port's counters through mib_eth_data->data into freed
memory, and frames beyond the seven expected ones underflow port_parsed.
ETHTOOL_GSTATS does not need CAP_NET_ADMIN.

Protect the request with a spinlock that the handler takes, retire it
on the way out, and let the handler retire it when the last frame
completes it, so that frames arriving after that are dropped without
touching data.

An autocast frame carries no identity of the request it answers. Once a
request has timed out and the next one is published, the switch may
still be sending the earlier autocast, and its frames count for the
new request. Wait for MIB_BUSY to clear before asking for the next
autocast, as qca8k_mib_init() does after a flush, so that at most the
frames already on their way to the host can be taken for the new
request, and track the ports seen as a bitmap instead of a countdown,
so that a second frame of a port cannot complete the request before
the other ports have reported. The requested port's counters then come
from the newest frame of that port, which is at most one autocast
behind - the same as a register read racing the hardware.

An LLM assistant (Claude, claude-fable-5-1) helped analyse the race
and write the change and this description; I reviewed both. Built with
W=1 on arm64; tested on a QCA8337 behind an IPQ5018
(GL.iNet GL-B3000) with tag_qca, with the request timeout forced to 0
to exercise the late frame path.

Fixes: 5c957c7ca78c ("net: dsa: qca8k: add support for mib autocast in Ethernet packet")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c   | 47 ++++++++++++++++++++++++++----
 drivers/net/dsa/qca/qca8k-common.c |  2 +-
 drivers/net/dsa/qca/qca8k.h        |  6 ++--
 3 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 3c8044a4d1..4de7da9c8e 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1676,10 +1676,18 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	mib_ethhdr = (struct mib_ethhdr *)skb_mac_header(skb);
 	mib_eth_data = &priv->mib_eth_data;
 
+	spin_lock(&mib_eth_data->lock);
+
+	/* A late frame of a request that has already returned */
+	if (!mib_eth_data->data)
+		goto unlock;
+
 	/* The switch autocast every port. Ignore other packet and
 	 * parse only the requested one.
 	 */
 	port = FIELD_GET(QCA_HDR_RECV_SOURCE_PORT, ntohs(mib_ethhdr->hdr));
+	if (port >= QCA8K_NUM_PORTS)
+		goto unlock;
 	if (port != mib_eth_data->req_port)
 		goto exit;
 
@@ -1704,9 +1712,17 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	}
 
 exit:
-	/* Complete on receiving all the mib packet */
-	if (refcount_dec_and_test(&mib_eth_data->port_parsed))
+	/* Complete once a frame of every port has arrived. A second frame
+	 * of a port, left over from an earlier autocast, cannot end the
+	 * request early.
+	 */
+	mib_eth_data->ports_seen |= BIT(port);
+	if (mib_eth_data->ports_seen == GENMASK(QCA8K_NUM_PORTS - 1, 0)) {
+		mib_eth_data->data = NULL;
 		complete(&mib_eth_data->rw_done);
+	}
+unlock:
+	spin_unlock(&mib_eth_data->lock);
 }
 
 static int
@@ -1721,13 +1737,25 @@ qca8k_get_ethtool_stats_eth(struct dsa_switch *ds, int port, u64 *data)
 
 	mutex_lock(&mib_eth_data->mutex);
 
+	mutex_lock(&priv->reg_mutex);
+
+	/* A request that timed out may have left the switch still sending
+	 * its autocast. Let it finish before asking for another one, so
+	 * that as few of its frames as possible are taken for ours.
+	 */
+	ret = qca8k_busy_wait(priv, QCA8K_REG_MIB, QCA8K_MIB_BUSY);
+	if (ret) {
+		mutex_unlock(&priv->reg_mutex);
+		goto out;
+	}
+
 	reinit_completion(&mib_eth_data->rw_done);
 
+	spin_lock_bh(&mib_eth_data->lock);
 	mib_eth_data->req_port = dp->index;
 	mib_eth_data->data = data;
-	refcount_set(&mib_eth_data->port_parsed, QCA8K_NUM_PORTS);
-
-	mutex_lock(&priv->reg_mutex);
+	mib_eth_data->ports_seen = 0;
+	spin_unlock_bh(&mib_eth_data->lock);
 
 	/* Send mib autocast request */
 	ret = regmap_update_bits(priv->regmap, QCA8K_REG_MIB,
@@ -1743,6 +1771,14 @@ qca8k_get_ethtool_stats_eth(struct dsa_switch *ds, int port, u64 *data)
 	ret = wait_for_completion_timeout(&mib_eth_data->rw_done, QCA8K_ETHERNET_TIMEOUT);
 
 exit:
+	/* On a timeout the frames can still arrive after the caller has
+	 * freed data: retire the request so that the handler drops them.
+	 */
+	spin_lock_bh(&mib_eth_data->lock);
+	mib_eth_data->data = NULL;
+	spin_unlock_bh(&mib_eth_data->lock);
+
+out:
 	mutex_unlock(&mib_eth_data->mutex);
 
 	return ret;
@@ -2120,6 +2156,7 @@ qca8k_sw_probe(struct mdio_device *mdiodev)
 	init_completion(&priv->mgmt_eth_data.rw_done);
 
 	mutex_init(&priv->mib_eth_data.mutex);
+	spin_lock_init(&priv->mib_eth_data.lock);
 	init_completion(&priv->mib_eth_data.rw_done);
 
 	priv->ds->dev = &mdiodev->dev;
diff --git a/drivers/net/dsa/qca/qca8k-common.c b/drivers/net/dsa/qca/qca8k-common.c
index ab978cc836..f1e7e86f47 100644
--- a/drivers/net/dsa/qca/qca8k-common.c
+++ b/drivers/net/dsa/qca/qca8k-common.c
@@ -101,7 +101,7 @@ const struct regmap_access_table qca8k_readable_table = {
 	.n_yes_ranges = ARRAY_SIZE(qca8k_readable_ranges),
 };
 
-static int qca8k_busy_wait(struct qca8k_priv *priv, u32 reg, u32 mask)
+int qca8k_busy_wait(struct qca8k_priv *priv, u32 reg, u32 mask)
 {
 	u32 val;
 
diff --git a/drivers/net/dsa/qca/qca8k.h b/drivers/net/dsa/qca/qca8k.h
index 9563388930..79754755f1 100644
--- a/drivers/net/dsa/qca/qca8k.h
+++ b/drivers/net/dsa/qca/qca8k.h
@@ -402,9 +402,10 @@ struct qca8k_mgmt_eth_data {
 struct qca8k_mib_eth_data {
 	struct completion rw_done;
 	struct mutex mutex; /* Process one command at time */
-	refcount_t port_parsed; /* Counter to track parsed port */
+	spinlock_t lock; /* Protects the request against the rx handler */
+	unsigned long ports_seen; /* Ports whose frame arrived, under lock */
 	u8 req_port;
-	u64 *data; /* pointer to ethtool data */
+	u64 *data; /* pointer to ethtool data, NULL with no request pending */
 };
 
 struct qca8k_ports_config {
@@ -501,6 +502,7 @@ static inline u32 qca8k_port_to_phy(int port)
 /* Common setup function */
 extern const struct qca8k_mib_desc ar8327_mib[];
 extern const struct regmap_access_table qca8k_readable_table;
+int qca8k_busy_wait(struct qca8k_priv *priv, u32 reg, u32 mask);
 int qca8k_mib_init(struct qca8k_priv *priv);
 void qca8k_port_set_status(struct qca8k_priv *priv, int port, int enable);
 int qca8k_read_switch_id(struct qca8k_priv *priv);
-- 
2.43.0

