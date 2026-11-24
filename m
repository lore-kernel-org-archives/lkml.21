Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552010;
	b=VnwNHYUiFbcRqlYYA82DRECrTy0Z/9p/sUHHM4Ypwfe9pcAoa9dlUNF2MwHSMvEp+y8B
	 IHnVEwKAMd9+YbCaXPfh/5awCXpDfc4iVW2O6Do3gEUHzOSLuCQZhSwkzn5O+vW7wXUco
	 bRCp2w74GoYCWotl4lx5pmn+Vti0H+DFNxmBFe+M8N59/HjhZZpc0GX4LMOOPsW998acy
	 byKV6g6HtdZCkHUFhq9Zs8IhvIeFaCJ5NXg6Ef7y2AXNr3JA8lRPWgLrMu4VABIRN7c05
	 wFj13tbblCQrU+aZqCs5X5Q3Qg+ES++/ROn75L4DzTsNlggMFws1OZjqkpvPyftkW7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=TpDTZc9RdjJDO+TUClWKBIl76LjEpAqHQHkgkZyC8Kk=;
	b=NXTtmg64KrFDqsHSASC6EIJ09+9HKt6gbo9CT7jM6nDEeljxj6IRRIOwZnXf/EA8UnVK
	 /qNBSSd21IOvekbz3VYg9y7hffQBRPAje9QITgW7yJe8s5DhDTUz+6WeBGPI3uotkwSv4
	 zBsn8ozX9GZkkCSvFznb2vwFrtivV1tA5rjh4n+cah9HM0nbl0ke8/c2bKSSBru55NYUT
	 6K6Inppb6KPIzDDT8k2pBILxDX4BAqo5A1icbE9uiZzMV3vCN/SmzS6jFzVMm1Q2ZZWJ4
	 DmYRA4wcJSl7CBYOfaAk+MbHGJ4K6kVH4atwhQOmH0BKIIgQbfxWgH+iMfJsg+C9zFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RH3wZrOn;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04EA606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B04EA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RH3wZrOn
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso2551667a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795552009; x=1796156809; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TpDTZc9RdjJDO+TUClWKBIl76LjEpAqHQHkgkZyC8Kk=;
        b=RH3wZrOnD8/J5IZZJGeH0hoDkDf988zkanaCwA1Tsncfd6yJLnI7GT8VASabnTVm3n
         cu9khA+ifG54cQwXUEXrgimg9Z53nRntZJ4klgrJxDo/u3wXAOrhsXl1I/xtHOwCD0e1
         fH6eYKUGPepX02V/2Pk7q5l7y2P6luUm1io1ge6A+6JDbDu2/RPEyQ0yKFVAHkQy95VK
         vZcyY57Er4XzGaqFd47a5VDn89fr4Eox+KjRAw1MGg/Op1Ccl00Rp0HSClnrZXbJxifE
         +ZGAVFkcspa1m/W4E+RegDQcutmUhxkS3jwk9WF1ymVKmRI0J7+9j3+IEX40mxlmGmVL
         BaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795552009; x=1796156809;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpDTZc9RdjJDO+TUClWKBIl76LjEpAqHQHkgkZyC8Kk=;
        b=QU78dBnyiJ+0xrcGHF7WZD25F5f50DKaLJMr3M0QLPLbd5QOf23XXeElGdlh3w2wip
         f/tUVImTplI+/FhT0Xlpf2g+yDKLX06lM41UeS7V5lj14LLj3i65nyJOqCW02rIJKcs6
         USrxBbAiX8usRHKESKuVFo/L2YbiudEECACzJ9lRhMCfzd8oWr4snOFowz2kJ99LNlve
         dLRC1JIdhYc1VUfyjOsAoWTIej6cumWupWa+G4iT/13QBqxMSraIlddlG/UCmrP5ug4v
         YSAbcUw+YlsPwPt+h+T2N0zcU0q8Bxo8c4MinJmH0Ce4NEWt+NTLpkoGVl8M317jczl1
         Wq4A==
X-Forwarded-Encrypted: i=1; AL+hErEdmNpiMu4QiMKKfWYqaiM4m1d7jfrFqW/i9fLxH8leU+6ueX9gW+8ecv4ZKNVrVEm/omu4WYP+yh2myOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XjStwYiKYlKixBVCRVXvIPTKugCgm6OLg64ZCSWIFifMkOhN0
	MbyobmY2OUMFhoOvCDBnInG980Ocrh6Gi6azQ+EhppF817eJjggDu3Ib
