Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795868773;
	b=p2b97Y3BGRvlj0S/tZZ9IvTX9ImQvgf6kw+UHt2NPveJw10klFcXy4ZnPfHEbhF9XED4
	 VM2jH+p0z06o90Lye1uEx9XkY11EVl3WLHbacUcQyR/++kmteQ70CphlrNkjsK03rnLls
	 ii7skFzspfM+p4831TiauWQ+r1xTcPj6qzoEyra6U1i7stEjXr2mc8ZJW5DglKzm18nzT
	 Ilc+2hF8pS4YgbWLo3t10u0Ke6RMgsBz1460jRwwbHPJz/89cF/VyurqrvbtJCrWoF0u0
	 LQzGcXLeClwnwbVJjaUv3kPD5N4NuicnMnPYUbJxgglu165jrIvCG+bNAsC5Y2CNGGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yom6P11rX/hdhy2NNJS3Jns2I9Z56P2y3ixdK/nEUpo=;
	b=VIDjSOQgyiYZUrpzosrUO3vvuJT43CzAzlrwPjqBrhPzbbLHTrBrI6i9H8a1wpXze/hL
	 rMa2l4cru0xUqUL8yStosdlOwB22+CYzckBxnISOvruMahGfbBwN2BfeeJ6m/+95V/M6T
	 vg1ym8QeN0d+M1dn/20JVl5+DozY7yy9lUjoHhOY5CD2Gy9t9cKRdck366oRRIJ+RoQl+
	 yo1dmGMC24txR5YiNPNHTg4giD21yn/FV5a9FHNHdBfeSgRd48ObX6erwurCLW2zfKcJY
	 abXGZ5qqoEKRnUOCO1tIWIrtQKJPDp+ONeXXsyNmSQLESJmN/wo08tml3NQSAeh+HDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPyhgWPk;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B15606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 12:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2B15606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPyhgWPk
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so80631355e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 04:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795868771; x=1796473571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yom6P11rX/hdhy2NNJS3Jns2I9Z56P2y3ixdK/nEUpo=;
        b=kPyhgWPkQ9sTZ0JH8L52QCk3CAnZz5sDwQCkRQfALxoNdwNlp/gsg4yFcghQbnkUbK
         88T1vD6mrTf9EbBwnFYG09Bmd1OQPCulXwk21zxxgdmVN/xdOhWGAFWOkj0s3xw4IHYQ
         2vgQITeMx8AVuK2aK5W631ktNZ4vplqZGJCCNq+eHYnv62/gNRmy0bqOISUuPaeBg7Qq
         e5s3kHdD/oghWLYBddYpgplHkr9hIJT6wgZtOvQNx8BtxduMpIxXJn/tlJ9LowSVVAKd
         uRQAGU3vie2nKgdSOo9LGD1oRPSD1keHg4P48hJ7NWQ7K096n0h9ah+EMGmosG4MKOlL
         mURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795868771; x=1796473571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yom6P11rX/hdhy2NNJS3Jns2I9Z56P2y3ixdK/nEUpo=;
        b=b1SZ6NT58RXWx/beyVnGOulDCh9X0Kj6B9I4UDCL5gztfQh+WeBQof1cNkyEFhHHA2
         DCS8t0H6iGTC4yCRWXXRzG0OqUngiwlHs3k+gsa8+X9IvwRk4b7I0jXYQ4XdpMDDVCpD
         pT4Pam1cl9/55+2k6OgUn5P87ZvBym7OCjmYsh8svU2J7PTCfKv3XNcHBHdqUNE+NE1Q
         14wu523iigvyIjf20Z4Ztf3iyq261c5M0ybVmmATxHV1KnAXgphTgsPa+ny3yOaK3zBs
         MYPkVTrwuelhjT7Ypb9TaKtD0B74drRPmg71EBGO+B2VCLFxXGUBnVHPv4YAGlc9dMYF
         wUjA==
X-Forwarded-Encrypted: i=1; AL+hErFL7ORZJ/bJkmllIWc1n6tFp8GU2bgrKwPJ48R4MB8TQ98Tw/UoVF5/IkJDYn5fOFrYlkHuToZh3hKtwAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kA72LpsX/ebJD63yMQI40HcjFYbTdavYFcnJ/BvGPky0XSoea
	cGoHtNulOo1grycjLLqTM3+6OBI3iSJtuJdupB0JR4/s3Fdsl5b4yypH
