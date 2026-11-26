Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654191;
	b=FmLIEvKej3R9hikQNgFoRzeivsS8zOaIUPepA/IHL0oR9xPgk6oeQAGLpMtu1p3Bd8wF
	 tHuKNs2M84CLYl/vdgf7BhSryl/xCMwpEVEchb36Vc9bkfED506hvaOszs/q4itmkXimH
	 KdmKbIuBKg851Wc3IPsKxaObKh7Dnxls3uTsoulRCVqf3u4IoJ8AhO0kREAzAY3y9t0CT
	 j7elcFpw71LAEbAccfO2QIzpZC/c/C+3vYNqU1sDBgPA1821lb20FP5ft35msIAFUtzwV
	 ddW7zdGrlmJovHTFmIlwFBDmZrFA1XE8zHbswnpSXzSqoAmtEOvjbB5nfaudtKVSTdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
	b=YEj2LsIu9uDTAwQpopASxe2ze3+ntkoUYUWi7tk4dTgAw2fStASg1HRGz1+9voONS2pg
	 94bZcOTQ1nPOc47OzEcnFPPyhizKNxvimtS1vAxmebqm3OO9k+3XXLQ/Ulf1+zcfng7HV
	 uTxT7fUOdQ0RbZrDc1vRQ7/qHLD43y0WezA/gxrgRgG4GNx0KPRPez9Y42JxHKAUVxpD+
	 O662y4zDrtm84hm4id3jR+poqWAD9GYg4xTxNVr/hvw/6AcYJ8KS7qLK1Ra5Lbpe5SKgp
	 Rld6RefYXWU54QlUNxMSbyTmVSi4UsAUdV7NjPYmoKMmaz/Mai+zenjw6aSmJyVfxpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TD3ha0rn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6F7606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A6F7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TD3ha0rn
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50e26763a4so105431166b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795654190; cv=none;
        d=google.com; s=arc-20260327;
        b=GeAap7MTtBvc0ydR2QEbTZq8sxQybYDfQaL9JqNrlO1fORp013YYqFulBE6jMJVZtH
         Dlat59aH9yEXQNAxqL9wTfsD5vTJwrY5iVNRpx103fYD/HKuPVIpMiSHp2QKMMvvveNf
         q9qss7TB/2ik9OlzJqNqixKSbyMN5YGPhHyq/klpCBZoCrD8GjcOLAO9uQ32IMWrMNIU
         WIfSTFEa5uhBwiXLji9abbabzzyA3OFDbGyENNq3OLe3AQ8rXCwR8fQBlI5h3jLXRt1z
         Wm9wosYcHKNfCecZWXETRoCyw/1t4JU0jR90REIM2W6KWoj1JqsLlmuU3CSsFu1I+mfm
         ifMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
        fh=0oBg5V+PzrSpiW3McXsIsD8OXnYEJbUkiEBeLV6zajw=;
        b=d6NVfU96eJlap1Sb2vrJ7fgDRUYCWbkRtZCP6WV7zkOKvhh1mcVoMgEnFCrocd9K9V
         9TlpmzEphmmnivvaETSvCtBBXi89bVQQl0LEyjOXSMeqpOuG6ui3rYghyrI6r0ZCIxjE
         R+cMlq9ILvBXdW1uwkd6i/r0UOs8DMCL5z48HcmXUOJwcZ6HkjR3UC0GMQ3l4Mq5gVn6
         WsXGlYIIjXCGrocya/L1mcSsPu0ET6DlL8Ek3VpWiOIB3cYL6mmykSGdhqMass/mTpC1
         cq+dVwzgqVbe9Byr2fxtlkbkM6OcA3T2Shad+gYKieQ4LIs/Ns7UjlA/7AiBoz6jsyqg
         d/UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795654190; x=1796258990; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
        b=TD3ha0rnSCMzB6EDdCanCIo2aztnTVsAWrsh8HrG5Y/aRrFlN2ndLBXw880f1YHLZ/
         QSfxPbJeIna1/g4lWyiIQwpwJD12i4G3TGAPhErD+7VvOdvbXoNFUGW/sZDUdcKc+k/U
         fLW/extCpKtDduL/D3vHzyoVyDpb/98nn+tR+abZco9jsGFWEFngZqgt6TnMkhRshp4B
         KnHYS7XEZFGjKsHdNaQA1fEyq68/xePBost3IMRVEVegEsUL5tFkIeCHeASNeG2SkZb3
         JP9uGCT2U7VP0g68JLBP9wLuAWo5qxzvzbWaRKXYpp5AAo+d01ZiPGTRjL3TT/PoWk+S
         RpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654190; x=1796258990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
        b=ZKwIioXjU2/67XHVQxlMpNsBSJ9NMfcO8WGXJJkCpGHOWcOMJeFe83/eVkHK4QRKls
         R9aNPtwVdxCwWzfQOJ3fP5JIA5oSdH/Ba3etCCYrsliTx65PAx8Taf7ETmcUDsDVOfch
         Tb9N7UsZf4CZxWyKl+ML+4GeqOSkzsYzv8DC+tE4/k+vyoKmkkucBVq+JnwXf5igv407
         Y3058DUknJWcaoRQ4QrUUQejNfPZcM5F9OkvFQ0B1Ndp4zWZ4hBsdZFPEonlggNc6cll
         62nCoYPivMtfCI6Yb9hAFb2971PEtpOciV+IDjdVcnLrSuwSTK/ojy/6Cc3DsPFw29Bm
         kHew==
