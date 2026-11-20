Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174303;
	b=xVLd3VNhjQZx9Lg+zmXug00nikjNohvDNH0NpoX94MohJ+WF37mwZsQh0BX+71D2Wnft
	 RBHVblOPjENWikjowFxkWnhtg0IJa6LuNMiIzjX/LeExpGOE3Vu35un1OvaG7H0AcJ/2X
	 xH1WGcdXkyoQ69IAFKaEAF2UkSdW9/dV3psZzmKmuT1MXeHHo7rrAYziL4bZfwekiqTzJ
	 414GkzKgUuN1ON3mwM1+zr/zxn3c+CsbsGXNYA1OOk8s65BGn9jQovvJ1KENTuudYx9y8
	 egZtbQ2hKo4Z7RImf2zcau+DBIg8xAOEAPhiQKG+sLX8e8Z9djjADn0IrJvNsCx7E8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r/Zl64b5uRZMFqhO7EABjxKJLKRPSycq38m/Nb5ViAw=;
	b=3SRmu4OTxmzX4w7Ff7Q16RSEZZPW1K8A90++I9WB7BZRVlKpFCoRmV6keV0J4FtUc0C9
	 WpifEMJjeQez8NEGO3/rknt42Gw6lng3Dt7M9eHDHQSpmuPIgPYqA4NaXUb/FFh/mHhOt
	 Zd47fyYWvcqVlNqhE2/t9x9Z3ORsfld1F1h0Zhq7zigVMNeJezYTZdSTRa0FF4kxkXtSQ
	 s86IkbaC3f5U13dock8yUh+vfQTAj4hPAQaKKYA8aS/O9ftEUmEoqvnV1cXyCuv+GZQXl
	 DNPTaRZ1Vtj9AFQtGGnOqL9BQRy4GtE8C9v4bVCUhodCLopz7iUyNp0nffLjd5Vu7Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K31j6YOs;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BF760A2616
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42BF760A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K31j6YOs
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40312e2so306544eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174301; x=1795779101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/Zl64b5uRZMFqhO7EABjxKJLKRPSycq38m/Nb5ViAw=;
        b=K31j6YOs95IyG0QTJMmxOL2GCA0yai8HBZK4FJAOQmMFmhQkGyUrEl/Fx9Uc2EneUO
         9+GzQUgFRTymN7XThgVKVpYperPcD1P9alf31tdqzgleMgnmSViIkzJikSZDe+Kq12J3
         F6087Z9vJQL67MQEqOwP/cmfXMqTx45p31iH6QY24Lb11n6Tjx1FOm+hG+BgjxmGaSca
         ymB02MXEo3M0p5V3/V9Rmy77EmJxDW32iE0e/mK3PVX3QnRyOnfeE/rAlYnAwO7rcTTu
         NpGBe0qRJXZg6qM0DXlDfkBV9mgYb76FfLnX0+IeaqV4n9Mj2T/QtuhpzwWCqViNe4f+
         ElNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174301; x=1795779101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/Zl64b5uRZMFqhO7EABjxKJLKRPSycq38m/Nb5ViAw=;
        b=XrHv0qucZLOmSdgECMzhzGWV/4Ex7ROgEi++7H1KuuynaabOTSu5HOcZiByPoZSvL9
         uGjlTobdCrq1L10C0Lc8mxs3QGm+VKoBUfBvvsguImBhwK186eVy8jG4cxhYu/IxuY6U
         jjrLyouuaQS/KMYY5ADU0g6UHI1BkmlYm6klpxFNDqaosIZccpc4Tq67bFxhE5ZxP2zc
         z2rjzGk8nxl0ODxAwOIJ/pxv12SD8RjLmC9AWd9uSSmfSMDsjTN6WcNUE91lRL89nQEi
         0IbK4g6tkgXASiidlSTddjZMcoIEDcgTsqc4EvX09iGEnN/K50pFFCifZeVlVhYTd56c
         HynQ==
X-Forwarded-Encrypted: i=1; AL+hErFwlhi59gHN0cbyZVFjofhGoyXx1UjufHPZc8cNhmWjnaofZn3AK4f8EcN7ch818XnhMgj8j2sT5lazgqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ui8IEiqhOXGSbk+ePTKr8LiWMgcCM/6Rlt01G5IXL43y8iNSd
	gO6McZKyItkpEKjbUzWQEnQWSTK97AJCLsCfI8gx9bVrjSH4ifo6bVAXIwFhrAkaQOs=
