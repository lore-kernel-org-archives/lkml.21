Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795779355;
	b=RyT0Zizqnv6X8qByDbyrNQJnvMVWF32k1ldF71rsHBHESl5NBTEL4FMARPFN0SL/bt3W
	 Rt0imFkrbe+M7filaWOuGCAeKoHdjoSA1YT3lciVSyUPMzVdJCN2r/NxWaTfgqG7rQJoV
	 b3oBTxBBOLLX4ka01gu1z6Q2z1Gp4bKJNon5aLwJMDQgM/49Nz7y65xb1boyyYQx/H8bQ
	 l4csgBTSfDPFDTCDFOsVLXhYLqpL1Un+ty4jYePIJ8mtrbq/fJeE2Rg7Cv0naJ8YkyOoG
	 E5P/+pe5jC/TYGv9CWsIroeJfF0Dsc8zOtrsR7CWZPb62e1VVf9kF+DQjY0eY5EqRrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zckLxKTSVIvkUKQrRBT4ZQPN8xSZzGvjPSGz1nKrgeM=;
	b=W2mlH/AQt7tK6kx7pAUjVQDtYazkQBzRx70Adyg6pobuT79a3nJjIedNXf2Y/eM62Q3x
	 JbwM68438JoxTsymmG6yHT8CGgmQsPWZPQlMLtGJfbNY0Y6o4GUl1nMc9xfnXKADxjbQz
	 PE6DfaEuGwkdvPgtjpNxhR5V4m4YXEd5IOCgZ3IOEYOeHB4g5/PdV1MRpCO2vbT6UvAB6
	 RBhxHUA17aGw1WNM6wN1pcalDQyejKySt4vSYANgSANnPEVgjfK4x+WRFPo2pc9pnEox9
	 EIMteU6hE1PqNtC5i1SwDWvv175Rjo3QmgoA3gkDvBO7HisCv4xhflR5v3NdL1RLtEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vfl6nsas;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035DF606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 035DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vfl6nsas
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6bb06dc1fffso5586646a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:35:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795779353; cv=none;
        d=google.com; s=arc-20260327;
        b=LlJ0IyqPnnDuvmHFwa3LqGGyzQMDsHAZfjXARkBkfarq6Vu62oawOUOnYug0UPPTCB
         gMAkkkw49de8nmQnZUE7xuWhhsc05/tn/LzmFt5oEX9gAkgbVuZNL+aPc1hS6ZI9V6ZS
         QSwWyRLg3/5AwyD9S1cm6fk2L90Ja6SR5dnIlcJE4mvHENcwQjYPts/zcd/WBYL04QwE
         glTplDVR78Fk6NbARxdOv+LWiZr3iM5RjXfgwVAus5lhBaoif9M8Gj26mqNk49qCzcMo
         FroCx+t1gi5aZwVUstr8n/s6PCi5lBRbFdZXvHmQnYvug/nsb1d6IAx6IY0sDFscNc6C
         Z5hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zckLxKTSVIvkUKQrRBT4ZQPN8xSZzGvjPSGz1nKrgeM=;
        fh=o8lcYilJuubuBo5MlqZ9h1YcQ6HKwBlzRDZvygeLQlA=;
        b=GRiU4kxLLI4yW9XqlSMVp2ZLdFDmiaH3vS7Lla/253aDOudqEpVRWUHvSQAWtTZq44
         p84RjPAMK+b+MdLPIAhlmXAf9VQkt46jN0ionp8dGBASZOz15lGvla+gMVVdmdadgB73
         hWikFySbJZb2ayP5c0NMtKK8a5Wl4Jn/iilqk38BJKcQaFqs236dOLmGbybfv6YLYzAC
         p8b650IEwB5T+H5J/Kncy/NqVOYijmUQvvQByROooTNFGHYZ8ftWUgiHtS0PoKLT14AJ
         XyhO1aHHJe8qImKiHG1UXMK7B2y3thiUwSDV1qxlgkzIIARAcw6ZOGbqqKjO3cVdme9t
         z+rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779353; x=1796384153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zckLxKTSVIvkUKQrRBT4ZQPN8xSZzGvjPSGz1nKrgeM=;
        b=vfl6nsasnL9MeKJC3PKlnSrIcRDT85xssIPtgR+brRFXXZVzFiEq6BssOPBNi+U1NX
         rACDgNvbgFoECMBGeOSxlv7f9ZZPlw8jbFZGiBU72Swu1vfaeCoxTTziHNw7UcLrHWJR
         AKKiFDsyO93LUbEmoG+hHJdZEh650ptJD3odyQ/w9fPYc4PvSJ0mm2Sf5PxZt3k35+Xr
         wxob5ZuRAYUg/cXXu2K92l8bOQgHSH8rodtPWHXJuG7bBF/5TfgeoeRbDB0Wy/K1sCCD
         uVtxcxA6CrL6WBmCavRtirj9U2/SaEAzfTB9jrKlSoL4xIH/1z47TjHh6YE/4ycLvzHM
         m/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779353; x=1796384153;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zckLxKTSVIvkUKQrRBT4ZQPN8xSZzGvjPSGz1nKrgeM=;
        b=xKIahFpCKE6taIRC5HoWlhtqQNP6wxz5ozm53+91aMH+84LvW1GUTReHP+B4H3MvCY
         eX2fW+j40F9OOZQMron7S+mL1nLPrNB0vVlrAvHgqOIwGinhoTf6g0MwZ1hEhMGQ/dss
         KDR6tke6THlg87GjAjX8D8ka1DSWPoZytPD7zknGCd5vbDlmPHIAXUtXMYkYIgOsgVZF
         TtL5JviHbABs4NrUDg3Vh7L54l6c5vqBe4QKTnuqkjpJohLu8F26ov8foauDb6FeLKiV
         t/1pUzzPl+TQ/bJvL5PqlAxgwryE50xQ3XfzAWCK/T6X+J4z5Vp6j2Pw7chu2WLtamKx
         K6Yw==
