Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.225.130
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795454911;
	b=2CB4zBeAwcjPTqLzz7i0mJnyDQyoTJAAPAyeyRRRCvECPLlfpB4FwmueQMQqfLKzKu1g
	 NVBdB5gK5VNZhIi97e5bnDoLEi2du0Jw3IrI+vNzwtLikvJvhug60tFNghWu9dFsXtHGu
	 GD6biP+tFrPScaGymKmcnU1ew/pTFppV/a38tC8WNLpurWGKMjyaqIspYLrvhF8hIZg82
	 kUyoG6DsQUV/U1DBCFabkBqByk+ZrdSfXanXwL2UxioKl79Gfvo2JzcgS+ehffVaEGVd0
	 lGnOZI4DBAIiqMxrjDJTgSITudp2+ZiY4AqwDGri9q8kyjj6e7ltsJNRimW4y6TegIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fUTLM5WJXPLNS5+Y8pJq/Dz6CXEKl6FkzhodnqK0iXE=;
	b=L683Ww3PIDkepzHzl2HY0fhR7nZRnT+AdsEWzPhuszq3eVFoxmu/6g87iYYBMdC1De82
	 V9Lso8Uc98mbtO7UNTEBtLDTAJyrXGCsAQF/ePsk5gx6QeJLBeuYMySohAf5I4jXKiCGr
	 1Z3wrtaUG8J9du9EMPiR/pG4CGK6TCV0S+Gm8/gmBXsO9FaKbWzmpcs6tutWyYUn231ty
	 7l/eIuoGOSGlliawWgivHGcqWzD0A1lIzUo4rPtOkbxvK1bmdwErtMMRwNNTPIclFKD+1
	 8ihbFk3RMQIV/EnV6KVOP5YBApcRrfXKfbcWRwV7+9YbtnuDRNK4iOIyL3jX6AinCvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GS3NKWWJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.225.130
Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF087606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF087606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GS3NKWWJ
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-4a21339d376so2024995e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:28:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795454909; cv=none;
        d=google.com; s=arc-20260327;
        b=KMGvX3kusWask76eyiILUOt16EvPnmsmQwIHFgPaJasvhaZyanuRRfLrWyHd+vCraJ
         WQqOTEW4V+8L4TkggdUQKAOUyJhyr/X7PYPJ8kuUXXHtMI1bTXILg7Jut7sIURKiv/Mj
         2rp9aDabhGFw7S65W2a2+XX5jmz8m+kIushwX3j6dTFWwkfnpRztNYezrTKpNFmTAaZM
         kinX/eqXdTKp6eRP0sTr+BPTW7UZpP3pcdfV8l0NIiYMLCaJM2rfWuu5E7UP9Sd/aQRW
         XcmMyH1hoH4OLjOk5Dv9fhNniDXlUlxPdkLM9edZ3kxLWtOOWNwzTDW0L5q9tAWGtzRN
         oyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fUTLM5WJXPLNS5+Y8pJq/Dz6CXEKl6FkzhodnqK0iXE=;
        fh=hJeB2Vj5DDuQEtu2GYjPUr5kcvBq+/KiUeyLjWPQ7To=;
        b=KELjoekR6uQ/gIbJ2mdA5YW1vvFVIPZVlaWUF9eZD4dDD8anYqYlqA9K2MMxNcbKPW
         4lA9affYfaBfJfCeqyiOF+4Yoof38E4W6NS3S4UcL0AG+03UkitnqkWElpSEDTyIZdSF
         4buYcZ8981pmKDamd/SP0DXVKLrSUA6qmkZTVJrZpZfyMP6XzKdv4KY1jG8nt9eEp/rw
         l/RTwuzfGXDhwDAHYaCdbHsZxVQZCkI9MB4GRIHASNW+XUiuCExajorLmP+GPVl4weoE
         T57ndfL17YA9Uh4BdpmlTIp2v254enTxV8tvncPwr4fKP5LFfj01r0Mk6+YcRLJm4TYz
         uxcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795454909; x=1796059709; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fUTLM5WJXPLNS5+Y8pJq/Dz6CXEKl6FkzhodnqK0iXE=;
        b=GS3NKWWJfPDqc2UNc3jugC5XbOFW/zp1xuPTPQHkV0RXiniW8Y7TCiM7WhcOdCCwu4
         Xe+O+QxQZafyvI2nRpFVdDor7OAeTXLHwfvYyeXbdilCL4yedPQK56vNiQFeQgthu+M9
         TBUMrVCp82S5ik+t631L0zf0y42b4HK4uOyuPM1yNK9goNVOoSrWb4s1esSU7RBnT9rJ
         Neo3wQpHH3ZstOPxm1aFirdm5AzUyxJyrIZkJZaikLy6IGILAAHRYl2cYayxZn3Gt8kS
         NaGiG2a5bmye+Ki0o30OMVzQKQNpKd4zl2bhZRWj2umHx/jL4yAyU471fE8r2T634cN4
         1rdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454909; x=1796059709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fUTLM5WJXPLNS5+Y8pJq/Dz6CXEKl6FkzhodnqK0iXE=;
        b=Djs4pnXrhC3dNPl1+R0gjnyWlt5foDkvsOdckN1VKZ+P0Vu00NRYfCj03j0JkMQijB
         yzE6JsqzqDfp52TUxVC4DTIXeGajPy44ZBiDlMpJpk/6m0YGTGbVnm0V9M9EFyGsZacM
         /lHYYZ8fxRvYuo64gaky0ux6oppX0G4FdLloGbCoIGTPxtJg7wM64HNdB3qNPLRZF3hd
         targphzhNgwTqZulo+/WNHt+XmvQECsaspUApdQoxKvoTA+gGERsk1t/MAtilxVpGfcV
         fsgIYA9eiYiMmnllADsz8pkwted3X8+GbRJ0mb04mm3ON8x6qUWYH9Rx1Wgy/ZHmvdh3
         jZlw==