X-Gm-Gg: AZFdTZcs375651dj7zO8/lHSDGRnxkul8sHqBN9pGGTctmAeklvOMwzptuj6jlPwIrR
	ArerkknR79mJSK+3fW/a9R8/OE/mKbFjhAHdgzoJ1YBqlYqukqeO2kZLkW7gqFHGtVbaF/dfnEs
	uLQyrQyLKPQq0ppp+gqT+psBBN+YiwuEP1NNJPtrofPoaOlEWYKDElHpJ+BMZiZY5Wad4q5QuyU
	VASUcaf77LnnC3zNQqM9XzIfdVyB3fYVhSYKZU5ZRFR5iTc2d4YY8NwfpNAHtuhuWAhjcvA+MAh
	ovKlraZxw1/K/Wyx6FQG4AH0LH4vqO73xtEgtYlV1bm3Mu39hXTBR0Cx0WNTyV0lVSuZtfuv9pR
	52R8XajKbYN+h7PcFmEdcSmKg+uHn+9G8nNvyARk1HrPcMVUDkBObv+k+Eyeoo3d1eBb/qpARW4
	hrYTFLhGDUfE1gPOFTKg5k7KOW/+Mo+aaJTlkG2HThOFc+yurNiSrVs0eK1gy3VgdQ5d8Z+b53o
	WLZ3QsAsE8ng0akedxCK28cjrvGBHlRIMXbjh2rNBKcFzTX5+A+NOEaDOmdgXlbwTY/9JIUt7pS
	JSRzFq7oi7DeVZCDwlqBjxuDoQUSlM/P05dATlH/cfi3PhNEW/9GDs/H976M7tI+BgBxizgziog
	aa6L8vq+IZTU7TCg7rMUXbpUZGLWWoR2y6GsEqe81AJiyJKOUPjYOCTx5rQDfHGnBfQ==
X-Received: by 2002:a05:7301:182b:b0:381:2f5d:a696 with SMTP id 5a478bee46e88-38571414835mr2600667eec.34.1795174301099;
        Fri, 20 Nov 2026 03:31:41 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:fe98:6351:c2cf:22c3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm7134347eec.16.2026.11.20.03.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:31:40 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v3 5/5] wifi: rtlwifi: rtl8192du: enable USB RX aggregation
Date: Fri, 20 Nov 2026 19:31:14 +0800
Message-ID: <20261120113116.153232-6-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120113116.153232-1-hjf3108@gmail.com>
References: <20261120113116.153232-1-hjf3108@gmail.com>
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

Allow RX aggregation of up to 48 pages of 128 bytes or 24 with two MACs.

In an aggregated transfer, rtl92du_rx_segregate_hdl() copies each
frame into a new skb with room for the radiotap header like in usb.c.
The last frame reuses the original skb by pulling it to the frame's start
and trimmed to its length.

Test results (2.4 GHz):
   before after
TX 5.2    6.4
RX 27.1   32.0

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
 .../wireless/realtek/rtlwifi/rtl8192d/reg.h   |  4 ++
 .../wireless/realtek/rtlwifi/rtl8192du/hw.c   | 18 +++++++-
 .../wireless/realtek/rtlwifi/rtl8192du/sw.c   |  2 +-
 .../wireless/realtek/rtlwifi/rtl8192du/trx.c  | 45 +++++++++++++++++++
 .../wireless/realtek/rtlwifi/rtl8192du/trx.h  |  4 ++
 5 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/reg.h b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/reg.h
index 639aa0d92e..7cc46f411a 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/reg.h
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/reg.h
@@ -329,6 +329,7 @@
 
 #define REG_USB_Queue_Select_MAC0	0xFE44
 #define REG_USB_Queue_Select_MAC1	0xFE47
+#define REG_USB_DMA_AGG_TO		0xFE5B
 
 /* ----------------------------------------------------- */
 /*	Redifine 8192C register definition for compatibility */
@@ -940,6 +941,9 @@
 #define ENSWBCN					BIT(8)
 #define ENSEC					BIT(9)
 
+/* REG_TRXDMA_CTRL */
+#define RXDMA_AGG_EN				BIT(2)
+
 #define HQSEL_VOQ				BIT(0)
 #define HQSEL_VIQ				BIT(1)
 #define HQSEL_BEQ				BIT(2)
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/hw.c
index ff458fb851..3edd5bc432 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/hw.c
@@ -489,6 +489,22 @@ static void _rtl92du_init_retry_function(struct ieee80211_hw *hw)
 	rtl_write_byte(rtlpriv, REG_ACKTO, 0x40);
 }
 
