Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538224;
	b=1dLdSwDKJEaFaVhCaq0GLwWUQeZbt1bARMI/3QdrzP5o4OeOHZXLFG6mHtOzm3FNt76+
	 awWH/FIoofsqLCFoN1s851FvvVpegt0sBZUzFxVVYntcxX1YmxXe+aHbl6A1/9o3hGtm6
	 B9t2CjcEmpsXS4QoO393RdjExmeGdtRi5qYnRZ0tUaWrQXtPJVLhTdr0LIK398zaIW3de
	 TmBxnb3LfAxYZOXWV6jT7s8ke5l3cIz/Oilx94N6mYuc0vWcdH1+tviNVHR5Mkaz4GpNr
	 6Rdt1tkRG1tAhjtSAsdBNykZBWNzadQQPl85IC1wS3QCvuBV/nBIah6TaBI8DIvYyWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=kERKRhF39h+o4brc6m3SDvQJ22VyguIEsdUljr0uSEI=;
	b=RQ7bQZlZZK6tMYkxyjsVORW9T5rLi90XJDgnitYkb3QqkgOhkREbpsHmoys1AUQzXcAr
	 NDv0CDAXDwLJ65z3ugVRZOmqOzjwPoqw+e6PiAKSuA/syvsmsqMHHhgUtSE/GsAeYM1kQ
	 zD5LdX5wNooQ0T5Q3vzW7EK593UeX96sRyNAKF4B6+LXZtMoCHSrg4AGq7a4V4wx+uxQe
	 M0j8NCO7YX0o7JSw34hHmq7FlpLrSUiJUAYIc0yGloROaaiGAsfcqW7W88VCLi4AJF5sl
	 5dvDMTxCty/xq2Ojz0f+q2PVlnKrlEMg7qj/OPZAAPxBOuziICGnrxaKGCogMQz3C8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Jx/Y0n13";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DB4606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65DB4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jx/Y0n13
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2730096f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795538222; x=1796143022; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kERKRhF39h+o4brc6m3SDvQJ22VyguIEsdUljr0uSEI=;
        b=Jx/Y0n13hEoX+FItoehcRiEMnpKujE90jegfLWLkkAIeHAobjnHacXmvC9hqTrfygG
         UPp4FbhIW6jKGdP/Zc0T/X+EiH1EtxgDA66cpwYBlm99Ijv8RD1E14/029hW2iwFGxqP
         g61B77QRYZJnN2nS9Dum3lKfbagpTpdzpKxf7Me14u2tr5b7aBF9KFWve2381H6uCMfR
         Kvx1hdIHuCvtpEHQcIalwSbvPZqq80xPP3Uz+P3PWd6XkOtNGNUPGcFEQ2Ymjo93dEIg
         kjfZIASLMDxjzbFNMuzoAAGhtbpwLLGPofpUfm1I07rvch9u9y0asKrXA+t6/E52wmum
         cgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538222; x=1796143022;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kERKRhF39h+o4brc6m3SDvQJ22VyguIEsdUljr0uSEI=;
        b=iUDqkfODzXzaMkoUWK76AvBTckb6vEJaVzmIn6L93IwF2+lciRtMZmojvARA++hGPr
         BKD4+nYH9tb8oSTs1cGkk1AwLTxwLHdLQZBF11d1agXnMV4W38ytjT0kLIwmgHFbQ20x
         0n1vjr/be4REDLKbmfTj/SKHBr9x471Rcd25PJwp6nb9WStZ+ttDek+eYzYudCXzc1wV
         IY6AldjF2T/vT66dMGEZ2TQ/s3zIp0NXEVe/Rm7zdWvlFT1MwJsEkwdXKckHS13bXOFf
         MBF7cM/Dv5fmZZnoI6hF2jK+e9/kOHi37ma5Bjge06wfiCODj7k4PErkWhV6dYTL4Vum
         a5pA==
