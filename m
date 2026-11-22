Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795344517;
	b=sILJL7Au2anN3Xg9m81SsPdgK9/WFMiksX2L9l0KES0qTisp9Rom2PkUAie/Mcghlypx
	 LgnPMxK8u+DrNi9Es/TipNdi6U1b/ryihxHBUOVmgnIHn00BOTs+pksWBDykcYrZcJqtF
	 jzGcjI2B+2qNKxZ8raxMXat0rpD/UpzEldcWvsNHwG06p/Sidd3AFwHe7cumMEVhl27gT
	 m+Y9qcfDejpwCrn2vdQFzX52zeU5TDcF7beeqwS9miiVYmqzvIVpLBqifuFnMnyvEoEJK
	 0WGsVhfgftmEBS1bhW2egONN49HO3bAh32RqxyaHI6lw5zg4fuD6vHlOKMgsYotOTig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795344517;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3xwoGgBBU6yR/sgCOpMUSAnG5r+ndUZpjhA/RehvqNo=;
	b=h0So3RWP48vpeQ+P+aYWOCOGGEa1B2ujg6KzNlsaJNAt/1cCoYLMrDx6keS8w7U6UAKL
	 Ih46Vuw1UTlTfk70RsPdBFR3FbGujUVECfu0xSAwtrvxmwtLPOBu998cLKBClC1UWof2C
	 5OYTq65vRmzrRSaGfsB8FdiB6cbzrCOjPxQJszGFau6j6O1p9EYPc61a0X3oNCOu6b9Vd
	 duZ0bag09NOq73tzO5fWQfUSVTPk7iow3/7xDhaUyj8Xyyek5OWtH9IedO/cKEzj9py82
	 vwsi0QA4aY5mrd0RM4rw7u6D5U19RRbkNqVKbVbRqhCMjVy7NdoY4nQaLC2A5oWrDiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6g2SAjG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B95606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6g2SAjG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADEC1F000CF
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795344516;
	bh=3xwoGgBBU6yR/sgCOpMUSAnG5r+ndUZpjhA/RehvqNo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P6g2SAjGXeYgYUX2hjuzvNJ9F5p0FOIXMM/ZEarehiOucAvZLEStqz49NhGb4Hm7Y
	 b55I/vGcAZbHVJnvWj30p46c2BpddVTtflklqDA7GrTN152S3SHcxu0yGulRhQfLAA
	 0RRhOUyvEE+1NxXgPyQAB3s5i3sRUxlHy0XL79gQnlk9dFI879fMv4atEbngOD/wtd
	 bPsrHyXSrD/4bokyDyGJkqk2RkTocdIp6lU6s/YbutrD36SGWO7Up3ZntPeBDH1wxr
	 F3Y8EbbPGWz2Ji2nAbf8iZr+nl97kQu3YOvMQZTvYJXlGVNhDIMjuIsOpp0UTK9cfU
	 CrlNT012UkDbQ==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so2853372a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:48:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFkptes4Yh745yn1I7fuJRt85lxJR59p9z7b4H2P1ZPPq3A5S7tFjh9Gwn6ewqlcE3ds16/whpixATxNdk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xNxed+jcN1lh0j3yqMeQD2aah8i+6dhfkM8anJqYbneEftIIk
	1tDrHInRMMAAgUtGUyTX93fwGsvT8cuMP3JKz9tNsZo/AWWXtI8J56laqh41/g4rrK5PkppJHuo
	d9x7KR3EJonpEUKyew0rDl/hCGgpH8Xg=
X-Received: by 2002:a05:6402:3514:b0:6ba:144f:ae3b with SMTP id
 4fb4d7f45d1cf-6ba37c76a3amr6162923a12.4.1795344515503; Sun, 22 Nov 2026
 02:48:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115132609.209957-1-liubaolin12138@163.com> <20261115132609.209957-5-liubaolin12138@163.com>
In-Reply-To: <20261115132609.209957-5-liubaolin12138@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 22 Nov 2026 19:48:22 +0900
X-Gmail-Original-Message-ID: <CAKYAXd965H1n0qTsStX9z=JDK2cNJs5OX2T2eHq9=_EHTqX2Jg@mail.gmail.com>
X-Gm-Features: Aa3M54oU2r9EtNhaewOhR1YZm7SHWkPsgSNOHQXITu7MijHt6dFhD244mtn7s8Q
Message-ID: <CAKYAXd965H1n0qTsStX9z=JDK2cNJs5OX2T2eHq9=_EHTqX2Jg@mail.gmail.com>
Subject: Re: [PATCH v4 04/12] ntfs: remove remaining attribute lists on
 creation failure
To: Baolin Liu <liubaolin12138@163.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Xuewen Wang <wangxuewen@kylinos.cn>, Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:26=E2=80=AFPM Baolin Liu <liubaolin12138@163.com=
> wrote:
>
> From: Xuewen Wang <wangxuewen@kylinos.cn>
>
> Creation rollback can leave an ATTRIBUTE_LIST inode cached after freeing
> the base and extent MFT records. MFT reuse can find that stale inode;
> dropping it under another inode's record lock can trigger a lockdep
> warning.
>
> Remove any remaining ATTRIBUTE_LIST before freeing extent records to
> release its storage and invalidate the cached inode. Drop the returned
> reference after releasing the record locks.
>
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
Applied it to #ntfs-next.
Thanks.
