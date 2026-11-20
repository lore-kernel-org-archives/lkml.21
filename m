Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795136921;
	b=EY/vf7rRozYW0jQWQczXhYt0itxbXzWk3MDxmiwO1qUXbVAMz6bpd2Mg3Rk/klFttEaV
	 GbPyX3v1Z0NltrDaIr9SZQMoqyn+CVnBPU74imuLUAUSUU/eV+qdKZ/0MnKbSjz5DvmcC
	 tjHOxYI+Nn/JWCDiPrPBIisvB7B0JzlOrzaOitevDabL8uEDG2uenlC9ljlete84eIVb+
	 fumF3EcInSrtsFPVz+S/VY/Joanx3mHtQC2eRDLiZ88jqFAJk1T5EQSe5eNlT7wHBp3kr
	 5p7+NLb8wa+qjln3pt9aAi6/tXYvMKzm/YY0S3M9TlH6n2seyXWXLC2NzjLDN6o4fNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795136921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=eretBnITB6vR9c+pjlNoT5wot4ipeaWEYdkoD9FXiOY=;
	b=BU7k2yztRZ7FDb0DmYBTaIzmp1UTTHjFDqC9faoix/GofF+a4VxNCHLDiuxMFH0zyiq6
	 +7U0qMUkF+5lHqtnVY+j2YUPv9tSy+Na01Z8RSOxW5MJL5BdKnNaBtqDf7Tpu2TvlExBi
	 L4Ad48UCFxvc3gLCM4EqIW/uBaN8F3LALgsO4ekgYqsOtgeo2OnIW3Qjv/3j6dZ7jNZTL
	 KxQrDLyPOIma1Lf9A9zTx8Ko4vf/LPegchR1mdnbLEcXU6+nlfN516hCc3Pzh0EyplJhN
	 jKFrIJK6hRT/9CbroUFzTYO0OLNmc/JXaIzsnHjfAXEUJYuw2vHhZvSXSio0QiM35DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zv2tPubG;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918E7606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 918E7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zv2tPubG
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2efe591a1f6so1205585ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795136920; x=1795741720; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eretBnITB6vR9c+pjlNoT5wot4ipeaWEYdkoD9FXiOY=;
        b=zv2tPubGZQUVZlU14gcYvRYJFSgkeZOX5Ccg9jvkxVA+wHGnL5K9L6LPNWGK3z31aj
         MkaN8o1K1Vwu+xxlxTX9MQjCYrrHhLE+kicoZ9ZBU6ecc9JZTetAryyshiDIVD4MAlaM
         t9vPKuEaPoTkKDrzYobbWP634m61ZuUXCMHJJTeBqIYQJ1Aek8/eyPayQsqcCSCPs+GA
         BxIC072hizkK9xT75+USvmVvNcddyJXFy2wkfgtT/uxfef1enXRunV4N+tgd8psd0B9h
         Ot1W1bFzhuqs4RjSaQ5aDcxBBWzsstK/A6wDjmBCGlN98NS9XmD5+4IGdxtsdgHqIgMC
         odug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795136920; x=1795741720;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eretBnITB6vR9c+pjlNoT5wot4ipeaWEYdkoD9FXiOY=;
        b=w4TcSXrQwyvqCVyk0EgpHcJQuGTPEqXiA2q/VlCiRXLR8xU4l7C2Gj+xZMIKzgmIjN
         xCt7kSG5gCVYKOVqlFz0735WVQYurr5zaKjPrBCaDMDKc/PhDh5+/LuP2GgEq0JkrL0t
         YzkB+OOpyylJaD1TqdrafcRCRd1DaEVV4Bn8CP+H2baAykwqJcPSbofJ8vn6TKR9Wt/k
         uXN+apqu19vVz+Tm38UqWu/gZni889UiYyLeqEFuOsp4Gmkc43gMEgqjJy4suk4jnpLo
         wKceLJ2N6K9oePHOgnOb+MHAq3yFOzKcIe+dIPUFqrwdFu8UnOpbnNFjAn21pbPN32yt
         GbLQ==
X-Forwarded-Encrypted: i=1; AL+hErFJUBCQxZTugXSfhXUAU+Hu9PRuwrLchWOh/ovKaZTusjv/DFJ9MVrzAHpvh4e0xkD5HOlTGI8ZA+LRtws=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xA5ssy1ND/jpDvJ+v/fGagbOkMXCkfLcvl08GMq/BGxrUg/rW
	ai83nA5TtBH9Ai+CULVsL4z+69HK+vZLlXdTL/yiLK3pZVtpRpHCNE8z
