Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795200360;
	b=VTT3hqKRksiFTN5ITCmRugeIwf19DDwv/FN4w3ZK8YPkKM//VHK+yJzIJiLaOudcU7yz
	 3gcr3ucJ6hHDhuAff16/6f0aBSIytms6s5R6lV67g3Oyh6T4HgPccoSeHDdhLlf6fdjDC
	 y4QIepTy75FVvxRCZ0O6EHqLeKDXv21/JievFNK6lsN792mE53BQFBRLx42EJACLz/8ek
	 Kz6TI2dW3QylwyATOMYHVf+ai/EWUrpljVBSrOYN7xbJ/YWbBWaOWEoG+dCgXo01NdhRn
	 F9DlEisgebKHZtLGbxgMtuzgYhuM5KMNwgw69PAbSD9nDR0LjG5RVe8Bl80JL5gwsEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ab2WKF3CNXfTZyz9NKW9q3y1iw74bqSwUakeNqE+vmY=;
	b=mpS5bKVmlBq8n2Wthz7mapx6/i2zBKZshnORyy7T8IN2XjAbCctWvNGynq0Bux8i5IYk
	 AbdwqmMa33gymQN4XwrI1xGVCrabd7L1kn5u0v9H7OKAE4u+df/lQeumu5qK2aEFrldob
	 TNDGbn7qhMQ4ayyqr+tzuzOgc9MqI3n7IMwP+oPaPaiYXiqakZwczS++obzeLKTa9N8mR
	 xE2KYlSnXtG/Jr0cPfAUSxAbowUg0NrRaALipaonIC8K2unj2O0AA6UchM862SBu9tG8U
	 tswOp1TJf4/dlRwrccE1XCw3zYlDcpOGKAlssei/+7+04Px2/+23dp8cLRmiPv0lW7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdteQVP1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0B060A2618
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C0B060A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdteQVP1
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c09e2ed679so88231e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795200358; cv=none;
        d=google.com; s=arc-20260327;
        b=Ym88GEpV1f3A0SIEHu8k67DZdeVgpNVWh1TV2VT3ADMqR2CQnXGYymMSYLXV2/i5wv
         HXFvnJQ+Hnfr/eWQTBNaTC6SPGNRTayOBVva3lFjiFkaokpoTWaczJfcntCMa4SM0X+z
         24O1sa3RZu2FK/S21/eCXvRyRAPd+VBXyOgfJ7ueIg0sGCat1ksXF9mII50HCcsM6M3T
         XftSGAz8bHplXCU9S35CbUzQkq+nyKD9SqVXIzj0mPGzH4z9cFglkXHCIExrknh6/VcM
         cxyUxBTQvDQOKyXMHLRJhO+1tprkID+SdIPYbKUANQE6PRplId0j+/Gwb5fTlJRWXad4
         5ncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ab2WKF3CNXfTZyz9NKW9q3y1iw74bqSwUakeNqE+vmY=;
        fh=3bT+05UwivSsqcrWKMbtVb7HVixQ2oUt+v+lwKJ8fJw=;
        b=ATGohR6ldLHCExg7g1mFrQwjbD43rVCuGocaJu1SeSri8+tj1LTVG7EFy78CHDyum8
         fYFjcVIGz1D3XCJOqE5lICtO7GngHTUE1UkbPRunMLbXf+QxZ35mJeE/Ku7qABh0wVSE
         GhG5bWtJ6/hrKsItHORiqFoV10H2Vk+3h/y5MPGhLRojhhMS+d+a5gpB/Zf3Q7i+NH2p
         GxjKHlGz9/VHLzWGVXVDfUoSC81jQrFq+0tVMCStnRcJAf0xeqObNutD/BSwHOGV8Ud0
         K7FJyLAqOoOfydHslRERnCEX019st8QR94aps1DkQ1YyzcmGilMyAoKQms630NOGCBDr
         azlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795200358; x=1795805158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ab2WKF3CNXfTZyz9NKW9q3y1iw74bqSwUakeNqE+vmY=;
        b=SdteQVP1wc2aLcSPJpfhAs2JNsXpmBQ9M/W0fC6nfx4jAi3L/wN5a1DQoAgTrBmUWO
         YjwLD50NzGAjhzpLi49S1SRUPhWLsyFFzC7H7dNTa+hcrx11MLyHD+pBvcjQNu4vnD6o
         xuf4VmcE6Dokv4P1ilTOYNLqY7EnNSeYiiFtYWeYJWiDoZ7Uq+kWdDQZDczzkSqd1JoK
         knz+e5UbF0T4zMegfyUXCb8LdiIVYViGseG3afbyJntiun5eGJKtCjLs8J4QPUznZDFt
         5MTP6WzTyOdgaH59YcicLtjwBWhkCxAy/AcdbzL+Ks4kMxSsb08uzA2F59pr3B6Qm9MX
         LkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200358; x=1795805158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ab2WKF3CNXfTZyz9NKW9q3y1iw74bqSwUakeNqE+vmY=;
        b=miJvflVkrdvuBJj2x6qfi9BRuLuQv5ry1RElU6yozQGEwhjsLLmW489M/MfUflPh3v
         27tEtf++xVPvzwEJiKuhQc3JJZdxHFxmZymeZhtkNfwWTCSJoSNW8HhxEH91GjCLZZOV
         Hhd2MkK6IsJnZMsx662ZgDGFMUcz+lHRFs9tQwwglUopyhSs41iuXVG0nLPXQEXlYGMS
         gQ+LetmTmdj4ykYH+USJiCp23+OGFdT93YstOLKAPsrNSnUJZp6B2rjAiCryFk+HKeH6
         Ym51Xo1CAyyAfUhC8TT1m+GGn+uhco8Cz+ymBG+y1BK0RNx/9Xe+VhbPMczySsuEIbQ/
         1mFw==
