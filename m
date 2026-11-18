Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795038816;
	b=cmG2l5M+ko5KmuTyppZVgb+M0Y2dA8ky96lItoYFZwVgB0eOUaMZqxB8KaVTFuCdVp7q
	 aeoOWDI5ByovPxA270n2srxzoHXtIow9PBPOxMYuFdC22OhNhOJ7CkAZCTjkIifeufexM
	 wKkHc6ARYJw8l4vcjL57ICej94M+2jSa2p/+nX7Uvfd81VIrPp4Bvnt7skpsv1vgfwVUo
	 GpvNk9VZFYP2CPY5TVxxJ5H2NTOK+QjXTbU6dJiPR4667Qip1WestdIGSIN0ilanIxssX
	 6a/kqe7yQsycl3YZ3Epp0E2n2jGcCU9nKTjfTdIJiM1RYtrqC06KEOEnEUuUn84Luig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038816;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MdGg7b7rxhlsTJTeV38C/+cZfx3rlg88OB46RTb00Rs=;
	b=CYLQD4xU3M9gB8d7VMTDWjWAgYmcMmwZm3YfCuHx+smONsW2NEtYf1U/MaBjv3ZyX/2L
	 lfeFGHbVIm4ermyeXM/V+UMptFF6r/qqIpsRtIUalyKMgkxefga7eJTH8Q4GKVTIvZea/
	 IwlWTSGw7sK/mEnzKsQXG3wKKskSIqPCqYfOYz7vuWAmzLn+W8q+xy4OY7VYd6yW7ADDX
	 QosNGNwIanvHrj8A4VxynKqGBZ0qQa8hXhxoKHStXx9yz8XN9nwIyfmdfAcNyPm6x1b3K
	 drjZPDZ8uyceTMqGSPOaJSEnxaWuRYjxCoOIG2D15ya2T7hL07hRf226/u8xqoLu5Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVJOd6pD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C48606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVJOd6pD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68C01F000C5
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795038816;
	bh=MdGg7b7rxhlsTJTeV38C/+cZfx3rlg88OB46RTb00Rs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WVJOd6pDrmsWrQOJCOEgCWSLmfIoPidxmraVEPFoHOHx2WOzTL3G4tIGJ6fK5D8Yb
	 bjykPCw70Qrf6yC6P9ENM0BY1UUUrjMLWvYQsAB1nL/eKg3gnV3OyBhLsWZOMdla5d
	 qJ/TK8/s0Ce1EXaWQWjL2LWJfcjiNTdUSdlsxX6Njh/7zqy7p4cMqCdRJHTRyb5L15
	 RHPnhWQu6ATQpqmfmYNrkjxkcIqGa5sIGg46mnLESklxIOc1yRmkqSfuufE+Jal451
	 sBXa9uTbCsST7rcCvexctmO8Qt+gVZ9svPkPw5vF3ENpqtTu54bqSNHIyZYTEPohNb
	 nvSxZz8AqB9xw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4322d310e7so242836366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:53:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEcF00k6WyCUHgeqTGYFphQdmb6IL4nNE1HLV0TMDjqk/wToVzJdu03g5V4RRA0yJ3t3z5yITDEUy8u9Dc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GzKJm1UKYG72S8Xheinlw1PFVYCAWcNy/yDOSSsLQdB+q38V/
	GguZp02XhRFhxL8qknODvKOlyB6NwaNzBmHIBK0KLREIdsjBMOzf5rvNZgYDfO886UKuYWIFxtx
	yQLWjp4KptXbKx1/K1ynMWtcCyxwzaTc=
X-Received: by 2002:a17:907:3d10:b0:c31:5bb8:4b3b with SMTP id
 a640c23a62f3a-c510dfd72b8mr372753766b.2.1795038815384; Wed, 18 Nov 2026
 13:53:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117145005.2638107-1-icb@fastmail.org>
In-Reply-To: <20261117145005.2638107-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 19 Nov 2026 06:53:22 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_4G3K1dbOrX56FFhGRcmk5vb=BNdqMpjTVbjY2NWOemQ@mail.gmail.com>
X-Gm-Features: AclHuK_FhTDeCkHXhLhFaARSCJM09EedOfHEgPt56CjNCi-eFOuqKduFq79lGjE
Message-ID: <CAKYAXd_4G3K1dbOrX56FFhGRcmk5vb=BNdqMpjTVbjY2NWOemQ@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: do not log a stale security descriptor as an error
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:50=E2=80=AFPM Ian Bridges <icb@fastmail.org> wro=
te:
>
> ksmbd stores a hash of the file's owner, group, mode and POSIX ACLs with
> each security descriptor. ksmbd_vfs_get_sd_xattr() recomputes the hash
> when it loads the descriptor. If the two differ, the descriptor is stale
> and ksmbd treats it as absent. That is expected after a chmod, chown or
> setfacl on the server, but the function logs "hash value diff" with
> pr_err() every time.
>
> Opens, security queries, hide-unreadable listings and inheritance
> can all load stored descriptors. Repeated opens of a file with a
> stale descriptor can therefore fill the kernel log.
>
> Report a stale descriptor with ksmbd_debug() instead, and include the
> file name in the message.
>
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
