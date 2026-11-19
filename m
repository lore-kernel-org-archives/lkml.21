Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090133;
	b=KdJ5NaiJfsZHOtDboTggc7igFr4lJcZFkgV3Pqy8HZQHgKzMyO4kEWt16KWBu5DdAOTT
	 jPFc1OnPDD+XZvayGaAcj4wEqIeHMAszTQfZzNWTWpyTE3pLRmE1Xrbr21uhWvlku+tht
	 R3KM2+0s5tazW7Ko2bDatBMQ6DZyarPd3ltPMIAFoOfxhBMa5GzPr0d8uHc04XNmGdAfT
	 rla87ri8KfIESQiUuxvsEpGXjNKgv309PC7aoUuDKh/ojw0seyTmRnBkFDKj5XdDcJrcc
	 A1ipmTpzUDeK+l5F9oKgMYRkZBxbrnBy+7oMwH/q5EhxesNXAVdsv8uAQ5xsui4ZFew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Mw3u54M9upMKnOTAPQin/ZVJiGtWbtiuAdgAa3Btsi4=;
	b=U3SlAfI20kIVxvt8ob4BW9+sZEjz178OiscV8Iu48BV3+UCkll0MOLHIvXlC3u0UKPx4
	 V12xQkfvH3Szwqlr13uSs0iXn1Cq8FepMI8DbA2rouD9rIb7kDwbjDvA4OobFaYV5PazP
	 cB4ZHGPzKH63lD7AumSS7MeThZWYA4blQG63/cXCEfZS06hg85ihPoyzVByyLhrZzwq9X
	 qI5mOvA4A/psoKjZYQWcJUn5cWb0YMdIUleIoqLUTw1+UW9E5H2o+il22pN1tC6E+l3Uk
	 zUeU1MG+OqmSblYK5sTQLclgwC8vl5x/aD3Kp6TRMD57RW9amqPygPUgIhaYDrUBAbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=egI8yLps;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F13A606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F13A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=egI8yLps
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38190551625so3687913eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090132; x=1795694932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mw3u54M9upMKnOTAPQin/ZVJiGtWbtiuAdgAa3Btsi4=;
        b=egI8yLpsT1TcpXG7FWrPnSNvnTSiGqrZZE3a8agI1o/D4JSq9/E4tsAuuNUQVrcm9y
         fgzY5Yf3sR7gyV6QT9Ac0oR8pVGVa5yIuGuXPWCEt67HAIsEqn3D9V4U3HAPDROxx4wA
         3suRFZZJ0enq0M7EZq/65yUhXyDX3qbVGrPlHsf1oqnj2LrzX9ZC2aGyeNxXW0A9dbJe
         zK6xPotoMWQMRt2qsjXoLivkEVX05nWFOwscMyTwFXTlHehvDfo152gnjxg1foVLp0Wo
         KowrxL5kS58u3sbYF4yHZkx6LDStoLh3+jfIdBOwYvWDOJKrFTYTYpXB/ii+SFXmm0dn
         gvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090132; x=1795694932;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mw3u54M9upMKnOTAPQin/ZVJiGtWbtiuAdgAa3Btsi4=;
        b=Sqx2F+SEE3hyPlKOw91eRvBxoGLvyuryGpmGuL03Odv6OKj32BRkvXtnS0ASJuWnu4
         FC/XH9U8lmvSiy+9Sgsnlb76A4CdZo2jNWnmaVIHBZL9eOneKuPtB6jD6jXWKV+kAVvF
         kl6Xow7zjPXyiZYoiE7z5JBqUs0/usJuQ5r95UoBgX/c6KpzuQ8c/r6XzBhoHPeE4kSU
         cj+Cr1T8ovq9xYvgQcT/a6Z5H8bRWOiRQfBuVLfHY9SiKbillQ8Mzrm0fSle4EcH+YNw
         ryk3aIcuzqVqSQxQD6kOlfS811xi9oGCFG9p/ZHfgNjZP3vhQ+oCQ6kjkc9OYVGqIM5i
         mxcw==
X-Forwarded-Encrypted: i=1; AL+hErFMTNums+NgCpEq0mUof7QXia3E0wskkeQKYpgo1yiTdpn5miMCphCqucoKubkD2tMjYtqrjcWZICxBztU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cTyLEyDKZiQIWjy7Tl9yuc0MCWoCcLlM0V/8l4EZxcGVyVjjs
	B7xU7aBp9xSuUAQAK6NACjau+B/mdASw9AvOGcV7sZ+eH/wNbpJyoXMRZlLdO7GMKf8=
X-Gm-Gg: AZFdTZfqbHdyDxY4G6BULl/kCWIuR5NVCMyTO+pHxmKnjr6QDj8PRhu3aQLKCqUgiMd
	2qw9V4WXc+Ap1/epR7vOATz/mQe6NvKsgTcyfW47IrVMWjy/0eqDVfbft2ABhrPhl0fuY/bfS9G
	0jbiDvGn3HMeD5Vc8oi/Hofi9wOoYyHZDjmwQILQnnkv0hY64evy9MQGAfq3/5wdlqwmDCyUFzh
	h3dK8IzLkzjd9np1DBRaRTH/YL3QjyPqlF2tvEs6FVTMBX9KaqkMkqnYuMQuRH8v3wfsfV+tbc0
	+9V8TeFHBf3mjhS8m/dO6i59Ty+XWjYC6lj2QMcjFqiaGQm0bIR4AhvhLGWRWnsGzhyCXT5wcu4
	PIT88Vojx5pThQScMEKgSzhpTYP4+gIGmkdnh8biK4vyadPrSSNvnwxo1Dg6faS1ZCwNt5QGXR+
	Kfwx7TQ7vFsgoexDqYxyR9UpzXhUfQmp2+S/ZZ9VPXyn23XGs3KHJP2XrnhpztrQ3wstTiauhkH
	3vK8bT2fyDSRzSfCd3d3E6y6q5gPg8UbKX69N6c7uu29vrHESE1Z0NIsRhRNct06tIaZGCLnD8l
	YFeiIPLTwJrYLG6dVGGS+WUMNTy+yhn3KQBH45+I+Xabzouw2zXwqkSQz8aQNp38UuazOarISM5
	GQEI84Bc=
