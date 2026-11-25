Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620954;
	b=wnSn0f6h6oIbxE3Ghwwl8gV7XFNGWgXpbTb7ICAMR/qUrV25I7auVTuqi5/V4l24Z/jf
	 np0Q82g5SBrVnh5A85xab8jn/2m9Fptu5n2VF33pNA/l13LOdTDfnljNJc9xGiRFJtN/n
	 O1rGRd7GuOBjRR+SngF/6gViXJAxnfqV+GsNjCKjgXxNsgI8rggxGt/dmzfZs8MsdmMLr
	 PHVl5vIch0gMtcNgbf7MoXk4HmlzR9uHjABxEd3q3ZBMV4ow1AV+TUhSfQ8vfjWRQm46I
	 36yupP3++1Np3yh7VaxB9JxUfjyNNeIV40Tl+qa8GBxOXBXOVtOWZT50qXPWr9APY9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=zW5K52MSqR13vjMOGRw7WSmYMI0ONd2XOyiatd+7KVc=;
	b=Z5q2OF3mW17Ao44MQUcP62XQnSjY0O1FTMuTnnP2H1c5+Ypt/h5QsPiNJFGJDZ8zp0y/
	 84DDIDSe8O8qMwUts3jWu60C70eHRfOKo1/6am8EfsD7XQGipiVM+IQ43Dzi+4wy+46/F
	 0Qn9JpMRILApWHY7F2g0TyUmE0plmxxDqP7FT8cpWem2JKmAn/UinjbaONNfDPfmxQQ5e
	 +30SYdY8Eyzpts7f0INbmMX79QaEMvLAz8GfFB4JtoWRIyEzvfhLwFQwwbKr4tpImKBb0
	 pbysrqV+GZaKaI1Pbw+qwC8XwiGL/SzHtpjMv+YdXvORtYAMGVkKeNXuCc9fLqyg9ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=lWFrForJ;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCA960A2604
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCCA960A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=lWFrForJ
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4aa5833c263so5708511f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1795620948; x=1796225748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zW5K52MSqR13vjMOGRw7WSmYMI0ONd2XOyiatd+7KVc=;
        b=lWFrForJqT7zOrmjI34bqPJSqTHNMyN/22Z0Uwzi6TGnnWYFmLAEaFB3BAm3W/LuLo
         xUrUv9rG0AKytxLHhYYf3h8wvi3OAFbRxgABdukzShaCQ2v2dFE+u29vyjS/2bSeBWU8
         tf291Ha0kj3NO0gmHsF1x71k/mzX1TIlGRNr/97o9HRrxReM1N4J2mT1t3m8LmTcPsLc
         BQuFiYmRtJ9zmkZRTXvWHgi1SjhjC39kV7pQhSY26r1r48JHyyOfHFJf+8I046conMZZ
         iRQtTHmF6WZFsbaRNFcClyFprfVKj95scia3KJlE7x2v7jisPYcQL4RY2jpZa859232T
         8ovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620948; x=1796225748;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zW5K52MSqR13vjMOGRw7WSmYMI0ONd2XOyiatd+7KVc=;
        b=D7MjYGpAedfde8cAb10EHNUGkTiUnnuiBmGAeYkUKU20DCu0ZkUPRzwPKX85uxF7AU
         X4qLTKEnroiw+JMDnyV4h//KHXufCkbNMoeojuORiuSt/tbsMsdwg22NkIUyosupjHlq
         DkQTHGtna3KNQ2vpZiTGLHVj9aVNoVfDaR3V14wSPoUm1mTBCfgQHlz0Y/WDx3vLImQ0
         X0kAy7Gcovj1Tnlanb+qLdu4TSOlawDogpSPYnKn0pTTm2TboCdZrEDyBChcN9xXnNPc
         b4xFNaQep/bMk9EL8pbc/7QAPLNr2CaBnaRHZEkr0hQHRysccBwWTnuQBBemJKAlX5JS
         xDyw==
X-Forwarded-Encrypted: i=1; AL+hErHptgA1cQWuxJy5tSC1qcAoOlpSG+XcRaru8lAeVHE6rpor7pji2S6+I6iHzblDTz7O1v5jiKhUwmEirCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wBFqRZMJRNTQEL4mkG66zDKk90RKhlfdKl74b6p2ALWGpPu9J
	gzt72v6QK6oHFktDe4OcqYYxui9xDmyUpxA5v229cI68LIeB5cw3Yg7EKZA8uqpgjKg=
X-Gm-Gg: AZFdTZetrMRKTzFiahF/Kl5uxrg4q2btOqSgU3IpupuZHghsoBI+BGLU3l8X/h54gaX
	l8eSSgcOOrbKfFZSgeg0ulkGa/d4sz8CXCSbRcC/jU1FRyhHLFokp+iEaeRsTapwcOOVYBuvDx+
	Ay7BzrVLY3wwr48QmkJyIXWFpoLira2tpyS01iLXD5uR0p1zgt7Yj5ayvpHI2zMzn+wXVBSIDvf
	s+1cdK5N2M+xHaURq6iJOd40knKAUrEvx5DXoSxlB9UCp3VSxgFgk/yUEWrjGJTa1OvhwBWsaks
	T+rbzMB0Y4MEuPvgu8sYSEjROPp+RIElgWkFTJG28Om+qkXrQmvGdmM32x9V1+Lw4EYVhIZxHq8
	p4PCA+7IsJ4rWk1wisKpXw1viUqpjBqu+/gRmlx65ZNZLjN7Wr3Pz2X88BOWoTkgD7Y4zJQIop1
	fh67Crw55wk9VhiZbieBTg29/dCyLzjjqR49ZKrWs108gt+maGzVD0veSOplPRZ7SV/w1dpdKV+
	B+EGTZowTvpw16X3ongFS6DpiONuUkNb63ybYFeYudxH/6OM62BCXK6U0CynaAkbSOwxHhgvQ4L
	Zg7FfagU+MAKHFRkJ2SaQTdwRii8zJs0Vw47gbWmFk3Vqtbf7Ofa9m+08B48/9Fp2ikjacUH4Q=
	=
X-Received: by 2002:a05:6000:1a86:b0:4ad:d65:aaf9 with SMTP id ffacd0b85a97d-4ad0d65afa1mr37658772f8f.56.1795620948143;
        Wed, 25 Nov 2026 07:35:48 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm35816275f8f.3.2026.11.25.07.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:35:47 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH v4 21/21] drbd: remove BROKEN for DRBD
Date: Wed, 25 Nov 2026 16:35:11 +0100
Message-ID: <20261125153511.3060599-22-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261125153511.3060599-1-christoph.boehmwalder@linbit.com>
References: <20261125153511.3060599-1-christoph.boehmwalder@linbit.com>
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

Remove the BROKEN dependency now that the DRBD 9 rework is complete
and the driver compiles cleanly again.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
index 713ac6c9f9f1..058a30efd6d0 100644
--- a/drivers/block/drbd/Kconfig
+++ b/drivers/block/drbd/Kconfig
@@ -8,7 +8,6 @@ comment "DRBD disabled because PROC_FS or INET not selected"
 
 config BLK_DEV_DRBD
 	tristate "DRBD Distributed Replicated Block Device support"
-	depends on BROKEN
 	depends on PROC_FS && INET
 	select LRU_CACHE
 	select CRC32
-- 
2.56.0