X-Forwarded-Encrypted: i=1; AL+hErHKFMnl5P9y4fR5LzhIJuPuuGyZ/wCXA9lAEwN5m1GcBbOFjMpI7jVRE6jWHf4bYMRQIq1MtUe0cBm90WM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NLjDJgcQSuNdyaBOHMBo/y2106G5quuEF+w/pd6JXr2eRbY1N
	7TcWAAFREogb2Z5Q98mx9KtLGmqICWnmh6wz4Z9PMjyZtsIXJJmcJoKPGfBbmKFcc9LzVGEMZDN
	JiSatVTphOPw2dhy/7jFQM2YIayWmksQ=
X-Gm-Gg: AZFdTZecPK0iJECaBETDx7MU5hwUZUqGBPZkzphB9uA/At41R5+bUoO9PzKv88OE52o
	xeuZM56vACreQQfD8V9ceWuw5ZU/Jlv0+m0lRdZEoEZ/I4kjrIMN0ztbvSJnRSMhfQ6fqkCH1FE
	FNK6q4R/O5CnUPSwWnw+vu5omjJnbzf/L39nMqsWS7+wGIyIyqH966lJ64p57txpRXkIm5NRedW
	ZPMfQVAgK4sEThklqo3ugT7KqViaqHc45LBPvSY/MubqCwbAIoxPRLIiOszE2y5fdktNc5LalJM
	/MfP2VKanUShN0t8nhN/B88Ufp1qygekCK3fuYXK/janFOixvkuxVilmTG7cAsd23Jg/XjSu/RC
	gGNFMzvD77kOgaqWiyHNSF1FusbEdrHxqKeDS+DxVdbViu4Y8E2AIK3gM/7CLuOaNRmLMSw==
X-Received: by 2002:a05:6402:42cd:b0:6b7:b872:27c0 with SMTP id
 4fb4d7f45d1cf-6ba37ebff16mr18720566a12.44.1795779353347; Fri, 27 Nov 2026
 03:35:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126163114.403846-1-koray.fra@gmail.com> <20261126163114.403846-3-koray.fra@gmail.com>
In-Reply-To: <20261126163114.403846-3-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 27 Nov 2026 12:35:41 +0100
X-Gm-Features: Aa3M54oDVUmD4L041vA_Ja2kzcuIcnu49jvnV20FPfNA1gUDEEUT8nV16GU1jvk
Message-ID: <CAOQ4uxjGLfuZMFABCwMvdXwnU+P24G_aTJLudWbjeSmWwyDF6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] fscrypt: update fscrypt_prepare_setflags() to use xflags
To: koraynilay <koray.fra@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Eric Biggers <ebiggers@kernel.org>, "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexander Aring <alex.aring@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Andrey Albershteyn <aalbersh@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lauri Gates <lauri.gates@gmail.com>, Christoph Hellwig <hch@infradead.org>, Dave Chinner <dgc@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Update fscrypt_prepare_setflags() to use FS_XFLAG_* xflags instead of
> legacy FS_*_FL flags.
>
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  fs/crypto/hooks.c       | 10 +++++-----
>  fs/file_attr.c          |  2 +-
>  include/linux/fscrypt.h |  6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
> index 149498bdab94..52d6a33fc9e9 100644
> --- a/fs/crypto/hooks.c
> +++ b/fs/crypto/hooks.c
> @@ -182,10 +182,10 @@ int __fscrypt_prepare_setattr(struct dentry *dentry=
, struct iattr *attr)
>  EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
>
>  /**
> - * fscrypt_prepare_setflags() - prepare to change flags with FS_IOC_SETF=
LAGS
> + * fscrypt_prepare_setflags() - prepare to change xflags

prepare to change the file attributes with file_setattr() or one of
the legacy ioctls

>   * @inode: the inode on which flags are being changed
> - * @oldflags: the old flags
> - * @flags: the new flags
> + * @oldxflags: the old xflags
> + * @xflags: the new xflags
>   *
>   * The caller should be holding i_rwsem for write.
>   *
> @@ -193,7 +193,7 @@ EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
>   *        another error occurs.
>   */
>  int fscrypt_prepare_setflags(struct inode *inode,
> -                            unsigned int oldflags, unsigned int flags)
> +                            unsigned int oldxflags, unsigned int xflags)

This here is a backporting landmine -

Changing the semantics drastically without changing the helper name
or signature.

Please rename the helper something like fscrypt_prepare_fileattr_set()
so that backporting mistakes will be caught at build time.

Thanks,
Amir.
