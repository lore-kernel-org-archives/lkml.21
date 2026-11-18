Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795027698;
	b=bJUCiNCBSUBcH1yebneDLXuhbhGWD6C+ir89HS0PfEW5x/R69VbSzgzC2KxsvH8yhpZV
	 RBYrPa8OGCfo30m9eN3ppyjJTydL/8i4ALvE0uqgy2s1eccBf2cra5LTvUayKYLuGXCRz
	 1ZjjNPkmXpnP5ugshccEs4cpLT6uUCB4R81W8fWM+4Rl939uzLv4JydNrftVy61B2c/pz
	 SWrni1E7nO3iPyLaXP4GQZR3Hp/fa21d9A0kt8Ob6DARb7A2Tw3FmtA7flTHzl2XoTlky
	 iygsZAnAiKmzp9v1uYv+hSf425rox9VvJQYL437ocxo2Kiwk1oGXLt1G5+6kmBMKbpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rg+q1/RynRFA/mSQSm/xnUfAGG7AFja2CbcItDrmjKI=;
	b=bIpjDpmkujF/5e3a1m4vRcprmMUtFeEPBNUkN3NHZ0GFCHNcAIQBPrONncO054qca+K9
	 FEW0q2bN86YvIfQ2OqewUnYRrCBPl3J8MpKf4pLGWvX/o42vClxV9N3/FWT9qv0pxdRPe
	 6WyMIOYjoDN2ZcCXk1PZxB1KrV+My8OkNGiighcPY6dFRx4jZ9KhFRUx0ONuGavri7Ar8
	 gGthTtCAOtDzVOGLiOiJ8gasL4tpQPBR5zvkH7uWdf5sQ5//a3aciw39n1Xh/ujG5pf9k
	 PH7annntTYTtO9GPKb0HTFc3J8V6oXDbaQOjrRDgyn5vixnwpAeWSTfvFbFPvnjNpJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y5DKVP5R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA76A606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA76A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y5DKVP5R
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5366ae57896so12166941cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:48:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795027696; cv=none;
        d=google.com; s=arc-20260327;
        b=PxDwEcmanKYQcEOg2CsD5fvgf3/8loboDYN17IniGjF3zgf3zn9l4HaNz5jUttWOng
         Z5m+aX7+lYHMWZANMz6LigksoI3/4JLYLknc2rWU66UZhNwrFn5dhSJLybbSWNFjpLUL
         +DxMcq5Ocp+z16XfFX8CsD9ry5uJE/QiaYwWujXP8XK1iC6Ts422HZRMCeqZoFh+Htcy
         Wxa6iihqNaIyPzamzEQC5iPsqQms58H4DlZHu13UEuACQm+xwJ8v8wqK02DgorYqhvi7
         PF4VVEnXex5nB5tR1aJpJxZJEBLK53+1C6/iexUeT+cm/N8DLo8EdSSQeApE6wbvPneO
         KPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rg+q1/RynRFA/mSQSm/xnUfAGG7AFja2CbcItDrmjKI=;
        fh=C63OEj/WphwFUWPqtHbllvB9/9Ced5Rr9Uq28iNUhkI=;
        b=RYqLuzqCykPN/SGdej9ddkI3ELCxDkhkuKyW0XsHupyeCdn3yWt5sw9rPV/KbEUVUl
         kejalj1+dzw4qOFjudn8Jk9EofUhjeMph7YQuwKXsPnOgZPoMTAp5H5FCTYqTOiHZ+oZ
         sK4g8kJCNd/3qVma7tBqvSu8aVyq6nwrRcHa7YaLWNMguwwTpG5GxCi9rFc/i8Ph8Scw
         NVUBnmcwa2QYnh6N+ciWiKsipGTPb6JQKVhLpazD7qT5jgVIv5GhrT9yNIksvlZijuv0
         KNa1wWAwEzguwZIU2YrPZ389p+g/AtLY4AiuT9IME3mFYqemYaxmnJohaI8otquExVlN
         Z70A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795027696; x=1795632496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rg+q1/RynRFA/mSQSm/xnUfAGG7AFja2CbcItDrmjKI=;
        b=Y5DKVP5RYJ9NwBjijNbHdxwLhf+SWV8yYHXl0QpNjIi7CAGVRfua7XGif4vhqz1KpG
         SXGY9z/Z+BIYS+vAEbzqPjSX4bjozccdkkR7PqE3ogMKG1gGcND/PRFabM4RZtK9479b
         Byxr4QJgIDPYL6Su4zTN3VIEYGh1QCQe6xjgRmjvMAUn8OYHdOPguogqeWeTm57fQ5Cf
         XEElrHohGWYjkrZypFHPFn5OOUJcE31jGqNzwkdv7scPhqUX/ojC0bPGzK+QdFTtB704
         GmxpUdMPTQH/hl/wLUpllgQUCxlb+Uilbnzasq8HTQJhtW+H8yZ8M/vywz5NdTSvQNYD
         fWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027696; x=1795632496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rg+q1/RynRFA/mSQSm/xnUfAGG7AFja2CbcItDrmjKI=;
        b=vZV/lUMa1GNUfDDazf1qLPPAhTIftl0A1FB+7tw55jpn8FfMQbJtvdomzO4eYQ7oUH
         AwNESjFozZ0/W7RPLVMmnoUFtoaiwiO9FQ/ijAd38pbM94h0PtLCV7KHbnKaiMaNxM2a
         fIQrUydfMEv334k6Q6nIDQ5pGEwx1YZoomX6884NPGQzYRTIg5mThxwQ4zEsEfrwdG1y
         ekNbwb+YzfLNh8CLT3RpYqEadEllKkpNzheI+gsZx9ulSc2DFulW4dpzR80emapLCkrS
         ZSY3P19hYXCG9b1x2opqqHlMLmDx22BsLy2ht0+a4VH+QaDAG8uKVE2JaLUanIcC59PD
         G/nQ==
