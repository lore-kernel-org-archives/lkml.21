Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095681;
	b=aPWhHnYBWA/OmhsXmpP0O00B+wIopKJom3/S2rOc9hBLDaiKNUGmJa9mtYN7dkeIczh5
	 qz/abAyRV2oYHvEKW2VhECDVvvhs0tKpmN5fV0BUqzf4G/1HsJSzTq6iVdcTsRAhcf7SI
	 XVJHoPMJ6K8ziSpBDdYAG+WVddeCp3yMPUmopOZuJCErsmbXdl4FtWJxkPIbow88Z3rli
	 raICjJmUKAyLdpObzXvMW4VbR1RHyVjIry9mx3+JSpNOakPYBCT5xupiYHGcGHQaSVYrN
	 crt3SAPSo9NnQfIeDN38zrdqPeRmjmEN3nPPMezof2lh6+NphrONGjumqhHmSXfspHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=epsMv7ubUMbNGL97hoQb0bSNJhUxNTty6N7abdxd6yc=;
	b=k7P7SJNyvKejOSfIdWIijLhgUYB+1FQQho/eoLRwSjRe6Tr7XesYfbX/Xxap7hu8940n
	 X39iC7qBJ4hIITqvrFb8vg2QNz7kYc5ETs/kJIlE1jCjzuFRPVqWz32ODAuzhSJRH62MY
	 1MFKrMCLjDtHaScbLr3rYWUqUIzrxaAdLw7OFk30ZLGinKZTETFtctoirKTdU9lM4uJ2h
	 ZcRWIb8FFbDHAVOrGr0ZlLT/yEEJ0kEMqxI9PuqdggmdObCTF+1eWoGfo/uG8EgaKp1gr
	 gmY6RXVDQMxsQRkgOls8+IKngFCVSUH3dSUwiBQKTI6xrC3VKUPBLTzd0rlbxVGeOQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oseP62wl;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383F7606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 383F7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oseP62wl
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c511c0e2826so208544666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095679; x=1795700479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epsMv7ubUMbNGL97hoQb0bSNJhUxNTty6N7abdxd6yc=;
        b=oseP62wlfKUASQ8EyQShWBDIsidX8ySxDvtbL+MsM1me9ZPWI8DKGmkmvKKnYIy0OH
         8zJ7TiMF1ucvWVZEmY6QKtl3/s6o+j+Wv7AGyvRkB+62cEDMysGtmHwzk44UYThpU9Zp
         D47Ai7AJ4yNpY6cNvahucMpRHj8vLRZeNsyAbXyxRkuoXRQifA+hwW1GIQ7C3US3tJ3c
         Cl6Lhb1yvkSC5g8HGZj1bcOC0EbYF+eztpeh/zBylf1uZqDuNpfBV/cc3maJhyhsbPtp
         mcE/FhZlA6n/u/5fW9sKBPDGqVDiSditLdMRuu0GX3XwPFyXDszNXeBpAtEl6+928Zxb
         dXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095679; x=1795700479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=epsMv7ubUMbNGL97hoQb0bSNJhUxNTty6N7abdxd6yc=;
        b=RfR8LfzQSunUS3bj+kEL4a4G1sWACld7EW/tVe19KMpsf6ZiK6GlTFaKSpxhqAEsVx
         TEmYBz4crOQPNPM/NMKDoBKvGUL5jpWbKarm+jFHEd0+U7zIzLyLvdfqpxdYD9gtywbI
         EVXTrJ5atEalOdpXASFeOvyZ6dJBwjC40HQmCMxnyhjpfSC9daYWxmoK8YarT0W9kZ/w
         xq/OivF7aITT4OrjarMS5R2LJNMkwWit7bmXtXjG2snW23NyecRLNZEfoOaK6wQ8jujF
         Hh0PPPqcSAcMf02FjV58DZ7yjTPKSYdwQQOZaZpdAitgT0JGwqM/gRxznrO6Xt0MjJHV
         dYDw==
X-Forwarded-Encrypted: i=1; AL+hErFNZjZeUdZHEQjLhaehcPkG17nZH31ePAFsTUlVmyXQm2Ax4kfpRCrGm9qfetytdslK8BET8IMYmgU1ALg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tR97o5rtGxf7LhNh0wb9l3D7GXOoFqMhFHA/VNWCdQkluCnlZ
	7LqvES7Yw5pj6epjiQx+cMBOCTPmPoLnCvS7IJcaFdSbnuGNURpE5FaS
X-Gm-Gg: AYBFou1uN8yU2Lpf/NzYGC17g/AJ4UKjhh+YQQpHMkk0/WqWjRZPKC/yEYZrKpL/QsI
	tRuJCOlVfx/knRc37jk+wwjXJyKZdZvnQRFu1NXEpoTHM8RHv21WmLfFcnvlIhKdD0c6lfMm9nD
	5T66kjLtDpeNh2y4vRmTjAUAl1rKdMw5zM4v93/UjCvZZqCMhFPtkh2AWtfSNTGQLqmOs4hNVpM
	oHUlgOstUfG3h8T5KfY7O0a+aXz+AQkKvBcDYyOzSuIUwRZNrVIzT0yTyKYm0qC2ypdC55va1XL
	flNy1wkL/yrQaE9fcQoIGp/3pPvnKvDxE+MOpdhj/VC6f8m6jiZxkOGhrhs8ktDd9ESqh1qsmwT
	yp09wCHx6fI8M0ewZS194g0vKP0iI6FYHz4DP+YJN3z/baSJqIF8fnRAT4T4qhVP7enN89XQMz0
	BEcNAkUQ1mX8GpLXy7xrCYfmEiGG6hLwziK1ZA4e7JkB+Z5P38O3vM+/0/+up08tCMZ4kUlWKzr
	r/I2EC5fsFL3XlEuJac6tRySoOrvnkX1GWtnRkU5vQLh+oPUScjaS8wu8gMoA+K9yzh9HdHtELj
	k0yq1eU8cXitSdslGYUjTSU2EZ98yRZ6z0VcMEMk+sFyNSxeo8DawgtjZXt/A+J4e851My9ZzgK
	1C06comvFArJ7JQ==
