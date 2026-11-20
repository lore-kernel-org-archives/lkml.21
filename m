Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795203903;
	b=qAs3tnoZq9HB1sx3ACYxlp5GpHdhYk3tFxtuSNXG8KM8n+HGoc/145ZXYo6Mkf2OxqgB
	 Qj//0Y/C/hVvM+zhssvzQxBaMSTM30xfFjv4cIU+QC+0ojbZzjxp/C28rOz7zOnWTXU5q
	 8lIVZNzhzPINywR2gJqDboIbbA97HVkSKuMUK95dWxsPQKfi+gakg4HA07YxSxLqYI1nR
	 hzugRaEaMkMJLfjzQ5Ib8HLACA1IwluExAIfM9o5+qyddBXi2gAohPDH78ShDPg3s6v6W
	 x5r5t4JxIo/Lxsgvgb6F5xaeLmwxoEWFGPh6bt5gTLaTCjt4QwHG3jW3nkP1ZRr7sWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x7+tW7HypPO42hLMOeRGLaulRUEYCU/KAN2PcvD0X5w=;
	b=zvUVSWH763Dpmn+quysZYcs93VDZy8zwRhSmHtidj2lp16vMmIzdlsMoNyKB7gY8CB0b
	 gPrr38YS3HJIhnfUTeWCG90llMXZFedtIUD5GvmC4zoqVGiJ7S8DNiGpJfTlmpRSijAp6
	 y0haSTaHDYDcJD5WKgnR/z1QLjgMpU9B+a72n6eMp90gC019skjYgGlBMtHHXUoYIgsKJ
	 E81Si2Mow/EvBfDDrVlLNae7bB22opvGTQfRYBItPUsoVtr4Ii7AIypdQ+Cfpy7xRKlsL
	 DMumlmjToAD/QgPltGAreecxtqihNdIK5dn5en4s2PunzO8NxTZvfMLqW832yTXAsIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gz2eTSaG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723E4606A338
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 723E4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gz2eTSaG
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c1acfdb638so97582e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795203897; cv=none;
        d=google.com; s=arc-20260327;
        b=dSOvdNZZMuxov7vtAsplw+bTTj1Wj6Pe4lkaOEEOW6AIRAezgFZHldojGR3U8I47DH
         ANPn1+aepm1gwsThh08nKpyxOX/VlBlXF/U+4VUBfCIEbrXHiTmDqoOYaN7VXLt5UB8q
         3nipW4rMSlMFzZcDR/KUp3mff6kL/YBXjot52SlLypxa8fDQD8YoklGwQzz9bU/QQAfO
         pIOnNfc8PyGH/BbioMNMrcBUcqPnXG87VOniTWihP4vAEmDedd6RLM75gy4mv0l7e1YS
         T4fW6JZsnEWIDqe8HIijvYvDRiSIJAFbw4MWdevDTn/Fg5ilTpTmjydO0VwC/mrervVh
         JuDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x7+tW7HypPO42hLMOeRGLaulRUEYCU/KAN2PcvD0X5w=;
        fh=nfQwJ8Z0MW/h6Sh5eUNLNCkDW+AYX1ziLv9WpkP2jAA=;
        b=YhXeIsahZSai65cQVKdxz0mTeqUqbYgZRKfnWknLzzZnbsC7Nw2lKV+xZierFsYDp0
         OKFzOd/AYpeAH7KeEXO2AHmd6kHo5TGLVFghjABLjOicC8spkR+CkaKQ92gLPQu1VZ2h
         oYFwzKUxehA78Dh1gwPWpejnKUoBOPfuLq3KpCbrtrJFB3CLaV1GJYP63YJ9krUpJ+r9
         gXEwd7Wv+gg0a2aLjXIw6FtFGfUZzpay7Gj1m2I0DclhH33Zll2y2kqYjNA6WSOLODcc
         E6MEspzQMKVSxqJWF/tUgOaOOEfvlk/1awkuJlk2jPdLgrl9HImwBQywnQqraynf06QO
         bRTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203897; x=1795808697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x7+tW7HypPO42hLMOeRGLaulRUEYCU/KAN2PcvD0X5w=;
        b=Gz2eTSaGNril2BjpKUQtkMs26AMWQizJ5rPS+Q2Y4NhGnyxDR5NGvbHEcjHE99rAx0
         4f3wExIK1ULhLSBl7jIK+O7WAXJ5xQa2drkXltY+AtSG99KzYSYXi3Bu2fXZ+3oDK532
         FNtb3HOcnYZD45Z8oVRzZjBZJXbhplXeJkPWjcP2Pr4+QeYPbybJoAasfa72HA5Bd8lY
         OQPS3+NfQvJ6ZgmGITfkKnhUNJUs+2GWXlQazbhaH/L4bjmxh5rBuhQKyLQe0ytGBJrr
         QHojT1hnlodc4ZeoVypnVjDL9uMxh96YFDn/Hz31SWbD2TG1JK5btrp/85M9MRSz7qNb
         NVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203897; x=1795808697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x7+tW7HypPO42hLMOeRGLaulRUEYCU/KAN2PcvD0X5w=;
        b=sKJmo1VKqEvQPeyr/nbhc6T8s/IdIkXGlfYnVCqbzISZry1jzL3+GXbbrJUi7q5xeF
         XtXnTVko1ZQgWP0TvjqEUXGXF8G385Q8RAZqxRSOUVuZaHr7HX3hPNDn///MkKNtJRp0
         ULH46C2V/IQAeKmDo8PfuBqLAs9S+JqmTZvnZZowEFNvY89X2f2nti5uGqP8Cj045if7
         u2KyAN2kRO82yTSWr7WNymReGINz9+3OS5BlxmmqH5Zm00q6zt4pTraMKcxVGTY+MQJz
         TXesxW7xnWRGeflGy8KicCq7AgvmJVLT3SMsxnTaglcm3L/tJKDbAMv2+LX2Q+gBkLNr
         VDAQ==
