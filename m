Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795024825;
	b=bzA3YN/8bCffvK6i0y5gHRD3qmfenX4yA6SR38VYGxdzDqaMfK6COLIIeQYZXbns8npO
	 /lVBs26gOyOnTO07GCYun6+Df8b2eZXeLm48SxF6WHgnbTEarGVkFktagLjSxHbLCWpZL
	 vI+XgU37FMYC3GrUnOhWrznn0Ha0x7E8CEhpZ6cl2E9lFg+H1YWvvYuRTWuaQjZhycdFq
	 /3agrI3vIsTyIPGcskX3qZ0IuxxFLs5oqtDondocSDBPCPAkG/TWdXFDPEzmtWR1ZS/Aa
	 Lgs6Xp0rDYEA3hQ03AtJ+qFSONFuSKzszjf338g4Wd330k47qDj2NAJQJN7Opre3cAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u4qdZCxQUja0NlcjEdDck3V1blA80itO4i7W2ltfseg=;
	b=n6SYOdEUtk8h12pFz7ciwj0JfOJUVsQ1unN05vvxwdbCx3QaKuUpTuj0IoVR1sI0q5K7
	 LoSiSSw5M8vd2NSNNO+G86u7hfiZRvNYZ5XxU8lOYVkmlN6mIkW19Y3X3gBdRd9rG9jSN
	 loks1zUWULIkLTAV/eE4xSeAbFPcvjeT/COmmunjyHG2ARQkZAylZ9sjOU4t/me+PvcHz
	 qoQ0C9z2NbmXfPOv3H19/5X5FH2J+C4pSyR+i4MamHNBYWDTzvaQDVs5Wmscu3Plc7Nc9
	 9r62vr+K1IsMyJbPnM82pgDFFkudiz3Cl36N2EQNQEtLL9kDKIKlLO6KeyyqrD0rbqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K+Mjuum7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF3A606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EF3A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K+Mjuum7
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso1781257a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:00:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795024823; cv=none;
        d=google.com; s=arc-20260327;
        b=B4OXb2AkDyos1LliArlXTnzWxSnuCfMo5D0pcU8AOT7DEroh50z9/AEFzXkB450bWd
         uDHYc79GABPI9/M8W7rvii/7emociRT5f5eCSyLSLRHB92xHw8UDonhLO6jh8fuNnxDl
         620Yyl4OwxoLekGl06ZAcaQRtxsF7XlDCMSdhLs34oX2MG7yEKk12YKDABO/59Yhg0gC
         tzlZmVX/QmMFIrHzjiUHiLrrlulNr/gRpuDMXjAvfP41Y9vO/DLmg5bx7hV8ULYt0a1t
         /VfGx8M6zpn8Zb5b5kzzvTHqyfO/AJMi6j5TtHjOPOJPxE/HPiPVuVAo+w3770YnnxoH
         YPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u4qdZCxQUja0NlcjEdDck3V1blA80itO4i7W2ltfseg=;
        fh=6dlz8ibtbHq4gI32vlbKDbvRKu11UK+VC594t/RTCmI=;
        b=RbrSGI5TfCm8Z1Nw+3+PiIcqKfBIwqNr9KR//+QwQLS0YUwnAxgNZDd03D7Bpw5FE4
         oYly49A6VPWltAV0t0FS/ZU+0K7hm+dlGqtvWN6W2zLxT/FWJ5XiyN/qzQKbqZH21GK9
         8kAs59Yyx4ekfjLWGImPQjVHypH09Y1xOibI8rq5ICkEYS/NoXTSnUu+UWFu/0AW2AA/
         VU6dnBTkwDDvYsopM11GuNksnURU3dAUkj6FiFI1NLD0J10ZsxyGUSVgsB+HW8+Kwnb5
         SMl5CCWpoOm2hpnLWvltRZb22ItBo/7ZXEHrPUyWrwSq7C65PBOCgT2yBIbhlpNZEzja
         A3hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795024823; x=1795629623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u4qdZCxQUja0NlcjEdDck3V1blA80itO4i7W2ltfseg=;
        b=K+Mjuum7DZlbzQhj44dxy5A6maxZYAyZ29Ulwd8z8W13r5opinN8nQyga6gKKUTIn3
         irv8hTc3j4/gaqyiAXmOT+UTNk6HC+MY7Uf7a9b6WNEm5JkkOxWWEAKop9rvi+cr5sej
         mDDYfE32YCXVoQGoWcdnmed36eW/gsmlzt59+Dy3/XgVziXonW9SrTYu/k8rkGTUf3LD
         8YkjfAu0RpO36JcNXYdFoZwXhxqjZj12t2gRgljQWUSsmQJ05Bx1gGIw0cTe2lfCYBki
         DxIOJYRPP+azMglgRqXMkXmo+hGpR6ZcpcRAi7arTWNZ3zrHbx/75jBgltZUXBNNLpuB
         QlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024823; x=1795629623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u4qdZCxQUja0NlcjEdDck3V1blA80itO4i7W2ltfseg=;
        b=JI7gpOdtZxqW3CsQep9raGmZnmKBipDIQVIZycAKrlh7ymT+OyJiAZu9rYh9P6O8SK
         xyrikJniTG0dKrk1LoBaaFCRNn/8jK0ygjTNK/uDRP/kzuZVWcFn7V3V5Nw7Y/bF1V5I
         2u8cIHWxwQuezDvGLycYmrZ9E/2fbPa2v5qOuHJlCP5q3g+t9szFRwVyKixCk+i0OHxs
         +8ai2wFbVT7bjOI1fndoB06vQ2K0W3aqiPruL4nLqn3YknalONuMnxFRVqVTZYR/iYDL
         BA6ybNBJqqReG2GeUiTiQ+CRuzHF74eXCubdIy6O6XY1lK4AGOrVTQE/YeXccnUa4lyT
         xfQg==
