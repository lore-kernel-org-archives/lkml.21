Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049568;
	b=F2hZOvRlLoODC9jeIEaEqRcU4KQdVBLwOkR+PYpqVxHenf5eSWSHn3m3774Kmhm3Gv+b
	 P0HsZScT4CkTrgLpz8YbPe9LcM/qDqLJuO+fsKBMIBW7Ba7LPVTMdt5e8UtyFdrYToLk5
	 ZAU9y5d35EXeO7ZnC2/3yPHI7tetsB/xpnd6AVFHglo3HWFmXKL6cuQy6+bByJscTFhwy
	 LMrbVUeV6G+23XTkkWjxYSNS83pcjT0e0/GqypHBOlM/xLI1vv+ZtAsgERZUme/s+AgCB
	 bdQxdzU8UOjmxQv0HWzvYWo/sdNvQnonO5fKfs1toYrMRSlDfrhPB4vECbj8JLgHCgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049568;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=3fqxcRA59nGG2GFaHTxSrJALKfPpvhTXvqIt6jzDVGQ=;
	b=SqOZ8ndDdHbW22Qre1yyNmTkw2RtlvjifS3+X3xRKovoYHRtKL+t62JjMRtPGTHg2xF2
	 141GBvoOoEmXO8paQTzwvtVjbs9ii1fGToW1FhR0btS65jYhkwELCgCLJwCMlQCQjwly7
	 BQQrT2++6nJMz2056AWydqT96fzIMzXs5qk4Np5k1dhxOJVeaMFuaYdbcIYUKDZ3xeHSh
	 Jvxdg3bJeHupH+6uWWcng/ZWq6emDX9F1m6jParjurJcVWRAZbNEANeElxCLDVa3jj0zS
	 0KJwhvvkgvhhLSCq3pgS4BspO5Q41e5WZyyDqQo6V0WfnEyTDyeOO8AaKl44hYTbfKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AbxgtOSe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A5260A2600
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AbxgtOSe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC0B1F000CC
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795049568;
	bh=3fqxcRA59nGG2GFaHTxSrJALKfPpvhTXvqIt6jzDVGQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AbxgtOSe8H5zVOQqseLvd6hauju7xcjsA9MMWd1u1ANcmQoP9da5w7EeEBSjNDxfy
	 X+mOhSJUDZtbGbRgHG+dDvdVlubim5OC5GPCWX0n+yLdoeFZB75/NaHp7zS5uZ5UF7
	 sPPn0DLO9zBorpMAF9Tsn6+iyETmZ3ZS03AxEBKiCJx0trJVxavfjAwh411/MuaW1I
	 Yy5xvqODqAXf9NiPci/wn3qS1bvDAVMpoPH7eASO73+zYWPG3JOKMsxkZQjRXNFcIP
	 96HVRyUfJL3239fBf7qj9YrSH3FST1vsf4K/Y6tex0/9gjhxoU07iwqwCvlThs64QN
	 J0+1Q1DbCGCOQ==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso103282666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:52:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHWbsimuJwuVurQhuopGQgYD0lC5Qwsktco2Xg+xR1CkCFyP21JFJr/HGG6zKcwD9qO4KdqOVLggUW38FA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zhOqHeRSj462Y2iIhn5SGA9+lX4R0BF9jzHZuCFHevXYzbtrb
	Ww+t4y7kuyVxgIECk/7IxkU9yWyhjBf7jej2oQXr+xVN0HOY7mNcTv+/D4xfksZr0p/tmN0BKMY
	5bpr7nB+POFXiymTTI+nu/De+0CaJaZc=
X-Received: by 2002:a17:906:7306:b0:c29:4b57:503e with SMTP id
 a640c23a62f3a-c512b4373d1mr21641066b.1.1795049566753; Wed, 18 Nov 2026
 16:52:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118155521.70611-1-icb@fastmail.org>
In-Reply-To: <20261118155521.70611-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 19 Nov 2026 09:52:33 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9=4OfQ6HESrMFhuffHANTWDjYyrt9VDQpBFdV8i4Mi4w@mail.gmail.com>
X-Gm-Features: AclHuK9fpIXSg-K6iwftVqFnqQORnobjsfqgoT_nBWRu89S49TH0_lVl20XZ0Hw
Message-ID: <CAKYAXd9=4OfQ6HESrMFhuffHANTWDjYyrt9VDQpBFdV8i4Mi4w@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: fail SET_INFO when the security descriptor cannot
 be stored
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> diff --git a/fs/smb/server/smbacl.c b/fs/smb/server/smbacl.c
> index a87c22fa9a6e..3770dda2b3ed 100644
> --- a/fs/smb/server/smbacl.c
> +++ b/fs/smb/server/smbacl.c
> @@ -1984,7 +1984,14 @@ int set_info_sec(struct ksmbd_conn *conn, struct ksmbd_tree_connect *tcon,
>         if (test_share_config_flag(tcon->share_conf, KSMBD_SHARE_FLAG_ACL_XATTR)) {
>                 /* Update WinACL in xattr */
>                 ksmbd_vfs_remove_sd_xattrs(idmap, path);
> -               ksmbd_vfs_set_sd_xattr(conn, idmap, path, pntsd, ntsd_len);
> +               rc = ksmbd_vfs_set_sd_xattr(conn, idmap, path, pntsd, ntsd_len);
> +               /*
> +                * The CREATE context (type_check) stays best effort because
> +                * the file exists already. A filesystem without the xattr is
> +                * not an error either.
> +                */
> +               if (type_check || rc == -EOPNOTSUPP)
> +                       rc = 0;
-ENOMEM and -E2BIG fall through to STATUS_INVALID_INFO_CLASS. Please
map -ENOMEM to STATUS_INSUFFICIENT_RESOURCES and assign an appropriate
status to -E2BIG.

Thanks.
