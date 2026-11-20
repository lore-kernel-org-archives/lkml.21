Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795210856;
	b=JzOEuPMVwBwHlxS6TkDXKUEKO8Nh0T0h9hH4+UOKfKLqqNf4cTxPqvaSpEOElCovf39z
	 xHYric/1OXENMHIhrAoHkznTyIC/n2IiS8HBtQpBM34sNzK68g8tTBQ1RfA+zHBO+Ru5I
	 LWRpqk00fyk0DCigkLB9RxE1t0BJrQMX/o5hwZZXIKjguqe5Iy2+tHEYUwZnYPeIH54/q
	 Iupaz2RpUSVPidRfcbVEeFyMIlEvapGJvZM7L8UybRXnIjuuQ31mMuT0TRfG99rEtN0pY
	 RZTxxwRhyglBS1wC9lF9gCrAOOqqBPpC7sXfG/1FU2AMVKJvQw3EhaYW0q9Q/7zquQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=QImpKtA/5km3yjf8jdokal2t9YOvsyssIpZK1Sv9UwI=;
	b=bc0fugP96ywiiJucsl+0Ct3Ib5oVWQibuZTBJ5hZ58rtcKS7DtQVsL7svLgvcCO3GF8D
	 LEChrBEIGNzo0yFIU8Q2N1kdIXizilTLtPCIrqmBcgW9WScKHfKzfCP69BPD0OrR6mzq3
	 FzaG9eoCFsL0JAkA2Xa1Dv7NbBUaUbbLz9cLiWQSPSe9msQIC0lYJgBLmLq0ghBFulbGH
	 FkrAso6ukjolPKnPhkTg6dPU/0tfM+KhJDEbgLh7jF7Y170hvfMv7WeXU3EgPmjBQGlL6
	 BxoZL6vASpwVIzmHsYCKK6CfDHr7XHiuB9lY84GR3WiXn/JjdCRhOvTbUNGz7K2FIHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modal.com;
	spf=pass smtp.mailfrom=modal.com;
	dkim=pass header.d=modal.com header.i=@modal.com header.a=rsa-sha256 header.s=google header.b=Df7mUUB1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46B4606A698
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C46B4606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=modal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modal.com header.i=@modal.com header.a=rsa-sha256 header.s=google header.b=Df7mUUB1
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0d126f631so11435957b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:40:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795210854; cv=none;
        d=google.com; s=arc-20260327;
        b=BKwmSugk0l6vZOvPopIzkuQRXJQNNlW3OzzhanR0dIrYqs85e6QF3sLKhR5gOLDHh9
         J/NWsVTAOR6uqX5Z5JIs6c0IUBpCp5325dc/3EkQa8ByO465GIDb1naP8IbgJDyAsfs3
         ApVNECjn/kKR7wemc8JpKZUtkam9xafQVTkPMi36epWSlWjTGmPfvNO3ZZRotK5NiGkV
         NjMFSMah1/BNs6s/Mik14XKOYdoeDqfJPdOtD2Ns+V+rFTgsQMG2803yOy30ixmI0Ohp
         xwroDt7xU0EK9pf2X2TLOeESkzkvXq7jxJ4m5drry2fouYlKpXxVfHbyRDe/uTU1YtWw
         qlhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QImpKtA/5km3yjf8jdokal2t9YOvsyssIpZK1Sv9UwI=;
        fh=Maikmp/liYkGEGwpVXhemo0lspyS/SuF8HARCb3Ji2M=;
        b=Jm8DlcTBMHYYy0Pc0sIOIWqtBAtvGc4QDHFG3jXzvykrr8BiyoF1GpX19PM1iyZv11
         KTF1/3pU/BABFMhH/S1TA1efxXoDeEqm8NWDWiwl0kKjrdXvE7vpYJXu0V7J9VPol9N/
         0shsWTzHMSowboLP7Sh73jK0aKrUTB/aKNtVnmsUhdU73Ds/5h36unStZmHh0o5cTttT
         HRbv8tnArH9mRAsyxxJWP61J5gsnOUZ0eM3kv8kOijwUqaBo1wGTQ3jeGdd0lh7yO7yv
         KzrljBBPIwMhEDLDGXwG8sj0Sclmp7rP0SV0VFhJFh/94r4NRp3HXPtL+ZTZcaFCbBWh
         P3Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=modal.com; s=google; t=1795210854; x=1795815654; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QImpKtA/5km3yjf8jdokal2t9YOvsyssIpZK1Sv9UwI=;
        b=Df7mUUB1dMitJAxRQneXzSTyZs6vp7slPKQJPrQJhRUPGToIBAwQ2ztZocH82ntZ/s
         A73VOLRcuoHmWjmeH0bXO+Wkg9ME5N4ieTGcElHVyKcRWYwElV2f1BuNuByu8DQ9YicI
         mU3lRpeMnBlqF0UYr0SQvJIHSKPSR4jZJFnz8OiIz8Eh5pJMebhrQdqT78kseUjYuerE
         0i1mpQ0BmIWwucNBmEE/AmJ46gEvlzAcMs26wRAlCyr0rvClySZlUmBP2s/Qlx1p9v2u
         n+BM5K2yZu3M+BFI/biZsqzUwB0+37kuILUuuLAgiAHOt3HmwFH4Hs8H1FkzZlzD8SOW
         pQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210854; x=1795815654;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QImpKtA/5km3yjf8jdokal2t9YOvsyssIpZK1Sv9UwI=;
        b=Uc/KqkeSMIHGnKNpOkk4UuV3dr5EWZ44RY5LvaiuNQPcbSDo0gQB118YbRAqdee2db
         aQNpIoayQrDXpuIUWU/WpDbt6xQmOG7CTY4DrxxfcPisLdt22VzFkA6ErHKPR/xTz/0K
         T31OyRQeNq9eFHgfbnFWD6v88sfxS89nESW5uZQvR2NZmP7KYZfbppOH0oiTbSI2yC6j
         r7TSBPdw70MgWId2O7AGmWlSnqC7fGgHUAG8lBwvFBe1+9+dMguPMKY1BXBiRPRrzANM
         vUhn0tKZMzO2axzS/wFle3m/nRHIQ+cuSXW+cvb3iIktRTOtYl8Ln9ruI2WexMnRoSgy
         6z9g==
