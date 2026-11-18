Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998472;
	b=v3WvDjN1VHjNgsPEMOXrjofCsCNgC5LpVc46OFlFaXJnGJPyFxe52pnws1X+kpvRLrLG
	 gAKJ6Uyys46pBFLdpW46N1E1UHoSkyMQr8hQR/DaM9PmZ3PNOkGJKNEFj/tIflbuVyISe
	 FrViahSWZxmtOeV13PFoqDNGQEbUHfDYwQZAAuA/VG45vgE/nqDDqKa198m7jXKOn+n2D
	 i70oCLvv80D6B0n7TjOju1XSQjRw488zM4zLRGfmPWrpg+FsTFvi75dGu49YsOarjXdxX
	 rfe+cdBI6iZWOPNIppxdwk1X61ItL3S9HY3yGj2qTxS2onmD61S7NudDh39ImCL07Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=whGAW20c8uVzEqkH7Pgwmyhm5R9nQD5NUUfYKtUiNBM=;
	b=hkW71+jih3AOT1Xlubb7KJQ3BpjYMTY8yJ6MTNXZuBEOZcuMJtQA96suyjOJYAuXEB6e
	 TItpvZ0d6bb9b2ycSMUlln0xQhhPZ5SM/KvSyUOWqrNN6T910yfn9WYrlyCj7jLjv/qAw
	 9IIfoN1Bgxm/hTw0N/z0IOYHNRMHOfPIeAJTmdKzeiGCNkBYUjFpUKEjf7CbOCBRVO+Ho
	 XWw558LOUUtXi3RUCO/6hrG+Xu2WXOX/9gb2Cr/nR/IZHck5h+fYgzjqT2XorZBcS0IaP
	 CLo6x9zGl1xn2ipf9V9b+9/MyfcswAqLvvWXpwkQy6MGT5KWSCFYwxHSTsKtUZ2zfOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oIvpowlr;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDCA60A2600
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCDCA60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oIvpowlr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso7774025e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998470; x=1795603270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whGAW20c8uVzEqkH7Pgwmyhm5R9nQD5NUUfYKtUiNBM=;
        b=oIvpowlrmooNMKWq/mZkSPqWvL9uzz1vnsyyr5doG2oMHeMO6AX3ikNRncihc/6cdA
         kgLRjDT/nGmkqD+0sS5eyMYQslA+hHrdSXK1KL+ZDknDa0x/zJ6mphC5Nz0L0uZDhcr3
         gHgdumzf59Cq/IWQgqw3GrP6grXfCFog5sDxkfdX+uEbUzIhFef5TkckbXq1j8A6opKL
         HezxX9EVtYYBYu82KCNy01Izq8pRo3mGtBP7Gsw+q6CNIMNNl3kzqeC+QaMV1HcZPEB/
         hVfZCY2h5NFfbLFzakMksZWwz0syEnNBH/OLKwyKAwmbSkRXOBjdLx2DXPV4uzerGNIy
         XP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998470; x=1795603270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=whGAW20c8uVzEqkH7Pgwmyhm5R9nQD5NUUfYKtUiNBM=;
        b=jI0dQ/m4KtqtNS+9hWSXYNftP/s03ynfev1axcKXYfvwQMThA7sFK3j/utU1SNyisA
         5m0Aon/e1gciMBAlijhtTIq4uPNo899J6RbFcslp5z4mWkMSsBM6Tvxj/tvpbqUV5VFO
         LIbGl9gTQUJlFYJBPiGAYSjGss+tmZjfDUofGf/dtNs1fDhHToTduoNxaPGzgy9K8Uqp
         dwDu3jssFVQB3LRLD3IOl81Nc6oh1Hbi6urIRkLylZIqOVifXVowmAAjdyKyc0uOnn4w
         tmZZNitM3mfMgI2Znb+MK4Qtq8iwIFp/pPdcBF4odJmGhgF54MAhv7E50d8gGZiYce8+
         KAVw==
X-Forwarded-Encrypted: i=1; AL+hErG1PgXCC0fo7LSly+YaC56sSfx6xxGhSgSrRNyV5UmurlbF+O8HyvKt+3FCwD5m+7wlTt881L1cF4Fc6Ao=@vger.kernel.org
X-Gm-Message-State: APuU4Z81PdVEwHKz8iXPEr6Iz6rcZXsI3yGetrDekkzThjUQ+9u7p6Ax
	cd8J2DO+iu/+6yAzxeXei3LhwfGFAg6FfdR6uYngxbX75/QeMYc+GDjN
X-Gm-Gg: AYBFou0rOLOXxlChkjlIxNg/GzcKe0hEikKQuFYMIhKacMAl0Bu/IhWSRZtpFz2FLJO
	sMDCysTXQv4YErAioli8jGMFsUOUipAVyCdXYFVV9guB9nbSm2p3ShFHQpw5VZl1obax9gy9lZn
	+kqIa/cH9ZPzJxBqBiouMm0v17YdV199OQ1DNfLcaKLo6PcFrXh5D3stFRuoxY6EvY3gg7Qgp04
	ZkHwZohJa04YzaxIKfJUQYxgUi4dJoHzLvKNHobWJ1p6s/R7wG8KowhZM933aRQ4YPWWlqhg8Tj
	lmXAAoSa9MogREUmrk4ZOtQ7eSL+pJUzv3cTpoDMosLGULw5440L7n89amtAncuTHXVfiTrMfxs
	ALhmMFvd9uTagErgsvsYEEGqJIoQ0wj0xVtYbBPtuMxLLZm2BeVDT0bNLvljjd3xkpRkfcWcCdG
	uawmqqtUGEbWWHJTrc9HoCBp1t1FnL6uFthHAmfTpe9iesGX3EXO+ri5JQUbC+d/ElW/ff1vdro
	npmxpCZOILCYP29gkA79FB6K7WgWme0uQ8IPCjrmEyZ1Mjt1BPMbj/5xYu+xNEaYi2FQ98mXL/h
	6u8TfzYntGcbzdCY0myqlCH4jitOHrPDsK6gSs6An6wvfmyl5ZgKRx6tnUZXmhkJB7V4RKELzWa
	xgPKjIfgZm9FG58s=
X-Received: by 2002:a05:600c:3f0a:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb7da25928mr35500835e9.18.1794998470179;
        Wed, 18 Nov 2026 02:41:10 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-46-112-114-48.play-internet.pl. [46.112.114.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm4320525f8f.56.2026.11.18.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:41:09 -0800 (PST)
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
Subject: [PATCH net-next v3 2/4] net: dsa: qca8k: drop MIB autocast frames once the request is over
Date: Wed, 18 Nov 2026 11:41:02 +0100
Message-ID: <20261118104104.26684-3-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118104104.26684-1-kuncy7@gmail.com>
References: <20261118104104.26684-1-kuncy7@gmail.com>
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

