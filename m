Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683896;
	b=oF6X3sMTCP+M7eDlHffkE73vX/bCSv3bERZriIFassjxyahTllzIiXuz7kyu4oPzCaBV
	 WMntH21+JwZ4/EaridONt7DueLCgXWR5wA371OlFQQbld9xwMZTPAeIHevQga2eYwgxSP
	 AIQ5gHLS5SfmOPTq6qk3JmI7xIlM4YmHZp6lc+CA4i7FDvFLErP0vDIwI3uW0AxeEQt/p
	 BKT35S8OYybfpRXnFjPgzQ+FT518+/hKUafnaBB4bFkqnsr0ApH9BwtQuS8T3opjQVIRF
	 i11AvOsEV+sHs0UGdktEdlE1SIcT9C5NYvqZsGTdD8jmpSM3kZaZ2YunZrFRL0hprWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VEs+YZJzt/o7CjJ+sXfJQxCthvzGYvQWjs/NnqxO/2M=;
	b=PvmYOEv7ZFTjZ3N/aLZSd3YBtrsnLaiLisozXLBM+hglDo85TKfjmDEmgrv7aPgetRwm
	 9MGjv9w+eAR/7HK1L/vIc6BwVOOCzUWM8iHzZZCy8+5imNZgohjrlP9JzoNcV3kRKq4Af
	 wPSWDm7wTlRG5UHO6MPanpalVsJU8YzwPnYVt2c5xXx6GVAOmcJ65s6Us6cXCSP34gWVc
	 GXmBMQzWtpZjCVOHYXYjufUlS9xJaGNJoPDxRsMCjmrg15LElspDypTSJntmojC9WUupl
	 SdCgqj36TWEM51zHSx/icpQEszBWkbVEFBIpdlfn+gUsIFFPLwJ958g00WXjI7KMjSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ltBR6wqb;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6573D606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6573D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ltBR6wqb
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso2969341a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683895; x=1796288695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VEs+YZJzt/o7CjJ+sXfJQxCthvzGYvQWjs/NnqxO/2M=;
        b=ltBR6wqbzGlhabpJczNJYZ9rc51JA8K/W031h305jxus5mg8WVwFt+EoQiYmLlcWCN
         Eec7tVut1bWMIalnko5tm8YAHP1HdWfw/pnk4NVzyC3NI88ilcCeWRG+8OcD6sB1nbjx
         rIT5JldMSTHSL4rxkJzdTB7daYeuSoP0VPFmVxnPcKEgcad+97ZFYpGpayJEgEsrEMlM
         bWEIl/Ob0FA9vs5nZb8Bz5jq0zbRd6iWHwyvCcMwrH6t0YHuY8tf/Wq+wBhYZd093uEq
         bQbubqEvNQwNTRAUA7JyB7e/R24keAxsfEtx1LNdnZ1EqWNx2ZAfJLETSNOwoZ+QWf0H
         kNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683895; x=1796288695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VEs+YZJzt/o7CjJ+sXfJQxCthvzGYvQWjs/NnqxO/2M=;
        b=Alas9eO3ZuBw0wJSTbzxVLOq8MUWI17nymwPkv08Z0zeL7HPZzdQKZgoONNyjfDxuj
         ei+UJ5ec5d00YSbVf8oRzjFqRh5cNGxE5ytuTgncB6b+NAebsjwnBlvar5pvAw6X8ycZ
         vADxVjJvBjaIEk4J7p00AQ/JldhFQ8itP36EXjiMUMiU1sbtvxAgcV/T5HhgN49lhfbO
         MsyQoI6oPi6fD94VcJlzYFc6B+oqn4ja0jFGmoZv+3jNXS1LIeATwSsY2gH0cuQOm2FF
         ZncA+nCUYzaf22fxwIKAqyjP4OwJqizQ5PWb1NDLTPXzx6FBM7RttVCeZNdD/2jD/6Fv
         t10A==
