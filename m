Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550022;
	b=A3k3xB3P+0FTQpF7tqxUeX/O6vk8gZpFBCjhrJo3inSyjZlhJ2dp43CYneVIdA9TP347
	 t4gOVIRjegeAYoqYwh292e7tcATeqAN94iwM/U9XIZYZxdZBTxnaXAM6oSKLAd7NWaljT
	 QsC1eMc2GjsY9lZD+uHJFqIliCNbifnSxowXTqkSrmTcYo5sqjIZa63Y7xWZJMyv0wYSy
	 kS8A369bo+7TS9blpDY0yDmgkZEaFZqOE59Qv708Honc5Ryh+tjgXaCg2Ti9f0L137dfh
	 J9lGhsj6/VfSrQ/L/9pMFKvIi+qfY9y6753gntONNZt359pRwO5X1s72IqcUbgZZesg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6HADbYKdu2xT306wyzwyhObff3FiZPnfdL83SuaIOyY=;
	b=i7ZVe/nsoHgh6mDpdGsFAsQN+H3N1WQxdi2alF7En+u3iHOjyt/xPPnZx6eeVWMsrQp4
	 JJv1Nt+KIlFfTCUSQBuASCbE6a+XFOSzHZ2E0dNqTYcGI/b4yMdEPeBUZJ+RMh4LUzphy
	 LDYWYYq73Yl7WOn4O2HjceUvBW6POXp85tp9dQ53mxOQBqxvSzJkCCC2blwCdHrlazbKQ
	 xalsTmilhotsvtKoSp6092S/XKIEeN1fCzI+ACAw2UuYygpn4ae7uaE4Ag6ctcZzZaeUY
	 TaT98B+5pffeWHNPVtErFjgmGSc3jyrlY1IHrGFoPIrDLZuF5vvEF97o/RM9lKf5kkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t1QEptge;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481EE606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 481EE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t1QEptge
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so4067871f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1795550020; x=1796154820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6HADbYKdu2xT306wyzwyhObff3FiZPnfdL83SuaIOyY=;
        b=t1QEptgeWUV5vvPcoMi7KuXUdZ3iJM3BsXI9pLiiSIn1uVRxP+askR9LrNU3F05bRa
         5VmEoZRfanUqd5B6ZZVI/t4lsIFvN+IKyp1qwKuNDQjBkum66ZeOVtKphbs/BzyME6qi
         1TSdHgj6KVKkCTA85aUWDEzEz3XdQCRkYpctqABhSd2Cu+s1bX/pBH0OwRHPKI9jCXf7
         eEHsWy1ullx1k0tQlQZPYNF+DzkwGy2hKp9zRQfgRQTGLt0sf9Lwxgv69HHgA3M4Ez28
         f9ftGdA/9gQSAqU1a2HVbt9CZEs8tx7EzJMWc+5+jwNav0xnBNl8+lgqFNp1/VyV9dt1
         /Fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550020; x=1796154820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HADbYKdu2xT306wyzwyhObff3FiZPnfdL83SuaIOyY=;
        b=cWEDaNeMxF0fXT8kfliG17YyZ3xcLCW5on5O+hc8Lr/jBdhMD6v305j5NJ+TXjcp/g
         QCtyI28OWLO4W0GcI07WwCntSN3Ji7xcck5lGAfvPKKx+aALYBBlirAI/Uhtx+zx09GM
         4I0im+6JAVh9P0OK9o5ZA9YqHdFi2GE46qHwrd/uL1Yc4xHV0iMGKiUam2sDkz8tL4F0
         AhJelm4pemSygLfkeaG7M7Fz1E9CmYaBZY8MaAyVX0ER0ds9Py6Sx6Qs2g6jZK6W72D8
         +ecVRHvboo/MGm9wVz9H0TuLL7ObHn7bhQ7e9dL3EZ56piRLF9UR8xmmWvwwA0DiwQBk
         S3Zw==
X-Forwarded-Encrypted: i=1; AL+hErFSbMM0bI6i+CnGWXp/N8QjxgQcny7gpGZSO4LDurwbIoSj54fXfnQo3iOxESKkkp1pmsk7Pjz+7HlEaUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eeVzvwDGRwu4iz+F6xFzGe1vJe7y2de8WrJ9C3ZP1gWQDcocw
	x1CuzeZxmay2t5FqX/KI3Tz+4Lar/jEJ5wfchN+Cy5PnsZqZ681nK6fg67eZdWgf8NmQ