X-Forwarded-Encrypted: i=1; AL+hErEf7QBU+qj14Qis0Y6zLrv0FVhxMxTi+tAW76EVNUJBvDf5Fa+emK8VQu1dTGdPMg89SM9xZsWOn05fwrc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A7kiraBIX6xkNL+fvATo9x9CNtR3tsYm7PINu9zRAGiuhnka1
	MFmbWKfOWxUkSpL+E9dWAQEaeDTSzRw3aibpwaq5SUluMcNtbazz4zx4Yqxw6ajs37khcEGX7+Q
	ws1+1hkkyUg6/z7L3Ks3OCDNpYJpu8kFd1ooKvF41
X-Gm-Gg: AZFdTZcDcTpRDCkfkD2nznaTCSI+TUcoHn/lS7Clmaf3/jQu1X/L31CTxqfFJRA9clf
	gVqZoprIp/Gsx1vbrCBn6TE9/J9L5dJcNKdImKbskPMrd672yMchwN8RUOEuR3YmXsMYSwwsd5l
	cIN6UAfgsOigXEBNwKxAMl0y/02TWmK0JmGgNNz7viosA6KZ4Iu4mZ9JjL9QvL/GJsvgw22/KLh
	+Oh8uomdt6OUElVSTkGLogHkxK7m/hTeTDkVSJbccUZhImcc6DOXrMcxm4x+qeHlNlTYHvy0nfu
	2n3thkrfxaYKofNdbjGna9kJYrqSVXrU5rtzTasDPNtSDWM2TC/HT4JsIKMB8sIJPJSJDI4CmQp
	8H1zitGko27UhBdOQTJ4/mXDC+gj9sBVG2pmhOynfBc8hFCs3CfJqbju/db8NvOgR7dk=
X-Received: by 2002:a17:907:e11a:b0:c3f:98d4:dfe2 with SMTP id
 a640c23a62f3a-c513aac21bemr1112327466b.18.1795654189395; Wed, 25 Nov 2026
 16:49:49 -0800 (PST)
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
 <20261113221248.3535369-15-wusamuel@google.com> <CAEf4BzbdGw4=yWxFqdFuz1U7RBSFqh7baJX=SpBNJJqnaW5P_Q@mail.gmail.com>
In-Reply-To: <CAEf4BzbdGw4=yWxFqdFuz1U7RBSFqh7baJX=SpBNJJqnaW5P_Q@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:49:38 -0800
X-Gm-Features: Aa3M54ol7ULgIQ7PyJ4MZUA4jeAQllgic7NBQxD7ZgZ6wx9FC8B6-VKox80ApLQ
Message-ID: <CAG2Kctr9Bg+4uz+cKWw79S6qFRPtW_PRDt0rFY73F6WpauXG9g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 4/9] kallsyms: Add KALLSYMS_QUERY_BY_ADDR
 ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[...]

> > +/*
> > + * Find the /proc/kallsyms entry that covers query_addr, or return -ENOENT.
> > + * ftrace trampolines and kprobe pages are not resolved yet.
> > + */
> > +struct kallsyms_query_by_addr {
> > +       __u64 size;             /* in - sizeof(struct kallsyms_query_by_addr) */
> > +       __u64 query_flags;      /* in - must be 0 */
> > +       __u64 query_addr;       /* in - kernel address */
> > +       __u64 sym;              /* in - user ptr to struct kallsyms_query_sym */
> > +       __u64 sym_struct_size;  /* in - sizeof(struct kallsyms_query_sym) */
>
> nit: same as in previous patch, I'd keep "sym_size". But hey,
> "sym_len" is even better and follow same naming as with sym's
> name/module, no?

Ack
[...]

> > +       return kallsyms_copy_sym_to_user(karg.sym, karg.sym_struct_size, &ksym,
> > +                                        &m);
>
> nit: if it fits under 100 characters, please try to keep code in
> single-line form as much as possible

Ack
[...]
