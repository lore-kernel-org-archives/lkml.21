Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186800;
	b=OfMhCj+drMm/0kUSXXRFKyqOTuyZyCmv/EdDQQ/VGlxoz/IWzP1rbsB2GGai1R4fts9N
	 WKBSw7SOxrJcco3q7BmWkkoQz6hduRWjcbjXL2szCq+8NesBRQ3VRwEnuDbZ2SvEyyHca
	 dsiu/hP7l2fYtYTnbtQkN3Mlzj+fPgLhwkRPnAEU8c03rZ9Jnm2gb7lYmYaSX81tsB8U7
	 VsLOW+VR2WxD8q2ixaT1W9sto8EqSiQUvhQxYH5wleVIEfT0dkt8tkAYJc4MmWRnfHDER
	 cCgb4m7HIXYlOIAB8R54eEScBdZkZiraOCwQoh0csKAn3+9sAfhnl3aCNTO7UP9amSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3+f9Iofbt9YZyUypCVZ6RFlr9irdHyVfSoYR3Rdd4iQ=;
	b=mI8Oe6/tVwA0Hr24uzK0Ax61uvUr5TxgpXLcrR8XgZEqRyLLGocXyKKE1qt7puSJqSox
	 Oelmk1Ei29x/3ZJkE0HZ9YsGiIg+1hWnav/m8lfz7sJoFfjpHFgeEXza3v+FdkNkhaGKv
	 uevDBzNdTYeslk2xslGLMKNKfwDEiQHYMHH+HcBeOKY+0qypaO+J7fL+5Ony1wTB4b7X4
	 ThtEcDS7tz8iFeeGOo5VgCi6Nfd5e3KmXbw3kVJerXE1ky1CvWNbwQNnnzFQhfXPcc/FF
	 1Pm3BFhGUxLaRtzvMxCZClHpDVY+ppPzlpY7zP7btGrsf3ZYVm3MgmdawbadWBp77Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rFPzvjoW;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66AB60A3831
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B66AB60A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rFPzvjoW
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so576748a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186799; x=1795791599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3+f9Iofbt9YZyUypCVZ6RFlr9irdHyVfSoYR3Rdd4iQ=;
        b=rFPzvjoWgEvgp82ZI7gF8a6ocv/SWxZUewMOgJqKRlwedKjOK3wL1McP1H+7YBy93C
         owhen8LODMg8gWET2tNCwIhq3J23Adp1NUaq0FbWKHxmw0ADnQ1fNiY/P9UPXbdCaN5r
         xK3TRIiDNNwgvF+HZIw9r0wE0pXJLkkfkQMWAnN77ztTunwyabTq5U0Upt+O5MTFukKV
         lJGHSpO2e0vqLpttOazx2VDBvjkqIpd23BUiy8LKTAq3/bcAW5r3M8B3CY8o/mjsLsMy
         KldXsmEIBNDURHeRwJsWvqaZU2V9EFVq3PVqwSyI5h1o3UUyNr51iTbxEhKo5RGZ/HoU
         GZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186799; x=1795791599;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+f9Iofbt9YZyUypCVZ6RFlr9irdHyVfSoYR3Rdd4iQ=;
        b=fnjKlAGARNKrvSCwiCXU494r82ZszTXBOYSunpMqsqQuJUaKrNR3OarMvAIPDGHpIp
         AtCZKWB/dt28rr7cMiAMhmq6cG0PxUo3pgo3pLSh8jED4BUsn5x5p1lzvs8Q7jEj2Zwb
         937QWIOZJZ6A61mkJTB7CXdGpAXpfVzhyzD1BBe+/CeLd3nOIxy7VydLbVUnQK5Q2e1V
         6ALeoZxy8ouJ20vug7eO6/7xwmUt8w/AoCYZSKDwn0Jyx2VWU/13NvmXP+SWJsxq9107
         qN7EBeXzGXiZVnDecXmDGlaKWzHcUSSoe4nIATlBgnLjPyxPUkOf32pFO2vq5139TjeB
         QZsw==
X-Forwarded-Encrypted: i=1; AL+hErGCW5+LPPpzJKe5DHvte+Jp6cX92qydZI6r72kudDNkckaoAmt6jrNKxvPX/FAiRFkRVZUrAP7P6kIJYa4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z9L3aCILbSN6+4ZMJDNjYQ9R5g+zx/uuXdiApJYMZDUEa6JI2
	KHNyvjkeB3S5G9RuCifJP2nhrOO8cCv64ybxEaNlNOzpIiJjfBoKkAeDb/OIHUKOBPI=
X-Gm-Gg: AZFdTZegU3AbBdE4Fg3iWi2OU8HYXAbYqHIB6JWi+oIsegrMx82sRwgb2G8h5QeaGcC
	il4KmpjZ1dmS4aoFw4XMi/D76tG3Y7fJNJyYS1fSTgAkbrXoAVqko7mn/9Fn8VYQzfuhS9QUdFz
	tyVE0uSNVYUf92vfLCPwUoQaRPURwD+mBk3MJ0WRKW4Dl/9Rauy2kiNfGRn7Uh6d7qteCT1t3NK
	F4xD5CE/WB7Si0F/HuOBCW42O5uv7tDMD69CPcgh+y6xs/EEy3QCKa75M896KIq0UZlB8JFuTRr
	Iem/CUVQJfkUJZ6RBIxSE1y9ZHm5aNkZskkLqc7nKRKNlUfISff8f3NNaGqVOVWX8bVug8tmDDy
	UwJVopBp2EQi9KEl6YUfvvH1QLY4jz4t1cgFmXALE/t/m0m4F6j7Hf6WTuwKxr0VPgOxN2Nmuai
	CY/Dw3D1j0goBIjBRNpik2mMMdfHwFzh+7OglLkZEm0DMphVWqycYzZBaAJHw7PIp4O02oGsx0v
	6EEQPf9O3XHoGnHdHm/7FfYut1zHWxxlMUeQ/9ZW11cEhJh7qZzygDKL8jtwAtGaPRNormbEd1E
	t2l12ehBNnEgkTzSympYfCXSeDm5beFzemzPRaCTjad9uQ5oWPVgfhcFo+TOr+3y3tKJmglvh1i
	EXHNdfKOqvjZteB6kT3vEfVuaCaQLQ/afrKCg
X-Received: by 2002:a17:90a:e70c:b0:3ac:aa8d:19ee with SMTP id 98e67ed59e1d1-3b41cafd533mr3117737a91.38.1795186799140;
        Fri, 20 Nov 2026 06:59:59 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm7782207a91.15.2026.11.20.06.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:59:58 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: aacraid@microsemi.com
Cc: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] scsi: aacraid: bound adapter-declared sense lengths
Date: Fri, 20 Nov 2026 23:59:54 +0900
Message-ID: <20261120145954.3127991-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013140214.3156938-1-yhlee@isslab.korea.ac.kr>
References: <20261013140214.3156938-1-yhlee@isslab.korea.ac.kr>
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
Content-Transfer-Encoding: 8bit

On Tue, Oct 13, 2026 at 11:02:12PM +0900, Yehyeong Lee wrote:
> Two spots in aacraid size a sense-data copy by the destination buffer
> (SCSI_SENSE_BUFFERSIZE) rather than the source array, so an adapter that
> over-reports its sense length makes the copy read past the source and
> hand the trailing bytes -- the previous request's scatter-gather list
> in the shared FIB area -- to user space.  Bound each copy at the source
> array size, as the container sense paths already do.

This is superseded by v2:
  https://lore.kernel.org/all/20261013150420.3168223-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
