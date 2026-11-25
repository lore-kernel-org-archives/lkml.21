Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599445;
	b=E/Cb81vcS3vQHFtQ9FORKQYWzkK+pO7veWlgZo+p6C6QcuWJDg9a025yqG4XVIeNpydW
	 BpJV2APYCEyoOdzC75/DFcpWuBayYGhsxbYofGBq7y5JBHC8rTLW/bqUXSaHeZopL3nPe
	 P0Sj9+HqhxW7EGV0BpE7af2zHiixtL3+dSctcp6vyW9jNyJavtiWWYxqV3k2DjTqqSAd7
	 Ka2b5r/j3thdRA97JjnKc01xOwxJSPwP/bznzuUV090jXn1Hg5wuGZY3JmKFfSBmrHusx
	 0qWkfWl7Gn9637D58BOLtS6pv0WfclpelLYfBIhKaIISphwE9As1E/7exnpD7rzbGcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Uru4uc89gdbKTgL7oPQD/8sChQuJekgJ1PKHJDsBnDk=;
	b=fprvtm+XPOBfOzsGfHK/C4p0fCgKDK4R6+LNbGVONbQmh5BcErsxDizr/+AyeP1adne1
	 JKK+J1Z82iOSp9OGlsCy5RA510MMI/Ag8cJCrVhfNINpQmDkWF9wLoX0Z3YSEN11PqqcM
	 osjfazTm204CEEPWCZ0kUR3bhE9x4NdEMflN+5mQQ1AQUWnz2UNTKMCLQZ6Zb4Tda75t2
	 wRLTdeKQ499hEKl0TSs31MIHicYXHhMAA6sG3zRyH81T4UH2uhqgIfvQhU2WTQorQ1lHt
	 KAPOwcB0lhPRACGE2zwLBlopGqVjUt/GeZx6rnpJSpSpiu0OCeCkfJnMvhNQm+IDI/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z0dLjg41;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B304A606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B304A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z0dLjg41
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so48389065e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599443; x=1796204243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uru4uc89gdbKTgL7oPQD/8sChQuJekgJ1PKHJDsBnDk=;
        b=z0dLjg41R3uLk2yeb8k5wxIB6q0Ke/05wkhEoBVYgl+hRx6El5jMIq6grFlpzdFuon
         qF5yUr6pJs5UwqLBK1T8XZ5EoxNpDB9jO28H70rVYGQKIA2VZwvuONhWDs2ceMcoDWgt
         j75aSwOvJWVHlSNd/0UZPtBRyOyubmhYJmAI7CHV+tuSN1HMki1uhpJwRo6IPN8GCR3J
         OZq5nSUUWtaQ0wGfWsPBhFgGHYwz5YQdCkOSLYWDe2SES1Yi53sMnk24AOKsJeEL6IYR
         NWDNhh8/c6LAHuZaTmPQBf4g13zU5LCGWjVQmbsozJyC/XkJ1UuP5SKQr3ZGLZ8N5NAE
         dUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599443; x=1796204243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uru4uc89gdbKTgL7oPQD/8sChQuJekgJ1PKHJDsBnDk=;
        b=fKQIgoWnZBVQ3zI6if1oeEHkyFBwGtrLvBM4vgA3NpUwwsBpud9TCv1BWTf7wDF9ZX
         pdYTbNeDulkgl9JyOX9GhRY7QfiUQ6X7Xo2GkK2MkBjpCRSpaSdpfQhw8jQSnwaO5qoJ
         8b1pyW8maYEbOOfAt/9W4FHoaLWZa0wWhwLuQjMU0j+Zk5NYPJdYE/R7qW26UefzUC0+
         17QvefuQiGOOsHgNCNe4i8jv+hB15EO1Jgl8avGgzSXfavFow9nDTTF2WKFiX9naLqyE
         HfxK+UaXaiY/L6RpzxiXzf02TULV+HplAo5njtYvaeGEXMcyTE5wrlYpEBcB1vja9UFE
         J6Iw==
