Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446043;
	b=hl10VmQzAsR0XH1LTehBw+BHJlPsKPbCB2+vSlk+JEvuiGNe1G/Tj9L9rTmomPnYUPPN
	 yHTI+7ccVl+o/eK8iokjxUrSYZUEg3C9C2b3SGFIP1MeTU9/DC2Ymd4VRYxAvg5UZjwgm
	 Oh1JjAhTDishFDvPPLmff3uqR9wI1+T7mcXvHYxq5uB40BNbjJASTc5dHm8eKjEuLemY3
	 u0pzpBivodkdujAISU5CsqGEva/QaL6YN5Gea0bOjM2rBmZb/f1csMBz+RbKW3ZVLCOnK
	 z1bO717F0cK2bBYJfxbXlcAhkMpKxUsu2uAIAFQqj1FF/BJoM/m1TJtran4qychWKWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=5bhB0j7PZndj+krPWvFm+PmAXvCQo2vJ9BSvfaD/GZg=;
	b=xxwnZywZwbQHb2fU7ub7gjv+ZXHRmKxN6TXwNm0V3e9eNcYZBcJPshD332L994+0IvxG
	 EiAKEFsdHdTnP4gHvuQ1BTkxXcfv3fjWWXE8d4AowiGwNM0gg0RKsRwIXPmz36G7WNdq1
	 uKxwgaGMMFi1YSsgNjUZRZW4oNw3GpjSYoTWsttOiQ6L/wRA8/W2RgQ+yJDJpmG82cMrS
	 e7nDLyeZ53HBh70BnI7xh581/jNJMR4gth/3oaoaNTHiP0DUbfrSusQXOKcWwIBNXP1kt
	 yxOh6yr8QMcf3p4kI7M0rD2YVcidoacG/NUxQvTcoTnsPSfe2AKQU01uIqFP8cHjlZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Y/+XJman";
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1792606A338
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1792606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y/+XJman
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bb9379a835so11004175e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795446041; x=1796050841; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bhB0j7PZndj+krPWvFm+PmAXvCQo2vJ9BSvfaD/GZg=;
        b=Y/+XJmanS+igRi5r7n8qDexvPItPb8a8GzqQ/6NhpFXtfC2tE9RsSshQ/sghV+SEkv
         wYMczVSvGtov4i/D+fLWcNCF2ZAeoe1ojqqtmPgk3anlo5AC9M2Ixk/IBuyd7U60eN4G
         Dx2HMdUkAsceG2W+FcdT1FWe1UiclwFvrUVVS5yAq/CyVU8OrY7qSdum/85OLVA9+dZx
         iUx8knmHEqmJA2jKqQgwk5KFaA9UIFrORFdXZEaffDC9He8krrdskeE8WQ9aL1EA+BuQ
         bsS0p83VRz222LS2bMVKxkFhtAJqvqnx0AL7tnphMKYAwfxkFASRF/AaV85mif+lGgkg
         h4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446041; x=1796050841;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bhB0j7PZndj+krPWvFm+PmAXvCQo2vJ9BSvfaD/GZg=;
        b=Jjxztqckvr5O4Zu7TmE+/oZZF53RwghMcLE4YA7fHMJnXRRAW0CUq164Zlo6Gv6muX
         zEqyq4/LDi9H5sCWeIWexqDhEprpz1F/aUQntP3gCY/UXsGZIUt5MSk0MsGGZ3u5wdCF
         TXndbb3bTRCyBujMJdnyi9LetnEZEhHABlCIDc7RDyPk/2N+4k2KjZDKZ06E9xLh0awm
         2sVnrpUDNljFboRKqwa+od49RtbZUBkrWadDFFIhiFZkKXkKMhLS2cvGZZPkCG5XVh2D
         AWdYp+7bezp64rAt1JPimIpbFqMrIfLHwfGiauEXZp+QbPkD34Y2QG+qIDBX+OKqSBka
         9idA==
X-Forwarded-Encrypted: i=1; AL+hErGJVkQszaMjNBwLsZS1orHZlupYfl5W1kOoqwwgvrxHyISfu6UsTkoYOKv/t8Hg/Cyp7hRLUDP5VoVqgUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SfsuQDZcKRpgRvcN+yGPZNjI74w09EmxYqjj85mLpQwBPo4fR
	9sOgCRVSdSErOBEBj+LPeihoPGrLM7m/HKe7DdcsWdM43alPaxu95KIdVIEs6moV3XMniLcLfyr
	YrjI3IbWRhIhbaw==
X-Received: from wmoi24.prod.google.com ([2002:a05:600c:4818:b0:4a2:df9b:ef74])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d09:b0:4bb:6b59:aac3 with SMTP id 5b1f17b1804b1-4bb88816050mr251406095e9.29.1795446041138;
 Mon, 23 Nov 2026 07:00:41 -0800 (PST)
Date: Mon, 23 Nov 2026 15:00:38 +0000
In-Reply-To: <20261123145927.577162-1-jpiecuch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123145927.577162-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123145927.577162-3-jpiecuch@google.com>
Subject: [PATCH 2/2] sched_ext: Take rcu_read_lock() explicitly in sub-cap kfuncs
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Ryan Newton <newton@meta.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

scx_bpf_sub_grant(), scx_bpf_sub_revoke() and scx_bpf_sub_caps() look up
scheds via scx_prog_sched() and scx_find_sub_sched(), read the cid
tables and, in revoke, walk ->children while holding only
guard(irqsave)(). They can be called without rcu_read_lock(), e.g. from
sleepable ops or bpf_timer callbacks.

This works only because IRQs are disabled and none of the RCU checks on
these paths require rcu_read_lock_held(). A plain rcu_dereference()
added to these paths would trigger a lockdep splat when called without
rcu_read_lock().

Take guard(rcu)() as scx_bpf_sub_dispatch() and scx_bpf_sub_kill_bstr()
already do. No functional change.

Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext/sub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/ext/sub.c b/kernel/sched/ext/sub.c
index d2a20114eaa2..45aaa333f9c2 100644
--- a/kernel/sched/ext/sub.c
+++ b/kernel/sched/ext/sub.c
@@ -2870,6 +2870,7 @@ __bpf_kfunc s32 scx_bpf_sub_grant(u64 cgroup_id, u64 caps,
 	LIST_HEAD(to_deliver);
 	s32 si, ret;
 
+	guard(rcu)();
 	guard(irqsave)();
 
 	ret = sub_cap_preamble(cgroup_id, caps, aux, &parent, &child);
@@ -2999,6 +3000,7 @@ __bpf_kfunc void scx_bpf_sub_revoke(u64 cgroup_id, u64 caps,
 	LIST_HEAD(to_deliver);
 	s32 si, ret;
 
+	guard(rcu)();
 	guard(irqsave)();
 
 	if (sub_cap_preamble(cgroup_id, caps, aux, &parent, &child))
@@ -3092,6 +3094,7 @@ __bpf_kfunc s32 scx_bpf_sub_caps(u64 cgroup_id, u64 caps, struct scx_cmask *out_
 	struct scx_pshard **pshard;
 	s32 si, ret;
 
+	guard(rcu)();
 	guard(irqsave)();
 
 	sch = scx_prog_sched(aux);
-- 
2.56.1.750.gf70dc682cf-goog