X-Forwarded-Encrypted: i=1; AL+hErGvPFRkhIr9XbSTPWGjd6Nj0JpJlVL3WsITZzyfY9ew2y9JPfJGAGtChKIKzGjkMH8JTjD5FOeQJ/KgRYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KUXNzIaFslKWaB0Nci4xgb/J0ajqo0j5PLEYov36DA0J+RidT
	mHTIeEWWnziK4JokRwwxKY4nVnqsQi0tGv4m3CDgKSFbkLZ0iofboreE
X-Gm-Gg: AZFdTZfKDRIGRd8/a5/Xk8gIAV1pJs36RsK7y5D3kUOse+vV+GeKj23uj0CNW6Ho44Y
	pGC9A3rU1lFk40Khl7ZQA4P2I567s75bT13INBiu2jreTZOq0HJi1Mx5/RGd8NK03YetZAxTXdt
	BqI3v4APcJ+F/E4LRZbrSd/oFJnEQGJHo87oxDGg6R0jNSw0G0mPNfTZY4jVHU17zLXTIyatxdy
	Q79cZChECxgaxySi45+9mJMwADbape3I8cfRw67EJcotHrpHdFLZXWbdnqDrVBhsnq1oS0UtoF/
	H+bmWebBXr1W27mTD2PfumDSDqDhwjCLufhvKfQjlZghIL5skr+zdKPiYSIzN4I6EJtOJJ5QbZ2
	0H9+gOswZkV5jJJWKhN3EKkXINj78XIHORiN6IoYyAANXQ3kezL32WEc/hSECSG5ACToDRwLMq2
	+0GUBky00RpJ3gpNF503oqavgvUnNixsEayQyRk/maXXbZFulvGACuwS2/2uEgEW1YtcSsw0tr5
	A7m0ChZ/W5pRldMbc4R89tCO41mvuX93uX+3fgDixw/Jnc7a1+TAGDRn21pI9WvSgyoWvwm3GBV
	PEkjbvMXUq1zCnTUVnOOmF9RRXmSvdrD0mFcBhACbwZZxbC75QEVFKat8SSI0x6TDYPFUcnLjZF
	50c5OAAROji1yPSGSmTSpw5hulwX78KtCN2nQEjiiFtcSxUqmxMG/3v5SfeIPHgBBsc6IF5k8s6
	a29Ak/6msvhLy+uGryAHqCKmDtji1lGmHceO7e4xfNfHaw0A==