X-Forwarded-Encrypted: i=1; AL+hErF/a1Q/K9B1X/FtoPaPHZXFZLgjEHjmSHcEFfjrQzpdHgh461FC7QQpVRS2kmGi8gN8fT7nqJH3epPrvGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T+xCEfgxWJzmHOuj7nuYRqT65fGPsev3KSvI2LvZQd8I9G7K+
	0mTxBb1c2DHCw4Fgj4cWGiYacnFUNdM8a1fUL8Pu1+3Jt7ewhhaw4GukW33stc5HkncnKIK0273
	DQfbZyDhwDgo0K7jfuP8W95u4wC3OiPCYrqSboIQ=
X-Gm-Gg: AYBFou0HXQYipoKnjk+K7ZHh/A7VV2kJ9TgWzmruwf2Up3NDuml37UVUek/zkFOSyqa
	uuAhASCKBxq1OxyG+Ih/GJRSlUDo/zrk+S8/N0yHcVB0nJFF3ckiy0qoau9a6jdaGpc/XlyrOX8
	p8AEcPYnxKP/ngNyLBaEgXCt3MM0bGWNEP5F9G0qr3M5AI9l0LdpzER/OI0iZno4QsW4KpZAgvY
	c8zoWxC8pjlQAhojRJ5lWnJhQzgkIcjryI8wRDc0b2sBmk/thR5I8kTthUd4f1qt3zXy4NbAwk6
	HZe/GqJcZOxneEGaZUoCdNZJ7cl3vN39htCBYc1NH6aydZ6vmoDdEwHqLFXGDG441JtDxq74o3p
	8N60T5hmHy5ETIb++cukHA5DjCEFqaJ0+RxVSTiuyrXsPbmzjhTa2UAAsN3HhPT4j1DolSbc=
X-Received: by 2002:a05:6402:1607:b0:6b6:4dcd:967e with SMTP id
 4fb4d7f45d1cf-6b887ebebb8mr2374799a12.20.1795024822234; Wed, 18 Nov 2026
 10:00:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-b4-ovl-containerized-sync-v7-0-54f45743fe55@toxicpanda.com>
 <20261118-b4-ovl-containerized-sync-v7-2-54f45743fe55@toxicpanda.com>