X-Forwarded-Encrypted: i=1; AL+hErHWux7HvDIgCpp7CxfPJyn3kSJ9W/UH8DXfk4kaGbeoxMR/LmaKboWmIA8uE5XYM8oX/fRIJgEM6tpD+ps=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GSh0KIPBTvLUc+Jf8Od4waEbeQF/BMVvEF0+GhwXQaBY0WGRn
	Z++mjXBopIer1DWMDRz1xz/2NJN8kOHAUD9rSF8RtwigFnUNDbE6OnO8I1YNRsBCFGN147ECja+
	OWFvOKGqTpx1P3FTsEGpUgrBNrzZCQK8=
X-Gm-Gg: AZFdTZfp1jlQoH5Siwf9qD5QLy4gFE7Lq8hYcK45NmoV2F6oWPpCpO8sAjUZGxVo+M8
	bams1LNnZiNpYgS821kRU4cC1+vsALnYHu/00/z7QAggWqvlWO4QDpWVuZegwPAz74UlL768piT
	/K7NateXKhd9VjT7NpUR9DS86sZQGBxiB/gek0wpt9bOmzr85Z4NQ7p4fhG7zL4W6qiOOVfWuAJ
	8669P/n79pwOuWVQt/Js/gk3usqsc3aKB/arnYbpKjzaSrRN+9yZJez3jj21YiiwR2E5sYnkwEq
	3unBSxe5wGFQrmM3eGzG/O2VyeN04TPu150jgIWOUGOmKY9FTebYGutVIhJruqrK8K3MEfdTq+0
	Ma6jCJ/z779DSrRncB7rdXLHQT9+TmCK6PdQVtu/XyGNLJDVU7x+8dhLc1PNoxPYpr8LZInryJN
	1I+3t8KJnBHwdG/NEl7QZXHF214jkg3INRSW6EiJpcf9HtVpsCZZaQqPKtNbrjH+W+w9bvAFGJp
	CNywpbTApcud8kr
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id
 5b1f17b1804b1-4bb887c3428mr259862695e9.1.1795454908811; Mon, 23 Nov 2026
 09:28:28 -0800 (PST)
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
 <20261122200848.GBawNL0FcQoK918YDI@fat_crate.local> <CAP01T746W=8FFiJJUM3H-Qv09uRO6-XEi9B-8pjSgtpAPBx4EA@mail.gmail.com>
 <20261123003036.GCawOJLKK1iX47XTDm@fat_crate.local> <CAP01T77EgbuyhP=zU9L1hwYL6rHaSbrqQZGJR_+9AQgSWLe7Nw@mail.gmail.com>
 <20261123025529.GDawOrIQcDOPhgWwF6@fat_crate.local> <CAP01T75Qps8bKFZAU2gN-3UJTB1aWw46NG5c-sm6K028rSc9sA@mail.gmail.com>
 <DN2E8Q9V38IF.3O738M7NGLSAL@gmail.com>