X-Received: by 2002:a05:7300:b092:b0:374:ba43:ae2e with SMTP id 5a478bee46e88-38280078014mr5600153eec.14.1795090132300;
        Thu, 19 Nov 2026 04:08:52 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.08.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:08:51 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	himanshu.chauhan@oss.qualcomm.com,
	conor@kernel.org,
	anup.patel@oss.qualcomm.com
Cc: clement.leger@linux.dev,
	cuiyunhui@bytedance.com,
	atish.patra@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	will@kernel.org,
	tglx@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	shuah@kernel.org,
	yuanzhu@bytedance.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangzhanpeng.jasper@bytedance.com
Subject: [PATCH v13 01/11] riscv: add SBI SSE extension definitions
Date: Thu, 19 Nov 2026 20:08:25 +0800
Message-ID: <20261119120824.13969-14-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
References: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Clément Léger <cleger@rivosinc.com>

Add definitions for the SBI Supervisor Software Events extension [1].
This extension enables the SBI to inject events into supervisor software
much like ARM SDEI.

[1] https://lists.riscv.org/g/tech-prs/message/515

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Co-developed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Co-developed-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/sbi.h | 63 ++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index fd6266a7b339..eb22d79cea61 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -40,6 +40,7 @@ enum sbi_ext_id {
 	SBI_EXT_FWFT = 0x46574654,
 	SBI_EXT_MPXY = 0x4D505859,
 	SBI_EXT_DBTR = 0x44425452,
+	SBI_EXT_SSE = 0x535345,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -508,6 +509,68 @@ enum sbi_mpxy_rpmi_attribute_id {
 #define SBI_MPXY_CHAN_CAP_SEND_WITHOUT_RESP	BIT(4)
 #define SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS	BIT(5)
 
+enum sbi_ext_sse_fid {
+	SBI_SSE_EVENT_ATTR_READ = 0,
+	SBI_SSE_EVENT_ATTR_WRITE,
+	SBI_SSE_EVENT_REGISTER,
+	SBI_SSE_EVENT_UNREGISTER,
+	SBI_SSE_EVENT_ENABLE,
+	SBI_SSE_EVENT_DISABLE,
+	SBI_SSE_EVENT_COMPLETE,
+	SBI_SSE_EVENT_INJECT,
+	SBI_SSE_HART_UNMASK,
+	SBI_SSE_HART_MASK,
+};
+
+enum sbi_sse_state {
+	SBI_SSE_STATE_UNUSED     = 0,
+	SBI_SSE_STATE_REGISTERED = 1,
+	SBI_SSE_STATE_ENABLED    = 2,
+	SBI_SSE_STATE_RUNNING    = 3,
+};
+
+/* SBI SSE Event Attributes. */
+enum sbi_sse_attr_id {
+	SBI_SSE_ATTR_STATUS		= 0x00000000,
+	SBI_SSE_ATTR_PRIO		= 0x00000001,
+	SBI_SSE_ATTR_CONFIG		= 0x00000002,
+	SBI_SSE_ATTR_PREFERRED_HART	= 0x00000003,
+	SBI_SSE_ATTR_ENTRY_PC		= 0x00000004,
+	SBI_SSE_ATTR_ENTRY_ARG		= 0x00000005,
+	SBI_SSE_ATTR_INTERRUPTED_SEPC	= 0x00000006,
+	SBI_SSE_ATTR_INTERRUPTED_FLAGS	= 0x00000007,
+	SBI_SSE_ATTR_INTERRUPTED_A6	= 0x00000008,
+	SBI_SSE_ATTR_INTERRUPTED_A7	= 0x00000009,
+
+	SBI_SSE_ATTR_MAX		= 0x0000000A
+};
+
+#define SBI_SSE_ATTR_STATUS_STATE_OFFSET	0
+#define SBI_SSE_ATTR_STATUS_STATE_MASK		0x3
+#define SBI_SSE_ATTR_STATUS_PENDING_OFFSET	2
+#define SBI_SSE_ATTR_STATUS_INJECT_OFFSET	3
+
+#define SBI_SSE_ATTR_CONFIG_ONESHOT	BIT(0)
+
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP	BIT(0)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE	BIT(1)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV	BIT(2)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP	BIT(3)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP	BIT(4)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT	BIT(5)
+
+#define SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS	0x00000000
+#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
+#define SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS	0x00008000
+#define SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW	0x00010000
+#define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
+#define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
+#define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
+#define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
+
+#define SBI_SSE_EVENT_PLATFORM		BIT(14)
+#define SBI_SSE_EVENT_GLOBAL		BIT(15)
+
 /* SBI debug triggers function IDs */
 enum sbi_ext_dbtr_fid {
 	SBI_EXT_DBTR_NUM_TRIGGERS = 0,
-- 
2.50.1 (Apple Git-155)

