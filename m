Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795178006;
	b=E3An2qXYgU/+M6EMzf5MdqCvz0EK8SIikl2yCtu7SS4I7RVGtMUhyLadYuInpyQHuFJO
	 nhdRqtNCeNdSW6GDeaeFEsvV2qqXrl1YT7s1BtbQbLDAoc82aiP2Xh4SGJzVizBLBGPBo
	 1hlrYN8cgnt3+PSAXyimNz0ixBWGibZjL3JOkDmEvvxug4Xpn7yOeTkiPiu0bwEXWiQZf
	 kgP9Lc6YxdzZgYhnsbswgUy45N8LKw5lFMapdTCmrZxVldqGtL5+EghY/59DRGv2o4FhQ
	 6iYE8azSbcdFK+CFlchBzi2V456RnbpG8Hzcy5h4QdBLN4N9ckAWcMdBsxDJjK8MM4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j+vUQCRNRqxQSsZrwSUmTir7hqig5h2JdmSySrlx/1I=;
	b=ssolszd3qE9whrOVa4Yf/LvDbOXV6pD3R7oVJwCykLdsUEU5d3GJMyIy0QjyLw7Ct2Fl
	 fPX4Cz4bbSNrb8HpXqXqmTyiJFeWMxwzZWGTwVTO42xyGkVyZRAmAViMVQWa0D5uI5KqN
	 3nx477dF9bqHfLEHi+fO6dFdljDCtGOA58V1B2R6Vbll+BVLC6BgZU6EQCbuSGOGn/1O/
	 lQIHSyDxFs9k1b4DKgOewtcH3skDhBtVfFxLU7lHqqgp5G/P5Djda+xj2Uu7TQYuXWqID
	 V9R6ttMhpotiVgW9bvolCwmw8iHNttFXMDtohPd13rt5qkf09/yPv0Nx/EtMWRX7hxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R7ajZ/Ny";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3767606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3767606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7ajZ/Ny
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c1acfdb638so61370e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:33:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795178004; cv=none;
        d=google.com; s=arc-20260327;
        b=k3pIg0C99KkTyZ1wd1f0Lh/6muh3f3EKflXR7C/Xo1OX7vj38HihdediLk9nJElxnR
         2i1IDI9BRyau3Rrc/51YhOpsWEBbdb7VFa3E+YA2qhENKI6NTcg+wqD8ImsiQjFUN+Ni
         DDcMTsaCQA6lD7a2FdF0mtPyH+cFwY8rocj9gZx3NU9WlOlinTEKP0ZpSnUv2MvpdFCJ
         Of5SWqDGih/MHhn/W/Ys3tUM22AYBRYyRExnNyWCnA5n4UWldWavnXK+iv94EODKXSN7
         Fiobe+pEz3w8fwsDX1BDlDlFNh8YNHxcduuEbfVabTP6WK0ChY0AfV5GX5eUb6lpJjMp
         tmxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j+vUQCRNRqxQSsZrwSUmTir7hqig5h2JdmSySrlx/1I=;
        fh=MBJKk82qFyM4sSY7BfabfT/ph9/r6yzhg1rz5bG7Dis=;
        b=qZzukjPS+zG+l4iuR8VZcLOovGymT0rRYASinmOocZUW90bs+0wAiv/9JAOsh05KZw
         bfEXeIA3DWrRscZ8hVcFRqoJtw7GDSc6+dgM50zO3mMATHSUmjIngfFcqErgvks+qRiM
         09+bwyKJRHkz4bLupibX5HQGFOMIdX2Mfj7ceQ6O0fcSwEILv4o2OLQxXfZ4nSXbD+N8
         IY3p7S+01zZWgxpgK/OzMWVv5DlCEYpis00FMzBKBRwIxfDDm9H0GdYH83M/cvgmqFjd
         nQ3TqtJ3hkMcpTaoUKB6b7DHJAAgtfomTHMdZuzGNNTrLkneCrMy5ddDoxc2Z5e2vAyL
         MFzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795178004; x=1795782804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j+vUQCRNRqxQSsZrwSUmTir7hqig5h2JdmSySrlx/1I=;
        b=R7ajZ/Nyrs6M44d02sCTDsIOFIuUW6eSVO0MuT8I23JlaGQdgMCJW9jTk0POTtozTZ
         nTEtr2ZVZIQuLdbDUcxrAtyHgU202PYla1vbh63PZKBr3++Bg4E5RBzlrUiIeGv8aZ7b
         m+UD+sQlZokl3oZhxxYM8iCWhoNSL8uVn9/K6nQmdd4uJn490QFfJd6Gd28mDZ3VYhx8
         APxb4xwqObwynjiEAEgmpeierUqpo8nop6oI5vxJfaA+3jIffLD1MKb3s6WStoARjyBm
         ZBHbs2bGuv4027YzoSrAawl4PPj3Nq3Dp8Ne8Tfa/HzxynTAATI4eahcIl8Hl/Hysr8U
         imyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178004; x=1795782804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+vUQCRNRqxQSsZrwSUmTir7hqig5h2JdmSySrlx/1I=;
        b=N/34eMaJkBJ1VGgikuZDjvhcqUgAd17WvhHXpmrb9OmJqAzEn6vISjhK0iTtUywAFx
         O7aGyEGs24AhLdDsGAbZvZR0NYrSugH/sSChGcUkgnIBZJlszuRfTqmSGKEJycbTpqr1
         O5eCEcwBos6LXDOAlRedeeXG4W4aH2l5sELoQHm0xKGhDw6O6wNR4PRl/OkbJZ8OtZwH
         MC9QYB4mDKjI8Q6RHC/yNZfuCfmXJk0iGNo9yj4bqgsqX72Gq6R8niG9IfWodlI2TKeP
         he81O3yZcVQQeyrlf8LfFxgeOG+PSep/M88AR/yRAVKnvdDtbTw8aqHWomiKnfTQ2I+D
         fnDQ==
