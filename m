Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654102;
	b=rso8amgKRz8E3IP5rahFwWXuP5tGNa3ZsHZGwxIdXy8hTF+yDYwEqcxUdIfWbAsFQmY+
	 BjlXmpyIK0UTlupjzvIfGQ9jeXj/R0Gilel6uuPsxt3BDllwnRi2fy7a2gob1knijGMHD
	 r15Eq9/yzJab2soJ5l0Spr9xiuXQQKXOEk1+Ivi/n/+oUkpdTQCJaN5uvN6z2KJslfwn1
	 es/+X9+1cgzF0zadS2ji1HbAWeJCMcxzFdL/4HGxlR3/jTjtzJx5BMilpuV74N397d0jq
	 IqJPur1C3hpHootCS0btezKz1y+HYUDI6gkktwDi3qZrdJCKiCFHiFr6bzijDfzjvkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
	b=pW0hp6tx/oBiMYW/xB1BKWL4a3UAdPfqrjQ6xgQqoaEIkVOcy8SBImRB1iDjiJkEJtq9
	 VvNKfhNz50HQRJw9ogLyiKFNe7lG9eXCIHLsNJwnX7yy153D3cT8N+CY8bUyc/kq64BBE
	 tDUaa5lDBBBWo7M0r7V9IkVy+7ku8pTmkSYqkkL6v8KroigacndK9fy7d9MTmHZJqH3xW
	 9xFclSLytPzgzSsPKiPpv6SbrUKSkVz2CwZf3I3JUIa4GpgkIEglyxoI0q3t+XxJ8G+UY
	 jCpuyPjd2QZrX3b6UPH2SMw2J0+LEYPSA0rHGcPXNV48/rUL8zoZahIlDPkcWAwLLUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QWMZ80Cz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CAA606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53CAA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QWMZ80Cz
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so1075211766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:48:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795654101; cv=none;
        d=google.com; s=arc-20260327;
        b=XHMOrIyUZnF2Pir/u9m7P9T37ww+0aVOHACSYQPJunoqB1L8qjKkMm2Fkzv+CqrUgB
         jVsCTvI1LoftGT+LoI5xcT9v426aVefWX3DNnl2Im1m2/cds580e4G8WAlAhFjhmQc+y
         Qz5VU0CWzruEfUIV1Y4IlPeT8qM8FET3+599ujJ2rLK7S0jUlHTp77+lxjW4O+HQQXNh
         eBXctVozsMlKyT5dY46cQRtgpU9w85v/zWgxEgNBzwhSV6oCEm1YszNCA8DnmWLDmE/A
         C8F1SV0SeKLjqK7k4TlIyzCm1vNRNOY3EykdTm6t7YPog0IXCBIFIEoiQ57phoSSDPQs
         KWeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
        fh=bg2peaBT/ks3QZXv7gx33O8WE9gx8HhX2DUCl+Pm/P4=;
        b=TuVNx97LaKhCPCBj31B1r6bliqtAc45kHh1NJmBzyL83kup/7/tIXEAK7Uwni9QFWD
         0T5IrtDAX90xFd+j+aRPeLbdiANTh5875TJCNV3d561vxwCmFAlOrKL58ECG4GqqTupy
         MNk52EwnyVyXbNxGcAroP2ryuQedkH5dcfPFhQQN+AHMHaG7hbTZGPMumNujfeq6cxJC
         IMrzwEMHk7UDf6QYwa6UmzUJ3UU1K60Xy/G7VsnOvcNjkdtE8XMXUA9k6iWPGOT1/45T
         P3Ew3lU/qq8d0jAEwkUFHMSL9SttqH+T7LCBTPmcnKRytwyBeV0FQ2iKqUd+Vp97Ss73
         EHbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795654101; x=1796258901; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
        b=QWMZ80CzZfH6yoH4sucNVvHTrwf1PIcC+Bp2zpQDOXhvTaLR5/Hb6aclEYP0GJ5EbO
         tJUXzbHm5a1lhC/Ax05U+ZOxJaUnTui2Rk4msdPfixijvZGIv/STMD8sdmvdk0JLoPML
         TqbI7e+F27OvNQ1L2QOdn33Qfg3eLkeqAwD6ryOf7vQH0q2dc2f1o0EKha9CE2cwglDJ
         7Sd/maZlmbFd2u6vfPe4Bc4+mGU0kS7nC1KhuBzJ0BY73ENkc4VuiMfat2qIpNB6JRsB
         QZjOMEBbuY0eBgGxKWFhpFa0ZVGml7Ayw5gVKKOPjRvn3VcvJm969BGQaiZe0I0XPK79
         1ZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654101; x=1796258901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
        b=QMiv/HGQmfS7MBgbebs1AL5quScDuB51iuy1qMW3IQxpZzyqAC/9DW1blepJdzy4em
         cqbJ/FFFE8M5Zh+99vzPEOG/uc0xl+qomrV+52f1/18veRDtKocxxNEqBYhWXpULmNKY
         jpua/12Hsn23/ZoHUiyi0MV3at0tnl6+xdZ5px0Edoslp8tiaC20yVv8lh9QWA4ZQB0k
         b6IY8pAOGGwoz0Vi7ZEGdgTWQda8B1ikzxNkKEGQE7/ves3Q3D61cpsEHzZERpFjc1jk
         F16DlS6b1oz1dp/v4Dp0iK+2FN/hPdTSOAisD5Ggf748FQ1E/BbyML5VGTM/2UqWlw1Q
         lPPw==
