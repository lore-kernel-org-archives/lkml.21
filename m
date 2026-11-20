Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173522;
	b=WL9SO2tLczHFr3pmrQMtqpiLBad2xXjjE0NKHrCnnA5KWnxkbZBPjvLhz53XFE+jBZcw
	 UCuKUlLQ4KGARg8dBTWL3W1JOFYQKCnkd32tn6rWH8wLuH3XDdtRT/mNVWi+bQ8eTip8A
	 2mD/WCCOThB3To2djQyPRxbv2IigUMAPFF9tF/Ko3cudKMR6xUutzdhhr3TceP3rNbj4h
	 H7rGQ7fwIIw7RaVHM1KffeT1eM67OnbYWjXem+B31j9Nb26dss0MNqsLwvLSEZVJzs7VA
	 7RyoymAmBfLun4MiesrOEleYPJEqw7h52Xgk1BrViawg0fy36SWH+x07qRQM+H0cDCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k601JWrAQP7gZSxEDk6d56SMgqLV0ht9a++a4PXuy4c=;
	b=LJIU4g+pAxlmO3+V4Sn6NjzgUZh6E0+s8Wl44XGWteeO+rEmbjwTkh1sVJEZWjsry6dh
	 M0K/uf+KOVsdw8YbeYV9f0U86FNiVtt67P1tSgj8UQtaATBj2CFEknjbsGAD2rEHAOOZW
	 5tTOfDPdh57FWVrQDLtUcrJUyzIeSD6bTHXH/vnYbDR2Y2qdZqTTBzYwSSeqMPwOdp2pt
	 EhQ5F0+0K5Fttw6uWEUhSnLISAcREiXcA2f7x3ZKs8LSS3aVmal80b/6WoA2liX4qF93r
	 QGLHDNnkLUlwZegcuV93xGT7Nt8LfRXFA+FPlXfGrFBkjYbBJvAbOn9Ge+JqYLRnCUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahWN85vH;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D786260A2605
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D786260A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahWN85vH
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so4928645e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795173520; x=1795778320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k601JWrAQP7gZSxEDk6d56SMgqLV0ht9a++a4PXuy4c=;
        b=ahWN85vHWoSEM4DwR9HOuN6FXWVtZUo0NPR4Avhttfx05MJ+e1d8qN4SiG5sP0qg5n
         U0ohEYbbXXXMuP6pZI/UCRHkJApTF4Cj9SGyYXNC/nI9kgXAx7Aucqs1wQ5jVfBVoh3P
         YqEdWI3IDAfvefQ27XsIjFRjcR8jC05OVmDoMFSNKWhy76qjq/E63ywDNA8LyUulORnp
         flIQDzvkQgucbmmQZtBVeOToOwCj4a7K7vt50OOYkf/Oh+FaUYNQVkH6siWVcDdHaXUz
         ACgnkiqOOkNyHWkgaLParD2vSGGxzcIsWof+jKVLRSszSSEL9S/xZ8i8LqJ/4PFSimJr
         zr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173520; x=1795778320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k601JWrAQP7gZSxEDk6d56SMgqLV0ht9a++a4PXuy4c=;
        b=emagQdL9tpjf66KDKVgmG+uaiR0Fz0V4HIecj5RVOTtGemg7TKBuZiEsTOUGtqo3BG
         M9xVi0FFNBRQWuPXDdZRFk8EJ10FQiJ0dptMKMZH9IrgjHhdqt9lUWsL2kexr89jkWs2
         ctjLplLw0joCnggW7D/EhTbAV3UuIze7uUEUInnfBq+rYHlB09tJRwcJqBS0rNMFjg20
         yeNacTPLemFaJGCeEjpF/tiZkfQMB/qosAMm3IWsHZiwu9IysZ+APNwTYrIyUrAnQ3QY
         awiObZFLq2kGQSnOla9CS00AWUcwkRK+gnzrMP942ecd1ezp0S4YZeyU6e9NUxVSZjjq
         nfHA==
X-Forwarded-Encrypted: i=1; AL+hErE8pq6WfiOT2N2Y3duCnatfXj0DZ/zrsYIzu6v22kdjpE+Bd85SMdzgqIKp2kb/Xsi9/dJxmlhmofp1Pf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6fVLCcROjZiiInwVOF+G+Au+l1C/JCBXVJjWU6Bwkt+SJCOPr
	mA6g1pC5c6AFvTf/oURqzW8455zdpm4lI/FV34a2cR91ov93zsoc4Ufw