X-Forwarded-Encrypted: i=1; AL+hErGa4SoNbFQQ9HBW0o8P/+ULzLOGEWBcljEjTAxEOdIa7TZOHbauMJEY2QsnGATOUzlO4qfoDjyUtZqArT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bfTpHJUvIlobHA7/WKmbJMutc1g1MoBmN4wHixnPu6irpGo5V
	pgR7Z663YuQs2sGYMKKPrEdR2vdIVfTFuUMU+1JJpgVUlih5mnPqTJz6t7oln8wkjq2jawki16H
	8QZVugNaWhzu6A352gmi9Dz2cqwwEWc4=
X-Gm-Gg: AZFdTZeAdKXts5zILSuKayCfidRfuU67vZrYhs4S93xtyI6dM3IkOViraFv1mJbs9mV
	qRIzNvIJCSZxW6Knijr03VaSP0JUtahUIFS0bK21goILkeCB4HoSqcRuGukaK57Kwjss8ZB5MFC
	SVCQqkOIbudTaTHSW91YTfMuThgbU+KQb2OEDKSP5zTu6Qbg4+ArOtIylfDQf/Muc0MHNR2y5U1
	tb8vbmMxrPPj5KOOOF810AUpzX/ik1lfewDZ53jeFAkRWas0Q+VcJpkQcooHAPV/T8LPnf6fzrX
	zzUy9+//WamF9J8eQIwh4yb3wbZP7tiv6at5xAQUvMERW6DUM1+C2j4SLjj4P5pDDyrq+kjiQ7w
	3PmWw01ajSyxtseOFVSGxKVNIaEsDb7mkP23dw9ZtzYyB7okVHNLCYz+mf9pUvSPiFV4/j9155A
	IdbuplpGOtrgjp/Y28oPfA2ApG1GHKaklfgfJRtESpvk3Bx1bPLP3qkb+bH1w50nTkZUE9+vlzA
	yHDRQnOtjnJOVynjp/Z+WaWpmaWpxbPxJZUP0Hv4di1elTXgfqRj5az8N2dbmlmE8M1AoeF
X-Received: by 2002:a05:6512:1318:b0:5c0:465:3fc6 with SMTP id
 2adb3069b0e04-5c1bc8601a5mr1101167e87.4.1795178003434; Fri, 20 Nov 2026
 04:33:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-fix-schedstats-bindgen-layout-v1-1-0599dd230ffd@gmail.com>
 <CANiq72kcDMqswODJ0OqcqecDG+8mVn7Q43v48=ED5d6tsFOWQQ@mail.gmail.com>
In-Reply-To: <CANiq72kcDMqswODJ0OqcqecDG+8mVn7Q43v48=ED5d6tsFOWQQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 13:33:11 +0100
X-Gm-Features: Aa3M54ohMQ3p6lQrc2oToGcefUhVDgR0ZDZ9v2jLMN0YjlcFyiMJORGRekgKFqo
Message-ID: <CANiq72nrsbSuD8vbK7+h16eEjbYNviC8KNPCfJpxuNgJh0iWwg@mail.gmail.com>
Subject: Re: [PATCH] rust: bindgen: Preserve sched_statistics alignment
To: peder.bergan@gmail.com, Jules Mercier <jules@les-mercier.fr>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 1:31=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Reported-by: Jules Mercier

Reported-by: Jules Mercier <jules@les-mercier.fr>

Cheers,
Miguel
