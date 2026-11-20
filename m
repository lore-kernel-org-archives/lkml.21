Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218861;
	b=ID3DT5ELZ2iYzu/Rl2P/sNO1x1xwwzaIXaAHGMczhAJEAiEAZ18ke91PYPp5mtbT2bAL
	 PWCNSqkydnub8a2ta8rXmk11nM/RBe3mrt1EcMdm12SKcMB3RoSxdixxh2Vo40tni9bD7
	 kGBCX92EXo7S154fUaz+BhVe6HHiPsTFwu6XbdkYPBbzMb57E+DlF8p+iVCRMNyvpcznB
	 QZXgGhRAn3M0VZMFEjwE8LOaMyhgrk+5yMaeAHCd1iCM7PU7Lt/iPIr+MenaQT2+ZLgDq
	 6Khs6/x4UerEPe1M+gNABzWUaQG/vTBV06PWMTt1OW36EDVGF8WI4dzS6QXRsTQZLhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xJPZl5evGP8F6MuKELplPvTbH6ZVugBq2XkPlqpVuPc=;
	b=N/ocSg0N/kHjO2qJkX14zTkjxJmDozzxEmfIp/CqVU3Ec28kWcdHkfsiOlhaITV9bdUy
	 K6ByrqG2ICGqyZjz/Bu6ygKJ+3Qukmo5EiJ+h8Er1uzWiXI7FPJ6v9G2awO5ep21BDfUI
	 8rmqJDD4lSeRTZRy+zUIhkur/Gu3cGtSC0dFOYLnT+wjKO6M1gVeh2q7Z06GQHHOl76Bv
	 vm+tI+HsMbhyettEDxQNhB+uj5d/mw4cJO5h+f9DA6gsOi4vozoNOLsbLrWLfWEeJe8ih
	 dJ4RSGBEXxshy1xeJ5AddpoTTcD0hp+xxZZNxpZ6XnDn9N+Ud51fRag2itfsBD3I24A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+ga714s;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E16160A2604
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E16160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+ga714s
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10524175e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218858; x=1795823658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJPZl5evGP8F6MuKELplPvTbH6ZVugBq2XkPlqpVuPc=;
        b=C+ga714sQWcJdkw0Xpdg2OlXKFgsE8ih8EnKXfjHIv0+JuGV5xpCD2uDyzNanM9Bm8
         2yBgqByvdJNQYsQ2f4dULNyK4jgCwRB4kTTrzugaItKFVLNkEhhV9wRYhUX9VDGFntJB
         hl3R5h+10CFCz8QSO2aHex0Y/B3s6zAHBUYZ2QBE+jphNfredA2I2vfUU07hywqWC79Z
         bXm1tbuYqjLXo9FYW8gBtxuJNzmJBvLEF1LOGDcz2hOOcOeYOWhhrTjyGMnV8/qUn3An
         j4Ozf+n12qMFyCOW1aGBhZae/fD97XB1N4cYsX7tN90dVVWYSTFrTXIhrdXH9AWR2OZt
         hJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218858; x=1795823658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xJPZl5evGP8F6MuKELplPvTbH6ZVugBq2XkPlqpVuPc=;
        b=Eho2BUSBMGyjDBZK1ejc3hCjiW3wGMqgUp71LlfFPvJtfhYJzAY0pdhn6+v7RpD+7O
         chP3OvILz1OItK6jVy0Yy81mKQeQxBjnixWKnwhuIz8Q+inbZXXYb7NQGZNTIs3Q9jZK
         IU7mHau655zGklvOnVesFNBuoLpi2Rs92ccrL5H2+msEC2JsFUAX3vuCDNlj6qaPQgTr
         U6+yxMCLSZK0DN7n7QPqIyN8QU4/emtLpzWIAehl5AlYyyz/um1afJqyK9EvkXFdFWSi
         5/0cTNViHiIdCnQAlmGm4ksyvGFTfDABLLfHGJ9PtUoGtk4asrpmoXkzBz3a1YVcQlif
         uraQ==
X-Forwarded-Encrypted: i=1; AL+hErEGqqrN6VDmleobeWwl3tlLXXZeo0PN9p8faQyy1dIg8yhGHVUrS6XcoDTCSprqXe1DkicpPUAR+Sh+0ZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SWIJz40DPhEmMvZyif6sBGgypvg9rJuobgyxeI7UBYyY2M2xg
	2E6cuCdCISxFbJ5teUg6X+yMcm3XDlZjNmXWnQ04ao7hOuO0KVdVCWo=
X-Gm-Gg: AYBFou21GfdmoGSeb1HTYsKUdhfBOXlGeBcxe9iEhEdTvOp7JG2Zx2K7+q+WrhKIlCX
	3YJQ8ZZ2WhQU1L6chE7FEWrXyWq3gglSuLgpu7QQ3Hn8454QN2hotKr6iiSSNAg7X37enBwRWuc
	8KjS68tgtIHu4BDzJO4CBdWRx7PQiToawFc3BY+5f/46SdgJPZ2LeTNlygCsu8JRkdCWY7ux8t+
	LGkcXNKeOspsJIzGJbuHOyFKHzuGtCy2VYD94DaGC4RJwvrQyl1rToJBZvnldBwieB0bWOUjKg7
	VONXC00bpYe18bQ1SmozFbNqf9JkbkWuZIRPgkts1axhVLrEYM5b7d1bKlpqGRdfLkNaOx3FFuW
	KcrNh5AX8QPzMQWwxxLu3XwsezAMPhFtLzDTqwUdtt1lK6JYxq8LgsV7/3eqHF8zQty3/31/k5d
	lSmbGkWEWFUGFQUjHpm0eg32kz/+fRaecdLQQ59PZFwcAIGcq29sMT8jW+gAmwLGOcGzPasa6vW
	nSMOg8WF2fcl51jMHfuDBRGwM10Jrk/CPOQYPEAf4gTqCbewJOZ1YkRC/F7Jl8J82OnohKNqe7S
	7UJT0f4nvApwfAc=
