Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795653751;
	b=PPXPMDjnpzzv1FljIbHWSZWLhNeATUnKZ5c8CBSq+v/Un6pFSIO4caO9a7ApwsU7SMmB
	 wE3l5lzW/hCsrrYZa07a2TRK+TjS2bqN5o3GQXvKwuO5f1Zniaz58K+K6KLemG6njp4/p
	 Fiv0QUpS6IRjWdAlxkG+LUdVRFDQ9WiB7zNDZEZYQ/qvgJQQi5iRHucN/jgLCQUNr4rxY
	 PWAQQAFOzGzzMDCabOzJ9x6GwH1/E2eXg9aKJ/oW3+TrFO4nlgjCZlCwAt6h0vNKaOPVM
	 S5yD1WCsf5Ww7uXZ4G03u+iXf5r8u4nUmjw8wtBf95qV92uVUuEA5HBbQMMS0L9mo0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
	b=VKEHL4Xu1is6sO3cxeX7lIXdHZrM89t1l7Nih6tQWXbY4ruuWw/HEQQwp+UfzjaEgbMc
	 9sRCfw5mcucQ3aDUvFi5dT6CUmB5ehBn52yhADmyIW4+zVhk6HorKED4xTZx3KXwLrY39
	 ZHN4hP9qcZcFKgbJaLZaUe2fCewnfcO3E7v25/E/0MSSCJsEpm6eVjoABlddqJSLzO6jT
	 USy8oGc6dh8YT4vNlwj0/ReF3xaOtMfErvsFHdZ59/HcYzxVKAafn02y9mUnfmOLK4M6f
	 QUCORxJyBY8OzlRStAWj+2IA/VZbv2McTjiUnPYnvS62Fj24bAXPEweLit3+SwaTw6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LpN49+az;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D240F606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D240F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LpN49+az
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c516a574bffso106059566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:42:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795653749; cv=none;
        d=google.com; s=arc-20260327;
        b=S8A4NuKe3zQRu9+xywPngBD8RIj1WZejD5YOZ8HVhBbn4i+X5Il2ucKuF6CR04x47l
         0meBds6S2jaRTVwrGOBjK7ySrzJMtZfZotsn/A34ktcHmdjnCNjc95zlDpeij0qDWFwQ
         B/go+DDNMY3y1ir/3KXJU6R6UX1dFkn8y0WhTWIv5eh9o67iph/SkGbqfCU1weHfEqZd
         7NKMgqLDecYPOkglM2SxQNgCrHMMprxwXe3VCXrsKZw8ZfrEtqfftFzjPAGOydM/G5Z3
         Yoz7q6qXSrOV8XSPkFTmlRVM9mrEDamK1FET1AO95mfux8Vfn3zWT2+HTDbBj2klmiGN
         gUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
        fh=V60HBQkGmf29MH3ITi7mDpMcEIfqB+CQHcB6bjnFREk=;
        b=EDzU8l3hW7IpkEuadEDJXh2QgBjlLaIPiTRERxKLieylhyupcFY/aPdGDgFQlPbLah
         u7itn6rP6VZcu1ZV+vy+mslLfQuIPnNw4em2mtBHMEgngNgvUWMM8gMMVKdxI2U00U4G
         X68abyjE/rcfbqFMCKc+EF7Y4yAS7NEdJi+le9gx4bi5S1VWT9CajkgC4yFN7qBXKNZm
         8tzjkLh4EddKZgacOr7AjxM9aEguLzN4EVBbDK1joWGH7RLM0KgVv7i8BdYI4ybgdLjm
         w8J/ie43//ZEaisAMvfYjvXoxogeoaWY+q+i6c0tSWrfP1PR9i78ui0DnHKJxws0b5gJ
         LIaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795653749; x=1796258549; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
        b=LpN49+azCIrNLot1wWdZkbi4Wt9+5r7MX19ZP740YGH95NjHPkEZ3J8iTn5nZs2aU0
         YtfDizzXcozDLpMOLK52IGL19BDPPkZBwwaARaxU027w//2VU6VirePpo9PC6B6/Gvyf
         w2GVoXFxRvXbXsOKb1KJ+C3LWAAUbXNTn5yq/DRtNMB33KVLBN+E7CMg2n3o0WEACasU
         2Rm6jn9HoFPOXbo7vWifWbukhD/T5j5US9xUFhxajKYt4rvNrF1rO1KNwomR3ZLuXZ6w
         QUOmuxgTXoYSvlHBVpUm9Y0LfNn1TpJbekKTAn/WwvKBAhjn4jwfG9HFJEBd61cyDiFr
         AG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653749; x=1796258549;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
        b=vFbtB/LzFZlvMri3/MV/1gVcZ3u4fnWL8f3w+oVvEocqwhf9SqdNJuojKO/A+kBxOq
         f5+aIEO9bB3ctbFL5mfHNP9F2YVKT7E9s77L4TrDBpcozvH4QJBIp2Ucsm/I1v+LcPe7
         IQB0uUkXjhsULViS24FBcWPR5sQG3f/48w27+mm42tA4Yv4DuPqA+wAiRhx4JxLvpaPm
         epv1hGG5Bydq03Cq3Yv9GkdNHEeYM1trCqStFQrihtkfWafBuppDSPItx3mm8puOfyn1
         X7RWeiUkVqbd6zyYDada8/2Rwr++ZRrA0F494j6AIW0ulBHr7AijrKPF1Px2DC23M59a
         Lk1w==
