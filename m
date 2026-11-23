Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441942;
	b=BEi4dWQiP07F56er8rLIAhc//XuDTc1SPN6Pou4RZKp/NC0w2+AUkLbDwTwgclBaKF/5
	 DJcZGNxO9QbKxkKbx849r7ZXWQjeu4TKJ43qsYi/PscyNhpXMl4zTx7T7xxcfThDANjp8
	 TxFWB73xZ5+FDvG6o7HmRVw4rAyLkTNEzEF941o1NEHVU85DxHfL++jRTxmcwZxX4joVc
	 eo86/Z+DwvGZJLmacS112cO1gVsOz3SdExj2VG9pEwWacIRszhdoj6c1ZzeJfddIIpDi2
	 VAODrOazDKfpXvBjvehpkSqEYHaaK3+Ez6/wu5OOks2E5XN+WUmVPrxe8IPWhsfRHTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AK+gHSxZdcAvKZ7cQ385RlBq7MDtihQM1tWGeZNK/Ig=;
	b=0r25tpvTmpi3vEKHbGQNf2kfCSzi6/LUaZ8iVjYh443+4eJrlEPNhUe64V+QU2iTWsO6
	 62dygBR2ihTRA5CpA5dkd1wjQZ5gg7FD79oXnO5c6+fd66V59THmuWx1XKvWaFVP5greb
	 ncOOUU1LD6Vg99Pnr86v5ro5Z3dNAKyXemCjU52n6QaLb1byXBJk58RgK4n4LzpuuwEuj
	 kwbi/ZhthSJJ3MSnwZep/E7tjoZ+1ODnZ038E81D0cjXreOD+xEnNdWVH96b8QgDO2l2n
	 Vl7k6EB7he1TMDod4XqsDF9AR8C+g0gkCoexF1ooI4c5QG8zjwb6z2fuMZrQHP2Ff5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pG/L1KjW";
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EDF606A339
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93EDF606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pG/L1KjW
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ccca948203aso3027037a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441941; x=1796046741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AK+gHSxZdcAvKZ7cQ385RlBq7MDtihQM1tWGeZNK/Ig=;
        b=pG/L1KjWxpSA2Qj/6+4env8xCyAMMVCaCfEtqWIchhK2jZ4vT0Takmn29YepTCzUs1
         wTPYKSdaP5+LNdNRcsqVi6ZvCETUpFFMI4JtFgdtciDeGn5+jpeFLJGFEd/2PqDypfIb
         r3wqrprqJPh8ac1c4eeppDFSbUTb3J7PRf9vagRzSnBygGCNUvrIq6tVO09bmjd5E9hA
         zhVKZ5kIea37duHRMpiW15XpQlvDPq9imqDFcKEM4ZWBd1dy5Ip9+Ypy7Ig9I1+EJp6+
         lB/dN/EK1X6UcJIDjd4yEQdQRgRjPua2Q0hondZukrdcG2itqx02u8f0QKXACticTFvd
         ljxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441941; x=1796046741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AK+gHSxZdcAvKZ7cQ385RlBq7MDtihQM1tWGeZNK/Ig=;
        b=LpKM56SKbdaEeddmWevCpw8vwmZc+Vi5pxKGk3d+gfGW4XIqS321R03YKYVcR/GN1H
         kqfLm/jsmL+lkSYSP6W8s7aogMgyLNEJHosh4LAzAE6MRg3iLziW/YXfWpjvluyxjmzF
         6bTtFv4NdFkJEUyWesAiSKNlntQhhnVnkzc+GxzoLhoMbL2lzXFPVgImG20IRWE3Fr5L
         d6aEhq1ON0YeyIH+k/JTscH10e4fQGxNMsUR5Pm5hU6dcurA1Po9lOQyrIPfehmvphQ7
         B1VFRD6fR45IHaCqPcC+63kZ4sLAB1+qGP9GiIduX6BKrC04kGr/DY/yATyfyR70BHWK
         L9NQ==
