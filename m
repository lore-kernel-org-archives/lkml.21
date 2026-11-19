Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101553;
	b=ahNs1YXaHhT4QZsw3PJzAhBt/phLjuyTYg06ukvxm+7w/v0hxVla2k5fce8burYx4gX9
	 /7MXn79iDJTq+e+zUeiqPmcPvPcgw+/HkSOwl4JnTPgTA4GkSOfCO6rrL2IunLACIf7ih
	 zRayk2YzW7TWOLdvxZFWsjc1dqo7/xsL5CpJetOlsztpS/0vqOz+ee0IcW7QggIA44R/q
	 KaMMvKWvEPnYGjy8TLg2ISQo13X2Y9PRcHMdjG6bdIdjBrEvUUusXph7PUoVW7L9n1mvS
	 m3oQpkjcX3Z3ataP+SNSmvC/zOkQ3BK4wgPxnYqMffN9VQ9aGI4gMn2kxrDCifrypZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=p59+oRBqVD/OfRkrKGZMmpgQd6Fck6sy0XKFzDdr5i0=;
	b=TirAZpkR92SGNzyqWmoJgEEOK5bTwP5g3O5umzYTq011vTJaqkEIvKh5dwcTdYQpU4ZK
	 3hSHweRK1ldyTI4HxZJoIp1uRj/xWZQVRcx5kuRMo3nt3Nv/yRepJ8S2BRF4RQUCtKBVT
	 mvQZ+QkaiDmtsoScODBea+tHrE6vt4UrosrZCGuNupdX8mO/Cgtd1EibM3L7toVL/JVE/
	 kHH7IINLIub8vJS97EfNc443+qGqgBQmVMDKCYVeHdE4NHCltc26FW/+/xVRxwgpXdG3C
	 oNFipU28fYUT5AE5QomTWFEzf8elK06RBAbBwpC1XasjxCBrl6xryGWze/pyWgjszrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pl8FpfEj;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F013606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F013606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pl8FpfEj
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so1701266f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795101551; x=1795706351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p59+oRBqVD/OfRkrKGZMmpgQd6Fck6sy0XKFzDdr5i0=;
        b=Pl8FpfEjC14Hjrto9S7109Ok0Enk6KkMxBYg4wxv7gNy38p10dC1x0lXDdQQrvrmxf
         0hwGWGIY+nblvLNyicbvByMqa94IU8c5piBf5sZXZBTs41j9sbi2sllcivutcHRcoHXP
         k7Cn1QjhXBhHliUWj4qfgE0yXOjYinCRA1R8bp9jiq7wV+bWxIiwtMmKiBMl9TFqyp+I
         6iosKfsKGftKRnKwLet0Mc6BQJ9OAXcwqrXNpbFW8sz7Jr5poYwS+Jz8AUfxAk68+tOn
         P0O004MocKSbYkU6xxMmlLPLTUjxJ9Xf9a8crxe3ZZ7tkTxiMgIoG7cMIulGketN0UhN
         xQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101551; x=1795706351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p59+oRBqVD/OfRkrKGZMmpgQd6Fck6sy0XKFzDdr5i0=;
        b=QbJ19GEFbztvJ5JSE5VMCaV7MtnftDjMI2upN7NX21d1923y64Ptwo1uODF0qtIpE/
         UZcrl79dcI9vzOnEceoS+PW3o1YYIQtDtuXITtV7VnOAtSD19nhXXMOgxPID0+4tCc/k
         9uhmIjzPiRBtgMZGnhe/iphyuxxP7gmI/TPPNOYvQnGODJ6aTR27Ojm6edhcsyjaQGZu
         itMTTAbdW/A3eGZZ+MbIconN85zT73N5imKlLFV1mdbKPDK8b2BJDOQ2SsoREHCJbIFf
         v2XqYSSM5AZ46MWs6puqbUEyxHaz5Kd/S5awYEzUE7JwIVSVThU/YLPLd62BVZ3XTdmc
         4VKg==
X-Forwarded-Encrypted: i=1; AL+hErHT30DO5ZDbnJRNzzuXMyzkhPRWF6d1sNQJrtDoruhXSv7vGdOi8RU6fb+kJU7XrSLD8A7fJmh2JbKGHLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wbTRrWrYshNPLwFagbiZ4UxKKibl0JrWwPrva3P7/ofgeSHJK
	q453rddbkbRCg6Vsk06Nyyicss4uEiYJFu9UI1fhHehc+hhSCC4jUZhC
