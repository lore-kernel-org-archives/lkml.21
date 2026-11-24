Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795501548;
	b=NRvnRbufxopAfl5ag2DgQLMwAy7uELePE6iwnLjRogq4VMmOJHBIWIWsB8ZAPEc8w3JZ
	 WF3VyGeHH4Vi1nbhI9fzNNzK9jQh0hNXH+6YzPii+FRtCN3dvZ1uYmhcrnBFouJcJ9uVn
	 pvuhwZlJ2Lg32GEU3GZKk12m7nLwjJ8QwF5D5fBO+1QJRs36ff5gsD9ZtBEwVF1gVhUiP
	 BolUE1W4Yx+z7mL9jCh+W7oVWenp0htt6KCXsd7C3aPjtNtJ6klXQqlKGObWnr3J4Tgdq
	 9/eJesTH26fyv0G/HWWZ3GxiUA+ffs4s52uQo39UhlA26q8V/2lOuxbvv7jFb+TAPWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=mpGQvJviYasWyAsTrcg7sxjiOrvcQ5Fx+ssD1xXfttI=;
	b=omsUX81dDuI1thdiy+gS2FNNxOn8fHGkxlrKsHrQLM7ozM/042nqFuhd9J4el6hMAKXj
	 H+dKBKJpqC61BTAE0QvtGWyoPPwcyhG8qH+WtF9txr/62FrA2In7Z3QtWdhaccGSLkakZ
	 s0Iiq/PIgWbV57TGGuiOcyS5Iic9/WkdNi8bLy4QHGRBlUul1YsSNqAwFJW315Lal4DjF
	 LVtYRQvgV8DWxy0pa+ECHELZmEK+wzgAItHN3dVFYTnMunvWfAZDCQNh8bkcFU0Xl1Yvb
	 RSgUYlBT8t8Md8Avzp28B6+0gjG8F8M37Nm+3gXoJRTCjv9Jw7zVlYCjoeOImJFP7bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVbxuTR7;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88CB606A335
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B88CB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVbxuTR7
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f04fab527eso30417405ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795501547; x=1796106347; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mpGQvJviYasWyAsTrcg7sxjiOrvcQ5Fx+ssD1xXfttI=;
        b=fVbxuTR7ZvuW+s7OVdaHHBV+7uPpbE/pl8CKCM5mFwmDpYqUn5GAUER+witBpDuc1E
         pLrpfLGFEPeOstvVIaYTpDqMLXxVKhD23tM/jotQvTEJ2Uz7KveP5a7/oXAfoA/x6tAf
         ywKEojGyO7UoKutiDgj6/sTXSaxXGIIN/YmSQ40ymKzAKx7K/GmOn/+lbfty6ikWTuHX
         8kQMP1GdKMwYdt2Kq+Hb+sYWnSK/B9/wnKbkL2qyPyYd0DT/17Bsvle8xxMncSLot1th
         QkOqBpAyYBUSW8bMER00RQ6IjQrVb/lz8eJME4+ZqGo6goHIxKKVLk6j+mBhwotfCWVQ
         4rcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795501547; x=1796106347;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpGQvJviYasWyAsTrcg7sxjiOrvcQ5Fx+ssD1xXfttI=;
        b=eSsy8PTTvLHrfgV7nDHpPkrSej23+NBjYMZ1Eo+s0Asdavpkcil+DvQYCQ2tmPFy/p
         1ev6Ej1tuKPaX7F+TCLVR23WNbCxVApE+lIE7MGJROA0v0/nkVEa1TGEE92gXRETM/vh
         O86KfCv2ihcsCbTyt+31s9e2kkkkBJx8UZCCSe9c/e9RNjXfBxJ41rN+2W/GvbbvVYAj
         C++zCUdaPuYoPnEN9DtWftAW2iaELm84Hz3NoxLl4wE3viVNRbfi9LfjpqNiSI+NmIMe
         +xNl5kzDnx2UeUgJc+0UpvvCt8PQ4yEojRosmEyLaYBiPzomXSUCyA7xC0lZnvz/U5sH
         9ZLg==
X-Forwarded-Encrypted: i=1; AL+hErHv019kTQM6ffYEzNOqe3EdTFAME5qIO9WLqfD40AgDo6ksW0kW4XvcIj6ikm53NA7YEcV1BHK3JgMQFQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DDYttzVYGgwT2smwv1LR4OZnOITxZohBlg0HH3jd0Ayr+IVjM
	HwWYKh6JD9zViVrUmrXaT2HulU3GhXJ+Fkoi++NuF7GnKlgtZlt76df8
