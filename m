Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037846;
	b=lX75spA6seHLWxDgj30e79JU4b2TqARCPZiji0cz+niWYJcx6LP+W/P6Qtn7L0CyQyYo
	 Uwt//r1PWewY/gayJtXmQZZis58Reb3e4577jr/w0c1bIhDJXNrSfcXDMo89gNepa5UdN
	 /CG0KmwqNPS4XJWMBmekL+KVyBnFJKesdlYH9XqJkTVWBp48IV9fYCC2syn4eZwJHFK5E
	 OX8Z65ivJ/Qou+yw/Hrt/LtaLduxDnG9Ef4OWLc+CIydj4ha8dzOpY9m31Hoxbcn1eQmK
	 8Zm3iZX/ettFTde26inUt6n/PeRyMfVcu//11U601Xu0CT4OFMoCdzjawUE6w2NiOlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037846;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sjUB08oz3FeVpN/HDPa4HHY9IfRB4b/+glhwpbFwjMg=;
	b=krFufyTgyt4TdeWzDzkEOWRpESR+oBFNI+Uh5+KYOBx2Lx2JHhOtJs0uzvNu/lOXBMkJ
	 1tM52M/7bGmR0g8tmYxMHP/ysdi3+G7L8j1jcnwu3kcNRH3gBI4b1jKv8PG91qZ7MpuGl
	 xl+y0DkUl8f/nUoTVhoj/JOldf7bG1J9DK6La9EJnAtkYTd0ikbpbrYsfZfUcmZ0R8qQ/
	 XU1pYY7uLCYhT56vfBM42gl2186yWRNxca6yCDBsJcnKWxxJqmXTzxVt82fSbvxkfs9ca
	 2SpSwmGa2GchDE/7QoQYJ8UF2TsyqwMbCSCOXmldiNjjt4U45iXKvxh6Fw7gaEvdymw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F19YdPyI;
	arc=none smtp.remote-ip=91.218.175.135
Received: from mta0.migadu.com (out-135.mta0.migadu.com [91.218.175.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0379E606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0379E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F19YdPyI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=u7k8Mlc6Fymhtj+FfIGlaOLuMxhse5NF2Wwfz/aIR2I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795037844; v=1; x=1795642644;
 b=F19YdPyIE+1qxZagD4FO+d2TukDaLriVWQqI4YW6kYpDsN/E8NJE3hZgHwGtkppX3zx/s0Gf
 74/ahag/47nZlTqHcJxH54Kj0s6oTpJeMt3Irkmg9OgbSMsyvFyhM/InjHbYImV06bfh7IE1tiA
 NmXSVbs47mePU0pUbDgzXLCE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4af51873c45a5690;
	Wed, 18 Nov 2026 21:37:23 +0000
X-Mizu-Trace-ID: 4af51873c45a5690
X-Migadu-Flow: FLOW_OUT
Message-ID: <6a1b6f05-448e-461c-bd79-0acd67fb7edc@linux.dev>
Date: Wed, 18 Nov 2026 14:37:19 -0700
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
Subject: Re: [PATCH bpf-next v1 0/4] libbpf: Support kernel-side kfunc flavors
To: Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov
 <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>,
 Emil Tsalapatis <emil@etsalapatis.com>, Jiri Olsa <jolsa@kernel.org>,
 Song Liu <song@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, sched-ext@lists.linux.dev
References: <20261117192153.3384031-1-ihor.solodrai@linux.dev>
 <df72a9ab1ebcebff573485a808e45cd493665e75.camel@gmail.com>
Content-Language: en-US
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <df72a9ab1ebcebff573485a808e45cd493665e75.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-11-18 2:12 p.m., Eduard Zingerman wrote:
> On Tue, 2026-11-17 at 12:21 -0700, Ihor Solodrai wrote:
>> An incompatible change to a kfunc's prototype, such as an added
>> parameter, breaks BPF programs built against the old one. libbpf
>> ignores the ___<flavor> suffix of a kfunc declared in a BPF program,
>> but makes an exact name look up on the kernel side, so the kernel
>> can't keep the old prototype available under the kfunc's name.
>>
>> sched_ext ran into this. cded46d97159 ("sched_ext: Make
>> scx_bpf_dsq_insert*() return bool") kept the old prototype as
>> scx_bpf_dsq_insert___compat, expecting libbpf to bind old binaries to
>> it, and broke them. 2dbbdeda77a6 ("sched_ext: Fix scx_bpf_dsq_insert()
>> backward binary compatibility") reversed the naming. A ___v2 kfunc
>> declared as vmlinux.h spells it doesn't bind: 56bbc91219c0
>> ("sched_ext: Fix scx_bpf_dsq_move_to_local___v2 compat detection")
>> fixed a compat macro that silently dropped enq_flags because of this.
> 
> Please prefer examples to prose in cover letters.

The sched_ext story above narrates the commit history to illustrate
the motivation for the feature.  Would you like to see code samples
from there, or are you suggesting to drop the paragraph?

The documentation patch includes code examples of the new binding
rules, I didn't want to duplicate that in the cover.

> Also, please de-Claude the included prose.

Please be more specific. Which "included prose"?

> 
>> With this series, if the kernel's bpf_foo kfunc is missing or its
>> prototype is incompatible with the declaration, libbpf binds the
>> bpf_foo___<flavor> that has a compatible prototype. So a changed kfunc
>> can keep its name, and the old prototype stays available as foo___v1.
>>
>> resolve_btfids fails the build if two of bpf_foo and its flavors have
>> compatible prototypes, unless both have foo's exact prototype
>> (aliases), so the fallback finds at most one match.  This ensures at
> 
> Why is an exception for kfuncs with identical prototypes necessary?

For example, when the void scx_bpf_dsq_insert() is deprecated, the
kernel side can do this:

   Today:       void scx_bpf_dsq_insert(...)
                bool scx_bpf_dsq_insert___v2(...)

   Later:       bool scx_bpf_dsq_insert(...)
                bool scx_bpf_dsq_insert___v2(...)  /* calls 
scx_bpf_dsq_insert() */

Existing schedulers declare scx_bpf_dsq_insert___v2___compat.

libbpf strips the last suffix, so the bpf progs still call
scx_bpf_dsq_insert___v2(). The wrapper keeps them working during the
transition, including with older libbpf.

The exception allows to do this.
Otherwise we break the ___v2___compat trick.

> 
>> kernel / module build time that no ambigous kfunc flavors exist.
>> Documentation/bpf/kfuncs.rst describes the rules.
>>
>> Compatibility is determined by bpf_core_types_are_compat(), the check
>> libbpf already applies to kfuncs. Of the 70 same-name kfunc prototype
>> changes between v6.6 and bpf-next, it finds 8 incompatible (arity,
>> return kind, callback prototype). The other 62 (const, typedefs,
>> parameter names, integer widths, pointee struct names, annotation
>> suffixes) were made in place without breaking old callers.
> 
> Do you mean that without this series programs referring old prototypes
> are broken?

Yes, if the kernel changed the prototype in place and the BPF program
still expects the old one. For example, 8fe4dc4f6456 ("bpf: change
prototype of bpf_session_{cookie,is_return}") added a ctx argument to
bpf_session_is_return() in v7.0. libbpf can't resolve an object's old
no-argument declaration on that kernel.

This series alone doesn't fix this, but with it the kernel *can*
provide bpf_session_is_return___v1(void) for the old callers.

> 
> ...

