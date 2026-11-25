Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795615790;
	b=N0lLK0ooWFK2hWIqmtao00LNJmPf/PdZL6LuKRgFkINuiUZenGgr6zQWeN3ikqAwu3bf
	 wqAEBBYXvalZojEmtikJTyxFSpt/m96mn42mTcZaG5HsY1q05hSMZ7oxD4VqEgq/Wvssq
	 VcWeCCkEZFz3fqYYeDEuM1u/fcbI7hhIGebTYFRV4DnCAoQWQLWRNDUaIsE6zWQGbuj6h
	 TL1fFf9k2rhh7UfBFWMoicdfudXAakHi4/5W0XI+ulkkLsWLt3N45Vgadm81Yw0L70f0v
	 lG5eb8dAhpY1Wmv+7lDl3AwSi1v0hPeTuvulTF8q7VumZ1QfqvKg3nLSyfsLo0CST7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=7E8tk8WNCvQTWLwjy68MzTzeM/OC9j+djS5ylZwUSPs=;
	b=G0tLLIdr7VEUqt8C1oCeULxx4scHxN+BbLFRrBCJ9CQz6D1mx/Ye2+nwLH7n0yAfzQ05
	 hg6NilxfUlSbl3NwIWFVIJcyIvuSND2LFvaSbvUPojAuw06Tv/C7k0LRPXEGgvNcZ6WwX
	 7EyFUKTDTSDPfRcbf6r/9HtM+o9mBLwdw66s2BKVKWqido2/sa2sDnBdgQOGXG5F0kbzI
	 0W2/b3PBQGPxvHA9hQbKPX8qBFoNbNqcxa7cXJBV16uv3MfWYUJZuE1Y7SArgddaCxHeI
	 jmLAjEcr08Pj/6P/0QT5Q2FMfcgLknNfouinyln9VYTWWLgaVgxwOsPiGsZvp//IaFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FhJ3t8Zi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED56606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ED56606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FhJ3t8Zi
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5ebf39def3aso2119128e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:09:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795615789; cv=none;
        d=google.com; s=arc-20260327;
        b=KV7SAZ1dvEmi9KRNiSv8boj6OQW9dLNAAoFmLSaaF54K4wJp/LO5K1haYXQmdoDYLE
         7jJIA9m76fsXdN6C7eo5MgKJgWuhsI/8ONIgdf+4k4Uyja3XDmer/4TedIYyj785w0II
         ADw1AhA1GEsOyYiuoaiTPmvhe61BqG20i/tHZRjMGDaUDdUVKN99Y+oCqk8FYA2WLGCc
         wkyhqUGua1v0CwTU3t0HUkXVKTOCLw82kkFkIaJFvSKdqfDmn0wTeFAZyspvQ/vlt+nL
         M9/EAunaiFbM7RRiX55IgL/4eu7Ir3GUkV9/LXuU2m/XX2A39pg9dEVKEe98Jc/zX+qZ
         nEgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7E8tk8WNCvQTWLwjy68MzTzeM/OC9j+djS5ylZwUSPs=;
        fh=5omCE1PEy/cBPLpLWApmaVOc0F7RrCqo8da8li7OLTI=;
        b=Cb2qCnjdW7OG4W+qimyZrT8wGHmDsfhv7mSWfysnZDE92w0h6b6/XT7elTY188/bye
         0AyLPYYxnU3Ei/yMuhylWRS5gw69y1Et79hgkJW2dHxhE8zfx3u7ClgScFuMdIjvzJUK
         5983eTKcK+KdmCitCDvk2R5AuWzuoNgkVseDtKVMBggWP3Wd+bHxn65rzEEbALDavZRE
         0TUOd7UQpvkU9xT6Y/fvc6iW+JSH7i3dxv2nzIqZwYCWh9BE17UHiCAkDI+NpjYZPhka
         m6K6y94hOJoPSFiA9PbWxxHB7tqEm7bwRYl4wMfTAionJ0S1ARfD2MshpmbgQwvHs5Yh
         T6Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795615789; x=1796220589; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7E8tk8WNCvQTWLwjy68MzTzeM/OC9j+djS5ylZwUSPs=;
        b=FhJ3t8ZiilsdEUXpw+64Z4kkdtv/auYs+JX2tu2TeZo5nG2fO5eCS1Hy0O08b4b3Ie
         FER8I1a9t8kdDX9n7n/aPZTmphPwZskuQdsdDnYT2wBVPbhcTleMwdRJ1UkPFOtlqTIS
         U5dkfZTpbKmh7bmtqjMcb2L3df8KcAydn6qHzmcTOU+Dqsw3urrIb1nqv1OD0x16l0u5
         gnj1xWCr/aks3dYlrIjG+7SpJusi/HqVguhfxgypbBD4dpxB/RktjA1JZi+gdnkhBOxH
         bA9aOTBKYJpAhUqdEOmvAxQjM4LnzwwAgsQLDQMRGdsbRR1k7tWAerSbYH1lRhxJow+B
         pLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615789; x=1796220589;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7E8tk8WNCvQTWLwjy68MzTzeM/OC9j+djS5ylZwUSPs=;
        b=ozcxx1HtfKGMC0zACs9AF1o/3NxsBJL9WMyHMij9OSgCWcDU4yXMfSxN2MVsP8J63x
         XS66xdfm87fOcGcPfTeIymPVYLL/n6Hd4KVE50og6bHUBhZYdweDb+OUeku4zg7SbULT
         n8N5Ep1uX2kr8OhgLpMUdoOSvaZH2QOO0O1alcxpP+H0dlczGgwwzoRvY/9t57zt9jh7
         sIvGjYCWvjaVt0VFxkadT00spN3ZVs0OL0hMs98CzV/rLhuY2e4u/VRVhJj34aSnaJbL
         oebAFhW0NlSMs0Z4y5pN1xuxVP1wbHiiJrR8hhz4hwLqCeIdmCpuudR01VM6xOh5hZrx
         c2LQ==
