Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486786;
	b=gJrJ+u9cq0g04FjjNry82KHKLivFs08cCMSyA5eprpJt/Ru7HSh2GEv0X5ircOWmuBXa
	 Bk9tHJ9yesAtTVG8Tin3Mo/ltt/HdHHZN8A3ESQJ6p50uxOmT9g9dwjrUMS1kfIbGVoY+
	 +sd+wLNGbZHWgv9PN4zklB6ZalpZyxTbyVHJxI5o210+sB6+hcG2zJzw7yQe3x1OV5vWM
	 FCXCE8Y4QhNbUF181zE5CILu83ozDUqHrivhQuk2pKj7YrYndTHc5CPXvUye+kfsrDOPb
	 6bdpgWrUxDoldxP+vo1exoqOYWDPHzghqgp2LwM4Jzvd0AuqYYtM397lqZcdMD79L7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:From:To:Cc:Subject:References:In-Reply-To;
	bh=vdBhioH55e2rBpiMMIlOy+uYTgZqubhBTCUnkYbH854=;
	b=H10OBMs9YCa9BzgCe3GQjKJW3YCRhufuta+cmw0oUQN9AW2ZX2WrSW1TL+36xuos6BTp
	 Mcci3wJLjAFuOl/j62Fj61o5/AAQ+VuiYPS+tXl9oECFJyICCMXggkjtKz0qTj9ncMKY/
	 n+HPbc0bxP3q+oSFhdsAiBcmczXFmuILGxp1QP386AQkqQ9oyUqkWyJAIpbL4TAVfzV+f
	 FgpaRD97O6KfelV4GVroF1UYAyaQcy/hZJ8MKs/MqISwjTDqWi2hIGo8jaoEXwYTGzbK9
	 Kf+y41kphz1NIf5kgEOD14oLyOQOCJdD4w5jLVWGgFoaCH66i5NV46WJKQMFIP7ZlSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=gXLmoeGp;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B37606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B37606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=gXLmoeGp
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-9213f004a14so49176936d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795486785; x=1796091585; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdBhioH55e2rBpiMMIlOy+uYTgZqubhBTCUnkYbH854=;
        b=gXLmoeGpp4YC4I6mCpHK2JTvgYkWuqbvABel0yKurKWRD86NbmnEpxOCsbDHXlGUfG
         90ysuBuVV3x0DumZtT9aZ/ZMYHhmBy129SlMJwiaN8mAMmz94b1JeI8fEf6sRhtwa81j
         Hs3DSUfs3f63rbs0OuWXTugp+WQHby0xxjMT3FkjK1iEI4yDhlE4ARTLT1uSz5UzDshf
         SV9ToAVyt3jXDngs7GhS5kJknl+DexPchuFfLV03z3rNdFKMSbp5yx7q/zNMseIEXVlO
         lON1hdivcYRYe4Eu6AJ54f6kYbiDY+fOh0nj0OVFyMKjghqT5tPUzbqrQfWKUaAl+Hjm
         3CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486785; x=1796091585;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdBhioH55e2rBpiMMIlOy+uYTgZqubhBTCUnkYbH854=;
        b=R4GVXZsgN0yUE/hCWtSZDXdbV42BZUEPw4CenB0+J+OPk2gZVtqlnuMnetOdMP4h25
         uoCFLPohCg+QfwequAX1CpgCQ0+4cKbhjf/n/uSNwLDdn04I28VvTIBPDZINPnpjcvRj
         t9VHPlJESOFWkOVLkyNHkvKDMjHnINU4Qd9p868eNE5SbvbsREZ0JYCZDDP+apNbhFYQ
         ZC44mx6lCysISZ18Bb/Ph3iU5yzM4RxhCA5I670fGqYllMjoj9yiP10nzlVJwh8a/+eW
         WOFCottT9OfnTYq8mEapLp7PNJKQXXzBActkc1lCF6yNe38m2SLVjEYJQRfIHQiG9n/M
         pHJw==
X-Forwarded-Encrypted: i=1; AL+hErHZIQ8oBan/E+T3zH3HhCMT2UpYfRT9g4zy8oEFELLBsW9nA5KipJlbj08BP96CW3wt0whkn1/41h4dWvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gueL8UA693W0lsMCdwr2zNvMxrRL7hU3og/Kgxd9t13rJEwrn
	pUFaG51uvGlYnO6PYLLJbLwbgueVrcm6vWzC2B0t7UmZuFsduSZHViTqZyEpY7XSyQAoEG+QBz4
	F9tGpbQ==
