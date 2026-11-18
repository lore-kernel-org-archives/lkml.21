Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012109;
	b=eetW9iR29Ws4tOLxfVN3GS2N7p6KtVqRbeH6Ugpu9bNWx3Ms1lT1uwby19eFDhYi+IUu
	 b0ihuyxbSCzy6YirAq+4x84YZKXm07Up1U6613QZLJpIQpQqI7/v8hBTVfbG4iBuVyQYS
	 r0Xs05Snvro/R+PlOoBuyKnCOQDur9X8/29gMpoWgHxICMUCEhLT+S5ZP0qs4WHQiNQ/r
	 MFmHNf79fKwcaUVpbNLnd3dzDdarThqpAPxz57XQXdPO9JqqsClQvmloqF4CM45UouznY
	 qRoxmfvb8UCsWbwFBF9xzH++gSiFGFOHaR6OO4WHLegkWNcPuMl6LJ1AcgAUH5s0+Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012109;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uEWqDU0LG/ft1XSpwdekX6PonsmuMVmcofZKxwquxNg=;
	b=NSOMhb3oi7PCQk4t0+0BiizXfoj6JGw96lJKQje9Hs8xW/Jv6tEfSV3KGxLpej0DDcQj
	 RbChhjamqfTZPMeE2EkO/FRRJ7+29Sr66QP1k1+h7+3LjCygXkcdozslCCEzGDQODs39e
	 Wuh9ARkJHKlMRukqWFfrvF5GVhiaxe9IBl5CokuhVayfGQJo8qiWypO0Pp3FQlRdbQJe/
	 OcZBVcNMlXNxTXZQmT5XuGTXsxE7LC7ttM9Xz+91G236/dHPAV6Znc8u3Ee8c1zTk/N0J
	 4mqqLHiqAW/N4jzuN1118gawRC2dx/PKv7odf4b01hJuJQ8+0Ptofw2tmHiMTqIjODQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FSsNxiS2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C87C60A2607
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FSsNxiS2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE40E1F000C9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012108;
	bh=uEWqDU0LG/ft1XSpwdekX6PonsmuMVmcofZKxwquxNg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FSsNxiS2hjeUKjZLyeQWIXDnGj3hmK5L7hp4mbZybh0b8H8hnR2vEE+SggUWIIFhf
	 76Yc4hp0nI4TmJqIfoSO831VdCgMTnse80KrBjqiqrmyH04oM1Q1i07DYC+WRwoUz3
	 W6kZD344rtGJ4/ymBnV/y2QT3k7GWuH7ZMJ36tiaz8Y3K9goSi59T7szNygLuR0ui1
	 7BEmzNLDdWQ5i0xdx+F9G35n4TAqPaDkP9XqBDy9xJDYE5iajM5Wkf+oGKrfHzcAb+
	 dbn8YCP6bB687okdy5oDYfN/wFQXuKqFEOJjCoa1eH5r5y8hfLgItbaSdOUDlhs2sm
	 nA8NQNhq7BgVg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso11738711fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:28:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEHCQ/+OknCGXJUoX7mBHlNpJgYEdb1Ls5+w4ehSyzBNn80NzRSjqdBLj/V6RS9gZ5VXIttf/YriqRR8To=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G9z+deoQjK3zBqDZjFI1Z8IebAwp6piMjF5ZJA3FIDdp+JAlm
	K68IEfpmh64sEiLD/wuBwtg8kdSNO58ngLQPKplT8q3vqR1JHTRIi7EQEu9XOwOGd/6Ntd7utrG
	070tPPY6kI+qbQxu1P0ZZ5OIakGEAnnc=
X-Received: by 2002:a05:6512:31c2:b0:5bf:d9c8:6e8a with SMTP id
 2adb3069b0e04-5c1a9d27f26mr850005e87.50.1795012107305; Wed, 18 Nov 2026
 06:28:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110144436.1529000-2-ca@modelmiser.com> <CAJZ5v0jTHbr2KD3PXMdcOCs+QUrGrjGGuxOH7cbOe4kEF77d-A@mail.gmail.com>
 <20261116200935.2464922-2-ca@modelmiser.com> <CAJZ5v0gQgAAHWwS1ftxaTKHSeq1ADH7-Z6sm77d=_vWBrrkgTA@mail.gmail.com>
 <20261117221910.941588-2-ca@modelmiser.com>
In-Reply-To: <20261117221910.941588-2-ca@modelmiser.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 18 Nov 2026 15:28:15 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0igTxCekeQvHRBWon1n3xwEjKWrdo=ihex4nAfF=J-cYA@mail.gmail.com>
X-Gm-Features: AclHuK9_RD-cf7kltsYphMuQqxjbY1As-ur1LNkjfwtAWPltB8hmaoQr6kJXcQE
Message-ID: <CAJZ5v0igTxCekeQvHRBWon1n3xwEjKWrdo=ihex4nAfF=J-cYA@mail.gmail.com>
Subject: Re: [PATCH v2] ACPI: pfr_telemetry: keep the state until the last
 file is closed
To: Chad Aldreda <ca@modelmiser.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Chen Yu <yu.c.chen@intel.com>, 
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>, linux-acpi@vger.kernel.org, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:19=E2=80=AFPM Chad Aldreda <ca@modelmiser.com> w=
rote:
>
> On Tue, 17 Nov 2026, Rafael J. Wysocki wrote:
> > I've fixed up the above, thanks for the notice!
>
> Thank you. One leftover from the rebase: 3ecdc4c7d2bd ("ACPI: pfr_update:
> wait for running calls in remove()") still refers to its prerequisite by
> the old SHA, dacb7cef6f32, which is now 59a1090d0d17 in linux-next. It
> appears three times: in the first sentence of the message, in the Cc:
> stable line, and in
>
>   Fixes: dacb7cef6f32 ("ACPI: pfr_update: keep the state until the last f=
ile is closed")

I missed that, thanks for the due diligence!

It should be fixed now in my tree.
