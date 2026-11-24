Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795501282;
	b=yUJ0G3PEZEw7OjEMQy8uXp6HX7nHcMpZK0XutOv0XsmGTmihSIioNR6t/TWeMIkJXGkz
	 FkyLPVXHHR8dgozbspZ6O+bmUWhjA4a64Wb16SUYRCDOVXrqOgKdORHpEfqqwiXiKzTsp
	 vNPwjaf6HmLvv5kKt3Mh/VvL8UgmRRuLWLMHR0pQo4Em5HTnIBqAddNasQhZ6hUwOQJm0
	 Jfce1ZDxHzytglKGSjIgCtGKj7FX+5M7dk7GxiAPDU26b3QUzxseP57YVHJzzCGSzPnmP
	 jXR829AUbCyWBQwXB6GyojfYHPNMIkQCpG30NCm5ZGIkwim3EF4WgxL2662tWTGCR5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=ABoE89s/WFkMcjQ3bulfL2OvrXI3uR+DaKdUMWt3+Do=;
	b=36GRmkeWHpm8RVDO/Xiqx0wZIZOdKr2qNSUhtwJ1nAgMpMDxFCvC5tynRfCME+o1CB8l
	 e2JCk3YOoJOJs32sWqnntn+RRCqGoYkIjWvrAyxB1jdlLqtIKtp0N4L0E4fnSwj6G+NJK
	 UWbA8xWnqLufectaZZ3xr/oWYX3lmVkI52RKrrgJBOqdmDC2TJLGdN+eYMc5Aw9a9Jw7d
	 dAz96nJedO/og1JwC/wyfP+sL6wTCt7/4D5bJQOZmeQgJ5YuKCWvfaYHZ/sJ2EgivJvAa
	 nCMbqzyfq+xTEfsjfVNvXWcDSouqtzTtlJFKx6vkRGIhs2NpPZPM+4t1rbr//XFL14A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0gKFROj;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A80D606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A80D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0gKFROj
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0634667aaso13053445ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795501281; x=1796106081; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ABoE89s/WFkMcjQ3bulfL2OvrXI3uR+DaKdUMWt3+Do=;
        b=V0gKFROj2Bzf4HhEsltf1mgTZkhGBlbfiUtJQ7Qwszx5jk+BDR6xEe6Mxx85AgxRLu
         cfljBUaPpgAehgbMImm3c4AerftNLXGITO784IcCNvkvVwOEkCMyH8XbAV8Ho1WX+sBc
         eXkb7nl8gPC7q+CsCtlDBQz0Gk7v6l/HGBZc5m8uVIekFtPf1PdGXFlEdXAPQIaP1hHV
         +zQdKrcvzWEfaMVPDqnBRo/a7VOGirFpIbMx+d63TFlzJhJkezC8jiht6aYgbEyLBpiR
         DohSf6IX1o9dRCcc4/3DPcqENbEfF9m7IeyA4TIsGUDdl9mf22xJHeqfMfQWFgacLtwM
         QKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795501281; x=1796106081;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ABoE89s/WFkMcjQ3bulfL2OvrXI3uR+DaKdUMWt3+Do=;
        b=QO6NNlOvBrKLDCgRL4KshJJNRM4YT2k6fHYhwwRzDMZxPPe/sPaYRky1chHgsu73nm
         ehLr+Udo3mf17n3O73H63dhaN7cLK0DiyLal2sY4Qog62k4dw8ygfJ1VQdB0I54cnBU2
         0/CfCSjIu1Eqagyj4OUhURErWUquij3TOhh7VRv/+eLsEKS/ZVisrWqUMeL4it6Pxm/S
         PLpTxrrgrjDYNpk1X8drEr5oM6qjR2FzoJ5pPaIhvd/fLH+aUGZjM/6lbhbDtJeFnwsV
         tCsDOeWgnvw+xXXgu1T8+0DBU9xj2L6pJSQJ+uTW9CfcqpY+LwBASFL3vV8fjQn2NgDn
         gsKA==
X-Forwarded-Encrypted: i=1; AL+hErG2HATN1JM0IxGpXSo3kLYLR+vI+FdE5BaJs5ivYMvHdx4poxVSuUmTSVUbK7ww5Bv0R22p8yxW4QJ0B9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P4nCUs0ETlU8BWJJmYYpvutt2c4X4aN3BmYKXUc2cbboxp7sX
	C9ry+dlipzUnG8sZkRISmuhZOfZPWJ1o9CziF22NqmqMOoKar/JD/YgX