+static void _rtl92du_init_usb_aggregation(struct ieee80211_hw *hw)
+{
+	struct rtl_priv *rtlpriv = rtl_priv(hw);
+	u8 page_count = 48;
+
+	if (rtlpriv->rtlhal.macphymode != SINGLEMAC_SINGLEPHY)
+		page_count = 24;
+
+	rtl_write_byte(rtlpriv, REG_TRXDMA_CTRL,
+		       rtl_read_byte(rtlpriv, REG_TRXDMA_CTRL) | RXDMA_AGG_EN);
+	/* unit: 128 bytes */
+	rtl_write_byte(rtlpriv, REG_RXDMA_AGG_PG_TH, page_count);
+	/* A larger value is a shorter timeout. */
+	rtl_write_byte(rtlpriv, REG_USB_DMA_AGG_TO, 6);
+}
+
 static void _rtl92du_init_operation_mode(struct ieee80211_hw *hw)
 {
 	struct rtl_priv *rtlpriv = rtl_priv(hw);
@@ -712,7 +728,7 @@ int rtl92du_hw_init(struct ieee80211_hw *hw)
 	rtl_write_dword(rtlpriv, REG_RARFRC + 4, 0x08070605);
 
 	_rtl92du_init_retry_function(hw);
-	/* _InitUsbAggregationSetting(padapter); no aggregation for now */
+	_rtl92du_init_usb_aggregation(hw);
 	_rtl92du_init_operation_mode(hw);
 	_rtl92du_init_beacon_parameters(hw);
 	_rtl92du_init_ampdu_aggregation(hw);
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/sw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/sw.c
index 88e8cc590c..6b90002b69 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/sw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/sw.c
@@ -238,7 +238,7 @@ static const struct rtl_hal_usbint_cfg rtl92du_interface_cfg = {
 	.rx_urb_num = 8,
 	.rx_max_size = 15360,
 	.usb_rx_hdl = NULL,
-	.usb_rx_segregate_hdl = NULL,
+	.usb_rx_segregate_hdl = rtl92du_rx_segregate_hdl,
 	/* tx */
 	.usb_tx_cleanup = rtl92du_tx_cleanup,
 	.usb_tx_post_hdl = rtl92du_tx_post_hdl,
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.c
index c608c51f1b..1641099368 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.c
@@ -19,6 +19,51 @@ int rtl92du_tx_post_hdl(struct ieee80211_hw *hw, struct urb *urb,
 	return 0;
 }
 
+void rtl92du_rx_segregate_hdl(struct ieee80211_hw *hw, struct sk_buff *skb,
+			      struct sk_buff_head *queue)
+{
+	struct rtl_priv *rtlpriv = rtl_priv(hw);
+	unsigned int offset = 0, pkt_size;
+	struct sk_buff *new_skb;
+	__le32 *rxdesc;
+
+	while (skb->len - offset >= RTL_RX_DESC_SIZE) {
+		rxdesc = (__le32 *)(skb->data + offset);
+		pkt_size = RTL_RX_DESC_SIZE +
+			   get_rx_desc_drv_info_size(rxdesc) *
+			   RX_DRV_INFO_SIZE_UNIT +
+			   get_rx_desc_shift(rxdesc) +
+			   get_rx_desc_pkt_len(rxdesc);
+
+		if (get_rx_desc_pkt_len(rxdesc) == 0 ||
+		    pkt_size > skb->len - offset) {
+			rtl_dbg(rtlpriv, COMP_RECV, DBG_WARNING,
+				"bad frame at %u of %u, size %u\n",
+				offset, skb->len, pkt_size);
+			break;
+		}
+
+		/* The last frame keeps the original skb. */
+		if (ALIGN(pkt_size, RTL92DU_RX_AGG_ALIGN) >= skb->len - offset) {
+			skb_pull(skb, offset);
+			skb_trim(skb, pkt_size);
+			__skb_queue_tail(queue, skb);
+			return;
+		}
+
+		new_skb = dev_alloc_skb(pkt_size + RTL_RADIO_TAP_SIZE_RSV);
+		if (!new_skb)
+			break;
+		skb_reserve(new_skb, RTL_RADIO_TAP_SIZE_RSV);
+		skb_put_data(new_skb, rxdesc, pkt_size);
+		__skb_queue_tail(queue, new_skb);
+
+		offset += ALIGN(pkt_size, RTL92DU_RX_AGG_ALIGN);
+	}
+
+	dev_kfree_skb_any(skb);
+}
+
 struct sk_buff *rtl92du_tx_aggregate_hdl(struct ieee80211_hw *hw,
 					 struct sk_buff_head *list)
 {
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.h b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.h
index 8c3d24622f..47d7d6ad8c 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.h
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.h
@@ -18,6 +18,8 @@
 
 #define WMM_NORMAL_TX_TOTAL_PAGE_NUMBER			0xF5
 
+#define RTL92DU_RX_AGG_ALIGN				128
+
 #define WMM_NORMAL_PAGE_NUM_PUBQ_92D			0x65
 #define WMM_NORMAL_PAGE_NUM_HPQ_92D			0x30
 #define WMM_NORMAL_PAGE_NUM_LPQ_92D			0x30
@@ -56,5 +58,7 @@ struct sk_buff *rtl92du_tx_aggregate_hdl(struct ieee80211_hw *hw,
 void rtl92du_tx_cleanup(struct ieee80211_hw *hw, struct sk_buff  *skb);
 int rtl92du_tx_post_hdl(struct ieee80211_hw *hw, struct urb *urb,
 			struct sk_buff *skb);
+void rtl92du_rx_segregate_hdl(struct ieee80211_hw *hw, struct sk_buff *skb,
+			      struct sk_buff_head *queue);
 
 #endif
-- 
2.53.0

