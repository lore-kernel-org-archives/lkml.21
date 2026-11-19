Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095740;
	b=lbdpxx0VjRlzNLoNJRLqHysiELeOCIWfCZAXvl/b059M4ArbrJuBVGJ1T0fULF7Sm9D+
	 M+mRNodgQq2flWVBXn/lwvH9qraPVDO9L2OpIeisKDtYQHUU3/mPapA4/uhzc9mqb66xu
	 YIKMErRRN7rUp9reP4m/9+5IWIES89jGYZcauwVRKeeVUw7tLCVoXaSlcNSOZvYOL8ZTf
	 KPMcGwjshJUu5cRwElCxIOTfkeA04BTLZYQ9GDKQVJ5M07g+0YyVfC2FWICBzSAhX6iBE
	 2TG0iJi8gZRzDyNuo3aBa3hhZA4Sx/Az9x89Ew/v98N+CLGO55YD5jaeGkN7pRRaAow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=LsU8Zjx85+8Bc4fkBL6bsA4+NBo/da2SQz5szSsymVw=;
	b=P1QMa8GwM158cwZlC7yHktr/IpqAQdqEewlNXW93Uj7xRQzLyZnjp5fgPp0oB5m0U7KS
	 si7Wb2ztf5NjWLdQDQxfiRHMTqHrnpXK09u8bGRNdNH1mf+0nFjmnaBwMSYS4qckO5NDi
	 KWVHzpCHCp+OGwuy5xvW1TY0+F/0c1EjpNqbS441zD4za5nUl7Pt+j+vPBTCOFhhSJCRl
	 AVc/8/Wtg34mwbVta6TGV/Gf1qfFBgbeBwlBXzLhQXGssftB1bbdBfFsk0PdwYhcFu+pN
	 hv3352ynrcDGcBdJH1ifGU6a4PYDU3wlLmfvuLCceiTqIO2kN+/gKQnRTV+/8d7Vcdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZEpM7oQ9;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1815606A334
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1815606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZEpM7oQ9
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so20533365e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1795095738; x=1795700538; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LsU8Zjx85+8Bc4fkBL6bsA4+NBo/da2SQz5szSsymVw=;
        b=ZEpM7oQ9F48EoPJ/3iQMrQUiqSXJxvckMmoaQM0X6ue6VQrsD2bzvMPbJuI3lzYt+l
         qNg7bMquBuJPUrMKac9sQY4E3sSv+fEcqJdzpmxc0ETpzivfk8n1NYXlXh8xO3YVLfW1
         aNSfIHH170nuIwcc6Ba9wWVDoyqwwwDCQ8nWWxEwiZooHarblvJG+EIoLbkXr/PxpvtX
         HhCUmTHLrR2eTkmy//Rfx3aH26h1m0nF9uc5VbT6bCQg/UYtxze4js7R7BFkK9we8TWJ
         e/3FjVCYRDWcz2yEiE4zKo8eEFsm4kxNcIR8MvsfGPLAt6w0H4yxe3bY8yAwAQbtgcH9
         +Xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095738; x=1795700538;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LsU8Zjx85+8Bc4fkBL6bsA4+NBo/da2SQz5szSsymVw=;
        b=C3D9y7jQ23wzAJw27OnFc5I1PNZvFV1VJaUIgQnEksqNMptZSRauuLLe/d2CkbMZfw
         QFNlR/H+ezsRrFwrU4XS8She6kfXDm6xGNNqrEjmROCOeAjDYNqb+K9QH/2s07biE4nN
         wH2DymZ1McyWsctaFC8feuINhqOiPyTBei4AMrsAl+4cl2eqBtc912JfukhhguGc3cX/
         4mDjxJIQrD18lWB8Ok/NFqXLtCKelxtLnqQIYHldnGLs8NLJZkr78l1pjHlHTVqaXPW4
         Ty87Jf7cRMzZA1OKkYGkHzg5Eny/m3M5prY5R9xeEKR7Phgi0FMLCXQlkREcIIKwGDao
         JHAA==
X-Forwarded-Encrypted: i=1; AL+hErExUBx87P8kEoie4sxpd+3uB2IvEoUmHGIAuFyXFhl6fZhORSZwIdKUYN1mPanQltTPMRha78agbzYs9SI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bz6Ql8pNlo/wGJ/12JAqfW61qJhQaHOlYXMDCTveXpJ3t5Iys
	nfQHzdCWa9LSu5yjXhV3MDCsjblvKvip4i3Desn4Xr6ssDDjsKCz/Ve3LWukypZh9/56
