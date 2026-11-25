Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625738;
	b=r/ahceIxwo0BQWWYTssZE6EThO6nxca2wCdeSe1QCItIVyVkOOviznOSjeuVtINezRt6
	 mLw9PAdDuB5cuucS7RKmgDKCDxq7LfCA3KX88mrN4W5MjGHVtRdP5jG2oK1ycBdgA08ii
	 kViR4EF4mxVgB3pabv5ZUX6/KgCBoZ5B+UjkPrUJKTi7PlAm/h/pXpliKU1SsVQPyNx7d
	 1bNVTl7Sgqbzxe06EsQ20V/nvBXRiXv2dGkNuQHAXXOTUNh5CGf9DHczbY+7mdt9oG6Sd
	 PxmQOFiQsyRi2ea7iiZ38AwvI+LCfAQYRhc98Qiv/reFtG1vxbY2DiCBvVV3X+x0ZwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=goarNsMw8D+0LhqujliNSUI/mWsh1zXl6e7mtQjxHRY=;
	b=DbGv1GF3CsIfUqgiXAW7VBZ/pQG7it3n1hPBOrvaZlwZZsnqgHnYAwTnrwGUJSZ24BLk
	 NdPPS0WyEyWSwpnquQq08cq6YnbVGfOt+UTQlZUfXkKbuC8D2ygOUAHHQHTI84YOyQFmF
	 6s47Pmo9PWc/ctBlYY9BsF1JRwvzK8gMEWLhwqTROjGSYL27qxhQtP7eYGzFGDL+bF1mh
	 vRX7DWDFXd/z8ma9Rg9UuZM+h8flKPXsNr8R+ITahpYeugXfz/DcoBiNMN3B2qCrto8fh
	 5BROkGTNyZUcWipMQcYkqafNfzDnSc/jLnBgNuknP0nGhrPSTy6c/mYY+nKDnxv4hzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Own/O6it";
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3057E606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3057E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Own/O6it
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b531cd9bbaso51098047b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625737; x=1796230537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=goarNsMw8D+0LhqujliNSUI/mWsh1zXl6e7mtQjxHRY=;
        b=Own/O6itpRKIbkgxdVswMryxBFXNME3TN0kTSKDTLe5Qo+f9fVwNjNJGGuG5MNBozR
         Pvv1T2No61gs2TOeuKs1lTwvXH6DOsvUlyNGCR+7DCMbqenZXLJf1VfxiDVKQnzAzRoK
         QFlIqPz6oXuquEyRia/YN2mvhYRM4ewHl4VkAr7FJizKI8Y47DFq6ZZVaYkSMCLRdPX8
         SUCA/yAl+DD6ifMSkn/8LCZgj/V+MmWn0oqumoHQHfpcNQvx3bvbZnFB3XciyJh2aXGZ
         ckBXi/ynsY03FBY7uyIZtM1Z/Db1sEMdmq0JnhyTFtgb+pujxnT5Uq+eGdR+h+D5eXHi
         xnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625737; x=1796230537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goarNsMw8D+0LhqujliNSUI/mWsh1zXl6e7mtQjxHRY=;
        b=VOqndKa8dM6qL1kze/qFdm1yOscp/IfjSolT7w/yVvJu3NijPDgkJTwpqz7T/SgaiO
         c5W2seV4LS9bImOdfHjbgTXW2vaMFzEZh+agoJbzkJIwj8rXijMGxs2gsOrvCD96d16m
         poFrQV63+nr/LWaqWx/ZqiDmjIutongjKzvO9y2Vili3cx6jOVOnZxDMwXh0rxFM5g+p
         W17zyhJ4L7VsdcShNIUwhlAoUQvb1yhWiilIiM3oOE9vJHRDiW/nT8qLnB3VEXutkrh0
         MwQy2q25H3CIpxXDfj23E7vrgTVYqQ9gtphjuOoTZ8jU52cqQ0k6q+ajWfP64/RSbwsa
         5DOA==
