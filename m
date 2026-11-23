Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442130;
	b=4cohqLOtSLma4vFl/vfyRDw27UQ8PNjPLz7lfe6nspp92VUMV6FIAJa3yyI7Un7gCh6X
	 foPjG9QRPcWujQmn64Y1njmOibNkis+0FmtaRl9Lu3KINtCA+o21wj6RhHoOPsUfk4PqY
	 kZejtnZ+xosnd4QpzQ4bQqIZDS6FKrD35c3N5utTjeqLJayB+4rJ1OBQ97HMyKwwv42DU
	 Hk8Sksvq4IS4OBrMttxGz2c0iuxT9XJBa/5ObAFsBx+TwL1Y1PX+78sEz2RoND568RqlI
	 1muQD5xj/cZq54xAqf4HkSpkpU9IGGWhS0m1X36Silchc0aHUwopBeHEzxm8PFP3b5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=GiEDqbasxNBPTvJr6p1jL37OR8h8QGYfgXABsowoh2Y=;
	b=t9APjM9h8lesZR+TqKfoJ03TvgpmlotcjQpf0GxX7VZB4lNXtSbNq0KWr3jCyMitkjPL
	 3CC7FXrNd04rVWMMSZ+yQUDWD3VxkvY0QH3Uew9pPh/hHqnQd5vX++s3c1desbqy/2j8y
	 ZkFjz+LTy+cqP0lwHGjaegsMlxTCZ54izK8zyFKYtLEv0lTRXrbM/idMphRutTvDrwktR
	 4J6zPhljmXpIu3VPtWBnZYxLvQPSwPdPr6pzFiw6Go8YCXhPfyiSbaNPAbYz54/+AGkyz
	 9hxbg24MUBeep/957Wz79z5Tfk8a4Bq5/aC8VLBeLMFxKZ5dNcUGbyBSUU0zEhtPNEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fgjaOXf3;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693C9606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 693C9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fgjaOXf3
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb6bbc025aso25674055e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795442128; x=1796046928; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GiEDqbasxNBPTvJr6p1jL37OR8h8QGYfgXABsowoh2Y=;
        b=fgjaOXf3aqwUjSFUvt+UzjWtuSqq5OOE+AKgSEfE2893CJL4W3OvSBJl3EAr572yWB
         A4GGzcvOV32dIs9R0XMjGRIL5m443avigeJ8Bxb6cwV9qjFiJK8YFwRhUODGTaNsHT6N
         nnYIA/aQo7kQ8DSkaYvPwHQVpyFO6onoQRiWUG+75hPDiCKclshVC5NMfMuypAPtIoOQ
         y+c142mnNjq6JkV5Z9IVgqDPqP9IaFLQI+vZzBonEngdHyiPutDSazQjwDk+s98rYdXn
         kiVAsRKIdONUU0RQCE7TIjvVa6hP+KWt74mLhjpanqPdPNS8G4XCBY/cmsprs90gT2Og
         Ziyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442128; x=1796046928;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GiEDqbasxNBPTvJr6p1jL37OR8h8QGYfgXABsowoh2Y=;
        b=0kjmfkQdWGKtn49jaDxl71Fml1P1/MlyswpGmeE37BU1ckX9kp0kvGsy/UWU7Xgm8i
         D4IMlXB2rJ3xesFNTJJ8XJG2mUkB8zBhgYeXnTHu1STXtqCFdwo9ud6apFCfV41eXx3a
         6OszRx8DWiC1+rSnUFSTAsB+OqU+H7QQQ8+4RLy2MOowvnhJ4qkcjvsQOOIZGFTWBnU5
         M/7UJXKecKQ7s93mnOH/Fb1YkrsV5BhcM5EIrDEySvKMO1js59XvNU74fsp6rxlyzuqX
         IMrfbaW9DlkxBZuH442vMPs239B7m1lMPdnUpMO+iUR3TNFrNqqnIzw/soNczcveOpRO
         Htuw==
X-Forwarded-Encrypted: i=1; AL+hErGyXyggXwYtkqZU8Tq4aM6l6vDeU6UT9my53XBb0euE1HQrc/sqJPkzgHw0kX5H4nulWejENZIGnTZ0QvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c1Z4QhX30kNMzwoNeg+MF5M/Hv1NflVHCMtBKZAylLinbpbYP
	QAxW1zhN39FfKhl3DLwcfexGHjaoN8b7hhiYTfPVjaMdp/TxoBUulo4OqtmcE1KcH0mAEBamVue
	ej7USl8rhdI5vyQ==