X-Forwarded-Encrypted: i=1; AL+hErH79qL6oyyJfp1S+oZ9aRW/5oNLUgy341LRyr8++9z6UPYPg1vRZNR2/JydT/aVImPKjfqa+adgSa2/xSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uGTb5GxfHrBZ+bLkX4GTB2zqOhPedtaj/gk79uk4dtQo5v/rX
	TK/Txh2rWVUi6IaS4zykSReuQcWZuU2yNel9SDNngjDytN6OwyUD5Hzx
X-Gm-Gg: AZFdTZfqlhKaeiWf3EfCdShio4Yub0n43eImi9KBWNo0eZH56lby/i/eNQ7j0Wr6glP
	0x9LBAATyfBY9A8MQ4hEhq7qXiYNWEeAtm5BjqG4jbGhq4IK7tvN0tUqRoXVnyaQ2M12hcwziXg
	X0KhRIDqdpBXgX/MpxSul3bOUaQoBRIvOVsiJon9jBAH/urni7riHGBvnG/vmO7IS3tZzHDSTQj
	KkczdJBViyGyrdBCC6dANN8HLTVwBkAcQJSNNCnQYC210VEVJ/tHLZPTF6s6G6GoiGBerywQhJj
	wo1XYneY9xkR3ni4Rr25BEAkBw/vgLfl5jx9jW9Byo8iUnP4ycUqx4BWZtGgn4S9/k2iTz2wOEF
	48fTdMBDNJNPnHMy0Aa8dhN/cs7DtMHsP7j9sLr+OzfaeR3PnIaFgEHqkA0fXQFJm9YmtUGKImq
	JnmuNVQDH6Bc7wwE3NecYjFhpsGhf+81dnZ7bUmNfqH5nqbIFAzC0KYysAsGwWDx+aXPTjSvNrj
	Zkh7ZKWHXBV7gWOmx9pxBW+p1v1mCwMY7s3XiRqc6JGO4coM+rhhiU8sK7uHxRQqubM8vyQu5bb
	xvQqKQCSJBZ0j3mMfAy1Wq9ASfUEqaw1Jw==
X-Received: by 2002:a17:90b:2fcd:b0:3a4:e934:e85c with SMTP id 98e67ed59e1d1-3b41c964869mr10595210a91.41.1795441940870;
        Mon, 23 Nov 2026 05:52:20 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm20842512a91.14.2026.11.23.05.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:52:20 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCHv3 3/4] powerpc/kvm-hv-pmu: Don't allocate gsm/gsb GFP_KERNEL allocations under spinlock
Date: Mon, 23 Nov 2026 19:21:52 +0530
Message-Id: <52381792ff2e208f213cf250d5122a1ab367de20.1795441238.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795441238.git.ritesh.list@gmail.com>
References: <cover.1795441238.git.ritesh.list@gmail.com>
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

kvmppc_init_hostwide() takes lock_l0_stats with spin_lock_irqsave() and
then allocates the guest state message and buffer with GFP_KERNEL. On
a nested API v2 host with DEBUG_ATOMIC_SLEEP this warns at boot:

  BUG: sleeping function called from invalid context at include/linux/sched/mm.h:322
  in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
  preempt_count: 1, expected: 0
  RCU nest depth: 0, expected: 0
  locks held by swapper/0/1: 1, on CPU#0:
   #0: c000000004ad95b8 (lock_l0_stats){....}-{3:3}, at: kvmppc_register_pmu+0x50/0x270
  CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.4.0-rc2-00028-ge5a8bf3a3ee9-dirty #124 PREEMPT
  Call Trace:
   dump_stack_lvl+0xe8/0x150 (unreliable)
   __might_resched+0x190/0x30c
   __kmalloc_cache_noprof+0x4dc/0x760
   kvmppc_gsm_new+0x68/0xcc
   kvmppc_register_pmu+0xd4/0x270
   do_one_initcall+0xac/0x48c
   kernel_init_freeable+0x3cc/0x7f0
   kernel_init+0x3c/0x274
   ret_from_kernel_user_thread+0x14/0x1c