X-Forwarded-Encrypted: i=1; AL+hErF4RH6ugJUd5x9x8W8o0Q1lDhGyXmuu+Mh4hvvvVdVW3HKZdW49X7qSKUwJhQ0Gw8zedc52RfrF781+KrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rsBGnANhZhRjztSAJi3zHugZ6LmjsNc8uqnXxGMTDfTiwYvh+
	at8kXsNfgiIIaXvYJqnY6Uh49CCQJvytSqlDYGMQr0i8Yqq02lR+lJT0jV9s+le1NOiVmPigzIa
	yW8Vckvb3ulwZj0oP4JMekPaCDeCkYApIduYswBzUyg==
X-Gm-Gg: AZFdTZerJ691mK38YHMxIEYF1c8jxeBPLANtZvXc2fRBvnSCKn2Lb27T5wN6eZvbwHR
	1zacUH2TPsouhI8kByF64cbbbDyHNzz7+jCoMKB9WXxe+/Pl8JXnP98Rmhd0M1UyQdmlGyOPxY4
	JvA5JCuohcQv5kkOFFZOKkR168XvZU65Fo5FdG3blwdx9NYkRfOnbRzv8EsoJ4cNxmd5ekgbvZk
	XaOLMJlUqnLESmCT34wxPSUxCrQy0gtm16NAF/cctnmo85XZMx49r5zEjmyLbmnnoWxngSIPdHk
	MXdWYUJ00jYhjwFRoPQq2d45TgI1h8gpkPI77Ew1CMTIp+Ud+S/HGsOgoj/6G2qG1dgiLJ4wGN2
	4zCu/t696qzF58vo/JkND+i2phuxaRM1LPbxPHTaFzhpsmEhvmakDVL0FoFJxxFcZLSES8t4=
X-Received: by 2002:a05:6122:c99:b0:5ea:a0d9:e5d6 with SMTP id
 71dfb90a1353d-5ee8af3d595mr8272641e0c.17.1795615789157; Wed, 25 Nov 2026
 06:09:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125112158.938835-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20261125112158.938835-2-u.kleine-koenig@baylibre.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 14:09:38 +0000
X-Gm-Features: Aa3M54obGj0SSyVHHSsOwfYIRaKHRsKVEjS56uh3mH9SaQixJVuueHwCusR4AEo
Message-ID: <CAA6zWZJY9wHN4L0BNHX=no4+tMNH=ZGvEaEYGqd=u6EA=UGkNA@mail.gmail.com>
Subject: Re: [PATCH v1] spmi: Drop struct spmi_device_id
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This was introduced by commit 5a86bf343976 ("spmi: Linux driver
> framework for SPMI") in 2014 for Linux 3.15 and already then was unused
> and no user was added since then.

Yeah you are correct; I have not found any users either.

Reviewed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
