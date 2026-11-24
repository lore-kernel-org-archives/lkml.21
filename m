Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795534608;
	b=1BxW7gpGGNOkt4GfmecVt8BZIiciCEzFawJsqCzwo5reLxBVN3xfaotSM1aFqqWP5SyX
	 neZ6x2otxZolNab1mxWazirFdN9k466FIVeYZ21PTmhrWG3kvMduGoUhx/XBKpfgi4jdY
	 azfAXT7M/lR07R4bKDo8cSJLhCxLL1OWKiVLzzi6bsblPmgxQkxrqjFcmxHfWzuEj6IxA
	 4EICdobzWeUZ//BfqoELvUQrcxXPMb1G+I0dtenlXrGH08hj72Fw9iutLRNvBQUfGnD4M
	 I30BRGGq8uX9vLOUYs4YMPoumNgSRoHHWUPUjSPp4uO9Ir2AhO4tm0ku4puIXEq934w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VvUvAvMY5vYocLNfwNoIiaWbzLPUbCkOASwB3LIBtwY=;
	b=VvcMUi+Du8SmaxaOV8KKNDEeBvmh7qPKYllKsjE2HWBkk4UD92kgSlQElgoLQvqkYGIf
	 eMhvcHrVZnIgwq6e/Y73XkVYLxculeuZshe0H2LyBtCxlxElxMSfGOvABSHSgrgykTM4W
	 HlCB4n4v7hMVHcD7inhOJd00j43bfzZ2K3mTNtlIUOBd3WYxk+kuyqwwVeylPqXRaMbjE
	 JAG/Y6QofvS2AFiPdgK8bN1jc1rK7bF31tC0GTSbaB3xO38fM89SeaKHHq6Vu7vOGljLj
	 NbYicRrSDqGIIXQh4yzbqboj6IyleC37QZurYqHEc0ZcYMhI3K/5JnurBLx16ndKSWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+ltMG++;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55422606A329
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55422606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+ltMG++
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so5777318a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795534607; cv=none;
        d=google.com; s=arc-20260327;
        b=YQo5TDODG0abI493HQaD+Ifu+3y3Ox3K6amWnrGLGUTtsSb9BmY5/B0LaFjCiw2sXw
         UG3icOBlt8T6R38qB+J1cn3LBtBNLlrGgUwR2zoFABY/wrRaHvt6wuHkmWUwOdCGIVP5
         NILjV/AEAw/pboIZyyF3bbixxUhTSaaWv+r6OX5JPQKmixfjOTnxmIC6Bmd6A4TCIbUH
         ug+ZhneMaZX7oyzx8dYRcXwoxOpdrNrybLbO4BffnPxH248YqZH7NAYMWx2YGRM/5jVG
         VOeqSP0vNakBkYWTe4brfKq+Zg8nhCDPSvdB3JBPLUU0p/S6yCkDPUzxcBprTDOBukle
         VPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VvUvAvMY5vYocLNfwNoIiaWbzLPUbCkOASwB3LIBtwY=;
        fh=iFBaqSEgM/YdK6/X8OqKuN9A6vUYOqGYcRbS8JTfzmY=;
        b=ZtPvqmQqHqzGfke9DTNiWHGYrlWNsGfK57Z0QueRzXOrIn9T+RukMkFyo2EngTJ5vq
         84sGRdHPMSpJeb5mFeXx4CBjVJJkeqqLgBC3WA6vdAvw9DBW/q5ZehXNZxL2wLXW5M46
         66CTV3CGdqDDi38FGxBfSQcgRCgtdx9MN/oxhPBoT5zd3oWpCe3Gi6Hs9Rs74dm8bJvg
         jbKICuEWFDJpLM3UL2BV8IHSjAccBwg4JsaROtvBLDwZtUp+fZi+gKEHn+X2KOVV09KQ
         TilReGSVgu/PTXVt+HN3TVXUVZl8b1jBhMu2Kb0e60JF4iozLzgXWiYxH6R5M+YGZFvj
         xjqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795534607; x=1796139407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VvUvAvMY5vYocLNfwNoIiaWbzLPUbCkOASwB3LIBtwY=;
        b=I+ltMG++3yO7S9bfTLo4fdB4JaJJVz1/rhIPr0lYFmrP2IWFJhidfSTmnEdJfJCJB6
         d9L3SbTGzcXZYX/3vGrb5ebYE1n25vllIBD6zJXMWUpR9JeOhVSY//s01wjrl9+Mxqmn
         IoAT2W7kN+Kp7a+tilRi7huyIEsbSe1N+XMr76rM5avIB1j4BmHUP3WJ+PBVdu2ZOwdG
         rBQGzbdaMaddezQ4HbrMfKQMe/Xpit5pzBJSnWF5k5m0Ew+xPeHP+faXks8WpaDF+OHt
         spoYzw0fo0Cvm07AdZhKTNuf1WhZcZc6WcrTf4anNfi0J4TuFViuSDeTw5dSKekCVncp
         tDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534607; x=1796139407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VvUvAvMY5vYocLNfwNoIiaWbzLPUbCkOASwB3LIBtwY=;
        b=bKFf48SC//XJMeZquy67XHXBAlPNNyn9qh/h4uvCpEmHaHmVHE6ymi6FLZwfPIc2PB
         V5b8nz1WIdwDJX+jQ9dSMLb2oSOCgHL0SbYY3EuQWAwPgHVAkCJN/ly3vRnfcoRfdWh1
         yjP8JovxSVwjNfbdTX2s74xocGQM9wlvyEB2hZbyDLV9J/vAFiaWSWKiVIzq+NqQ6RzX
         LMHgXvQ4EW59EoTouqgQg6bDd9NeA+5NTyA1y42fD/SvzQiLCrI7+zeS4n0rUPvNJVcF
         v8O8tO1yrh7dlRJvOus2hTRXOdFdzJQGA343Jc+hUNwodUpHdo0Edc6H+c92/izvZLqS
         +8mw==
