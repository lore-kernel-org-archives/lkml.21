Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304903;
	b=s0YgUBkwj1+nsQOf8GvOXrIGJjnbPK0PXzUxBLhBwuaztXR7YEhJnqm3EVmJl9QBQwUA
	 C9/9fmxSWkdFqm2qWb5k8c3GdgJ8erXHcQrpDeSWHtstl3mEOHN/DMebSH7IGGAMv1FZ1
	 bqp6zOTv3NJAzQ+YI99okuYjr/1CFtexOesOPhum+eYx3GJAN1Tix7XAM7/jLbTHGUKam
	 d3aL3EdgtWpgbPDiekCl3pORRDHaM206QzvNVhfDzHcyWZNXSELoXtSbJ9Jhvy2+97t2q
	 /E8Yvst+UbiQ39C0qPwFfCXNRdjkBJwn/r7FHagBr7dpPf2y7CecYi83UuKBKnFiqXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:MIME-Version:X-Received:Date:
	 Message-ID:Subject:From:To:Cc:Content-Type;
	bh=RDuG/oqCdue4gGnPB/YmguD4LRbIPVedWxys3SblwxU=;
	b=Vt1phHN1hVGUesP0W5DFoxfeBtSeZebr9gf2xU9z5DCK2hsQC12Kmti0WniEZ0ITGLoo
	 zEYzBa5pG6SmWsukk/XeyDdWZ8b77H9VyCa57L1fiXYO485N/AHpx0lmCbqJlOXX0UkuB
	 o3FxbvzrqXGNffPP3v4zMjTGuoarZozx+0nf7uQaLWbno98zWkpcJlH8TxBa/zh4FaL7v
	 EYeR5OAa5meUkT7SfDfEPk+8xn9DEPQzdGRiVktKUZ+A23LvX/U7+sNUMeTlx4ZWPqzyT
	 3DMjKYN0CBBj6t7DCgmlmaspBz0KeTpf3LHPIl4vWj1ZAXpBE2EJM1AgR37eSLbdx7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--bcochrane.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AaKtuOBf;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4195606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4195606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bcochrane.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AaKtuOBf
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efad644688so19022805ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795304902; x=1795909702; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:date:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RDuG/oqCdue4gGnPB/YmguD4LRbIPVedWxys3SblwxU=;
        b=AaKtuOBfhsiB4ty7mir7taOY4iyI4ezUWWycMl8H3hRfB/STYON1UYG30tfhRpYVgo
         HdQ2an9O0dfe/MzSB064WQuXcn2SF8/UjIXG+s2OQkS10Ey2XI5XmjqvPBYoldWONkKA
         tbqDuCLchi6QJZJx+57znS2Z5Sg2otZ/hK44G27REyrU336+yA41DsGv4clzqaT53FBE
         /5QX11bQZiQDaQIdcrTmifCr0w4PgjxEmOqGSoei6DJ0+2HLgHAPHMhhnBegXt6nx2QT
         MbesRM7rCw1qxiOGrVYzICiep9MbaJ+6Ws58Jmqb+pYS7hI9nqVSSsmhTngO6S2Kbwcm
         x92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795304902; x=1795909702;
        h=content-type:cc:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDuG/oqCdue4gGnPB/YmguD4LRbIPVedWxys3SblwxU=;
        b=ZHr/w21CDXa+cfyemUZi76ktUzKd4/QeqAz6A08bWO+viKLJA1v56d9enjKiW39nOd
         KcY5qNtOwkAct1seoXZ7Y4ltPkO3pyOUSmeNYVO79gb2YgmVMJ1fzRQ1tPEGvZqYV5W5
         WI2JlV9tJpB8wZz+nSP0M27vViPOmkPdWz0hOrruSVyqAegd7nwB/AJauONqjCunO0qT
         t4D1PgiNS2pyJnsDyyvMHSEmXbjCEt7THBip9wDQGKtFgmCCLJo9y99qeYgQSNy+yozt
         MKO+9bui/ZjtnDheXC5DGREEwLhghyu6OL+LTVFpXfe50KOyKUcYBFLPuhBbxN1NSkD+
         cEig==
