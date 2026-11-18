Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795009103;
	b=DwNDLDiugr15cnUs8P5yL8GzASovgCiFTINeF4XRe7B5/VHfU6MqNTAekcqbNrlYDCVk
	 rQSkN2yqAPp+Gpmh2Crp49brFmKhuyNAAy1fQAtzsrYtjoRgdZOWvKJpHJM47HAE10sMX
	 R4pg6wUI3rbedwDbSmOdnWiSzmogqjjSwbhSYyn9fnoDv4g7QIzH4DiJaFC5ahREuB5Jz
	 CfCQFJvHNTJ6uSonLpEiX4l2F0jKfgzWsDZI7zIotSAc2lJLTAf+DG71ZkK/aJ3R2om2Z
	 HJDdU4eOjMR/gQ/PE7Q8SfOPhjZ+UEq7JAGQK8X7+NNz3zeNV4lt8CSnJgroalXz9rA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Gu0OV3kkEAl4D4CjhNeE+xCTUXelNvJBkZGChj72U4U=;
	b=BxeC30gKinAVF+OmE2JGfHvI/ReCcuXjg2J9KDq6AP6bKOk/qG+WxObwdTvLBhfQamQm
	 RQHxlr06YYMfeER3fnpWBULiMGYF0VrvXfVSL8iPXrfT4bHz9EECVlBbQIZMAXCpPe+hv
	 7UpeNDDL5so0N5WRk8MnbfThFH4fQRqWK55MkfsiGsv+pMbwFYxCF7S3oAJEyOamLtfjy
	 W/EW7bBzihHa58pKKJ11dGVvgVi/dtGoW5YE9Qrblqe5bd+/bm8mJOac1s2gAN3Cj2pNa
	 xx/Wt8WmD6EgIw4tXC+bcZ3sUOSoXFxs4FD8X8JzgrQ8lzVM9mtQh9GUnI6sg/RjguA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=Pe34tTsI;
	arc=fail smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D7560A2606
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54D7560A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=Pe34tTsI
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-55d30c054dfso10536231cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:38:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795009101; cv=none;
        d=google.com; s=arc-20260327;
        b=Pa9hOlh2oq6yX30Ic5gLa4pPCwFwrSL9uszJm9DAMDLdXiyZQUW+7cfQu7uaaT2sMp
         G7t3f/5ydSENkRT9ykZJZyE7OG7UnVmaUMKjjo7WY/2K6dnb5XzDq63pxFV10sxqPkVB
         f8IWa92oBadH/EjAtuLHniZmyktlkvxo7d2T6MlEdjgJpbQOT4dIGF93ScsdvwZoe3oF
         TP26/BO6DrBMet7CawnMlk3q6W7lb9p6Y6oKU/l9+lIj4l2GP/FLThkaBkQnzegdvGkh
         AkBtv2p7Ifclmbq+AIVd3fy7XlDygw3yVZTdqrgPsgip64/8gRUi31o+Guv5C/ZrAG+R
         aSEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Gu0OV3kkEAl4D4CjhNeE+xCTUXelNvJBkZGChj72U4U=;
        fh=FOzwuuNfPavm+U91oRWAiB/tDouBrRA8lU8y5JmLAkg=;
        b=LiA9QVzhb/6lvWrDj0+mL+fJc2lGLPqC+jC/Pm8C8q79l1rxtR1llkkV9X87XTwpzg
         DGv2/NOZ13T74QKJemHYh30ke/yOMi3YqcV3KeUHGlkLT/O2M5elrVedxqWvEDCT6wWi
         ZHVBGLhrI1ZraHdi5E5eKilznJKK+4NajyAZiPPLeZFndqMGJYoYjibmGIU3+rt2LK9g
         ZkkVOnfVg4iafw061YA8mz1jclpwpG8JVxN59jdy0eQX+vzrUFEaxvKbeC9gGWVeJ2Rt
         9YCnAMVCZ8RbRphur/M9TRX46ykMy+LJ/BNXgE06Ko/6xbkpX+yp9RRcrNVMLWdv8Rqn
         BLbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1795009101; x=1795613901; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gu0OV3kkEAl4D4CjhNeE+xCTUXelNvJBkZGChj72U4U=;
        b=Pe34tTsIgFeEeOlE8BDyVJuTMubDV7IkG0gfFDkXSbD/+AwMJkcrj2xltdA98E10Jt
         WN8LQd0JEg98Z/33ga26tURmtWsAi7rYQ9NM9Ch20U1RmHdV/OD+mO+UwpY5EnnjM+HE
         8NzXR1OZ4amekDKtfzXQMjpyw8un5pJRKJMmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009101; x=1795613901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gu0OV3kkEAl4D4CjhNeE+xCTUXelNvJBkZGChj72U4U=;
        b=BYrhh0t5bkXRgYoDTB7RD6dCeI6R+xMe1D8zoQQ7maJWdYMK2T7bqpNK2Qw6onSevk
         PCPQonChrY30e/WCBuN6VlvZF7Z99wG+/rDv5DiA3iu2v0QGoyUugYYkrWYU2UioLrEv
         SKfPTSGU0k7ckdm9rV5AqsuC+/CE5roRDh7ptZIa2Wj3zgBs2sefMe1ceOdm8LnCcDbU
         +eRaZDDBAW/fgZTS8nUvUOigsU2KfkpoWAx8SkyQ507jzLhHjY9+EcG/JWFbJ52W+0xj
         E/JHS+bGLIwbZwGlg0mvbzc2gjMB3LPw2Yfy/+Lmss36GDiuMYVGeOTG0Oh8xbwqXDsC
         UN6g==