X-Forwarded-Encrypted: i=1; AL+hErEvFowN9MgVk/FzRV84D0SqiNlGR+cmzL9CmHAVqZinjxHCxDeyZr0JdOvM4XBSROnUHmh/N2pHXxVFBJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jZxYRhOxMrpW46tkrUFg9mzgowsy6cfDF1WzqrsrVpL+Ajo5X
	7otcvXw2GPyudQ/UXAG54a002SPjQhg/h+pZxIBTALwprefVfJ4ww6WYHypb7KWkans9+qyVBeJ
	uUfr76r9fsS8TBzptbKZEKcqyDGOG+Sg=
X-Gm-Gg: AZFdTZfWLhUyOTbs/KYzzHRV5gEcoSZXCv2NiUMm11acBKbQw0ITkh+FH4jJ/hx6q2H
	Vwf/fz8akRwBOdILTSyQ/q+ouFXAbLebAPkOF1vSaKGknR0DQaPTQbVENJ1sUloqwubQbgK/ybV
	0vJg8DvI8mppwYmC2En1iAyCEBr/POPxL5Ac3HCc8gc50O5X5IIfdpFbt5PGB2lwl2hm31lp5rZ
	wu/737vBFgT2SBDci0QTzWi+hTBTGFLobOHE+o4b6Yn8Q/FcF7g+Q5Mx54HQ5Y3uDQxl38YREFN
	dthGRwDsd9CwMFtfeCPDDWF5xwULKZ8t2W2AsR+qIy/ZZCtd5yZfBVGmKWoY4Z1E8UUhaEGMEJz
	cjJMe1fTPlK/BOM9H3X6KVy+HoQYj6+KQaxkO/++hKhz20pMPVEoGF8voXn+/3OtWBCeTtA==
X-Received: by 2002:a05:6402:400f:b0:6b7:37f6:d307 with SMTP id
 4fb4d7f45d1cf-6ba37ec45bfmr11520010a12.40.1795534606572; Tue, 24 Nov 2026
 07:36:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124150108.189282-1-koray.fra@gmail.com>
