Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017338;
	b=AtEe1fGi4kDX7Kv6HQIFfH6TLM5T/6lIfEHt37W+uJJNk1MjbjBXwMc7L4btviUdHGKr
	 NS8MjrttI0qic1ew/WbY7IFg18vh+yyDwRohIHo4YB/JVDhy4pOKCG1rM37hryRaX0k2g
	 TkYH915kGXG23bnsQKtmt7mMcehTOpT39a8bbPyxjQ7bZ2ZiStk0TVyWmItE9Mwl/t1z6
	 XPQfxHGY8aFDO5eOlmF+gVzBrl+sHUxKbWjHq/LjY7TkaAlTsbd7fyRsBO4jAbJBZLIrG
	 N2KaLCUcJ4c/HFxdtDNQfv8tX7N+2JvrIF/FDD1GC9bIDzNk8EcQ3nlhgEKEBPg/E4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=opiYjd9kyePy56Loel5UjRPuD8cH7yPxU8I5WOGrYBw=;
	b=y4oMAm5StTBU1dzWOBl3DxMw308BDGDa10YYnVnMpkED0Q7EkkFI022VasLQ5iGPsj/4
	 xA3frFBZ3hcK7wivF/pFt6iogvlNCNoGsCDcvCDgxqRcWYHeWbR0yTHo1K/o0lplWsUvb
	 V063W01xOdvThL3bgMyn7oXp9XPktxJURpxC2XpYKjFupXnT4Sl/IkIvnyeP3UV6pl6ip
	 y3dksjfm1jTC1E+fHBO8iI2EuBUphgWMY6u/I/dHm6jKUDnVm4v+pnOfR9Si0Bp7yB3eF
	 kjdbD0UyM2/9l9m2FMcmwLb1UkZI749qKc+8C9hl60H3RW/HU+ELS1snJ+GJyBhs1Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMtU0Ddr;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1AE606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A1AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMtU0Ddr
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492690dd5daso934412f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795017336; x=1795622136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=opiYjd9kyePy56Loel5UjRPuD8cH7yPxU8I5WOGrYBw=;
        b=fMtU0Ddr1dtcFOHuJwKGWLeIEgdUmkB1/fhxjb4Zf29xrbuCBwKDtNAfzl6nhpS3yz
         FuX/edLakZ2Fok4Qn2UTwFmQ0HbbTWeQIhMksloMIfzCRPKjmYFTO04zTgSOJg8MtX7j
         ZOBJgwKLyGhIFR8jUDeneVkV5CPzrjMrn20SozI45UkPKvTnwx7+AaWYpIl9ZmMbH2Sc
         SQqyaINGpPm9OYbHGWDPtmDX1KddLlkIXO99bx00yJjA58qF0qesW8V76y/fQPp24hmo
         eu1N1JaOs+YzAYnglKnGinwp8YvQv1edehoNrLrUkloAkfRtv58bGLua8XnuUgPBDd5W
         dfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017336; x=1795622136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opiYjd9kyePy56Loel5UjRPuD8cH7yPxU8I5WOGrYBw=;
        b=XqA1NXzaEbFj2IvSQkVJCyzw8xnvODod/2vSOq8SmujyUblynPNLXAiomnFXx++3Yf
         tbDPQhpugie/eEHJMgq5qjUpotmDohfbod+i8xPIV5ivvi4lyqrmzGe9Vaw60ygPyQ6m
         nffM8z5s8tkB6xT3ICMaBO5xfTmlrU/hWMMG6rL6+gDFQVB1I26M5yo8u/nLzcISmO4G
         bSfbJ9HavHWB/arEH51+W4pL2Ml+rCOAvOIxBZFrhUEpQSt0G6P7iYVF9AlfPp3oEJxJ
         XJVLPJnGRNsK5flUWD6jCs5Cmwc/5GG1MH4KeuSH23Pie12bmQEXJJxnzB2wlA2NPRGh
         S/xQ==
