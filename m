Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834408;
	b=XEy2fVy4ptaVz6jDhdp1aX6UaSdRurB7YhJMji2NMKWGmzTiunT7uhvaZs/NW04ljB8K
	 aW6Fi/8jH5YM/tz3x4t4zzP3YctnP4Qjobtj81hNZ0ev/IInnOJr507Ec5lVJy9KegKwG
	 ucJTMKTA70r3sVIh9l4IjdGV4y5ZFRmsZERf7AR4wwTAyA6YItBCs9XTNQXYOvkq8qtU4
	 LxNQr3yV+YE5pCJ3mweK5/sIZDc9EW27R44yWno889ahlVMwP87AwGVCte8HCe2KXNuTx
	 cGIpeEasMH4KCDaFFaqJ6tcF0sAv+7PHN3cloUOYiEpKbnfvi8azGS0OsWb+4+MDAUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=o/yA7udvOXyy4uaWhVZUf8NM3Y57Zr7Wl3fusqPbyG4=;
	b=R5mCOBQLLtXD66xzVDrlsomFGLtqUUHEqsBCBsYjB4kqfjgBtWRPt1QSBzpFa/MUQJKl
	 zgBGiQHvihs9KXDfitU0clMHVOG8YQWfsxn035PM8+aFtcTZqxeiUtO964Za4eLUWMuj0
	 NTkpqTFoOe9Ee9MZ4BiYN87eELIzjz74I858mTRY+/QCV6H+2T/tCR6I2w5qHAhlmmlF4
	 ST46jG/qnEn5Srf7CzcxBRIyVhWUNNFftNYhZUHOHjzyG9kZys5Fm2UONcrUNxWNfo4gA
	 eG+G2SjYBqRy4ynfjGjSz3AAK6SRKt/ouaUvjYYr4vnMSgs9sJUm9+OAngBBtQa9zpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+q4mTXy;
	arc=none smtp.remote-ip=74.125.231.134
Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF59C606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF59C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+q4mTXy
Received: by mail-oo2-f6.google.com with SMTP id 46e09a7af769-8629eb92bebso2998653a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795834407; x=1796439207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/yA7udvOXyy4uaWhVZUf8NM3Y57Zr7Wl3fusqPbyG4=;
        b=y+q4mTXy5ZlrWB2wUUxP5TEJaTaMK15HC8OGThrmvFuUXOEA7bmIXJWpeEIfBlOZ1C
         cVaaoHO+8VFcW7BXkV+0KDhuEEfJInWIpU015X9kcf2+xavryXh/bnyxgA2IAZRRbPkP
         3h+pjnKZmuoCnJT74nI4KftDRiaSxjn4CdQYxhVxt28WEB8H03nrcWVJJo9mYd1Z7RlA
         AOGXFZRU6CL5VPWlN7AXbw/nMxS2DSKF9s69CgIpg60YPolWykIVYcy40Ge6mWOcVbH7
         04HpuhHf5ALQLxALyYumIWb49hBxw5+8T8+DjhXOOhRgOOJBmmWJAlUYKhotM0SYqQYy
         jv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834407; x=1796439207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o/yA7udvOXyy4uaWhVZUf8NM3Y57Zr7Wl3fusqPbyG4=;
        b=ZAaxcIBl8dj7K4GgeMkhq7wvkqSGizPdc7bWJH0aOy6wIV+flDmwmSzFhIQ90gSdlH
         ldS2cS6Dn8inPJzpVh7sOjbmzFjJyzINVEJZ59+gjy5UR6F4PII6E8BtQjPYhOcyYr5B
         Q5SWcRkonyXLmSAnlM1mg/qSbamYswXO2j5hk94gDHnEWxQGWqDuogN5oaOqd5WY9oMw
         6yseJPCtTGRa7gHORJJzJRFdUP2OI4xbL6jt2wrqS7rR4N8q6f8CPlHgNmGuBykjtsdQ
         QN1Bm7gsumRWm+YoGPUN3u+qa6kCIB7QnBVm0kfMP75lkPWkJQP8o/Dwavytz34xn+BB
         1dqA==
X-Forwarded-Encrypted: i=1; AL+hErHrNKSiNG5MzuaaE1upOHaPd6UWXjEUUqN09S5NrKiGCnKMgJ9tddncbOk0dbiu7R/xx4lPjC4DDo8zi4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZYau7ZxlG6P32i65ao6YW3DB+20ZHqF19IG2/qsl6HeQEaI6Y
	TlDTZyJ3nBnDIrtCd30JMM8bKocKjapC0QLjoYfI1kN1qNcouLB0AwOZ
