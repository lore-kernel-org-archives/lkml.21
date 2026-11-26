Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795673883;
	b=efR+l/EUVlj1xPjEHYkisaAdUtUVlEsze4I6yAxXo9O9jqndeaHETUVh94flKnpXNGeI
	 nW0g8r/J+7LM3XszuEOsEWxJGfc0dEFcQHStuZZt4Y82U5QKYS9lB6Ukiqxm/31snhX7Y
	 iXOnmWRWiq0IC29yf/vZCnuPpdtD1FcJLCWgNCvNAYAwnkzUU4dMw2qCGIjEfje3k+tSz
	 fvwfF+cRtl1DXQIvdm2X+CO531eZ3JAE/z5tZBGLR+gL5qtx7raquduf0RQ4lgq3+RVF8
	 jdEI7i6w7yJ5akTGkfXzPu019QZaxtb/pveTCxVzHdc5w05AovgNLs4XnHcFmBbHj8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=a/5pYkYKOsm3brGJSfZdj7PKFExG2uNyudUHdVdQcU8=;
	b=GTccvzCvPmbjpxzipP9Bi54ZpGEwROHD4if6AqERpFhhng2u/RwKj2pjGvoH+y8HmFlc
	 JLSixywL99obmUJ9UFCJ6FJ95CNBztyc0f4lPshvCMZKJwTFiZwJVZ7GkpFkxIgyJklnY
	 odHrTqOmJR26bYmCeybiDR2d+4BNJZwJiCbNscHT+oH0XCH4B2jTgq/cqZ2eGgKE6f49b
	 Y6pEeT6MixfqhLDnhrZo4FFx6RrtGO1m2Q6CgHx2bJw/2Ak80UFJeosntYmgz0l6RjR9N
	 D4uJJapXlUlrbujKJcVPTxPuiEfJkHX40ypmnZWlveEHyTFV3lhTdcZv7Ppz38KUBng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fpiGeSTb;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CC5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2CC5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fpiGeSTb
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8c6c06b3321so5312754b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795673882; x=1796278682; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/5pYkYKOsm3brGJSfZdj7PKFExG2uNyudUHdVdQcU8=;
        b=fpiGeSTbvNmAV5CWLDvS4NJVnUMnRXVypsIzfoy6m8QkCmQSkqoNLDbPC40D8ofUC7
         3EmklIRyEe6QKFMZSk8uopBf8Z9xKtNnkQmU2D11s8YWYB1q7jWfiRGEBltBsedObCoQ
         lNOnDgaxtfDUymxyffWK07DuAaLxu387WFBBqkqN4ji7lBciNvpocLCxS7uqUCJugn2J
         Xi4O8hWQq5ljgxtKZm2KpWXnlbAoYwcuMgCWWisjK5E/+2BAZBrJ8/Y0VA/aufG7/IQW
         k8gWL7ydUO4LxQo6UG5lBIE2QjRChr8gkYXkVc1jgX+WkMtZzK+RE32YW3SV/PhnKJKa
         BPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673882; x=1796278682;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/5pYkYKOsm3brGJSfZdj7PKFExG2uNyudUHdVdQcU8=;
        b=2cpULZgsQVwoc+hCerPnxJNfpHIYY7GYkZQyo8nejh8TRbU+GFrICbdDp+FR6e4Dqt
         qRJ4eRzi/Q0B6APia44av50ROM87lvg64+uzOmm3zrFL/Dloy3I/9U7FNVj+RZzLWmkE
         UfpyiLjfqisMFlo9/fGmDZJj47nofSuW5Sw7vUdnugBYd2Dg71WB3hH3wtlFIVE9BuGr
         8c4og4cJ72RfAk2eEvb0/jWNZ3ss05BUi4bVRl8bZL70Yof+KyUQB/PUulsyKhtuPeS5
         uUIJna5u8z5idZpLnxdNKQZKLvnRgDr8xidz2JykfEUzocmjdiCdj+w5qGIUbb+S4QVJ
         Ez8A==
X-Forwarded-Encrypted: i=1; AL+hErHJE6kvKvgyyAeZIbcK05/Ui66GSQ8xEnt9ft3Fkhok5OuwBkfb7d4RQkaW8sY+55ecl5ISirWeOqt15bA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N1NyXhdk11xNfgNKkaUak69qVl4W28dEdDKecbqOz0ynPxLaR
	0SCmtn9nCy6jVeu1WCVzTdrfpy3P/idFoZoMEe0YqXSNaqaOmfJjI9l2e+wj0g==
X-Gm-Gg: AZFdTZfT3QEAVOGVzzBsPLky6HTY3liWOYKlWHFQe8P8a91hB5VB1aQagxaDKq8jmCM
	DxskBKGZxIzKmhm9QG6KnG9EjUxXLKVMfN6ZvUguV02ytH6ev3JqSUBcusYhGqJIlw9PLr2q9Ng
	fgRJnxjyUokYcspON5thpo+Aen3Qd1b1STRy+tS4HFkyDEy38uArAkRHbtL5DirbT2X5dr32i4U
	JpLCf2XbHJq+9catANyIsXTK0R6FNcb3M9GILbc9S656yVwWR2Oeb4ltpl5pRXYScCq7Xp0y46N
	SKc9tflyxCA+k4RZNo+TS9BsqSgO2oH9F2+vdcKBqlnVeeyfM5CscYcntndN68VpopZVcx/dG68
	9IcsQj8gPTQdoAGoql6sxWf6kDWfVtcIFWFObyO2MzSMmXyjY0hzrP0jwIRjA0rpotV17vO37oe
	7r3gBzPXfzTT6kLAem+7ubskllLcXBXRhL5zsLPyX9azju32vths6gX99EL+pzJhoWVIJq4y4ZL
	VZQV8/OyPvqkBwb0Bibx0r5739JG719v1LeJNgR0ZzeeH/efQo79+RXmg93uTexTrOHSfDX9hRX
	eC15K0ODBpI2+b71ZCK9C28xfD+iAu/1wh2lZxrMIRu/mrvbXAfPoYhTu6b2rhQ0bu365MK9cTg
	axOxX8LNUfu2dGvjeZIaNlppb9YLEBSqelg==
