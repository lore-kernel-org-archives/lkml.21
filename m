Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675893;
	b=wBP7O1gnyocb+WP+DdNAQZiEyH290dJEgODGudS8vdh4asGp28vD05eWfiMaHq+sGyUd
	 O4I+Uto9Xw6Tfhgmzo9uOAWXT6iN1JQnLG3/seMHYpCrrHX2q/FFRDaT8aTxvLRbBiuqy
	 MNQkYFqsbT9ardanQoeMmaHIb8thOshd5YgbnIOCIri6+HUm3zJnObQDfxWz/og6cZd3p
	 8bHs6EU6OyxyW+IFuHnrcCEqmmZOvxTWGTiK76zSKrM/+Jv0CiW2ftS/0WADccx7GAED1
	 hkP08p1n4AxxEmghIkxjyCsEGxA3H1Mfxn/jTnXgWAKMxRmm9H4fqnABpolwdttWwjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DHCozN9JrY6MiRB97cSuDVSXqa+xnjEHMUFjC66r4DU=;
	b=Bpo55I7K1HgGwf4/iE9HZtTiIOr1UaTb662U7QCpO39MT8c7X/WejaEA5qjpC/zsyFwf
	 7bjKOyXgS5kmCAt/YqfDbq379FZg54V0fQfVaf3VRDwvt/Znnk3cgAcQ/X6lYsOka0Zja
	 2ZtIolOc59uCBDSccKsFK1EktZuegQ0BW9/vnRKikCZsGnnPmXBXW8IebmTt/fbwuINUt
	 OahtdUSWTOR0AeQlnaLFpyNZgEuHFAzxAMdrcCxT31fxcCWMPQci+75C2ftb89fuvSLMa
	 uHfWcOhc6pCeoSgrbszUlkFlRIbJtm0PnDQbzhnAHoThVdpd5MJoHT0HWxXAPkgYOxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xsz0lj54;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2A4606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2A4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xsz0lj54
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso4005118a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675893; x=1796280693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DHCozN9JrY6MiRB97cSuDVSXqa+xnjEHMUFjC66r4DU=;
        b=Xsz0lj54hemFxEugLEh4i+luJJOrVzu1WT1KQ7zX28IPjRlTmpQTc1sRaOy09bpVnT
         isdNYUH8QgxR0p/qLUpgP9VvPAKj4wEY9AKT2RXPKwSr1tzwFvHcT+df5kN74UvHp/5Q
         PvAtHlVRMkg5dwyKLafWdjEhaBCwx1xsOjL53M1dCzfIBk2xVqyUZEkguQVEG+lzzIp6
         4oVkp+Yv861irG6y3YgBpW4+MCHYV69Cv/a1bj9rHnbAX+0DxW6cCXxqHBAnxCuGUDet
         c+ZnPqLcOWNh6V16F8Q8546KVOWKvfBCTdv+tQ8xgxYmn35nSVNAq3lOrwrMesxMEYdY
         YPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675893; x=1796280693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHCozN9JrY6MiRB97cSuDVSXqa+xnjEHMUFjC66r4DU=;
        b=APE5E0nco0OKV+NCASgZOc940cjE+AvaPjOaxRpWhQ3UzK6FlHCqg1W/OYxSiZAiJD
         XcByLhI0CUADCYJlbzHYNaLoy6TpVN3EFsQN/fpJzgGOKkVaIwzh8bs+nZYNGRfEk4+n
         0F9xGCx+MXLOp1aEzUfBZggev49KPMxGw1e1ErNx38RWxWtzYNNGWwmHEHWkP8D/xkLb
         +6SZvc9j36tTaA4pwV/U2lyAblU1193nIST+ol4VUH3WgkXGr2F6NISk381dkTkCingL
         1JIVSpRB48IH6tKIIxzTp0aUO3tSeyN4r7ytsx6DPb7RM2yrwXQxexRmdI6ybxHtcFDz
         OtLw==
X-Forwarded-Encrypted: i=1; AL+hErHTtqeRXr4frRFpno4gug/IhgcJhjsfZD4M/yCy1tUNePbdEv7SWN/dt/yUqU5Q1RN+OIQpGhU0X4q5Hfo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eXy2Qg7kyC9sfKNO2bBUvJlur2QZ8slSb00rlX1lhNfhI0kh+
	qcvzaaSnynKL/dJJNLz3YLIN3pwnyqtBb6W5Wibk024if5fAFNVx3EeI