In-Reply-To: <DN2E8Q9V38IF.3O738M7NGLSAL@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Mon, 23 Nov 2026 18:27:50 +0100
X-Gm-Features: Aa3M54oRD3bvjk2K9lSlhPKXQEMcK417pjhjD1KAKu_5tFbn0tvXJL_H-YxjRDE
Message-ID: <CAP01T74K7YG1mfQzKsHA-Qo4WzhFh41Zxs2VZOT7k4DMGPfsFQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 1/3] x86/mm: Resolve BPF exception fixups for
 user address faults under SMAP
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Eduard Zingerman <eddyz87@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, kkd@meta.com, kernel-team@meta.com, 
	x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 07:58, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Sun, Nov 22, 2026 at 07:56 PM Kumar Kartikeya Dwivedi <memxor@gmail.com> wrote:
> > On Mon, 23 Nov 2026 at 03:55, Borislav Petkov <bp@alien8.de> wrote:
>
> >> "the only line of defense is for is_bpf_text_address() to really DTRT."
>
> Boris,
> SMAP stays on. The SMAP branch in do_user_addr_fault() runs only with
> AC clear, after the CPU refused the load.
> A wrong answer from is_bpf_text_address() can hide an oops,
> but it cannot expose user memory, so your concerns are unsound.
>
> > In fact, for kernel address faults, we already invoke it for exception
> > handling. This change would simply extend that to user address faults,
> > optionally for BPF code; otherwise, we panic as usual.
>
> Not quite. See:
>
>   fixup_exception(regs)
>     search_exception_tables(regs->ip)
>       search_bpf_extables(ip)
>         bpf_prog_ksym_find(ip)    progs only, no trampolines
>         search_extable(ip)        exact match of the insn
>
> Here is the alternative
>
> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> index aa88370..9fe8705 100644
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
> @@ -1263,7 +1263,16 @@ void do_user_addr_fault(struct pt_regs *regs,
>                      !(error_code & X86_PF_USER) &&
>                      !(regs->flags & X86_EFLAGS_AC))) {
>                 /*
> -                * No extable entry here.  This was a kernel access to an
> +                * The CPU refused the access. If the BPF JIT marked this load
> +                * as one that may fault, skip it and zero the destination.
> +                */
> +               if (!user_mode(regs) && !(error_code & X86_PF_WRITE) &&
> +                   ex_get_fixup_type(regs->ip) == EX_TYPE_BPF &&
> +                   fixup_exception(regs, X86_TRAP_PF, error_code, address))
> +                       return;
> +
> +               /*
> +                * No other fixups here.  This was a kernel access to an

I guess this is better in some ways than the is_bpf_text_address()
predicate, since the condition is tighter, and since we rely on the
exception table entry type itself. I am fine with reworking in this
direction if others feel it is better.
