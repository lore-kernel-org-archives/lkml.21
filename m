Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599152;
	b=YfskWP/I577IVQEQyhHfCc7yCAa9Syrw2aUHYpagHP51BNrJIEecblxSY/8OQ4vY8wnJ
	 oL/MrQI5lftUbzMTut0sdVwEYyxeBotJ8wTSPmg161GmlLPbX+BHfToP7zzF44cdyfhB9
	 WUTCNX1iTqEbW+kaThmEiFmLOSh5nVsJQdeEqbA6L0UUnLECa8h0Mnq1aDZAApSb5LJ9W
	 zO29isBs0Gc/LM/N5AVZzI4mSDEFL8lhgq6JkFr8IZnbH50l90y+hAr2dIMG1g3wFXFzq
	 a6XrTR4cXqwWEjmjzMaYQg+jrPSTpcRNXwRpqeyWiYlQe1TuWjN0/X8q3c7lTdNklZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l4RHB6K7RgAz/nQf8J1fwTRQBwHcMKQGbkgU+q0PgV8=;
	b=f/X6lfdwwUn2AoV+rRQN6/KH7F9J8FRRV+pbjo/M5htEaU2oaqv4melqetZ0drmhVJxs
	 pvto6hs1GFpuhLN37gXHUFR/6BWSksoT/SYjG6VztJcimW3jZDI4hzdx5YJ0hA0HUXyk6
	 JV2U3/afYDsLCtJ82H4qtbqVfF5cYptPkNRlAUoLdneqAq9dehr6JgFcbHZe72jheRcxt
	 do5AwPe9UvTOUXaGY724+hzsOGLogeEeSlZNXM5uEir8ta+cGWHNFqqaYOx+Yyq7mayf5
	 GMlGL3xv3e7Wt2s8nycseNUoH676KGoUCyoTz0DHOUhEfFG+iglDQbdL/AET6ilczEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ucWggkp/";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59EC606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B59EC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucWggkp/
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso40635595e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599150; x=1796203950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4RHB6K7RgAz/nQf8J1fwTRQBwHcMKQGbkgU+q0PgV8=;
        b=ucWggkp/ylQeQo+d3P3B4kePoFLjOBL4EURBC03OYEs6t0KRzCt7GAV9npYPdoHzLU
         y2QCcusM0/gl1bRT/7n6sOQOlH8ZAZvNUziP9aOJxCeCF9B6O2ZQyb9/irm9jUDgVqfd
         KBrfejRrsKZfakTfthYUuLt3B3LVYrXRrjsXjXu/0eq13CNTZ28ATtCXjnhlXj8oGqn+
         y+XiET0B6ez89fSEwIN6oUY3zGE6Mo8w+F66hI0KqkGCVDkgSAUXbPu4jpmIAF3pImhn
         TMQVlLSY2STfsdpLmQEvN8nj7QxV60X4C4kNhU0wWxhADCPybT0L3FZ+KRhBwXqR8aTP
         bhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599150; x=1796203950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4RHB6K7RgAz/nQf8J1fwTRQBwHcMKQGbkgU+q0PgV8=;
        b=MG+0PdckDdezCeFLgNwqtfTZr0w9r65ngFJErgGadHNdHrWL55PU0JjX236S/WxpUA
         g09dSYXCfZlV6K6HZhEImQEhN9J8JCn1nM4zJe/DJ0sIysknz1ES/q9KFlQzyn3dN4ok
         vND/fMqA0KTWkqhllqw1P2q8D4gwuR25ETlfxii6pxwlG65BeH+jo9CNG9oyM7j2VHNu
         HdOZWI9oRdopU07j3DALlpzeWD9IG7s7eL5YlITvO2zkUZUJ+2AYnN0D5w9DmswDbkwZ
         W6eTCs0lO3zXxfS+9/KZBdqAajShTqi/vE15SvVBmtvgkQp1cwRnpA4REl4fx7H6L7VM
         P0Qw==
X-Forwarded-Encrypted: i=1; AL+hErE9EZauP/cvAXRrhNDtsYq4OUFedaLdsfjh/cKP8yJtijoSD9QCAdNygsol1jf7HymCfSwbIcyUTFxd6Ec=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4hPzsKp5s9zL/566S+hngLiwYtLIUkNb8s556wN3dt6VMk/wm
	Ih2Mf/1S1HiOyldMbBqjT/3qpuVnuIom4T/qBtjwzkgmuDlh+pzh6iub
X-Gm-Gg: AZFdTZeV0bo8dkLpy4In3Jc8BEmZeuL+oSneS+pk/HzapSroTUBDLJ9rL8aN9hts9KG
	F+fMw8PwqBjNW6oUulXhb/Sv1DYumnbL0PO+vrj+PReWYRdGV7Qb4AmPZmOuY/lKwoybBcS6RaG
	D+wmam36kIgPMcTlaXs+VA7Fx+LGN9FFRnGKkwyCgi4Ia9syPo6HWsbGQrDuHlN4R8iQYk7JJkD
	1P45g9GmsBT+4DJ3El4S7gqs0rpwdz0i8xfKbTa/FQHxepvkRzciUgFhvzwJd0DzUqaDVsmuhuG
	y/x+W7W0xtCyaf7ImDmlTMY0U+jL0o4cfkKH1mGWtYwkj0Cvtx6PkSqpZrZfxcOSexAGK8glXYg
	tOCZ3c6cGU3eSC8Gc5vci0dkq4db4ey/0AVfMfAZ5SMGLBkMnX6Er6U2c2o6RC59hP7DRSCoLtr
	03PZ2p95F1MmDyAdPRPaNLclet6D8t0Cpt/c00TmMWOwh/NF/fBaJkUCkXnP7a4/ILymdlImwoN
	bvlRKzmcZAm9MZyKZzpFIiKNcyZG4kFJ3ZtzAujPGDLY2LTdNy3/BgdxasT25VGuvZK4KyDv4Ht
	cCJIlvpxEkbA5m36Kldd
X-Received: by 2002:a05:600c:4e02:b0:4bb:5d39:95fa with SMTP id 5b1f17b1804b1-4bb88811c82mr338133785e9.12.1795599149909;
        Wed, 25 Nov 2026 01:32:29 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm608782495e9.6.2026.11.25.01.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:32:29 -0800 (PST)
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
Subject: [PATCH 6.1] Bluetooth: hci_core: Fix not checking skb length on hci_scodata_packet
Date: Wed, 25 Nov 2026 16:31:00 +0700
Message-ID: <20261125093208.224568-1-petrvaganoff@gmail.com>
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
index 1639097a865f..443a1bb76019 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3786,18 +3786,22 @@ static void hci_acldata_packet(struct hci_dev *hdev, struct sk_buff *skb)
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
 
@@ -3815,6 +3819,7 @@ static void hci_scodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 				       handle);
 	}
 
+drop:
 	kfree_skb(skb);
 }
 
-- 
2.55.0

