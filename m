Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661305;
	b=ceRxHODwjVQQ5kpRZylRyAhHx/+92WV4qONt+mddWUxZiAxmnpMqDKRebnctRQ3iXUCd
	 g7NfbDBUi+h/I1G8CzjWFG1akHPi3NuYO1cGzz3bZmV2vc38GwEWKDlhj61+YXo1kwkdQ
	 8DCKeRBrQ9Cvnun6gz5VtoJE6B8tF3EXr+Ggb6ZEkYoF1lJpHBK8plxDcJ2BUFh/X32xR
	 AAvpAZxn0tPWr80AG9KFuyFzCm9gzKejzs3BI4tOrqRgFxyG3JAljRZrczjcEsWe/b6Da
	 uB1d5j4+Yhgt5P4iSVpdWN6bSWM11wwZocMkI6lnQ2p4tOy8mX+K5YXzpaWxCyi+puA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=uXsG/J8SjUA+u6xV5gQi3ekCpADG/Nmz2q3u5DO1GSw=;
	b=VhDpPz3Z5UXqFf7uQxAjCbpzzeZ1z5pb8/bTKCXR2yzf1qPeS2KE9r/A+N8Zx/jNOCZJ
	 xkITPphL1ht71X8e3emCeGQ4Vplf8CThT5S6d2s6C/DMfdDYlZP8yklWISQWBFOCw6jts
	 XcBd5Wqsdh956Utqpv1ioi40PW4fHqss+pIk4PhTQFsUaFssG3JBSLzrvJQi3q6RxZeZs
	 RRMDHbiPTMW91kbtvkmjPz9mK3KJIJfVn3PvMj3jem85+1CqvTZKM37+5DR3963rxioeO
	 84Y7yZn/1RIrPiQcwnpuoocVGXpzVNdtSMQsWcazS0AXAOvxzW/N/+ZxsBsYBRnqQbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWIL7Kkf;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D8C606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78D8C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWIL7Kkf
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so2151165a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795661305; x=1796266105; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uXsG/J8SjUA+u6xV5gQi3ekCpADG/Nmz2q3u5DO1GSw=;
        b=hWIL7KkfCL3yaQsFQRKV2YraC7VVF3oAMqKIMdyD7qlk22rGclRIkoua5vlMpTMBr5
         rxPT1fKoNqe54FlsoE7dBShxb0WCzgSMpiLoPk2N93Dc0zNZHGX9eD6E1Lex6wcECS0M
         A+RRExWB5fzKTz1t8NJ4ieU3InEGHWU3TBv8jgNNXp/FGXAiOx0TZa2hoDqb6Pp9+lwI
         gWFOiqYZURGXSvKxHqj2oDh1MmESQqc97X8TuspANrgz+xqlEgKbl2F1HN1RKUVSRIUv
         2FuaOyz9D3e++Xel+ceknSPbtOhxPE5eaIFWuFUEiv80ZwxkNWwaKaEpJ4v5NJ3yN6rr
         3Lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661305; x=1796266105;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uXsG/J8SjUA+u6xV5gQi3ekCpADG/Nmz2q3u5DO1GSw=;
        b=frEtpMyM6i5+hJWTroQdV7BjaUWLp+IDFkbdqkKorbRQliBYNhnbTx02XwAWDHiVPg
         ds5BJJ8OCKBM2z/qphryjFmZYja/a4FXcCHnx0+2KCNwJ2Sm0c/He4S/qSah8rvsXjIi
         /ZTQj0Wyr9oSYOJBPMrloUxZwweS3cbF41mUb3B61262u8m/4ojY5RFniofpWs8V9QJe
         CHYVd4q8KDGkTNxeHSPEmtIRdk7YOO+nEn5SpdRYrfsdBVTiHd7EfiJxCcQwhhweo2ip
         XXo6Kfn+c7so9efDzrBp3wGAmlmtCWZ6KVJNdmkeLQK6siuPagjjV2JyMoD2qqV+zDXo
         wMpQ==
