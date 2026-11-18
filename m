Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998476;
	b=XjkB1Q6QtzOm+8N0RkvrB1l2ukNaTGxUnp1E4vaKHcZvBoXR71i7CDy9ISItCNLhlQg1
	 R9Muta5VqmTpULj8YgxxgVBiFhxKy2hQrAdpL5fvC3VTubZGJ1xVzjgIS854oZ9rX7BF1
	 Ke+B1xQmMOCl/T+ZsdVoFtedVxkGyfIK53x80+Zo9Cvykx9/su9NGuxa9xP2g7sMZyGJX
	 c2hDVOhQ02aIIxznTmVbGZ8RKNlYJ3mOPmhJKAd6wcEZDIm1RF+VyyQhDg6jYLKKPql1n
	 CT5+2pvplR2ZAM5LVc8Pb7/cWoGqpWPQ2Yu/cXPVslJ6utgXaUkQhTw8i0uJUzR959w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=01DBsGBZa1VYYjKfFfNmmb/bgs6SOiz9S6VzXEyzx0k=;
	b=zuvT/TydecG3TXfUaWiBYVkkpSFnD8oLT0oRbJ5VWbgI07eZfg58u1EPDKJoflr7YvVo
	 z7J8wLVlFS76Dc306ZAER/yY88pa0IDZLfUMd9PwPuKQwsnFKPOJ/oe7sc8jW7XlsZlc/
	 MMXOkhftUMr/YS5LgWABXDWOzLPzZNq6ZrY1j8zWohmzgTY/D9LniP1Ekfq/Ys2rp0Qfv
	 k7fzzARN9ahTSTYpj+nLySPViBpcD6kIuubib/ZAmKFpSmjdAgwy4aYR7jiSpaNZPvBhE
	 wbvQDAVUrjcFvrtQfsDZGffNL/vOwvCBSJVw9Nf0SbA8Q87UZXr36ZiWJP2Gaewyw9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="i5aog/b1";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D34760A262E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D34760A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i5aog/b1
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f0a1b685so526899f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998473; x=1795603273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01DBsGBZa1VYYjKfFfNmmb/bgs6SOiz9S6VzXEyzx0k=;
        b=i5aog/b1DiiziDmBI1wQWH4FbeyiZghU5cavMqPm0LrleZxya0Ybfs6QgKOF+6g4fG
         5ofQ4k/AhH3sJGDYtIEMHNZ62lVjRU/uR5sXqTW1pb2eRwA3MY0eg1wBEn/cD8s6NFj7
         mjnY6T2n7M7/+Gjy+xODf2cGw5aiW+Z1Rhq3XzmkqN7KZj9ZCNQf5CVhoDchsXGf64KZ
         ciFKJ/R0z+flN6nwsc/aUHBEWWvKFFoplUH+lAflfY/l51+TGG8zYNrRpeJBhh8jMTkh
         YZd2saFXFUj1LBJoTIdW1xDKPvhGmT8U57DaICsHFv5CGPEtgwv54PIUkSvYjAid9uN4
         EzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998473; x=1795603273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=01DBsGBZa1VYYjKfFfNmmb/bgs6SOiz9S6VzXEyzx0k=;
        b=ox2u5Hh6OISUqkMqgF6vfuEhuMKgBj3nqxxb3YfJ0iUYUjjnhmznoHr+5WaO/Lu9WA
         mmC4NyE7qx2w/nNEbZ/OFgLnFgvPJvgQ6utRxy9gb7OIB7piRtOuTlaEwD+EkmBxwW0Z
         HhohNorQsaEKPQHygHldltbrViQjPP1FTfhzL16wx82TFIgmlyGP9yYtJDCkJOhClMGl
         2Jf6y/Bxj05MewqMmeFbK63WvbfUJr+UwtSNmDOFHZ8XqB5M6v7+fjxB2yWq4+FriL/z
         tOHZF6OdD7ry0NUA9bNxLotC71eSx3V8uFAHm3mXBn1+N0VgOVSxbOS5mAzKUyWC1uXi
         BQzw==