X-Forwarded-Encrypted: i=1; AL+hErGI1EmYCdxV2m6bSTedls/de/GAz2XttVNJX5nmAPWz5lIKHKT1y/Sy7Cj4ui1pllPYu/wweoS2mYO+Z80=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jGaIjJnwDCIWRaTL9/yxY7McIt428R/LMRDfZLi8jKgmFkLC/
	se3R+k3F6tMMZkvk/XiiHOj5FktT/+oT608iAWRIVZgMghCMzPXyrsqv
X-Gm-Gg: AZFdTZdBn9YDqO6+AqGjr6cXI8RvfKXGv5g9ZV9a696XbWuBBSOR2m+4zL2/oFRFRbf
	CpN7hamh7W2WZlKkdElmFfSONxRIHFVRvO24PFRh6YBBmFsrmX4RTcJCWMtw917k6o+IrmS7Iie
	LfKOqh2N7mpmj2nDEaZL2c64OAvh0vBtELkiNAqh5L1L8p+OJqMZnKW1l3hkDE2u/t5w0fUHaas
	t6NEvs6XbPLMTdUKDgUvYIkv+YqPWkcUylbRVS8nmksO9LyiYGmjRzxMILY8UO0Av7KL+QnOJVQ
	KX+j/gG93B5TWJvKLDW65c8SXAh5nKjuzgBTQxXdEAyYL7Xqs3u7EyzVGHWyd1sz/vIaBhKpT6f
	mdQ7S2oyioAyRokgLKJi+vHnrdLEEbgv2t3NckmkNQlfndAf/2zkD8OyeeoNuv50m1LBFqCI/tu
	yxuOFWBPJPTKTUUz38ia4Qd+pfJKs5Er1ye+R2p8+BrRtV1sVk/64FCTh/WsNccYx/RxkB3ZvBw
	pu1o6GOO+Twr6cP/XjXjkk9eIPtTSJjemQTDUl4rTi0+oaQVs5ThACR2qV8UNRd1TEzVRNWejHV
	2Tt0kzK67wEteqN/VlyX55sXHRtOHr8LMYPgJeodKg==
X-Received: by 2002:a05:600c:6092:b0:4bb:6ac0:6dc0 with SMTP id 5b1f17b1804b1-4bb8892097fmr322215805e9.29.1795599442922;
        Wed, 25 Nov 2026 01:37:22 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm492567075e9.10.2026.11.25.01.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:37:22 -0800 (PST)
From: Petr Vaganov <petrvaganoff@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Petr Vaganov <petrvaganoff@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [PATCH 6.6] Bluetooth: hci_core: Fix not checking skb length on hci_scodata_packet
Date: Wed, 25 Nov 2026 16:37:07 +0700
Message-ID: <20261125093708.227125-1-petrvaganoff@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

commit 59437cbb5781227567dec226aaa88c66a09ccc5a upstream.

This fixes not checking if skb really contains an SCO header otherwise
the code may attempt to access some uninitilized/invalid memory past the
valid skb->data.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
[ Petr: add Fixes tag ]
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Petr Vaganov <petrvaganoff@gmail.com>
---
 net/bluetooth/hci_core.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 84d9a445e08d..67a13dca41bb 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3838,18 +3838,22 @@ static void hci_acldata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 /* SCO data packet */
 static void hci_scodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct hci_sco_hdr *hdr = (void *) skb->data;
+	struct hci_sco_hdr *hdr;
 	struct hci_conn *conn;
 	__u16 handle, flags;
 
-	skb_pull(skb, HCI_SCO_HDR_SIZE);
+	hdr = skb_pull_data(skb, sizeof(*hdr));
+	if (!hdr) {
+		bt_dev_err(hdev, "SCO packet too small");
+		goto drop;
+	}
 
 	handle = __le16_to_cpu(hdr->handle);
 	flags  = hci_flags(handle);
 	handle = hci_handle(handle);
 
-	BT_DBG("%s len %d handle 0x%4.4x flags 0x%4.4x", hdev->name, skb->len,
-	       handle, flags);
+	bt_dev_dbg(hdev, "len %d handle 0x%4.4x flags 0x%4.4x", skb->len,
+		   handle, flags);
 
 	hdev->stat.sco_rx++;
 
@@ -3867,6 +3871,7 @@ static void hci_scodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 				       handle);
 	}
 
+drop:
 	kfree_skb(skb);
 }
 
-- 
2.55.0

