Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.242
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663780;
	b=2AcKTssfy5JSli5Ms+SEaOXimLNa4ZhCo6ZSrXS8eVhtapsgxrFo26MtYc3RM+ELJ2ew
	 9BBCiG2F1+EcESEzlRztVR45QOegymHWT/SJg0GCYcb6l2v9cwrjaJ0BLUxFoypa7QR+o
	 9XYhRuIDGRTSKxgSnMQsuQAtq0GYa6sApjfmDrhAzvPSRWus3iRVBRb692zqbxwmYzaSt
	 fKucBkrgxTXtqY7PGtk/Eh2wSKJtW/2PhR88LRcMmNp1t/m21+THoxc5a5IOxvLwBOP7a
	 8D8FawaUQPU17pY0O5Yfnq9bhNx9cS7wROjCm+nN9MYbdUJz95DDFYuwlbabvFG0L8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Orig-IP:
	 X-Proofpoint-Spam-Details;
	bh=3C6fWu2YFRXCPSFxULRlnxCQNRcB6svYBUg9GTTnUT4=;
	b=B6+ekqKRPQhFeFZF+sbLJtfbJfcwxbDm7wb92Y9/qFuFsSqYV/oqqstUFqWFcDVNaFSN
	 ziHpZ/Olx9Yg+578LW91BbTcpI7kLX2Vah8uAMHZI69aoN3BS6djNvTw06cRRnKE6hdLH
	 Y5ODXcksM9hg9q2KT4PejBXYldjyKVz7RAocw9KDPsIelGe4Ie9xVvHxML8GKIMI9W54g
	 DxfhlSY1cjGVDX6CRNWVV8tBoTy5HBk+92R8zFoKv4bCKA9MoEJwbaaZMwxwJFUtlyTR2
	 ojBfIWp+7P3Tv/dK4rlw+OjhkoD8SXdfzAqM0y3VQ0OlVgiDJt8rQhmnqmGnM3KXT2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nyu.edu;
	spf=pass smtp.mailfrom=nyu.edu;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=DyE6dbMd;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=K7y3wKkQ;
	arc=none smtp.remote-ip=67.231.153.242
