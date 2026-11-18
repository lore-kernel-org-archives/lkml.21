Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987888;
	b=DKHQYdsTRA1uNYqd/IE7b+22IibFgp5sl7Pkh0ix/y73aegBcbr7GEifmBF2v4UIv8+M
	 qtqBI6yUlaGekjY7sqbl585zY0fAleFZE6WvzaGx5RiYo0OT0CW+uwu4OeKISxN+zXW6y
	 i+m9AS/swn4iWQa7BpoEhrqY78beEJz4uGkOwTQL3r85D+gs88Ib9a2JmUDVk6UUWKW0n
	 ufQQ/P22cie7gOYmFd90TNaY6KO4a4rCxFLmlVQKeFFmUYIqYb7g0ErzGbswCtweTkXvy
	 YlL5YJ2TUyZwG8MT7ZKzt3E4Re4ArDcfep3Q/CnA7O6Jnm5XVu9KCZzNgx2eur6liVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6PGhhjEgvqZ65gHKlryLhyRpAAf9R8lJRaIz/grErgQ=;
	b=1cdCHolaOn00L0ARfT5q2sRZ9n8JeCfrDIldaH2oSkmQRnGqPuYT8HdvVx3KCVYsFGul
	 l7eWw7A4BtBQLU3jNRl0YBBcRvbm7Vyj7gPozFxjf3GQR19Vpv6QD0xerPrvZv9XGvdST
	 5OXmzQVbaloa3reC/b2A8ySvfV8RjpTNXyvqGHBzspZu/iE0fDl5IWcNX2sEJbh4vDdo/
	 Zz6FUxiVd0taxZHWyTuf1YnEVQ9mJhca5jk1en6UqtOYEnqHOnX4DjdWaQPf/WJyTeVKi
	 kP4UItBOymVjTvnfWaYAqDeOkOK1mPhYVYGDduwcxkq+gVrcBWHHIv5qCPD59LF3n0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=quora.org;
	spf=pass smtp.mailfrom=quora.org;
	dkim=pass header.d=quora.org header.i=@quora.org header.a=rsa-sha256 header.s=google header.b=jO4u+vVH;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C993606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C993606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.a=rsa-sha256 header.s=google header.b=jO4u+vVH
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2efd659464fso2369515ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1794987887; x=1795592687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6PGhhjEgvqZ65gHKlryLhyRpAAf9R8lJRaIz/grErgQ=;
        b=jO4u+vVHbKfydjhXAgKGqbmmiaqz5waZr82t4jcefYRuztKgvoKYZbtIwkEB2lBpSj
         t75qZhQox2VBo5S+opH7xbCckEx3lv0fomGg/xhSOIUPVO1nDXeyTX+ykS3yTaWxbv+F
         JsRVg78nEb063msGH2HQPjPOZRAfbQRT2R9IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987887; x=1795592687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6PGhhjEgvqZ65gHKlryLhyRpAAf9R8lJRaIz/grErgQ=;
        b=uGXhbHfvVcgh9JAN4OyUxgmr+3n/Hdpgh9tVU+5Sc2IeagoaDjBrq8O6UbRSM8fJkD
         VQPw0UtJ3+Ve3D+phcFwCv3zVN2KvKEy6nf2GxlHkx9oLAgeO9OJrNxL4SW6qrVJqRYB
         duJU+ECejKw0Ou6VQwKw/OGz4MFRFfxRMnv2ig4q/z6LTveRkAmqOEwtSmHavS/8WJfZ
         EutKLjNKmbXp8c0opDca5WNJHkbox3IMKEpepfYHVYejpVVXYoPmiFDubmstUh+tO79r
         2kCaNQpcQLveUKIj9LxOq+Petx58gaTgJQCQPef8gP8n3XpEX18gKT9ZsHoEvXilNY62
         +/nQ==
X-Forwarded-Encrypted: i=1; AL+hErH9ZrIVCabu5zSyCEzdgMOSbW6/VXI4csTOpOIJg42RTMOuHJDC4ksOcBKUa8sFtGZmLRyFKrWRL0GoMRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qN97zeGFpLvEnxvOg4TGmA9wK+DbAfa27QRwqC3WWVCNcB9OA
	cj6KDbqswijBVqEFZy9O4rA4N4JRN598cIkst7nAeLVXQ9izm/wC32U5xt9PrcuK8/fXTiM3gG9
	FU2K8DpA=