X-Gm-Gg: AZFdTZcIuDWBUJVlG1y/Xl6T9A1qP1gt6IcXW9H2yiPZtZ0dC5ofyC2gBhiWpjMW9kP
	nWv0EEZwuq5M2zQP+wDqKpEdh7aoRXLzYpwzeQRW+83G047ve0fkLqPxVjA6MK8V8mP4W8GU63L
	diDiqD7N+mS/+pNmoy0BuupMAzPpwQ9Fhj+wHluu1EghyU5n6WH6bwfDh/f0CGLI7a2R3FeaDiG
	cEq5bKqR3oq/o2nqYiwkT6Hsj7K2O6XE2lkWNatpIU1tBwhM60ugG2xxJRx52DONWkWKJP7ccIW
	v3cs8/lx7WDBiYo3oIaJHmE/1ertLjk25lUelreLK3txGA2guuBrLyD1PcidEpn+b68N+PCpaeS
	82DzEGtSMP7Au6Ia4hke2EwqeswWdBbIYVZIcpvnQMEeWmCAYq0iew+tBkRhPaQ2WujRx82iRvC
	kUOj4HAE70I3oYS7gI6XFkLVyFiTS/mwXgQ18wpR6DbE+YsPJOy2Bg49nvqE4OeINRbwEGF71q7
	QTUtNtTqPpdIcMG3m3uTaPnv4xNh5B8HgBlhowbg67dB4ygLELaVyyeTSC+JqYjud0IpRyFbQg1
	WwiJVys+gpv9ueLmLTq0dklzNJaEVQyAsotJ6zJv4zBmIhpPF+g9LgCftveyle9jbFcIk8JoN0D
	koVqBzElKtobTRO0UhWtI732Mki7gucByY6AZ
X-Received: by 2002:a5d:64c8:0:b0:4a6:c5f4:cdf7 with SMTP id ffacd0b85a97d-4abaa976b7fmr28138906f8f.5.1795550020484;
        Tue, 24 Nov 2026 11:53:40 -0800 (PST)
Received: from alex-t14g7.lan (p200300cf572c2800fb4fa6aa0455ce36.dip0.t-ipconnect.de. [2003:cf:572c:2800:fb4f:a6aa:455:ce36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm30245471f8f.58.2026.11.24.11.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:53:39 -0800 (PST)
From: Alexander Mikhalitsyn <alex@amutable.com>
To: code@tyhicks.com
Cc: brauner@kernel.org,
	ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Alexander Mikhalitsyn <alex@amutable.com>,
	=?UTF-8?q?Frank=20Hsiao=20=E8=95=AD=E6=B3=95=E5=AE=A3?= <frankhsiao@qnap.com>,
	Thorsten Blum <blum@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ecryptfs: refuse pseudo filesystems as a source
Date: Tue, 24 Nov 2026 20:53:14 +0100
Message-ID: <20261124195315.105369-1-alex@amutable.com>
X-Mailer: git-send-email 2.47.3
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

We shouldn't allow pseudo filesystems to be used as a data layer
for ecryptfs the same way as we have forbidden this in many other
places like loop, erofs, nvmet and acct [1].

Link: https://lore.kernel.org/all/20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org/ [1]
Signed-off-by: Alexander Mikhalitsyn <alex@amutable.com>
---
 fs/ecryptfs/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index 5f37cddb956f..471d4aff0e7d 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -500,6 +500,12 @@ static int ecryptfs_get_tree(struct fs_context *fc)
 		goto out_free;
 	}
 
+	if (d_real_inode(path.dentry)->i_sb->s_iflags & SB_I_PSEUDO) {
+		rc = -EINVAL;
+		printk(KERN_ERR "Mounting on pseudo filesystems disallowed\n");
+		goto out_free;
+	}
+
 	if (ctx->check_ruid &&
 	    !uid_eq(d_inode(path.dentry)->i_uid, current_uid())) {
 		rc = -EPERM;
-- 
2.47.3