In-Reply-To: <20261118-b4-ovl-containerized-sync-v7-2-54f45743fe55@toxicpanda.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 19:00:09 +0100
X-Gm-Features: AclHuK_YmUY-cyrn8sPqESOYVBMGy_5scGhTZjCC06dq4P7IzI17kYjTkaWbeHw
Message-ID: <CAOQ4uxhp73OkM9-OUKXeO6Hrq2sV2oYYJ7CCzD=-mXHtRjBxDw@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] ovl: no fsync=relaxed without data integrity
To: Josef Bacik <josef@toxicpanda.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
	Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:03=E2=80=AFPM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> A sync does not wait for a filesystem with SB_I_NO_DATA_INTEGRITY, which =
is
> fuse, so that a server that does not answer cannot block it.
>
> With fsync=3Drelaxed, syncfs() and unmount of the overlay are going to wr=
ite
> the upper inodes one by one and wait for each.  fuse_write_inode() waits
> for the server whatever the sync mode is, so they would wait for the
> server once for every inode.
>
> Do not resolve fsync=3Dauto to fsync=3Drelaxed on such an upper filesyste=
m, and
> fall back to fsync=3Don if fsync=3Drelaxed was asked for.
>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Ha I very much didn't want to include FUSE in this exclusive club
This was an oversight on my part.

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  Documentation/filesystems/overlayfs.rst |  4 ++++
>  fs/overlayfs/super.c                    | 13 ++++++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/filesystems/overlayfs.rst b/Documentation/file=
systems/overlayfs.rst
> index 1a59500834a1..8a007fbc5257 100644
> --- a/Documentation/filesystems/overlayfs.rst
> +++ b/Documentation/filesystems/overlayfs.rst
> @@ -870,6 +870,10 @@ The default is "fsync=3Don" instead of "fsync=3Dauto=
" with the module option
>  "fsync_auto=3DN" or with the kernel config option
>  CONFIG_OVERLAY_FS_FSYNC_AUTO=3Dn.
>
> +An upper filesystem that cannot guarantee data persistence on sync (fuse=
)
> +does not get "fsync=3Drelaxed".  "fsync=3Dauto" means "fsync=3Don" there=
, and
> +"fsync=3Drelaxed" falls back to it.
> +
>  If the upper filesystem has no writeback (e.g. tmpfs), a non-default mod=
e
>  falls back to "fsync=3Doff".
>
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index 5960974c5af2..31a58e28968c 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -765,7 +765,8 @@ static int ovl_make_workdir(struct super_block *sb, s=
truct ovl_fs *ofs,
>
>         /* fsync=3Dauto that is not resolved to fsync=3Drelaxed means fsy=
nc=3Don */
>         if (ofs->config.fsync_mode =3D=3D OVL_FSYNC_AUTO && rename_whiteo=
ut &&
> -           mnt->mnt_sb->s_bdi !=3D &noop_backing_dev_info)
> +           mnt->mnt_sb->s_bdi !=3D &noop_backing_dev_info &&
> +           !(mnt->mnt_sb->s_iflags & SB_I_NO_DATA_INTEGRITY))
>                 ofs->config.fsync_mode =3D OVL_FSYNC_RELAXED;
>
>         /*
> @@ -1499,6 +1500,16 @@ static int ovl_fill_super_creds(struct fs_context =
*fc, struct super_block *sb)
>                         ofs->config.fsync_mode =3D OVL_FSYNC_OFF;
>                 }
>
> +               /*
> +                * A sync does not wait for such an upper fs, whose serve=
r may
> +                * not answer.  A relaxed overlay waits for each upper in=
ode.
> +                */
> +               if ((upper_sb->s_iflags & SB_I_NO_DATA_INTEGRITY) &&
> +                   ofs->config.fsync_mode =3D=3D OVL_FSYNC_RELAXED) {
> +                       pr_warn("upper fs does not guarantee data integri=
ty, falling back to fsync=3Don.\n");
> +                       ofs->config.fsync_mode =3D OVL_FSYNC_ON;
> +               }
> +
>                 if (!ovl_should_sync(ofs)) {
>                         ofs->errseq =3D errseq_sample(&upper_sb->s_wb_err=
);
>                         if (errseq_check(&upper_sb->s_wb_err, ofs->errseq=
)) {
>
> --
> 2.55.0
>