X-Gm-Gg: AZFdTZfjhmoy9ioQl8NzhyZfF1PJ3jchBdXLHMcmVx270qJMwKpfuVPbaDgdepClDc6
	Zv/ad4I2mrQwEd3pci/oj/JiIb8ldYJ+MFP4UYvIwbY6JspDz34GNEIYkP76o7yFJLrLNwnO0ml
	W3SeUPvSsX8rpESQLxBpgyEfVJ90FrxgOF8j7wsBgCEm/xEtQgYrGfRd4ID/5DpcVqhFqLqfapx
	zaYzgEOOwY0/71kAyqJEowBDRhKkAg5JbZxO1RK4uwA/OuKWpzyg4q8YDNf8E3e/rmWwa6qbylN
	xnitk4HhTpBD3MyNXzdGCaCU1Ukfb2sVathneyYBnHpPclx5zSfGty5ZCIyLlH7DSyTKXMX8/V/
	8kRIfRzqHiS5dBbTrYqKrMGGX7WE0Ibhr3UTkdYr6nCR4fSY2qPSo8YFBpkolIslLMw0bIP8uJC
	ypyE78nmkkLvqm3lMvqJ5aTDT/oNL05ThpOM3+W4467XPEdaTrg/ujOmQ3N6td6cSCCQblHl+tK
	MOp6dMEDY5rjBcXKTW2o6h8zFxKQ+YAsL4vOTa5NrXaLq2BLu4mMyMauYEPx0TZ5uzkTJnb5Kl0
	2nqjIr6cBFgFUCeH+gdHGW8k+Ybf8c6xMplOcLaeMEfsnxDqazpor6yaC+KlypOa1BzBn+4qp7z
	Fw82QzZC36/jWxKWm5ZsZ3ZjrlqOesVvTEzib
X-Received: by 2002:a05:6830:a257:10b0:863:9f9:4eac with SMTP id 46e09a7af769-8631593a1dbmr18727324a34.9.1795834406810;
        Fri, 27 Nov 2026 18:53:26 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:49::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168c1bc5sm17698611a34.6.2026.11.27.18.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:53:25 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	kkd@meta.com,
	kernel-team@meta.com,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Puranjay Mohan <puranjay@kernel.org>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v1 2/3] bpf: Treat __iomem pointers as scalars
Date: Sat, 28 Nov 2026 03:53:16 +0100
Message-ID: <52249df7401e63679e1ec5c416ef9b12d3ad318c.1795834380.git.memxor@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <cover.1795834380.git.memxor@gmail.com>
References: <cover.1795834380.git.memxor@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2509; h=from:subject:message-id; bh=N/0L7RU1DZg49E/9V+NTDUu73bODlWpWWMAIjmhlL5I=; b=owGbwMvMwCXmrmtenRyi38x4Wi2JIZvLieeb9pkjpRNvceVYaP07wJidcEM/TtbDKr16/8nSCeGe y+52lLIwiHExyIopspT838dkfKLyd6DtMm6YOaxMIEMYuDgFYCJOQgx/+HuenZgbO09DL19vWsO2Vu kPn+bcv5k7/eEc67Kc428fBjP8L7uqsf/PgUnmKTPT/u8KFt7yIWtPxrHLR79wN80VPCwVwQ8A
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=B34BD741DE8494B76E2F717880EF20021D46C59B
Content-Transfer-Encoding: 8bit

A BPF program can read a device register with a plain field walk. Given

  struct virtio_pci_modern_device {
          struct virtio_pci_common_cfg __iomem *common;
          void __iomem *device;
          ...
          u8 __iomem *isr;

all of mdev->common->device_status, *mdev->isr and
*(u8 *)(mdev->device + 4) load today. The verifier turns the first pointer
into a pointer to the struct and the other two into untrusted memory, and
each load becomes a PROBE_MEM load. The address is mapped, so the load does
not fault and reads the register. Such a read can have side effects: the
virtio ISR above is cleared by reading it.

These pointers now have the "iomem" BTF type tag. When a struct member, a
function argument or a return value has it, give the program a scalar. A
scalar cannot be followed, so the three loads above are rejected with
"R1 invalid mem access 'scalar'". The value of the pointer can still be
read.

Programs that load through such a pointer today stop loading.

bpf_probe_read_kernel() is not changed. It calls copy_from_kernel_nofault()
and should inherit any check that gets for I/O memory.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/bpf/btf.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index c4386a9a1ad4..c78b37b813e2 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -7632,6 +7632,13 @@ bool btf_ctx_access(int off, int size, enum bpf_access_type type,
 	if (!btf_type_is_struct_ptr(btf, t))
 		return true;
 
+	/*
+	 * An __iomem pointer holds the address of a device register. A load
+	 * through it would read the device, so treat it as a scalar too.
+	 */
+	if (btf_ptr_has_type_tag(btf, t, "iomem"))
+		return true;
+
 	/* this is a pointer to another type */
 	for (i = 0; i < prog->aux->ctx_arg_info_size; i++) {
 		const struct bpf_ctx_arg_aux *ctx_arg_info = &prog->aux->ctx_arg_info[i];
@@ -8018,6 +8025,14 @@ static int btf_struct_walk(struct bpf_verifier_log *log, const struct btf *btf,
 				return -EACCES;
 			}
 
+			/*
+			 * An __iomem pointer holds the address of a device
+			 * register. A load through it would read the device, so
+			 * hand out a scalar, which cannot be followed.
+			 */
+			if (btf_ptr_has_type_tag(btf, mtype, "iomem"))
+				return WALK_SCALAR;
+
 			err = btf_type_tag_walk(btf, &ctx, walk_type_tags,
 						ARRAY_SIZE(walk_type_tags));
 			if (err) {
-- 
2.53.1-Meta