X-Forwarded-Encrypted: i=1; AL+hErGq3D31mNSxTfK9NPTSZBWvqdlc6FpiMeBmF8xSDelm66d6Rq+I+AuKAjXpXZB+Rnr2ld79Vow7FpRDo8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ThpT8u/AmzN7U2FZ2nKeUDafKN8b25PaXtWRE7R+0KbFijeQf
	8jz41zotuWrEnSjap2PcDyEArKwv8Kj4guNobWIMx+N1/aZmOJfIapE3
X-Gm-Gg: AZFdTZdmQQqYX25z+Hri2XYXL3jMNcxg9PwHjkBbyO2QUuTGFcpU171hPWLOnZEDFfI
	ZY8DNs+MbvEmHcyhMqYLP437vVogvmw0KJUINZ0zgqhJZKgaEjNghFfqJNmprRM9K/IYoUt7IIH
	snNMJO0CxhtZ/fZLPXEBme3Zmiz0T+maXY+JfxXg6Jo7QFYQzbCWRypR2IRRc462hJ/os29Epuo
	EhTeAmu/ZN3lv39c5AYgGw/q6Jd+4AYxjngSzeel91Z6sf3rKcFb/6yAxYNM4XSSzxKbq8E3j+6
	8FaQVqn1fupeNcKcTktFpGmTiYowg2EwD8FN083XOf8+NZlc16zZUqzcDauZeuF10XX+BeL15dB
	8XfgSgUpyyImlevJdGdiE1dfQGHfz8//0X2i9prK6/PPn89+KkBX4/7bK/BhSfgQSOBkX5V4rs2
	l8qFPA4xIrm4ZQSRIs/6O1aLgjxaZtrEboNlXq3ApJXB/JyHH2SjhQfIVDrslvDSqcdu5jiIgNn
	3YfXbpt1AQIR86c61xIMyd6xlu22v+/9GEOMXlDEn2h+l5/C6pgQlJ7LUdTTSpIHVxcVziMapd1
	NPlGJAZb1jQKvKFkTvOrn8khO9d4YtXNLaZyTNyMhNhwtIeyEjiLX2r9qNha7OswcTgjSQOKLxp
	SgHF/UKbiNSWCdg==
X-Received: by 2002:a05:6000:2f85:b0:491:92e5:b5c2 with SMTP id ffacd0b85a97d-4a63947578dmr5156475f8f.15.1794998473400;
        Wed, 18 Nov 2026 02:41:13 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-46-112-114-48.play-internet.pl. [46.112.114.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm4320525f8f.56.2026.11.18.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:41:12 -0800 (PST)
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
Subject: [PATCH net-next v3 4/4] net: dsa: qca8k: bound the data of a management ack frame
Date: Wed, 18 Nov 2026 11:41:04 +0100
Message-ID: <20261118104104.26684-5-kuncy7@gmail.com>
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
announced data into the linear area before reading it. A frame that
is too short is left unacknowledged, so the read fails and the caller
falls back to MDIO.

An LLM assistant (Claude, claude-fable-5-1) helped write the change
and this description; I reviewed both and built them with W=1 on
arm64. The management path was exercised on a QCA8337 behind an
IPQ5018 (GL.iNet GL-B3000) with tag_qca.

Fixes: 90386223f44e ("net: dsa: qca8k: add support for larger read/write size with mgmt Ethernet")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 21 ++++++++++++++++-----
 drivers/net/dsa/qca/qca8k.h      |  3 ++-
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 76c0f7c97b..cd3569902f 100644
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
@@ -190,6 +191,17 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
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
 	/* Make sure the seq match the requested packet */
 	if (get_unaligned_le32(&mgmt_ethhdr->seq) == mgmt_eth_data->seq)
 		mgmt_eth_data->ack = true;
@@ -199,13 +211,11 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
 
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
 
@@ -217,6 +227,7 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
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