X-Gm-Gg: AZFdTZflX7Pn12w96DsoWsKf7WGeiB9+oJJD0cl0SXDFmvhmYyoWyb23tjQXMY/uroW
	lMvpohCZyO4S5e5duBcm1+2Wozi6XOcM5zM4URTokgmtAVgXPaRekS7rr2OJdSV14xI0zqWB+Bo
	6IIa72zzlAD4dJXaIN9N9TX4XnoAj4LwEo+272ivTlJRqDq3RUqpY9mp6F2WAAn1FVC6HdCf+LG
	Z+bX/10qhI+Xa5a7XVDi8VGXa6wYcdOtQrO/FDb5P8GsmEKxSwYb8Nugq3SL751RSF4H/9x1KBw
	ICF82aOh6OqDipMVannvBMV+xoafnsjpWV8AiwgPec8O/S2auj5st8CfB80WWRzYQxF0HvVdZe8
	ieDUzjClE7C/N27U7j7mz2MZ4GrKe5Su/Bv1Brd1tYrHqU1PlDj5+hP6skKi3jvq95sE8vhVCcO
	4I95gW9QLBfcHD8uXuwB2ASm/CnZ3WOE46Y9Cb92s9PiSeYomZxXA2GzhgPn18UQs4tSxn0JLi/
	TkDFsVB9P+dU7jpr6Ekh8dUzeagqFSNOsZ4vNrc7cTWXiPV9RGnjG6Z1mCOXE+7cMJm4QuP9h+0
	WGKgfVsh7UhaLlxuOHtA2cIQ4H8f9BZEUYTJIoPolE+1qs7UJqnENK5QC5mbmrGSxL7aPMDl5Bh
	FqEr/5OpgqI/wlbKAsJ8895FvxP37vWTdzsVqQbGmKeqGol+p4/6D8fI8WLNPDH03KfDkuDEiFW
	h59j3mvfTTE9LYxfthrh/sVIK1v4jbYKIPJhJHTIHaYjdeWI5XPjqW5NPEHtlqusvXjXLtG5LZp
	CETDDrddGeoJf8f
X-Received: by 2002:a17:902:d4c1:b0:2ed:2e3a:1fa4 with SMTP id d9443c01a7336-2eff76a9fdemr20403605ad.62.1794987886252;
        Tue, 17 Nov 2026 23:44:46 -0800 (PST)
Received: from localhost.localdomain ([2001:fd8:4d04:f800:62d7:4d2f:7b52:ebdc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61162dcsm8861185ad.18.2026.11.17.23.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:44:45 -0800 (PST)
From: Daniel J Blueman <daniel@quora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] wifi: mac80211: remove NO_VIRTUAL_MONITOR monitor interfaces on suspend
Date: Wed, 18 Nov 2026 15:29:47 +0800
Message-ID: <20261118072949.14222-1-daniel@quora.org>
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

When suspending with an ath12k interface with the NO_VIRTUAL_MONITOR
hardware flag and monitor mode set, the driver skips removing the
interface. This results in a firmware failure and unusable interface,
triggering:

WARNING: net/mac80211/pm.c:173 at __ieee80211_suspend+0x44c/0x530 [mac80211], CPU#11: kworker/u73:11/20379
...
 ieee80211_suspend+0x24/0x50
 wiphy_suspend+0x2c0/0x420
 dpm_run_callback+0x60/0x2a0
 device_suspend+0x268/0x7f0
 async_suspend+0x28/0x58
 async_run_entry_fn+0x3c/0x190
 process_one_work+0x1bc/0x4f0
 worker_thread+0x18c/0x320
 kthread+0x128/0x150
 ret_from_fork+0x10/0x20

Fix this by also removing interfaces with the NO_VIRTUAL_MONITOR hardware
flag in monitor mode.

Failure analysis and fix development was assisted by Claude Fable under my
 instruction. Validated on my ASUS Zenbook A16 (Snapdragon X2 Extreme) and
QCC2072.

Fixes: 9d40f7e32774 ("wifi: mac80211: add flag to opt out of virtual monitor support")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 net/mac80211/pm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/pm.c b/net/mac80211/pm.c
index f63676c44853..503c24cd2e85 100644
--- a/net/mac80211/pm.c
+++ b/net/mac80211/pm.c
@@ -151,8 +151,12 @@ int __ieee80211_suspend(struct ieee80211_hw *hw, struct cfg80211_wowlan *wowlan,
 			continue;
 		switch (sdata->vif.type) {
 		case NL80211_IFTYPE_AP_VLAN:
-		case NL80211_IFTYPE_MONITOR:
 			continue;
+		case NL80211_IFTYPE_MONITOR:
+			if (!ieee80211_hw_check(hw, NO_VIRTUAL_MONITOR))
+				continue;
+			ieee80211_link_release_channel(&sdata->deflink);
+			break;
 		case NL80211_IFTYPE_STATION:
 			ieee80211_mgd_quiesce(sdata);
 			break;
-- 
2.55.0

