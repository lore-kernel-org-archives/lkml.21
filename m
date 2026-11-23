Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.225.73
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795454657;
	b=pc/NgI8Y3AUKEkwephCehO7sTAx32nOi21hAXYsURtdLBn2uvTSaylOMkCGga5vHJkwM
	 jGDFA6+fhKznZ5VwE12yaXtHeIkTAVB7LdiXmDKJv0ZvD3gAWUbK375dGGKdYl5eT9D9y
	 OhFLhmd8pJ0qyahamAAiMX6/VLm/cPm3xMNwSm7WJj50FRb/lPz0jYyleq37/icVB0+jf
	 OZSWADggsZPXQ4EvcQsz0m1mhFG7eye0115qB4CCO7thTQ5thiD5ITXUUioT+/E/J0EPy
	 J9Lr64isjgEzvTj7pIxNQfugFUYu07RxE3v4FGL6ImNTlHEB0WsNeb3d4jEBiGUNjbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ZgEGg9m51G/5DAgpzXL9PswXeGkJCwpX5Mf+qQRbeMc=;
	b=5Tr5mnJ5kHiKb+UhKyPEqaxmw29hOJkS/MMSqx/MY4e6sQSaRjWmp+2A4OdfS72WjxqM
	 NmY0D1bv8a64tWgLGI4iVZMTajOs/smIJYOiwjP+EQ7GVY0Xn0dYs8vpX80/qY4Q7+tX9
	 VMIQOGgu9Hh2ooPlL0ZMD8FjoHUrzS/OGPo1C8OQzObrxYetF9sQovaD7X1NKNSDIRwAl
	 A1Eb5l2IxQMxs4DNw5unvl3+wWLr/lGqX8U4pXmyQvipokoOGfCFwHHT8oesHkvN8GuR2
	 Pt0jgnx+0MowTS88OgSqJyFrJ21BtlY1ffMFNgS0kgxCg7fcTpaDefUVyyEyi2hXhJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmFABGjQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.225.73
