Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108055;
	b=R7hhpPVWl8iX3SCSQVk9e+riwewpNbKHFvdvSlhrh8qOTPVnhPc/xE39/FsPWIHzzJsM
	 hFZ7JAukRgCXRs9EdvHfcHOUEpEfSHbIXufvp1mVvXT+Lqil3dcMnp3L1uCCxPNjk68tD
	 gbp+CLZG4qx7wZKz4jwzQsA04TiLKkRSRnhpPA7nAGEqxOBdOtbyaV8U1oUsrbpTa0uka
	 m+MJEGyUaashmboQh+ENehS24QnaDxgBVPaLWvY06mFYLrUglQ2wgNmwfDRPoi8/dY1O1
	 daMf7Op9zfqP7XgZQ5SYc8/cg4/D2b9KxCzV2YI10MVFt3BmlwqreV2Dr6NMDJ9xixg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=9+uLL4ZhO+yAS7HHcBHeUoXpu6CmB8jc9UKkI8rB82w=;
	b=0wwjLiIbsF3tHfo8rlKZDenmasna5z3VeaIG038vKCj+AW57RDv9ETXT+9z62bPKHSt7
	 fE5Q6k0gCfZ4/2gjtyrSmIJRyVULUh7ZMPyAfEMV8KIjIZjmnZk9MYUl8lLL4bvvmE5l/
	 RKgQ/Mqo++OG5vTzo9v2/Ysykr8187cIGVd1m97YbmoFCqoRQMwg6wSf9xutnT8oqtrds
	 o/uldCXZW6hRFd7PyTD3Qwm1lXw78jwCpqpOCV8C4StTFytu8Shw+hdwPgbXo3fqU9WM8
	 Cn0JmDsiQO+fsirY7N+3TEv31gQ4aiHJOtG+CArI/c1XaDt+0Bv6FQS1/8QYka94w7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ml7suLlm;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AD9606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68AD9606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ml7suLlm
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a5005fd0f8so4492927c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108054; x=1795712854; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+uLL4ZhO+yAS7HHcBHeUoXpu6CmB8jc9UKkI8rB82w=;
        b=Ml7suLlmIpOcXnnf9ewgF2D48rlsL4/6fjI+HeOPmdgCrE4AhicS8+HhdQi8oNqX6W
         Y6+ANvfNSV9O7BgvxrD3e1thOdDYTXS3LZ+LHiLUfxoqKJuRjeQKYZFMRv1Rdj4aRGQ9
         aXd6FGfBjuSLleWbBe36id1j3Rkj5Qe0g4uJUrD61911knO0b0Y+WWEQDLpELIFF5uD1
         PrUsSeu2+Kl+TbwqkQQlK7koNFybLC7NAU4GTT7BCPPpUPrm36+3sPQmexda5jwlpi9G
         dvw4i1HNtN3Pi7KCm0zphM6l+6FcPQ++dARxtAdPl4N8QQAKrouM1byQW8O5w9h+D9HN
         3D6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108054; x=1795712854;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+uLL4ZhO+yAS7HHcBHeUoXpu6CmB8jc9UKkI8rB82w=;
        b=X/rI+H+Q3bkiHXwge/lTQwQMiMQVt7daz4uI7WGarpTvMJ9J39Dv8yhV1YeHfwiBr+
         JwgPREh3rlwPyBh77xzTlpiROWTKE4+g/7wokjLxRbY6rjXCoG6tO17VbNda2oOcliFf
         hpXyM0AoTIc7SoLtgfsiGB0H+ju6WApvix/D+I57N6N2uMh+xp3UFzMVtEWPUtadV8CT
         MvQj41mFc0ZC68Q3VV6qGsmR6F/OypqtBlOxAjDxxd4ZbtF12WZQra+spo2JdPi+FLFl
         iJp8LDhMA9VtkFi9r82ytTCiA1sId9KpMehRft7jXBfNXigpbFmyfD671IueYDIO+1Ky
         /Dqw==
X-Forwarded-Encrypted: i=1; AL+hErHg+vxopATFxA/Y+JGzPunqChaj1a2VibGSeYeCa7gTXorzzogkAz/O6qf8P3uzBXCsxDO3S59AjD8P0dE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Kcv8hwSfe/vIBOB/Dr1FjA507J3ELLsPrnhJ+qNvmVkBw9TAS
	bw7yxF6SOzv3GNWWvLWWCJkw0FuQDm6rD5W0bjf41P3bHQq9fWiFnVf64/Ii8NH0nV50OgyOCRe
	QKFy4urxHhA==
X-Received: from dlaj28.prod.google.com ([2002:a05:701b:281c:b0:1b5:345d:ed30])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b0c8:b0:1b2:6855:998a
 with SMTP id a92af1059eb24-1b556911007mr233836c88.34.1795108053230; Thu, 19
 Nov 2026 09:07:33 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:29 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170729.1524516-1-irogers@google.com>
Subject: [PATCH net] net: lan966x: Free skb when PTP TX timestamp request
 fails in xmit
From: Ian Rogers <irogers@google.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When all LAN966X_MAX_PTP_ID timestamp slots are in flight,
lan966x_ptp_txtstamp_request() returns -EBUSY without queuing or freeing
skb, and lan966x_port_xmit() returns that negative errno directly from
.ndo_start_xmit. Because dev_xmit_complete() treats negative return codes
(< NET_XMIT_MASK) as packets already consumed by the driver, skb is never
freed or requeued, permanently leaking the sk_buff and its socket
sk_wmem_alloc accounting.

Free skb with dev_kfree_skb_any(), increment tx_dropped, and return
NETDEV_TX_OK when lan966x_ptp_txtstamp_request() fails.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wimplicit-int-enum-cast; not tested on Microchip LAN966x hardware.

Fixes: 77eecf25bd9d ("net: lan966x: Update extraction/injection for timestamping")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../net/ethernet/microchip/lan966x/lan966x_main.c  | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index b8696fc7e9b9..9c722d23e0bb 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -392,6 +392,7 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buff *skb,
 	struct lan966x_port *port = netdev_priv(dev);
 	struct lan966x *lan966x = port->lan966x;
 	__be32 ifh[IFH_LEN];
+	netdev_tx_t ret;
 	int err;
 
 	memset(ifh, 0x0, sizeof(__be32) * IFH_LEN);
@@ -404,8 +405,11 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buff *skb,
 
 	if (port->lan966x->ptp && skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
 		err = lan966x_ptp_txtstamp_request(port, skb);
-		if (err)
-			return err;
+		if (err) {
+			dev_kfree_skb_any(skb);
+			dev->stats.tx_dropped++;
+			return NETDEV_TX_OK;
+		}
 
 		lan966x_ifh_set_rew_op(ifh, LAN966X_SKB_CB(skb)->rew_op);
 		lan966x_ifh_set_oam_type(ifh, LAN966X_SKB_CB(skb)->pdu_type);
@@ -414,12 +418,12 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buff *skb,
 
 	spin_lock(&lan966x->tx_lock);
 	if (port->lan966x->fdma)
-		err = lan966x->ops->fdma_xmit(skb, ifh, dev);
+		ret = lan966x->ops->fdma_xmit(skb, ifh, dev);
 	else
-		err = lan966x_port_ifh_xmit(skb, ifh, dev);
+		ret = lan966x_port_ifh_xmit(skb, ifh, dev);
 	spin_unlock(&lan966x->tx_lock);
 
-	return err;
+	return ret;
 }
 
 static int lan966x_port_change_mtu(struct net_device *dev, int new_mtu)
-- 
2.56.1.708.g77570a6a1d-goog

