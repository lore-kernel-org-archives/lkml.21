Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795171758;
	b=FmqQeJFGIX/P21WuF90nr3iBxm8UwT0FWE7aTRRwLfRObfMuN2sywlkHJttftnCh3nN3
	 uPJT0NhcY1WLhCYtK+g65UVtrbKXG/SqV6hkvCenVPvVipiJbjjao1VgUxCZcE3UIKO5M
	 Y3bZAPG3wfFdPcitwNZgqYHVtnYXdX63xrHM/SPZqrLLuqZW7HIzT1nQyGgtrsHTIE8H1
	 vuSedHW3umuTa+u+MLkkaR/T89bRp4UtO7ZCRWHZ1jBh0GjvOGMI4CuQDfKsbPeaGo6pB
	 KyNPsNYATSWKJVFBzZJPyUnoaDunPHyPBO4XjDU+3UlbW9dxyhw9uqGrhhLiXNEEMSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dWYxYowsGCBLSnSh6cLqulqT3GbnJrbr+1e6JgGH388=;
	b=U6Nx7zCmKfG/OkpdSQIzlHg1EKPWbD5vVG0GozKFS78XLDdYt/ueEAJ9dCxIRXnM0dIT
	 26v7FUPh6m8zv04orc9hkvAfCHF8/YkmNI/1F7S4IT3UDkvHMcG1sa59i8JbeK38gcJ/n
	 T455cZsryaP50EUQkjOzM3K5CHE2kuIrTXg5xbzL9Z7x0JOzLUhA25meJ0ds+Q7AbFTvj
	 tf/Kvic+Lv3+gklTNYGebvLV6rvFKx7n9m1O3shkNLuQir0kIxaZP/UAPZeLXPit9b8Tl
	 AH2erAupKFB6sVXxyAK84NRuEYGI4ewJoWpPGfOSpvXnd9cRrG6te5So3rE7z42zjVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PEsZh/YA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1D5606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E1D5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEsZh/YA
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be3dd6f636so68312e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795171756; cv=none;
        d=google.com; s=arc-20260327;
        b=HynSRQvRh9u5+xFFL3+VHYMrmqA3kHKPqPp8IV1+WSOBO2A0OXajpbYv62/vXVVB9E
         Zh/V9Q9J5jZysrjnVfGe+b9ajnxQjIxs5JZRfZOgBHP68vqPwAycEjJ+6rPZ+XUYENW7
         peM96I7q4Vl94tPkENT+DqpT+f+jsVDdqyAA3TAwC3guff8GPoaWlwrvkco63MiK/W1N
         8lmmoedlZJD9JnW2hkErkgspaa36F+JVG8ypafco6luFg2BPC8sqbWAfl4hN/yTP9fET
         2tUDbgI8+Li0Eg6drCvKkwsNejSpp5Eb81hLRWdQZMoBzN5Nj3VfJKs8z84tVS8H3dQy
         wgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dWYxYowsGCBLSnSh6cLqulqT3GbnJrbr+1e6JgGH388=;
        fh=6mGf9ImGcFtXYH1Sc4Hr5tphSC9vKLesnX8dSCOLVoM=;
        b=icO8r7C5o379IlxUW/96UFMTgMQ/86m0vnznaoA1mCXIJjpYo1XhWsRckxI33u0HVN
         6SLWj3BN00WYO2Zys2mRCItkZBwTwqwV2b8bf3lEmxNaH4o6ehu56HrYXkiDifzr6mc3
         B9ky1GimzJ+M4dCT5f10keWQTkN+fa4y3FKUZKXc4pGgsmgWsblNrYmTB8Z87Y3s3iLO
         mR2RPuFVim1y0nTXp0MX79p36A09If3V30rJw67aCLT8oZpV72rAbX3YmHDrYKAswGbI
         FSqdrtaOuWkREm46CjjJAzLwxfY3x+il6gDBM1V6xLGfVQYKsb61ucluDAhcFx7soh66
         wA6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171756; x=1795776556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dWYxYowsGCBLSnSh6cLqulqT3GbnJrbr+1e6JgGH388=;
        b=PEsZh/YAAYQUmMsoLTE0P4DoaYxjX0K0WOe3frsYoTr8l3r+nSK7sMDRX+LpT5WITu
         p5da11rIxNERXMD5GQ7vP5rHjtNAiDvJJ1IP3EaCgCiy+uIEDqg/M3B2qWZu33gr9z2H
         0Ntd3BKnx5dLbi8bNJnC6C/w2cTuMVdfAufG4YrMW6gJs5fkUtJkyKGZOAOEfSGC3URw
         mPL2nagnait/4H97dChQkWFc9nriIUt48kJnZskAOVjsNDXahY1zXAfCtf4wIzRSv1E2
         cn8ohWhoG0vQTsgDCFFyQQQuVWTfYzneroC/a9LhzXB34Z6ONgKLPfSMXLK8FB3frR1y
         T3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171756; x=1795776556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWYxYowsGCBLSnSh6cLqulqT3GbnJrbr+1e6JgGH388=;
        b=MBK/u2DsmXYcNYAZ6EfCLHQsDeFppoX7kdq4rpwW//d46iMmKhUw5xq2Un820MGb60
         lchW/ZgMhQxHXtB9XFZGmBZviMdJdg6tFO6EeS9JRHdwclU0JkCkGZroPsalOOaGBYHe
         DOEs62vh50Y5cPjzNRC3NMR747e3ONwuli4OyadaY0He/POeM++Jd+W+FxEgRJAZPKwY
         aHhTeQjE3mSwXK6uM32QadvLDhypKzaG7nKW5L7Jvxs6c3Wp9IG/3NGOgMDmA1Lilecq
         AC7WwxhtPnIRVuRy5Zar/Okv7BnGaCwUXrpYrrXgMKr3y1igg0CgWOhpbCzC7CghKOpH
         LnAA==