X-Gm-Gg: AZFdTZfnGVuxBHZzfZ4/LozSDt3JX2oRYTm9jK7RLlQdq85DxTPBhXvUVvPsjNWWugL
	Bd8AeJci20q9gZc7pK2C7UTWK2fJIjgJf3KEt/U90lqHsr1gfZC8AEoGkDgqJw+uC7AtDWTwsNV
	4Uwtzh/Aaw3IRVUKkDJvRko5ca1tBQX6IQ4v+8zkdI0UAdqv+ZmV3bZJXo4qTrVox01ZlxyUDFQ
	o9VDh6AjcdbKNEMqJkedBvqyPYOhMh4NuL5Z17IfbQ/nHkiGDB5WsPnHfiSlQt1mteh6nZku6YU
	YpmthZ3NVBST9/6WeRb0avGT1sInEjLSIcz5ZoUUNf/v4abFTlLddtRWPRboxTB/yDwKMCwjIx2
	d8yFaC4z6MB7HLTrCHjkxX95HSjvMIOZ0lfofHk/65PK4ZLmwGco4ggEJQtYFbNA123LkrgcNGZ
	DTKYe5mNPZvk++NZ21Mm4BhYtvuVd7QNcvq3EVWRZIe18EpHp0lzXNMQ1e7KYEgivTXQ1ngwaE5
	3CN6mlpsDvreubuLApNuNIEyBgfy0tkTf+kabQqf26YGRGBESQfKalWhFQaRazpa1Wvrj1Ar09Z
	GtXPIfpls7vsv0GLw206qLF2XhDJAmLKHO6/iRNYAeTP2YsUcElchVMhFrkavecezA0yispgOBJ
	gk3Vv3XicV9JJXYquXA70zRp8wpVN7sR1tQ==
X-Received: by 2002:a17:903:2441:b0:2f0:3d6d:a089 with SMTP id d9443c01a7336-2f03ef870d3mr15115475ad.1.1795136919620;
        Thu, 19 Nov 2026 17:08:39 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0ea6a8sm6302305ad.36.2026.11.19.17.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 17:08:39 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 01:08:38 +0000
Message-Id: <DMZMXFOOKT03.2D4M33BG6WTRP@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2] bpf: Use an on-stack pt_regs in the raw
 tracepoint helpers
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <mike.bazov@gmail.com>, "Mike Bazov via B4 Relay"
 <devnull+mike.bazov.gmail.com@kernel.org>, "Song Liu" <song@kernel.org>,
 "Jiri Olsa" <jolsa@kernel.org>, "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Yonghong Song" <yonghong.song@linux.dev>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "KP Singh" <kpsingh@kernel.org>, "Matt
 Bobrowski" <matt@bobrowski.net>, "Steven Rostedt" <rostedt@goodmis.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>
In-Reply-To: <20261119-bpf-raw-tp-regs-preempt-v2-1-e1e1b90857d6@gmail.com>
References: <20261119-bpf-raw-tp-regs-preempt-v2-1-e1e1b90857d6@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Nov 19, 2026 at 02:37 AM Mike Bazov via B4 Relay <devnull+mike.bazov.gmail.com@kernel.org> wrote:
> Each caller then has its own registers, however it nests or gets
> preempted, and the helpers no longer fail with -EBUSY when nested more
> than three deep.

bpf-ci is correct.
let's remove that warn_on as part of the series.

we have another hole:

  prog 1 on mmap_lock_acquire_returned
    bpf_get_stack(BPF_F_USER_STACK | BPF_F_USER_BUILD_ID)
      mmap_read_trylock()
        prog 2 on mmap_lock_acquire_returned

stack colection with build_id's will disappear.

Let's fix all together with somethign like:

diff --git a/kernel/bpf/mmap_unlock_work.h b/kernel/bpf/mmap_unlock_work.h
index 1834db2..65673d1 100644
--- a/kernel/bpf/mmap_unlock_work.h
+++ b/kernel/bpf/mmap_unlock_work.h
@@ -13,6 +13,7 @@ struct mmap_unlock_irq_work {
 	struct irq_work irq_work;
 	struct mm_struct *mm;
 	atomic_t active;
+	int nest_level;
 };
 
 DECLARE_PER_CPU(struct mmap_unlock_irq_work, mmap_unlock_work);
@@ -28,8 +29,13 @@ static inline struct mmap_unlock_irq_work *bpf_mmap_unlock_guard_get(void)
 {
 	struct mmap_unlock_irq_work *work;
 
-	if (!irqs_disabled())
-		return NULL;
+	if (!irqs_disabled()) {
+		/* progs on mmap_lock tracepoints can get here again */
+		if (this_cpu_inc_return(mmap_unlock_work.nest_level) <= 3)
+			return NULL;
+		this_cpu_dec(mmap_unlock_work.nest_level);
+		return ERR_PTR(-EBUSY);
+	}
 
 	/*
 	 * PREEMPT_RT does not allow to trylock mmap sem in interrupt
@@ -51,12 +57,15 @@ bpf_mmap_unlock_guard_put(struct mmap_unlock_irq_work *work)
 {
 	if (work)
 		atomic_set_release(&work->active, 0);
+	else
+		this_cpu_dec(mmap_unlock_work.nest_level);
 }
 
 static inline void bpf_mmap_unlock_mm(struct mmap_unlock_irq_work *work, struct mm_struct *mm)
 {
 	if (!work) {
 		mmap_read_unlock(mm);
+		bpf_mmap_unlock_guard_put(NULL);
 	} else {
 		work->mm = mm;
 
diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index 3f1901a..5c49c13 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -702,7 +702,7 @@ BPF_CALL_5(bpf_perf_event_output, struct pt_regs *, regs, struct bpf_map *, map,
 	sds = this_cpu_ptr(&bpf_trace_sds);
 	nest_level = this_cpu_inc_return(bpf_trace_nest_level);
 
-	if (WARN_ON_ONCE(nest_level > ARRAY_SIZE(sds->sds))) {
+	if (nest_level > ARRAY_SIZE(sds->sds)) {
 		err = -EBUSY;
 		goto out;
 	}

pw-bot: cr
