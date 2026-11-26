Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700545;
	b=TMUPlPyrcEhv8tTCIr8nlSYak08pXN2PgkyPlFheDz/ORL8ROjUD7L8L3ZdDKu49z2Nl
	 KWzyl3tEyKEryfqgcMWcCoaZIaxjzyIgOJQY+Zbe6SnHkj1tTSZUIeGL25b3o8v7jkFft
	 q+vP9rM35G8K041rvFjRxhUN/FVOj/Gp4guMiir8Q0Dkqvs45Zd4EXpjUYWT+R/XLkG25
	 T7vxRB/jg7y0NNre01amlJfw7UUVcCibMwsKDxzN/hgAdYQg9YNBMH4DUGCXWzrrClx3H
	 OlAAqLDceGi7IFmc81Qeijkqgp2+qC6xHY6wEJVyJJU/xBEh2F585KL5cNyfpTqc9Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NSvDUdhiPsT9wujlLJTCQMGtMq3JsdUlTo3B/+Qtxs8=;
	b=eHfIHS3BFh1kD1/iOog3fyuGnIALwTkC9iy5AHw3Vg7JNJS6DpRWaHcGg310wlMBdSJD
	 wkHhB9AsO29608l6UchZaQ6TmJxVz7SBRjc1hczSOKVbyz5pPpQ2wNgllNC7WfaRiZylE
	 xp5hBhHcmSBQehKNGhBoA/dZ89DjRtC74tXVVqO7WG6rHYv5WqVlg1XLJXs/sbTsJQWnp
	 gVzU/Kg037WyWITMMWNR+k8HaTcXNJhyM8c2NnOuke3bpZcaCAVZFl0jne3sRcqn/ni13
	 caHydsiKRw/SRurO9U34ADEH/w92emHeh/DAkAvtvNoGjjJv4z0Ev/EQQizTP0o4avg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FCUZiapw;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B58606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81B58606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FCUZiapw
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f0414c1062so42807375ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795700545; x=1796305345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NSvDUdhiPsT9wujlLJTCQMGtMq3JsdUlTo3B/+Qtxs8=;
        b=FCUZiapwgCV0NccPRLyMCz4v4T3XpjsQ58JWuphME0mUW8OpcSdTyNG/jVc3LUuJeG
         dH79/1sR2huCmlp+7eUAAg2rfvZPvZhtpYVZq/9ug5QRHVjg55ZnJBko7FkuNdIPVMhF
         HOa+dPa/fmrCXJadGANy2s7Dqjo63MxwR6elwkxJhc9fCc3oSoeJ4GYWWFm5qeB5aGCn
         Bqb0sm1NQXR+/7/3wmYqvv8ZAbJYkeDivTZZdTQIArstf2JiPgIzwQ/RYXq7CQPGg+mh
         jgAD0iMRtkuetLcq3g0OpUqK0Bl8yfGXCF5bnJuiXiN+mr8eFBNeJEyQE/0Vr6uilDae
         pYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700545; x=1796305345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NSvDUdhiPsT9wujlLJTCQMGtMq3JsdUlTo3B/+Qtxs8=;
        b=zg+MLM98wO6Q/Hoh42KOsab02kH5ps2EuRCemyEXkm5kDuSrqWNK7Fcxi5Fx1U4hBw
         4topPcq+CFdMvVMWBaGE4goV8kjbXCrDIZB4ZbKYMvYYOSeK5seVMKYHZg96XTzdPtl8
         17IJh7a1xy+bSBCdQcgENDs+Z7Y73iP0hr5FrQBct4GyfQ51X25o8nO+4BUTOVkSOeQi
         8yLjrGM0mcGHnKcjmIuT7Q7tVr15lTgunl5LNUs50W54NKBBQPq8ecQBm4DSYKKfbsql
         M6b8mNYhLdLIx4z/ARO94ASEKipZ1x65JTeDMq7NuIYWOsEs9kgWnhSH/PtOBaxQUNyy
         xH6A==
X-Forwarded-Encrypted: i=1; AL+hErEuoOSSg+qTCmvlf/5VLATaCPPuow37W2nc7JVYKYioyV+e+AHG24TcZDczOS/xozYC+SJCcAxdnrtYJ/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0C+cvgWcXCWx4W6Rv6K02mQ7Vwtz4kommilPxvGj596HXVwUz
	M4K/94xkoH72TycfvSWzXnAaJOiFvR1vUAGjkaMa8EJ7s+HesSJtdvk=
