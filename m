Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795192465;
	b=whqDlsxv2SVvwwSBcFe6hC5jUthIBdP83x8vic1hJj4ljNce7vPoE8/xPtSWwYz3rFD6
	 QEtoA3HsGU4/9VciZm5hD2zsrWCUJsPDuH8tcYrdjYS4gKFEJHyGl6LHtNcjB+F57fkuO
	 gzVxS4s03FhnOIwdXEWoN8tJKKoN8/lP8G5T80E9bj4e+99ue2LcYa6UttOcccyh/wu6O
	 lbsC5eIen4iFfEGd9XsP9+10LhdrmdThZNspEM/79fVBDMBZUYvuDeQ7fkdst8ObpkOXb
	 9niNKHPqHEzbb4t2Aw+oIkDq7JZNiKSso2PbCgF4Kef6whNIt7iJH4szFtRZO9IlG7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nC3Y8PFe3wYNyqsZ4bQVAufvMs2EZ2DXu02JtfGvlOA=;
	b=GTHgcFdMcRh5aNQm2tdw/AJTZFM1BN2bxdygfsVKbSHRgLfROD6lbbtBoaYBj/ckrlBH
	 qv3WFXYalUg7bHjTZC6Y2o8StrrtuCB+QgH8U/Y/QDhBBLTCa31iqSycmUOpGHMedgn6F
	 /5fm3tO9PS7LRQpulHTRdLs9nIu0OxO4BBTu3YTSuA4KF7lys3L34U8Aq6h0/cX4HMY6m
	 HiNV+OeLm+01FU2b/TkqLATQWvDYzhAtfSh0RmyzE2qZheGHTok5PiZUuLYICkDINs+XX
	 dR/lSEWvWlQtq7ENprSBY0kPF3i8yz13UQRe7RyOZ5O8t+CfYreOhtjFRt1/dbO02ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBIN1JR4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691D6606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 691D6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBIN1JR4
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c0f0e04628so62922e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:34:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795192463; cv=none;
        d=google.com; s=arc-20260327;
        b=Ev3WjctZaaI4nr2+jr48U+toeqD6ycoyzG5NvFDpZ8v3UuPr+4G0Dh8hTHuoRxWiYA
         Jh4MHWfqZ2gz9vLq2mF4u2Ol1V8pzG5iR2hhqwWF6s2WbHrHwh9E3eB66PFuXs0uCH4f
         FwktBYl1nU+UlGTlNFYcVK4VVfEnLUAmEBfWjELM9aJ4Lf1oyqNl/nhrI7j7HNVC1Ziv
         xye6g5ENbTxWheZ/DKqe033n0i7a78ypy0LjL4aZOBH9gPZ3FR+n0e3MWCLGTqqlSVU6
         4ZBJPqDUonqD/YGo2ryoB1e6yIVifodSiXBP6MVoNeTeb+8to+f9ho7GqtRZXq/BbXwl
         W+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nC3Y8PFe3wYNyqsZ4bQVAufvMs2EZ2DXu02JtfGvlOA=;
        fh=9j6J+gxVa5DaGaQc80Sq4sX1q1VYAAZ5TLsX6p8d0ZA=;
        b=FL33CCbthVEgoy1toBNkLUNW4AtzyylG21moMGGqjRxxCGlanrD05OqKEOLL8fb/AN
         0moL7E/3vm6Jnd/x/KBTNJwv74q2cv+sOBY6prAu0GhniyGpSOkmvhCBH7KuM3Ioq3p5
         bARbWX3HYNbIFolBugoopO+OnBmnbXiu4wZC11T8Bz5YRnhdZzVcBNEiDtD9TMrejQYF
         4o6lW7EZHpjRo5stX2izGHIUDY9IsQY505yxn/zRIipLJZVVMfsnaeaesE5F9iXbsemf
         S+nqfBh6jctYvxbfijcE1RhcpWgdzy4vwTd4Z110kRM/AaNfoEtMEp+7gaDmYV5zfcOU
         qNmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795192463; x=1795797263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nC3Y8PFe3wYNyqsZ4bQVAufvMs2EZ2DXu02JtfGvlOA=;
        b=PBIN1JR4U5r3qyhOBJhFDoZHEKQteUgVsi+UQOHvUWCMUsKte9+vLKf7/S5XxRhn3O
         WymdpLThCMjsVl438IqLfVuuksvDStQqzGh1eIoUV0NUl1m9QfVTQ5uypVvckAfkrbmi
         4bTvq5IqyTpsDHUNjCWuLqHmSneVjLbbwpdrdnHmUvbpFF+ZVhAUfFelqZSmf+s9zzZh
         muFSiSxVaodK63XtUTRDO+OBWT1ZFcQPCKpWUOVHRaUloopyY9wTdqHo3v+pV2qDDrjL
         yv/2iNNsmH6ZncQdfCZu2raj5i30B81e3k9ccKy8az6GxlsZntIlSnMNMLFHVU9CKt/J
         effA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192463; x=1795797263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nC3Y8PFe3wYNyqsZ4bQVAufvMs2EZ2DXu02JtfGvlOA=;
        b=vOlpFM6fxkqelI3ZUX8EfPN12E5AKnET9ow6xbcG6wQW+P45JSvkRaxAK8G6DfY+LM
         oSmCqNDuDFVlLD7EsoDtMo5cjXzAUCbS8d0liVSY2UvBpyaR4Rb4+cQYLTq3BBCB2l7Y
         RAhD5/70nL/63h2Hr1is5lXqhwe7EfMFd2Ngs+IV2woTNrgcv8qoMYqMp1dXwZJfZ4wP
         DBcZdLjOCzDXP/8Esa7+JxYCpci/jUc19koOB3EduYdsV0/+lMWfffH/6PYRi7AACCCO
         7uJAYDk3ki00KOwlaVRB1pApABit0dPVESHE3UrOj+5mS9N3u880EQ0bMbEwgfXLsr7X
         0dig==