X-Gm-Message-State: APuU4Z8GoIGDTzvs1S/KzWcGcY0ocrxGFNR2V8iYwz7u99+4aq6aSus+
	M5+M9U/V51FPl0oH2g3EEtlTmy3BG5Qnl4aYncWw73CvdxCid2mC6o2zqVsgu5g=
X-Gm-Gg: AZFdTZfNkaeL3yrVAUYd1DxbcbMKNsYfG980WAsgARVsMLiLCprVdxGIUE1NT9eSzyM
	AFzHFrESiAPms8Yp9D9QTL46TFr02t3swIUFXnjnsRZOtLIpqCn71YuS20W+PdhCizclZRcJZGK
	3gT78NkLWc8YWZ1tqwHF4rUfnuO69o4fo64gD0kq/9IvEGAwWPuhNjR3dAF6otxwdrZjAdtg5/F
	hMPdZ//aAcTYHZMOnH1kV0X+r7wEeQg4qWmCQ6CL8s5tkE4g20yR33IbCk0gXzE+Rx6XH10upBF
	Q68K0KWhB2bmvV6POkPQrefLCF8ySqZ6ZEVy0F2sMmsK8qDjxVN4YOxJRybp00KHj0jAk6+SojL
	t4F4m1iNzJckT3i32hRKLCAGFNNSSSEWUNvwL3udrGuCUVES6C85cDv6w4TWleMMsa9vWGm8rVz
	a+9ZOMkTxv8x6eFD2Gha1E2DLBT8GdgFf+mRF1j5jixMkPgUiI0t89s4drUtsnux34KvWekavTE
	qjjtiffnIIDXhm3guuhSOEO3wyjJV/jDsL1dDrK7S9YhfUerVKjhjB2tba6eUVmN1gK425xSqpU
	JFYuXlCm/4I3mA==
X-Received: by 2002:a05:690c:9b0b:b0:8b0:702f:2a69 with SMTP id 00721157ae682-8b520500588mr100147317b3.39.1795625737162;
        Wed, 25 Nov 2026 08:55:37 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bf474sm74766167b3.21.2026.11.25.08.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:55:36 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] MAINTAINERS: Fix alphabetical ordering of several entries
Date: Wed, 25 Nov 2026 10:55:27 -0600
Message-ID: <20261125165536.792563-1-svav2021@gmail.com>
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

The MAINTAINERS file asks for entries to be sorted alphabetically by
title. Several entries have drifted from their sorted position. This
series moves some that are very out of place.

Each patch moves exactly one entry and has no functional change. Found
with a small script that reports entries outside the longest correctly
ordered run of titles.

Arav Verma (9):
  MAINTAINERS: Move LPC32XX DMAMUX SUPPORT entry to sorted position
  MAINTAINERS: Move RDMA (INFINIBAND) SUBSYSTEM entry to sorted position
  MAINTAINERS: Move SENARYTECH AUDIO CODEC DRIVER entry to sorted
    position
  MAINTAINERS: Move INTEL CRPS COMMON REDUNDANT PSU DRIVER entry to
    sorted position
  MAINTAINERS: Move DELAY, SLEEP, TIMEKEEPING, TIMERS [RUST] entry to
    sorted position
  MAINTAINERS: Move TASK DELAY MONITORING TOOLS entry to sorted position
  MAINTAINERS: Move GPU BUDDY ALLOCATOR entry to sorted position
  MAINTAINERS: Move MAX77705 HARDWARE MONITORING DRIVER entry to sorted
    position
  MAINTAINERS: Move CORE DRIVER FOR NVIDIA GPUS [RUST] entry to sorted
    position

 MAINTAINERS | 216 ++++++++++++++++++++++++++--------------------------
 1 file changed, 108 insertions(+), 108 deletions(-)

-- 
2.47.3