X-Forwarded-Encrypted: i=1; AL+hErEK1Wgl8c4UQWy9E09JU64Au45OP/Ya0JlUkSWY2pslfdZQlS1gu34y2c3sHHx1R0S7srf9zchn5vwv9Eg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Gh8ZMizb+kqyRkEbUx+BdT/OpYAShWCxa++JMyJoqHvmFu3Op
	vJFX7bojsubjZeuHTboLkeh2Rd8VIZZoc6TDh2+tbQCzJA8ziPBrr78UlzoG5llqpZEkvZ27A+q
	mxgmBgZWd80T/S2ErIQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: from plnr4.prod.google.com ([2002:a17:903:1904:b0:2ef:db3e:d66])
 (user=bcochrane job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:298c:b0:2ef:d952:4a65 with SMTP id d9443c01a7336-2f03f1babeamr71244315ad.43.1795304901940;
 Sat, 21 Nov 2026 15:48:21 -0800 (PST)
Date: Sat, 21 Nov 2026 15:48:04 -0800
Message-ID: <18ea344bdf5a5efb.3137322e31392e3133312e3730.20002c.0000sendgmr@google.com>
Subject: [PATCH 6.18] bnxt_en: Take RTNL before netif_close() when aborting FW reset
From: Bryan Cochrane <bcochrane@google.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bryan Cochrane <bcochrane@google.com>
Content-Type: text/plain; charset="UTF-8"

commit bf83b257423bb557b970df3d7ece32fbd85f3bd4 upstream.

netif_close() must be called with RTNL held in addition to the netdev
instance lock: __dev_close_many() asserts it, and the NETDEV_GOING_DOWN
and NETDEV_DOWN notifier chains it runs rely on it for serialization.

Commit 004b5008016a ("eth: bnxt: remove most dependencies on RTNL")
replaced rtnl_lock() with netdev_lock() in bnxt_fw_reset_task() and
bnxt_fw_reset(). That is sufficient for the paths that only tear the
NIC down internally with __bnxt_close_nic(), but the abort paths close
the netdev via bnxt_fw_reset_abort() -> netif_close(), and the error
path in bnxt_fw_reset() calls netif_close() directly. Those now run
without RTNL and trigger a WARN_ONCE() cascade when a firmware reset is
aborted:

  RTNL: assertion failed at net/core/dev.c (1740)
  WARNING: net/core/dev.c:1740 at __dev_close_many+0x1be/0x1f0
  Workqueue: bnxt_pf_wq bnxt_fw_reset_task [bnxt_en]
  Call Trace:
   netif_close_many+0xb5/0x190
   netif_close+0xa2/0xd0
   bnxt_fw_reset_task.cold+0x8d/0x213 [bnxt_en]
   process_one_work+0x19d/0x3a0
   worker_thread+0x1af/0x320
   kthread+0xe3/0x120

followed by the same assertion from call_netdevice_notifiers_info(),
fib_rules_event(), inetdev_event(), rtnl_fill_ifinfo(),
devlink_compat_phys_port_name_get() and ip_mc_down().

This was observed on a machine in real use with a BCM57504 (4 PFs,
FW 236.1.153.0) running v7.1.6: the firmware crashed, announced a
"Fatal firmware reset event" and then failed to come back within the
advertised max wait, so bnxt_fw_reset_task() aborted the reset on all
ports:

  bnxt_en 0000:c1:00.1 eno16905np1: Firmware reset aborted
  bnxt_en 0000:c1:00.1 eno16905np1: fw_health_status 0x448100

Take RTNL (before the netdev instance lock, matching the OPENING state
which already uses rtnl_trylock()) in the fw_reset_abort path of
bnxt_fw_reset_task() and route the POLL_VF abort through that same
path.

In bnxt_fw_reset(), only a PF can reach the bnxt_get_registered_vfs()
error path that calls netif_close(), so take RTNL up front via
bnxt_rtnl_lock_sp() when BNXT_PF(bp) is true and keep bnxt_lock_sp() on
VFs. That avoids dropping the instance lock mid-reset (which would
expose a transient BNXT_STATE_IN_FW_RESET and let a concurrent devlink
health recover set BNXT_STATE_IN_SP_TASK), avoids racing with
bnxt_sriov_configure() updating active_vfs outside RTNL, and keeps VFs
from contending on RTNL during recovery while PFs already run on the
single-threaded bnxt_pf_wq.

The bug was found by inspecting the kernel log of the affected machine
and the driver source; the fix was prepared with the help of an AI
coding assistant (Gemini based) and reviewed by the submitter. It is
build tested (allmodconfig with W=1, plus the same change on top of
v7.1.6 built as a module for the affected BCM57504 host). The aborted
reset path itself only runs when the firmware fails to return from a
reset, which could not be reproduced on demand.

Fixes: 004b5008016a ("eth: bnxt: remove most dependencies on RTNL")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan Cochrane <bcochrane@google.com>
Link: https://patch.msgid.link/20261110044235.204386-1-bcochrane@google.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
[ bcochrane: backport to 6.18.y: 6.18 lacks bnxt_lock_sp() and
  bnxt_unlock_sp(), so keep the existing inline BNXT_STATE_IN_SP_TASK +
  netdev_lock()/netdev_unlock() on the VF branch of bnxt_fw_reset()
  while using the existing bnxt_rtnl_lock_sp() / bnxt_rtnl_unlock_sp()
  on PFs. ]
Signed-off-by: Bryan Cochrane <bcochrane@google.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 8ef1d9d2f..49e9470e1 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -14538,8 +14538,12 @@ static int bnxt_get_registered_vfs(struct bnxt *bp)
 void bnxt_fw_reset(struct bnxt *bp)
 {
 	bnxt_ulp_stop(bp);
-	clear_bit(BNXT_STATE_IN_SP_TASK, &bp->state);
-	netdev_lock(bp->dev);
+	if (BNXT_PF(bp)) {
+		bnxt_rtnl_lock_sp(bp);
+	} else {
+		clear_bit(BNXT_STATE_IN_SP_TASK, &bp->state);
+		netdev_lock(bp->dev);
+	}
 	if (test_bit(BNXT_STATE_OPEN, &bp->state) &&
 	    !test_bit(BNXT_STATE_IN_FW_RESET, &bp->state)) {
 		struct bnxt_ptp_cfg *ptp = bp->ptp_cfg;
@@ -14585,8 +14589,12 @@ void bnxt_fw_reset(struct bnxt *bp)
 		bnxt_queue_fw_reset_work(bp, tmo);
 	}
 fw_reset_exit:
-	set_bit(BNXT_STATE_IN_SP_TASK, &bp->state);
-	netdev_unlock(bp->dev);
+	if (BNXT_PF(bp)) {
+		bnxt_rtnl_unlock_sp(bp);
+	} else {
+		set_bit(BNXT_STATE_IN_SP_TASK, &bp->state);
+		netdev_unlock(bp->dev);
+	}
 }
 
 static void bnxt_chk_missed_irq(struct bnxt *bp)
@@ -15239,9 +15247,8 @@ static void bnxt_fw_reset_task(struct work_struct *work)
 		bp->fw_reset_timestamp = jiffies;
 		netdev_lock(bp->dev);
 		if (test_bit(BNXT_STATE_ABORT_ERR, &bp->state)) {
-			bnxt_fw_reset_abort(bp, rc);
 			netdev_unlock(bp->dev);
-			goto ulp_start;
+			goto fw_reset_abort;
 		}
 		bnxt_fw_reset_close(bp);
 		if (bp->fw_cap & BNXT_FW_CAP_ERR_RECOVER_RELOAD) {
@@ -15374,9 +15381,11 @@ static void bnxt_fw_reset_task(struct work_struct *work)
 		netdev_err(bp->dev, "fw_health_status 0x%x\n", sts);
 	}
 fw_reset_abort:
+	rtnl_lock();
 	netdev_lock(bp->dev);
 	bnxt_fw_reset_abort(bp, rc);
 	netdev_unlock(bp->dev);
+	rtnl_unlock();
 ulp_start:
 	if (!rc)
 		bnxt_ulp_start(bp);
-- 
2.56.1.750.gf70dc682cf-goog

