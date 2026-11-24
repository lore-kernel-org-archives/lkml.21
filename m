Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545321;
	b=2x0Brw5dSJjz7qP/qutyeqYqaBMAhiqaDFckZq07bua1sJmMK7+exCrw5N4yI8/Ejbjt
	 sEPKcJGt3L+QQ3HsSDvFwBO1M8L0zLu6B9Eij5sE3lnvXT3uPQ6UuYCoF+gfcWpNTJinR
	 oct1/Pa4rHNMC5f/s3yq1/lcNpcKnFQIpUBXIiXXhZrYZtQyN3tyx8302Ce3L52vwtd9Y
	 KnlbnBjajeKu7qm8d5VRMLXAJUMWUXyz6W1OafRf2HrrtGe2+ClXSAEvGWdX+KqiQqXJy
	 w8WmVgg9JbgrIZAaiJ3cSsW/fG1G+s2XIXd0Mda2jhA4w75ji0TRxPzT5Bxw9CkDEyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545321;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZD9tL3vMl3UtRiIJdtxpjqUODfVXA7ba8Z8pqs7VXsE=;
	b=C5OtKXWPSU1VQVGun0zVfih4mbE9Ei3vWknMGKp+weT5nQpz+8AXZcVPFN05Vl8Nxhr1
	 xJDOOsPtD3Gdx+AhI0SfaA54KsEkk6gLWFk/U7u83Stgd2i14VAZgfAyP5qWc5qKxu3nu
	 tauMgx+sfdq6jVTc7V0Mdf7fjiv+2eZ5aC+OJOH6eTuoKDx5gmbiCnG1xM6ei692SdMIq
	 QDmIO5hK8mCra2OOdFmJItZIh8jUlSlPd5ZUpCBCGx3fvIb+Y89CsErG2rUtTx0zcyF7N
	 6OCqfjFSvoXmLlyTEWru0mUNkyhdRyyM05vvZcK8UkrzzWjVpwdAe9UoosaQmZZmQdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iRZErLHu;
	arc=none smtp.remote-ip=91.218.175.57
