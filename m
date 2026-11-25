Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599196;
	b=TJl30C6USDorT8GEW4crvZl2OptlCY9pPn6Gmt1wIMcq6ue5ZFJYg0G4Q4wHeOtCbDsC
	 0h58sNk0k0vgFCY/+ylfFbvLckE23CA2Hn+Ir5pM/5+0U0OSN7qK/EkrNMhmnHLFhPwgv
	 4m5L58jnsxQLR+gQdHUMwMXEFsc9QL19N7bOfY5VYZ6UH5U0jy5q3EOJDQO45p+KXVEEs
	 L8hcykXZFMUJwRv0eLMlSm1R91BFZP0TNsR7pcP8zXoHKjQXj18lihN2Una0LU4Dix4kK
	 eg2EE7YE0X37ZNuJK8nDEnb3OSNzgybmg2ObqWU6P69AAVYe0sPR45Q52vKLUo6+1DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FSmYL94CLAH42+p2nURarn8jPDSqfDJDEGZWaM+zzZk=;
	b=AmDIAV+KaBSw/XcfaY2uAdC5CQqcTksyk9yiWd7q9b5NT4E/jHvnD6XpipvqjktflCJZ
	 rsXn1Gc8mxYtB5pPqDF0wBnCjhaHAyVzRU8Y6Vv2g+aErbwIgW31iyBbV2bc/dCAqwrmb
	 q/P1y+4Cp0keP7g0zg2jjPy171ChAKa8JTJ4JlaH5yEx8DnKZ56V5pgNGvNZG6mkwZEK5
	 hJzzl6VJQU+y/6izJCL+9L0KTwPPGelMtsOWJi0aBIWrF+59XBsk6/rhUyzeD1VzdH6rd
	 pYpK+RSeuBnD4ZlLd5G5iOvH423QnoEJgc3RcG3xli2eOJLhBFNM5AzPG7hkAKu4NGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="t+jv/z5h";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5FB606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B5FB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t+jv/z5h
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491846221ffso4710081f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599194; x=1796203994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSmYL94CLAH42+p2nURarn8jPDSqfDJDEGZWaM+zzZk=;
        b=t+jv/z5hjGeEZm/mbVnKGhsbkhkJJWeN8VnCFyULn7VO4KiVYiknQKEAtQ8MsVmYf8
         LKvx/zvmxcc21se1l+Wa9RJLJFBNW117WZ4wfoKsn5OH5xoVeJKZs5TC5ThbYb9vRwUe
         rBV8Njv/LcIDpW/kBFSl60hriN9wJCmov81Eejzr8mVtlDL4I8n9hnJECpQ6dVk7Gu68
         doyBYGFzRrL4NCp/QaVBrtM75SP7fZo+GWRCWjr66yv6meracAZe3ebRVg95IqQru9tI
         GNL0uj/OG+xDvfjUdPt6eXAOjG0Q9eNUGVizx+bnpv/A67Ch+WOYm8Ocm6jd++GL3hl4
         eK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599194; x=1796203994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSmYL94CLAH42+p2nURarn8jPDSqfDJDEGZWaM+zzZk=;
        b=t7QX2CTL8NkSgyviRD6WMhaK4SiqeCUexygInIOJ2+Za9qu/VOyy5YDuO4wBZcblet
         BDfTAbYcuSpFFuzAxuG2olLv3mI9IsRHbJ6xaZuSv7Rm601XgcAL80m5cP5OUxxt69JX
         jhIMK622p7tEzi+efFI3ZFKv0k89qtG172GKJKN9wpgjmW4iyqC4ZHJc7ThKkEieh/UB
         YIRedOWuaQxXaeuwUqhAwiDdrubuQSaJjaXzj/5r0281soXXG4/ePFtpaF2AXk93HU+o
         nRxcUTCbo5s6kLd/3G1iSBMDAnboMIG/W65dcZKPl3XsPcTZjYLxKXu4HGqOiWLF2gUd
         dUKA==
X-Forwarded-Encrypted: i=1; AL+hErFL8IeBCTt/nY0Gn1qB0C5qfbaNXFE3Zugx2tmtBq70hHp46GMh18ta707dhAJtiYpXjV0Hg5ZRFQ4sd9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HRbD8ayAUKi82jAK4SdAlKThli1RT9TmNacl7CyNb0Qu2Nr75
	BpBtc3O+wyfA/Dh/c5eUMCile/I/cT0tmPiwHuSb8ZKNEj7OEunF8Wsu
X-Gm-Gg: AZFdTZeC4jB4v7kV9R8NLh38LeQssw7uH9LJSG6DuExkmROa4eQGUeLtYutcAolO60m
	MXqTXjRu4BJiHPxc5VpI6O4SyWEvoE9imvdPeMhBJ2xuDvRnRR79oD0TdQ7Q/QSjnX8fC0MWYJs
	R9iM1gOC9XWlaxoSXH06jaBnC1ND7pBYS5NP2Gf4NVSYMhT8vbsBpY78phZpJ/JnKSPvbXI5vwM
	Kk7O93AKsjO4No37AT24CpInqySm7uKRqW03Sjtf3KbZMgsPOe1LIkVExH56nuRdg3y37MyafcV
	FXXrczr5+Ry9sG+QTHnLvm8jc8Pf4PyC8jskh2BCrtsO2pbNvblL3v8WPC8y3XI/sBdjW8acDDy
	Pi3f9nwIRNiF8Vc7MpFIc2p0LzBaJ9xUj5qVyWUBJHOZhl2Q8KZzWl6D4PqBUkaGIiBIncFV6uo
	aYdhuCV94FG5qhk99qDWaDr80AD1vpHKNTHSan7nmKQL3vdtaPRJsVq6MBratWgHUIcAOt4ZAVb
	8lyEBMc7m4FjhoTzpyG2QlT00UhgN7j8n/gudL2rDbYLgqe48ZjFf9o04AdGPpwPm/Sf3lgYLfI
	X9Dg6lSISjrBzq+LD0wq
X-Received: by 2002:a05:6000:491d:b0:4ab:f5b0:a7fa with SMTP id ffacd0b85a97d-4b598a60967mr13697952f8f.33.1795599194330;
        Wed, 25 Nov 2026 01:33:14 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm32077607f8f.36.2026.11.25.01.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:33:13 -0800 (PST)
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
	lvc-project@linuxtesting.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [PATCH 5.10] Bluetooth: hci_core: Fix not checking skb length on hci_scodata_packet
Date: Wed, 25 Nov 2026 16:33:01 +0700
Message-ID: <20261125093302.225552-1-petrvaganoff@gmail.com>
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
index 60b1dd16ab0d..0ebfab2c26cb 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -4819,18 +4819,22 @@ static void hci_acldata_packet(struct hci_dev *hdev, struct sk_buff *skb)
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
 
@@ -4848,6 +4852,7 @@ static void hci_scodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 			   handle);
 	}
 
+drop:
 	kfree_skb(skb);
 }
 
-- 
2.55.0

