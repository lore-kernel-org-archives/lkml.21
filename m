Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629576;
	b=pbYr6QQ4245bcvWVpi4kuhXqaBMCbCMVkX8weY0fSs/qMcpJKxh7Ds0PGO/vkMPRXYR2
	 qsbN74q3LSCmre/Ir/CnO6qwymuvwJLA0Y3gz/1adzRxb4YTZbd6RkEUhuLs0oEQMOHzj
	 qwg+/AjQwBGE76Q9skGaKhG3wzXUv4HQhuiV+sM0P3udHhqWaft0a6UeG3tkBXXdFCwCo
	 kJRiLmqUa9EGdwSe+0GeAv/GnPHji0E5j5nBGBxSNXJjNKbJMwhmq/0TFtAyVLNfaCNkT
	 7Crw+6/r67xf3Ns+R9IL7TbZjjSK/XOGFNKkAl7992eXYMCCjfki1M3A6f15VDbmDBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=90/s0j/8y+3kJDj7DR6pgcTmblldR4C2m7/voM9qoFg=;
	b=ixrKkEefotFuRJW5E/O53mVLU/aX1G/eC8f6Qgwp06Q80DZAjiL8/3kgqBTTK5VskdGq
	 x7y1nKm+XhbVGchGdFMVhw/lFCZDmCelMLxxIxiOBj3meGK6BOxf6OVGqmq+0ZHmVIhoz
	 MHPGiguIcoinOw1XscjCtSZ/Fy02SVFk66eE+hADC8aOyq1iMydMRA3Ppwu1H1eCCy0dq
	 DNdd+bb1qZo6hwnWKKNHqLJ6FZoVOz55vK3pxAaa3jqJKbItsibYktMwxpNKXQcwpNQke
	 56sxmWcHW9DWRcj8wjat13zC0Vs6EXdHVg5b/q2UNo4sAU7w0F46qs6O0ZAFGGXeFOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=bUUcARBz;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F02C606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F02C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=bUUcARBz
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so7616887a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795629573; x=1796234373; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90/s0j/8y+3kJDj7DR6pgcTmblldR4C2m7/voM9qoFg=;
        b=bUUcARBzIEzz1MTc6U8hbaJeNIUMZIJ3/5qMgsk9kCcTpPi4KOdfWlUuPW94YazrZS
         hMOPu96DIb1CMcRt5FnniVu7qER3szg7EKKgOIUlzT42DjUZ5whJYRRtHKe1LcQwlQeu
         oB9+BkTE0w1id1F7GP61l6uC2yCGOO8zFmWqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629573; x=1796234373;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=90/s0j/8y+3kJDj7DR6pgcTmblldR4C2m7/voM9qoFg=;
        b=CN5bLANFHzYkiuGg6d9rquVUQFguAYyMKqEUDeLaiNFOVitNd/L9oRXjJ+EXA+oWNr
         A/2C+ExqRsBIzcJlrODf7CHDA5fAG7H7+uWEbD+2OcxlU8nY5OzNU04bqyOTSsLVEwnx
         2n4Ka5f9eNDQvOJ0aeXdB+8aSfAABue4lc3gGKM0LXaUnl9ApzRvlVbh6lHbyXTgjrbt
         J+nMxfNQ+dR9YPuH0CpoOQeOfkF9R/oZsmbUB/KUrlKUbs6CQpNHYINDgmerULfNC12K
         p4rD803adWJ/wQG+85BlD3fHzhdiPHg7RjWiOcAJslEUbx9iXZO/+WdoW4muRORYNMsR
         H4Hw==
X-Forwarded-Encrypted: i=1; AL+hErGGReS0jIAyK5XQ5ZoKrWtGiBkLqjPIYWfehGaAcDzZCJcm+Rtdeunp8jEqy/lQu89qyu0P7PANTpZCIWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aIex6AduXtd/l1+hVWxSkBCyfdMSw7uL7e+xqXUhX/trDVfJm
	cVD3GtEEOScjMg3kmcZD82nJf57GrrOYhX1UWLquOLWbVUHik1vK+F6u+Ghu9SQIcNhv4K4mQeA
	Z86jf3gF9Lg==
