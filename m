Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795828648;
	b=DOilVW+WQO8eMOPNfwFNqkkW6bp06Tk8WVUa3iQrm5JuYElAjsBnbBSBkmtBvf5mSjhd
	 noPpahNHITgQm6PZInZ0if0rcrfBVGOjtUQ/tAg/SOJQQgkGlRiwWOnPvQfvAARgNsRun
	 VAGi+sTN6XK++H2bGzlGMoGDWMXw50ysz3ZeP7wMxILeXrEB/soFoRuYB1vSEcfkiG1UG
	 R2vwhxkx11hGfF5vJ3N0vz+oIPzWynMvCiKezGSu5eZmTCIc39h4YbcZGu5BxpA+lyE7L
	 pax9JnMSp3Cgh1/zsKpCfcYfRMtP7mP0X/x++iuPECBfZzEBhIc6ftGLYAWitB2er8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795828648;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6SPUkkDnbGx0di3Iciwy/aQpzoJCxAXF+HCwj4dQ2nQ=;
	b=yPWf5G2sJakihCm7ZU5TMZDb288n8FjGmwEnAj1mGJKOsWmxct+rlDAanxLxXa6qbvvs
	 7hIU1k7aO3ltHyyW8WxGIF4UVW+OZlAabcxc8gv5QXMogTpiWZaL0DzN0Kusa489Ty1W0
	 /T0fH+TVYrsHpFGIijs5S3adrR4iTEfNI31TZ+FvrBzKJEEiWX/72NTXv5uhVf3Qqr9PR
	 r5Lale49lrIVYR/vulOkFxqDQfGMBxosIv4dt6crvKDTF8HIa+2wcsJozmyna6zKLCLb5
	 HJLyIwz1M2jM3EFiDg5rGG7nk8ANMzooepZmgycybLkmWU5mEf9UUxIebhdamvEnU3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QevbtlhX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E394606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QevbtlhX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33671F00899
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795828647;
	bh=6SPUkkDnbGx0di3Iciwy/aQpzoJCxAXF+HCwj4dQ2nQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QevbtlhXPaFPCy2DKvXJNaYEq4+oZ7q0DYAAKtT9oQa6N06FdNKJxNZPy7R83xqpx
	 y6Z87xtaAObr/la2oCKt6gXlusAdmrOsyqejsFN3jVp9xoxS61amcSg3/ueLSBnc+X
	 aU+CnA+AKQGhjNd4xaF/P5amd4ezP0U9D8tKNRdCC7oWQMPlKLoXJ6/+nJLjYC/cN2
	 Xo2cxu8V6aVRfWeHEtB54J3LO5MGXh09GKYgtqOgKvYRsc8kH0te+psOZ91PIDwntS
	 lrqAC3sQjgROKpyfGgJzrZsZi7RRE8EgVZ36RsJmOaSGo2e+cj7KcTB7imIw1gb3CW
	 nlW8BdzgrCSzw==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5126505cb3so1135781666b.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:17:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGpzgmJjrd4m7EcCBUJs9dxSlMF9aJyoFvfs2cWfuPel33GC7pJqt3db9efq2T0VGGf2K0mQw01tV+wQzQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vm9KtwI9p3m+z1LfR4Ix1X9aJPG2ous2810mtEii+snDKGgBf
	axu89nan9ieGCgtGJY4Xx58o78VzyvNqGeb+uWT0o1o4ZNq5RjdJ5+PM7Xwgz5rtie8130UdEtP
	Ycc7lNpm5c2vQQfetiaBap6ybFEMtE7s=
X-Received: by 2002:a17:907:934c:b0:c51:282b:5489 with SMTP id
 a640c23a62f3a-c513a4aea3bmr2092619266b.3.1795828646455; Fri, 27 Nov 2026
 17:17:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261128000906.1677969-1-icb@fastmail.org>
In-Reply-To: <20261128000906.1677969-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 28 Nov 2026 10:17:11 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8_QgT5sM0Uwg7DkKPoyKqBVaFmbCb8Ay13sUp3cBYY1Q@mail.gmail.com>
X-Gm-Features: Aa3M54r2iLdu7Vku85h51LckhMl8uk9uQ3dQlA_gkNCPmaojH9-_QYon5N12iqM
Message-ID: <CAKYAXd8_QgT5sM0Uwg7DkKPoyKqBVaFmbCb8Ay13sUp3cBYY1Q@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: don't take an existing file's attributes from an
 open request
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2026 at 9:09=E2=80=AFAM Ian Bridges <icb@fastmail.org> wrot=
e:
>
> When smb2_open() opens an existing file that has no other open handle,
> it sets the cached attributes of the file from the FileAttributes field
> of the request. MS-FSA uses that field only when a file is created or
> overwritten. Any other open of an existing file ignores it.
>
> The cached attributes are shared by all handles to the file. So the
> client that first opens an existing file decides the attributes that
> the other clients see while its handle is open. Stored DOS attributes
> replace them only on a share that stores DOS attributes and only if
> the file has them. If the DOS attributes are written while the handle
> is open, the attributes from the request are stored and stay after the
> last close. ksmbd also bases its own checks on the cached attributes.
>
> Take the attributes from the request only for a new file. An open of an
> existing file starts from the attributes that the inode implies, and
> the stored DOS attributes are read as before. An overwrite still takes
> the attributes from the request.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