X-Gm-Gg: AZFdTZfiTh8iVeNGF2lmRjTn0beoUYQb0pJuk+V2/ZiAxEh1Ok+IKNvykYLAw7xZWYo
	Iafwg4pg5vD6oAGfGlUW1XooTTfIg0OO/w6Dguqq4JNJJ2X+DNJ8f73MpE2RT8H8MPm2eAX5+qs
	XD6yvyDNlkb8mf1hV5jm1R/v6TVjK30/2WSLudqm1OlLOgfLnU5Zfof6fOdr8oBDb+UtGN//gtm
	U4FgZOcJfO7E2HaONI8xKPWPvxOTrs2scx9nvW51AvojGP917rNZo4tIGHLMAZY3wNKSCgzXGGQ
	ajyfvJILUsdyvSKgLXEjRAs1NdoL0+oSPnFwhJKB3qs4IEUY9JyNqNybQ+rfLQ9e9rufYysqX56
	Mol2Bo8t2ozhfoHXylkhPVRLnGQ3fGM77ykxUOSA8LGhkt97PQd9qzG4UJn3kqqIZnyODVEeEtP
	XSL7HhiLBfq3K9wnFJM/SWyO8r2TF04pIaCdqSQXZDX69DiHAhZRGSxwxVyHgxkkB0YGZi5FEwl
	B7vMjsmnLtLMPxETpyRVBQA/FqN7J2rnWs4PhJSkOwgLh1N0vIm8JvYbmLd0/BtBBtbjPvJ4Y0x
	UCGm4NXm4Bi+N3nIIN7LOEK1eeto26V3TxpxRVJNlNpITIS3KtzG2GsNSSr8XVh5o9lBRJ18xZq
	55XbZgD6QYPXT54Xj/Gy2KCvR0vdD+2y+Vg==
X-Received: by 2002:a17:902:dacc:b0:2ed:472:b9d6 with SMTP id d9443c01a7336-2f03efb1397mr149727415ad.2.1795501546773;
        Mon, 23 Nov 2026 22:25:46 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f191464sm65713305ad.1.2026.11.23.22.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 22:25:46 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 06:25:45 +0000
Message-Id: <DN386F271FUR.35EWQWGMEMX7K@gmail.com>
Cc: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, <bpf@vger.kernel.org>,
 "Puranjay Mohan" <puranjay@kernel.org>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Emil Tsalapatis" <emil@etsalapatis.com>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "Andy Lutomirski" <luto@kernel.org>, "Peter
 Zijlstra" <peterz@infradead.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, <kkd@meta.com>, <kernel-team@meta.com>,
 <x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/3] x86/mm: Resolve BPF exception fixups
 for user address faults under SMAP
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Borislav Petkov" <bp@alien8.de>
In-Reply-To: <20261123185124.GAawSLLMoWwJ71nq5j@fat_crate.local>
References: <20261009024925.3169077-2-memxor@gmail.com> <20261009041346.GHashp-hYpLl-o-l3M@fat_crate.local> <DM0ESVBT9553.2S1RWK1W7M8WW@gmail.com> <20261122200848.GBawNL0FcQoK918YDI@fat_crate.local> <CAP01T746W=8FFiJJUM3H-Qv09uRO6-XEi9B-8pjSgtpAPBx4EA@mail.gmail.com> <20261123003036.GCawOJLKK1iX47XTDm@fat_crate.local> <CAP01T77EgbuyhP=zU9L1hwYL6rHaSbrqQZGJR_+9AQgSWLe7Nw@mail.gmail.com> <20261123025529.GDawOrIQcDOPhgWwF6@fat_crate.local> <CAP01T75Qps8bKFZAU2gN-3UJTB1aWw46NG5c-sm6K028rSc9sA@mail.gmail.com> <DN2E8Q9V38IF.3O738M7NGLSAL@gmail.com> <20261123185124.GAawSLLMoWwJ71nq5j@fat_crate.local>
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

On Mon, Nov 23, 2026 at 10:51 AM Borislav Petkov <bp@alien8.de> wrote:
> Look here, our mails crossed last night:
>
> https://lore.kernel.org/r/20261123043409.GFawPCQT2M-hz0mvZP@fat_crate.local

hmm. I thought my diff answered it already, but ok. Here the answers spelled out.

> 1. How reliable is is_bpf_text_address() and what happens if someone manages
>    to pull off a hack which bypasses it? In that case, SMAP is basically
>    disabled. And yes, "no one can hack this", "can't ROP-chain around it" and
>    whatever else is not a good answer. This silly function becomes the last
>    and only line of defense.

SMAP stays enabled in that case too.
The fixup doesn't touch CR4.SMAP or AC, and it doesn't retry the load.
ex_handler_bpf() writes 0 into the destination register and moves
regs->ip past the load. User memory is not read.
A jump straight to that load with a user address in the register
gets zero too.
The range check gives the same result today: zero and no oops.
My diff has no is_bpf_text_address(). It checks the type of the extable
entry of the faulting insn.

> 2. Is the rest of the arch code going to get "if is_bpf..." sprinkled around
>    it because of some other performance argument?
>
>    Because long time ago there was a pile of patches which did sprinkle "if
>    (xen)" and they didn't go anywhere. The point being, special-casing
>    something completely unrelated is not going to fly.

The diff has one check, and it's on the type of the extable entry.
error_context() does the same for #MC with ex_get_fixup_type().
fixup_exception() has EX_TYPE_BPF already.

> 3. What do I tell the next userspace program type set which wanna do "if
>    is_Y_program" in the #PF handler? I take them too? Because I should not
>    question their design either and who do I think I am to question that?

A JITed bpf prog is not a user space program.
It's kernel text in ring 0 with an extable, like a module.
The bar is the extable: kernel text, an entry for the faulting insn,
and a type that says "load from any address, skip it on a fault".
That's an inlined get_kernel_nofault(). It isn't specific to bpf.
If you prefer a generic type instead of EX_TYPE_BPF, that works for me.
Then get_kernel_nofault() can use it too, and
copy_from_kernel_nofault_allowed() can drop its user address checks
under SMAP.
