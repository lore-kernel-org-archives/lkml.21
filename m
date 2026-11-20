Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157777;
	b=yD3CNaXopVEtrIBu1GQWOToPsrRZ4mZEF/9qauVcxZhrQxSUT8QMHoxVWZjgkA7eohAn
	 dsCHbw6BOFVIU5Ncc5rg0DmLRMiSbHKmwWkDHNpecwWH0z2LibpWmuqrlCORP1CHyUK64
	 dIX6U2/WwPeAz1WQGpe8GxuOrYtHl6X0EcUJF1pskopvdx+st4lukl45o9RpZ3sagmG1q
	 xz+zsjP3ftfEufGXuaqj93CqVz5vpdwUJ49Y5z0IMarA22okA9O8HVEP209C4Lu3sWQrG
	 d0WXFj83qNw3RAEfvbdCaL2xnHZKdQwl+/Daem+PdF6d189lI7TXaM8UIBGCDoAntBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JSpsy0UKa4DIFK4RDl3FsapGjP10wN6PK5z9B1SUUFk=;
	b=rESxFW+3LFNPlwpr3TgMiQFhyDWwwa5c6RUivHElM10eXupjC1lRbNc+zhxD0+3FUDF5
	 tOCF/J/Zr0WtO5rEI2WhD73LImGE4RCE1rLW9aRt/nAfPdlR80HdS2Q5JrbZjvftHTQYQ
	 C6XC3FTO9GwbIdnumP2KXbe4r4t+e8sTJBQSC2E+JolJl8SEV2OTUWuB5tpbwC04e/9qb
	 eqV99+F3nhFtdfF/iDuDu5ugLoh1LO1djxI41JHnhaltLnzOffcE1V/WlPF2CF5ErLXj6
	 L81xteFQ9YpUMPD6FE1qmHyj1GViyKK5bUSFOpFzngkQ5ZU3/wpLlGOGTqPqLIkdlFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3dSOuK8;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B761F606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B761F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3dSOuK8
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso306544a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795157776; x=1795762576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JSpsy0UKa4DIFK4RDl3FsapGjP10wN6PK5z9B1SUUFk=;
        b=D3dSOuK8blb0kHtl09c10+5Fp1Z+ZrQASGIiIVZKmUlx2qPo1qGKHk7NzGrv++yXvj
         mY9Khua8KaqGTYIXlYujWXGkgT9WlfDmpPkph/hCtJbo3iX3h7YDEP/QDyjuDZCGPK+3
         8IL+nwhqTIPjteOMI/DwIP/jORxh2MyIkvI8hdc1/qYBp96mWFX2TeDd3O2gMtGCbfii
         szZ1DcEAjyrWNCPNbazT6PecXNbrdMl4RfGlnjtrrIV1+KEGpLoklovD+VndqkDkS6xS
         2Qri1yMVoaXOXw8D6fOZVY06XoqjlhwVwTsgOifz6VbU48XSWrnhRbFHp7JgC1g3Xfop
         hDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157776; x=1795762576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JSpsy0UKa4DIFK4RDl3FsapGjP10wN6PK5z9B1SUUFk=;
        b=BtiLSsZ29oH4kW0xazQk2b3SCf2YDf/SLxP/C0DxF+8tKG/+oK8rCm51Mww7jndV5v
         kFwMi6YsfL+Xymn2jCrecHjTYfzUdk5679HSy1f6Bqi2nIiGelJnu20rNYyOOkqtdZbv
         pRJ4HOuRG0HcpSW1mNTkeIAbm//BlIkLh8k8N96aoxSR2AA9qtlqUxDm6KRQ+iTU2sno
         8P9ZQM3NDIZr0b8jEzAJUf+MgoDsW5srryv0QVFjaTSXVI6o3Z8uHv9GZLy1p1Vr+OpT
         TVD27OfDb8JMU4YazFN7hytSxmtyiqy7NFodvxCeWlwzMRLwvVe8fT8qkhZVHZWZFT6m
         ayaw==
X-Forwarded-Encrypted: i=1; AL+hErGLnnB4dYBmkWUzn/vA2QVG9/tF2GUpB0cFrmLb+TG9Gk+LVhI6xv7i9YlVw2vCjayiu4QXzYw0Trm0wIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Drgrgn5njGtKjU7io9fxoQB5liOb3Yt3AFn+VmaMjLuOXoq/w
	cwBohyH7ZUBZKsFKReURkvSyHETIuIGKCd6vXF+3MGf8SeO2eQUolofZ
