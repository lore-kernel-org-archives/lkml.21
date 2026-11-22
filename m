Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795347516;
	b=S1xr8n5E7bp9lwDvUf+RZ+TpxNBPJxDAhcPrkwAzcF4uPP6hfDp9eNwFaFlr5CsvjpCg
	 BM7P5LyVNmqhuxK2MbpwLF0dlSvvWl/jPSNxpep5SCBDrH8HSLHOWuxsyTP4SYSxTEI9H
	 X+gjLbw8J+AN5gbvAb/5UYB24BTCJqGjkZUyBoC1n4l8HqxCJAfwYrfkEUDEYKg9zM+It
	 1KRbyCjWOHUNJsHKntLoUSo4ce30Sv475mjgduGQvm3i423FjSfjb75VrDFHC1k5r0DMo
	 KMSQDKUIcmdMIS7vdVuh6Y3Zp15IZoXPPKTKMvnKoGSD/QD6C7GyQA4pMwScBwzAteg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YVm0atOhjR9nDOLlJ4gPFa6rcD+/4hLxU/xQnQlbIes=;
	b=WkPuo/WnNAEZyMf4pQIpLCo1rjGlYEtqicYX+k59/efcljjyVGBqdURdXB2IKRDiB+Sp
	 znvZ5cw0HdervbA3k5bMOyWhfP7FcZzU33+GORIaR++Xnxsrf9oQeSZHNJkChFFM8rSAK
	 8RSXbU+pgPg/Csm5d27+3jWXccN0h3wZL2pI0XauDGqDDD5vXBsQIH6OEXjr0IsF6NOAF
	 MPpOQuZQZ25XXF1U+CYXjmXiSLfIU7RAVcY8zmhs1GtbUhMwJyfDPCKsoxeb4NPtVykaY
	 cyoVCjNJtkggONNlgOHo53S+HVSl5gWbKSsbq4aCxXJdlBz9Jpl4wIgQzFp+bm16abQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHLwRXTv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1DE606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B1DE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHLwRXTv
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3dd6f636so191242e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:38:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795347514; cv=none;
        d=google.com; s=arc-20260327;
        b=YAYSxJZEtfN7bWclzwBWaQARU+CSG4jLio34mlg9vqIRsAh8oek3pPHZ5i/zxp9+Ze
         S0nLiK7+S2notr98D/Pgs9RzuNPmGnAeF8mXch/Vto/wAwbR3AniGWtylCv92nU/45pd
         kEQIhR15HoE0HFBrJ2zLdrnyLGEu8qphZSILLvbNCGl4IAw1OJEyXaKb9pl3yNfOHs1E
         EYGhYV/30bip8vGQbER2Phi1fpT45FH5jcpi9rZutQR5YZDk/melA/5oZwKTdp9pT14h
         HfU4AVQo9e5y6C3pM5HJdPPqAzkkdOcQmGbIH01mbhm3SkATXU066nbFesbOC6nCmzOM
         jCHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YVm0atOhjR9nDOLlJ4gPFa6rcD+/4hLxU/xQnQlbIes=;
        fh=TzjZ2vYjDCFmljgEMA3SQox6xjop5eiG7Zml/ht4alo=;
        b=qep0KnQzYh4qCc5yF+Ah4xQFeIGXfVRU1vGrO/BoQiJM96OFKSJ0J2O4nmGxazm9vl
         xtWdsyxy2K0MsYykeS/0F2K/H+aViPNOsmzLkDBWF05NowinETdFQxJks4K4auQmMge5
         XXyDXT8ngdZYphrcv1YG1bgwGHrRaL+tUvgJX9AKEQY5UB1BWIcqVgWKrgsfVVMX8S5U
         vF/zyOOHkBoWDjdfq3U1kjchL4T5PX3tPPGislQdhM3kGdMKg9Cz2smhysWIxhjXvEft
         Ietcf3zb8tGyJQgtPNSM5NK4PYyM1dqPfP7oRSDYVxjS9u1eO7tGfJ85V44sbKAi5jEF
         Xwsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795347514; x=1795952314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YVm0atOhjR9nDOLlJ4gPFa6rcD+/4hLxU/xQnQlbIes=;
        b=xHLwRXTvIHOPiGdyOWAJZFVHXZ2zx9COFpOESqj/4DrI4UR32A5Zd1mLYswGv75WZ4
         nsZ4hYcHsCj4EfnxB3iaxLBSBkZ1VZBYmwH5S7Cq73q8HtBoCDQc1jiQvkYzTX+AGfRg
         NnlAYleyKH3HGWTnph7hRYGbt5khCdOYTPo0kq+QI9jzCS1ACJlhjphZBlhukDCnVoRC
         cWUTw77cC5R/+S9cvmguAITuS6HRxDofpAYoWWWoMr98EvtAAVSpiElztF5iOBmPdUGy
         XpoQweGZXljH0GjAwvN4cg+iFcqOPrLJIKwcSUqSOUvci9zXjj562KDDIrdqwEQtrPKg
         37Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347514; x=1795952314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVm0atOhjR9nDOLlJ4gPFa6rcD+/4hLxU/xQnQlbIes=;
        b=rp8pr8hOQcyEqtwbIWVi/wLy6pQ/+DTlUTCk5ndob7rbV9LQ7PARJtezPbyZowW3A+
         oxIh8GcC3S9hJk5GiVq9AVpwWC0dMS9RLyN/eWn+qjHKjT8cUV4LkX66dgQUTq5hkf3b
         mIKC98TuDMo0L4sBKjqn1d0cnXNtWIrTZR8qAaN/X70oCMljO3TErKupSqXjeaCHF3FA
         xS95avOa4W/nT6vEBG9lBiHepy5qW6yEj5ERrLbGatbU1+/Eqv83jKqyxPiJoRIdSs8R
         vsnyivv8qpWyFPuQWjDPeOIEf19T/49lSvOkEE8LarOyjQfwwUxzbvGiipIzVKez9LR0
         uBzQ==