X-Received: from wmgg20.prod.google.com ([2002:a05:600d:14:b0:4a2:e03:1f55])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a15:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb88938a62mr239364585e9.28.1795442127735;
 Mon, 23 Nov 2026 05:55:27 -0800 (PST)
Date: Mon, 23 Nov 2026 13:55:24 +0000
In-Reply-To: <20261123135343.4131146-1-jpiecuch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123135343.4131146-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123135343.4131146-2-jpiecuch@google.com>
Subject: [PATCH 1/2] sched_ext: Don't allow unlocked kfuncs from ops.dump()
 and ops.init_cids()
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

scx_kf_allow_flags[] grants SCX_KF_ALLOW_UNLOCKED to ops.dump(). This
allows ops.dump() to call scx_bpf_dsq_move*(), scx_bpf_dsq_reenq_task(),
and scx_bpf_select_cpu_*(). When no rq is locked, these kfuncs acquire
rq, DSQ, and pi locks and may invoke nested SCX ops such as
ops.dequeue().

scx_dump_state() runs ops.dump() with IRQs disabled under scx_dump_lock.
Callers include the hardirq disable irq_work and SysRq-D. With
SCX_KF_ALLOW_UNLOCKED, a debug dump can migrate tasks and run nested
scheduler callbacks instead of only inspecting state. ops.dump_cpu() and
ops.dump_task() already deny these kfuncs. Remove SCX_KF_ALLOW_UNLOCKED
from ops.dump().

ops.init_cids() runs before the cid tables are published and before the
arena pool and pshards are set up. Its only job is to finalize the cid
layout. SCX_KF_ALLOW_UNLOCKED also gave it scx_bpf_create_dsq(),
scx_bpf_dsq_move*(), and scx_bpf_dsq_reenq_task(). Restrict
ops.init_cids() to SCX_KF_ALLOW_INIT_CIDS.

No in-tree scheduler calls these kfuncs from either op.

Fixes: 4c30f5ce4f7a ("sched_ext: Implement scx_bpf_dispatch[_vtime]_from_dsq()")
Fixes: 874fdc0e86e4 ("sched_ext: Add ops.init_cids() to finalize the cid layout before init")
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext/ext.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index e8c30a21e03e..6274ea04fc6f 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -12293,7 +12293,6 @@ static const u32 scx_kf_allow_flags[] = {
 	[SCX_OP_IDX(dispatch)]		= SCX_KF_ALLOW_ENQUEUE | SCX_KF_ALLOW_DISPATCH,
 	[SCX_OP_IDX(cpu_release)]	= SCX_KF_ALLOW_CPU_RELEASE,
 	[SCX_OP_IDX(init_task)]		= SCX_KF_ALLOW_UNLOCKED,
-	[SCX_OP_IDX(dump)]		= SCX_KF_ALLOW_UNLOCKED,
 #ifdef CONFIG_EXT_GROUP_SCHED
 	[SCX_OP_IDX(cgroup_init)]	= SCX_KF_ALLOW_UNLOCKED,
 	[SCX_OP_IDX(cgroup_exit)]	= SCX_KF_ALLOW_UNLOCKED,
@@ -12309,7 +12308,12 @@ static const u32 scx_kf_allow_flags[] = {
 	[SCX_OP_IDX(sub_child_ecaps_updated)] = SCX_KF_ALLOW_ENQUEUE | SCX_KF_ALLOW_DISPATCH,
 	[SCX_OP_IDX(cpu_online)]	= SCX_KF_ALLOW_UNLOCKED,
 	[SCX_OP_IDX(cpu_offline)]	= SCX_KF_ALLOW_UNLOCKED,
-	[SCX_OP_IDX(init_cids)]		= SCX_KF_ALLOW_UNLOCKED | SCX_KF_ALLOW_INIT_CIDS,
+	/*
+	 * ops.init_cids() runs before the cid tables are published and before
+	 * the arena pool and pshards are allocated. Limit it to finalizing the
+	 * cid layout; everything else belongs in ops.init().
+	 */
+	[SCX_OP_IDX(init_cids)]		= SCX_KF_ALLOW_INIT_CIDS,
 	[SCX_OP_IDX(init)]		= SCX_KF_ALLOW_UNLOCKED,
 	[SCX_OP_IDX(exit)]		= SCX_KF_ALLOW_UNLOCKED,
 };
-- 
2.56.1.750.gf70dc682cf-goog