X-Gm-Gg: AYBFou1AKRttqqKT2DtEH7qflGRRakieg+v3wACpoSlGqxoFHDn7juZyRwS6X+QdWYl
	W8nQkTBiNAfZvc4iXenZgjsuLrhRSmoljUT98gSFHt3LT9RN83eIAVFhC1pk9KDWWz86ZRv9mCL
	7xhvevZtOJC7oAmQI+nb6igexOSpGMwW+8Gnjsvh6cQ8GItXWWFQEftItEhw4V4ft9caVxG1yoe
	Yqhf1Yp6EbOMVK/LUMsHuDSbjKTunL9e5tEacD7GWZFjXviLfCgL/F0AId24prz4OgO+U++vlxi
	cosejq4nyzH0brh+wbnGELR7O8ahgeJO10ujY8XGHfIFjrs+axmN9OCvzc2WNhTajHOd4ncrJ6G
	3a7osc1ig2J88Gzg38OCgUsUjcA1rtTtSuK7oUtFK2eA09/ngPPje7h8BGdnEb9Ya/3HEs736Dl
	YoqoPxT11XynI5qZiUKuvQIMKNEgUAUWzSeVK9B+IJRxneNPzEi8aFRP8Ne3F7RKr9eYVeRFZWs
	ARoeJKNJhdfnR8geX6l8jey0fS1xnR6MszCfvoxkmxpkx7UQrWQo9VtL4vSVbPdMy8xLkgnbbKY
	DQ8EOD1prfUlgh3plxxwSUA9sCqhV4GIJb1LeTw/WimCXo8oLbNO9PJ9/26P8fL0xqg0Oy+QHw=
	=
X-Received: by 2002:a05:600c:820d:b0:4bb:6cef:d14b with SMTP id 5b1f17b1804b1-4bb887c34f1mr65783585e9.2.1795173519913;
        Fri, 20 Nov 2026 03:18:39 -0800 (PST)
Received: from DESKTOP-OL07BOP.localdomain ([87.116.183.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm4985562f8f.3.2026.11.20.03.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:18:39 -0800 (PST)
From: nenkov2004@gmail.com
To: linux-raid@vger.kernel.org,
	yukuai@fygo.io,
	song@kernel.org
Cc: dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	magiclinan@didiglobal.com,
	xiao@kernel.org,
	neil@brown.name,
	agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	syzbot+8b22a0459202f76b4096@syzkaller.appspotmail.com,
	Hristos Nenkov <nenkov2004@gmail.com>
Subject: [PATCH v2 2/2] md/raid10: Preserve recovery flags on reshape abort
Date: Fri, 20 Nov 2026 12:17:57 +0100
Message-ID: <20261120111757.4705-3-nenkov2004@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120111757.4705-1-nenkov2004@gmail.com>
References: <4d13edef-f454-437b-8910-3a905697303e@fygo.io>
 <20261120111757.4705-1-nenkov2004@gmail.com>
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

From: Hristos Nenkov <nenkov2004@gmail.com>

raid10_start_reshape() can fail before it updates the recovery flags.
Its abort path clears the entire recovery word, including the
MD_RECOVERY_FROZEN bit that dm-raid requires until raid_resume().

Keep the recovery word intact when rolling back reshape setup. The
preceding dm-raid change clears MD_RECOVERY_WAIT on failure in the
caller that set it.

Fixes: bb63a7019df9 ("md/raid10: resize bitmap when required during reshape.")
Reported-by: syzbot+8b22a0459202f76b4096@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8b22a0459202f76b4096
Signed-off-by: Hristos Nenkov <nenkov2004@gmail.com>
---
 drivers/md/raid10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index 066c43154..1fd3f5f4f 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -4490,7 +4490,6 @@ static int raid10_start_reshape(struct mddev *mddev)
 	return 0;
 
 abort:
-	mddev->recovery = 0;
 	spin_lock_irq(&conf->device_lock);
 	conf->geo = conf->prev;
 	mddev->raid_disks = conf->geo.raid_disks;