Received: from mail-wr2-f9.google.com (mail-wr2-f9.google.com [74.125.225.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FE0606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78FE0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmFABGjQ
Received: by mail-wr2-f9.google.com with SMTP id ffacd0b85a97d-4ab565cd9a1so599613f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:24:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795454656; cv=none;
        d=google.com; s=arc-20260327;
        b=Y746LRJbTM73s8Rg8aboX7er37tF9tz6CwMx5VVCEZ/uFfc8TdRwYNC7LcJ1fpZOe7
         bv5BEeRxuJ2WsvxrzAuq7l72whQjBijQyTlca4Gdbrn2fcoxtRvAh84COAUjs7FB2kKj
         nm56415Cy9UH2sAMk8ArCh0yHA1eNMXugEelcosoR5OwXB9G656PLFmxHIOgxIobDKxO
         VclzicGmIatGvyr680x5qyWm+nrTGYLIFajARWl5lK3rF0QnGsRv7v4rk/sbzpM1USGr
         UV/XrsEWAQJzYyvrRQG54p6OCTOjkKeJjwmydKw+95siMnnl3peb6CtdxU64Pwg4IrIN
         toLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZgEGg9m51G/5DAgpzXL9PswXeGkJCwpX5Mf+qQRbeMc=;
        fh=GurP6c4O2AqstbxOsFCmTiLJkjlGUy5zy+4CPyqSrnw=;
        b=Fd5ltvGcutvrhzKx2dLnK4JswloY2LwGZ0kT0BQenO31muv9CEgvBibslHwkC6etyS
         /+qpsgiR5Rvi6l+/2Zo6FrZ2QaxzGrT8OikYDNt3cjNTDcxj8neqEleuegg/1u6A9CgK
         tNHiRbJTlACQZ8slo8dOotpmVUGgwx9GfATLKCLnmUwOaVn447e+YAdHOJ/ZmNErcSv7
         JA0Ta0Xk2mbBA4K1ya9zXvT9+2Aydm4uVDVUgGcBP3gwF0w6+Fy9+cFkTZ6G33+XD8wE
         uvi3L4eVVKm4Evrj8ntfPbcoeFm/PobrCfQGknV+vDjNXXLMcgRD+QfWXoPivGPu/hlH
         az/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795454656; x=1796059456; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgEGg9m51G/5DAgpzXL9PswXeGkJCwpX5Mf+qQRbeMc=;
        b=BmFABGjQN/9jPTL0iJHghX2wIraWr41uMl7Qq4MnUVd4pECgcDaTE1Uwk/vwqJKgVQ
         iTywB3HX4c8wLBspJbKKJJ9ZzXuTcrhphw9jEQwH5+XL/z7E/q1Mu02KYV6xeT3QMjPQ
         vRKEpPeDH3FYp+/QOz+k+2UkSKNs8AieMk2uPfJpWdUlg+E3qO5cHRC0+7Bz4PM5BLL5
         Bob7VZX7005Uvny6lF6Od6VPlHESixgeVnEyV/9hoPeoIgft89xadkOA0+UAAtEwh/BQ
         Gv/B7DuvJBMTQckyEdf/jWFYFP1yyfeshaDyhV+9NnAypZ5T+XfKJEZTWXQe3CoUsO5X
         KFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454656; x=1796059456;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZgEGg9m51G/5DAgpzXL9PswXeGkJCwpX5Mf+qQRbeMc=;
        b=eytfiNwhyTnojPYkvgRSfd3z4qkp2gBpEnmzIVOJ01OSh+RPFXJ4h880xaw/9Gj8FK
         UzfZe1/YyIryNpuJaEpep5j29e7LJG9kBRmvJ/gxXcQ4gPxceu8c0+f4IsTJO4STJBoW
         ZP0BhaeuwQon8v0u6RRRTz0B8plU00u7PjxYRAE55FFeHqhZwy5Xa/WkrSWt2B09V8zw
         Rv9x5T5rfI2I+fB7LuabyUjT0J1u70mRXvhnvARnzGsiDlEe5tYveaJx5gwdkvKXziei
         qTgLp7Cxhbyi82NxK9LL+Q5IbcMObMYgGnMpLog2RYml4sLwysXr1Yuvk+0uAJCVt3BM
         h10A==
X-Forwarded-Encrypted: i=1; AL+hErFyyeMmflOi6vcw+0VjD8vYtluzGTjDqSoUj5d064+/rezrCyXHHnC0vZRkGQn1gv5r3VoEK6EoIM9C/Yg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xReHlZChdg274fGZJGpyTl6KJ0fFiCt47TrN+Tx2LqQ2l29Mw
	Z2Og+xK3CU/AyHb9FBB/MHmf81bQ2pgCvon//JiUw6i0MaGHkKqhisnF+7xbSFqjr1VmAecN8X+
	g0/NxSfaenZmi0IYwUlLxi39jtydysyg=
X-Gm-Gg: AZFdTZeKzwqPBiTkQR6Sf50fGb58F8rwkbpSqmkSeXVLaTq4vQ94joPVaOxEQ2IxZ+L
	26RhN2NJnSVDIUesYxvgMZH4wnywCx4ImkdnDQmnC5aeWlfETmIKjTKjvYbFruxd61vl07Ygttd
	zwJZqj0zRhICgA56f+7LCPO5OpZaYFjIMqKAshBvIehfJFGdOnPMinnSskV5QwcACtv/WmP7Oc+
	8k3opFsKwF7ucnZSxQAFVKkaaN5AYDCgh5DGV0Cd+NLsYGLBM8oYT7gC27MM+eerFA6iMIFHoMA
	SnHPhXMMeIaIUUQ8tjH+4wjvj/9U+BskCtkSUhaIuVy161YKQyvbQulnyrYsUh8NHbJ07aVyYIP
	J/cbe6JkxOI3jdF++vXsx4MXi6tPr0hJYapaFEqXNc1yz0jEZ9URa+p/CtCJeKETrCUxUd4Pi0u
	omcMjII10Y0QAC4bXWw2IE6qQ3VH9SKNy2FyTbh0A9549uh3JSwrbsefI6R/E46PtVUSCs7t3xL
	RgK0FMNpQdtjnPX2X0PkhUNiB3+72MxrQLFFQ==
X-Received: by 2002:a5d:5e8f:0:b0:48f:bf71:2ad9 with SMTP id
 ffacd0b85a97d-4abb400bcb1mr24309855f8f.41.1795454655445; Mon, 23 Nov 2026
 09:24:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009024925.3169077-1-memxor@gmail.com> <20261009024925.3169077-2-memxor@gmail.com>
 <20261009041346.GHashp-hYpLl-o-l3M@fat_crate.local> <DM0ESVBT9553.2S1RWK1W7M8WW@gmail.com>
 <a08e55c4-26dd-4502-9cca-b063387a0e06@intel.com>
In-Reply-To: <a08e55c4-26dd-4502-9cca-b063387a0e06@intel.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Mon, 23 Nov 2026 18:23:38 +0100
X-Gm-Features: Aa3M54relxQoy3EdiSIPsTaCYulqDgyys0pixRmsp_lAiGy74skMPUx1VNI5t8s
Message-ID: <CAP01T77AiqVjyTJbHYqXe2v_h+PYzFEe3DeVTc1nyZVnzOfd5w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 1/3] x86/mm: Resolve BPF exception fixups for
 user address faults under SMAP
To: Dave Hansen <dave.hansen@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	kkd@meta.com, kernel-team@meta.com, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 16:36, Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 10/9/26 08:23, Kumar Kartikeya Dwivedi wrote:
> >   SEC("fentry/tcp_retransmit_skb") <- attaches to the entry of tcp_retransmit_skb()
> >   int BPF_PROG(retrans, struct sock *sk)
> >   {
> >           struct file *f = sk->sk_socket->file;
> >
> > This program was written for doing a TCP related investigation. The first load
> > of sk is fine, but sk_socket can be NULL (orphaned socket) or stale, so the
> > second load becomes a mov with an extable entry. Below is the JITed sequence.
>
> In every other part of the kernel, dereferencing a NULL pointer would be
> called a bug. Isn't this just plain buggy code?
>
> I assume the BPF program wants to tolerate these situations because it
> can't fully participate in the synchronization mechanisms that the data
> structure actually needs. So, it makes what (in the normal kernel) is a
> buggy access.

It would be equivalent of doing copy_from_kernel_nofault() in the
normal kernel.

We allow privileged programs to do the equivalent of
copy_from_kernel_nofault() on such pointers, for reads only (the
verifier rejects stores). It is just done by instrumenting the
program's loads, so that the call doesn't need to be written
explicitly for every dereference.

The BPF users know that such reads are best effort, and they use them
with such expectations. Annotating all of the kernel is not scalable
to determine where it would be safe to allow, so privileged users use
their judgement on attaching in the right place and using this
mechanism to do safe reads of kernel data structures.

>
> The rest of the story is trying to fix that up.
>
> But I don't quite know how this can be done "safely" in a way that the
> fixups end up with good data or NULL. If SMAP isn't in play, can't this
> just go reading garbage from userspace?

It doesn't guarantee good data. The guarantee is the same as
copy_from_kernel_nofault(), i.e. the read won't crash the kernel. A stale
pointer to memory that is still mapped reads whatever is there now.

Programs that need valid data use trusted pointers the verifier can prove valid
(refcounted or RCU protected), and loads through those have no extable
entry.

This contract is well understood by BPF users. If they need to read
valid data they will use trusted pointers. If not, they rely on this
mechanism and attach to the right place to ensure the data they read
is valid. In practice it is heavily used by tracing programs
collecting statistics and observability data.

These loads never read user memory, with or without SMAP. Without SMAP
nothing changes: the JIT keeps the bounds check in front of the load as today,
which zeroes the destination register for user addresses and the vsyscall
page without doing the load. Patch 2 only drops the check when
X86_FEATURE_SMAP is enabled, where the CPU blocks the load, and patch 1
lets that fault be fixed up through the same extable entry, as we already
do for kernel address faults.

>
> Also, can you talk a bit about the code generation on the BPF side here?
> Are the instructions covered by the exception table handler all pure MOV's?

That is correct. Each extable entry covers a single load into a
register. mov for 4 and 8 byte loads, movzx for 1 and 2 byte loads, and
movsx/movsxd for the sign-extending ones. On a fault, ex_handler_bpf()
zeroes the destination register and skips the instruction.