X-Forwarded-Encrypted: i=1; AL+hErH6uMnGUwbcspf/vJhYIrdgUNmzbxQ6iwiP37lMNHpbPnfaPXWeA9HV5wULlW+VaoXISd0RIdBYL17K/r0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oJc8VSQh7a6VZr1LdVT1hHYMM8IC2hlFxIE2HM3IqsfcqrYm3
	UbnlJ8gOOo2YN+mW5B/TieazoN685TKyob0O64PXoF6BjJHXwyrAFPmbt7ngOLUfuQfV8qpylO8
	e0CrOp1GdIuK+au2hm5jNrD0cplftvVP/lY1lbooe
X-Gm-Gg: AZFdTZfJIOpNLJo+6zBKbrPys3lhyphXSwydraRp26MbfMfvnW4Ad7TkIEdLgyzbTJD
	g+BveL8uTXrLfFfZyYXZB69JANDwzBNFdlWcsyDJcHAZFUf8++Ju3rOit74J+8YusfTzsbZNB5Q
	EpEcTBiuNDXtkviizabFj3DF4+UoCwYD3GsGwjdA9lcuHpi/QZ6ZlIKyEVbAsLjIVpjVCl04qEn
	3d1Ry4XRA6wMVSXXIowsKF7PmcpMc76b+/TzEmBipnJM9Rog6fU4xtLB4BPsQ7tzfEGjzoTKsgt
	csX+80KVKRZ7mlyZw6RK0F8lTs0aa5I0OMwgHk8Ulis0urVVOvhdkYpMawNBMOe+H9TCfr/MLpV
	az+kD2edP2vgxpsLrRT2k/hWQIo3nR3io3q3cyZrkyXHcFlZIqd9Hr6XlenGkWvs4D+K+DDDza3
	uy5G7Q1En8G/jN
X-Received: by 2002:a17:907:da1:b0:c50:5275:fb97 with SMTP id
 a640c23a62f3a-c513acb5e2emr1626085466b.47.1795653748662; Wed, 25 Nov 2026
 16:42:28 -0800 (PST)
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
 <20261113221248.3535369-13-wusamuel@google.com> <0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
In-Reply-To: <0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:42:17 -0800
X-Gm-Features: Aa3M54rYVczs2SqMo55_UQYl-QiaJqAFTx0CS_STMdfssfUbqw_TSopd5IfB7RE
Message-ID: <CAG2KctrMMo0j9Mnbg8fdNsSc-eQaaaW51dO4mqwVNn3hfSdx_Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
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
> > + */
> > +int module_kallsyms_find_name(unsigned int *symnum,
> > +                           const struct kallsyms_name_query *q,
> > +                           unsigned long *value, char *name,
> > +                           char *module_name)
>
> Nit: kernel/module/kallsyms.c already contains a zoo of lookup functions
> with similar names. Adding module_kallsyms_find_name() adds more to the
> confusion, being similar to module_kallsyms_lookup_name() and
> find_kallsyms_symbol_value().
>
> I suggest calling it module_kallsyms_query_name() to match the
> kallsyms_name_query parameter and to express that this is a structured
> query, as opposed to a simple by-name lookup. It might be a good idea to
> similarly stick to "query" instead of "find" in kernel/kallsyms.c.
>
> Otherwise, this looks ok to me from the modules perspective. Feel free
> to add:
>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
>
> --
> Thanks,
> Petr

Sounds good, will apply s/find/query/ in v4. Thanks for the review Petr!
