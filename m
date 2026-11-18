Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026907;
	b=qG/16ZOD1pVteLg56D+uVi4CldBdeW1IcABgZ8wD1bLJS0Hex7k7QEUa1egdsWv+tg7i
	 twg55k2ksUD6hfiJadwnFb3GDlmcPvDY5mtPrK4ORKu/sjZOhN6OFRTg9YtiWgz5zqWaS
	 WuQI4fryL3naE7oQdan7lLz9jtt8RxKjzoP6t/ZyD1Ewc1EdSdr+dfzpnsuctY236+Ifl
	 FjroEUg8pLENjq4W0h1f1YhbpcQI/uLhVPp8erL/8vKVHRs/p8h69Fg/nibF+Uh0ttA6a
	 RY8pJn/ZuoPwGGvmcCNNYCYP4SdX21OCELBfIWqbjbBmr8yRgn04kcFM93G3M1dwWfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J1mE2/uvxHDBhyh7b8T/IYHmltMNQ44dSYQaeZ69JlY=;
	b=VqU3+D4kUQClh3ev+/E6WFZOzcTgHQd7ELNSNfy5n3gCGbSrlOhiJgJ4z4SUhEh0KPoi
	 fbtPi5jGPYmlmtjx4M70mqr4DhaL882hUhLh1UQpaSkcyIX4R4Ambd4ByrWPq5R5qL+zm
	 yEojMcRDT4sWO1oUrtfSP0ZFTe4qyTdif7lPPyZhmrcz60OSj0ePWOiUfGFGObYXoh4jP
	 I51eRjXJAbw8fafi3voC0FV66u2tJ6GSiixcBqDE3Nk+8UDGO1FNF+qdN+3AFe3i3KLtK
	 NqAzD8BfkPYjGTKbZfAaKzROHLb2r1L7jmG0srkEuKcF7w/7yCAkzl6k7HkJEoSQDTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WXU7IlvU;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB18606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CB18606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WXU7IlvU
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37198ed3727so142015eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026906; x=1795631706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J1mE2/uvxHDBhyh7b8T/IYHmltMNQ44dSYQaeZ69JlY=;
        b=WXU7IlvUoaBDmdG0YdpGKD0oXbWF6EMQnA+H1DRw7s6gz7dnXmc4kP2voAooCKo5do
         X/NNmx8k0ulmLW+xXDicvQquBqw+3AFEetSr7GO9kOJLEE+qK6QjgOrfgpnc2pFZ4OcA
         RsQoyhvSWJVNBYEdWmvYI0SSc944SbEDtI5x4K4rw/TslaKjQjucCABoNhTehwt1FZtr
         NmwgYZellNLKIozbGeXe6yog5yPBFhw8RUqjL2oQ+q3ZlQjHS/xvXZDjDIWt5hV/8gNL
         qd4E3BJ90OevoLD/G8g0Ft1P++4IkgKFzgmOTUmxnJTsG548izhEd0dapgJ0y5kWTZNH
         9PGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026906; x=1795631706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1mE2/uvxHDBhyh7b8T/IYHmltMNQ44dSYQaeZ69JlY=;
        b=JO+vD9pEgbiXVOyEeU0Vj858r79Zj+KVjdmWmeEQGco9l8QHtf+rCiQAtJxFzfeuIr
         aKwMZIhI7sCdHaZMGQ+fie560RWWo+uXjpOnRJY+dH323iI9lB0lzvNRePEMkKFqIsw4
         +DpWiltFv5dLpjx+2aplBFRH7zlARca1yMq/x+pDltY4j7+O6rExvwtqwxq0umTjduIn
         m6P11I1ez/wUf0eIPSMiCdERropu4WyX8man3tTEpiwtpOV8MzQep40r2ZtLvgauVSUS
         nGA1Fy0V+BatE1g1P1/y/01osTB3lPw1VPynrxNLG+QlKfNmEKgpjuAD2E2YqOEanizS
         JClw==
X-Forwarded-Encrypted: i=1; AL+hErGuxXA/KOW4kJKsHtlAgf6nfJlC7y7+p9PpO4D/fw6fPetpMqp0QFlcu0mdX/xZHZMtnEDZr65KSPzJW4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EKrEgzmXydV1rIhIYYXk651KtnVwiX/oRKaWxVbFdVR1l5IMo
	r/hGN9SGHjT5PZnwDOUKvBbSfKeflo/h3Osk8fm3gvnBZ32RPpF2BX20