X-Received: by 2002:a17:902:e802:b0:2ef:d9b8:469 with SMTP id d9443c01a7336-2f03f21e8b9mr190133895ad.43.1795683894598;
        Thu, 26 Nov 2026 01:04:54 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-54-117-173-250.ap-northeast-2.compute.amazonaws.com. [54.117.173.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f07d6d4bddsm71898725ad.62.2026.11.26.01.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:04:54 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: pktgen: hold if_lock across pktgen_find_dev() in __pktgen_NN_threads()
Date: Thu, 26 Nov 2026 17:04:45 +0800
Message-ID: <20261126090445.1523-1-luob87709@gmail.com>
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

In __pktgen_NN_threads(), pktgen_find_dev() looks up a pktgen_dev on
t->if_list under rcu_read_lock(), drops rcu_read_unlock(), and returns
the raw pkt_dev pointer without holding t->if_lock. When called from
pktgen_mark_device() on NETDEV_UNREGISTER, __pktgen_NN_threads() holds
pktgen_thread_lock and writes pkt_dev->removal_mark = 1 outside both
RCU and t->if_lock.

Concurrently, the kpktgend kernel thread in pktgen_thread_worker() does
not acquire pktgen_thread_lock when processing T_REMDEVALL or T_REMDEV
(e.g. via "rem_device_all" on /proc/net/pktgen/kpktgend_N). It calls
pktgen_remove_device() -> _rem_dev_from_if_list() under t->if_lock and
frees pkt_dev via kfree_rcu(pkt_dev, rcu). If an RCU grace period
elapses before __pktgen_NN_threads() writes pkt_dev->removal_mark = 1,
it performs a slab-use-after-free write.

Hold if_lock(t) around pktgen_find_dev() and the removal_mark update in
__pktgen_NN_threads(), matching the existing rtnl_lock ->
pktgen_thread_lock -> if_lock(t) lock ordering used by
pktgen_change_name() and add_dev_to_thread(). Since pktgen_find_dev()
has no other callers, assert t->if_lock is held and traverse t->if_list
directly under the mutex.

Found by static call-chain analysis of RCU-borrowed pointers, followed
by manual code inspection and QEMU/KASAN verification.

Fixes: 8788370a1d4b ("pktgen: RCU-ify "if_list" to remove lock in next_to_run()")
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
Testing:
- Compile-tested on x86_64 with W=1, KASAN, and PROVE_LOCKING/LOCKDEP
  (net/core/pktgen.o: 0 warnings, 0 errors).
- Verified in 4-vCPU QEMU (KASAN + LOCKDEP + DEBUG_ATOMIC_SLEEP) by
  racing RTM_DELLINK on dummy0 against "rem_device_all" writes to
  /proc/net/pktgen/kpktgend_0:
  * With a test-only 50ms race-window delay inserted before
    pkt_dev->removal_mark = 1, the unpatched kernel reliably hits
    "BUG: KASAN: slab-use-after-free in pktgen_device_event" (4-byte
    write at offset 76 of kmalloc-4k struct pktgen_dev freed via
    kfree_rcu / rcu_core).
  * With this patch applied (both clean and with the identical 50ms
    delay), 20 concurrent race iterations complete with 0 KASAN,
    0 lockdep, and 0 atomic-sleep warnings.

KASAN report (baseline + 50ms race-window delay):
  BUG: KASAN: slab-use-after-free in pktgen_device_event+0x432/0x490
  Write of size 4 at addr ffff88800a47a04c by task pktgen_race_tes/80
  Call Trace:
   pktgen_device_event+0x432/0x490
   notifier_call_chain+0x9a/0x2d0
   unregister_netdevice_many_notify+0xbce/0x1960
   rtnl_dellink+0x367/0xa80
  Allocated by task 80:
   __kmalloc_cache_node_noprof+0x254/0x5f0
   pktgen_thread_write+0x57d/0x1630
  Freed by task 0:
   __kasan_slab_free+0x43/0x70
   __rcu_free_sheaf_prepare+0x65/0x250
   rcu_free_sheaf+0x1a/0x100
   rcu_core+0x636/0x1550
  The buggy address is located 76 bytes inside of
   freed 4096-byte region [ffff88800a47a000, ffff88800a47b000)

 net/core/pktgen.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/core/pktgen.c b/net/core/pktgen.c
index d63eead..39362ce 100644
--- a/net/core/pktgen.c
+++ b/net/core/pktgen.c
@@ -2032,14 +2032,17 @@ static bool __pktgen_NN_threads(const struct pktgen_net *pn,
 	bool exact = (remove == FIND);
 
 	list_for_each_entry(t, &pn->pktgen_threads, th_list) {
+		if_lock(t);
 		pkt_dev = pktgen_find_dev(t, ifname, exact);
 		if (pkt_dev) {
 			if (remove) {
 				pkt_dev->removal_mark = 1;
 				t->control |= T_REMDEV;
 			}
+			if_unlock(t);
 			return true;
 		}
+		if_unlock(t);
 	}
 	return false;
 }
@@ -3774,8 +3777,9 @@ static struct pktgen_dev *pktgen_find_dev(struct pktgen_thread *t,
 	struct pktgen_dev *p, *pkt_dev = NULL;
 	size_t len = strlen(ifname);
 
-	rcu_read_lock();
-	list_for_each_entry_rcu(p, &t->if_list, list)
+	lockdep_assert_held(&t->if_lock);
+
+	list_for_each_entry(p, &t->if_list, list)
 		if (strncmp(p->odevname, ifname, len) == 0) {
 			if (p->odevname[len]) {
 				if (exact || p->odevname[len] != '@')
@@ -3785,7 +3789,6 @@ static struct pktgen_dev *pktgen_find_dev(struct pktgen_thread *t,
 			break;
 		}
 
-	rcu_read_unlock();
 	pr_debug("find_dev(%s) returning %p\n", ifname, pkt_dev);
 	return pkt_dev;
 }
-- 
2.43.0