X-Forwarded-Encrypted: i=1; AL+hErH0RSUpSpzJG8z9LuwU7emxSTxpCKxLkK6KdDm2jcAPi4r3a5Sst35na+Q/Kka2riiLBDWrSIGCVV5v55c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9969WXojO2Z9k4tRCZ/pb25Na425rJps18W/rNeIShoxOMnQLa
	TmQUZUxtaUQ3rT4JrtAVsdJ0s8MwhdY1Ynu4yRH3yTvdvFxSA+XMGQCY
X-Gm-Gg: AZFdTZeDNaZHHaBwkCOYk0wyreTKQhdpsih8p0E1+kxw4k5wJJ380J0jJkd8dVyMDa+
	/FrNohxtAbf2DMKX9V9Bm0+xkrevxAtTImOMfR7L6KGKlpN3lgiWrnH3MNgUyjM/eJ010Th4upm
	lerSceXA6c4i+g2vIVXJ66SdA19Yj/x4xYzofkGMzaKbzTSupk66cjNPZSlUo209qqzelktingl
	ybrVxEwNKpveJhOnYXGs2oj/AZFHnr+pTAIqhLoN4F+ruh+7ot+gC3w+3zqO7b2Apur61+tHnwl
	00ZJnaB7VaKXwYc66+jnx7P9MkhwRSmEER2/s8a5oNS7TY0fGCrjSQHoXmUIcruyuPjsoXfE7D8
	mXFQCq8NxiIDIzhk9CcuAvh4KHSm+9d5S8jjT2vchF6N9duREp5OYsjqo6zDH/9omjF0EFyjRtH
	1BWUQjCNkavvyp8CP8kN1U03K9Gj+5bBpVldSdj3awFcw9HdTWxdmGGu5wPDJmg+EKcGoJZVujd
	V6azttXGQ6TGTEBPVRkQoTvYk+PO3M78qPjnEckW3mytMhVkO7Aqps0ijjyavvh1/fhlTQWBi/8
	LeLi4k4JuB4oGGx+QEx/tkBlxUpVIMGPpGpYdGXsJyshDtyc1w==
X-Received: by 2002:a05:6000:2f87:b0:4a7:1428:13dd with SMTP id ffacd0b85a97d-4abb19c173emr28025902f8f.21.1795538222274;
        Tue, 24 Nov 2026 08:37:02 -0800 (PST)