X-Gm-Gg: AZFdTZfOoABz7SeuVzhnyfMmRORoIwpgzKJK/jDzhcIdqliD+hAu6DEzfPh6oenA2Fi
	KFd5I+GDJS3KdrNyl5gAtraOQQxSZQSWl9S3Fc0TRR6adoowl1snw53gkGO3WqVtbegbnQ5UetD
	E3k1yIaewDvn0M7B97b0SUGvHoZ0GICFIS4GhLea6fRnTnkAcPaa+7UKdMYTaw9C3sbGeF6qtDW
	kW6PZR/5AqBHixn/msf1pe2f0Y1XW+sjYjaX6tjrO2LsifFlBsHg2yIqAycCf7agLJDhPYy9oiA
	NBngaMbP5nOJwuyJdA5hFqwb3/fuftHVtLj9NnQV314rCDa4zi0Inc17A1HpvPHYo2his3HOIL8
	c19LXpqN7ahX59s8O+PlhGhZCie2hGXgDU16ED7TvMYo/tbdlvZLTPJgNbv+gRVwc5Bl6A1mQyA
	8MRme1ZbhSrfs9VNEx4ZvyZvX1dGDJ2rplOfzxCUK9Tba5+QqGGXjjmNeUvrqfV3+GaCqSa65Ru
	ALgLekhcaoxO8vYuxyZDXrgpfffQAlB5ZkfmFk+c6W20M7s0vNdp/dZdSh+uDV5V0OlM1VKeJ3S
	xilSAzfMyBdZTTdCaTXs/ypdBtzkwJvode+6+VJ02GptaLhmq0QG+OWXGbX19L5JE4s=
X-Received: by 2002:a17:902:e551:b0:2ed:ff4a:6d21 with SMTP id d9443c01a7336-2f03f1beef6mr206550255ad.73.1795700544707;
        Thu, 26 Nov 2026 05:42:24 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm102467265ad.9.2026.11.26.05.42.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 05:42:24 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Chas Williams <3chas3@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Simon Horman <horms@kernel.org>,
	linux-atm-general@lists.sourceforge.net,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>,
	stable@vger.kernel.org
Subject: [PATCH net] atm: Fix atm_dev reference leak on VCC close for built-in drivers
Date: Thu, 26 Nov 2026 21:42:16 +0800
Message-ID: <rc-b1-20261110-vc-164-2a437f3c5ecd@gmail.com>
X-Mailer: git-send-email 2.50.1
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

vcc_connect() takes a reference on the atm_dev, and __vcc_connect()
stores the device in vcc->dev together with a reference on
dev->ops->owner. vcc_destroy_socket() drops both only when
dev->ops->owner is non-NULL. usbatm and solos-pci set .owner to
THIS_MODULE, which is NULL when they are built in, so in that
configuration every connected PVC leaks one atm_dev reference on close.
After atm_dev_deregister() the count then never reaches zero, so
->dev_close() is not called and the atm_dev, and for usbatm the driver
instance, are never freed.

The owner check was added so that static meta devices such as
lecatm_dev and sigd_dev, which were attached without a reference, were
not put. The last of them was removed by commit aa582dc25ace ("atm:
remove SVC socket support and the signaling daemon interface"), and
__vcc_connect() is now the only place that sets vcc->dev, always with a
reference held. Drop the reference whenever vcc->dev is set.
module_put(NULL) is a no-op, so modular drivers still get exactly one
module_put() and one atm_dev_put() per close.

Kernels before 7.2 still have the meta devices, so a backport there
must keep skipping atm_dev_put() for them.

Fixes: 93a2014afbac ("atm: fix a UAF in lec_arp_clear_vccs()")
Cc: stable@vger.kernel.org # 7.2.x
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, defconfig + CONFIG_COMPILE_TEST=y, CONFIG_ATM=y (net/atm/common.o; no new warnings vs base).
Runtime-tested in QEMU (arm64 virt, KASAN, kmemleak) on a model: a test module that registers an atm_dev with ops->owner == NULL stands in for a built-in driver. Before the patch each connect/close cycle leaves one more reference and the device is never released after deregistration; after it the count returns to 1 and the device is released. A device with ops->owner == THIS_MODULE sees no double put. No hardware test.
Triggered by close() of a PF_ATMPVC socket that was connected to a usbatm or solos-pci device built into the kernel; the leak shows once the device is removed.

Stable is limited to 7.2.x because before aa582dc25ace (v7.2-rc1) the static meta devices still reach vcc_destroy_socket() without a reference, and this change would put them.
A real built-in usbatm or solos device (USB unplug) was not tested.

 net/atm/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/atm/common.c b/net/atm/common.c
index 8119572..f68bf8d 100644
--- a/net/atm/common.c
+++ b/net/atm/common.c
@@ -184,7 +184,7 @@ static void vcc_destroy_socket(struct sock *sk)
 		kfree_skb(skb);
 	}
 
-	if (vcc->dev && vcc->dev->ops->owner) {
+	if (vcc->dev) {
 		module_put(vcc->dev->ops->owner);
 		atm_dev_put(vcc->dev);
 	}


base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
