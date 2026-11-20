Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190318;
	b=B/hrUvaYoTMI0uPpfN3GJTVk9I1CgnF14OGRj1ZH2YYAasHzSaeI8+kkY6aED+L8EqBL
	 LifOK5A0QL4cUV434L15gWzAIMZ8j9+c3KzEdI/XZwQYRdJN8AhebXRM47mGUi6HuMiEx
	 OpZzH+Roh86umRO6kDhMKZ3k3hzpr/041kCY6nQ46uqczrjPBAG3+x5TTJCc0CJbW2B2o
	 03PvgVjUftnRBzAAVUu22SU8baIGbTZnds9uvxGbxIcVtzsgDb50HbkDq8mSRKMuQhFLn
	 TNgnh9AfLsK/337OqEpcTVEd4PNonZ7BpcyslIwUIKFzbCzUe2zCG2ZWmUXwLdCGeWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6kM0KOtHeHKXYurgzFZtJQepqztK7z7Hv0tSSDFAXAE=;
	b=5opTVHh9zRCp23NQdrZPzzxvq/QeyLnBY9kq1zBpfz7f01XQ/LIyVHr5n1uR8Bx5t4L0
	 CPgGVMcybrOdCvjwO5cQwsKsoyKeUlxLswCNjBdSFcM5vU+r5CKQMSUvKY6UtwhEMul0K
	 eKYDTHSPkt3s2mHt66BpQa7CE9qKBS0cLQmUhj89Tb1AkGNXdUYx50tvgoeWi5z139w9e
	 NTNULWkVntM88Qs+HrzjArgo4gFo074XCAnOp+p6lnkbtntPZX+OjRJTtSxJqILL3JQCN
	 8TQNpRWLtPU4AB+i8UdJtvWtRsRnI2JGb00vFXYCFDCJMfM4du8fD+NWB15HoIKTRpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTc+eMp4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C062760A2616
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C062760A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTc+eMp4
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so1290304a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:58:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795190316; cv=none;
        d=google.com; s=arc-20260327;
        b=DS1YB/5QhhmLcxR0LIZFymUcuON/GvAi4kOzVISpkkvR0B975H54SeF5FalNSdvype
         ZV+S1eM4i+O6wpVZDFOrT8jcyDjvZ3DYu4clU/ATeFntLBFE8Kcxa62KwN6ZY+CSzH6w
         AHbicJ/CiF5B6YPuBOQEFhZF5ZE8Sa0mMcJq6v4qxKZkjOygJc/YXBYL3AecBZpG9T/X
         Qtzb0cyhvWQnrOF460xcb5EOCEDVDsAoLs1AVEmdfKRCYIiiJBynazuOY023XeGnl/xA
         vw3iE/OEmJ9gR7b4Wg4nSbsKOB+7nZX4mRb5gwE7t6FO6sjOS4yuDYrEEAglAiPOgu88
         173w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6kM0KOtHeHKXYurgzFZtJQepqztK7z7Hv0tSSDFAXAE=;
        fh=afEpcJGabAOXqOIG0W8AshzapOpRXBQBgqRRrEp6ies=;
        b=ChdHWrNXcZxAEmnw9+GLT83iQAzYDYF8XgJhbEsePIpU/imRI02r2J0LNfOvAG8bl5
         Ky/AXVufX03puMt7jy9KPCwQ5VXbV33tgGInFEW7Qyjvsbgf15aBpLaooVSP6kFZTQS6
         6UHCr547W6Wz4mD7U362BN6E6XDwJBjoe04bvQrg1+Tjiq3GCaXV/c3fl7oB4XhE7lXW
         GTPNZxP64yh6EbxYTeCw10B6HOhkJIrG90byzzbAQnnOoLWD/OFH4/3JkJfM7aNL4Y12
         xiOUJt+ZsMHz56TpWM+0+s1W9byy+9Rvd1N1qk1j5B2+YqXo0dUKyBVyXjb7iOMa76hh
         js6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190316; x=1795795116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6kM0KOtHeHKXYurgzFZtJQepqztK7z7Hv0tSSDFAXAE=;
        b=eTc+eMp4bITMI7jgx5jM4l7NyEFh1c9lTC1VxvFXF9G+vcYBoZB53yLQdKfrQOpf6F
         Mtz8FTmSSTw6Ei7un/2M30yiLReetEhAe/lO4dm/xLE7CcivvqjbhlK/KCKhN5ARxijZ
         ChezPcoSYPSGA4dYvVLO7Yd9kb7uDyVuUiuKTqgzbCAKx1XbYJKzxg+Mx7ccVg34Vcwt
         Sq2087h5YZQNFE89KJ0Ys4A0dIfGzwnygs4zE++uxupxXjpFy9vZB08cycp+xBcweq9+
         96UTqALXMzvyeJr5t/bjHIhkmiHd4xvEUtcz6apgxXUf6gRVWrykVKb8LpEbPe+pU8hS
         b+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190316; x=1795795116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kM0KOtHeHKXYurgzFZtJQepqztK7z7Hv0tSSDFAXAE=;
        b=ZlVtVTqXEUraW8icYviuvgrL+V55c+TLD4T39bDUs9O9Lf2M+imO10TBfc7KqpUht3
         1OgdaHJnUmudSUTsro5JCMuiPcAVBzTuOPhmJdrejWbPWTP2LrwFfa/ICMT9FTL+T8mM
         ufhD7jgsax4hBUiR94mnEISfl5GUh/UGOGWje9IGDJdD0Bgn7p+cA6MTKa87DZXz4A85
         lYwnoFkziWgAHzT3SgCJNks8bfT8d72m94ZUg4Dw2i0Cp8bksa9fUfGv/38P2Ju3aKLj
         OD5r4vKYKJfb8pgMsjJ2aMzgW3JJeS23XiOpdVnrHCRgaCc06Lo64S9okaOMlPE3EbXR
         p1RA==
