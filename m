Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644937;
	b=CPpNsh57qjf2pLuTigh+SjOSUIS19Cv099TlA1m/oLt1rCOz+aO6R8AItgR1SE+muFPF
	 HwQhalZRDx/ICVDJQcQbiKD7moCSuuF3MmzPqp1TmDKPCbjFGCfBobU2DOoyC/qk0Dpsx
	 uttNB8TCojN86i/UkKcxIfd8zOus0ZCZhaF8gs9Mei6j1y84drJTIFpNuOjL6ExK0l22F
	 vKlLLYRZmVFVo/Tsw5b3ANnNEmkI8wD7LwIcLIA+u6ziyMHzSnIIAzX1q+Ad4Cyze9wTn
	 oI41uLlUH9RFo4y2FABlOBHowIoPh1VUViv+Hc/gNqUAF7FrywRVETdR1feAlyOXdHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HoLpNZUPpAV0s/IN4AE3BuQqpTSM/yM+54mb7fzDFTw=;
	b=tuJQsh30snF+AF7oxR415adERdZBOUfKIu8nJLwbsX/o9JDXFdkvLpypaoGNSuBVhJkH
	 7jen5sEyNz7SpEHThkQ99f7DuS+TdpP+qzFrl4aNkRmpTZPmAZ7bCuqdHTf9Wes2eqxy6
	 UGmUmblHsvAIf1qs2hUX/7/L3a7jHcfxp9K4A3bht58A1Txs8bW9r9b4hNy9TKInLWiuQ
	 HAOCMVflyiGNWFY2urAp6d09+KTqzQDLTx8+f89t6dwUD38ZkN2Y40738U04hqRCtPSie
	 dzVM2vC+Mq7RBrV7t2HT3mTwJmdrswZ7WLOZ8ibH1klPADiLQTkL5kAWfFAqcJHSo5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="eQN/XD6H";
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02C3606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C02C3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eQN/XD6H
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso10341124eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795644936; x=1796249736; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HoLpNZUPpAV0s/IN4AE3BuQqpTSM/yM+54mb7fzDFTw=;
        b=eQN/XD6Hq8wMXIj1ecSVa1boHANg4KhmxmXSv42V30BijwxyKn9dP/cEnIHUx72yJm
         mi66UrhqpqZGm7vA85JDOFVORQL5WAPpi4T0DPthelVppjHBX0ZnnD6BL8QR+u76L+Jv
         mbpQmftPDARFAYpQDVayDuhbYa2gYjTLWuT3yCsw6i59uREfA5iajifhdYLcz6hApWm7
         nbTvmDaVO94Mvqwyp/pEXzyTpceH9Gbog0Mr3ytJahErNL2HwY/aA00EmtYxkE4Ev+4u
         TOJY0DqP+dQTbHeAlJ0in894XvDmVMA6Twnr6Q+EwGfk50WQ4zk3hAWNtneRFdvFO0ND
         +VTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795644936; x=1796249736;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HoLpNZUPpAV0s/IN4AE3BuQqpTSM/yM+54mb7fzDFTw=;
        b=iP4Ff+1loTvWYE7VMYbBQQuSMTEqN0ZCc48KvJWJmYkq39ucxy9E7eTjQyt/EBGa6+
         IRFBmcn3pzgQarswSKPSKykQI6fMVuMO9+osiwZC1Z4pSu9sL6ILSrJ/O+676PuQzABC
         HGr/rHv0ZlXF7/gPUCDSz0+o4NjDZS9sNK85iIFSRBBeLIyMQUwKg2x6mbvFcDL5eWS/
         YkXGbwOvtK9Bu43IOmFawc6/Syd/J/cILTsxD3re7VXhBapwXAHszdj8zCGQVnTBxJpA
         OpE0LO244Ifa4hG/3gwBzj65IPx/vtPLFsCem6VIhvJGdr6SE2riooMaIOfzoj5RKSZh
         AEcA==
X-Forwarded-Encrypted: i=1; AL+hErGq2xFz3xOlxoLKAgnAFREqIyt7R7Igb82MDvxiq8Zwkk8CvOV9oeYOTJCjQXtSLdJzvWQ08gzgeRMVX0I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ubCPSrNzVkZLtRhprElt7WcDJqFfTyu/npv64AW+wSZzF1zC3
	rSnsiLW+c0Q5MX4YjbFPWHnp40TtZeuShAl9MZeOy4XHhG+VmlD3Nba7RuNH3QSsNwXs3TpogKV
	0Yw==
X-Received: from dybqf1.prod.google.com ([2002:a05:7301:6481:b0:386:a9a2:8031])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:4143:10b0:36a:1f4f:3e9
 with SMTP id 5a478bee46e88-386b1067bf5mr12106547eec.20.1795644935493; Wed, 25
 Nov 2026 14:15:35 -0800 (PST)
Date: Wed, 25 Nov 2026 22:13:22 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221322.1412935-1-elkin@google.com>
Subject: [PATCH wireless] wifi: mt76: mt7925: fix UAF and skb leak in mt7925_mcu_rx_event()
From: Elkin Cruz <elkin@google.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

mt7925_mcu_rx_event() caches rxd = (struct mt7925_mcu_rxd *)skb->data
before calling skb_linearize(skb). When skb is non-linear,
skb_linearize() reallocates skb->head via pskb_expand_head() and frees
the old packet buffer, leaving rxd dangling into freed memory when
rxd->option is subsequently dereferenced.

In addition, mt7925_queue_rx_skb() transfers full ownership of skb to
mt7925_mcu_rx_event(), so returning directly when skb_linearize() fails
leaks skb.

Free skb on skb_linearize() failure and assign rxd from skb->data only
after skb_linearize() succeeds, matching sibling mt7921_mcu_rx_event()
after commit 4361f1660101 ("wifi: mt76: mt7921: fix memory leak when
skb_linearize fails in mcu rx event").

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index bfc1660d1c6f..42af38941aed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -715,10 +715,14 @@ mt7925_mcu_uni_rx_unsolicited_event(struct mt792x_dev *dev,
 
 void mt7925_mcu_rx_event(struct mt792x_dev *dev, struct sk_buff *skb)
 {
-	struct mt7925_mcu_rxd *rxd = (struct mt7925_mcu_rxd *)skb->data;
+	struct mt7925_mcu_rxd *rxd;
 
-	if (skb_linearize(skb))
+	if (skb_linearize(skb)) {
+		dev_kfree_skb(skb);
 		return;
+	}
+
+	rxd = (struct mt7925_mcu_rxd *)skb->data;
 
 	if (rxd->option & MCU_UNI_CMD_UNSOLICITED_EVENT) {
 		mt7925_mcu_uni_rx_unsolicited_event(dev, skb);
-- 
2.56.1.839.g22a8290db9-goog