X-Gm-Gg: AZFdTZdEWV7ZCvb120fSCyn8c2yC7y1LaL4Mc7IuxPXWuLoTF/P8t7nNt4fkEfSq8Pv
	jglrfRHXG38dQRfI1fbaT8CUci1q62xY+IP2OdjMYqt9KdHk6vvHt0yic2X6KgNNvJggff2IqNn
	kjoqNqpHtKDaMUsznrmgX6gGu+THFUSe94d6UGSN9XYeHviwxhxRWeHLbjys4Kxitgt4gnncl3Q
	c7Dm+peFb19D/C961HV+uAN57T2VMzFcI4pzUypK65L2rKw0bD/2gneu17SrUuR8wYcAnC7SAeH
	LsNX9xfn3tkuGJxeccYW2sYn84DCznH4I739imu9bsEVhY62gFSNDJfZo3mz1REJMNEab/svleJ
	JIXZZxYA5JTsgbPo9hr9+8wyKgkk2M6Y//iKCJ/SQR1/2dUdcEp+dcSPHD++3JB+e5nmZXxGbT2
	b3tWu8ciDt6PTcwfxwCJZWPVZOBKnp/2M7zFnPeSSqOa+MHQ+PE48LP6292t0y2c6bZAerc50tw
	imsdlDsduX0X7pEfgNarv+A26/0dtREeS1BaN3gMe8IdKb4vhvOBtq1SerSnA4LVL6Bt4Rak6Lr
	IwUcJhlFZS6WSNcXikhKQJ3YgXqrD8z+5ndo5OZSqscsQkQ0wDau2D5vLOsdpORwauy8IQLWkA=
	=
X-Received: by 2002:a05:600c:8210:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb88786c81mr553027325e9.0.1795868770988;
        Sat, 28 Nov 2026 04:26:10 -0800 (PST)
Received: from kidala-computer.. (ip-109-41-112-86.web.vodafone.de. [109.41.112.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm502815995e9.2.2026.11.28.04.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 04:26:09 -0800 (PST)
From: Oleh Shcherba <scherbaoleg4@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Oleh Shcherba <scherbaoleg4@gmail.com>
Subject: [PATCH] wifi: mt76: do not mask negative MCU command ids
Date: Sat, 28 Nov 2026 13:25:41 +0100
Message-ID: <20261128122541.6670-1-scherbaoleg4@gmail.com>
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

Commit 1ffc90633ad6 ("wifi: mt76: mark an MCU command that only reads")
clears BIT(30) of every command id before it reaches the driver. mt7603
sends its legacy commands as negative ids, and a small negative int has
bit 30 set by its sign. Clearing it turns -MCU_CMD_FW_SCATTER (0xffffff12)
into 0xbfffff12, so mt7603_mcu_skb_send_msg() no longer matches it and
queues the firmware image to MCU_PORT_QUEUE instead of MCU_PORT_QUEUE_FW.
The firmware never starts and probe fails:

  mt76_wmac 10300000.wmac: Timeout waiting for firmware to initialize
  mt76_wmac 10300000.wmac: probe with driver mt76_wmac failed with error -5

Only handle the READ flag of non-negative command ids.

Fixes: 1ffc90633ad6 ("wifi: mt76: mark an MCU command that only reads")
Signed-off-by: Oleh Shcherba <scherbaoleg4@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mcu.c  | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt76.h | 6 ++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index 4f3471b..4dc287e 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -59,7 +59,7 @@ int mt76_mcu_send_and_get_msg(struct mt76_dev *dev, int cmd, const void *data,
 	struct sk_buff *skb;
 
 	if (dev->mcu_ops->mcu_send_msg)
-		return dev->mcu_ops->mcu_send_msg(dev, cmd & ~MT76_MCU_CMD_READ,
+		return dev->mcu_ops->mcu_send_msg(dev, mt76_mcu_cmd_strip(cmd),
 						  data, len, wait_resp);
 
 	skb = mt76_mcu_msg_alloc(dev, data, len);
@@ -74,14 +74,14 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 				  int cmd, bool wait_resp,
 				  struct sk_buff **ret_skb)
 {
-	bool read = cmd & MT76_MCU_CMD_READ;
+	bool read = cmd >= 0 && (cmd & MT76_MCU_CMD_READ);
 	unsigned int retry = 0;
 	struct sk_buff *orig_skb = NULL;
 	unsigned long expires;
 	bool lost = false;
 	int ret, seq;
 
-	cmd &= ~MT76_MCU_CMD_READ;
+	cmd = mt76_mcu_cmd_strip(cmd);
 
 	if (ret_skb)
 		*ret_skb = NULL;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index d635df2..237057c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -272,6 +272,12 @@ struct mt76_queue {
  */
 #define MT76_MCU_CMD_READ	BIT(30)
 
+/* mt7603 uses negative command ids, do not mask them */
+static inline int mt76_mcu_cmd_strip(int cmd)
+{
+	return cmd < 0 ? cmd : cmd & ~MT76_MCU_CMD_READ;
+}
+
 struct mt76_mcu_ops {
 	unsigned int max_retry;
 	u32 headroom;
-- 
2.43.0

