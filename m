Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020725;
	b=EnpQXOWMsB5KnyojlXTKsVNeuHBxfINyqPIB/QIk0Wb0yoZYF94sAtEtJCqE229Z0lag
	 +/5+nwnJDTqFVRWJkTmrSclbCtsD7XJ3Fi0odQovjO5RC3pCPr30P1UC6eb6GEFeUcu5p
	 1GRIVrh1vIZ1WUvrl5+BC+rWr2s9giE8cdH2HLXnzy9lelx1N7MP+JK6avS22lthNh16f
	 SLvxhqrvCtaRuLxHtdPc4hoBO0ufWxF+MgoxH/LPr9psVkRDmmvQXmwQaqQj+sxvIijdC
	 cSRmkAclaC9cGFRUbWTd6IOgoCelvYpXtgnb5eOr0HxQGaqegxGw0a60USRcWSIeucQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lp+PumDUYSckbLI7kydkOXPsLnRNnUF1SFah0ZOKP64=;
	b=iE0ePiiE3UFQEG7uKv76M4HsZZV4iPdC9NL4c1l+aE6CnF9nZuNFLKnbN0Yq+yh5p5d/
	 Dm/GYFF+ebYc0srNrir5by3Vm0vo6sB3E847khWTMHcxfD6bfUmA0Bkxz6Q3CqokST2Ia
	 GwkiolGU9n7Zx3cC55eUFMFjlzk+jmA20Sj64IjKENOpx5kKPKAyLtkWY5Ic/j6+MjQY+
	 YdoA4Y7dEAbOhn0cNdKfL5TF4j4glmjSOKYn9X+yQRkjBbY1gVCqq6OHMXh4Ml8PVPwyE
	 CUnT4atDGjXlYD0b1Ydeq16rLV7gIeOg885Jm7U4lzBgsm/tCJFe248a89OpGufIEtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hkSUkuYf;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D23606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1D23606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hkSUkuYf
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b86fcbd647so1332a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795020723; x=1795625523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lp+PumDUYSckbLI7kydkOXPsLnRNnUF1SFah0ZOKP64=;
        b=hkSUkuYfsSxUt8OGbxlorOgbYeDkX4DFE6J7VVv1Ehx/gvgPqSQuAho+n/zI43cnMD
         QAYBkNaVi5wKvHLUGzS56b0YEm04OuMUWGVl4JubrvgzhjIt+yKRzNlsufnChR207r3p
         v5dtyza6WgzJQWVvSHYENj2VyXdUn78OQPLO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020723; x=1795625523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lp+PumDUYSckbLI7kydkOXPsLnRNnUF1SFah0ZOKP64=;
        b=WOvPoaZ3cggAgKhloOa8BMO6074B6Yn//6L/UPWljlJGDQZiBqKTyK6h5fCIvMJL4P
         MDyYB6ysT22VgMwvvMAoaatyh2pcuqlLAL0oA3j/SqYl7K5hdKYBgRQAhQP+3ad9lSo3
         UCmY8qwO9Z3nsD/qD0KRK9+MWfTIOyXVNzmp8YLCPOu9f+F1evGXldlcBP1YYQsyulF2
         wTWLmLJp6PMUNbC5cT/EK7Te2CYzJSne04qm5sTF1m39JrO8Rbg/LhcIJQOACT4/1bHP
         DmgRp7a9yQnKxv3StVw+eOKnqSCah9tB42BOTQ3TQRW6UaYXOaM1/JwOMwS8hghziJwq
         qJ0w==
X-Forwarded-Encrypted: i=1; AL+hErE2WFJVMJBA4ldc8YH6rwK3fX4RscquFRo7k/Ns+R5euOnzTxdIByrXsXi4TjQxHsfKzrB0ZOh9wwjjxKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z7yD3WOLcUmZLdaT/XimpI41Cun/AjMwb5oTnsEpu+FfJf0u2
	aHOLz+R4TN+0k06UTWWEug7JHgNQTKmp7lJ11cgG3E+DPv3KFd1qcNvAWTzUZFIUsbE2m90Zjba
	j0jJgXnz6