X-Forwarded-Encrypted: i=1; AL+hErHhfomOr+a8cozDm95z4AiJ2HnqoogHu4ElCWcf6CwM6zPM68KOzM1HqLx1rSU1Eu32G7GXq8ilDfc9rU0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UcY24ZY/v4tUnualLE5nlTcw5KmDJS+F8s1KwKcoJ5JPJbjM/
	Z9IXT581iB+o3/ATEsw4n4cNnQX5tHLfHpJbaObJoiwn+tUKpU7BER+/SMZExaEustVjavlAkzU
	fDi9AFmwnKdBWXE7qJyNnKNfGusq+H5g=
X-Gm-Gg: AZFdTZfIEm9kWahX1PsbQq3a1OD8dV0J6kdjzGrSCu87CgAliPjEh/rDS/etJAu0niZ
	mvLUtys/YGpbm3ShZQpIJYtznAv+L3LjbJMfEn2LmU0IV1IedNrG416PUFfFd9VFPkfzh7xpaim
	Ij5TeRRkur4qch3AURMMhkiz4BO7/XNuTuyf2XVpqgSS4hO+Bb1gEIzFMo2rZI/XAcEJmlng3KR
	UxP2Hns7+5qOtLXhjg2+5bzaJEYvU3eh1+hg6YBz74xEkc+Fe3gKriybFpeRH1PDH6+I4jlw6X7
	2jDB9FZr00aSd5uE6u0ABtM4EN72YAezj1GTgQOM76HBgEhzoiQhjWQahKhp4D5nW447hnvoTGn
	1tWOj2PXdgNE61v5H6fTAkvyh7TBXwmnbziYpW7G9acmIYtEqe1WiwmCD7Fjt9R4G6Eb8/d3wwl
	vwiQ9BOUKCZY22N/ybocF8c1F6bxCPAgQi2mVgiYOISoH1tLBxmxGcwG9aojCgSmEnGBd6q0tPT
	rUFcDNHWZfPj0PPc/c4VJIQ6QFqfJDK1XoOLkTTNuDML3dU55+HnYXMKoc+gp4UgBKwyusD
X-Received: by 2002:a05:6512:31c3:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c1bc76a33fmr3371052e87.2.1795347514504; Sun, 22 Nov 2026
 03:38:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-rust-helper-namespace-v1-1-3b9a05553ff6@gmail.com>
 <CANiq72kWXzP1SWUvhOT2k-rNjopnySXeBkjwrx63V2QUaLpnGQ@mail.gmail.com> <nh-eaa5d67e-6d05-468f-9f19-273bc5b23ad0@google.com>
In-Reply-To: <nh-eaa5d67e-6d05-468f-9f19-273bc5b23ad0@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Nov 2026 12:38:22 +0100
X-Gm-Features: Aa3M54ofQVSiRzi-fgoVKnLP0jYbT_Rm3zSkFfSi2xtBRiBz58W07aP7BMXi-VY
Message-ID: <CANiq72mTs=_4wSHAjCJNdOcmODHzPf0ELY6t6vqCNt2E--XYaw@mail.gmail.com>
Subject: Re: [PATCH] rust: put C helper exports in a dedicated namespace
To: peder.bergan@gmail.com
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, mcgrof@kernel.org, petr.pavlu@suse.com, 
	da.gomez@kernel.org, samitolvanen@google.com, atomlin@atomlin.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, wedsonaf@gmail.com, gprocida@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 6:50=E2=80=AFPM <peder.bergan@gmail.com> wrote:
>
> 1. Would you prefer I wait for Giuliano's series to land or send v3
>    with it listed as a prerequisite?

Either way is fine, i.e. in general you can send patches that are
conditional to other patches (within reason, of course).

> 2. Should I keep the KASAN import for v3 or move automatic imports
>    into modpost in this series?
> 3. If you prefer modpost, should it add the import only when a module
>    contains a Rust object and references a RUST_HELPERS export?

If the `modpost` approach (or similar) works, then I was thinking it
may not need the manual imports, i.e. the idea is to avoid having to
write those manual annotations if the automatic way can figure it out
when to add it. But I didn't actually try it -- maybe I am missing
something.

Thanks!

Cheers,
Miguel
