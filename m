Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051084;
	b=t3GG7gzAt5W7LLsGyqhFK0bcteiaUQQnaueRsmj0ftjnnlHx3seFrC/d+X42UnT2+OsZ
	 RyhAhN1UarlGCq0cWtiaI4dCbCCElwLx2KsMOCb3+aBfsFbLYB5mAIHRsH5+TEEzTI+R8
	 u76qEbR6KNn0KM2ccy/HtBpht+Ya1j+p21wMZztYyO5TPNGkYJYrxRmS9MKjuUXDhVZHI
	 4HEMWlqJdInycbDeWQHLboqGDn7t1NS6IFJqO4HNU4Bb9ynWlP36BpU71n+I8C9AqgeU9
	 YadRQpX4xPDBk/GAdO9VyfH9HJdJiIIfCEe+KeYpeWQupio8zBPd+cE4pcqWEpJ11Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=IidocJDbGJXK47j+zgIJSmib9dFoFVHbL0vp9LH6UT4=;
	b=RK1nWwRSv4hsdxgJCHusrJgUnxPseRKMDcDQK8vM03/WLvN1wFOvDgG19utfIBAToHKY
	 msAGXZhsWFVdWWIe4Q0fCLMBLdbmIT0lhWMxsDsr4HdNDbW+myzrpCBQdXv5GVbPC4i/4
	 tf2LtNsa9IVe+BPqUe6Yd3COyEFaEbK8V/Dvdk/CkuIjHx/T5coglm/eibPv39GFKjRSy
	 nwc/VTra+CEiiPwvh4RvGpNofjOq4ZFPIQED6gpHeTGovWFtSlKpepg3eathgGRsh5wk7
	 OIKlR96h4Hk9CK/3r9DPYEo/TR5dLwTTbZ7o9ME6VxSM7+PbytNwi+uhyLInGNNOy9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Jojg/YbQ";
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C85B606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C85B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jojg/YbQ
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2efd7259872so9969305ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795051084; x=1795655884; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IidocJDbGJXK47j+zgIJSmib9dFoFVHbL0vp9LH6UT4=;
        b=Jojg/YbQOeRzdIBj/fYFrVukt/Ls5lmcD3GIUXCppGRqv7lbjgwn/oENJLpDieve8V
         bVKsmCrsy2wQSnCAS6ZXVPCQI1dLYQPHRvHtc3Q5JJJlGWSopr1dNRFskyxafkgaKhGi
         KkFEbrHK+AOEOmxxNVH+ue8SObZ71SgCVeAu1OkZxPeQgJDkdeoBvEQ3w8nY+r03XHLH
         0sYeRSUJujeK+Fd8sNjcbFgTwTWiUiDn32GpAMu+Ya5Wed0yYA+CE7c11gvrTUCg9Ke+
         S1F5shdZ7InVWMZLJ5+9thwOYBpXQv6jEcTVOly45bAvdLU2afbXNfBvz9hQZRYmk1fm
         hLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795051084; x=1795655884;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IidocJDbGJXK47j+zgIJSmib9dFoFVHbL0vp9LH6UT4=;
        b=ZgKsKDi0EFhb9sGu/nGYnDzz5l30/zgcrA7rLNdWH5BlCuJ3MhRTTL6TgC7ubzP8Bz
         hfOcvtu7KgHzqIr2Zro0bzrNcexIg0E+rtcHfXmedwksttt7nSQ4qiE1q5gIo09jggCS
         4w09jZY81T37CcT/PNueXg0eAYUMB5i8GL6Zm0UppsxYuHh43HHdbpT0UT0Z0FJa9G01
         Pa58/AkRuqvg44faAf/c1/QPSMdoqcqCQz7k8iyJu+P4oTE724wWH8rb2hF+KO8RXba0
         lCR7J6PXI/m6PqL8Rl+yKDQ098veWvnR7ZM3IPEjCtUfpbUMfIsNYWVD8ESWekJ/Sqsl
         CNUg==