X-Forwarded-Encrypted: i=1; AL+hErFTrlUpEDnL6HFuICD0Xi1pn2uU0dAiJ/PCEVJc2wCemZV0YKTbbTcw4Vec5mL2sAP/tbNij/EeNkeUTU0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BpLiTgMvkOusP6aiFeguMseIqymCo+olOan+JQ4ulWs3UUhCb
	m+DymFGwKxyyZ68N3AgCSQyBVNELF1Ke0eGPnX0s55vMrD2P0UMXjKhQ
X-Gm-Gg: AZFdTZfkT2eSK6+o/AgkNc6F8fyqxWarucMabwdR7H+1vP068P2rgKLG1wA2mmSIIpw
	9SWNm5+v1GhnflQ/BvZW+LrFiFe/W1fu7CL3atSqIn+vjBWv4FwRHiaztov6CanPAJ8gJzyg9BZ
	rPMDKR1Wir5sSZJB0tMEo0NPGofAgEqSfOP5TpgtWscAzgkYLDOssrsHf0nU8HdqoXe4h3KPFd0
	EMBo6w9OtwkL2EEDr5ncQVSOKwVeaE5cpvA8u2Jd8aatGVeEp19sFfgcp/eaDljI2isB/SQ0qX1
	alyd/wgwwBWME3LWKmbuPRDDbtkAimhEJsZFh8s/YHDo6zJM86m4oOuolkexiQjFIwxLdag6GrS
	Ivop13+11Q5qeWQIGpa3XbS81XCl++5MmKCIyY3kXLT8XOkZLUSwTJDkXpDo0IHdu8m9DI8OAXc
	7673iXfcNJ9PitgBIbj7fOtH/SvaiLmvVDIemhU5od259LDWhgPw7Jsvr9EwuTQLaEq2MSpGV13
	9Be7rapRxlhzUhY6GqiZfrK37hTxMjWX5wsfyhQ2hqdnOLVriL6BjQmiqRc38iAYomWnL3I0w1O
	vDHK5qa4Fs53+rDnz/WSMF1pQ+UrKgXgrZa5Q7y1GxzGUD6fTz+05cuJKANWsEd84HGQb4/bqhk
	MW3B2GwgJEuV1j1rcW+ZhO0nwKGNJ0A00eA==
X-Received: by 2002:a17:90b:4d86:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3b41c93b159mr16040203a91.28.1795661304665;
        Wed, 25 Nov 2026 18:48:24 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm29193554a91.7.2026.11.25.18.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 18:48:24 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 02:48:23 +0000
Message-Id: <DN4ST2VP3GVF.GGKMH8CNILM2@gmail.com>
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
In-Reply-To: <CAPnbwjpLcyJF70D5j-q23L3TQSFXebB_RndQRmDe+_5h02YazA@mail.gmail.com>
References: <20261117-bpf-preempt-v2-r2-v3-0-586376ec3672@sentinelone.com> <DN38312WXPDJ.2KLUTCWSDFL3P@gmail.com> <CAPnbwjpP9Fin=CyD0WiA2c4sxqbfyK7AziE64PCX4w9kbz55Kw@mail.gmail.com> <DN3Q2CZJSC2C.IM2EYLF1NR9X@gmail.com> <CAPnbwjpLcyJF70D5j-q23L3TQSFXebB_RndQRmDe+_5h02YazA@mail.gmail.com>
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

On Wed, Nov 25, 2026 at 04:03 AM Mike Bazov <mikeba@sentinelone.com> wrote:
> i tried it, it works when the run that preempts finishes first, as
> with bpf_timer_cb(). With preemption it can be preempted too, and the
> preempted run can go on before it ends:

ohh right. save/restore works only when the runs nest.

> A fix for all of them has to change how may_goto keeps its budget:
> lsm, cgroup and sk_msg progs never go through bpf_prog_enter_run_ctx().
> I'd rather split it out of this series: v4 takes may_goto out of the
> mark, so tracing progs behave like lsm ones today, and a separate
> series fixes the budget for all prog types. Does that work for you?

Makes sense. Let's split.

