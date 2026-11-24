Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551423;
	b=a6/YnWrnMxFaI6GYuBVojML+aFcEcZtP1rEKssVNhlJyX+gf2/iBaWxMvveffc7CIUI2
	 7+d3bs+j00sNvyi7+GmqFhyE5jmr0I2oT0oJui9fgEaGzLu012KAxqJ6PgGpZMl1wFlF1
	 kvgf7VGckISmQCruph+bJUyjDKY/jgwVZYCFXyd4pRzPR91fEZ4ghTxY9Dv10RIh3SVBA
	 faEa7LoGL/ZUmnyPQpJCcrKQNIM5XaAIr5tcAZzQbFwODOR7ggusUeYwGlgzCKkxT+ZTv
	 aEmMaskbWYbkT/F88syjDZ/MZP2dz3ZcmvLh3miyBH1MfBo0A0IVzSyXuSDkcszOZyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=19rRlZPT1LVmqMdWRk6gML8eP6Esmj++HIxjdU6f6nE=;
	b=RsRbpgOgP++8uSuSVTUOYgEoR+4qO9Q551tVmjH5Fzp0AmB4D0vT0U4sBqvIYsWHZHi/
	 A/IoqNwCSlyEnq8z9hFcvGOp8wv81ksobw4Mn9FG8RiRHE1eliRe/dztOeZZVyF4WXewa
	 BemnnQz3FJ8Myg1KHXdJ6TugL/x5j9pc9pGYosSPHZKwFl1DtmDUChZulWkmbrTndjGDP
	 /I3VyPJayql5KaDDolcxa7haxXGgTxI+LvLNOjPDgc5Zk9Qn6r0t76x6Enaz32zcO8UJr
	 XZKORLOPkCPr+u6tMd3MqCZ5w4J+yTCFfUW7tvrVJzL2/vuza06enM6FXid1s4XVsDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bg+8NGH8;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804F8606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 804F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bg+8NGH8
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f0414c1062so29229765ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795551423; x=1796156223; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=19rRlZPT1LVmqMdWRk6gML8eP6Esmj++HIxjdU6f6nE=;
        b=Bg+8NGH8bdD517brgNx6BmmvHoIJvf2qPj8L84H8t1SkQUuzHMTixOn9GZqTfbiWd7
         JVmtTgivhGJrT+f9aYNpPEF5TBduBrG5120dkrLfKt1263YMM84lTX9A9QKMtAECI2+S
         T7+FUFm2fql6mTt404hQS0usO+g2vGaui2neZLRC3bdOia9CFtWRDGtmxe/ugRTgYoLD
         5lCIQeuUAhk9pK6x7AUYPuvq6EQ+V/WbS44NKjN8f7dYT9Kz5XFtd9rm5fEKxTnFozi+
         zWfeUn/b8ZWj3Miny40ImzrE4wcH5olhqXfMj9bgnUexSpNLVKavzcnXHKsDcIXIkusV
         vrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551423; x=1796156223;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19rRlZPT1LVmqMdWRk6gML8eP6Esmj++HIxjdU6f6nE=;
        b=jfTULXw8qMdJ5CajPhs/gy5ouYRzZ9hYAtgBuHCAatJlWxV6ZhMKtS49XHfVh7kU8E
         +x2ZwlnhOU1z7vSKvD4RFWbTXYOuWPwsgYmm59TJycZwA4gaPru9w2EIvqrMo0O08YlM
         UVF1jjiHrDYoeBpga4o7ocCy6YSJI2u5MO9zdneu2zWxTgEGRg97e8oI4SVuo1Pph5eM
         6Tznx1CfcpfPP0ssqXOr6bJLRPvu7QrMsIeTjGtK5tDuzYR1h8ffQdYH4uZhjjAQIRLg
         ZsN0DLHPEqSnnz7Gcc3k0PhdVPB9roeh3MZ+VK6pmQ9V+Ub1XjLCIMBODQ3H5fM2QFSi
         nnYA==
X-Forwarded-Encrypted: i=1; AL+hErFW5fPlW0OTg7IwmzNx7ipJaK/UIWnqQYUPgku7wtgKpcMHtVWFKBjd1i3w7VfzAOL8T3dZl11j/RqXge4=@vger.kernel.org
X-Gm-Message-State: APuU4Z94Hl9AVGpDURNYxMkx6eeTq3TAykm0OLnPVxEooBj5Ypi7xAw8
	Fb4SWv5SqgF8m9BDQu5PD1dkVe/lp23+uCMFiN7Srg1kKxWzqs5Jzk+c
