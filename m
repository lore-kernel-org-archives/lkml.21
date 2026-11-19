Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087134;
	b=uXEvmXYAA0eKyfDqz87a7jgAKiIDO4SiSau9gp8LelK+KrrJ4P13NcbKQcp5uO217RDG
	 UM54BccCZX0X1cHOjO7GlVcZ1UmtK+AQEObbswRSHNYw1kznJq0ujYceJGifYu8A6GZ4Q
	 /9EfnxkzeQThF/eoPuSHtCbOoquAbbiuOBzo6Pc0X5yAiC5dVnkNj34RUdJ01+fI/5FP+
	 oWWs+z7mVJ3KeftHiq0gZbXc4cdXkyG+EKvP42PiT+yiLD3lp+5GjFoQCAXpaeDF1PFfw
	 GDnbEgZV0P9KT/ZCjWFNj9BUVmUQW+wUQ5ZV94hoqRh4Sl2viWKJSsKrzNurK9OqqLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=VsZrgdffbixcAT0MIaZMhRKdxCgLgvf8zPgL2cWZJCE=;
	b=IElVs8f96yzCR2cbimvP+WtidBW/SFxXDnhzg13b0joOGPOxdsFd16lDbCWiaFYfFSqD
	 8NZuPR8kOJPd2r9j5c5MtallIuBH045dGvRdwIbT8qTb8/jivcPlXaI/WC7i9mzLewLo9
	 sUStsiVGM5AHDA01ixL2Xt9GXKRf1CK/6Mp5SUnu8ATTIkZact+gdI0kOIqaxefOqSTOs
	 ToMpgpVVWEzq+/rypUH2Qw/77pCNAA51n0AgDAqO+id6Cim9ZEte70Nwwg3l7Gad+Ku9Q
	 XIPM275VNfM7e4n/4cyZr3j8Iw/6whpYgs2QsExe2JW9bI60bZcTvfWjXB75P0orIwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RZAKj0bx;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0F3606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F0F3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RZAKj0bx
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so3234627c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795087133; x=1795691933; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VsZrgdffbixcAT0MIaZMhRKdxCgLgvf8zPgL2cWZJCE=;
        b=RZAKj0bxf0CrF217tp1LKG+Lxu12j7zQpriuF9ur47j4muc2dOYQ7cdUddH0ojuKLe
         Z9cLZHuamo/UPTvs7jeF8UMUp4XqQmyoy0DNfWtekeOGVTkokUbrt4bKQCQe7vdzu2Xd
         MJ/iRnLXhG7h9m2W72AEGEmFuGd99HSNnZHpyiIIinLi0R4VLgnaIrUPv6629/5jvDPz
         JexdQ3Mu+6GoR3zvtvP4cncf2RoJUmxkTo7tNNuWvZtNODJ3U0pEGXJZKXfA4qO+5ju0
         k/9tumhFOYydwZLHi3vVtXL769Fvpdinz3287zwfrUAFDTLBgYBBHox+6TgLcZ/uo9Lz
         hc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087133; x=1795691933;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsZrgdffbixcAT0MIaZMhRKdxCgLgvf8zPgL2cWZJCE=;
        b=GkzVR2ofpLh4y7vBPWvv0MTzv7mXcOYHSAvrHvxUzMDejvaLwddCX9UXTZIn5A+Ble
         djnSHqAKpkiUCV60+e+51zdoH8WNNtGkBmnPcfBeHJxS74LNg9xa5SClFVvO4lzasCho
         +Jhr1FnoL9Fa6FGIgl2UD7uUvYDqzKakPJWDFGiom6Hx36P2/wETEyb+VP7yBDwCmg+G
         P6HwyEiH1YsRGX9PEqNgTKvXr57r7aOsm3q+UcU2Ff9cdXH2WNqwEZHQzTZ9cfDEJCbb
         8YfKSpDdXq0w0BvprE/ASP63E3QzjcU5eilZkLs72cO2RGyCnPSPD3JYWD/XnLB/90Ah
         /svg==
X-Forwarded-Encrypted: i=1; AL+hErGThbJk02Txky3ASa8WgEp0iLl4QBQtYJ1X+wfwsSKwEGxXEGEIv6Xufx+znFcX8ybK+I1C1ZdxTk+WncA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M65JuJvLFhG/mnCQixtY22VMQPuWSesf685+QAs6mqIlGP6W5
	U4MBKElcEPZs0RnseldTh0Gi/4eJUhNr1T+uhEj1Uovh5slmIvOwbP0T
X-Gm-Gg: AYBFou1qFzCe10c7sOaYuQzdo6RgKhojC1Pme09dsmNnD/LTESXSSjEBZY84Cd2FOJS
	zni9aIs4nNurPKQ1dKCtf2QGKQrWkocnTufFfxvY4sjqNmgxBYt0GiEYO3OIadH2z3qH34iII9F
	b8BAHX1DtXKR00HLzDVgHvKAuDUjyi44luaSiBtUidDl8eeHGe0wioYHrhNqszge2ndIJHnT666
	ZG28pWPjDGQq6QIJte63raw2B/txAyUuydv6GDOg83qxC21B4RHVs6zFxuEDjTXPlJcVf9fxtbD
	aM0G163xc+sBWrBhUrFxxG2Fo5YXiecQ9jW74OhMh2b9sCdSVGniQ1OfWy/eK33E8Bezkmq2pVX
	5QcDf3QChgQHtSw80sOIsE3JZ4wqOSegtg/qGgHCUlBSir2RdaK3MkdYdWvIdgsD8w+SNH+6mLb
	aXog1EBwtbYOKsYyiTsgBNk/Jk/ARMV/vLZoxLOTIQphJPL1uT8OgvdTrp3H4flwsCSrySIixKt
	2NIBKO8PVF0ltCrr43sJwtKZQpVMudbNzyplEjtbob/M5JoyQ6f2L499E5kUayKCbC+Pw3SD+nn
	E2AMSyc7qiPGMVqCnj2mM8diYxfx5W1wkdtZyn3OL3LLdOR/9n5X4Iwtrluqnk2z+a24f+fRPMj
	eew9UL65Ku8cabYjH5AeBnHMep2WRElYKHQzHTFGfNvD8eg==
X-Received: by 2002:a05:7022:7e83:b0:1b2:60ab:1e9d with SMTP id a92af1059eb24-1b543c3fb96mr6183656c88.37.1795087133021;
        Thu, 19 Nov 2026 03:18:53 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm20583004c88.11.2026.11.19.03.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:18:52 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] drm/msm: release the cursor flip work before
 the KMS is torn down
Date: Thu, 19 Nov 2026 19:18:47 +0800
Message-ID: <179508712793.3615754.817569571407027777@gmail.com>
In-Reply-To: <sashiko-outbox-222715@kernel.org>
References: <20261119023604.1495603-1-shunsheng1218@gmail.com>
 <20261119083133.3437277-1-shunsheng1218@gmail.com>
 <sashiko-outbox-222715@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

thanks for the review.  You are right, and the check is redundant in the
current mdp4 code: mdp4_destroy() dereferences mdp4_kms->dev at the top,
before the new guard.

The guard only protects the CRTC traversal this patch adds, and the v2
commit message says that it does not make mdp4_destroy() safe for every
partial-initialization state.  The existing problem belongs to the separate
KMS initialization error-handling series ("drm/msm: fix the error handling
of the KMS init"), which was not merged in the msm-next baseline used for
this RFC.

I would prefer to keep this change focused on the cursor flip-work
lifetime; if the check is more noise than it is worth, I can drop it in a
follow-up revision.

Thanks,
Yaohan