In-Reply-To: <20261124150108.189282-1-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 24 Nov 2026 16:36:34 +0100
X-Gm-Features: Aa3M54qkJX-vlzweGeKfBHX2mO3aPkZv6yS7ycdbB-qZVnb5t1LbPVqbmWa8Plg
Message-ID: <CAOQ4uxiqfwWXHG0PO8fwRDuukaiXJpv7OKi1DKcCqcSPD2gnrw@mail.gmail.com>
Subject: Re: [PATCH] vfs: fix file_getattr hint to request xflags
To: koraynilay <koray.fra@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Edward Adam Davis <eadavis@qq.com>, Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 4:02=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> When using a FUSE mount over an underlying filesystem that supports
> xflags, querying them from userspace with file_getattr() strips them
> because file_getattr sets flags_valid =3D true so FUSE uses
> FS_IOC_GETFLAGS instead of FS_IOC_FSGETXATTR.
>
> Fix it by setting fsx_valid =3D true instead.
>
> Output when using a simple FUSE mount that simply forwards the ioctls to
> the underlying fs:
>
> before the fix:
>
>   /xfs/file: FS_IOC_FSGETXATTR: ret=3D0, projid=3D69
>   /xfs/file: file_getattr:      ret=3D0, projid=3D0
>   /ext4/file: FS_IOC_FSGETXATTR: ret=3D0, projid=3D42
>   /ext4/file: file_getattr:      ret=3D0, projid=3D0
>
> after the fix:
>
>   /xfs/file: FS_IOC_FSGETXATTR: ret=3D0, projid=3D69
>   /xfs/file: file_getattr:      ret=3D0, projid=3D69
>   /ext4/file: FS_IOC_FSGETXATTR: ret=3D0, projid=3D42
>   /ext4/file: file_getattr:      ret=3D0, projid=3D42
>
> Fixes: cb184dd19154 ("fs: init flags_valid before calling vfs_fileattr_ge=
t")
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.11
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
> Hi, I found this issue while working on the v2 of [1], here is the
> reproducer, not in the commit message because of the size.
>
> script:
>
>   #!/bin/bash
>   truncate -s 100M xfs.img
>   truncate -s 100M ext4.img
>   mkfs.xfs xfs.img
>   mkfs.ext4 -O project ext4.img
>   mkdir xfs ext4
>
>   mount xfs.img xfs
>   mount ext4.img ext4
>   touch {xfs,ext4}/file
>
>   chattr -p 69 xfs/file
>   chattr -p 42 ext4/file
>
>   mkdir fuse
>   ./repro_fuse_getattr fuse "$PWD"/xfs/file
>   ./repro_fuse_getattr fuse "$PWD"/ext4/file
>
>   umount xfs ext4
>
> where repro_fuse_getattr is a simple fuse mount, compiled with:
>
>   gcc repro_fuse_getattr.c -o repro_fuse_getattr $(pkg-config fuse3 --cfl=
ags --libs)
>
> and used like:
>
>   ./repro_fuse_getattr <fuse_mount_dir> <full_path_to_real_file>
>
> repro_fuse_getattr.c:
>
>   #define _GNU_SOURCE
>   #define FUSE_USE_VERSION 35
>   #include <fuse3/fuse.h>
>   #include <stdio.h>
>   #include <string.h>
>   #include <errno.h>
>   #include <fcntl.h>
>   #include <unistd.h>
>   #include <sys/syscall.h>
>   #include <sys/ioctl.h>
>   #include <sys/mount.h>
>   #include <linux/fs.h>
>
>   /* needed to get the file's file descriptor for the ioctl */
>   static int my_getattr(const char *path, struct stat *st, struct fuse_fi=
le_info *fi)
>   {
>         memset(st, 0, sizeof(*st));
>         if (!strcmp(path, "/")) {
>                 st->st_mode =3D S_IFDIR | 0755;
>                 st->st_nlink =3D 2;
>                 return 0;
>         }
>         return stat(fuse_get_context()->private_data, st) < 0 ? -errno : =
0;
>   }
>
>   /* pass down the ioctl to the fs */
>   static int my_ioctl(const char *path, unsigned int cmd, void *arg,
>                     struct fuse_file_info *fi, unsigned int flags, void *=
data)
>   {
>         int fd =3D open(fuse_get_context()->private_data, O_RDONLY);
>         int ret =3D ioctl(fd, cmd, data);
>         close(fd);
>         return ret < 0 ? -errno : 0;
>   }
>
>   static const struct fuse_operations ops =3D {
>         .getattr =3D my_getattr,
>         .ioctl   =3D my_ioctl,
>   };
>
>   int main(int argc, char *argv[])
>   {
>         const char *mnt =3D argv[1]; /* FUSE mount point */
>         const char *real_file =3D argv[2]; // full path of the file on th=
e
>                                          // underlying fs
>
>         /* start FUSE */
>         pid_t pid =3D fork();
>         if (pid =3D=3D 0) {
>                 char *fuse_argv[] =3D { "fuse", "-f", (char *)mnt, NULL }=
;
>                 return fuse_main(3, fuse_argv, &ops, (void *)real_file);
>         }
>
>         usleep(300000); /* wait for FUSE mount */
>
>         /* Query the file attributes through FUSE mount */
>         char fuse_file[4096];
>         snprintf(fuse_file, sizeof(fuse_file), "%s/file", mnt);
>
>         int fd =3D open(fuse_file, O_RDONLY);
>
>         struct fsxattr x =3D {};
>         int ret_fsget =3D ioctl(fd, FS_IOC_FSGETXATTR, &x);
>
>         struct file_attr fa =3D {};
>         long ret_sys =3D syscall(SYS_file_getattr, -100, fuse_file, &fa, =
sizeof(fa), 0);
>
>         close(fd);
>
>         printf("%s: FS_IOC_FSGETXATTR: ret=3D%d, projid=3D%u\n",
>                real_file, ret_fsget, x.fsx_projid);
>         printf("%s: file_getattr:      ret=3D%ld, projid=3D%llu\n",
>                real_file, ret_sys, (unsigned long long)fa.fa_projid);
>
>         umount(mnt);
>         return 0;
>   }
>
> Thanks,
> koraynilay
>
> [1]: https://lore.kernel.org/all/DN2YMTH77KWE.3IPE9OG8377X0@gmail.com/T/#=
t
>
>  fs/file_attr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/file_attr.c b/fs/file_attr.c
> index 833e03810b24..3b249a0a6b36 100644
> --- a/fs/file_attr.c
> +++ b/fs/file_attr.c
> @@ -383,7 +383,7 @@ SYSCALL_DEFINE5(file_getattr, int, dfd, const char __=
user *, filename,
>         struct path filepath __free(path_put) =3D {};
>         unsigned int lookup_flags =3D 0;
>         struct file_attr fattr;
> -       struct file_kattr fa =3D { .flags_valid =3D true }; /* hint only =
*/
> +       struct file_kattr fa =3D { .fsx_valid =3D true }; /* hint only */
>         int error;
>
>         BUILD_BUG_ON(sizeof(struct file_attr) < FILE_ATTR_SIZE_VER0);
>

ouch!

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.