X-Forwarded-Encrypted: i=1; AL+hErE+Q9p+Ph9TyLFJ2uuH19ZNXFqR2sI2RvYfGoxfBCBIIgMEcpWk8p4ta/T0Gng9bKQKsouhA5TCwFH3pOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I9H+uR45WV394iDikPFd3wEzrrR2YpFRNWxIaX9LjUdVPJC/o
	jTdB07ftEQV0xZDIYhTRUMVmG1wrDBxZmz6dWulxS0jGzDOYeTA3vTqM7Sd/qxaCnPwIvcUEii5
	6BRXk4WO2U5wjSwb5haaatOKhzFFlc3I=
X-Gm-Gg: AZFdTZcPcyd9sC6pS57HJ70r9BQb3DlzH1NCNyXW8k0NgycKzKRt9w+VtgaEA81Ltdq
	R3eRTDjBOQEgRA1eYjaRIEGSgxDCXvUPifFaHSODC1glSDzeI45gIas6J4B+iEdX1f2MrGpWpyA
	IfQhlvePXZBi9wOqyMDgK5Tlaxj9Kzb/ZEuEuPfP7hBKJ2GUXzepepq1wya0RThOnXK6HIrM5K4
	8AjVbV6CPOhBaTwm46XXeDhHJNyD1nSt3vyE3lOQTE5rqsMjE0Mtn9mtGjHQmQGU9bGKwB4ity3
	DxDnqP6uwaJ+aqUxbw+u1FfEhR4TGZjKsTT3A6TYBIvOvWrsJzpklDnFNIVOOUpg1xVmz0s92QN
	pVspRnwnAVxHu7woqa1V/aJJ7Q6aWDIaK6TGVCf21FhFxTaJrkaPgBSVR/aQhvzRNHgc61IX3HM
	7PaZbKAA4gMw/18fxS11A4QYmb/Hq1aXFq4CqjK5A6geKvRGc1J7jzHJ+gUZdIpfsuAoBJ5NG6P
	F2eTLGA9ABepzxR0zslYNpqJbPdvKXUY6U0+A3I7WvF4zGB8QkvsGIbYe6VMR0J33Gum72BEhQ7
	PMzE92ZmXOzEDRd9Kg==
X-Received: by 2002:a05:6512:1394:b0:5c0:da9:407b with SMTP id
 2adb3069b0e04-5c1bc8722ffmr1651344e87.5.1795203896543; Fri, 20 Nov 2026
 11:44:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-fix-schedstats-bindgen-layout-v2-1-1c42e4a996ae@gmail.com>
In-Reply-To: <20261120-fix-schedstats-bindgen-layout-v2-1-1c42e4a996ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 20:44:45 +0100
X-Gm-Features: Aa3M54qL7PawZ3rq6zWWS_GSU8uuvKfOSc8NrmthN25EzkgMW8lZpFzXsfgYK0c
Message-ID: <CANiq72k3e5ko2vA26Dy2GmVW+8Ja2xmzPydX8wut+XeLT0uYDA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: bindgen: Preserve sched_statistics alignment
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Jules Mercier <jules@les-mercier.fr>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 6:19=E2=80=AFPM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> +# misplaced. Making sched_statistics opaque preserves its C alignment.

To clarify, in the comment I suggested, I didn't mention
`sched_statistics` because it could be that we need to add more cases
into the list, i.e. I was trying to make the comment generic.

(Of course, hopefully the bug in `bindgen` will be gone soon)

Cheers,
Miguel
