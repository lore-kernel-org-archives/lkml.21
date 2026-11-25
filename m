Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573618;
	b=3ol6/XWwGpTrpndEeTSrVyMC4hub1GRV3MpYGLZdRobFL05zl9NbmbQCZOQ9Yq3FXQhQ
	 MsEfxtK98aIDNMZNjujqxrPl1DxF4/sEF+9BbhLXOC79LsPyHsx6zHKjpw3rSXYjS5Mb2
	 KOykdWZHtdjPAt7PEdDnc+wzFGSRBlJPGtUgEKDOXAIC6vHT+rer2FbmstlFmiLM15Qoh
	 LBrzCAVc/7UvKZHt+DpUAR68l89piGzBqQoBxxejvbEYratuddKuR7qUfV2ATqwJQGgGj
	 uNN5oeaGVw0/ToU2FGeoQWnQgNlARlS+dysU4h7gUnz6QHEmUz9GKQtUeD75eUGeLCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nxEUfGG+ty5o7s1mxmsn/WqbaAcfsDPEfFvaxrj0uA4=;
	b=x6DoL+gLDppyOAinJAOnNinOZk5i/eL12ndJ5FmCtxwSB5HlQCfagPMN0koPaedfyyrW
	 KoM060ULbpSAhsG0zUkvLqrVJbLI0gNVyl0pZkBywTFtVac2MsO5D+4JkskkOQB80/2ww
	 KSeYs7f+ABgcjg1vKi50py+oHUoBLI66cYb1kBm5aoMVOfIuYxRS7cxPf63FE7mDFQhl5
	 iBdWDQ27Pz+o0P5is+kcTDFASECIYLEoay+7Q3dBUURs8OSspARVI0tbrSJ+sKg+TI96U
	 ZAUNskMy+pXRkOiGa5WS2tVqKcmLMfknH/QJ6pqhdo79/AJEPX7t+5YpWWn38PwaNMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mam+MHs5;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29583606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29583606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mam+MHs5
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55d2d380f6aso57721871cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573617; x=1796178417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxEUfGG+ty5o7s1mxmsn/WqbaAcfsDPEfFvaxrj0uA4=;
        b=mam+MHs5rNAX6gl67MTAXxCSp6YdeTtR4BXMQZ1d3TuSr4mxNtFPD0jpZ0qyo9AUYk
         9Chc2u7sIS9c2qxed+yeMr0gA+edtNgt2R/HKeurFfy3DpaG8HJTIilIDrubFf9Qi7Qz
         lUJKIbFiRz601Ax0i89VMTQCPa7bGjW0wxrfUtWisYsVsZjTM1HJTNXk7hAPozH1u/fJ
         Rw+nlzJ+GJ6HFzsvff1TYhrWOF7xoR4N2cpceW+oqj3Zz6ACQcDMFfKJuUboaCHJNWhK
         KfhxEMoM6YMjnyUQ7TCVaUHWHnI37JmWxoD6qvkS1RbDM2FwHg1szAfuk/2p8lZ/CS4l
         Xl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573617; x=1796178417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxEUfGG+ty5o7s1mxmsn/WqbaAcfsDPEfFvaxrj0uA4=;
        b=aBpjVy7D54Qm2apLyGEcryvQ1p/BYDfoPU27wsyh2gLnrhlOVHgvyN1m+S22bRK4Vl
         Y7Zr1ECTujD80iGiyup+pxExrW4DLbTbY8+Tf2iNrMA+yxMMzR65+/aduIUzZo6eM1XU
         UeWC8RMvIhQmC1RqXA4ZTYhm6db2S19akbGUA3Ptl8sfs0sprqslmYh2AmPAd0OtEKON
         EJIclWIHpOU+Pzm2s/abbC0GJ3LLZJMyPhOWTD/jFxMPvPiRoHfV7bzG/JCmf24cqYd8
         mTcgA2JLSBqGNdZK+hMM38GS8i5m29JNdp0GApx2nrraMYfBIqyGFSBkFV5NWlwB1DTO
         VOeQ==
X-Forwarded-Encrypted: i=1; AL+hErHdHpTjg7DWq8tZWhb+1keUnNmufvRV6IJDnhVABZpNg9tqqVCr1lpQe/010CBspC0DxzZSIk/yYJrQveY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i3ZRFUdumuZLytlhjOZmJ/84jXgyiAL4T4E6eUI9slQxgtlQT
	HnmsTs6WNr/uz+n3zOW1bI9jBbiR1UCOYS7+JpA5QtO8caYw+YTG9N4=