X-Gm-Gg: AYBFou3+sko2i2jw1pP18DOE2FaFXyBhu6qQsPGWC6GfFC2n858jB59ZVHdSnAGmQAT
	Jcrri4qqNUk4Ze40cZRshTnBorjnwZkoRp1FLP5AO7EZs6vDWrRWXtxMosIPcIF/Y9EunOA1zVq
	KpMpOixupZ5RcrLL8tL7bJFffG6Su2FP6v73Uq4hFLcvYS/sgM4oxU9snjvznlDYgRC3a2zyZa3
	vZj9m4BuF9WyF4n8+Zrw13DWe6zS+yDhO7fwd9HBqaIkBm5Zc+G/fkUIAo1uswGzkVzFAiIE99S
	0e+RrGG2CGSfRzBuAzk9atnClGWiqCnuKAMd0vVAHWLX5pgECHzZZOiCMXjQK0qx9MRzSXuTSrW
	hP4YIgBn3pEiPKTx7h1iD3rXjtElGkXnnt4qtGw1fnTJ6dIU6qn97rr54gkV3psj7WlW8KNK68K
	ERToJ9ta7bFrk71GtXldjf0wxEFkzMUmeQM/5vih/edfj+tMpUiJCKsAPv9sO3ntLcVzxQXcUuO
	VNeySVrPDn8XH0pHS45cZgQHtD29nYUFkniKU4BA7q1xfx4HJ8jVxkMjCSUuO/hR64Wv9Hbehj0
	rDciCnD1fcsluTrFtK5104RCNQqJ6yrx4mKTX0pKHgqrZ1VUm1sKoSW0Z8JcfJfFui4B
X-Received: by 2002:a05:6402:c1dc:b0:6b4:8d5c:f8b with SMTP id 4fb4d7f45d1cf-6b9b296b9d4mr7283a12.15.1795020722824;
        Wed, 18 Nov 2026 08:52:02 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b8a6fba034sm677715a12.30.2026.11.18.08.52.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:52:02 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490f38e9688so10091f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:52:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHuQK1RemdB8w/Fg6bYOCEihGBi3oJxyoonGP71EQvksl7GNoJwE9AO6TuzkzMESt16i3iu7NKZ247p6NE=@vger.kernel.org
X-Received: by 2002:a05:6000:4212:b0:498:364d:7509 with SMTP id
 ffacd0b85a97d-4a8ee39ac6fmr44021f8f.24.1795020720874; Wed, 18 Nov 2026
 08:52:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118072853.1578323-1-a.kazinsky@ideco.ru>
In-Reply-To: <20261118072853.1578323-1-a.kazinsky@ideco.ru>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 18 Nov 2026 08:51:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W5MJMfjYvaW+5y+SwSXiNSGoMyJGWKVyGyQJU33+1QRg@mail.gmail.com>
X-Gm-Features: Aa3M54rw4QWacAhRxyIy-HlXKopfZ8-xwOmR9x3eFc-lDVUcxQsDNdYLgHWCWl0
Message-ID: <CAD=FV=W5MJMfjYvaW+5y+SwSXiNSGoMyJGWKVyGyQJU33+1QRg@mail.gmail.com>
Subject: Re: [PATCH v2] kdb: Reject non-positive BYTESPERWORD before division
To: Alex Kazinsky <a.kazinsky@ideco.ru>
Cc: Daniel Thompson <danielt@kernel.org>, Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tim Bird <tim.bird@sony.com>, 
	Martin Hicks <mort@sgi.com>, kgdb-bugreport@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 17, 2026 at 11:29=E2=80=AFPM Alex Kazinsky <a.kazinsky@ideco.ru=
> wrote:
>
> kdb_md() uses BYTESPERWORD as a divisor when calculating the initial
> repeat count, before validating the word width. A zero width causes a
> division by zero. kdbgetintenv() also casts an unsigned long to int,
> so the resulting width can be negative. If the width is -1 and the
> scaled count is INT_MIN, the quotient overflows and raises a divide
> error on x86.
>
> Return KDB_BADWIDTH for non-positive widths before calculating the
> repeat count.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE static
> analysis tool.
>
> Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>
> ---
> v1: https://lore.kernel.org/all/20261113111152.4190309-1-a.kazinsky@ideco=
.ru/
>
> Changes in v2:
> - Reject negative BYTESPERWORD values as well as zero.
> - Explain the signed division overflow in the commit message.
>
>  kernel/debug/kdb/kdb_main.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