X-Gm-Gg: AZFdTZdEGI5/3/NvqgeXmGP9b/Q2gPAQLsfZn7AMdnQatxAVgXvot6y8jRhrxZ8zwOo
	fXV69ESsuDLxyOuXKeVpLvRf8vs+K+Vv72xDArxLr4Njqexl+mEcToaazApoMR8N5//tRZsLBzt
	96QgnLitcpfSSuKLUGu9Qj9xGZCnucq4DpDDbgjY5PsWXkd7/eb/aSoDM8Wvmk9Ln2YPP/RrlFM
	6e6X5sGCuBT3Z46IRL/Bkqrrm3ro0mZJU3ayevnfUmeCORs7ItM6++MkSoEpa/7urKReOmT6b/s
	lAAhvZ/YTvzvPOC1JeVoTwoV5gV0TPEdowe3mNJxPEiIq0YK1R0ynMWp65etpL1fP4xW5w+bMnc
	RC17HmyfdmADb0A5A4Cqbmm0i6Vacv0BTlRr756PTtf6ljQHP+hpS8rAR2Wmnm6KZQkCjCU4y/6
	hQH8OdH+xNGFOHHdavR+KX9SwBy9tS0XjNctmaZ6IiX84FNBDvlc3oFlSSV4accK76FU59aHFFq
	xqRj8MFk5WWALMn72xU4D/T1ycBCPts/vNe4C9vjMRrcG2XVUXHVblliRxhHkqaAhg6SdcxpFr2
	1GDEja59/BsaaEeB/fwRbOmVpfFUlSCb+XfBTXGOevua4VEudWnN3AbIyvNYZBPiU1wJRUUUFiK
	VwGXT3zUylP38FBCLUjFq0uloZvRjGVIs0zk=
X-Received: by 2002:a17:90b:5289:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b41c908147mr10850061a91.21.1795552008788;
        Tue, 24 Nov 2026 12:26:48 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm26712524a91.16.2026.11.24.12.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:26:48 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 20:26:47 +0000
Message-Id: <DN3Q2CZJSC2C.IM2EYLF1NR9X@gmail.com>
Cc: <bpf@vger.kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>, "JP Kobryn"
 <jp.kobryn@linux.dev>, <linux-trace-kernel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3 0/4] bpf: Check recursion per task for
 preemptible programs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mike Bazov" <mikeba@sentinelone.com>
In-Reply-To: <CAPnbwjpP9Fin=CyD0WiA2c4sxqbfyK7AziE64PCX4w9kbz55Kw@mail.gmail.com>
References: <20261117-bpf-preempt-v2-r2-v3-0-586376ec3672@sentinelone.com> <DN38312WXPDJ.2KLUTCWSDFL3P@gmail.com> <CAPnbwjpP9Fin=CyD0WiA2c4sxqbfyK7AziE64PCX4w9kbz55Kw@mail.gmail.com>
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

On Tue, Nov 24, 2026 at 08:10 AM Mike Bazov <mikeba@sentinelone.com> wrote:
> Timed may_goto sets the mark, so a may_goto loop would run with
> preemption off for up to 250 ms, which you ruled out on v1 ("with
> may_goto they can take 1/4 sec"). Move count and timestamp per
> invocation, in bpf_run_ctx, so that may_goto needs no mark?

Well, since you brought it up, let's fix may_goto overwrite issue
as part of this series.

may_goto's count and timestamp cannot really move to bpf_run_ctx,
since xdp, tc, perf_event progs and async callbacks
don't have it. In bpf_timer_cb() current->bpf_ctx is NULL or belongs to
the interrupted prog. 

Keep count and timestamp per-cpu. Call bpf_timed_may_goto_save() in
bpf_prog_enter_run_ctx() and bpf_timed_may_goto_restore() in
bpf_prog_exit_run_ctx(), like bpf_timer_cb() does.
Then the preempted run gets its count and timestamp back.
For progs that enter this way skip this store in bpf_do_misc_fixups():

  insn_buf[cnt++] = BPF_ST_MEM(BPF_DW, BPF_REG_0, owner_off, 0);

With it cur->owner == saved is false and restore does nothing.

