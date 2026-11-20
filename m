Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153919;
	b=NQho9/LDLPShviZxDhbYm6lkYdrg5LEad8A1lEIiT6lSpXvu7gb0mhM/TIE8tQtOPX6P
	 zBkgvvNRsNqk/RHWDSDqndaHz8/ZSX2n7J1Md6MunUJWtnMnOue5W5qn3dJr7z0fb8YtN
	 vFSvak/TVefz7FtPh2Sb5KlHiMAzsWdiXzuAwj3KRuykM+VnNlmS+OhxEc/CFa62Awb0G
	 y/5KO5ueaCJPBdfnU9evGQSova+MAkVvCGC6FS+3qkAh0WkW1T+2XYaQDZVHhUNId66qh
	 7DRYYw9fUUiPBTm/6b/4g74mLQ7G45iQtC5DuckH7dvxmTuUbO32d1r8qoGXWlgfA7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OBFWFQ3yvSvM14Hz5XmTfrlvvKw/w87tsoZwb4IBO4M=;
	b=i+BrIFk99Q7zoqK5dDFj+Du2LeNjWerhCzDa1bodz1Q0yWPy6vbxPkFKPS0H7RzgaL8j
	 dQKB6Ra4qciSjxCdRv/W0Igh8qHm3Ty5SujPtxDJMsY0Oo+G7pe0E5kQhrSPMRo9IwNEC
	 5vhyYnyeb8uKg+8j3UKQo7CtNMk6dre2B48GPeVH+KDcmIRy/n56t/jhZw5A/jAHdFqZM
	 tvLTHUXMUn+90dGegrktlErRzNe2qSduomt1mPw4GkOfcAvgqD7HwFOx5mWvOr2VXmtBf
	 B9vMts5HVoYdpEmMIkfvPYNXcSKx2GzMs1KPgPEiVduZhDhHTdAPJ/BNTRxHGxaO5dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwdR04+t;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F736606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F736606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwdR04+t
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso238657a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795153918; x=1795758718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBFWFQ3yvSvM14Hz5XmTfrlvvKw/w87tsoZwb4IBO4M=;
        b=uwdR04+tB/T/p2cupZCCzrCB9+v05sG6vb21FTTtLNoeHPbmCbVHjNQ2A4W4Vbc70P
         PatreL7eNkVim7Bu+1Tx2Cus1Ttd0XOVTKAeNV9j3+WuNnPHvUEj1tVSiApv+SoBLzwT
         e2yuQkyEdXbTJ+CKHdVE3oWCD6pO0I35LBfZgsdIqmf6vDt9p6rPjk2+85KvGwIurn8B
         xNLAwwp6X9a6SVKsiebmD8eof/p8Ojm4J6f2IZUF6k2m7Zf9qGv9Ht8zEYGVvbMsbCpX
         qL+SoWdUQxDpZceZ0agqSp/WWDjC+u8xpHXo96ZjdeDlHEwKPPpAdklPzFYNQXOG3kTP
         mKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153918; x=1795758718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBFWFQ3yvSvM14Hz5XmTfrlvvKw/w87tsoZwb4IBO4M=;
        b=Mj2iOf5rXjX2trGHT6Q2oBx9qSQiC/ih9t0CZcBtOlEHgvCpA3zls5/ky5ikjh+Hp6
         8aoA010rpF6jyS7wdJr9rvCn2gMtrl0Rpd4wcUhOzuWKB4aaJVbx58ZTDdckIOecK+4W
         jAVwgnwpuflG0aD7rW5U4nHESLLBvfIC9g+pr8KpEhYSjqoauB5uHq9oUysbUI1Xk8Kf
         CKPzhQH65ynboieWu7Yp2sqyl2S3O1HnsstecbgahdLqYL4oPT/2Zswr+Fx/dqWDklGt
         oI0vkpdeOBnN1Tn5vkNs9pxRTHCy9pnkoRgnmLViWyfiwpO3d1ufShYfX3FVTddzcMXR
         JCHQ==
X-Forwarded-Encrypted: i=1; AL+hErEvIrxVNAXuP6tmTt4i7dJwL5LCsmtPDJqpxeeZX+VVSdHdCZXCWVylixmCrWugvqxE9+UVfT9D/8/5Hrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Hx83+1XWW3J3iE+B7Ln7G0jx8sAVdRJLkpnVppBA9d4KBREML
	yqEcexJa4ob57oVVr3ybWNjgdrVqPVaqnQqoXZQ9px2bqR5w1AmlassS
X-Gm-Gg: AZFdTZe1ZRXbNO/f+BzLuyt2tE+JDRTpVGLs2xH87bTy+eISJ26J7QY/aM1uMwW4nN/
	Si9giZ1wC3HJUEKdGVf82pPw20griUF2lngH2dsZYUppgYIEng6hJUdgzbL3IbdqOFtiUvUu2Ql
	Vu6dAzdyuq3CXI51a7PCpCiXbHNwBI5ty45vJyQNCAyP9q2eAPTyGLYcmT5E+5JfXXa58FWydj8
	hq8RFzILGwUtVbdRgUm8SaqS+edBoMVq6N3YISjvHU81eoTHZGbLK3It/e+sqU5t7bEZ/oExMDy
	VXSUD8aCBsapGTN6ESXkLfVvohGheyy4ZK7AHHez8FimLiJx5CQZHKSBxhvqYRMdfqX1jDSYK8r
	a3oKqMWlvNlx2btJv4X30L15CP8c7EMRybN++s/lEJ/gglk1mJ/TTb/W8bH7BX1QL3Zzh5hN1Cl
	1p48OwgEK8b15M0W/TXbFj87Su6FgbZlv/g2ViVOgZHRAcBUp2jHrzluCxkFF5GrQ9q9oETxMyo
	U4cU3wLvxLFgU5UhoNR/ubwlsxoSRjD6Z6hXWsXJM3v7AI8/iCfWhBpO8MKntIIt1OPMoEEoogR
	r+ZPiRCpUQrx4QnkAoehxfLI4TdAKHd0LHlzkpr2DJzTFpqLlgEqAfVKl5ktgccw
X-Received: by 2002:a17:90b:380f:b0:3ad:1da4:2ddf with SMTP id 98e67ed59e1d1-3b41cb0cae0mr1572880a91.51.1795153918487;
        Thu, 19 Nov 2026 21:51:58 -0800 (PST)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm5104045a91.11.2026.11.19.21.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:51:58 -0800 (PST)
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
Subject: [PATCH] sched_ext: reject oversized dispatch_max_batch
Date: Fri, 20 Nov 2026 05:49:08 +0000
Message-ID: <20261120054913.3795562-1-rhkrqnwk98@gmail.com>
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
the allocator is called.

Fixes: f0e1a0643a59 ("sched_ext: Implement BPF extensible scheduler class")
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 kernel/sched/ext/ext.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 10de6bd865e8..93128da6b126 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -9197,9 +9197,14 @@ static int bpf_scx_init_member(const struct btf_type *t,
 
 	switch (moff) {
 	case offsetof(struct sched_ext_ops, dispatch_max_batch):
-		if (*(u32 *)(udata + moff) > INT_MAX)
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
 	case offsetof(struct sched_ext_ops, flags):
 		if (*(u64 *)(udata + moff) & ~SCX_OPS_ALL_FLAGS)
-- 
2.56.1