X-Received: by 2002:a05:6a00:2d8e:b0:8b5:9654:d331 with SMTP id d2e1a72fcca58-8c87663d9cfmr20655511b3a.0.1795673882121;
        Wed, 25 Nov 2026 22:18:02 -0800 (PST)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm10016201b3a.13.2026.11.25.22.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 22:18:01 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 06:18:01 +0000
Message-Id: <DN4X9KVYMONH.VHKD1QED1BUQ@gmail.com>
To: "Andy Lutomirski" <luto@kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, <bpf@vger.kernel.org>
Cc: "Puranjay Mohan" <puranjay@kernel.org>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Emil Tsalapatis" <emil@etsalapatis.com>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, <kkd@meta.com>,
 <kernel-team@meta.com>, "the arch/x86 maintainers" <x86@kernel.org>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/3] x86/mm: Resolve BPF exception fixups
 for user address faults under SMAP
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <5f46d1c1-fdce-4f3b-9d56-675a822b2d65@app.fastmail.com>
References: <20261009024925.3169077-1-memxor@gmail.com> <20261009024925.3169077-2-memxor@gmail.com> <df69ab5d-bc97-4651-8668-a2b3e4bb272a@app.fastmail.com> <DN437OYZ5FGP.20VLV7ZEXQ5YY@gmail.com> <5f46d1c1-fdce-4f3b-9d56-675a822b2d65@app.fastmail.com>
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

On Wed, Nov 25, 2026 at 09:38 PM Andy Lutomirski <luto@kernel.org> wrote:

Pls wrap your emails to ~80 char per line as the whole kernel community does.

> With copy_from_kernel_nofault(), I can grep the kernel sources and
> attempt to determine whether it's being used in problematic ways.
> With eBPF, this is not really possible.

let me google it for you without bpf :)

  echo 'f tcp_retransmit_skb f=sk->sk_socket->file' >> dynamic_events
  echo 'p vfs_read v=@ADDR' >> kprobe_events

It does the same walk by BTF with one copy_from_kernel_nofault() per step.
No locks, no NULL check.
The second line reads any kernel address.

> x86 does not have a special syscall to do copy_from_user_nofault().
> If we did, it would be a pretty obviously terrible idea. 
> But eBPF has an actual API here.  I think it should make sense.

sigh...
the kernel has that API since 2009. bpf is not the first user of it
and not the last:

  API                           since  the address is
  ----------------------------  -----  -----------------------------
  probe event: @ADDR, +8(%di)   2009   any number, from a string
  bpf_probe_read[_kernel]()     2015   any scalar in the prog
  PROBE_MEM: a->b->c            2019   a pointer field, by BTF
  PROBE_MEM: bpf_rdonly_cast()  2022   any scalar, explicit cast
  probe event: a->b->c          2023   a pointer field, by BTF
  probe event: (STRUCT)x->b     2026   any value, explicit cast

Every row returns the bytes at the address, or no data on a fault.
Every row is read only and needs root or CAP_PERFMON.

PROBE_MEM has the semantics of bpf_probe_read(). It came to replace
chains of bpf_probe_read() calls. The risk of MMIO was one of the reasons:
https://lore.kernel.org/bpf/20191016032505.2089704-1-ast@kernel.org/
bpf_probe_read() takes any integer. In a->b->c the verifier checks every
step against BTF and rejects a load through an integer field.

> u64 value = read_nofault(foo->p);
>
> where foo points to freed memory and value is either the actual bytes at whatever
> address is currently in foo->p or zero (or a MMIO screwup that will take
> down the whole system in creative ways).

Yes, that's possible. It's possible in every row of the table.
The first echo line above has the same window.
foo->p is a kernel address here. The range check passes it, and so does
copy_from_kernel_nofault_allowed(). The series doesn't change that load.

> These days it's easier than ever for a malicious user to write a cute little
> tool to put a value they control into foo->p.  And they can point it
> at *someone else's* memory.  And they can get that memory leaked into
> the statistics.  And probably find a clever way to extract the value.

The value goes into a map, a ring buffer or the trace file.
An unprivileged user has no access to them.
Their reader has root or CAP_PERFMON and can read all kernel memory anyway.
A tool that walks a freed object and hands the value to unprivileged
users has a bug. It's the same bug with a probe event.

> *If* it were somehow deemed that #1 was the *only* major problem with PROBE_MEM
> and the feature otherwise made sense and it could have well-defined semantics,
> I think that x86 could offer a reasonably performant way to do a read that's guaranteed
> to be side-effect-free.  I can think of at least two ways to do it, both nontrivial. 
> But there are a lot of ifs here.

That would be good to have. Every row of the table needs it, so
maccess.c is the place for it. What are the two ways?

It's a separate topic from this series. 1 and 2 are about loads from
kernel addresses. The series is about user addresses. Today a compare
refuses them. With patch 2 and SMAP the CPU refuses them.