X-Gm-Gg: AYBFou3Tp+ANba1af+BrJ55W1JBAWHF84wOoIkRQv8MK9xYc3ul8Z2ufb22vBvLfu/X
	5Gic/CUnOZTuxIJwQUpgo7/vdYfOmfHNo7h7ZawjjHGHBZGoarN2/Q5Hm7SWFIS2yUxtkLbQJNF
	A1pTsKd/UdwfeLQQJ19WtJaGnh+3ix8PFkAEU97xQVfHwPMMQNBPhtGVp5DUQuMyh8Dr3EeQaRk
	LHZWXu0jMXrbVMuXzFQo7Hgw/SLDDozSX+5eVC2tWmTy2VlewNLlrAsmOB/IgMDDq8n0r7gKuXP
	gdLwAS4SGzUKbdvKV6V45+/h8BD4gRXljiv+h6gwjWgM/M5+7ARUjsJ3iRNWLadFf+50JrTto1p
	HIm8PIPDN5Kmv5tApxJ+inKkILXVlhUxrAIUaC+U/0iCLXfarfxQ1BATzI/uguLLIN1ZmraVTxN
	XNAUw9Y6feAOCRM4j8mK1x0V81jE6ip7vllVPXFV2LQZ08BAdwpTMOkhzojYuAHLncNQYjv7yb9
	TUSDh9Wl6C/Qwnr0Zx0u52dLwjmY6OQQcXuJEcpUmGUsB8a+ex8hHvh8vWTwn0+LSDAktFAO61x
	SXSOQEUY8qqcVux8BKJP+68hGsLfUtFOrfjJXpvfbqjMvuxx2tpagoiEh6F07SneOMwzTr6L0ay
	7z5WCAWyg3ragpekAjgndsIMsy4PMLD66H4ZZBrZinXO2fBYG/m1Igw==