X-Forwarded-Encrypted: i=1; AL+hErGnOsAfCbqD0HGvalO0KkYHVE4qZ9l7a6lqPC1C4J0G+fsVaA4T720IbHHQUPNTRyy3ThIaoIJcge3eNC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R/L9PnRFOZDH1+xvLU/pabFm9Fo4mr7wmmKkkC9XwDC6C4Wsq
	mxX+HO5GeuAk9AMUkf5dxpuxgx3NECWsJR7QKcvpGyen3sdOboRWIEK9YKaQ8w==
X-Gm-Gg: AZFdTZcl0hp0KgTZpvIC+9S/va8b4WGef6B6ieAkPS51wRT12NK3OlVIGOrsCdY2oth
	LYKWc1NYmnQjlNWcFQRxaLcdaOwdV2mp4UrRnIl7JLPPOfO7V85vC7CMN2lHq07Dlx9HK7m3bBt
	OTe/icccp0V+gSC/SN/I69Ot1EN4Zk0KgjApn0WRDMfCaXZfe9RQnBl8jHGNuN9OGw59xLpktIK
	tD78zgN4hwZxlxX1r/KRjWMuytpN8fZNlWOAdxt1Al+zpB+N8npY4dJ+QPEbHlS7Gmm6ot1rRj7
	rPu5795QNWL4hZi9WpB91hKwH1wvIRJFV5deckZECLlcWj/k7o0C9fBAmZy/2ID5blaGWbUbmm8
	W851cxoVcj+QW8CGg2TTf6tNtZKa8NC8YD5Ycg+VBq08Eidg8YLwlLw+YFRYaqUfopdi+nBg2Vs
	8CTsYpj8GlBs9XriERLkZRKa4OyakMGK11RCt/z2virtVpALlATJqTct8oGZMryCXTFFSQLuJuf
	S2zpbj+Zn4ARzR79FDPooxgfzY2kFkxu/t3Z8zHZGJijjrWUKK/PfzROLm8bjVcN6nMX5DggI3E
	6+jrtLi/omNk5fVT7tB7mxqib/ReHHcPopZ+Qac0VQGQnBheOjFl+00hEeSyXtOJnQhizKbv0KD
	A9o82BfLxSgbIanNtebTVPtz6n+5y4AFUVg==
X-Received: by 2002:a17:902:d489:b0:2f0:943:1178 with SMTP id d9443c01a7336-2f009440af6mr27265855ad.32.1795051083737;
        Wed, 18 Nov 2026 17:18:03 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6182330sm20533265ad.36.2026.11.18.17.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:18:03 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 01:18:03 +0000
Message-Id: <DMYSI3BOQWOC.2P2FZB0H872DR@gmail.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: Mitigate Spectre v1 in the BPF interpreter
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Ryan Roberts" <ryan.roberts@arm.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Mark Rutland"
 <mark.rutland@arm.com>, "Daniel Borkmann" <daniel@iogearbox.net>, "John
 Fastabend" <john.fastabend@gmail.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Alexander Viro" <viro@zeniv.linux.org.uk>
In-Reply-To: <20261117172341.3152407-1-ryan.roberts@arm.com>
References: <20261117172341.3152407-1-ryan.roberts@arm.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 17, 2026 at 09:23 AM Ryan Roberts <ryan.roberts@arm.com> wrote:
> The arm64 JIT implements BPF_NOSPEC with a speculation barrier, but the
> interpreter calls barrier_nospec(), which falls back to a no-op on
> arm64. Programs executed by the interpreter therefore lack the
> Spectre-v1 barriers assumed by the verifier. Contrary to the code
> comment, kernel-wide SSBD does not provide this protection, since it
> mitigates Spectre v4 rather than Spectre v1.

Nack.
In bpf-next arm64 has no interpreter when the JIT is built.