X-Received: by 2002:a05:600c:3547:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb888098bfmr104741775e9.11.1795218857727;
        Fri, 20 Nov 2026 15:54:17 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm29426445e9.2.2026.11.20.15.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:54:17 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	Paul Fertser <fercerpav@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 net 2/2] net/ncsi: defer free of removed list entries to an RCU grace period
Date: Fri, 20 Nov 2026 23:54:07 +0000
Message-ID: <20261120235407.1911365-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120235407.1911365-1-tristmd@gmail.com>
References: <20261120235407.1911365-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

ncsi_remove_channel(), ncsi_remove_package() and ncsi_unregister_dev()
each call list_del_rcu() and then immediately kfree() the entry.
Concurrent RCU readers that found the entry before the removal can
still dereference the freed object.

ncsi_remove_channel() also kfree()s the channel filter buffers
(mac_filter.addrs, vlan_filter.vids) while the channel is still on
the list.  An unprivileged NCSI_CMD_PKG_INFO caller walking
ncsi_write_channel_info() can follow vlan_filter.vids into freed
memory.

Additionally, ncsi_unregister_dev() frees all packages and channels
before calling disable_work_sync(), so the work function can run on
already-freed structures.

Add struct rcu_head to ncsi_channel and free channels through a
call_rcu() callback that releases the filter buffers and the channel
together, so the memory remains valid for the full RCU grace period.
Use kfree_rcu_mightsleep() for packages and the device structure
which have no sub-allocations accessed by RCU readers.  Move
disable_work_sync() before the package removal loop so the work
function is quiesced before any structures are unlinked.

Found by manual code inspection; not triggered at runtime.

Fixes: 2d283bdd079c ("net/ncsi: Resource management")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-manage.c | 28 ++++++++++++++++------------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 2c9d1f22c16a9..2cb1cf653164c 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -239,6 +239,7 @@ struct ncsi_channel {
 	} monitor;
 	struct list_head            node;
 	struct list_head            link;
+	struct rcu_head             rcu;
 };
 
 struct ncsi_package {
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index ec7c0d8cf3d9f..d872351d40245 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -242,28 +242,33 @@ struct ncsi_channel *ncsi_add_channel(struct ncsi_package *np, unsigned char id)
 	return nc;
 }
 
+static void ncsi_channel_free_rcu(struct rcu_head *head)
+{
+	struct ncsi_channel *nc = container_of(head, struct ncsi_channel, rcu);
+
+	kfree(nc->mac_filter.addrs);
+	kfree(nc->vlan_filter.vids);
+	kfree(nc);
+}
+
 static void ncsi_remove_channel(struct ncsi_channel *nc)
 {
 	struct ncsi_package *np = nc->package;
 	unsigned long flags;
 
-	spin_lock_irqsave(&nc->lock, flags);
-
-	/* Release filters */
-	kfree(nc->mac_filter.addrs);
-	kfree(nc->vlan_filter.vids);
+	ncsi_stop_channel_monitor(nc);
 
+	spin_lock_irqsave(&nc->lock, flags);
 	nc->state = NCSI_CHANNEL_INACTIVE;
 	spin_unlock_irqrestore(&nc->lock, flags);
-	ncsi_stop_channel_monitor(nc);
 
-	/* Remove and free channel */
+	/* Remove from list and defer free until after RCU grace period */
 	spin_lock_irqsave(&np->lock, flags);
 	list_del_rcu(&nc->node);
 	np->channel_num--;
 	spin_unlock_irqrestore(&np->lock, flags);
 
-	kfree(nc);
+	call_rcu(&nc->rcu, ncsi_channel_free_rcu);
 }
 
 struct ncsi_package *ncsi_find_package(struct ncsi_dev_priv *ndp,
@@ -326,7 +331,7 @@ void ncsi_remove_package(struct ncsi_package *np)
 	ndp->package_num--;
 	spin_unlock_irqrestore(&ndp->lock, flags);
 
-	kfree(np);
+	kfree_rcu_mightsleep(np);
 }
 
 void ncsi_find_package_and_channel(struct ncsi_dev_priv *ndp,
@@ -1964,6 +1969,7 @@ void ncsi_unregister_dev(struct ncsi_dev *nd)
 	unsigned long flags;
 
 	dev_remove_pack(&ndp->ptype);
+	disable_work_sync(&ndp->work);
 
 	list_for_each_entry_safe(np, tmp, &ndp->packages, node)
 		ncsi_remove_package(np);
@@ -1972,8 +1978,6 @@ void ncsi_unregister_dev(struct ncsi_dev *nd)
 	list_del_rcu(&ndp->node);
 	spin_unlock_irqrestore(&ncsi_dev_lock, flags);
 
-	disable_work_sync(&ndp->work);
-
-	kfree(ndp);
+	kfree_rcu_mightsleep(ndp);
 }
 EXPORT_SYMBOL_GPL(ncsi_unregister_dev);
-- 
2.47.3