X-Forwarded-Encrypted: i=1; AL+hErEmbfBHM+zbLL2Q/vOKpmg7zOWJYQHSryuhKfci63K7BZ2SF9xhmdD9pPE0hENf4qQ+ukB/OAetkYMHclI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AafKd1PlGfPOCCOxpDKvgEDAep1BN/LQ19Xos6nXRxCRnsAT+
	YvpsoOUwLocmdBTOSlrbPbED1WyxqMn0TaX7IHNBqi6YHYjrEeHIIlAFtb+VKnt8MFfnPSebvrO
	hst8D7eHXNDc3b4kdmyzmlzGooyiYSnrOCTeO3JNKAw==
X-Gm-Gg: AZFdTZcFVbrKqOJB0pYxvBE+WfPi8w2AAu666JV7gXfP/Vbd7cuLqRLoMnIt8gff69p
	lhoEkZhUSJDdBQ4X3QyD7xjvntegM5JnCaEcNOP+D5MTGOx2zbD6xpZ8JtsME4tgiZGgNaBSd3k
	VQXKZLC9R+muKOGh8kShICqYJWrdNY4p+yk3/zn6QGMEv4AIkizKbwIy/g3ntUKyKjbi6NsIuKd
	xLX0/x2vMk9Lirtg7VasYfCOQGo/FiZyiijO9mhU4WJpTYKzvfQyd+WgSqhwpLTmbO/n5igQBzy
	Cl+QHkm+tIuMTx/xaS2merfII2g0ELy/0rpfS9LqUSGUVqMdSlvDnxV/cDYgTEraV0vj2eW1Gqc
	QbJZQ2h0PCBOzqnnckrRfd0ve62/01Ku/v5+PoxWGeLsF01/c0iFwlEpfxSh/
X-Received: by 2002:a05:690c:9c02:b0:8b2:bb94:8cb2 with SMTP id
 00721157ae682-8b5204ac257mr21219207b3.35.1795210853469; Fri, 20 Nov 2026
 13:40:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-samridh-shmem-send-v2-1-f2ea01bfc178@modal.com> <e4c0fcf1-b70e-4d22-9c4a-5829e1438ce5@kernel.org>
In-Reply-To: <e4c0fcf1-b70e-4d22-9c4a-5829e1438ce5@kernel.org>
From: Fnu Samridh <samridh@modal.com>
Date: Fri, 20 Nov 2026 16:40:42 -0500
X-Gm-Features: Aa3M54rPyk2mfbXoTl6Y5BgeHrItQVBO1R-NrW2iTa9bd2JmExDRcSiUYRlPG1w
Message-ID: <CAKyepcSuZ49Nv2D3UGC++-niYtfMcPEE7sjAf2SSRx4KAy1oGA@mail.gmail.com>
Subject: Re: [PATCH v2] mm/shmem: avoid zeroing new folios twice with init_on_alloc=1
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 11/19/26 18:06, David Hildenbrand (Arm) wrote:
> I do wonder whether that could go into the loop, because I faintly remember that
> user_alloc_needs_zeroing() is disabled when CPUs have dcache aliasing.

Yep, it always returns true on CPUs with dcache or icache aliasing, so
the flush only matters when we clear. I'll move it into the if block in v3.
Thanks!