X-Received: by 2002:a05:600c:4e93:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb7da12f06mr122414505e9.17.1795095737895;
        Thu, 19 Nov 2026 05:42:17 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:677:1cd6:7e14:6fa6? (p200300cf572c280006771cd67e146fa6.dip0.t-ipconnect.de. [2003:cf:572c:2800:677:1cd6:7e14:6fa6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85372b67sm39429045e9.13.2026.11.19.05.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:42:17 -0800 (PST)
Message-ID: <3e4103cbcf7b76535e2f957762174515ef00f08d.camel@amutable.com>
Subject: Re: [PATCH] pidfd: restrict pidfd_getfd() to the caller's pid
 namespace
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Jiwoo Kim <arpe1618@gmail.com>, Christian Brauner <brauner@kernel.org>
Cc: Sargun Dhillon <sargun@sargun.me>, Arnd Bergmann <arnd@arndb.de>, Jann
 Horn	 <jannh@google.com>, Chen Linxuan <me@black-desk.cn>, 
	linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 14:42:16 +0100
In-Reply-To: <20261117152332.1221-1-arpe1618@gmail.com>
References: <20261117152332.1221-1-arpe1618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-18 at 00:23 +0900, Jiwoo Kim wrote:
> pidfds can cross pid namespace boundaries: a task can obtain one for
> a
> process outside of its own pid namespace hierarchy through
> SO_PASSPIDFD
> or SO_PEERPIDFD, via SCM_RIGHTS, or through file descriptor
> inheritance.
>=20
> Commit ee8323fdc827 ("pidfd: restrict task access ioctls to the
> caller's
> pid namespace") made the pidfs namespace ioctls fail with -EREMOTE
> unless the target is visible in the caller's active pid namespace, as
> PIDFD_GET_INFO already does, following the rule that operations which
> grant access to additional resources of the target require this [1].
>=20

Hi Jiwoo,

> pidfd_getfd() grants access to the target's open files, but it only
> performs the ptrace access check, which does not take the pid
> namespace
> relationship between the caller and the target into account. With the
> caller in a child pid namespace and in the same user namespace as the
> target, PIDFD_GET_INFO and PIDFD_GET_UTS_NAMESPACE fail with -EREMOTE
> for such a pidfd, while pidfd_getfd() on the same pidfd returns a
> duplicate of the target's file descriptor.

It it an interesting point, because pid namespace itself it not a
security boundary. While user namespace and capabilities are mechanisms
to manage permissions.

Currently, you can do something like this on your machine:

# Terminal 0

echo $$ # note this PID we will use it in "Terminal 1"

# Terminal 1

sudo unshare -f -p=20
echo hello > /proc/<PID>/fd/0

and this will actually print hello in the Terminal 0, while the process
doing that lives in nested pid namespace. But this is not a problem
because this guy is a root:

# Terminal 1
cat /proc/self/status | grep CapEff

So please understand me right, I'm not saying that your point is not
valid, but I'm not sure what was the intention behind pid_getfd() API
in the first place and we might want to have semantics and model close
to the one procfs has.

Speaking about other cases, where we *do* have this check:
- for exportfs operations it completely makes sense, because filehandle
  contains an inode number and user space may accidentally (due to the
memory corruption or purposefully craft it). When I call
open_by_handle_at I *do* expect to get something from my own PID
namespace.

- pidfd_ioctl since ee8323fdc827c580425644db605a4be776cace57 ("pidfd:
restrict task access ioctls to the caller's pid namespace") doesn't
allow to open namespace files, while procfs has no problem with this
(it works you can try)

- pidfd_info() also forbids cross pidns information retrieval and for
part of it functionallity we can do it through procfs, but for exit
info or coredump we can't

To conclude, it looks like we have a little bit of inconsistencies
around here :-) [ But please, don't go and change anything in procfs as
we might break some tricky use-cases like CRIU and SCM_RIGHTS users. ]

IMHO.

Kind regards,
Alex

>=20
> Apply the same rule to pidfd_getfd() and fail with -EREMOTE unless
> the
> target is visible in the caller's active pid namespace. Callers in
> ancestor pid namespaces are unaffected.
>=20
> This was found with an AI coding assistant, which also drafted this
> patch and its changelog. The problem was reproduced in a QEMU guest,
> and the fix was tested there.
>=20
> Link:
> https://lore.kernel.org/all/20260925-gewischt-auftrag-tierzucht-c153cb3f9=
f74@brauner/
> =C2=A0[1]
> Fixes: 8649c322f75c ("pid: Implement pidfd_getfd syscall")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
> ---
> -EREMOTE is a new error for pidfd_getfd(). The check is done before
> the
> task lookup, so, as with PIDFD_GET_INFO, a reaped target outside of
> the
> caller's pid namespace hierarchy gives -EREMOTE rather than -ESRCH,
> and
> the check comes before the ptrace access check.
>=20
> setns() also accepts such pidfds without this check, but it requires
> CAP_SYS_ADMIN over the namespaces being joined, so it is left alone
> here.
>=20
> A reproducer is available on request.
>=20
> =C2=A0kernel/pid.c | 14 +++++++++++---
> =C2=A01 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/kernel/pid.c b/kernel/pid.c
> index adf721606768..4f9a29eb29de 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -893,6 +893,13 @@ static int pidfd_getfd(struct pid *pid, int fd)
> =C2=A0	struct file *file;
> =C2=A0	int ret;
> =C2=A0
> +	/*
> +	 * Require the target to be visible in the caller's pid
> namespace,
> +	 * like the pidfs ioctls that grant access to its resources.
> +	 */
> +	if (!pid_vnr(pid))
> +		return -EREMOTE;
> +
> =C2=A0	task =3D get_pid_task(pid, PIDTYPE_PID);
> =C2=A0	if (!task)
> =C2=A0		return -ESRCH;
> @@ -917,9 +924,10 @@ static int pidfd_getfd(struct pid *pid, int fd)
> =C2=A0 *
> =C2=A0 * This syscall gets a copy of a file descriptor from another
> process
> =C2=A0 * based on the pidfd, and file descriptor number. It requires that
> - * the calling process has the ability to ptrace the process
> represented
> - * by the pidfd. The process which is having its file descriptor
> copied
> - * is otherwise unaffected.
> + * the process represented by the pidfd is visible in the caller's
> pid
> + * namespace and that the calling process has the ability to ptrace
> it.
> + * The process which is having its file descriptor copied is
> otherwise
> + * unaffected.
> =C2=A0 *
> =C2=A0 * Return: On success, a cloexec file descriptor is returned.
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 On error, a nega=
tive errno number will be returned.
>=20
> base-commit: 44cc27050381e92de64cc3d7836376eda4d92a5f