X-Gm-Gg: AZFdTZeCVkQFaohR34k+VUhjvHX2qfaej3Js+4RuWteC0hQekzYORMOxLLjtpxGfO4a
	eB+w50Izl7xwgemK3h2CBVeRtNuhOkGBDEi+gvimooaEd/JJw9nX+IvLz3Thw8micovI1P5t9cB
	VfEMVYQrguYYCjzmLm/HKp0C90Ptl+zpjqR/sjyw9aZytA5r0njOpGcLjTzyNEJw4qgxUdjPpyP
	3u3aA8c4nfh01oUGFnHEXh6uoDInAEMot5OtV6dyszq1P6gjyRgWHa1pJLRvsuwKjkotMWHIk3L
	kbq6VxQ5JBO8tBlF8QcnUWOyF+HGZNdu0k8x1JemYyiYBmyFMrzGbduUA88VLOTMYTDBmY82WpT
	eV7g3QLS7BF919ZsNL9K+acgdL5r8QDtSyVJf2vyWjE5floyQRcrnCBVS/AhZ64OAPwU5QVA/qu
	Zf/Fik5b4hoNvBUtKrKbpMR/Bx9VxDuX55XERMqA88VS7zg9jvFuZzBYACNGVXthm761WTyG6k2
	yN3MpPgRCcHZY66zMfoedX+1+3Z0ONE+5omHaGvY65s4FsjlGzz040XOYmfZlVrVV/kUlD1M/89
	IV/wKhn2SFZgzJRo
X-Received: by 2002:a05:6000:4a17:b0:4a9:760f:1824 with SMTP id ffacd0b85a97d-4a9760f28c8mr4476827f8f.21.1795101550635;
        Thu, 19 Nov 2026 07:19:10 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm128332f8f.30.2026.11.19.07.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:19:10 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 19 Nov 2026 16:19:08 +0100
To: Yifan Feng <evanfengff@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/fgraph: Fix the unwind hint at the end of
 return_to_handler()
Message-ID: <av8TbKv7I_3LEm1d@krava>
References: <20261118235023.14978-1-evanfengff@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118235023.14978-1-evanfengff@gmail.com>

On Wed, Nov 18, 2026 at 03:50:23PM -0800, Yifan Feng wrote:
> return_to_handler() reserves 8 bytes of stack for the return address
> and marks that with UNWIND_HINT_FUNC. The hint stays in effect after
> "addq $(FRAME_SIZE) + 8, %rsp" has dropped the slot again, so the ORC
> entry of the following call has CFA = sp+0:
> 
>   return_to_handler+0x41: sp+0	call .Ldo_rop
>   return_to_handler+0x46: (und)	int3
>   return_to_handler+0x47: sp+8	mov %rdi, (%rsp)
> 
> A stack trace taken from an interrupt which hits the call or the mov
> ends up at that entry, the stack pointer does not advance and the
> unwinder prints:
> 
>   WARNING: stack going in the wrong direction? at return_to_handler+0x46/0x50
> 
> The return address is only in %rdi at that point. Mark the code as
> UNWIND_HINT_UNDEFINED again, as it was before the hint was added, so
> that the unwinder stops there without the warning.
> 
> Fixes: 20a0bc10272f ("x86/fgraph,bpf: Fix stack ORC unwind from kprobe_multi return probe")
> Signed-off-by: Yifan Feng <evanfengff@gmail.com>

Reviewed-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka


> ---
> QEMU, function_graph + 20 kHz perf callchains: warning in 2s before, none in 10 min after.
> Found and written with the help of an AI coding assistant.
> 
>  arch/x86/kernel/ftrace_64.S | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/x86/kernel/ftrace_64.S b/arch/x86/kernel/ftrace_64.S
> index 4b20673a3395..8b488f99de02 100644
> --- a/arch/x86/kernel/ftrace_64.S
> +++ b/arch/x86/kernel/ftrace_64.S
> @@ -387,6 +387,8 @@ SYM_CODE_START(return_to_handler)
>  	movq RAX(%rsp), %rax
>  
>  	addq $(FRAME_SIZE) + 8, %rsp
> +	/* The return address is only in %rdi now, the unwinder cannot follow. */
> +	UNWIND_HINT_UNDEFINED
>  
>  	/*
>  	 * Jump back to the old return address. This cannot be JMP_NOSPEC rdi
> 
> base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
> -- 
> 2.39.3 (Apple Git-146)
> 
