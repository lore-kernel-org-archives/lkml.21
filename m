Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630498;
	b=eEQKCO1dzjuF4kmS5bhLXvB7mIpeBymV1FSeQ77h3zvSEkXYc9KOD6xl4gxzpyg2mZWa
	 Qp4epf+acJpzVUIdikXpxWAbyPV6fBOKNSK+BIRQ6cT1meWefPTspK3SLA6wAJHsxa7ss
	 iU8NCu+Er2R2yt2uStaM5PTp6SzHzXwtkzMFhMpFkWTEGZ3nkjMlu8X2EMINfkHuuvS1d
	 Ov1YHWcKRQjBNfvps8KXbkNlcr8oU4E+71PMA2boAqIjWTEaaSa1j0gWsVnAfgJeSwCIU
	 GmRfwy2QDrUznVZ/pAYBGw+H/vAqYSXR05c7EGukMzCM6U5FSww/Vfb5kH8annuswmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VtvIgmARk0ylTz1Vb55Uz9jsAfEsRaDu6ZRMFkPArig=;
	b=k7k5L1QCjNrEkh5CzgiIhVeA/ZchGgZqUVjNaEWc8qKbXzNGfeLBvifijM8lM7tjl63T
	 dOqyeLTipE3ipCNP0p5CT1zTK0z1MN7AEX0JMmVUjhAKshdAy3TNtjR78mQYOGCSWL52H
	 //BVEbegr+C3rxRCWecgPeeBbmF0fWrIX8eVWYyFBitTbeJxzUpLjw5QXDFCc0w6+TA1y
	 px0T8X6TTeG2lvMB735kC2WdB+cB0NIH36PpfgT6T523gkmyyY+4okfb8ZALmaGHxtbzl
	 Z3dv4ePcv50si+MZzok6gUeAHzgVzEHYaJD7QPd+GQ8IVM2s2O5ldhc7SdPMOr8Qp6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GkRxM0I3;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C5E606A686
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C5E606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GkRxM0I3
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4fb5d96b3so95044097b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795630495; x=1796235295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VtvIgmARk0ylTz1Vb55Uz9jsAfEsRaDu6ZRMFkPArig=;
        b=GkRxM0I3I9rw9mLuQwX/dgq1if9czrDya769L7oT8W7BXPcs6ii0XDH+75MEXs9q75
         9laMkh98+PVzu7I8zowc0qlg1rh+e+5kRkZsR8kOxQRgYjWDbn3DQuikB/DpDkqxZX3m
         hcKTMgHq2SxoCgrCl1r8B5p5I/aOM7hjR2xkU9YVSuoU2lu08e5FgFmsLYpNkp0XBvz1
         SrVDiKbu/CFB+dXKsYh9nJbMKZy7ngbjxR1M6HiHQ7gz8OHG1NIlTjVWujmI+lE5mNgv
         A4RRvaLxog6eQ+YwYTSyjW1T6Ul5YW7CCSBhAZRhjQpLNFgXXflxTCfgTQh/eQqBMTRX
         lpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630495; x=1796235295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtvIgmARk0ylTz1Vb55Uz9jsAfEsRaDu6ZRMFkPArig=;
        b=z0PukO+Xye8E2RgYMAbwJ1AwNwZqTRPl9XM0AzWIlnNxQ0ZKWUAh1q0gs+Rapt8xuF
         59XYVWihoFXUZo7nF/62RIidj25s3VhQtwRU9OxXoMJiLYhYB1wFityDq4JeW7d1kpyL
         Mg5gFaQcIj9icemk7RSHub48vvhJNKnAgoe+tFa5Nt+PhIBLT6G6i6nedudswGMPWK7C
         ZHsV2co4r/aS6ujMdxHUg9xLZKK8vEZsjtLnV8ycjkHtjsRSnG50WsSPY3xP3jw+5cfD
         f7cxXp2Vv+7t6cUlTgNb3fIR3wHxsTJVu4/OGzKsJWPTD0Yx/8xU5IZG+d2TJH0ehm1W
         fdSg==
X-Forwarded-Encrypted: i=1; AL+hErFk2GYBlglwfDfk7mkeEdapDzmS4NNpdkGto+ayUv9cNNnwIosxllSa2YXoYf29xNNt7JV+c+P3MBF3WjY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cWtm0LCJt/NeK5sMUtMv3UV8odE/AjlXKlotv96ABK0stZiw/
	91pqkOAXGqg3NslM04Sf2Hrtn8Zw3GDKWCNSdeROVL+jhaev6P23jiw=
X-Gm-Gg: AZFdTZe282jm4dwzNDGQojH7qyrf4skjtNICdJDjjj56ORe8xnCwSfaOIlAYAaK0RFN
	P9rJacUQ5rlf6g39JIxxO6FzCmQh0Dmrf8JTl0nP5zIjWSw+qZ8kXTBvHej1UlWh2sEaZ+2EAHI
	eKwLvunHauYYUMWvIqPe5P3ZvsTbsTsEoIzz24ldRWS3Q5xolK+3ALRGGKgK5BhvupJf/DkLVxb
	EKft+ojgmY9N/HjTnRfbvBucD8mYEhlOJFh77Aw6xtPwhe2/g+m7cW7OU8+Yj6jXUBFgGS4rAdU
	QFAH8tv69wKF19y/RX9eUb0zT+zHM+QGg+2SmDIhBEzWu6XScGQVdyaen9rZdoU70X1OplPt0Qs
	7qrzD8p9rdlc7mAyojnIT4DpvRx5DuWk4ETQp/EEXy4SYki5LfGj+FKLNdcfzy1lqV21MNBFBKR
	WW4kWhTxoDTGuow1/l+CEKmVE0tQ1m64N9UyATo2uSirLw1qzeM4/CS72uXHfyl3cYJmh8jfFif
	61bgkBWjU3MXYqKxB3SPcketBWVGSWfJSBY29wLC2K80v7YwnyRI4mOPtGc4mo/3wx4n1FLPN8t
	xgCuHv8/+LP7pnyB8u4BXL65pI4GknHVh/s=
X-Received: by 2002:a05:690c:38b:b0:8b4:f6be:d2b7 with SMTP id 00721157ae682-8b518e8aa37mr74974367b3.6.1795630494808;
        Wed, 25 Nov 2026 10:14:54 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201b8cdbsm74546187b3.1.2026.11.25.10.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:14:54 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/3] tools/nolibc: fix standard conformance of a few string functions
Date: Wed, 25 Nov 2026 12:14:50 -0600
Message-ID: <20261125181453.814976-1-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
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

A few nolibc functions deviate from the C standard in corner cases:
strchr()/strrchr() do not find the terminating NUL, strstr() returns
NULL for an empty needle, and atoi()/atol() do not skip leading
whitespace or accept a '+' sign.

Fix them and add test cases. The new tests fail without the fixes. The
results were also compared against glibc.

Arav Verma (3):
  tools/nolibc: fix strchr() and strrchr() for the NUL terminator
  tools/nolibc: fix strstr() with an empty needle
  tools/nolibc: make atoi() and atol() skip whitespace and accept '+'

 tools/include/nolibc/stdlib.h                |  5 +++++
 tools/include/nolibc/string.h                | 12 +++++-------
 tools/testing/selftests/nolibc/nolibc-test.c |  9 +++++++++
 3 files changed, 19 insertions(+), 7 deletions(-)

-- 
2.47.3