X-Forwarded-Encrypted: i=1; AL+hErH7fudioJnqLHLGCS/Xo23Qb5SQ947UhyaT8Ob2IutJ6GB9M1TVhioVIZw0LPOTvNRxDoVLOixRyFJ0Srs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZgmRFNKrzu2al3bif1MSm9qbZeARd3dgL0YSDME+O+4lk0WIf
	UxxSA+owTL4zEc9W/voYf63y5ZZRqZkna1i7USkYAAM1VuaNQJEvv6kXZ+j+n8HuZsIOkndA+NY
	TZAJKbjNvoG3/lH/UDAaYBvaH7H9+MbE=
X-Gm-Gg: AZFdTZfRoUcjWb2pPmuSxj8s/PxXDXR56SRj+Y0WQZYYQIcl9yKjvhK4BO1Kt+8Gzqv
	cXbkQDvq1oeuAwNTnO5RU5xCDs5uyWQuT9IwdlGXG9vm0yP1t9ZKQMcrkuQiLydi9ZwUMsXS1HF
	pG3xWGWe9haHfQEHOVY4tKPmz+CZhOhaGwT6gc53uGS2199DqvNfbhVnTB8hTx+kU4v8OBt06tR
	kgjxwvQMHS59Cg8enMpFu6Uyx+19bJ1XpJ2q58EzDuusCzJFvRQIpgqTmzp2NM62p5t0t+YLNL3
	OEE8tnfXIzHVo1inHjRogCVj4Fxi1HtXXuyOXxbyEan9cDEPCjjMyksBTZmQsnA/iIH/DosfHde
	9RflWmfOZE+LlMjY2bzN8M/75lvVzWd/JnNzDT+VsLML+dLXDQGYRPxvAQBBLIXgSkwo1ediSdT
	E4CHY3+Pnn00mRhnw30I6J+j2Ew482ThSdCOzrUn3N86VZ4qvz+zDp63MZ3x7jsNi4Ij+rd6II8
	VZnXd9428VDxZgeZYaWEmD2O/xjsygDPpfL3NJRoZFD1h11sQuPkh9Porg8YTCqNt8aE5hC
X-Received: by 2002:a05:6512:31c3:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c1bc76a33fmr1167983e87.2.1795171756051; Fri, 20 Nov 2026
 02:49:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-fix-rust-build-error-modversions-v2-1-1c2271cbcab5@gmail.com>
In-Reply-To: <20261119-fix-rust-build-error-modversions-v2-1-1c2271cbcab5@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 11:49:04 +0100
X-Gm-Features: Aa3M54qW6il0gb-hxlX-Nj8ioiKgQABk89cMHbmkyFDNFAXmsl_FtiHnKL79t1w
Message-ID: <CANiq72=vz2D7XYNEHmAnbh5iTJ6T_qtSV3bosQrB8HOYsBXtzA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kbuild: generate a symbol version for rust_build_error
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Matthew Maurer <mmaurer@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 11:19=E2=80=AFAM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> - Omit Sami's v1 Reviewed-by because v2 changes incremental rebuild behav=
ior.

I guess Sami is still OK with it, given it is a subset of the previous
patch and the core part of it.

But I will wait for his confirmation -- this one is not urgent.

Thanks for the patch!

Cheers,
Miguel