X-Gm-Gg: AZFdTZcyPle4mEltGxxFG3l6yvVFMMyG2vYhjzeQxmJ4e0sUccnvPXpKATvf5VipAhY
	5Dv+nf92jhqYg7QzZva2RTPGxE2QSPiQZWbkOimt+GcFEUCpYuCaxCvfGDCh5NAOwXeMuDcqVQt
	MG7zwtn83bLbR1SkZXTzVWakkubWCPNsyHJ7Y4xoL8+bwsHzopD2zBrId7wpcjPbH9nf15TqyU9
	IZXgOKwCuIWquQOLd4e8B0m4LqbAXLytTqshd8HAgIdqumfgqdnDqP9O24BAB3urV61kzjivwhJ
	d5RwJAnLl2Qxiv+awbwoP6B6RilfI8nu/hIPfDs5XPteyyEfaMYSTzNaBeIQN9I/ny6h+g+guvy
	GCmJzckfwuYEyZbHYpZe9lpJx9mdLGRn5k83s6cv8G3sqokLMcyx/tyVpHmBrvKhqQJHFNPe6ZN
	4FijeP0AqKM+77cOjzehoNa+gCNQdWZRCgPjBCgk5uthKGMhuMm4yQKpTeiznDBMRqjrRXcvJJ6
	cTYQss/1S9cdbgxQ37mp7/DiZUJgdvUQ+7y3BSbltCuHw/LBwaEQ57gmUoCRPN5bzyQDS9MkXlJ
	ytjibED9Larn5E6zNF9+Phr2K7MeUwvr+cGkcjX4220e0DJp1wjHM+z/TOptRA5h02lH2Z+J4wf
	pZ4anzP4BklPHJUTnOm0x+xbt0CpExFBQlw==
X-Received: by 2002:a17:902:f54c:b0:2e3:643:279b with SMTP id d9443c01a7336-2f03f1ed636mr98397505ad.31.1795501281131;
        Mon, 23 Nov 2026 22:21:21 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c7dsm64174325ad.55.2026.11.23.22.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 22:21:20 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 06:21:20 +0000
Message-Id: <DN38312WXPDJ.2KLUTCWSDFL3P@gmail.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Steven Rostedt" <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "JP Kobryn" <jp.kobryn@linux.dev>,
 <linux-trace-kernel@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3 0/4] bpf: Check recursion per task for
 preemptible programs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <mikeba@sentinelone.com>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>
In-Reply-To: <20261117-bpf-preempt-v2-r2-v3-0-586376ec3672@sentinelone.com>
References: <20261117-bpf-preempt-v2-r2-v3-0-586376ec3672@sentinelone.com>
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

On Tue, Nov 17, 2026 at 03:29 AM Mike Bazov via B4 Relay <devnull+mikeba.sentinelone.com@kernel.org> wrote:
> - Marked programs are not fixed. A program with a per-CPU map or a
>   tail call loses runs to preemption as it does today.

I suspect users will hate the behavior introdcued by patch 2+3,
since adding a per-cpu map will suddenly make the prog to miss events.
But the idea has legs.

Earlier I proposed to insert bpf_preempt_disable() by the verifier.
No need for that. bpf_prog_exit_run_ctx() can do it when per-cpu access
is detected. Like below:

> One question: the marking is automatic. A flag that the program's
> author sets would avoid the second trade-off, but existing programs
> would keep losing runs until they are rebuilt. Which do you prefer?

No new uapi.

>   series #2    42.34 [42.12-42.78]  39.87 [39.46-41.38]  41.53 [40.79-41.75]

Good enough. let's keep the walk. No need for the array.

+static __always_inline bool bpf_prog_enter_run_ctx(struct bpf_prog *prog,
+						   struct bpf_run_ctx *run_ctx)
+{
+	struct bpf_run_ctx *ctx, *old_ctx = NULL;
+
+#ifdef CONFIG_BPF_SYSCALL
+	old_ctx = READ_ONCE(current->bpf_ctx);
 #endif
+	run_ctx->saved_run_ctx = old_ctx;
+	run_ctx->prog = prog;
+	if (prog->percpu_state) {
+		if (!prog->sleepable)
+			preempt_disable_notrace();
+		/* sleepable prog should be using explicit bpf_preempt_disable() */
+	}
+	for (ctx = old_ctx; ctx; ctx = ctx->saved_run_ctx) {
+		if (ctx->prog == prog)
+			return false;
+	}
+#ifdef CONFIG_BPF_SYSCALL
+	/* Initialize the frame before interrupts and NMIs on this CPU see it. */
+	barrier();
+	WRITE_ONCE(current->bpf_ctx, run_ctx);
+#endif
+	return true;
+}
+
+/* After an enter that returned false the frame is not linked, and the reset changes nothing */
+static __always_inline void bpf_prog_exit_run_ctx(struct bpf_prog *prog,
+						  struct bpf_run_ctx *run_ctx)
+{
+	bpf_reset_run_ctx(run_ctx->saved_run_ctx);
+	if (!prog->percpu_state)
+		return;
+	if (!prog->sleepable)
+		preempt_enable_notrace();
 }

I think this should minimize the breakage and fix the issue.

pw-bot: cr