X-Forwarded-Encrypted: i=1; AL+hErHNCDGxm33lxWtSfzyQ8k0K6ElWCntddjb0Si0EML5SAgjp5XunRsadl9S5uMiulP+OJ09fWs/90Hhw/6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gN1tW83Z8KvlcRFONQkgGiG80nwgTWAnIozYOpkqla//qPSWP
	Xufww+GAiJsNfwpsZ7FZerTV3xLC4x+OtkDNVDi8DB8PQobY/Rj2hgWoYfCwUemcsY5q4M/JEnM
	hUJVBfQ78ivFU9S6KL5NAxAmxwzFI5E22zz/8JUVm
X-Gm-Gg: AZFdTZdrMeoOQucPsYGY20Mef9BMu1MKowvNRwHRjXkHgj3L9hVqe3VsIo/LQytbwDR
	rmhfE3Gf+HLwvsduXxLV7qPr6QmI8ve1JTMUEMB4EFhVBQMQ58uyUZR0e8iv5KGNt9DLrncMeSM
	pdhWC7M5ptwvLGqNq1z0yXE+axITABJXGyxmFJWAUmeC18rXl4e0vZ023msypriM571E/p7dmBB
	9z6N/mb1K3VpPCTjBsIMdTdk+/XN0Mwhs54hvST3aK0HHSOS7fadZslKq1mgx/1AyN1PVq47vKe
	VVP/OzK3YmncJz8kEctBdb+0BF8Xb8NrmpPzrKAI4sXAMCGUPGplImT+BSS2HGjwkpHi4lZrmOY
	RZmEmz+PUbypGF/sn9jOrfOeeJgdbbE85F8XzyrPp1TeTO0F+pJqrjL1XNSTUy8S/tVI=
X-Received: by 2002:a05:6402:1d4f:b0:6b7:f106:3419 with SMTP id
 4fb4d7f45d1cf-6ba37ed40e7mr16523342a12.43.1795654100281; Wed, 25 Nov 2026
 16:48:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-14-wusamuel@google.com> <CAEf4BzYLqCCwxSAfuzB-wZiae_tgf0yxAVsFc_wzfRAdeqjDtw@mail.gmail.com>
In-Reply-To: <CAEf4BzYLqCCwxSAfuzB-wZiae_tgf0yxAVsFc_wzfRAdeqjDtw@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:48:08 -0800
X-Gm-Features: Aa3M54pWdHazBU-AqLK5TiYQKtZxCNreXkIezAAKXNEVmmWGCBCO_8U3jzAUf4c
Message-ID: <CAG2Kctp-XoiK-Ej3eHWnYyijydej6Bw5sLKNNi-S+xEGDB+mGQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[...]

> > +/*
> > + * Find a symbol by exact name, or by prefix with KALLSYMS_QUERY_NAME_PREFIX,
> > + * in the entries of /proc/kallsyms, except undefined module symbols. vmlinux
> > + * matches come first. A module_filter of "vmlinux" selects the core kernel.
> > + *
> > + * Each call returns one match and sets pos to its position, even on
> > + * -ENAMETOOLONG. Start with pos 0 and use pos + 1 for the next match, until
> > + * -ENOENT. Use pos only with the same query. Matches can be skipped or
> > + * repeated if symbols change between calls.
> > + */
> > +struct kallsyms_query_by_name {
> > +       __u64 size;             /* in - sizeof(struct kallsyms_query_by_name) */
> > +       __u64 query_flags;      /* in - enum kallsyms_query_flags */
> > +       __u64 query_name;       /* in - user ptr to name or prefix */
> > +       __u64 module_filter;    /* in - user ptr to loaded module name, or 0 */
>
> similar to the comment on the previous patch, how does the user
> express that it only wants to search vmlinux image and not consult
> module?
>
> and naming nit: query_module to be consistent with "query_name"?

Passing "vmlinux" selects only the core kernel (noted in the block
comment above, missing inline). Will rename to query_module and note
"vmlinux" inline.

>
> > +       __u64 pos;              /* in/out - start position / match position */
> > +       __u64 sym;              /* in - user ptr to struct kallsyms_query_sym */
> > +       __u64 sym_struct_size;  /* in - sizeof(struct kallsyms_query_sym) */
>
> I'd name it "sym_size" for consistency with "sym" naming, and the
> comment/doc here is unambiguous about what that is (struct size, not
> the symbol's recorded size). seems fine as far as UX goes
>
Ack, will switch to sym_len
>
> other than nits, this API looks great
>
> [...]
>
> > +/* On -ENAMETOOLONG, *ksym is still copied, to return the required sizes. */
> > +static int kallsyms_copy_sym_to_user(u64 usym, u64 usym_size,
> > +                                    struct kallsyms_query_sym *ksym,
> > +                                    const struct kallsyms_sym_match *m)
> > +{
> > +       size_t copy_sz = min_t(size_t, usym_size, sizeof(*ksym));
> > +       bool too_long = false;
> > +       int err;
> > +
> > +       ksym->sym_addr = m->addr;
> > +       ksym->sym_size = m->size;
> > +       err = kallsyms_copy_str_to_user(ksym->sym_name, &ksym->sym_name_len,
> > +                                       m->name);
> > +       if (err == -EFAULT)
> > +               return -EFAULT;
> > +       too_long |= (err == -ENAMETOOLONG);
>
> nit: if (err == -ENAMETOOLONG) too_long = true; is just as short
>
> but also you are eating any other error, maybe write it so that
> original err is preserved as is, not special-casing ENAMETOOLONG? if
> you get EFAULT later, original error still takes precedence

Sounds good- I'll simplify this to preserve the first error via
something like `ret = ret ?: err` without any special handling for
ENAMETOOLONG.

[...]