X-Received: by 2002:a17:907:c8c8:b0:c49:cf3a:a324 with SMTP id a640c23a62f3a-c510e148c36mr562345166b.22.1795095679437;
        Thu, 19 Nov 2026 05:41:19 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-31-175-182-49.play-internet.pl. [31.175.182.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c512346fc3fsm105582666b.59.2026.11.19.05.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:41:18 -0800 (PST)
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
Subject: [PATCH net-next v4 4/4] net: dsa: qca8k: bound the data of a management ack frame
Date: Thu, 19 Nov 2026 14:41:10 +0100
Message-ID: <20261119134110.15048-5-kuncy7@gmail.com>
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

qca8k_rw_reg_ack_handler() answers a management read by copying the
data that follows the Ethernet header into mgmt_eth_data->data. It
trusts the frame for both the length and the layout: the length field
of the frame allows up to 32 bytes while the buffer holds 16, so a
frame announcing more than three registers writes past the buffer into
the fields that follow it in qca8k_priv; and qca_tag_rcv() made only
the 2 byte tag linear, so the copy reads skb->data without checking
that the frame has the bytes it announces. The handler runs for every
ack frame, whatever its sequence number.

Size the buffer to what a management frame can carry, and pull the
announced data into the linear area before reading it. The pull can
move the head, so take the Ethernet header again after it. A frame
that is too short is left unacknowledged, so the read fails and the
caller falls back to MDIO.

An LLM assistant (Claude, claude-fable-5-1 and claude-opus-5-5) helped
write the change and this description; I reviewed both and built them
with W=1 on arm64. The management path was exercised on a QCA8337
behind an IPQ5018 (GL.iNet GL-B3000) with tag_qca.

Fixes: 90386223f44e ("net: dsa: qca8k: add support for larger read/write size with mgmt Ethernet")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 24 +++++++++++++++++++-----
 drivers/net/dsa/qca/qca8k.h      |  3 ++-
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 76c0f7c97b..9a7e90f48d 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -170,6 +170,7 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
 	struct qca8k_mgmt_eth_data *mgmt_eth_data;
 	struct qca8k_priv *priv = ds->priv;
 	struct qca_mgmt_ethhdr *mgmt_ethhdr;
+	int data_len = 0;
 	u32 command;
 	u8 len, cmd;
 	int i;
@@ -190,6 +191,20 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
 	/* We can ignore odd value, we always round up them in the alloc function. */
 	len *= sizeof(u16);
 
+	if (cmd == MDIO_READ && len > QCA_HDR_MGMT_DATA1_LEN)
+		data_len = min_t(int, QCA_HDR_MGMT_DATA2_LEN,
+				 len - QCA_HDR_MGMT_DATA1_LEN);
+
+	/* The tagger made only the tag linear. Leave a frame that is too
+	 * short for the data it announces unacknowledged: the read fails
+	 * and the caller falls back to MDIO.
+	 */
+	if (data_len && !pskb_may_pull(skb, data_len))
+		goto complete;
+
+	/* pskb_may_pull() may have moved the head */
+	mgmt_ethhdr = (struct qca_mgmt_ethhdr *)skb_mac_header(skb);
+
 	/* Make sure the seq match the requested packet */
 	if (get_unaligned_le32(&mgmt_ethhdr->seq) == mgmt_eth_data->seq)
 		mgmt_eth_data->ack = true;
@@ -199,13 +214,11 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
 
 		*val = get_unaligned_le32(&mgmt_ethhdr->mdio_data);
 
-		/* Get the rest of the 12 byte of data.
-		 * The read/write function will extract the requested data.
+		/* Get the rest of the data.
+		 * The read function extracts what it asked for.
 		 */
-		if (len > QCA_HDR_MGMT_DATA1_LEN) {
+		if (data_len) {
 			__le32 *data2 = (__le32 *)skb->data;
-			int data_len = min_t(int, QCA_HDR_MGMT_DATA2_LEN,
-					     len - QCA_HDR_MGMT_DATA1_LEN);
 
 			val++;
 
@@ -217,6 +230,7 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
 		}
 	}
 
+complete:
 	complete(&mgmt_eth_data->rw_done);
 }
 
diff --git a/drivers/net/dsa/qca/qca8k.h b/drivers/net/dsa/qca/qca8k.h
index 79754755f1..b7aa0d832e 100644
--- a/drivers/net/dsa/qca/qca8k.h
+++ b/drivers/net/dsa/qca/qca8k.h
@@ -396,7 +396,8 @@ struct qca8k_mgmt_eth_data {
 	struct mutex mutex; /* Enforce one mdio read/write at time */
 	bool ack;
 	u32 seq;
-	u32 data[4];
+	/* The data a management frame can carry */
+	u32 data[(QCA_HDR_MGMT_DATA1_LEN + QCA_HDR_MGMT_DATA2_LEN) / sizeof(u32)];
 };
 
 struct qca8k_mib_eth_data {
-- 
2.43.0