X-Forwarded-Encrypted: i=1; AL+hErHz0XTMzHIEmOWxtINIrSyOW8rjJpYQftkj7T4GFHQ6GWlrWuPT90uL86sCpJix/fiNv3S7E400Vemt9kE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HUy/hdqRVxcigjiyGrLqTduXKRUoBK9GXcjz/o0YubX8U2wum
	htru8+81918JZVDC8VQ2qIDPcM5KJ2vzAHr9GiDbjqMZ2i2EGFtCg6NAMZOTcYjKKSzZib88KKN
	kQZ02GCLfHvP6LxqcfX7iStjZM6ccJGQ=
X-Gm-Gg: AZFdTZcVPNc+3SvgxFxkwn4/oceIYMs9MwcoPTlj8yM29EEPqvP4teDSd55Y4FgCdEl
	2ZU3M2ifVeDp+Nz0x6RaJD5uJslrSl2e6DZ3noxwSu8hJ/EIVEwLEs4bqkOj+/CKpSKxaCMAgE4
	OlLLjOyQB71oaVuhMghnVR6xqBVnn5qCS2N1YjCWBtIgdh6uuGLf69gZGbsYA6siCxrtmUqrsPf
	pJPaAZQsPHtjNGnaCxEJf0hrKHb2wdfCzWWYEnisOk2AUy1aVNH3LdJmqAELyvV6+Et88gmfMKj
	ICc4G8JqPCTryNONuHTri+rqPMZT0k2WzKSnjCxvYeFZzTR4wgA5JfdUG3CZlq5R5WdzHyUtzEo
	joeklMEKea0ymcUcT/TzbYooSEf1CTimGHT+hqp1VdsIRKzjc28AV2rjwWrUmIEtUXRT9AS1895
	+i48gjTA1rqZhGClYt4NqygyeZ3BFs/Yw0KWcuzuv7dcgKTFyWH31QimD074VJzsLOmX7PEGs/q
	ag1Gh8NLokTFdi/ojPUT3v1sEmVrXrRFxHlngH9vYPF8m44f7CfCStNtwQ5bKI9y3m6xNzb
X-Received: by 2002:a05:6512:1394:b0:5c0:da9:407b with SMTP id
 2adb3069b0e04-5c1bc8722ffmr1605187e87.5.1795200357287; Fri, 20 Nov 2026
 10:45:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-dev-project-vis-v1-0-2a5f433bb516@garyguo.net>
 <20261118-dev-project-vis-v1-1-2a5f433bb516@garyguo.net> <CANiq72nNX41q_ZLOUUbyPmPownON1uxCLh=RXsVGBjFmoWhSBg@mail.gmail.com>
 <DN05W9TA9SKZ.172IM0Q6N4DDW@garyguo.net>
In-Reply-To: <DN05W9TA9SKZ.172IM0Q6N4DDW@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 19:45:45 +0100
X-Gm-Features: Aa3M54pg1aTmmRQX6L9Zt-MrnOUgIeFO2A5VFJcAoQAyNOHHDn1bRTNs_uU1yMQ
Message-ID: <CANiq72nAyQjoEuGiqHdtrOBLHvZTN8S1Ae8O-EAUQ9qghFaPeA@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: pin-init: internal: allow `clippy::large_unopt_stack_frames`
To: Gary Guo <gary@garyguo.net>
Cc: Gary Guo <gary@kernel.org>, Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:34=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Do you think this is worth taking through rust-fixes, or are you okay wit=
h this
> landing via pin-init-next?

It is nightly-only unless I am missing something, so pin-init-next is
good (and given Linus doesn't want less important fixes nowadays
during -rcs, probably it would be best to avoid it there anyway).

Thanks!

Cheers,
Miguel