X-Gm-Gg: AZFdTZek3Xz3hCNhnbxO3LrADsrAS2TmIQbNXNwfeVKtZ7dt9/Ad14sTfEY1NCcoIls
	hwKTGqLEprdIXemKKi7mXxy77ONTzp4WhzMoIJeMMCnWir2FxEoFgIH/XOVgmhh7/igAWu1NJuu
	0yoUDvXS4pcUi6eCfV22pg6F+oZqD36q23XKFev1rvbZwgTSTKzX3TcbxIplmcv17tTD0c0i4ym
	VpSzEarLhmkHXRV8rKNt/Y6A5HCgw2brmoxHxpvz5l/bKG4M7qMqZc8z1VT9LfaVP/Ochr/8GYC
	F+V9O2/Hda6hELlPrh3xOU4wDJd4oF5Q/kX0JFDjNJT+C74nJBpKwnMzsm7Q3xnpfihgDzKXGpQ
	JLqK7SavkibBDt9dKhLV4gJH3IyMl3DRpfLWW0Lpo7dxdTj1Cuz+kwTLQhOVYyPrVAEjki0Ccel
	FY8JzKNl1ZOm/QdHSaAJHP/YHBhBtPouccj02sKU0Mk2c5SYvgFyo3PAhzKxCmSQ9ws8vsuvn26
	bLdaGQzoRtF0NWKVqJsXBvT4QiwFXUbR4fvYafJje5FyqmJO5Je05uos1g6SbYKl004NE9P++Qc
	U1bJOvoDPutP0VtYZzDC/ksKq5KGhzEHTvObyjSqM/2QAeXYadDpaFQttbS18NVlBvIKc+fac9z
	RZC4BnPokxs+P69kBG98Vzb2K
X-Received: by 2002:a05:6402:400f:b0:6b7:37f6:d307 with SMTP id 4fb4d7f45d1cf-6ba37ec45bfmr14410321a12.40.1795629573367;
        Wed, 25 Nov 2026 09:59:33 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm8811626a12.31.2026.11.25.09.59.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 09:59:33 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so1019601166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:59:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHyfFOyoFNQogn+j4UZABF8MXOjrtMJcftEDJKMzO7dN8SnQEKeZ3zmF1qqLsrxU/TPa0KiOWrj1DLCCOE=@vger.kernel.org
X-Received: by 2002:a17:907:940a:b0:c50:94be:22ab with SMTP id
 a640c23a62f3a-c513a805245mr1756514466b.18.1795629572725; Wed, 25 Nov 2026
 09:59:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <awbpOaMZRkKXbq1H@sirena.org.uk> <CAHk-=wgG7RgD-rMiXa9wgirV9ztTLtdg3nj7_X4smR0TEx83aA@mail.gmail.com>
 <674edd30-0087-4341-8a13-3c306583705b@sirena.org.uk> <15549465-a429-4243-af9c-8a26ba497891@sirena.org.uk>
In-Reply-To: <15549465-a429-4243-af9c-8a26ba497891@sirena.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Nov 2026 09:59:16 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9sFHw4pKpMzUaNDAUdtX+xdQU=dmO+AqgSgrRMZf5PQ@mail.gmail.com>
X-Gm-Features: Aa3M54qFsXlpd-VlkrAWP94OJscFHQNa8dj4dknRWf6xdMLThXVEkICQrcNFbiQ
Message-ID: <CAHk-=wj9sFHw4pKpMzUaNDAUdtX+xdQU=dmO+AqgSgrRMZf5PQ@mail.gmail.com>
Subject: Re: linux-next: test failure in the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 at 09:53, Mark Brown <broonie@kernel.org> wrote:
>
> Inspecting the diffs with the various versions and testing quickly I
> think you need:

That looks right.  Except I think the pattern there is that it should
create a nonatomic stub, and activate *that*, and then call that
generic stub from there.

At least going by inode_test_sb_getblk_unmovable_stub()..

But I'll leave this for Ted, since I'm not actually *running* the
tests, so I'll stop making fixes based on what I think the pattern
matching should be.

Ted?

                   Linus
