Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795440299;
	b=uvgH6gkrlneLFNce/6XMTWE3Y5M2C6fGQtfkRWjvYqT0ZqyOTfWlMwGHN4I333IK50CS
	 waIufbdnMoUQk1f75AFK2qyIRf2YHOpk8Lm7h3EaeTwZkgsN8GC52bX8uOx+Z8+22SsBA
	 uHA+6Foyo02l+55siap6MwZ6K3P1ToNc3Hksxgmhg9mvw390/NN7OC1yIQ+r+KqYBd8I4
	 s9LdXSIscmN20YPSrnB3VHZYBhQ7xD1jZZG9nY0AG3+3+VjRrqv5+eVZDPm0fI+aB944Z
	 1DAJM86IoIsNHm+qve23V4jHjlBDp/4sWm+dDtaj22abs0VvUwEa9PGZqR8vFHt/S+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pNMcUTeaPXzzSxcqiUtRPDYwbFOzDWjcjzG1Bv5GkDs=;
	b=t68+aBEo54tJAILpUf87o15CUaCalauYFVPhDPPhAey14c+solWvW91itRxq3eKEYb0T
	 iTUvkJclRjzPqVTU2vNspG7R1nrbxLMvaERP+JjGh5v+esu+PKjb3/Pz0UVrYY7a55Rq1
	 0jKkB36M9Thzhbrdjna616x6UwnqFHf03P5KU9XZEkUWQjN2saJObbaGcXOWoJGyeCXMp
	 ePNpE5IINSVKAk66g7mGoweO/2SlxdkjhWFX95XGUWnqWt3SvYVzjZfCt1u9gwvGyuRcW
	 FSvEFOLVZYox/v0ykuy599uiiliBw9N4GERkkwDbHWjkko70U/N8gJFa4NXxpiLj7+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="B/fnoEXC";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC29B606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC29B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B/fnoEXC
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso3838789a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:24:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795440297; cv=none;
        d=google.com; s=arc-20260327;
        b=rhDq3uVDrjCMMg+Wg36pku3nwECtXkvB6gj1Y0cfyb5Sy7GtQqEMYJS6fdAtF4X+iF
         jKk06FQJpQhWr0rzOvlwzR8RIOV7xEJH2hoqDL0/KpfuXJ77ulrlFV9tcc6DdpkbD8Sn
         U/8W96nQ4yP8AWwbV5EF2XTUHvk5LqEClYOSXNcsL+06BUElkpnSiUnK2pQoHLRJ7QoX
         pv5V7Jd8SBDxxQ4FZi8OEI7VCpsSzIf5nvgwEVsRFvXHQuFAVHDD27o+xg1F/ZGsb7XL
         RU+kWBR9OGBmh3q4dSNsLVSdPLZ1fClwR7etye69YIz6XLPy1Vj7279SZLt9tl7PY4pm
         1UHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pNMcUTeaPXzzSxcqiUtRPDYwbFOzDWjcjzG1Bv5GkDs=;
        fh=X5LVSSY/2U85K3ymO0P9stI+cwsFOcGgzenxWEIYe3U=;
        b=V6TWqyt9Ie1m/DeD+k3BZUkfDm+p9+Ht8xQTElljKARDBPujMYVdRidfaUA2cQoSaG
         oYVbFtqhVDEOHoRKl4ovTYLVvYRd615VxC1QJ9zqpLgUAO8DnJv/TgQkc3/TklxCkBsB
         ezVAeH95Ab13uA2TZODOkxsUm/aL6uCO12P8BzJhHOauWsapk6r2e3aJB7wuJLz8OTeQ
         13Tb175rLt8rdimevEBTMFCStRRUlgJ902gyb4defiYnnejv3gdqNbswMYl2JVr2db1U
         uR/kDjLuGuxJaLlAn7bMAdqBwA0ebkekgMVk7rU99bVrBXd1DC6jywRyrO75ezTXT6iu
         szHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440297; x=1796045097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pNMcUTeaPXzzSxcqiUtRPDYwbFOzDWjcjzG1Bv5GkDs=;
        b=B/fnoEXCkFJqpp42JNKsfKVjAwUmo4KeOJQGW7o7Wc03N11bGgFPqD7xWb0/XcKClJ
         uj5w4Fxm2icnX1mfoQF9P+yJRu4hbdjBirmgG2kklPLBWvihfiH69AWUDzCVQnqBJSIs
         /neOl+nrCEKgTMQqFzt0wupj3tYlSh7MFjUC1f4fjfzB4jB2KDheTsRMM1Xxr3IejhEV
         C2w80UppgEZqwLFlfVlwfT5Ubhxok6r4FbqMoPpz6cYd5ilzYAMZH1AqOGi8nquP4L/U
         rfunHMZ155Oc0UR0vL+6HNxGfVdwqmLQ/fuWSJO0g386HqzbaIWr9IrswFHmvxECnUtT
         c2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440297; x=1796045097;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNMcUTeaPXzzSxcqiUtRPDYwbFOzDWjcjzG1Bv5GkDs=;
        b=QqPdYCJL6VxoaKx74GHEaa9QQ1D/vFKLAXMc4msJcWMyyklHbF3BOlnSzcdfqM5xZj
         uw6vyX1SJseNju+TDO3bWQDoJEtXhUFGkc5OxO/kZTTUNJOFNKzd1MHKVm5ORZbtEUcZ
         iy1+n/Iy13oJKqwtBj6NMgd/xTZfxvBOGvZ0JQTL4s4TbxmjYQr5Z6xQEUjYINqiJDr5
         ATJTvf+m/2UKU9/PuPWWk1LJrTRHsR3GRpVMCeiDmc6fmjcmnEM+cpKd3QXFCQeRqUDi
         2DOgrDtbeQVbEjvK7vaNMf47wmIfhK58FC8eetNm8vo+ZMZezdmHPsKL++mT+NyEy/VG
         i/pQ==
