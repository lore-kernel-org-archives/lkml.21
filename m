Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088240;
	b=pr8hBN+nJrr89t6hy9Ei484PpoVqlnfUX1X6qftBkE4CBBOhb1ETuFMAWLcPO2OC4745
	 3NwXbMUjNr2xbyAPq0HUcoMVCiBx07T3ezA+G2CNoaV+4JDfMBlajfpS0WHj/x3lh2jT0
	 G//UwYVu5fIBu0MJDpgPkGG73JsZoQ00qEaSosV0rErv16En8vowyl3fsS0T2haqIwunx
	 gHM0u/K5N7qg2luGUY+/jvyPgh+dd/zRyDGnMm50hOpgWWbpUvlezlAQrAMcAVNP4B1qz
	 rEp1+7N0yy4j93J76Q4ouq6oBG/cBps/UBBlJa5yiidE6QU57V+1UMrDYaWR6mDbt9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088240;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rcqc+WTD9IhSKmFqP6R73mZ2Ro+j/JKdXcfJz00sz/A=;
	b=KkJPLQmqSIKbM6SFS2WNKomVpu/2FR94z9XTGx+lKioTv6/MVkR46b7AqhttB2SBGwI0
	 Y1OvWN9r9DmQFnNLKBLI5BwCmjTotIzFLkhj2C12Av/rOtDHGur5uVWvp914Gb0FJ7ox+
	 4EbsKqtoZIQlYhcHlDV3UUHO8Ccd2Tn07uOEy1gkt7mcpBUI7SLrqt5C0bCDJlcbXZRz0
	 IQ22kjkNV+1W1CIOUhCoB4/bZz1lxAQ+XE4yvgKwFsKhvYit1Ewuj+i5CoszMPF4Shc3D
	 RywN7U6Cmu7jB9oWfOuz1LaIcEcShdp4GBlyDl9ePwg2laUQdZeeOEVy0GPO1/aSFDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOGWVJLQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA8F60A2601
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOGWVJLQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581A51F000CC
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795088240;
	bh=rcqc+WTD9IhSKmFqP6R73mZ2Ro+j/JKdXcfJz00sz/A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oOGWVJLQMT9MROIPnXWFDxcv3oaPUNR2WPe+Ll8j0jzvaScGvNqyaM+ldHjR6d4ji
	 z/IesoVV0lESGfgeQhdoQBYDukAL7Wtn6MQjiLpMTe1Ec8vn33HxTNrmS4c/tIh3YD
	 HkDovWCXRcOR39ezWfIITSFy9CJpUDh9waYhNRHEmAfVVBsG/Id2L+dlQh67Pa8weY
	 LAamJ5FPJZCIUkuOxJl/0RDszHDdTKVLSBnkx5lMXF2hQFAzmNIJ+HPpZWq0JrFgY6
	 tP1N4xPK0SWsUFQuCqielT1c+8MyKoIwu9C8wFK+AEPcRTh1muMJFg2saCpdpd7MYn
	 kuT3br2QhN89Q==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so3057913a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:37:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFi0UZJWYQcsiqtvcNEC1/CCrz4uiipu7wQRGEy2FQwAAO74ZIDAigUaQMSJ/nXx6sgXBuZrv+8KQcpP/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UfihwtgcALKxk35lyYAYaXOfiAbUdrmPtvX8l5fA6uCxOdST6
	4oqG4EQEWdTzSa95jYemsQ4uH9HMoxvjv9bodklwF/TFkvw2f4yD0qelVzcaA2znjKZh0BBtGyX
	XePMtf6nnpM9kYR+fCr2/Ye/LXR/aoog=
X-Received: by 2002:aa7:d94b:0:b0:6b7:853f:5e9b with SMTP id
 4fb4d7f45d1cf-6b887f0d7fbmr3413317a12.16.1795088239018; Thu, 19 Nov 2026
 03:37:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119073534.118732-1-icb@fastmail.org>
In-Reply-To: <20261119073534.118732-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 19 Nov 2026 20:37:06 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9FoDgXmR3nedUrjAJg8dYEUbKkO+E-N1U2a=wxn-EpUA@mail.gmail.com>
X-Gm-Features: AclHuK9osdHfklEjXswVGiM12TtcQ7-egTgsmLQIDqk_Uo_EuHbRQJ108BRcSQI
Message-ID: <CAKYAXd9FoDgXmR3nedUrjAJg8dYEUbKkO+E-N1U2a=wxn-EpUA@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: build an inherited security descriptor with its
 own offsets
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 4:35=E2=80=AFPM Ian Bridges <icb@fastmail.org> wrot=
e:
>
> A new file or directory can lose the access rules it should inherit from
> its parent. smb_inherit_dacl() sizes the child's descriptor for its SIDs
> and inherited ACEs but copies the parent's offsets. The owner and group
> SIDs keep their sizes, while the child's DACL can be smaller or larger.
> The parent's offsets may therefore be wrong for the child.
>
> ksmbd preserves the component order sent by the client. The Linux
> cifs client puts the DACL before the owner and group SIDs, so their
> offsets depend on the parent's DACL size. If the child's DACL is
> smaller, the copied SID offsets can fall outside the allocation.
> ksmbd then uses a default descriptor, losing inherited deny ACEs.
> If the child's DACL is larger, it can overwrite the SIDs.
>
> Build the child in owner, group, DACL order and calculate each offset
> as its component is copied. These writes exactly fill the allocation,
> so the checks on the copied parent offsets are no longer needed.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
