Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795259493;
	b=fpJXwI6Y5M67XLWAgJUqVRUdjxU2t2DYNdD+9XrO3jwhwQ3OoqBKwuLaEzAzjUxiYCKQ
	 uJzugjRmXdiJ8OgmHco3tIbuxAIkbNM4+fBcNp28Xy2q4qRQcr+2q3PijpNceYftSLpIV
	 W95WJIRCjm8nhMqyBcBEYYF2TmpbPOV8QnieZlnUEoOBizVfJL1esxSSM9rwkP3MYCnKQ
	 QHKPjYhBY42d3rmxN3vGw3iblrEu2PSFSCmuYP2D/LmSKnnIxAbLew5osfnczyF4/hH/X
	 ZGrb88AiiCN5i3HycG2KW8gsmm3GR0dZuc+IVwOmUpCqkWAhAzLl+NRoX/+gR0K5vHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795259493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=+M0BZeuDrsVXzAn7sBMCGNL00597p0WjyKrrf1Dm54I=;
	b=FlQ/MFG9toMv3OhKxM8VoQDfCzzy4Wk+apNENXAIPDRch8zqwNv9vbmpdJD2y3i5B90q
	 S4Hjh56jyxt7GCuLOs+fKzM4k+5PuVgy3u0V2oz1OZg7+hlA6tFq+zxD0/nRtc8sUaZ4J
	 fiRHFua1lW46aA3Hlvx+2bbuVbMdjXvzirtSKAWjxr2Xy1D6Fn2HRqtRX7IVV9LnBqnRf
	 rA24v0HaAt6yLtZS5jcLv2P5YEzGQ449ZRJ+JkRA6RzKb9/Vn0SE8BQ+bWPhiMQj/dNRb
	 dUSvFpyrk3Nr/V1e6W0M7bYj6sduofirQ7UIlsUZoS+6kvomyhKXYHyh17uC2S6VlRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FxGLxh35;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F99C606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F99C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FxGLxh35
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so15284885e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795259491; x=1795864291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+M0BZeuDrsVXzAn7sBMCGNL00597p0WjyKrrf1Dm54I=;
        b=FxGLxh351WyjFkOoMVbkDKCQLWMAD7Lu0G+6KFKnqN3h8YP5fbYQ5bloHntHWlom6z
         63v7MEH5nctjOJkIz7ROIMvYhDP2w4SqemDG2gy0PmQM439U7WNjZf/SwzSSL2PuroLY
         VIEe/O4MFzWKsDSKZVYar7L0y04HRevYGQw1Gd213AtYyUkN3/D0gLBlUNualmnZ9q8n
         Nr8LyRhlRNyeMEhS32PV6uagq5q6cdgJv2htzDz4VmQstY86yF6D/1wxQ1lsOwfyUIM2
         Pd7GFOJopdCpatj3MWkJJQKNwWvBi+O+6/Rye7YyYrrxqtD5J4U1dHwI4DpmAjSf8bTZ
         hohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795259491; x=1795864291;
        h=content-transfer-encoding:content-type:mime-version:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+M0BZeuDrsVXzAn7sBMCGNL00597p0WjyKrrf1Dm54I=;
        b=Iaf+D1hZ0UBUQxpYfQ2kAwEaN25mupR0M4RB2QP83f+TznIsBonz2qfsA4HQvMm36N
         2r/4KwLUEePZvApis6y2y9aBkvfRy19V7QTShE+pEWytxAXu+Oq/scea0eaRxGPFn2a1
         in6EiGI8Dew82DrbRibz+gogvrX+NKF+UgGqG8L++dqWDSP+HbnGO3sKJf2TRzQIHsjO
         w5sGgRU7bW99eJh55KB7huJLn8jxBwJXl2Tr/rbqr6uhyLwasWoZCAewar4mjYAxe9qi
         vHHaDbBLFFUPIlgbtuGkG9leaWs+hBXbE1BrvDU86LRcSgyPHFT5hWdSfrj+ACz/ZirI
         j2fw==
X-Forwarded-Encrypted: i=1; AL+hErHLgM6PtovnzQww8WXL1EHzs0FqSDh+1tTT0w8vFJqExOW+HBTf79oEvVXUynSSnj0vEANxNMXB96Doct8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1fjSOTBrN7Ae+AOFXmfLjoMcFpdTu6iLxKgCQodgJfD1G9DaU
	zPz/URprDztRh/ddkhjyNrovJj6bHLJpV1HrOWgzdwtt+h6YVluPZAuXwXjYBw==
X-Gm-Gg: AZFdTZfR8VP/SiHPMxxrRLeR7bnN6V/t7cFae9UzVDDmTMvb0QEe5hcbhddUKmcmQQ0
	ohmIIdr7SnGWlZprTcIE85c53CcI1AXNSFEgxczszRz5VBVQv+hOKWYIoAblMtwzA1e+FOZlW5i
	Y1qALFsc5uNB0nceJxcASdz71hUR6Rd1gnkkapsjdhPI1TeUPki2LZJboWUcru97Lb+6wTGCWOD
	4vtQgk+WsuxfB7MLcqEPBOQEthW5FI3Cdt11EWzLWzdP6zqaLEQG4XhNGNN1XIq9bmW+vAvgRNT
	6x2j4QbXn863OwqWRlEi4XV7S9MBJ0pigT7jd5yxgIT6p+XZNkn2YT6tVDZc3uj7MjMBB+F56sS
	1VOccD1+q0tq9L+qG7FyHNMMMGn9ayO9of8Z9Y00iygS+iozJT3CGJFBELpTpbBBL7iU3wc7RbJ
	JlNY12BJbw+v00zqOR79ujw8qpVbmfPBPS+U7t6lpYnXIkCX+iCf8gvOGkHMUc8sx5ueb+/Z1OF
	rZRHZQ8ou6XPfBvGH4G33J09aEkUoK2QsnaEfmS8k3lqtlS8QVoWIlydMUEa4x2fTAY54QWnzNx
	i7MJugu6vPStQas/YRpbQhsNlmq5On1pz+WvSVP/JB9onCk+pEXdxbsvLHAsC+0=
X-Received: by 2002:a05:600c:3b0e:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4bb8882508emr139998355e9.35.1795259491414;
        Sat, 21 Nov 2026 03:11:31 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm10697281f8f.40.2026.11.21.03.11.30
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 21 Nov 2026 03:11:31 -0800 (PST)
Date: Sat, 21 Nov 2026 12:11:29 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: erikhakan@gmail.com, bentiss@kernel.org, jikos@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: steelseries: Add support for Arctis 7 (2018)
Message-ID: <20261121121129.2a1d3013.michal.pecio@gmail.com>
In-Reply-To: <20260901203044.459972-1-erikhakan@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> The headset reports connection and battery status on HID interface
> 5. When the device is disconnected, ignore incoming battery
> reports as they will incorrectly report battery level 0.
>=20
> Clamp overreported battery values to 100% and add USB ID 1038:12ad
> to the driver's device tables.
>=20
> Signed-off-by: Erik H=C3=A5kansson <erikhakan@gmail.com>
> ---
> Information available online suggests that at least two other Arctis 7
> revisions (2017 and 2019) exist, with different device IDs.  Without
> access to those devices, their protocol compatibility cannot be
> verified, so this patch only adds support for the 2018 model.

Hi,

It seems that adding this ID here (or some other change?) has caused
regression on some hardware, reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=3D222298

URB status -75 is -EOVERFLOW: URB buffer too small for data returned
by the device or the device babbled (exceeded wMaxPacketSize).

Regards,
Michal
