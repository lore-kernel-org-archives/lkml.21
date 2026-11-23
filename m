Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400519;
	b=rKoW2JM+9tvFEuwgcjUTc4msmDb4eMSIcQ+xVR7WxGOuh20Yq7JjQEZtihcZk/PHdS6I
	 R4Xb3BvlE7mLgrDRmIE760aKye+4L4r3ZPZpEN7InMAdaPgiE+p7u5kwtDTa6FfjxXL7i
	 hjeAYVcBi+4szj4n3N1HnsHzuMhe3WowwOKXHbMlYIixJ1vKP0n3RnFtVeGRKe8DWaCCr
	 QS+BH3J5Vr9UbPWIIFcIeT+6OSGsdgEJpxIhydxTYn22Q1rPnvuuPxMIUtJ7JzmzbFwTl
	 /TchcEOflQlBv9rUDSGl0/ygCRWYkNxOWBhuLa118JO44kD2uwwu/zxwPtBBcAiWb1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7z1Gv8DZqTonL8NQOcCQ3nD5cE9KuQPz8cFsKhy1wzY=;
	b=JuawmT+QRyIycW8ZV638EBcJkzv6sXMFtSs3/G2gdveIWrquiwsRJUaaM/fccLZChbN0
	 xEWuFH+e5Buq1ExaEWxB7OrnUiqkcsF31Xa/fxbihT/OtGo5o+TGgGIZ6sNNvSUIIueE/
	 WD81WbGTgrzgnY8hTKXcG/2/VAOlG0Uc/NNfIrKv/wSeJzHRhYCtzJObymZ3zgRKJmQrB
	 XHluyU+bSzyytumKP8Llcy/xZxbYXSB2DAk5JSChXLi6mz2VRxFtgp47i1feDESCpO70s
	 XKIZ0BSQCKiVUBG4iiQDJ6ozkqZ5BnUipnK1Dd1HfZOI1Pis7t8dahY/0RKgmsAdzhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHv0Omhg;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CE7606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39CE7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHv0Omhg
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1253937b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400518; x=1796005318; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7z1Gv8DZqTonL8NQOcCQ3nD5cE9KuQPz8cFsKhy1wzY=;
        b=yHv0Omhgz8uWepm7J/4YrQA4APhnXKUUJY3fhjf/LbZ7SaKNPdEn02Ym0b1q/apoOb
         5QEKjfqIsh51rEvbhE+jjyG0Pzh8VjLVan9Hw4hGqe+dDfXUa/IdiyH2aJBqG+NNvr2l
         pyfmQ9KLTN9a1FC+qb4ReEcRVd24C4M2pIPVtMykiIHxAy6QtUhgS/SvC0A6zqH4bYNq
         aV1TaPFrPt2Pior/nRtKwtleJbpebDgws3U1xAvGXLoUFdQEhqYiAkHcnFUmPjOg8uAL
         PUkDeVcUjp2eny49h0Exi16QWNKMwijdZqDMQJ282tBKZaZJFgT4tw476FBNhlHJT6DG
         xa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400518; x=1796005318;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7z1Gv8DZqTonL8NQOcCQ3nD5cE9KuQPz8cFsKhy1wzY=;
        b=iD1JXLoloLF1zzekjrqyeB+xyEKC3AFzfZK6/TNZOWz0GqiTnLu+MDS6L4LyE92aMH
         g5Kd8FS++GXHp5VZ2iBFd+LVacMWmlX9cUfxTCs8VyTFaE5UyqsFc199kovgwdZOIAPn
         4gPlrW4cKxKOCJajZn2eif6mXS1nby+FGGPgmifl+QWdrLYtaeHTrmRDphV/o5SAxz0M
         Q2DfBR1er8TD5AlRxkckV9HS+4P9fnH113agF46l+47sOEZmPW1NtHfYHE7xtspifje5
         5QvuJicUVhp4dtUOSosX7zFsCzzMudUD9uNVriQZcWEIhZfwYXkw7Qut6Fa/ulOH6AJW
         ojWg==
