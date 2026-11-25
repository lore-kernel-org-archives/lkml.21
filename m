Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573148;
	b=B3smEAOHdUz/BP0rmqWORd0+9E2PWx8lVx0aISg4lnuPFxsz5vs25rBFdgHtf2gLIR0V
	 YpbcFe/oIQ0s7NBY47snN/MnGv+6H8Mn8hS33+6yWf/rbBPxwvJedcODLWKNutgjz9KeV
	 auen/n/Gqg7/iFoeNQHuj+D18ekWJLtUp18WvTqzOhPyPSJv0NjiITMF7up+EK+OJM8By
	 3ctpXUxzZlUUht9rrdYs5DAXsHZ2FIa2oozw5ixsAxicIaCvq0rpPexR2+HHP/PiMog7s
	 uTN+Q+uwvSG6GRAERvyucww4OIIm1O7cbTKut+zJpqWmlgR1h3f883Jcrs6Zqa2w/CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573148;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GYoP/F22Ugc6lgcVzIqTK81cwwtgjlrxX6z9WpK5CTY=;
	b=MrsjyD8ZJKvykq91IUDXIcxdALWY8PZlgZb7+UpUkOC1HUqASc+joefmVyJXOvS9i0P+
	 s2QQxFjB6WH0ED8abKOQCj2zWWRRybjuwKeagSQGVpvmHk3nHEINIqCdi8tyApXXzU8Y1
	 k0tjm64dKJ2w4uLJD5ngenPr8HtM0OZdBSWHtXnTk3ihed8EUAXkstNvNviUpsp1EF3vu
	 3dZyZNAIPy3eYwitMczP699ZsIt+UYpwLkbFzJiQpLRSybnDc9Fr5QRJ6Qdi+kOhg11mO
	 9IkZw2aj+/qngtFj1VbW4bFKtG3UxGdZj3wkVywd9wBVwJEoJILWiLKw+Y1iJzTAXqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q6tjINWT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16489606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q6tjINWT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1311F000D0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795573147;
	bh=GYoP/F22Ugc6lgcVzIqTK81cwwtgjlrxX6z9WpK5CTY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Q6tjINWTxW5DThpKjro1fzdg/o1ZQU7XHnEVMC/4QUYLMOI2Meg66g7ftRrhYwjTh
	 d+Xu9fqAC/A3CjrA+7ZzZ60h6GjixTHMDZkaNeTS32pcnmOBoh/Hc2jiV3L0PbKm/m
	 /Zrn9zf4V9O+rRkE1vnrSUDaGsISuwAda9l6nF5ZOztf69jlX8OPNmV1pWIgifJS/s
	 M03CI9JSazWQEcNnePW+hNmaNZv/yftrY+AJ45i+l/2FScRD3Ie96wuI4ddFpeKTUM
	 SPfrdO3oHEUBHHT3bISFTUiI/IYOEv198dY0hfPrnyO5/0QIZGjZmmQ7itqAWNodHK
	 H6uorOufadfag==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b86fcbd647so8186485a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:19:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFuJSG5QiQ2PL+64lAjOtW3oP50nJO4IOJBTqwcEFjYFEPIxYlBllelUoNODHSCpsZ+8I+1+h+I3hty9YU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PtlwYOLdbplMxIiIugivOeacOB7+bxB21qShmyOK/jJCazuEm
	n7fN8XjVSxhosntRG2Robc2ZSmWoldleWYNq0mnFnudOojzF0WAhM36GU/HmQvB+EAYDa8RQlCs
	ZMp9qGfouYn4DhmGC4h8fqgdHkBDHolA=
X-Received: by 2002:a05:6402:a592:10b0:6ba:668c:ad92 with SMTP id
 4fb4d7f45d1cf-6ba668cb3e0mr6721321a12.21.1795573146069; Tue, 24 Nov 2026
 18:19:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124230746.850528-1-shaopei_1012@163.com>
In-Reply-To: <20261124230746.850528-1-shaopei_1012@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 25 Nov 2026 11:18:53 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_ap120uprmarov-GuO0fb1eXEgw-U8G08L1xRJ9bv18A@mail.gmail.com>
X-Gm-Features: Aa3M54phjn4LoQPu6VjS7F5RJeDya9zkDLhO5IKjGgnMkwG9AW2CqozN9PdyGC4
Message-ID: <CAKYAXd_ap120uprmarov-GuO0fb1eXEgw-U8G08L1xRJ9bv18A@mail.gmail.com>
Subject: Re: [PATCH v7] exfat: add EXFAT_IOC_COMBINE to append a file's
 clusters to another
To: Shaopei Zhu <shaopei_1012@163.com>
Cc: Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, exfat@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 8:08=E2=80=AFAM Shaopei Zhu <shaopei_1012@163.com> =
wrote:
>
> Cameras and dashcams recording to exFAT SD cards often write the video
> stream and auxiliary data (e.g. IMU samples) to separate files and merge
> them when recording stops.  Doing that with read()/write() or
> copy_file_range() copies all the data of the source, which takes time
> proportional to its size on such media, wears the flash and needs free
> space for a second copy.
Is there a specific device or product expected to use this feature, or
is it being added as a potentially useful capability without a
concrete use case? If there is a target device or workflow, could you
share some details?

>
> Filesystems supporting reflink can already avoid the copy by cloning
> the source to the end of the destination with FICLONERANGE and then
> unlinking it.  exFAT cannot share clusters between files, so it needs
> an operation that moves them instead.  Its semantics follow from the
> exFAT on-disk format (cluster granularity, a single valid_size per
> file), so it is added as an exfat ioctl rather than a VFS interface;
> fallocate() does not fit either, as it only takes a single file.
>
> Add an ioctl that moves the cluster chain of a source file to the end
> of a destination file and then unlinks the source, so that only
> metadata changes: the FAT, the stream extension entry of the
> destination and the entry set of the source:
I suggest changing EXFAT_IOC_COMBINE to transfer only the source=E2=80=99s
cluster chain to the destination, leaving the source linked as an
empty file. Userspace can unlink it afterward if desired.

Thanks for the patch.