X-Forwarded-Encrypted: i=1; AL+hErE1RC+rgTfyksgn9QRLi86BoPSzkHu9NLkYs1e/y0pt3umIn9TsUp4wE6lvLP/3W/i/FvrfGGp2BzLZrR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UYhHzdP653LbXqMtTqhZp4FqcSz1omVYvMnoxhHjhPE7oNnG8
	wR85PUnfyGm+0RTo4zbzzEf3I4vcBW0YwqDmWTW3LAGSNDIRlmttsnAP
X-Gm-Gg: AZFdTZdp2u5DGeyfgl4cCdicMwix45F4q/pv5TOuHkHwZAOJ/gi7j0w+cAO2jkOlpLI
	J3hClb7FYLAF52KPpj3Ndquy03IsphQ5lQVVHj37rONZ7XbA+5pspzRRfeNfGvNZh2yQDnHz02Z
	gH37B0+a2NkxWbvCMVe8VLRaPcrivgC/VAjH3G7Ibw9OjSeeUpu0vSNk7oh39O6zwoZWIFd9/ku
	WatDuzn0pVQuJKr6MN7T+Q8zdoVNX7kq/FPtCwCkiQn7Z5qHGfsWyDX29Ly55Re5OzQo0Iw88lE
	7CwxJufLsMHBKkIsHX3MA7gR0r7zjUXplgWGw09irz+/hzlEaTFk7r7EyBeiO2M9x8OAZdP+OJT
	l5FW13oPfQDjf8jUwAmd/+wBPcgMSoKLCw0nqIqWdoqjFGdnTuGh7g3uRqHI9sHfN0sO/CnibD4
	AoV6v/JrbrlHM0+LVcG3unPQMqjVTER4HTsU+WJeHdbdKMEzJ8WrXlu/P9EjpV/z5RjSnREICQM
	7iNcn0PWLDc58GRjRt5rq0yynduCai/WzIlQLhSgqLoiRyVF9XdQTzCtWI8uSUP7JDRM5L3U3Wu
	BA0h+KPmYw9gKXoyIN4X4NsikZ2LtmGVANinVIpf3AmYh2eIJqdYxykmPmX4gfW+wVqMMZkbat/
	t10hiuQZDq2nuM5W5rNaeDRpiMaM59EZ1h2nSgleyugAd5ITFP0Dm7+LkaMT6yEjgOkHETHGZPH
	q3
X-Received: by 2002:a05:6000:4102:b0:48e:3bc4:a367 with SMTP id ffacd0b85a97d-4a639ff61aemr5650397f8f.33.1795017336371;
        Wed, 18 Nov 2026 07:55:36 -0800 (PST)
Received: from C422HJQPQG-Fractile (cmbg-18-b2-v4wan-168328-cust3701.vm17.cable.virginm.net. [80.5.206.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c406sm5490881f8f.14.2026.11.18.07.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:55:36 -0800 (PST)
Date: Wed, 18 Nov 2026 15:55:33 +0000
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: drm: ioctl: fix call to unsafe function
Message-ID: <av3KdRxCJsek49L7@C422HJQPQG-Fractile>
References: <20261118133232.48603-1-vishal.moola@gmail.com>
 <20261118152901.788942-1-aliceryhl@google.com>
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
In-Reply-To: <20261118152901.788942-1-aliceryhl@google.com>

On Wed, Nov 18, 2026 at 03:29:01PM +0000, Alice Ryhl wrote:
> On Wed, Nov 18, 2026 at 01:32:32PM +0000, Vishal Moola (Fractile) wrote:
> > Fixes: 9a69570682b1 ("rust: drm: ioctl: Add DRM ioctl abstraction")
> > Signed-off-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>
> > 
> > --------------------
> > Based on drm-rust-next.
> 
> Note that patch commentary needs to go after a three-dash `---` line
> rather than `--------------------`, otherwise `git am` / `b4` includes
> everything above `---` in the commit message. No need to resend just for
> that as we can strip it when applying.

Ah, I never realized the tools were that particular about exactly three
dashes. Thanks for pointing that out, I'll keep that in mind for the
future :).

> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> Alice