X-Forwarded-Encrypted: i=1; AL+hErGaEFomTTnGJDcOKarWrgsztdqfNGcx1lnGIhK9Of2g84IVF89pXRIXC+0IpHco6ew/0VnwmByB/uzWbLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9uUR5Zsb4wgXK9G2IWeplDgLp83dDtBnV7CpWYMULciVFoz6/
	eD/NXGKmoRMkQjFtomIy7L6c9AEKP9P9HMTlAAosqYSinmFV8bZ6AplrfpCXFjLN7WOvvUIqWyG
	GtRc9oMz0pEhRG/DkLhvjaVLe1yaWlPvR3CwUNoepNHxyFXiHIt3t
X-Gm-Gg: AYBFou2cS1dxCUhhofCkukWKAGo/HR7sOR6t5f/LX9tPHpz5ydrIF9drVN8x9+oiQD1
	sTPd1DyxI3eiZYaJk2MPvDEmoq9mu6sKs+XPsykL2uVPgKyvh5J9iPucoIUj4WEAdfl0Wpwp2Wd
	pwocUOnlVDnmFQEYz1+ufgYQupijxtSxHNVit5qws4BvztbVOJG3H4UYOc8YqY8O3023Ng5SZDw
	ScagA6Ax/xhNtIgqQLcRdjlxocGnYj80E5CuC0BwHjGfkte5TV6M3F1UlxEQzERb4EzKTOXE075
	JWmPuhbc3aC6eywCDjm8ijYMsVlYkhDmo8+1bSXkB73lq5hUQ0K/zVocqreIRZPP4Czd3LuhszH
	0MxsQcWo+rZ+ZkuXTZhOKYrVnYd7Jza6nzk4aNlyAy9hIKjPmSprpQ3BXS/J1G+XSN9MHDjErrk
	XtH4KMiBHVaKc=
X-Received: by 2002:a05:622a:558e:b0:55c:f47a:8c96 with SMTP id
 d75a77b69052e-55d5a340368mr39697851cf.3.1795009101249; Wed, 18 Nov 2026
 05:38:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117135146.3174252-1-graypanda.inzag@gmail.com> <20261117135146.3174252-2-graypanda.inzag@gmail.com>
In-Reply-To: <20261117135146.3174252-2-graypanda.inzag@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 18 Nov 2026 14:38:09 +0100
X-Gm-Features: AclHuK95w6kthqK2rcV5FGmp6byHyDgOGBtGbNMoFRdYyxphnOM3Now-gzk5ZLo
Message-ID: <CAJfpegvfKhZYuMQ914GUPNvdPi-nZBYE9qfwHVg6m+8ABuhqCg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] fuse: skip dcache instantiation for readdirplus
 names with embedded NUL
To: Junyoung Jang <graypanda.inzag@gmail.com>
Cc: Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>, 
	Matt Bobrowski <matt@bobrowski.net>, Gwanhyun Lee <gwanhyunlee@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 14:52, Junyoung Jang <graypanda.inzag@gmail.com> wrote:

> Some FUSE servers include a terminating NUL in namelen.  Follow
> nfs_prime_dcache() in commit 78d04af4995a1 ("NFS: nfs_prime_dcache must
> validate the filename") by skipping dcache instantiation without
> failing getdents().  Return -EIO from fuse_direntplus_link() so
> parse_dirplusfile() sends FUSE_FORGET for the unused lookup reference
> and continues readdir.

Applied, thanks.

Miklos