The lock is not needed for the allocation of gsm and gsb buffers.
Allocate and fill the message and buffer without the lock and only take
it to publish the two global pointers.

Fixes: f0c9c49c5067 ("powerpc/kvm-hv-pmu: Implement GSB message-ops for hostwide counters")
Cc: stable@vger.kernel.org
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/perf/kvm-hv-pmu.c | 65 ++++++++++++++++------------------
 1 file changed, 30 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/perf/kvm-hv-pmu.c b/arch/powerpc/perf/kvm-hv-pmu.c
index aa72b96b5a8c..a58634f656e9 100644
--- a/arch/powerpc/perf/kvm-hv-pmu.c
+++ b/arch/powerpc/perf/kvm-hv-pmu.c
@@ -314,53 +314,48 @@ static struct kvmppc_gs_msg_ops gsb_ops_l0_stats = {
 
 static int kvmppc_init_hostwide(void)
 {
-	int rc = 0;
+	struct kvmppc_gs_msg *gsm;
+	struct kvmppc_gs_buff *gsb;
 	unsigned long flags;
+	int rc;
 
-	spin_lock_irqsave(&lock_l0_stats, flags);
-
-	/* already registered ? */
-	if (gsm_l0_stats) {
-		rc = 0;
-		goto out;
-	}
-
-	/* setup the Guest state message/buffer to talk to L0 */
-	gsm_l0_stats = kvmppc_gsm_new(&gsb_ops_l0_stats, &l0_stats,
-				      GSM_SEND, GFP_KERNEL);
-	if (!gsm_l0_stats) {
-		rc = -ENOMEM;
-		goto out;
-	}
+	/* allocate the Guest state message/buffer to talk to L0 */
+	gsm = kvmppc_gsm_new(&gsb_ops_l0_stats, &l0_stats, GSM_SEND,
+			     GFP_KERNEL);
+	if (!gsm)
+		return -ENOMEM;
 
 	/* Populate the Idents */
-	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_HEAP);
-	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
-	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
-	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
-	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_HEAP);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);
 
 	/* allocate GSB. Guest/Vcpu Id is ignored */
-	gsb_l0_stats = kvmppc_gsb_new(kvmppc_gsm_size(gsm_l0_stats), 0, 0,
-				      GFP_KERNEL);
-	if (!gsb_l0_stats) {
+	gsb = kvmppc_gsb_new(kvmppc_gsm_size(gsm), 0, 0, GFP_KERNEL);
+	if (!gsb) {
 		rc = -ENOMEM;
-		goto out;
+		goto free_gsm;
 	}
 
 	/* ask the ops to fill in the info */
-	rc = kvmppc_gsm_fill_info(gsm_l0_stats, gsb_l0_stats);
+	rc = kvmppc_gsm_fill_info(gsm, gsb);
+	if (rc)
+		goto free_gsb;
 
-out:
-	if (rc) {
-		if (gsm_l0_stats)
-			kvmppc_gsm_free(gsm_l0_stats);
-		if (gsb_l0_stats)
-			kvmppc_gsb_free(gsb_l0_stats);
-		gsm_l0_stats = NULL;
-		gsb_l0_stats = NULL;
-	}
+	/* setup the Guest state message/buffer to talk to L0 */
+	spin_lock_irqsave(&lock_l0_stats, flags);
+	gsm_l0_stats = gsm;
+	gsb_l0_stats = gsb;
 	spin_unlock_irqrestore(&lock_l0_stats, flags);
+
+	return 0;
+
+free_gsb:
+	kvmppc_gsb_free(gsb);
+free_gsm:
+	kvmppc_gsm_free(gsm);
 	return rc;
 }
 
-- 
2.39.5