Received: from localhost ([130.192.98.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm28207985f8f.30.2026.11.24.08.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 08:37:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=c9078eddc541ab7c7de706e146801d0bb3133a1a69d3339943a4873a1056;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 24 Nov 2026 17:36:57 +0100
Message-Id: <DN3L6DY60QKG.184FB9CISL5SL@gmail.com>
Cc: "Alexander Viro" <viro@zeniv.linux.org.uk>, "Christian Brauner"
 <brauner@kernel.org>, "Jan Kara" <jack@suse.cz>, "Edward Adam Davis"
 <eadavis@qq.com>, "Amir Goldstein" <amir73il@gmail.com>, "Miklos Szeredi"
 <miklos@szeredi.hu>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH] vfs: fix file_getattr hint to request xflags
From: "koraynilay" <koray.fra@gmail.com>
To: "Luis Henriques" <luis@igalia.com>, "koraynilay" <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261124150108.189282-1-koray.fra@gmail.com>
 <87se0qb42p.fsf@igalia.com>
In-Reply-To: <87se0qb42p.fsf@igalia.com>

--c9078eddc541ab7c7de706e146801d0bb3133a1a69d3339943a4873a1056
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Nov 24, 2026 at 5:13 PM CET, Luis Henriques wrote:
> On Tue, Nov 24 2026, koraynilay wrote:
>
>> When using a FUSE mount over an underlying filesystem that supports
>> xflags, querying them from userspace with file_getattr() strips them
>> because file_getattr sets flags_valid =3D true so FUSE uses
>> FS_IOC_GETFLAGS instead of FS_IOC_FSGETXATTR.
>>
>> Fix it by setting fsx_valid =3D true instead.
>>
>> Output when using a simple FUSE mount that simply forwards the ioctls to
>> the underlying fs:
>>
>> before the fix:
>>
>>   /xfs/file: FS_IOC_FSGETXATTR: ret=3D0, projid=3D69
>>   /xfs/file: file_getattr:      ret=3D0, projid=3D0
>>   /ext4/file: FS_IOC_FSGETXATTR: ret=3D0, projid=3D42
>>   /ext4/file: file_getattr:      ret=3D0, projid=3D0
>>
>> after the fix:
>>
>>   /xfs/file: FS_IOC_FSGETXATTR: ret=3D0, projid=3D69
>>   /xfs/file: file_getattr:      ret=3D0, projid=3D69
>>   /ext4/file: FS_IOC_FSGETXATTR: ret=3D0, projid=3D42
>>   /ext4/file: file_getattr:      ret=3D0, projid=3D42
>>
>> Fixes: cb184dd19154 ("fs: init flags_valid before calling vfs_fileattr_g=
et")
>> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.11
>> Signed-off-by: koraynilay <koray.fra@gmail.com>
>> ---
>> Hi, I found this issue while working on the v2 of [1], here is the
>> reproducer, not in the commit message because of the size.
[...]
>>
>> [1]: https://lore.kernel.org/all/DN2YMTH77KWE.3IPE9OG8377X0@gmail.com/T/=
#t
>>
>>  fs/file_attr.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/file_attr.c b/fs/file_attr.c
>> index 833e03810b24..3b249a0a6b36 100644
>> --- a/fs/file_attr.c
>> +++ b/fs/file_attr.c
>> @@ -383,7 +383,7 @@ SYSCALL_DEFINE5(file_getattr, int, dfd, const char _=
_user *, filename,
>>  	struct path filepath __free(path_put) =3D {};
>>  	unsigned int lookup_flags =3D 0;
>>  	struct file_attr fattr;
>> -	struct file_kattr fa =3D { .flags_valid =3D true }; /* hint only */
>> +	struct file_kattr fa =3D { .fsx_valid =3D true }; /* hint only */
>
> Isn't this reintroducing the bug that was fixed by commit
>
> cb184dd19154 ("fs: init flags_valid before calling vfs_fileattr_get") ?

Hmm, it shouldn't, since that was just an uninitialized bug for the
whole struct, while now it's initialized (unless you meant something
else?).

> Maybe fuse_fileattr_get() shouldn't be handling FS_IOC_FSGETXATTR at all,
> and FS_IOC_FSGETXATTR handling should be moved into fuse_do_ioctl()
> instead?  (Or, more likely, I'm missing something!)

The bug being fixed is when using file_getattr tho, which in the vfs is
directly sent to inode->i_op->fileattr_get(dentry, fa), which for FUSE
is fuse_fileattr_get().

What should probably be done though (well, not in this patch) is switch
fuse_fileattr_get() from FS_IOC_FSGETXATTR to vfs_fileattr_get(), for
fsx_valid.
This is because while right now FS_IOC_FSGETXATTR is equivalent to
file_getattr VER0, in the [1] above it will be bumped to VER1, making
file_getattr VER1 a superset of file_getattr VER0.

Thanks,
koraynilay

> Cheers,



--c9078eddc541ab7c7de706e146801d0bb3133a1a69d3339943a4873a1056
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCawW9KQAKCRA0bnTtJTDo
OBMBAQCFso9zgoILmV9GTY3WdiCk4vT/1a2actWnHtu9q6vCEAD/euVTaTbVu1rI
QTkbcrfDclHkY50qMNgDWseDNAm2ZwI=
=5idA
-----END PGP SIGNATURE-----

--c9078eddc541ab7c7de706e146801d0bb3133a1a69d3339943a4873a1056--
