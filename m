Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614368;
	b=H0H3UuegHDG78gDsd3H0P2DkKC9VWkHKV4bbFMSdhFHW/CQtOIT2+EN7+RR0opuYzr+U
	 sXJZ9g7rm5svVVrJ07AvyAX1Oe0BRl6sLr4UpucqOS7li4YJV8fLdfdi8GnqzRiqZmupa
	 JrSjzf94+QJxg1n7KGyi9BIjk7392zucYw4pQoCQnszAq7WShaZ9P3ZziENjCNywPJexU
	 fk0X6WoGCsEppKf1xAPXRQE+BoZBGEs7B6e8jIgb+FOu0Y4jyr8060PwQLLZ7XrK21Nnz
	 7yRuMspEcSJ+QoG0wCn9h2AIbum1Ob6y8t/NSb/b7wJD9m2VVzx8PKBCTa238XTEVXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614368;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4jZqsZWp4ooYwhfyJ4y0mJBIywKILW2kOFcQL/uGzgM=;
	b=5UdHH9VKoIxvKLoUt7G4Yhq+kXkjdydYGpN9fOwj58Gy8e+wxCM5nvsP02izm4AADIwv
	 FXrxpdgxuZFEjNGBuON0PbiX4BmmD3OJUQuYUa/IiBagf/nRBXF5tJNkFcNRW4UEeTebG
	 ZBQTd9iVmEZACt6rncwN5zDoV6RJyyUFc+BKW0PewaW4pPBo98krkxN98PniC2OdeJFcV
	 R1LniowJyK/0fPfg6EuMs0iT78gNSC6t+f0YScRQKbcZaP7g9UwAQoJEb1lm4dKkaSVmn
	 AJRlXxTI/K1o6qs83bMx2ewx6L8bCmBMeeQbBvpeaVTGADjUZc4E0BD3NdrPrjkL0bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifF3bAuf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6422C606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifF3bAuf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFD71F000D1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795614367;
	bh=4jZqsZWp4ooYwhfyJ4y0mJBIywKILW2kOFcQL/uGzgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ifF3bAufXHV77XVWr2MRCQo63HJHoPyW/kmeN3Wdi+Uvnhw0o0EevcXIraxpZahnt
	 Tpr50qs9xBUuFTmDSlAUiGUk34SgUbxs+xzVnvTX7pwp4g8EjSuSoueSHv3F6/z3lR
	 qaq7NSXMVFFWhihtPoPKIdTZlJUFgfNlo6Mo0fwdRRbM/rUC5jMYnpds6+UyMTtaEc
	 bKwdZsWQEWmocA0bba2B1QGs4Al5L65C1IPVpMMJbRr4D6K6aOIPRehgJsrkMXJnco
	 RlhlfKvO4ApSKsebt8G1xGjjwszVEOdvuSYe74chzYgoE4o+zd6R8I3LuTfo+aAdmv
	 TtDHhHNpAiP1w==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so7679340e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:46:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEdn+Tv18nfBNKXgYxSisrQLwRbzI9CMlcoCQ87Ylq1x3yyzAj9ydmgaeqyD9n1Pb66v2zDe0sFxLJ5fAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CBfYcMWTBNh5BJjS8tLUiFtHpI//zVsLxLanV7X4RKocoKa5H
	CSm0LBZwC4dMSN8mx/re8G77SEQTs+EC+rIsT/JJoMydP8AFlbqRhqzcNaT6h4zYqs5mp1aP5NH
	6OzmI0wMhNluiSjJsbtVlotjw0xB/tMo=
X-Received: by 2002:a05:6512:3ca9:b0:5c1:4f88:9af6 with SMTP id
 2adb3069b0e04-5c1bc8198fcmr5837892e87.54.1795614366500; Wed, 25 Nov 2026
 05:46:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120131743.31836-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20261120131743.31836-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 14:45:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLmkSNamcvU49S29HmbbqPZiO_P__-vf2VrUTbiOTYQ5nA@mail.gmail.com>
X-Gm-Features: Aa3M54r_va3lokUc-LWrlB0jUYgyg2M9NoU1QfnHQvyjmsPDY4Ce4kWCvRRlMHU
Message-ID: <CAD++jLmkSNamcvU49S29HmbbqPZiO_P__-vf2VrUTbiOTYQ5nA@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pin control fixes for v7.4-rc4
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:17=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Please pull the following set of fixes for Qualcomm pin control drivers f=
or the next RC.

Pulled in for fixes, thanks Bartosz!

Yours,
Linus Walleij
