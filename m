Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795732035;
	b=miH0PHBsnqMefjB9PlwFYr2L4XSroBtzMEpDFdbQqnIFDIMC6vj2rDuWHTFX0QOs0zFu
	 2Ni58k5xbWIlERFrCIX+Z8rU2OOU59f1xiGsBm/i2IPXXnydNKVBUk6/TmOGKZtuGs/Pb
	 fyUk8IF8OOVxbruKuq9/Cdop/TQn8tsV4Iu9XeuuFoawtiF5jEyS6Pxh1DYi+qK93Fc57
	 xLGstU4cssEQwUFE14U5tcKWvEp68CmatFwGsx5btVR2DiOXCywjFgBeDvxoOYuH9PyJS
	 l3QIpOzkW2cNTR5cRtLbrZ+n1khC+dIzOprQG+qJ0pd93SSizQDGt44zyQK4RGz34rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732035;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dzcO1ljQep1WtWKLzhtsWsA4ACOyuIv3JO6N5+BEqKo=;
	b=cWxSceDTHD7I+pC8eDiNE22Z1DJwyCRYc7I7TH+0diY+ihzWM8szOkwikSPDvuSZhti1
	 zIzUhoLXXcFM4Dy+JU1B8Ki+MJRIfCckIRE3Tv6kBD2Scl1M68UxgpMQyPJGWjlSUzznz
	 bkGSqyBGlQcjteIRUtS5JCWBiDP1rBW0SfoeMWL64wKbU9+YRwtdWeb0dbYd1HMclqgPj
	 fGm/vrTeasnreS+v5LQMr1B3jIYY4YWmyjXAErL/gHbBXCjrEpV7koUjPzZBS9TPGkX1H
	 AHTd/MrqEdvjcH3a4uw7UJWyDnSR2GP6Xw/vjpk6AQlTdfppoYCksCfADdQZVd3Rx5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJHtieXn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8607606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJHtieXn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D861F00896
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795732035;
	bh=dzcO1ljQep1WtWKLzhtsWsA4ACOyuIv3JO6N5+BEqKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FJHtieXnn/5kyPdGQrLtSp2ezUsBafiLPmUDPuPP8Z6rZpFdYIjChszQD2vwbLCPy
	 ToDJEKDB/sY0sUfv8/JIpjQfQzpErb3J2k7OmDRpZurJjpQ5RAxdcbbKj13mK0ePa/
	 5VnMAiFt9daf9cs+2Sqt1aVOwG8HRtbigJE1U420PiIRnKWZwxSylC6rYssr+MNe5y
	 SlZGiQRfnINdQ/14fiJljINOee3aXfudDXs7i89eCTKuOJ09eRTPAEZqFd79t8FGXJ
	 iYlc8/aaHp0KJN83cMY9Sj4it15gvnc4haJ15Th6Hy6QRaZOxZx69/zjnojzoEzx5N
	 CCaLJXnAwuflA==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d581da0aaso1026435166b.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:27:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEAhaeTACrSthtpvfpZKI0yet9NZJGaQj+ObxI4fQT2bKx28x1O2jnB/2bEfACmby4sKv8X3AYHkFKVfmw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MEuMYsmMT9iGIC2OhEFs5toFjfX0COziHHrmBsJ0pMoXl3nxf
	Z7VcHWd2ExbUKRXXHgG2SvG21affOyexfmQ3/2Sdoojqx1XFc9l198AOgL2ft1BxjOpXktkSYn1
	lj5Pi0HpaAdUxS8w8X+0TatmgqiwqAhY=
X-Received: by 2002:a17:907:934c:b0:c51:282b:5489 with SMTP id
 a640c23a62f3a-c513a4aea3bmr1775970966b.3.1795732033895; Thu, 26 Nov 2026
 14:27:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-ntfs-01-v1@snowrabbit.org> <awePnaRhBQLahPpz@hyunchul-PC02>
 <20261127-ntfs-01-v2@snowrabbit.org>
In-Reply-To: <20261127-ntfs-01-v2@snowrabbit.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 27 Nov 2026 07:27:01 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-Sacb2aDzfJYKiqay8QWmH9dkoeFfhonDkeg7c7MX9jw@mail.gmail.com>
X-Gm-Features: Aa3M54po-v6bUbiFArbvKTTwwy66ZUEHuur8Xwr3gZIwPtSHYaBnwTAfUdiyNuM
Message-ID: <CAKYAXd-Sacb2aDzfJYKiqay8QWmH9dkoeFfhonDkeg7c7MX9jw@mail.gmail.com>
Subject: Re: [PATCH v2] ntfs: keep i_size of a directory equal to its index root
To: Showta Ishizaki <zakinko@snowrabbit.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 12:50=E2=80=AFAM Showta Ishizaki <zakinko@snowrabbi=
t.org> wrote:
>
> After mkdir, stat() gives a size of 0 for the directory until it is read
> back from disk, where it gives the length of $INDEX_ROOT.
> __ntfs_create() opens the index root but does not set i_size from it.
>
> When the index root is moved out to an index block,
> ntfs_ir_reparent() updates data_size but not i_size, which keeps the
> length the root had before.
>
> Set i_size in both, as ntfs_ir_truncate() does.
>
> Without the patch a new directory was 0 bytes and became 48 after a
> remount, and one with 300 files was 248 and became 56.  With it the sizes
> are the same before and after.
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Showta Ishizaki <zakinko@snowrabbit.org>
Applied it to #ntfs-next.
Thanks.