X-Forwarded-Encrypted: i=1; AL+hErFRBJ0BrVj1S9AyBxKSzIP5Xu4W7TgDDH4KrghmX2yLmmP3nSkUWuiyEjKuVPXJysT3QZFoViFLwKGco2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hTeh9Bvb6C03+L2WVOcarWciEPXsFYAD3kKfFGQZat614ax/F
	lHPGZW+iNkJkoutvNMnFtAqOQPfL7DmHW2we8U3AGACqe1vDiS8NT5yhGCHDnhV2cBR1EStwkpG
	zVcnbI/O03J6Xw9UQ5MTGOG3QiOj8iy4=
X-Gm-Gg: AZFdTZcwLxU+t9JK1fvk8NBxj3jkomTDrgDzI0ZA74nZ5a9FfqCWOmtiQSuTebqkOGT
	4bmFbg5zYD+zIbuKZtemYiUBqcjt1TXyqiAFL3g6s80LRJ12H5sEteaYsA+ybQbJVL1X5FEUhDz
	+09wqR2UoF3xN8eF9CCjoyUA5e6NY7wvFi8j01i9GC66k8VTTtoAvDkemNeEkfQYoKgnRmYMXev
	2tc4L/cXo3TaQKKRcnFUxoA4/63Q3JasjZpWiU4p14hgA5V9PgGTeKTEzHzqpCtu0jyDKoZ69ml
	mIMt8KhcUYRFCDQjZqXttgSdIwtlpKcWed0P3DxAnCpODLCcQbYp8hT57jmJ5I0HwjhbZA/Yq1O
	QQ8w/VDrGXtu5qw0KB48Bpng85xWiGDzzHj8UZFrFxHurh4kqVkGnvNoKn6hQE4KjZhnByIyuED
	4HVlmT72QeQC7xHdA=
X-Received: by 2002:aa7:d785:0:b0:6ba:128d:24c with SMTP id
 4fb4d7f45d1cf-6ba37e97a12mr5921064a12.34.1795440296865; Mon, 23 Nov 2026
 05:24:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122000856.536902-1-koray.fra@gmail.com> <20261122000856.536902-3-koray.fra@gmail.com>
