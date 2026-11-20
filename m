Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195712;
	b=oKC+X5yskfmPPd1OgmZJtFLjn1FmirmnKtJFROJ+ZKXImvGi0RYC6jWdl0pKfKBQ92Ds
	 jz8XN6nMUyBO/uLud8MaZedvcb+3ODqgW6gi3/UAJCRklJG6q1cPi8D2tE6W1Hwnry45m
	 lB/1fXtJsVIhyJJUQr8WTCj6+NYgZ4FwIZOMT4ohvOuv1mInMo0E1dQwfMVwyE55JzRho
	 lhJKXLdbuM7hml5JCMwWcQK6oNI5+QtO98/tkwqpnN2v6oaPCZCU/5nP7L7unwHmTkRrp
	 rmC4ZLZ8UKDUjzAkdle4+F6kTGWiwg1Syv05QMzstRcc9TJXt6nv3a4DeRgv/zGuf9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195712;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TTjwlzw6aVAR3tSaYaZGcthnRSIUmYP2w0NYxrZBGTo=;
	b=EdvSLCJX+IcxfNlKN9MpgqAmIt8qEXY93IxVXHdnlSvyEMNFAY/ju8G5y8e4vZZ8oqmb
	 PkV/N0VOOtucsnPq8+d8yiac4kk3obInBBOUHR+1hBZNq/ES7CaFqc0EcZz2lOVA1AmBc
	 MjU7B9eZ3wqkAdSDc5ahPyAWRkjO7Muf6ETPqZm7gCJsF1Z9ra3ik9iApCEuzntowJEtB
	 RVdTSZFeOFD9f3PUjTmQBo0lB8RN8HWJpVI9dJlS6nDkqczMdQbUOFm1UkohduZo0q7cu
	 dDQKEqLWTMPVuto07Db+eD+qWLv5l9lgMvqU5xTqAEpTaQwhdiDcVfLqjCrzs/FiusQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZrUHXdAt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE18606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZrUHXdAt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E1B1F000E0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195711;
	bh=TTjwlzw6aVAR3tSaYaZGcthnRSIUmYP2w0NYxrZBGTo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZrUHXdAtGgQpoq3VUSo/KJNU/20Huw3ggQo6hn+H7wuQngPO4f/c3V3L+ZiTJiKgK
	 an2z4mV0zpcsw0cw1BPfBQOk9Nnn4x8N35czAl9X/NoxZ3cbCAMoAxPcIeoU6b1w74
	 aKAVQFef+LijsSB3gJ32OBlMm7arV8Jq4C2rXqSRkEbMuMjV8Eo4nZkFOdxNUK/IPY
	 Pw3/DZjk6jP9d5WDVtjKC0q14e3OJBjvPKCy7MXclphQsXhmjhxJy6lD/07qjedOBz
	 N5ACNcn6T5xfKGLGUPUHFoN4OHFI6r2wYaD+ZSineGkCUX+zoVNfe+jq4HFHADD9zm
	 6tMWdMjYkvRBg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3adef977ad9so9274851fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:28:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE5VMh8AwpGbvlbLEmizde7WrvYEsDG4DprOdS6Kwh+aCK9z1QWu097JIqwuazC5WnOEcQofGceBVUK78A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IZB4N+KZcqijTx9Ib5BrbSzEEgIqMk/wDZUFg4Jk0pR8HXS7w
	Q+YvoIhLfbpQqdm0XQ42lO3ASBQdss3TMcpq6Dhjj34z7QNwF6A/sA/XyU3pSHlz8fVM8JCrf+9
	tLF7kDDazy8k5HBifCRx9//CaigOnS0w=
X-Received: by 2002:a05:651c:2214:b0:3ab:41c8:fc15 with SMTP id
 38308e7fff4ca-3ae7f9d964fmr11430651fa.12.1795195710365; Fri, 20 Nov 2026
 09:28:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115172951.35889-2-thnkslprpt@gmail.com>
In-Reply-To: <20261115172951.35889-2-thnkslprpt@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 18:28:17 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0j_a2WoMF7vcMnz-2sS_Be5Bi1XxHaK0-vHJKTq164Gcw@mail.gmail.com>
X-Gm-Features: Aa3M54obVrie8t2J9JHycOwamMXwlteXnovTfy6PHZAtEtSti6k0PE0MQyM1MrQ
Message-ID: <CAJZ5v0j_a2WoMF7vcMnz-2sS_Be5Bi1XxHaK0-vHJKTq164Gcw@mail.gmail.com>
Subject: Re: [PATCH] PM: hibernate: Fix partial snapshot reads
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: rafael@kernel.org, pavel@kernel.org, lenb@kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 6:30=E2=80=AFPM Avi Weiss <thnkslprpt@gmail.com> wr=
ote:
>
> After a partial read, snapshot_read() passes the remaining page
> length to simple_read_from_buffer(). The helper interprets this
> length as the total buffer size and subtracts the offset again,
> causing premature EOF while image data remains unread.
>
> Pass PAGE_SIZE so the helper accounts for the offset only once.
>
> Fixes: d3c1b24c50e8 ("PM / Hibernate: Snapshot cleanup")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  kernel/power/user.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/power/user.c b/kernel/power/user.c
> index 6e4f40e49319..d5e2b8d0b55b 100644
> --- a/kernel/power/user.c
> +++ b/kernel/power/user.c
> @@ -154,7 +154,7 @@ static ssize_t snapshot_read(struct file *filp, char =
__user *buf,
>                 if (res <=3D 0)
>                         goto Unlock;
>         } else {
> -               res =3D PAGE_SIZE - pg_offp;
> +               res =3D PAGE_SIZE;
>         }
>
>         res =3D simple_read_from_buffer(buf, count, &pg_offp,
>

Applied as 7.5 material, thanks!