X-Gm-Gg: AZFdTZclJ8VcBi2QWxVF5zQZ/D2JpTNW6Hz70c3FgHyrqAByziWpvmglkZVOWQwjxDe
	QGIGF2GhF0js8G3vmqtqTdho0Nu4Nf4NYMcJq1CILr3UQfoIgL2s8hrEMu3Hn4//xBB9K6CnrjD
	rsC2T16fRcn6DPonzagOXua28J9Cp9qRrRpTWBRlK/HP+w5ceU5KMh8QeD9By+Qoxcoq4qmovCL
	GIH4X2wR9/86bWDYW4d7wyqanUrzgYq7rT68JvPnI+FApwXgirQLVtqldaTPgxLEnbJ+PTXa9UG
	/CbWdn4LTAh6xTZ/QVA5Fi0+3m39t2ZElFyJ3FMRcPuCOTkBqkUWt2piigaANklYC2Tn3SVkNph
	33zElbn3ihxRz9jJnOG1mymrax0D6OingHgobwBIsNpSne8dM+dh2i86AoSrBNYm7LRtqYmliJT
	94DmDpYeSfu/31lWnlZYLFFn2XGe6cg2WuQ43/MWThqdJ6FN3ZWeIkDDIeEX61rjXoyY2YI7PMT
	Yo3aFuPDzXdujzWykyGiLDbeWurp1+C8K+WoEUrcncfgdJGLHVaQRojMbJAfY3XPTFWhRQSyZeq
	mYKDBJGxHqrmPI6FR1ggADJOz3QHGpS2t5dQ2Xfn1vIVK7FPdivJDMdXTU+8VNCDvXignXWjF5f
	0bmsw
X-Received: by 2002:a05:7300:ae97:b0:382:2ae3:b1d0 with SMTP id 5a478bee46e88-383ee2228b7mr240375eec.13.1795026905715;
        Wed, 18 Nov 2026 10:35:05 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a73e0aa6sm9453348eec.19.2026.11.18.10.34.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:35:05 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH wireless] wifi: mt76: mt7996: restore the wcid flags on reassociation
Date: Thu, 19 Nov 2026 02:34:38 +0800
Message-ID: <20261118183438.44794-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

On disassociation, mt7996_mac_sta_links_event() clears wcid.sta and
sets wcid.sta_disabled. Nothing has cleared wcid.sta_disabled on
reassociation since commit 13e2e9c6b348 ("wifi: mt76: mt7996: use
mac80211 .sta_state op") started setting it. The ASSOC event used to set
wcid.sta again only after the rate control commands, and no longer sets
it at all, so wcid_to_sta() returns NULL for a reassociated station, and
both mt7996_mcu_add_rate_ctrl() and mt7996_mcu_add_rate_ctrl_fixed()
dereference it.

Set wcid.sta and clear wcid.sta_disabled at the start of the ASSOC
event, as for a first association.

Fixes: 13e2e9c6b348 ("wifi: mt76: mt7996: use mac80211 .sta_state op")
Fixes: 28d519d0d493 ("wifi: mt76: Move RCU section in mt7996_mcu_add_rate_ctrl_fixed()")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in a QEMU guest with KASAN and a test hook
that reassociates a station through mt7996_sta_state() on a synthetic
device whose firmware commands are captured: without this change the
second association hit a NULL pointer dereference in
mt7996_mcu_add_rate_ctrl(), with it the association completed.

No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 9321c8146e2a..77f0664fe57c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1491,6 +1491,10 @@ mt7996_mac_sta_links_event(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 
 		switch (ev) {
 		case MT76_STA_EVENT_ASSOC:
+			/* Restore the station state that DISASSOC cleared */
+			msta_link->wcid.sta = 1;
+			msta_link->wcid.sta_disabled = 0;
+
 			err = mt7996_mcu_add_sta(dev, link_conf, link_sta,
 						 link, msta_link,
 						 CONN_STATE_CONNECT, true);

base-commit: 763b13f622e2758726e8e3ecaef819db8fa0430a
-- 
2.56.1