X-Gm-Gg: AZFdTZdH2Oa9ppkIOc9yycvp6Ex2tZzlBP3JUxyo5gO4yyf24cLV/TMZWXFEofbJ2l2
	dLfRu6YZEBU0sMGDfEwi3HBeWRrylyRvtpS0JGYLqEZ9fHH9VlBUrVMZwJGosFPKhc2MWKYEUSx
	Ol5aEFMil4E5XdiiUtvWM21l4EAGwsrJ59WW9CWg5GD9GMNG7hhM42N21WJZ64JqqzxyhSNlflf
	Xba3CeMNDhXYfyQjvq4jTawQPYaFdMhcBCVD3s4z5sdrESa5Nhl6ETa1Ph/EGx4a8kuf5qzecAh
	YJw0YlvZBw1EJhzO/SKfqW57InzODtE4v7HrFbUqZXL0JN41gk3dQWziP17+8Y5PUVP9nO2+mVV
	QMHPd3HThmFHDLbmyCeAR3V+70ePqQaDaEJp2OHU43VoUoAQpb54qDtNKwqI5V3vLhSNgGReXBt
	USR1//MD4sQQL3Kk1T9Ho+2Z+toSjzhsVFzfUIlyAfdqpPEjcpGx+SuVN3dccNMqI8rRkHNHmrn
	1y9cnPPEJZygfx+fuL6GcrEy/ryToRkDWS7z4u0w4dRrl7zKClYnNcsYZS+4p/Nz78/iHe5J9Dm
	dTX/z4vMb7hkpsexyIb98T3EsIfEdAHArkjsV49wNYznvJGvTycocxRgqcgauE2fZuCjwnIaSVn
	CoON2EFrdwDZYBmaeXzPYJr09PqQAHg==
X-Received: by 2002:a05:6214:194b:b0:921:1783:1696 with SMTP id 6a1803df08f44-92134a37126mr252343606d6.9.1795486784823;
        Mon, 23 Nov 2026 18:19:44 -0800 (PST)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213479655asm122232776d6.4.2026.11.23.18.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:19:44 -0800 (PST)
Date: Mon, 23 Nov 2026 21:19:43 -0500
Message-ID: <04e583c2e9045e6a8990d752a1a2d1eb@paul-moore.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20261123_1724/pstg-lib:20261123_1443/pstg-pwork:20261123_1724
From: Paul Moore <paul@paul-moore.com>
To: Arina Kharlamova <arina.kharlamova@mbzuai.ac.ae>, Stephen Smalley <stephen.smalley.work@gmail.com>, =?utf-8?q?Ondrej_Mosn=C3=A1=C4=8Dek?= <omosnacek@gmail.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: selinux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, stable@vger.kernel.org, Arina Kharlamova <arina.kharlamova@mbzuai.ac.ae>
Subject: Re: [PATCH] selinux: reject a 65535-byte xfrm context that ctx_len  cannot hold
References: <20261124-dev-v1-1-00b99ee684ec@mbzuai.ac.ae>
In-Reply-To: <20261124-dev-v1-1-00b99ee684ec@mbzuai.ac.ae>

On Nov 23, 2026 Arina Kharlamova <arina.kharlamova@mbzuai.ac.ae> wrote:
> 
> Commit 86c8db86af43 ("selinux: fix selinux_xfrm_alloc_user() to set
> correct ctx_len") made ctx_len count the terminating NUL. ctx_len is a
> __u16 and selinux_xfrm_alloc_user() only rejects str_len >= PAGE_SIZE.
> With 64K pages, str_len = 65535 passes, and ctx_len = str_len + 1 wraps
> to 0 (kmalloc_flex() stores the same truncated value first).
> 
> ctx_str[] is __counted_by(ctx_len), so the following memcpy() of
> str_len bytes is checked against a buffer of size 0. With
> CONFIG_FORTIFY_SOURCE this ends in __fortify_panic():
> 
>   memcpy: detected buffer overflow: 65535 byte write of buffer size 0
>   kernel BUG at lib/string_helpers.c:1044!
>   ...
>    selinux_xfrm_state_alloc+0x18/0x24
>    security_xfrm_state_alloc+0x3c/0x6c
> 
> The memory written stays inside the allocation (65536 bytes for the
> string); without FORTIFY_SOURCE the context is stored with ctx_len 0.
> 
> A user context of 65535 bytes can reach this hook through PF_KEY
> (af_key.c only limits sadb_x_ctx_len to PAGE_SIZE); the xfrm netlink
> path cannot, because there uctx->len (a __u16) includes the header.
> 
> Reject a str_len that does not leave room for the NUL in ctx_len.
> 
> Found while surveying callers of kmalloc_flex() whose __counted_by()
> counter is narrower than the count, with the help of an AI coding
> assistant (Claude); I reviewed the analysis and the fix. Tested on
> v7.4-rc2, arm64 with ARM64_64K_PAGES, FORTIFY_SOURCE and SELinux, under
> QEMU (GCC 15.2.0), with a KUnit case that passes a 65535-byte context to
> security_xfrm_state_alloc(): the unpatched kernel hits the BUG above,
> the patched one returns -ENOMEM. The PF_KEY path itself was not
> exercised.
> 
> Fixes: 86c8db86af43 ("selinux: fix selinux_xfrm_alloc_user() to set correct ctx_len")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arina Kharlamova <arina.kharlamova@mbzuai.ac.ae>
> ---
>  security/selinux/xfrm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, merged into selinux/stable-7.4.

--
paul-moore.com
