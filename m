Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948594;
	b=B4SEV0giSDhO7GnPEL2MOg8UfujPs9ed2mVE2MKtSFtWmxEfMwXRsYtZaXHtkHldj4LN
	 lteI7tj7HuFx9ABmUpTs1ZJxyyzc2dPVCyDxYEBIGD9eKd+flfl9nNDytvml/CC5EMQlX
	 4GA3MgBQGGM0P5W+W/JXP6BaMgFl5wPHKcRVLXeRRWDcq5fHP3b19ykpVb7PQ4Ix2gk1C
	 hyGfNv2Hm7R2gbfcIG51eHOngUCMzTOSX7MDkpfUoOuzewO7T0ZNwTX+OX+gK5QizkA8k
	 BYKBwc0KPCf0hxh5W5hEuaIAbfEEo6tJE59rZ/Kxqi2MXLjHrfnNoLW3m2oC1MKHXcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CKcvaAq+qg8KxGmh6JcxNp/XvZlSd/D4jcbmaL+gnnU=;
	b=R94Su8eltIm35ud59K28zb3wqoQ1kufhuoXIkIEVd0rNs0cKh93HmC2HplynKIKd3kDL
	 o6GjdnFJGY9PGCguTIMwxAoR3GpyR10OdEd0njFJS6g/wXtcNs0ScEVvjwZgfUS18PZmH
	 U20vn0Ug9+6E8LMKniKcexRJq9/9rS+a+SXo3hfoO3j7KZlUseEvt2wN+CqnI7IJs1Mck
	 NkYTiNnPBQ0pVA+iBvQ9wn2D7ubfsWBKMliPnDPAgafbg9lOnEr6H8/m+2Heg2/q7piVA
	 7we3RuSZxjfEp4a5SS3LiRV7D0fLaVF/i8JNUcI54sT1cA9RkF9FpExHaKXHVy1lmuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8Cem4km;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6321606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6321606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8Cem4km
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so7737eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948593; x=1795553393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKcvaAq+qg8KxGmh6JcxNp/XvZlSd/D4jcbmaL+gnnU=;
        b=L8Cem4kmYuHusy5msUQWLAqRF5dfQXadzTcD4owreV8CgrXMHJEVYuKm6pMlmDu5q7
         9vgzQotO+bGKfZjuBiPM/mkyMHuQTIjYI3HhEhwsv2ZYPce1PmBU6a2OMxG4vgW7A1V8
         NSpCEEIaZgUFL9Vru4NHSeVFDQv/OY5z3rH5tUG5nNNqu8Ndxzy4UVx1d5foLLg8YsQW
         nk6zVOrxBEHUI32Jur3tuItF0bZhbOloX4yKg+FpfSga7SovmAzUV8T9/oiWW3pfDUCz
         A4/rdg5g7mJ1xbDuN6TcUsZZLO+UORhmG2aZcOXgx224+NVkgxJSaLVWAwXxoO6Zojxv
         QZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948593; x=1795553393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKcvaAq+qg8KxGmh6JcxNp/XvZlSd/D4jcbmaL+gnnU=;
        b=lLlvuc4OZ+HObf4yalTEawnjLiKdJkooESWSSgVm+JxuMHKgCx1fzSNPQ2wFNO9l/D
         i0RMEz8ufOqPzIJyKpbApoQ9uVtgRfKDz0yyjzud7uZL+8YFjUWtGhP1lIqX3LHn1DQN
         wj1licb1CTL7GhcBSJQrB0P91TowShCTGZ+iaNwOzH0XtPCyMeNPh+T1glJFvg6ZmmOq
         mKnth1vsi/QXgTilquCGTV0GBLKmXavJGP0QJd7AoK/Gj0okKkaPd8DpaDldlAbLo1+c
         kV9/7z4Mi/YrYDHmjsZFDVurMnjUpVLCXwfm4w1YUOpAunMm50bHc17DpMBNlOuonySk
         1dJQ==
X-Forwarded-Encrypted: i=1; AL+hErGi3/D+eG7qmcNW1xDurlfU/j3hktfFIStf0LRKjkJ1qufCwlTgNK8N38KJxbsYyUho5Foh1dCyrkFXlvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QK0AfmLkoqAd3py4ue7DrpZ74VWyv0W9r35dDohfys2MQ+cQ9
	6KZueVc7Px2tCsmN+rSR5Re/Daeevd2lv7RdAKZqq7zeGOS06SV7Edqr
X-Gm-Gg: AYBFou2xl0p1mgKsVrIryLBssmPz3prLF6IuIfTAF0wSxkqiWpMismGEvbEVPQ1UFuf
	QavViPBlSt3Skgia0yFpzHzLSOGVeSjgrc5NoqYVmexGAl6PXhEK3nX/WAua1RBQ4/HDV43XLye
	5MU15J2AXX/5Fh9lS0sjBBt+JgY1/+yOBv+b/mgp6Iyvt+d4ZBSDfYfBlZIhlm/M1STpVo18tjE
	FaaD5+7GnGvj/1jB0HahJKUG6atox9O57ctX2VJZ5bUd1kF1vrJl7qZhxgVOJlJmt+jXEQjsswR
	ISeYiAbiz7Gutt+x74QDzffi8UXMqlmNs4jPSBdmGOoz+68EHGY9RrnrOa6O2xXLq09Ht3dWABy
	rxArL1bbKVrcJzmk6iZ7xy5F5iLlOuaUcBFo6Vi3uimfB+JvI3hxJOP7OrX3k/HjhubtoFIivzb
	F17fEFnGzGCKRavfHOqkPWUFtXfxQaDxR/Ybe+eJv42k+oTFtAYH3yvl8rbVpJwW5BIHNipRFr0
	z6+8Di5whqWNbXSSIlkH6KslkpfekZGpQ5KjLrtb2o7/4bWlk1AS3Tlu7doG15mNntpaCWt1eBh
	/lc+i+4GCliAQREkpaTGCvemDsFfm0rJxIYoDJb4gSw36HAJyAXVuFtFsK0JK0e9Qu3lX17mqU/
	IkO4UWAPSTMDQMtDmMqf3vv6UZeMnjBE/aE2hHQ==
X-Received: by 2002:a05:701b:4348:b0:1b3:a22e:b74d with SMTP id a92af1059eb24-1b543d04c19mr547908c88.34.1794948592840;
        Tue, 17 Nov 2026 12:49:52 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm989029c88.11.2026.11.17.12.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:49:52 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH 0/2] media: iris: port two packet size checks from venus
Date: Tue, 17 Nov 2026 20:49:43 +0000
Message-ID: <20261117204946.21359-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

venus got two fixes in May 2025 for packets that the firmware sends
through the shared queues:

  49befc830daa ("media: venus: Add a check for packet size after reading from shared memory")
  06d6770ff0d8 ("media: venus: Fix OOB read due to missing payload bound check")

The iris gen1 code has the same logic and has neither of them.

Patch 1 makes sure that the size field of a packet did not change while
the packet was copied out of the shared queue. Patch 2 uses that size to
bound the walk over the properties of a sequence change event.

Hungyu Lin (2):
  media: iris: check the packet size after reading from shared memory
  media: iris: fix out-of-bounds read in gen1 sequence change event

 .../qcom/iris/iris_hfi_gen1_response.c        | 73 ++++++++++++++-----
 .../media/platform/qcom/iris/iris_hfi_queue.c |  2 +
 2 files changed, 56 insertions(+), 19 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