X-Gm-Gg: AZFdTZelc6xCq9ImRXJWqYrA+WJd/s9KGPMKp3QLirPNp3moCbKq/VFzKu/7V8csw/o
	coqTb0N+0Z9ZKHniWVWCcObZmz64L7mzj9MxSbBhjSisCbSvrtdCJ2DQFyihn3A2pac1X8PRNIP
	GUTtkIrYPzBCyyErE8pBN5lUHRir8vHKRld8MjH3LRC0wekU05X3u14PLwAvdPGLLd/uQpU592a
	HQkEmIxLOrjSENYRMuNAgaKxEX9tHeAvtbAFFyY6IXazYedF3I9vl5MYoOEXqb5AA6osXNKDc4+
	AJj86Sf5ayTVg5Q7qeZJjOyRSNg91RnESQBae3Lhlh0X+0A88cLmUP16ditlNiMq6Gb0drAzByz
	Em7sc7e9g9Q1Ndd7hyvQ4FiXuYmtXKRpZ6cH7gKOZXDsvIsnbvm6EU9X1feaCAtmrrlrZZXNtl4
	JK94FQkH1yLapfp4LUXY6FcFRCxrtLkfO5YFnlr8zMdt0sMSkue1D+g19lhNNuV8l+fU0o0UJHc
	fX9fIZPhzYK2zkqSzNaoZ/TamjF9OjXOitj+wSTA56eGVm6GD0KFOAkdgdTmGjLotfeREnBgQDS
	u21YL1+GgnshNmeYvr/f5HpvlQGD5VOf3rrbdqgN5+XJUMF0GNUGeXqZ872D2trGrtpzgO5R+MX
	1JxH1JhAmOmObpal3ZeNnfJyWt4kFIQrMug==
X-Received: by 2002:a17:903:24b:b0:2e9:9bac:2e90 with SMTP id d9443c01a7336-2f03f1aa1d0mr135413125ad.65.1795551422519;
        Tue, 24 Nov 2026 12:17:02 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a8asm73930925ad.24.2026.11.24.12.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:17:02 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 20:17:01 +0000
Message-Id: <DN3PUVNYI5U3.EG46DZP94II5@gmail.com>
Cc: "Borislav Petkov" <bp@alien8.de>, <bpf@vger.kernel.org>, "Puranjay
 Mohan" <puranjay@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "Andy Lutomirski" <luto@kernel.org>, "Peter
 Zijlstra" <peterz@infradead.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, <kkd@meta.com>, <kernel-team@meta.com>,
 <x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/3] x86/mm: Resolve BPF exception fixups
 for user address faults under SMAP
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Dave Hansen" <dave.hansen@intel.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
In-Reply-To: <077779c3-aac7-49c5-8887-0d4266caa2d6@intel.com>
References: <20261009024925.3169077-1-memxor@gmail.com> <20261009024925.3169077-2-memxor@gmail.com> <20261009041346.GHashp-hYpLl-o-l3M@fat_crate.local> <DM0ESVBT9553.2S1RWK1W7M8WW@gmail.com> <a08e55c4-26dd-4502-9cca-b063387a0e06@intel.com> <CAP01T77AiqVjyTJbHYqXe2v_h+PYzFEe3DeVTc1nyZVnzOfd5w@mail.gmail.com> <077779c3-aac7-49c5-8887-0d4266caa2d6@intel.com>
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

On Tue, Nov 24, 2026 at 07:25 AM Dave Hansen <dave.hansen@intel.com> wrote:
> On 11/23/26 09:23, Kumar Kartikeya Dwivedi wrote:
>> It would be equivalent of doing copy_from_kernel_nofault() in the
>> normal kernel.
>
> ... and running afoul a userspace address. So, no, it's not equivalent.
> These accesses are more wild than anything else we have in the kernel.

copy_from_kernel_nofault() runs into user addresses too.
sysrq-t does it for every idle kworker in print_worker_info():

  copy_from_kernel_nofault(&pwq, &worker->current_pwq, sizeof(pwq));
  copy_from_kernel_nofault(&wq, &pwq->wq, sizeof(wq));

An idle worker has current_pwq == NULL, so the second call gets address 8.
That's the same walk as sk->sk_socket->file: no locks, no NULL check.

The set of addresses is the same. The difference is who refuses a bad one.
"CPU" is a fault and a fixup via extable:

                              user, guard,                  unmapped
                              vsyscall page  non-canonical  kernel
  --------------------------  -------------  -------------  --------
  copy_from_kernel_nofault()  compare        compare        CPU
  PROBE_MEM today             compare        CPU            CPU
  PROBE_MEM, patch 2, SMAP    CPU            CPU            CPU

Every cell ends the same way: no data and no oops.
The series changes one cell.

> Do we at least require that these super specialized programs have the
> bpf_prog_info->gpl_compatible bit set?

Yes. check_ptr_to_btf_access() rejects a load from a kernel struct in a
non-GPL prog:
"Cannot access kernel 'struct sock' from non-GPL compatible program"
The check right above it wants CAP_PERFMON.
It's the same as bpf_probe_read_kernel(), which is gpl_only.