X-Forwarded-Encrypted: i=1; AL+hErFAmiiuBjzg/1F3sB1DZoHqNsMgcr7HwlGMGjI1RJ+FYmGIXvYUclmCPH9VoWYX4oWFtDbdf8j6GMiGR+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cu9I6dNKQgMrRetAvP6aYt6JSaEGygh8QD8hE0Q7E+K6eZnEq
	MuIjUowQQlKjzyRe4WB/ZbDG+1CLhfOOiwf0Bm3NOoFqKs9NdK9NHli7dziYY8kAyAFYhVJVA8H
	JirQ68kuPW2b+XCx0MPS2u0dIw47gh7c=
X-Gm-Gg: AZFdTZftzzyiG2ksiqo3ccxr/KIww+QiYJ7NdZMivv/ILriSOwwRZGxpcVr+go+bsFW
	Ji6cyuqBH7NV2Y9yhvpxuZ9JC15xvjx5e7bqNwuRmZJHRz4GjkDwfDgzpaWD5y9t9+Rl4J4Lxko
	9hOoDX7mMK51PLbbYj377LD0ihGbh/C9L4pO1+BorDxA3vXaQLRL9X2FCVWs0ziFAA7ipUdOMPs
	y33fx4j0X0QlBS67lHG7dsbEDErQSjxi7lADiTJHYMIJ7i7SMjPVp8Afu+e/1vkW1JhfKrYjFSS
	STwhck1CTUgZDLViAeWAduQQQpmNICGiBM3UNPbuiEFOHVpRyAVzhjk+X2hjM87oVb4FqvlTmaD
	yF9hZ55Oa+lPL+dSWYJ1sayMS0szemPAzYVxXNHeiJOgNB7PRkFoddYUIzpWskpaVKqBgMygG2b
	VVSw19EfygSOcHG/xUaWvJ5UJLpUXPLJxTMF/duaSAqAB4/359dgJBrIE0azfexGtBOnz5ON1s0
	hFesURvqfIewFEKykjIqwlqZ00TxRR+mkm6z1WEUNAS7rymcTIFNRNYkZnVaUnYOOc2yXK/DgM=
X-Received: by 2002:a05:6512:31d5:b0:5bf:f87e:3d25 with SMTP id
 2adb3069b0e04-5c1bc6b22b3mr1458709e87.2.1795192463418; Fri, 20 Nov 2026
 08:34:23 -0800 (PST)
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
 <CANiq72kcDMqswODJ0OqcqecDG+8mVn7Q43v48=ED5d6tsFOWQQ@mail.gmail.com> <nh-e30bf2f4-acc5-411c-89f2-b5dd827aa4d5@google.com>
In-Reply-To: <nh-e30bf2f4-acc5-411c-89f2-b5dd827aa4d5@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 17:34:12 +0100
X-Gm-Features: Aa3M54ql_SOOsMze1HazvjgluNX1SS-NF43fsAY8uNsD-xH6a3BgMusqBnpQfFc
Message-ID: <CANiq72=9EeVT74BW7RA=hVgvx7QE=41QZ80G5CyiNhmJy5yw4A@mail.gmail.com>
Subject: Re: [PATCH] rust: bindgen: Preserve sched_statistics alignment
To: peder.bergan@gmail.com
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
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Jules Mercier <jules@les-mercier.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:38=E2=80=AFPM <peder.bergan@gmail.com> wrote:
>
> I looked into bindgen 0.73.1. The layout diverges earlier at
> task_struct.se, and my v1 leaves that offset unchanged.
>
> I ran a reduced test and found that making the type opaque can worsen
> field placement on 0.73.0 and 0.73.1. Would you prefer limiting the
> workaround to 0.73.2 with scheduler statistics disabled?

I don't think we need to do that: `bindgen` 0.73.0 and 0.73.1 had
other layout bugs and, anyway, it doesn't really matter fields are off
by 1 byte or many, i.e. they are completely wrong either way... :)

Cheers,
Miguel
