Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431132;
	b=3e5N22Ru55aXvyKwhh5FeAzg0B5hG2geHCJ9mMLm1NbHp02cuguIyMzNqtecf/1ovVZP
	 mZRvXJxpC0vK7BD8URz3J92jSKdOowF6vkV8R6AHJl7Fc50ADdRWb1PcafoYGEtamFnwP
	 0v/7YjPGeTtxdEJ+5zndZyrFN+UlWBgTTMcfkqGawDcmECvQNEq9CmH+95BvbSi4Bt2V2
	 e2JOrTAH0p1lu6QRFbDole3+OQ5Tc4Vq42RXiRTbcqNN9bnxpYBAwdjP3XZt8yOM+wUwf
	 Yel+vWe2Anx0YiBJNSEoC6KFMOk2biwMkAGet/2cg3NhhkHcBmpkHDFvS19CjHFaHBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431132;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JTasMFBqaRsY15L70Zurue0gD4jVURvqrqPudJvkTBo=;
	b=s80snIKj6X+Sb1WsNjplgVZosET8IFghPWsJwr9JdC2ABANG1JcYPmgb74Xb/M/yRC+S
	 H2cVTsvdJyvzaMx4UN0ikUt0lrfefI2yebXzAQieJgQbGF5bl3M5GJsOVxvcmnW59rDzb
	 Fnl9XtPl1dxuOnT00qkKjUqaJu1HoMtj4ForCxmI7kniShHqSQq+LG+WTg5QMEBUdtKCs
	 pRLCAFgZtIGItFw5R3kVP30jibU/VHHM5oVvfra2nkxLpgxQ/UI2kGCD5OymSb0cCIAoF
	 gAizj5zaiDhN5t034RH5KmMCOZH5hDhiFM3D79Dh2A186N4DB+2+dJNh8qV99n42bAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a2nApcz7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0685606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a2nApcz7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BD21F000C6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795431132;
	bh=JTasMFBqaRsY15L70Zurue0gD4jVURvqrqPudJvkTBo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a2nApcz7STeO6wS0P0aS9GTaZe6RvjXRzXXymZAvyy8LPq27wMZq9uWeRqjAA6Dce
	 y24VRlG+dP08bYKXagwR071bTyblg4lXQppY7QVcEro+Wq47AxRTu0imfqP3esfkcr
	 gJcZvlpUe1x/6asYuANQJrcueBggtHXapfIdQRWE4A/PRTdLOHvLik76UMKu9cRFVC
	 O0LZFWABJqusVvD0gFV4gz4nrv1kNlhajqmhqdYiyRjjWmtvbLu3NzdlCvMjD5WXir
	 ssuqei7AEFvxIEriHeOHJtswFi5GDbcrUHYIXWL6vKrgz18GdK54ViPp2zcNGsmg2F
	 EsV4qtAqo8HoA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so1741956e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:52:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHyWIgWcdLUUK0dRAHwfJ7wG0H8y9oO3U3yd6+YnFTPogzY3GUpqJZnIejn8Th6XrAiDejfFnfgJKlPh/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+px0uL36pJ6YIFRm41IcyCvJjnUtpk4JGGwbbH4CqQ4K14GtsF
	xGbhroACtGNyV00X/G00DdURJupS+Y/kRkseajv24sVm20Z540Yym7TMzTJeGp4S5nZus9xdfBz
	FRfzptPtQ9SaBMxkUhB2/Df3PMIVfDi0=
X-Received: by 2002:a05:6512:1052:b0:5c0:c5e:3d7 with SMTP id
 2adb3069b0e04-5c1bc81d5ffmr3938544e87.52.1795431131102; Mon, 23 Nov 2026
 02:52:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <nh-fc54eb6a-a671-409c-bf5d-51ad5828438e@google.com>
In-Reply-To: <nh-fc54eb6a-a671-409c-bf5d-51ad5828438e@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 11:51:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLmr3v+SV3yvdH98KK9T5vEDyBBWkrw1p-7Sp=KdA8BQYw@mail.gmail.com>
X-Gm-Features: Aa3M54o-0uo7piOi7NSkieIAZ-qhHuki7FyaluWFli9bVB-DlbSxnE8QzXP4K9w
Message-ID: <CAD++jLmr3v+SV3yvdH98KK9T5vEDyBBWkrw1p-7Sp=KdA8BQYw@mail.gmail.com>
Subject: Re: [PATCH] gpio: avoid undersized array bitmap in get fastpath
To: pocj8ur4in@gmail.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kim,

On Sun, Nov 22, 2026 at 5:38=E2=80=AFAM <pocj8ur4in@gmail.com> wrote:

> The array get fast path passes the caller's value bitmap directly to
> get_multiple(). The bitmap is sized for the requested array, but
> providers such as gpio-sim process it for the entire chip. With a
> 128-line chip and a one-line array on a 64-bit kernel, gpio-sim's
> bitmap_replace() reads and writes two words when the caller has
> allocated only one. The second word is accessed even though its mask
> is zero.

Isn't that a problem with gpio-sim that should be fixed there?

Yours,
Linus Walleij
