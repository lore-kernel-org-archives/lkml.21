Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086008;
	b=Wp8tgFRSwKAaQoYh8o0vZZGmLAsoGegVRNv8GvAsegJCApSM/m9bk3voQdP1OD2vDepu
	 5Jt7ZJqcruAnJGxpBMZM9UEX4ct8GCZcpdQr9ubLOZgFgu+PWGED7x9a7LM4Dj3jGlpiR
	 eDPa51vnoXHRnnJ6m7py6+a9yo1bHYriOswdggm8uTIxw8/STbqilh07jQ2J1flDNF8Ed
	 1SQu+0DeAY3UsRnYsM3pONJRvCmMT7wvoc48SoT+PkXSG1e4Hc52lda3JPKkkX1jBufiG
	 09Mi0lKD2Tt0KCmhsDzHO8maVqwRQJ4eh/fH4hehrtvYx5i5WElolkcIHhc9EMzuiAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086008;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ehxq3Fo4IWGleEOLFlOfAcwBczNox+3O15mlg4g6/oM=;
	b=a5tutSo0fKisCuJPMSpH60Nfc8jGzaBR3m/DGA2brOuHHIkHHHHegJZCMx3rVITnauIK
	 VVr/tbVbrs7UxSDRd5mdC+pwRf8ZuhG63uGoUHsDj41mmmzfFgymI5X2mW8G6qJryxMAd
	 HsQ0ib0iWHXFwLgtHI6aUCEqAor064uGqage0wpo9U/gU5l0JzmPKy8gq307TOsB/DuOK
	 XIieLBhWvhzSYL06fPGksNYJsSTERUabB/+AOsn2iydaiW/JqKKHf/BpJUvVK5vfj+m2p
	 +3pYURwZVZmBXYhlROkLb2Df76wOL66pjVv4KK+mP7mc9dmblKmN/gcKqoe3p1VPq2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cDcpuGBU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C0B606A334
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cDcpuGBU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D0C1F000C4
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795086008;
	bh=ehxq3Fo4IWGleEOLFlOfAcwBczNox+3O15mlg4g6/oM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cDcpuGBUkPlQcxawatskaA+zRIxgBu9Da25ZHEDZsa4ISUoGqor1fGKi6Pw6CM2Ab
	 6JRV5Xko2LqDR0O/tBPHEC15eEujaNjCGDZY2a8D79R0QE3pxbIUuNnvBWHnpuHorU
	 +37GgZ/cvlhU8BmMp0IAAA+MuRwsUWrEjKJAiZab7BplIIdpppOAXQzmd1Xq5H2xHc
	 lHzREun9i6RJ1JpQi8jWcsD92piXS4m5obfwugLTKKf6hkL0iimbgGSSRlJwMt+Zn8
	 d6ctnNhIHZo0CnTgXPCheedrLO0n22Qvmb6uPPfm6VfJ8nOeBkvkDRRInNdc/abBfO
	 aBHbhbCuWgjSA==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c40f29667e6so333638266b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:00:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHUZzCdXFbts3jNQSq1w/kBf8CQh9Q3EJUaBqvlneRNvNH9g++Cf1oEpsIyn7mtb9XgnF2owNT3UlHl8HI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8shMLtREPmIAI4m6vuV4kq3Qf1JyHdx6I4ypIgniax5BiBKHfI
	A4+GYzlWu+KqfjRmlX2kM/PGAukO9r4YzWbS5FvoKv0Eu86znHNOvF2OzUnI6O9f1xF9cHmCunl
	viHI9+VV16qgZ/5hHBR18s1RNfOCeQ4M=
X-Received: by 2002:a17:906:4fc8:b0:c46:ba0d:3728 with SMTP id
 a640c23a62f3a-c510e2d705dmr557796166b.18.1795086006487; Thu, 19 Nov 2026
 03:00:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118155818.70792-1-icb@fastmail.org>
In-Reply-To: <20261118155818.70792-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 19 Nov 2026 19:59:54 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_Kv6QUtSPYz4nLM6HsOvp5-LwbmPyBF6v1GJVs6uNLSg@mail.gmail.com>
X-Gm-Features: AclHuK93O6MFCXQuhlW_-4JSIczG1qLVVIMo0kb8FcxG233B2QMwxDvYBSkfS2Y
Message-ID: <CAKYAXd_Kv6QUtSPYz4nLM6HsOvp5-LwbmPyBF6v1GJVs6uNLSg@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: rate limit the log for a failed security
 descriptor store
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:58=E2=80=AFAM Ian Bridges <icb@fastmail.org> wro=
te:
>
> ksmbd_vfs_set_sd_xattr() logs every failed store with pr_err(), with no
> rate limit and without the file name. A client can make the store fail
> at will. It only has to send a descriptor larger than the xattr space
> the filesystem has for the file. On the ext4 filesystem with 4 KiB
> blocks used in testing, a DACL of 86 ACEs was already too large. Each
> SET_INFO or CREATE that carries such a DACL then writes an error line
> to the kernel log.
>
> When smb2_open() stores the default security descriptor of a new file,
> it logs the same failure a second time.
>
> Log the failure with pr_warn_ratelimited() and include the file name.
> Drop the second message in smb2_open().
>
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