X-Gm-Gg: AZFdTZe0BJuhz5SdPtUIPQyjT8dP+mtjqPklGWh5j+RFFSCdwKFpAeKyZCaOr3w8Uwl
	bwO1ARQNbgxobiVM9UXiCmK/NCOnOfaJITVzvbqeReUiZg3VJzFso1GbbiBMpOfwRRlGchpUxtH
	iC/ledG86XUDjppdm8yIHYxgIh1fJ1nCI1/hFcY4CTmqhyhJ5w3G5KDLRrVB6Bt8GdQAkJlZ9dV
	iDcG7QKdr+N06WNHxdBDMg0TuDPcTpAut0cTIPgn7FAnaJN54jEw0/dqBxi8MMuDBupPqAypMq9
	V8kBGau2ROPBatmFjSAff7c5VhuL853uluWpIy3GDzS9KiUHiOrCuVOwMWSnagcTmbPoN6XjR9H
	YRh7xp1fDvXxmaO7nJ3o4UpJCp3E4VJtHEKudjUWntEHh2r3DGFtbUOR7OsOxjYlacKhBjemGc6
	QP4aHtLCR3MIbjhUTRyJLmaBmyJoen9Ooywsjx7Ax2yx+9ZVIzY9QDUJM0Ctc/USEl8ZlaLrHTI
	ZRE7cQbxKQ6T1bBZJOLvUdxSRlgBdONjSMlg8ZXv/SoAzGZYFLhLKUXhlgTs882Hz4f0tCogXta
	s5Vyk4T0CAnQK9TTVanJDuVPDsK4u/Sp20/wqtQ9Mu/zvB8qk/NPqQ6ZkDwRsiYqAwipxUv3NJM
	fksVjnf8zEmzRcwp/cIS0Uo3lpr+/M4NOhv/sK3NYI2eTytSYU7S5LrdYSk0sNj9x0Wr3IehPxe
	TD3jkpfvggQuDvaq3gGF3yRKO8wCg5GPMW4Uk3yBNn
X-Received: by 2002:a17:90b:5907:b0:3b5:29e:11b4 with SMTP id 98e67ed59e1d1-3b5029e1464mr2945413a91.44.1795675892739;
        Wed, 25 Nov 2026 22:51:32 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-3-38-183-164.ap-northeast-2.compute.amazonaws.com. [3.38.183.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm15377795a91.10.2026.11.25.22.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:51:32 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: jgg@nvidia.com,
	leonro@nvidia.com
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] IB/ipoib: re-lookup mcast and pin ah across lock drop in ipoib_mcast_send()
Date: Thu, 26 Nov 2026 14:51:25 +0800
Message-ID: <20261126065125.1082-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

In ipoib_mcast_send(), priv->lock is dropped around ipoib_neigh_get()
and reacquired without re-validating mcast. During that window,
ipoib_mcast_dev_flush() can unlink mcast from priv->multicast_list and
priv->multicast_tree, and ipoib_mcast_free() can run
ipoib_del_neighs_by_gid() and ipoib_put_ah(mcast->ah) before blocking
on netif_tx_lock_bh().

When ipoib_mcast_send() reacquires priv->lock, it can attach a newly
allocated neigh onto the dying mcast->neigh_list (leaving a dangling
list pointer once ipoib_mcast_free() calls kfree(mcast)) and access
mcast->ah after its reference was dropped. Furthermore, mcast->ah is
dereferenced after priv->lock is released without holding a dedicated
reference when neigh allocation fails.

Re-lookup mcast with __ipoib_mcast_find() after reacquiring priv->lock,
drop the skb if mcast or mcast->ah is gone, and take a reference on ah
under priv->lock across rn->send().

Fixes: b63b70d87741 ("IPoIB: Use a private hash table for path lookup in xmit path")
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
Found by code inspection. Compile-tested on x86_64 with W=1 and KASAN (drivers/infiniband/ulp/ipoib/ipoib_multicast.o); not runtime-tested on InfiniBand hardware.

 .../infiniband/ulp/ipoib/ipoib_multicast.c    | 21 +++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/ulp/ipoib/ipoib_multicast.c b/drivers/infiniband/ulp/ipoib/ipoib_multicast.c
index 379b783..81393a2 100644
--- a/drivers/infiniband/ulp/ipoib/ipoib_multicast.c
+++ b/drivers/infiniband/ulp/ipoib/ipoib_multicast.c
@@ -792,25 +792,38 @@ void ipoib_mcast_send(struct net_device *dev, u8 *daddr, struct sk_buff *skb)
 		}
 	} else {
 		struct ipoib_neigh *neigh;
+		struct ipoib_ah *ah;
 
 		spin_unlock_irqrestore(&priv->lock, flags);
 		neigh = ipoib_neigh_get(dev, daddr);
 		spin_lock_irqsave(&priv->lock, flags);
+		mcast = __ipoib_mcast_find(dev, mgid);
+		if (!mcast || !mcast->ah) {
+			++dev->stats.tx_dropped;
+			dev_kfree_skb_any(skb);
+			spin_unlock_irqrestore(&priv->lock, flags);
+			if (neigh)
+				ipoib_neigh_put(neigh);
+			return;
+		}
+		ah = mcast->ah;
+		kref_get(&ah->ref);
 		if (!neigh) {
 			neigh = ipoib_neigh_alloc(daddr, dev);
 			/* Make sure that the neigh will be added only
 			 * once to mcast list.
 			 */
 			if (neigh && list_empty(&neigh->list)) {
-				kref_get(&mcast->ah->ref);
-				neigh->ah	= mcast->ah;
+				kref_get(&ah->ref);
+				neigh->ah	= ah;
 				neigh->ah->valid = 1;
 				list_add_tail(&neigh->list, &mcast->neigh_list);
 			}
 		}
 		spin_unlock_irqrestore(&priv->lock, flags);
-		mcast->ah->last_send = rn->send(dev, skb, mcast->ah->ah,
-						IB_MULTICAST_QPN);
+		ah->last_send = rn->send(dev, skb, ah->ah,
+					 IB_MULTICAST_QPN);
+		ipoib_put_ah(ah);
 		if (neigh)
 			ipoib_neigh_put(neigh);
 		return;
-- 
2.43.0