X-Forwarded-Encrypted: i=1; AL+hErEDR7HlxY1xaVquXDgeDHKFf3IHFFcr1Rb4KmwRpamUJQgaU5ryenK78xZJnVRcR4zaIA3vu0fgABN7Sqs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9g8la5B0PtCtDMIs04cxrMO1Lqb2fJQ6MusplNULS/zYMm6qRn
	y5Iu5W7X5SiosA1MhX9ZAAlUjjP64wu4iWMUfRxqeWWUoX5PlvLq0N4j
X-Gm-Gg: AZFdTZdImeIAXyNOz837rbxuJfqwc0DmWYI4ps3OKjRbDJRQtX6Yqw02MMAtcNvSHNe
	CEegkbdUF50MZgfPHJy/rtUy8Qe7LLDelrBB45WHvj1omn8tvI9wXGVPbRvpvvENpvyGzrEUvJP
	SQ72sBEy0xnGj187K2byABtWnVQbK9W2vjxp1fwtZgFt/fL+8da/F2oXxczuMIauG7rf/5tPOb9
	9Aex32VLt/vTJe7OYXhsYYxzRkOHVTISbRjVKnVRDZkXpOJN9xUlwMTmXmc2j9RLGu/R8u5mBGK
	Shr3V3QzoInK+pFNHOxzlnSeQwfa+z0NQ/uMRXmwkj8i96QoWKnC1wvuMhp0bjnNf/DwjI3+NQg
	iM0NKqLiw5paQeOAyAuX6suU9qQawf2y9jS5R5cbglYWhDtHOzH375qNKJHMNbAaUdKju7SxxiP
	GvIONVWcsn+L//uFH+GrP8avWZxlAfMsrLIl6KlScTJ6gc0zzC+pZPA+p3QsSQoo+Q63vu0nbVN
	bUcTjLHBRFUZHD7Q1vFB9Hd8oTD1+NphR29HtBgUKyWx5eaizjsYePmWH5yY+vGviwTQGY5F0YZ
	dv7SfRXKFZoDPI/03YRAOPHgnSPeGLLFrB0OZfwBH4piAOZz37seq2SRxIt2TJI/CCDHHKtKaU8
	StBb/s3XNd17Tmy2UAuhZw1TC
X-Received: by 2002:a05:6a00:181c:b0:8a0:7024:6360 with SMTP id d2e1a72fcca58-8c87b8da4ffmr8880080b3a.19.1795400518398;
        Sun, 22 Nov 2026 18:21:58 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm4674426b3a.31.2026.11.22.18.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:21:57 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Rafael J. Wysocki <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 Eduardo Valentin <edubezval@gmail.com>, linux-renesas-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thermal/drivers/rcar_thermal: disable the work before
 masking the interrupt
Date: Mon, 23 Nov 2026 10:21:46 +0800
Message-ID: <179540050658.417371.12537370024433882605@gmail.com>
In-Reply-To: <20261122140906.GA3898744@ragnatech.se>
References: <20261118072321.1259639-1-shunsheng1218@gmail.com>
 <20261119022903.1493494-1-shunsheng1218@gmail.com>
 <20261119062203.GC2300348@ragnatech.se>
 <179508711555.3615492.10674834361832600268@gmail.com>
 <20261119162517.GD2300348@ragnatech.se>
 <179516779969.759914.14349189301325900521@gmail.com>
 <20261122140906.GA3898744@ragnatech.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Niklas,

You are right. I do not have a ready-made reproducer that exercises
rcar_thermal_remove() on the actual driver. The 17-check test exercises
workqueue and shared-IRQ primitives; it does not show the original driver
failing or the patch fixing the race.

I should have made that distinction clearer, rather than suggesting more
thermal-load experiments. I will keep v3 on hold. If I can put together a
test-only instrumentation patch that forces the relevant interleaving in the
driver's removal path, I will share that for review before asking you to run
anything on your board.

Thanks again for offering to help test it.

Yaohan