X-Forwarded-Encrypted: i=1; AL+hErGViczJGsuACraMBah14KrWSCQ2vQlqbFoJybnNBFWb1+GcZ92o5/K4fu0c430Qeu29fCPTVSLmtFFfeaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2/wpkVKEKaqTt0rJMJk9mkF1NP+zXDkEpy223s9NgvB40GDIS
	deSYrXtst7LCz1nR6w+D2Z2gRSGWUIxn0Kd/TfKjYPYivQEM2apNVIiHBPu3V4bQcAY5uFsYjSG
	XxrTCoK8OxNK5yc1C8UZ9MimKnjRci0TAqX0/Wx1A9ySsIB1tMeY5XE5YDBs=
X-Gm-Gg: AYBFou2nWd6nS1Ybo9xWn1glVY6bc1IL0OeCHczkrfX9WlAxPdjp7eivedYG3TwW/Jv
	lau8dbxUlCcOX7s1tRLXI7lfyr9f3oqhdnZNjeB78oIa7joa0aV6r8eo6UlQ1sYSdNGNo5WsXdi
	lmztmGEFTxUy09H53wcMl8RVNxlLQC8OteUStDpn0jCa5EcVE7cQVDggPatOEnMHh7AUh5A/mng
	OwW4RNftuVm38nvkP+zpMiTLIzvEmDtyXjOt7asPp4rfEQF18gDBqQHeT2i59c1OyjIFtzBW3Ty
	BxodtZKRTfy2xv9yGaUA1Qs+tkeJPZMzyiVitJ9P9bag3aQibJiEocbbSxlIyn/3AcxCk+FArTw
	/lPeUeoEfkPH9VgZgfb04uLKqZ3/S9gdDafUSrISI0M5V7tsg3dLle2yvdk5xSptgq9QYQw==
X-Received: by 2002:a05:622a:2507:b0:533:2ef6:d98a with SMTP id
 d75a77b69052e-55d5a590732mr57265741cf.29.1795027695990; Wed, 18 Nov 2026
 10:48:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117220522.904290-1-elsk@google.com> <2c7b026955f5519faf7fc8672bf9ac4fd3c6c4fb.camel@perches.com>
In-Reply-To: <2c7b026955f5519faf7fc8672bf9ac4fd3c6c4fb.camel@perches.com>
From: "Hong, Yifan" <elsk@google.com>
Date: Wed, 18 Nov 2026 10:47:39 -0800
X-Gm-Features: Aa3M54rORApQ44d6YWSpzp-mAkRGMg5W3a2ikz8KvVCZsm1MgHKt82EKjCsQdvM
Message-ID: <CAABy=s3VB20eCpdDAH0jhk-HMLAakWsUS4YhutCpoLiKbOwVuw@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: recognize FIXTURE_DATA() and
 FIXTURE_VARIANT() as types
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 5:37=E2=80=AFPM Joe Perches <joe@perches.com> wrote=
:
>
> On Tue, 2026-11-17 at 22:05 +0000, HONG Yifan wrote:
> > tools/testing/selftests/kselftest_harness.h defines FIXTURE_DATA() and
> > FIXTURE_VARIANT() to expand to struct type specifiers
> > ("struct _test_data_##datatype_name" and
> > "struct _fixture_variant_##fixture_name").
>
> NAK.  This sort of stuff needs to be externalized.

Thanks for the review. By "externalize", I assume you mean the pattern in
https://lore.kernel.org/all/e5a8da43e7c11525bafbda1ca69a8323614dd942.147266=
4220.git.joe@perches.com/
commit bf1fa1dae68e ("checkpatch: externalize the structs that should be co=
nst")
so that I should put an autoloaded file listing function-like macros
that expand to types. Is that what you mean?

Assuming that's the case, I'll prepare a v2 of the patch.