X-Forwarded-Encrypted: i=1; AL+hErG3HpjAhmQXakvtWL8CErhQC4PVyc8i1bVfgx83f+dYgVvwnhWUR1T+6M5Y2VYDPfl/7gPc2A14C2z5iXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4VtTakazwTvE4ph4tkk6E3hXqwYiSRH6MAAemsi0+hvqwxlFT
	M5gy0RV6PTeNh98wh7HpKcD9KXHTtvZCRp44Y0iDGkKGFVx2pKgfwXdlys1GgxJn51XKAjIDU7t
	lbeQRIKXt8AEBsZwqJ6K9NYchlivTM7g=
X-Gm-Gg: AZFdTZfVszzXHo4A1KOAoHHj4Gwc8TCVZejSCq0mkhPrBhasb/Yvp8P8giK8VNQQ19O
	vhxEgWhYhGAIy2WBkjAdbkbOfefLxJn4uOhcgrvnfC70bwcf0KtzAfHSivDAuTIE0NlOv3T2gLO
	6Nm8f/dBJlvyP/wJyM1LBnkMBYmMHnRzxyVty9Z468nlsmEmTAVIlGeXSWz6xxe/3qOpEd9KphU
	fcI7zzS5Ls/Bl7j/Q4zPzMzjpwzUeGK1s8HU5U39lkbY6/0FjC94N/Y4U1z8SJbJzWBEpOdGB+p
	mj5e1k0oTGKIoyVserkJvvE0nRQ0C8SKpKtbR8+hFfiJoLRwwX8tsMDigd3zG4HbGzcMF2rLFFh
	dmN+yO5vOUe20/eLo62RQVNACySM6TuSQfDKZvf/CS9AY6nfzU9ntWvQkKHeeCqu6eyjxGA==
X-Received: by 2002:a05:6402:52c8:b0:6b8:5aba:6c06 with SMTP id
 4fb4d7f45d1cf-6ba37d652f3mr2090064a12.14.1795190315774; Fri, 20 Nov 2026
 07:58:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-4-koray.fra@gmail.com>
In-Reply-To: <20261115180343.576773-4-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 16:58:24 +0100
X-Gm-Features: Aa3M54pideZA7GJITw5PojgxjktVU6GBxKullq4dSyaJ0XYgg1VLGv1zO6-iMnU
Message-ID: <CAOQ4uxjdEiuJMQxtSL8XrPYHSamtfMh+BM8kS1wj_PVME4JynQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 03/10] ntfs3: make crtime user-settable using ptime
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Since NTFS supports user-settable file creation timestamps, map
> provenance time (ptime) to NTFS file creation time (crtime) by using the
> newly introduced ptime API (in commit "vfs: add provenance time
> (ptime)").
>
> To do this, update ntfs_fileattr_[gs]et(), ntfs_getattr() and make it
> persist to disk in ni_write_inode().
>
> The timestamp is now retrievable by using file_getattr() or statx(), and
> is settable by using file_setattr() with the FS_XFLAG_PTIME flag.
>
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  fs/ntfs3/file.c    | 20 ++++++++++++++++++--
>  fs/ntfs3/frecord.c |  8 +++++++-
>  2 files changed, 25 insertions(+), 3 deletions(-)

Please don't change the unmaintained ntfs3 driver.

If you want to include an ntfs patch work on the new fs/ntfs driver.

Thanks,
Amir.