X-Gm-Gg: AZFdTZdJUl5iAercQuzgMdfXDzuxQe7gxIBM3bbsZk5MRuhhHe/gxXXQ19yRO8acBvQ
	vX1qixZ9S+ssTijAE3k3AeqSAhyjdkSlyRg64bI+1xVzCLLC6NJlhUX+ZWWsAEOJj6RehsZ6ltV
	aOiiTgNrwvudkAJW15S7SvfKPgN9L5IWj8msi2RPKtO/dE1m/R2PVho3DHdZWJ+mVIl/bi2GjcJ
	NA1CGtBgZO92G41/BHQDCf2DL4lM3Kq2S0F7yG75jL4N+8ILLH2mnbEWyAtlMbGLcB+Fhsjf+pg
	uUJobKO2NBbGbmIqSdoi6HUhyrdMaBo2CZahjnmkKC7v2Je18wOFt9sA5W/aPP7y/YAhLBvN86w
	VSVRsq5dNNyYTEFxgbR7/P+7kqbJT+apvn/XQX5pdh6eOHx67fLeowsKYb92Cr6EO+3/mbL8z/G
	+UjPmUIN/4fzj6z8VemZfLWky9LiQBy6xtwEN5Ann3L/YROm5e7wTlluwUGfkNh6DZH5ljH+Fql
	zzzUZGzTEE6IUFZp5HJ7GeJjvYXkxukWagCVbA9735mn0Do5b/CIDbTSScoOo/yfN+ddXm/hHoe
	MAY96weXRoS2VmKNYbzUr7FC/X29vrkYILM/yniarTCmKOp+FOshE1TmPEXILv/Y
X-Received: by 2002:a17:90b:4a47:b0:3b3:fc1f:a5c4 with SMTP id 98e67ed59e1d1-3b41c8dc821mr1899005a91.20.1795157775908;
        Thu, 19 Nov 2026 22:56:15 -0800 (PST)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm1952926a91.7.2026.11.19.22.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:56:15 -0800 (PST)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: sched-ext@lists.linux.dev
Cc: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	haoluo@google.com,
	brho@google.com,
	joshdon@google.com,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v2] sched_ext: reject oversized dispatch_max_batch
Date: Fri, 20 Nov 2026 06:55:54 +0000
Message-ID: <20261120065559.3979434-1-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.56.1
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

bpf_scx_init_member() accepts dispatch_max_batch values up to INT_MAX.
The value determines the size of the per-CPU dispatch buffer, but
__alloc_percpu() rejects allocations larger than PCPU_MIN_UNIT_SIZE.
With BPF_F_LINK, an oversized value passes the struct_ops map update
and triggers an illegal-size warning during link creation before the
allocation fails with -ENOMEM.

Calculate the buffer size using the effective batch count, including
the default used when dispatch_max_batch is zero. Reject values above
the per-CPU allocation limit with -E2BIG during the map update, before
the allocator is called. This also covers registration without a link.

Fixes: f0e1a0643a59 ("sched_ext: Implement BPF extensible scheduler class")
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
v2:
 - add braces (Andrea Righi)

v1:
 - https://lore.kernel.org/sched-ext/20261120054913.3795562-1-rhkrqnwk98@gmail.com/T/#u


 kernel/sched/ext/ext.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 10de6bd865e8..56d75d179822 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -9196,11 +9196,17 @@ static int bpf_scx_init_member(const struct btf_type *t,
 	int ret;
 
 	switch (moff) {
-	case offsetof(struct sched_ext_ops, dispatch_max_batch):
-		if (*(u32 *)(udata + moff) > INT_MAX)
+	case offsetof(struct sched_ext_ops, dispatch_max_batch): {
+		u32 batch = *(u32 *)(udata + moff);
+		u32 nr = batch ?: SCX_DSP_DFL_MAX_BATCH;
+
+		if (struct_size_t(struct scx_sched_pcpu, dsp_ctx.buf, nr) >
+				PCPU_MIN_UNIT_SIZE)
 			return -E2BIG;
-		ops->dispatch_max_batch = *(u32 *)(udata + moff);
+
+		ops->dispatch_max_batch = batch;
 		return 1;
+	}
 	case offsetof(struct sched_ext_ops, flags):
 		if (*(u64 *)(udata + moff) & ~SCX_OPS_ALL_FLAGS)
 			return -EINVAL;
-- 
2.56.1