Received: from mta0.migadu.com (out-57.mta0.migadu.com [91.218.175.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA426606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA426606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iRZErLHu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GRQQ4ERdsiUnnr2qKIeSLtPr4xietU4WPx/E9/lU1Gg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795545318; v=1; x=1796150118;
 b=iRZErLHuh+Qaf95aB7zVlWe/oB17nxtoFCaUB+VRlj5hXd+bC+U/urdQ29qIDR+nWM/wLp5S
 Odp8XhJuLDLgLQH7PTg8v6tYPZYHOlv+tak2DZjNBkOku6xuEH9r5Rq4x8TDLj6nWAXjjiZf/nG
 e9k9BmZ0+dkLanOKiffBYsYM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 695234c76aa59047;
	Tue, 24 Nov 2026 18:35:18 +0000
X-Mizu-Trace-ID: 695234c76aa59047
X-Migadu-Flow: FLOW_OUT
Message-ID: <59a0bc6a-61d2-462c-92c5-445d29298d85@linux.dev>
Date: Tue, 24 Nov 2026 10:35:08 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] percpu: do not put btf_type_tag on per-cpu variable
 declarations
To: dennis@kernel.org, tj@kernel.org, cl@gentwo.org
Cc: chris@chrisdown.name, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org,
 daniel@iogearbox.net, acme@kernel.org, yonghong.song@linux.dev,
 eddyz87@gmail.com, martin.lau@linux.dev, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 llvm@lists.linux.dev
References: <20261117220824.609017-1-vineet.gupta@linux.dev>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20261117220824.609017-1-vineet.gupta@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 2:08 PM, Vineet Gupta wrote:
> __percpu carries BTF_TYPE_TAG(percpu), which records that a pointer
> points to per-cpu memory. __PCPU_ATTRS() applies __percpu to the per-cpu
> variable itself, so DECLARE_PER_CPU() and DEFINE_PER_CPU() put the tag in
> declaration specifier position on the variable's own type.
>
> arch/x86/include/asm/processor.h has
>
> 	DECLARE_PER_CPU_READ_MOSTLY(struct cpuinfo_x86, cpu_info);
>
> which an x86 defconfig preprocesses to
>
> 	extern __seg_gs __attribute__((btf_type_tag("percpu")))
> 	__attribute__((section(".data..percpu" "..read_mostly")))
> 	__typeof__(struct cpuinfo_x86) cpu_info;
>
> and GCC warns:
>
> 	processor.h:232:36: warning: ignoring attributes applied to
> 	'struct cpuinfo_x86' after definition [-Wattributes]
>
> which -Werror turns into a build failure.
>
> The compiler is right to object to a type tag on the aggregate, and the
> issue is fundamental: every variant of an aggregate shares one DIE, so
> there is nowhere to put it. clang drops it silently and GCC warns.
>
> The tag is meant to record that a pointer points to per-cpu memory, and
> cpu_info is not a pointer.
>
> And this gets worse: for a pointer-typed per-cpu variable GCC attaches
> the tag to the pointee, so
>
> 	static DEFINE_PER_CPU(struct bpf_hrtimer *, hrtimer_running);
>
> comes out as PTR -> TYPE_TAG 'percpu' -> struct bpf_hrtimer. The truth
> is the other way round: hrtimer_running lives in per-cpu memory and
> points at ordinary memory, while that record says it is an ordinary
> pointer to per-cpu memory. clang emits no tag there at all.
>
> Add __percpu_var, which skips the btf tag (__percpu under sparse) and
> use it in __PCPU_ATTRS(). The cpu_info declaration above becomes
>
> 	extern __seg_gs
> 	__attribute__((section(".data..percpu" "..read_mostly")))
> 	__typeof__(struct cpuinfo_x86) cpu_info;
>
> The pointer spelling, T __percpu *p, is unchanged and keeps its tag.
>
> Before this patch the tag also qualified the variable's type, so &var
> had type "T __percpu *", and a pointer does have a DIE of its own:
> pahole emitted PTR -> TYPE_TAG 'percpu' -> T for each one.
> this_cpu_ptr(&var) is that shape, and that is where the records came
> from.
>
> Those are the records an x86 defconfig built with clang loses: 280 BTF
> types, 140 TYPE_TAG and the 140 pointers carrying them, with .BTF
> shrinking by 3360 bytes. They are the derived pointers -- clang never
> recorded the declarations themselves. None of them were reachable: a
> record points at a type only if something is declared with it, and
> nothing is declared with these. The 803 places that do declare a
> "T __percpu *" keep theirs -- the 110 tagged pointers that something
> references are the same before and after. .text is byte-identical.
>
> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Tested-by: Chris Down <chris@chrisdown.name>

If this patch is OK can someone pick this up please. I'm not sure what 
subsys?

Thx,
-Vineet


> ---
> Changes in v2:
>   - Dropped the "message is confusing" sentence: GCC's "after definition"
>     refers to the definition of struct cpuinfo_x86, not to the declaration
>     of cpu_info, so the message is accurate (Chris Down).
>   - Dropped 2/2, "local_lock: do not put btf_type_tag on the lock guard
>     type". Only the tag on the typedef generates a warning, and that
>     needs a GCC fix [1] anyway. The pointer usage "T __percpu *" is fine
>     (Chris Down).
>   - Rebased onto v7.4-rc2.
>
> RFC: https://lore.kernel.org/r/20261110012235.1024461-1-vineet.gupta@linux.dev/
>
> [1] https://inbox.sourceware.org/gcc-patches/20261112191815.884167-1-vineet.gupta@linux.dev/
>
>   include/linux/compiler_types.h | 8 ++++++++
>   include/linux/percpu-defs.h    | 2 +-
>   2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index c5921f139007..b250d6870324 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -50,6 +50,7 @@
>   # define __user		__attribute__((noderef, address_space(__user)))
>   # define __iomem	__attribute__((noderef, address_space(__iomem)))
>   # define __percpu	__attribute__((noderef, address_space(__percpu)))
> +# define __percpu_var	__percpu
>   # define __rcu		__attribute__((noderef, address_space(__rcu)))
>   static inline void __chk_user_ptr(const volatile void __user *ptr) { }
>   static inline void __chk_io_ptr(const volatile void __iomem *ptr) { }
> @@ -68,7 +69,14 @@ static inline void __chk_io_ptr(const volatile void __iomem *ptr) { }
>   #  define __user	BTF_TYPE_TAG(user)
>   # endif
>   # define __iomem
> +/*
> + * btf_type_tag records "points to per-cpu memory", so it belongs on the
> + * pointer spelling only. Declaring the per-cpu variable itself puts the tag
> + * in declaration specifier position, where clang drops it and GCC attaches it
> + * to the wrong type, so __percpu_var leaves it out.
> + */
>   # define __percpu	__percpu_qual BTF_TYPE_TAG(percpu)
> +# define __percpu_var	__percpu_qual
>   # define __rcu		BTF_TYPE_TAG(rcu)
>   
>   # define __chk_user_ptr(x)	(void)0
> diff --git a/include/linux/percpu-defs.h b/include/linux/percpu-defs.h
> index dbe3267a0a13..f53fc430aaad 100644
> --- a/include/linux/percpu-defs.h
> +++ b/include/linux/percpu-defs.h
> @@ -45,7 +45,7 @@
>    * that section.
>    */
>   #define __PCPU_ATTRS(sec)						\
> -	__percpu __attribute__((section(PER_CPU_BASE_SECTION sec)))	\
> +	__percpu_var __attribute__((section(PER_CPU_BASE_SECTION sec)))	\
>   	PER_CPU_ATTRIBUTES
>   
>   #define __PCPU_DUMMY_ATTRS						\