In-Reply-To: <20261122000856.536902-3-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 14:24:45 +0100
X-Gm-Features: Aa3M54otx7UYsPZO7ggeFHtv8wazOgMrgHhBFIPt5z_iOB3RiN_nDOoe1lrenZM
Message-ID: <CAOQ4uxhegn1z=41_MHL1Zu2hXuPtzNhC=x4gd371oaeJE4-weQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] vfs: add xflags mask to fileattr API
To: koraynilay <koray.fra@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Darrick J . Wong" <djwong@kernel.org>, Andrey Albershteyn <aalbersh@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lauri Gates <lauri.gates@gmail.com>, Christoph Hellwig <hch@infradead.org>, Dave Chinner <dgc@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Add fa_xflags_rw_mask and fa_xflags_ro_mask to struct file_attr and
> equivalent masks to struct file_kattr.
>
> Also add has_masks selector to struct file_kattr so we can know when a
> user of this API (userspace or filesystem) supports them.
>
> This lets filesystems advertise their support for specific xflags, like
> statx.stx_attributes_mask does, and userspace can specify only which
> xflags it wants to change without needing a RMW cycle:
> - on GET: each filesystem that wants to support this new API fills the
>   masks according to its supported and read-only xflags, then:
>   * for boolean xflags: it fills fsx_xflags with the current on-disk valu=
e
>   * for value xflags: it sets the xflag bit to 1 in fsx_xflags and the
>     xflag value in the struct field;
> - on SET: userspace fills the rw_mask with the bits of the xflags it
>   wants to change, then:
>   * for boolean xflags: it provides the xflag value as a bit in fa_xflags
>   * for value xflags: it sets the xflag bit to 1 in fa_xflags and then
>     provides the value in the struct field; if the xflag bit is set to 0
>     instead, this informs the kernel to unset/clear that value.
>
> Since fa_xflags_rw_mask means "I want to change the xflags specified in
> here", if userspace specifies fa_xflags_rw_mask =3D 0, only check for
> permissions and fileattr support without checking any xflags.
>
> Behaviour of older programs that already use file_[gs]etattr() is
> preserved by checking against FILE_ATTR_SIZE_VER*.
>
> Also add the missing FS_XFLAG_PROJID xflag, to allow userspace to set
> the projid using file_[gs]etattr() by leveraging the new masks.
>
> Finally, in order to prevent the legacy FS_IOC_FSSETXATTR from accepting
> FS_XFLAG_PROJID, add a FS_FILE_ATTR_XFLAGS_MASK to support new xflags
> and use it to validate/clamp both the _xflags fields and the masks.
>
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.11
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  fs/file_attr.c           | 128 ++++++++++++++++++++++++++++++++++++---
>  include/linux/fileattr.h |   7 +++
>  include/uapi/linux/fs.h  |   7 ++-
>  3 files changed, 131 insertions(+), 11 deletions(-)
>
> diff --git a/fs/file_attr.c b/fs/file_attr.c
> index 40d6518f1d8e..0e16c23368b2 100644
> --- a/fs/file_attr.c
> +++ b/fs/file_attr.c
> @@ -102,13 +102,20 @@ EXPORT_SYMBOL(vfs_fileattr_get);
>  static void fileattr_to_file_attr(const struct file_kattr *fa,
>                                   struct file_attr *fattr)
>  {
> -       __u32 mask =3D FS_XFLAGS_MASK;
> -
>         memset(fattr, 0, sizeof(struct file_attr));
> -       fattr->fa_xflags =3D fa->fsx_xflags & mask;
> +       /* Pass the masks to userspace if underlying fs uses them. */
> +       if (fa->has_masks) {
> +               fattr->fa_xflags_rw_mask =3D fa->fsx_xflags_rw_mask &
> +                                          FS_FILE_ATTR_XFLAGS_MASK;
> +               fattr->fa_xflags_ro_mask =3D fa->fsx_xflags_ro_mask &
> +                                          FS_FILE_ATTR_XFLAGS_MASK;
> +       }
> +       fattr->fa_xflags =3D fa->fsx_xflags & FS_FILE_ATTR_XFLAGS_MASK;
>         fattr->fa_extsize =3D fa->fsx_extsize;
>         fattr->fa_nextents =3D fa->fsx_nextents;
>         fattr->fa_projid =3D fa->fsx_projid;
> +       if (fa->fsx_projid)
> +               fattr->fa_xflags |=3D FS_XFLAG_PROJID;
>         fattr->fa_cowextsize =3D fa->fsx_cowextsize;
>  }
>
> @@ -141,12 +148,30 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
>  static int file_attr_to_fileattr(const struct file_attr *fattr,
>                                  struct file_kattr *fa)
>  {
> -       __u64 mask =3D FS_XFLAGS_MASK;
> +       u64 rw_mask =3D fa->has_masks ? fattr->fa_xflags_rw_mask : FS_XFL=
AGS_MASK;
>
> -       if (fattr->fa_xflags & ~mask)
> +       /*
> +        * No need to check for has_masks here, as fa_xflags_rw_mask is 0=
 in
> +        * VER0 mode.
> +        */
> +       if (fattr->fa_xflags_rw_mask & ~FS_FILE_ATTR_XFLAGS_MASK)
>                 return -EINVAL;
>
> -       fileattr_fill_xflags(fa, fattr->fa_xflags & ~FS_XFLAG_RDONLY_MASK=
);
> +       if (fattr->fa_xflags & ~rw_mask)
> +               return -EINVAL;
> +
> +       /*
> +        * Filter with ~FS_XFLAG_RDONLY_MASK only when in VER0 mode, so
> +        * filtering with the actual filesystem read-only xflags can be d=
one in
> +        * vfs_fileattr_set() once we have the fsx_xflags_ro_mask from th=
e fs.
> +        */
> +       if (fa->has_masks) {
> +               fileattr_fill_xflags(fa, fattr->fa_xflags);
> +               fa->fsx_xflags_rw_mask =3D fattr->fa_xflags_rw_mask;
> +       } else {
> +               fileattr_fill_xflags(fa,
> +                                    fattr->fa_xflags & ~FS_XFLAG_RDONLY_=
MASK);
> +       }
>         fa->fsx_extsize =3D fattr->fa_extsize;
>         fa->fsx_projid =3D fattr->fa_projid;
>         fa->fsx_cowextsize =3D fattr->fa_cowextsize;
> @@ -187,6 +212,14 @@ static int fileattr_set_prepare(struct inode *inode,
>  {
>         int err;
>
> +       /*
> +        * If the fs supports the fsx_xflags_{rw,ro}_mask API, fail when =
the
> +        * requested rw flags are not in the supported ones for that fs
> +        */
> +       if (old_ma->has_masks &&
> +           (fa->fsx_xflags_rw_mask & ~old_ma->fsx_xflags_rw_mask))
> +               return -EOPNOTSUPP;
> +
>         /*
>          * The IMMUTABLE and APPEND_ONLY flags can only be changed by
>          * the relevant capability.
> @@ -211,6 +244,11 @@ static int fileattr_set_prepare(struct inode *inode,
>                                 FS_XFLAG_PROJINHERIT)
>                         return -EINVAL;
>         } else {
> +               /* If user wants to unset projid, set it to 0 */
> +               if ((fa->fsx_xflags_rw_mask & FS_XFLAG_PROJID) &&
> +                   ((fa->fsx_xflags & FS_XFLAG_PROJID) =3D=3D 0))
> +                       fa->fsx_projid =3D 0;
> +
>                 /*
>                  * Caller is allowed to change the project ID. If it is b=
eing
>                  * changed, make sure that the new value is valid.
> @@ -250,6 +288,8 @@ static int fileattr_set_prepare(struct inode *inode,
>                 fa->fsx_xflags &=3D ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZIN=
HERIT);
>         if (fa->fsx_cowextsize =3D=3D 0)
>                 fa->fsx_xflags &=3D ~FS_XFLAG_COWEXTSIZE;
> +       if (fa->fsx_projid =3D=3D 0)
> +               fa->fsx_xflags &=3D ~FS_XFLAG_PROJID;
>
>         return 0;
>  }
> @@ -275,6 +315,8 @@ int vfs_fileattr_set(const struct mnt_idmap *idmap, s=
truct dentry *dentry,
>  {
>         struct inode *inode =3D d_inode(dentry);
>         struct file_kattr old_ma =3D {};
> +       u32 rw_user_mask =3D fa->fsx_xflags_rw_mask;
> +       u32 rw_fs_mask =3D 0, ro_fs_mask =3D 0;
>         int err;
>
>         if (!inode->i_op->fileattr_set)
> @@ -288,15 +330,53 @@ int vfs_fileattr_set(const struct mnt_idmap *idmap,=
 struct dentry *dentry,
>         if (err)
>                 goto out;
>
> +       if (old_ma.has_masks) {
> +               old_ma.fsx_xflags_rw_mask &=3D FS_FILE_ATTR_XFLAGS_MASK;
> +               old_ma.fsx_xflags_ro_mask &=3D FS_FILE_ATTR_XFLAGS_MASK;
> +               rw_fs_mask =3D old_ma.fsx_xflags_rw_mask;
> +               ro_fs_mask =3D old_ma.fsx_xflags_ro_mask;
> +       }
> +       old_ma.fsx_xflags &=3D FS_FILE_ATTR_XFLAGS_MASK;
> +
>         /* initialize missing bits from old_ma */
>         if (fa->flags_valid) {
> +               /* FS_IOC_SETFLAGS */
> +               fa->fsx_xflags_rw_mask =3D 0;
>                 fa->fsx_xflags |=3D old_ma.fsx_xflags & ~FS_XFLAG_COMMON;
>                 fa->fsx_extsize =3D old_ma.fsx_extsize;
>                 fa->fsx_nextents =3D old_ma.fsx_nextents;
>                 fa->fsx_projid =3D old_ma.fsx_projid;
>                 fa->fsx_cowextsize =3D old_ma.fsx_cowextsize;
>         } else {
> +               /*
> +                * Preserve flags not being set when using FS_IOC_FSSETXA=
TTR or
> +                * file_setattr VER0+.
> +                */
>                 fa->flags |=3D old_ma.flags & ~FS_COMMON_FL;
> +
> +               /* file_setattr VER1+ */
> +               if (fa->has_masks) {
> +                       /* Preserve old xflags that aren't being set. */
> +                       fa->fsx_xflags |=3D old_ma.fsx_xflags & ~rw_user_=
mask;
> +
> +                       /*
> +                        * Filter fsx_xflags by removing xflags that are:
> +                        * - filesystem-reported read only
> +                        * - globally read only
> +                        * but keeping xflags that are:
> +                        * - filesystem-reported rw, globally ro
> +                        */
> +                       ro_fs_mask |=3D FS_XFLAG_RDONLY_MASK & ~rw_fs_mas=
k;
> +                       fileattr_fill_xflags(fa, fa->fsx_xflags & ~ro_fs_=
mask);
> +
> +                       if (!(rw_user_mask &
> +                             (FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT))=
)
> +                               fa->fsx_extsize =3D old_ma.fsx_extsize;
> +                       if (!(rw_user_mask & FS_XFLAG_PROJID))
> +                               fa->fsx_projid =3D old_ma.fsx_projid;
> +                       if (!(rw_user_mask & FS_XFLAG_COWEXTSIZE))
> +                               fa->fsx_cowextsize =3D old_ma.fsx_cowexts=
ize;
> +               }
>         }
>
>         err =3D fileattr_set_prepare(inode, &old_ma, fa);
> @@ -424,6 +504,14 @@ SYSCALL_DEFINE5(file_getattr, int, dfd, const char _=
_user *, filename,
>                 return error;
>
>         fileattr_to_file_attr(&fa, &fattr);
> +       /*
> +        * Remove xflags added in or after VER1 so userspace programs com=
piled
> +        * against VER0 don't try to write xflags they don't know about (=
since
> +        * they do RMW).
> +        */
> +       if (usize < FILE_ATTR_SIZE_VER1)
> +               fattr.fa_xflags &=3D FS_XFLAGS_MASK;
> +

This looks odd.
old struct size with new flags should be -EINVAL not silently drop them


>         error =3D copy_struct_to_user(ufattr, usize, &fattr,
>                                     sizeof(struct file_attr), NULL);
>
> @@ -460,10 +548,6 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const char _=
_user *, filename,
>         if (error)
>                 return error;
>
> -       error =3D file_attr_to_fileattr(&fattr, &fa);
> -       if (error)
> -               return error;
> -
>         CLASS(filename_maybe_null, name)(filename, at_flags);
>         if (!name && dfd >=3D 0) {
>                 CLASS(fd, f)(dfd);
> @@ -479,6 +563,30 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const char _=
_user *, filename,
>                         return error;
>         }
>
> +       /*
> +        * Userspace said "I don't want to change any flag", so be it I g=
uess.
> +        * Still check for fileattr support and permissions, also in case=
 this
> +        * is just a probe.
> +        */
> +       if (usize >=3D FILE_ATTR_SIZE_VER1 && fattr.fa_xflags_rw_mask =3D=
=3D 0) {
> +               struct inode *inode =3D d_inode(filepath.dentry);


No No this is not what this userspace said!

This user space is the same old chattr programs recompiled with a new
fs.h header file
installed.

When userspace does not set anything is masks it means "old API"


> +
> +               if (!inode->i_op->fileattr_set)
> +                       return -EOPNOTSUPP;
> +
> +               if (!inode_owner_or_capable(mnt_idmap(filepath.mnt), inod=
e))
> +                       return -EPERM;
> +
> +               return error;
> +       }
> +
> +       if (usize >=3D FILE_ATTR_SIZE_VER1)
> +               fa.has_masks =3D true;

And a non-zero ro or rw mask

> +
> +       error =3D file_attr_to_fileattr(&fattr, &fa);
> +       if (error)
> +               return error;
> +
>         error =3D mnt_want_write(filepath.mnt);
>         if (!error) {
>                 error =3D vfs_fileattr_set(mnt_idmap(filepath.mnt),
> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
> index c8f69dde5dd3..4faa40febf11 100644
> --- a/include/linux/fileattr.h
> +++ b/include/linux/fileattr.h
> @@ -35,6 +35,10 @@
>         (FS_XFLAG_COMMON | FS_XFLAG_RDONLY_MASK | FS_XFLAG_VALUES_MASK | =
\
>          FS_XFLAG_DIRONLY_MASK | FS_XFLAG_MISC_MASK)
>
> +/* Flags only for fa_ fields */
> +#define FS_FILE_ATTR_XFLAGS_MASK \
> +       (FS_XFLAGS_MASK | FS_XFLAG_PROJID)
> +
>  /*
>   * Merged interface for miscellaneous file attributes.  'flags' originat=
es from
>   * ext* and 'fsx_flags' from xfs.  There's some overlap between the two,=
 which
> @@ -45,6 +49,8 @@ struct file_kattr {
>         u32     flags;          /* flags (FS_IOC_GETFLAGS/FS_IOC_SETFLAGS=
) */
>         /* struct fsxattr: */
>         u32     fsx_xflags;     /* xflags field value (get/set) */
> +       u32     fsx_xflags_rw_mask; /* supported writeable xflags (get) /=
 flags to set (set) */
> +       u32     fsx_xflags_ro_mask; /* supported read-only xflags (get) *=
/
>         u32     fsx_extsize;    /* extsize field value (get/set)*/
>         u32     fsx_nextents;   /* nextents field value (get)   */
>         u32     fsx_projid;     /* project identifier (get/set) */
> @@ -52,6 +58,7 @@ struct file_kattr {
>         /* selectors: */
>         bool    flags_valid:1;
>         bool    fsx_valid:1;
> +       bool    has_masks:1;
>  };
>
>  int copy_fsxattr_to_user(const struct file_kattr *fa, struct fsxattr __u=
ser *ufa);
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index a13c7b32a1bd..e40806b3a69c 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -238,10 +238,13 @@ struct file_attr {
>         __u32 fa_nextents;      /* nextents field value (get)   */
>         __u32 fa_projid;        /* project identifier (get/set) */
>         __u32 fa_cowextsize;    /* CoW extsize field value (get/set) */
> +       __u32 fa_xflags_rw_mask;/* supported writeable xflags (get) / fla=
gs to set (set) */
> +       __u32 fa_xflags_ro_mask;/* supported read-only xflags (get) */
>  };
>

fa_xflags is __u64
It is short sighted to use __u32 masks for the syscall API


>  #define FILE_ATTR_SIZE_VER0 24
> -#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
> +#define FILE_ATTR_SIZE_VER1 32
> +#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER1
>
>  /*
>   * Flags for the fsx_xflags field
> @@ -270,6 +273,8 @@ struct file_attr {
>   */
>  #define FS_XFLAG_CASEFOLD      0x00040000      /* case-insensitive looku=
ps */
>  #define FS_XFLAG_CASENONPRESERVING 0x00080000  /* case not preserved */
> +
> +#define FS_XFLAG_PROJID                0x00100000      /* project ID */
>  #define FS_XFLAG_HASATTR       0x80000000      /* no DIFLAG for this   *=
/
>


If anything the newline should be before the gap to HASATTR

Thanks,
Amir.