X-Gm-Gg: AZFdTZdnbfTD2W9j+KTE2iNGFw4zfxj3U34YHFYiv0227C76eYZB164ILgqB2PIszrZ
	d+bsr6n+bgt3CBGY3rYIgPabvcI71P6xFYonKJphgnmVvMfaRU7XevKiu4Ws/cTNVlBdxxwqR5V
	j2V9RVYza6C3/TFDJJyLmGv65Qx58sWsSMkRvC5m2igumw0kZ5mD8X2PnNrUw4qcXRCllqjinVU
	GVhsiSMeO13ndxL2vwnO6TJP1wVKcjEBE/ZDy5yyltlJRFylX/OE6WCYX+Fz4NJrzQIaqF5w/cR
	gCVRUwwDxW3QWOjfe8SFj/nWTTZ1j3EgPp55+RyT38F5W/fgsGb2piUN+IAuLnt0790w9EEZDR/
	iD28tQWuwbZxIh681xRGtDDZ1BnO/om0ODRpL3l7BKjj1ewQpmGeXvZ9HUhnL9pLns9h3rmaH3N
	h7VjVDIJlqSqdDAbM9dXM/niN9HsMnhex8KPJtPICPtunb7kRDrXFGp4z4+nwgm3JqpF5wO6tUo
	xanfIc0KwztQSa3LpTXfbE6Pgw8rsyj7bXpdi7i7RlEr/6mHVd1X4Zv9aQq6Jj9IT0fHDlg8JOI
	9Rpabuh+RYGP2qvTjfWBNvsTGHhD+StE8Eu19swB3sYW0K5DkA==
X-Received: by 2002:a05:622a:489b:b0:535:1a91:1d24 with SMTP id d75a77b69052e-55d76a203c3mr318792701cf.43.1795573617056;
        Tue, 24 Nov 2026 18:26:57 -0800 (PST)
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78807b5fsm141778231cf.6.2026.11.24.18.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:26:56 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: netdev@vger.kernel.org
Cc: hkallweit1@gmail.com,
	javen_xu@realsil.com.cn,
	nic_swsd@realtek.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] r8169: recheck the TX descriptor after a vector-map interrupt
Date: Tue, 24 Nov 2026 21:26:43 -0500
Message-ID: <20261125022643.1169045-1-montrealtango@gmail.com>
X-Mailer: git-send-email 2.53.0
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

With the vector-map interrupt model, the TX interrupt can arrive before
the descriptor write-back is visible to the CPU. rtl_tx() then stops at
a descriptor that still looks owned by the chip, and completed packets
stay unreaped until BQL stops the queue and the watchdog resets the
chip. The legacy handler is not affected because it reads IntrStatus
before polling.

If the first pending descriptor still looks owned, read a register,
which makes the write-back visible, and check it once more.

Fixes: 677f8f8c4c5f ("r8169: add support for new interrupt mapping")
Signed-off-by: Vlad Banea <montrealtango@gmail.com>
---

Notes:
    Javen Xu confirmed that the RTL8127A, the chip upstream uses this
    interrupt model for, is affected:
    https://lore.kernel.org/netdev/d672fb6d16b04fb4a1c9b3202d276662@realsil.com.cn/
    
    This was patch 1 of the RTL8125B RSS RFC; the rest follows for net-next.
    Since the RFC, the second read is a continue instead of a repeated read.
    RFC: https://lore.kernel.org/netdev/20261111220114.3863505-1-montrealtango@gmail.com/

 drivers/net/ethernet/realtek/r8169_main.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index f151ab681393..76b96f31017d 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -5228,6 +5228,7 @@ static void rtl_tx(struct net_device *dev, struct rtl8169_private *tp,
 		   int budget)
 {
 	unsigned int dirty_tx, bytes_compl = 0, pkts_compl = 0;
+	bool recheck = tp->irq_nvecs > 1;
 	struct sk_buff *skb;
 
 	dirty_tx = tp->dirty_tx;
@@ -5237,8 +5238,17 @@ static void rtl_tx(struct net_device *dev, struct rtl8169_private *tp,
 		u32 status;
 
 		status = le32_to_cpu(READ_ONCE(tp->TxDescArray[entry].opts1));
-		if (status & DescOwn)
-			break;
+		if (status & DescOwn) {
+			/* The vector-map TX interrupt can arrive before the
+			 * descriptor write-back is visible. A register read
+			 * makes it visible; look once more.
+			 */
+			if (!recheck)
+				break;
+			recheck = false;
+			RTL_R8(tp, IMR_CLEAR_VEC_MAP_REG);
+			continue;
+		}
 
 		skb = tp->tx_skb[entry].skb;
 		rtl8169_unmap_tx_skb(tp, entry);

base-commit: 846a6d0982be30aaba5268aac14a0c557d70cc23
-- 
2.53.0