Received: from mx0b-00256a01.pphosted.com (mx0b-00256a01.pphosted.com [67.231.153.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48E0606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D48E0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=DyE6dbMd;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=K7y3wKkQ
Received: from pps.filterd (m0355791.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ2UNCe4100566
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=20180315; bh=3C6fWu2YFRXCPSFxULRlnxCQNRcB6svYBUg9
	GTTnUT4=; b=DyE6dbMdYrOppiOzq33q3DcKNlwigVoi6PN8uZZNg+ioRbH5qy7P
	Tkuy86NjJF9CX4pqj4DsZmbef5zbEAqK2jZNBnC0WhILDLXlACj09X8Pa+uNmbmk
	tz593TFaiQQSpy3HdFeLKEvkvyFNjY14jZUnMNAbUE2pDGExp4VNWYbvvixigTxR
	CmzHMh8TU+lzxz7TkkcKdPLVqlgOuK7vVDEwMiCOwBn9MUwE0YIjV8hVE5AaIF59
	5VCbfvPj6g5PmMH/6jMFbKuUG+/nvHt/h/nEip2rLcG+S7T/7c295mNQ6fGIOCb0
	1JfgOOfDZZ7lp14e18iIQts7LlCzFSG4Fw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4j66t7cqmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:29:32 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d3232fso912139185a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1795663772; x=1796268572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3C6fWu2YFRXCPSFxULRlnxCQNRcB6svYBUg9GTTnUT4=;
        b=K7y3wKkQvkYqHEO+osG1fuUzHLCZUShsBiNraRgwPIa9oFVXJxpAVeQJhcx06zE6Qg
         iSSBeh+hww/Qm8yTi5EzL39C8KEHKINhxTuTkAwyGHx7gCFj1/5PWY26kgvcR6jGfHe/
         Bi/VCFhfuT2SSYW8Ce+IkS9GXdneWD9w3YFmA+hO7gJclwKCJm8ZAFODHOMuNMqdds2Q
         ZA2ific/q36SLjQpBqdiF1nY+Aqn3MkPjTJn9hDKN+VV5/qKxmz+Eg2vebMCQZhaUB9+
         TVw0chIJVgbEFjKUYNCCe0Zwu9h/fVfCQOHa3gNZvnp5HHskuAPtnL8f/kA3TGaJvQCX
         JZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795663772; x=1796268572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3C6fWu2YFRXCPSFxULRlnxCQNRcB6svYBUg9GTTnUT4=;
        b=WKy7pTIiAPSrQ+qu9z4EweeyXEyqwnfydx9zsbTnwoZpLCuQDEjH3mEdL3r70umUED
         24evnqGIMtMzfvGJdIknSszIGZhaGTJCwHt1Vhiw8nHTsVnby5InPJXZr42uLHJxLFP4
         VO9vsLRTHyBi3bnipfoMZRhcHCG3U043ik3NziEyfAI9BO75pImRIcPmEft3+nltxmY1
         CS2aV9xbqJlL6utrFfNVwULgjUkTO6f9Zcph7zfUtRMXoLOdbaL4NIwEcewi8ucoLOhy
         piNMf6OWRSa8pqMfdoypio7YCwY7POpNWAjSYSel/rQwP28Uz1lcdeuMXPCcrGTVfekj
         ozAA==
X-Forwarded-Encrypted: i=1; AL+hErGqNfZKqjOSxtougaMch+ox6PTPDUYjP94So4UIfG2f4/c/aRcjG9a4JhNS4e1K9gfWjLYxRIHJPsbba/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VJD6BmM6Hc0xCB39egw+JIqVwSt8kCFnn3oJB2+7oEcZOo/+N
	gXarx+nVXinXfP/tKLBp5J5/rnsbw0qdrRjMa8bsVTFRrwg1EKe98ojf+6p7Y7zvD/poGxFH/tR
	ViAtiIplMLh5zThOiZBKAKYemOvDbqivx8IUkP8C1+HZ7SGsgd931m6AgcE9YerTcgvrvaSI=
X-Gm-Gg: AZFdTZcN18hPgQjz2fmU2ptAIkKpME9u6GKgK79BfiSYfMikNQuI7/HuWJerNo7ThdZ
	ea4qBE+sImFc2SKw8PycG4DA784o3Dll6/+E4xD395KJZT0ws2GQbaoqXApG8M36V9l0b9z48ZB
	nO9M3iYtEN1IEI+IfsA4lvwgmZnyBj2dhifWWXV+KxI6ysAUewa19QLMc5fDao4vQyd0bqCypWL
	GLFvcRQiL6kDLQFhgBVp64KMwUJZHeGcKJNzLwJRRROpWSeceHXQoK0q0VTGeGNPrz2XU7vbPNW
	ep//hk80unlDE9YlI5M4/YH9y+58xgiNQFHWTqEGsVkeSnQBD6SzKhi0IVd8JjoUOeMhDeli1du
	5pYrSqow1TCxmQMGNqv0NRayvyymBcNBGOJXbS53PXlN0U6waF1jwxywQHSGGa4Qsw2tIHPAeWT
	mkL13mLhPuVg==
X-Received: by 2002:a05:620a:46a3:b0:93e:84e5:3c66 with SMTP id af79cd13be357-949bab0e65fmr3898766185a.40.1795663772125;
        Wed, 25 Nov 2026 19:29:32 -0800 (PST)
X-Received: by 2002:a05:620a:46a3:b0:93e:84e5:3c66 with SMTP id af79cd13be357-949bab0e65fmr3898763285a.40.1795663771499;
        Wed, 25 Nov 2026 19:29:31 -0800 (PST)
Received: from jerrythepro.nyu.edu (216-165-95-171.natpool.nyu.edu. [216.165.95.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1245303285a.20.2026.11.25.19.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:29:31 -0800 (PST)
From: Kaho Jiang <kj2864@nyu.edu>
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Xiubo Li <xiubo.li@clyso.com>, Viacheslav Dubeyko <slava@dubeyko.com>
Cc: ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, co+408fcc361565713f@bugs.sh,
        Kaho Jiang <kj2864@nyu.edu>
Subject: [PATCH v4] ceph: Use unsigned types for snapshot split counts
Date: Wed, 25 Nov 2026 22:27:57 -0500
Message-ID: <20261126032756.265377-2-kj2864@nyu.edu>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=W72txhWk c=1 sm=1 tr=0 ts=6b07a79c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=KedNMhGAb3LEZ+tc39L0GQ==:17
 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Se5WoFf3ZZRiLcel0nel:22 a=R6YzIN_bpWbBo3jmtC1i:22
 a=VwQbUJbxAAAA:8 a=OX5_IFQy-VAFgtxavdwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxMiBTYWx0ZWRfX3Zl0WPeSEXH/
 k2aRutlHyFpIneE7dVpVzYWzt1x5em9UGhMK/aTJKx9ITxAAR/k5gKA0txFlbdJUE+sl7n5mD0r
 zEzelGNzu1ksTKVFv5qG2/haSFUVUpqH8vqypAnOZeej3PJ64vCfOzMzV7vokwsl6wQ3YQp8e9f
 Nx1jLdRNmD0iU14O1oJbcFdKa13g/SNfZT0Ri8VIP/SIeRQ5vRSn+8upoO1mVzuHTGNWmCc7c/m
 kzkU3PLnZ0xzMR/48beSTh8B/Epfi7NRHJGi2mcGh6WjfX3xRVEVFIafToQa7oXEo0EJllkQT5O
 aF9DoeLeY50efvENydB5mKOQAyjLZTlR4xwnpqgganO9KqNN9CmteCwoU7gkwKrnbpeGNT8DXE3
 7xm88J/ERSgZ9QacE6lmwWNzq7ZV7pC+1sN5dcx5sGF1yG4nNy/lDfe7DAGKlDpDc8q12Kbb+ET
 iJycfIa0ux8HZEJr35g==
X-Proofpoint-GUID: 2PJg62gYPlDSMRw5I7_y9Xn1IxomY_Ni
X-Proofpoint-ORIG-GUID: 2PJg62gYPlDSMRw5I7_y9Xn1IxomY_Ni
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxMiBTYWx0ZWRfX0BLKcmZODbbA
 UsMfQExxsxsaPgHQ1Gb4P+SgB5K7pVvoBIIxw9pyG3H6UujqJtvJcQLJvV4jqodyBgx39LAlZTJ
 75Lq6jnzH1puh8MbGI9xYnS1qYfjk8M=
X-Orig-IP: 209.85.222.198
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260012

ceph_handle_snap() stores the unsigned 32-bit split counts from the
message header in signed integers. Values with the high bit set become
negative and, on 64-bit systems, cause the subsequent pointer arithmetic
to move backwards before the message buffer.

BUG: KASAN: slab-out-of-bounds in ceph_update_snap_trace (fs/ceph/snap.c:815)
Read of size 8 at addr ffff888024f45478 by task kworker/1:3/2220
CPU: 1 UID: 0 PID: 2220 Comm: kworker/1:3 Not tainted 7.4.0-rc2-g7475ea8b5861 #1 PREEMPT(full)
Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: ceph-msgr ceph_con_workfn
Call Trace:
 <TASK>
 dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
 print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
 ceph_update_snap_trace (fs/ceph/snap.c:815)
 ceph_handle_snap (fs/ceph/snap.c:1057)
 __pfx_ceph_update_snap_trace (./include/linux/list.h:172)
 down_write (kernel/locking/rwsem.c:1350 kernel/locking/rwsem.c:1356 kernel/locking/rwsem.c:1632)
 __pfx_down_write (kernel/locking/rwsem.c:602)
 ceph_handle_snap (fs/ceph/snap.c:1158)
 mds_dispatch (fs/ceph/mds_client.c:7298)
 find_held_lock (kernel/locking/lockdep.c:5401)
 ceph_con_process_message (net/ceph/messenger.c:1413)
 ceph_con_process_message (net/ceph/messenger.c:1424)
 ceph_con_in_msg_alloc (net/ceph/messenger.c:2094)
 ceph_con_v1_try_read (net/ceph/messenger_v1.c:1434)
 ceph_con_workfn (net/ceph/messenger.c:1576)
 process_one_work (kernel/workqueue.c:3495)
 worker_thread (kernel/workqueue.c:3578 kernel/workqueue.c:3659)
 kthread (kernel/kthread.c:436)
 ret_from_fork (arch/x86/kernel/process.c:158)
 ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
 </TASK>
Kernel Offset: disabled

Use u32 for both counts and validate both split arrays against the
remaining message buffer before advancing the decode pointer. Use
size_mul() to detect multiplication overflow on 32-bit systems, and
ceph_decode_skip_n() for checked skips in the non-split branch.

Fixes: 963b61eb041e ("ceph: snapshot management")
Cc: stable@vger.kernel.org
Reported-by: co+408fcc361565713f@bugs.sh
Assisted-by: LLM
Signed-off-by: Kaho Jiang <kj2864@nyu.edu>
---
 fs/ceph/mds_client.c | 34 +++++++++++++++++++++++++++++++++-
 fs/ceph/mds_client.h |  3 +++
 fs/ceph/snap.c       | 33 +++++++++++----------------------
 3 files changed, 47 insertions(+), 23 deletions(-)

diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
index 15df9d22008d..4b416fa2ad1a 100644
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -69,6 +69,7 @@ static void __wake_requests(struct ceph_mds_client *mdsc,
 static void ceph_cap_release_work(struct work_struct *work);
 static void ceph_cap_reclaim_work(struct work_struct *work);
 static void ceph_mdsc_reset_workfn(struct work_struct *work);
+static void ceph_mdsc_snap_fence_workfn(struct work_struct *work);
 
 static const struct ceph_connection_operations mds_con_ops;
 
@@ -4435,7 +4436,7 @@ static void handle_reply(struct ceph_mds_session *session, struct ceph_msg *msg)
 
 	/* Defer closing the sessions after s_mutex lock being released */
 	if (close_sessions)
-		ceph_mdsc_close_sessions(mdsc);
+		ceph_mdsc_schedule_snap_fence(mdsc);
 	ceph_blog_exit(&__ji);
 	return;
 }
@@ -6568,6 +6569,8 @@ int ceph_mdsc_init(struct ceph_fs_client *fsc)
 	init_waitqueue_head(&mdsc->reset_state.blocked_wq);
 	atomic_set(&mdsc->reset_state.blocked_requests, 0);
 	INIT_WORK(&mdsc->reset_work, ceph_mdsc_reset_workfn);
+	INIT_WORK(&mdsc->snap_fence_work, ceph_mdsc_snap_fence_workfn);
+	atomic_set(&mdsc->snap_fence_pending, 0);
 
 	ceph_caps_init(mdsc);
 	ceph_adjust_caps_max_min(mdsc, fsc->mount_options);
@@ -6962,6 +6965,34 @@ static bool done_closing_sessions(struct ceph_mds_client *mdsc, int skipped)
 	return atomic_read(&mdsc->num_sessions) <= skipped;
 }
 
+static void ceph_mdsc_snap_fence_workfn(struct work_struct *work)
+{
+	struct ceph_mds_client *mdsc =
+		container_of(work, struct ceph_mds_client, snap_fence_work);
+	struct ceph_client *cl = mdsc->fsc->client;
+	int ret;
+
+	ret = ceph_monc_blocklist_add(&cl->monc, &cl->msgr.inst.addr);
+	if (ret)
+		pr_err_client(cl, "failed to blocklist %s: %d\n",
+			      ceph_pr_addr(&cl->msgr.inst.addr), ret);
+
+	ceph_mdsc_close_sessions(mdsc);
+	ceph_dec_osd_stopping_blocker(mdsc);
+}
+
+void ceph_mdsc_schedule_snap_fence(struct ceph_mds_client *mdsc)
+{
+	if (atomic_cmpxchg(&mdsc->snap_fence_pending, 0, 1))
+		return;
+
+	if (!ceph_inc_osd_stopping_blocker(mdsc))
+		return;
+
+	if (!queue_work(system_dfl_wq, &mdsc->snap_fence_work))
+		ceph_dec_osd_stopping_blocker(mdsc);
+}
+
 /*
  * called after sb is ro or when metadata corrupted.
  */
@@ -7120,6 +7151,7 @@ void ceph_mdsc_destroy(struct ceph_fs_client *fsc)
 	wake_up_all(&mdsc->reset_state.blocked_wq);
 
 	cancel_work_sync(&mdsc->reset_work);
+	cancel_work_sync(&mdsc->snap_fence_work);
 	ceph_mdsc_stop(mdsc);
 
 	ceph_metric_destroy(&mdsc->metric);
diff --git a/fs/ceph/mds_client.h b/fs/ceph/mds_client.h
index ff9ba09f3b59..65d0fd878741 100644
--- a/fs/ceph/mds_client.h
+++ b/fs/ceph/mds_client.h
@@ -590,6 +590,8 @@ struct ceph_mds_client {
 	struct ceph_client_metric metric;
 	struct work_struct	reset_work;
 	struct ceph_client_reset_state reset_state;
+	struct work_struct	snap_fence_work;
+	atomic_t		snap_fence_pending;
 	struct ceph_subvolume_metrics_tracker subvol_metrics;
 
 	/* Subvolume metrics send tracking */
@@ -633,6 +635,7 @@ int ceph_mdsc_wait_for_reset(struct ceph_mds_client *mdsc);
 
 extern int ceph_mdsc_init(struct ceph_fs_client *fsc);
 extern void ceph_mdsc_close_sessions(struct ceph_mds_client *mdsc);
+extern void ceph_mdsc_schedule_snap_fence(struct ceph_mds_client *mdsc);
 extern void ceph_mdsc_force_umount(struct ceph_mds_client *mdsc);
 extern void ceph_mdsc_destroy(struct ceph_fs_client *fsc);
 
diff --git a/fs/ceph/snap.c b/fs/ceph/snap.c
index e03d89db61fe..968486b0c2d4 100644
--- a/fs/ceph/snap.c
+++ b/fs/ceph/snap.c
@@ -796,11 +796,9 @@ int ceph_update_snap_trace(struct ceph_mds_client *mdsc,
 	struct ceph_snap_realm *realm;
 	struct ceph_snap_realm *first_realm = NULL;
 	struct ceph_snap_realm *realm_to_rebuild = NULL;
-	struct ceph_client *client = mdsc->fsc->client;
 	size_t snaps_len;
 	int rebuild_snapcs;
 	int err = -ENOMEM;
-	int ret;
 	LIST_HEAD(dirty_realms);
 
 	lockdep_assert_held_write(&mdsc->snap_rwsem);
@@ -924,22 +922,8 @@ int ceph_update_snap_trace(struct ceph_mds_client *mdsc,
 	 * When receiving a corrupted snap trace we don't know what
 	 * exactly has happened in MDS side. And we shouldn't continue
 	 * writing to OSD, which may corrupt the snapshot contents.
-	 *
-	 * Just try to blocklist this kclient and then this kclient
-	 * must be remounted to continue after the corrupted metadata
-	 * fixed in the MDS side.
 	 */
 	WRITE_ONCE(mdsc->fsc->mount_state, CEPH_MOUNT_FENCE_IO);
-	ret = ceph_monc_blocklist_add(&client->monc, &client->msgr.inst.addr);
-	if (ret)
-		pr_err_client(cl, "failed to blocklist %s: %d\n",
-			      ceph_pr_addr(&client->msgr.inst.addr), ret);
-
-	pr_warn_ratelimited_client(cl, "%s %s%sdo remount to continue%s",
-			    __func__,
-			    ret ? "" : ceph_pr_addr(&client->msgr.inst.addr),
-			    ret ? "" : " was blocklisted, ",
-			    err == -EIO ? " after corrupted snaptrace is fixed" : "");
 
 	return err;
 }
@@ -1039,7 +1023,7 @@ void ceph_handle_snap(struct ceph_mds_client *mdsc,
 	void *p = msg->front.iov_base;
 	void *e = p + msg->front.iov_len;
 	struct ceph_mds_snap_head *h;
-	int num_split_inos, num_split_realms;
+	u32 num_split_inos, num_split_realms;
 	__le64 *split_inos = NULL, *split_realms = NULL;
 	int i;
 	int locked_rwsem = 0;
@@ -1053,7 +1037,7 @@ void ceph_handle_snap(struct ceph_mds_client *mdsc,
 
 	/* decode */
 	if (msg->front.iov_len < sizeof(*h))
-		goto bad;
+		goto fail;
 	h = p;
 	op = le32_to_cpu(h->op);
 	split = le64_to_cpu(h->split);   /* non-zero if we are splitting an
@@ -1079,10 +1063,12 @@ void ceph_handle_snap(struct ceph_mds_client *mdsc,
 		 * child.
 		 */
 		split_inos = p;
+		ceph_decode_need(&p, e, size_mul(num_split_inos, sizeof(u64)), fail);
 		p += sizeof(u64) * num_split_inos;
 		split_realms = p;
+		ceph_decode_need(&p, e, size_mul(num_split_realms, sizeof(u64)), fail);
 		p += sizeof(u64) * num_split_realms;
-		ceph_decode_need(&p, e, sizeof(*ri), bad);
+		ceph_decode_need(&p, e, sizeof(*ri), fail);
 		/* we will peek at realm info here, but will _not_
 		 * advance p, as the realm update will occur below in
 		 * ceph_update_snap_trace. */
@@ -1159,8 +1145,8 @@ void ceph_handle_snap(struct ceph_mds_client *mdsc,
 		 * positioned at the start of realm info, as expected by
 		 * ceph_update_snap_trace().
 		 */
-		p += sizeof(u64) * num_split_inos;
-		p += sizeof(u64) * num_split_realms;
+		ceph_decode_skip_n(&p, e, size_mul(num_split_inos, sizeof(u64)), fail);
+		ceph_decode_skip_n(&p, e, size_mul(num_split_realms, sizeof(u64)), fail);
 	}
 
 	/*
@@ -1187,6 +1173,9 @@ void ceph_handle_snap(struct ceph_mds_client *mdsc,
 	ceph_blog_exit(&__ji);
 	return;
 
+fail:
+	WRITE_ONCE(mdsc->fsc->mount_state, CEPH_MOUNT_FENCE_IO);
+	close_sessions = true;
 bad:
 	pr_err_client(cl, "corrupt snap message from mds%d\n", mds);
 	ceph_msg_dump(msg);
@@ -1197,7 +1186,7 @@ void ceph_handle_snap(struct ceph_mds_client *mdsc,
 	ceph_dec_mds_stopping_blocker(mdsc);
 
 	if (close_sessions)
-		ceph_mdsc_close_sessions(mdsc);
+		ceph_mdsc_schedule_snap_fence(mdsc);
 	ceph_blog_exit(&__ji);
 	return;
 }
-- 
2.43.0

