Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100714;
	b=3TWg4E5shn4z9z0bqb8c90Huc5ZvYuEgrIZIVDxqtcr8JR5f0sHAibYTgYHsV8d1PwhF
	 BXx34YrFRdGOb7nUFD6PV7F+pk2g1/xv5sg9+aPh+R7RIZ1ZcjkKrrnKMLsaRRDgvLspc
	 nRUkkbJve3Vempuim2lIojnyVa1nzlGQx5d+eNU0YCiP9QpoatN1ZdLhB0Xxfjy1r3+pI
	 xWHmU4cSY1+7tgwrDgN1Jlc6KtGJ2h7XSt8qOgyfDNaslG9dQLT91Lkf8WzKdKGNNtk34
	 rPql0XbKZEUW4VQaLLKO/mwYFX9wm09a6IrlwENNkrqXDukDj7MC097Y6kDKH95j5mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=fEvtKdOtVONHwMrgj4uGVV4F3+9HCaGdc7ntRJu9Xb+lrRoalZt/OgGOdB0W0gyTDpBk
	 TGgQBwxhbeUjjX2pRVE/vmIOH5E133Fr2lzrMxc2AY3sWCcZ2PDq+Pqy4OKVmfxkbhQgo
	 LOpAugoXw7WyUmK7GE8jze27cRXwNNVkK6dG6+0O5Sk1/UhT7FSII23e4xDqX6ajxadIa
	 1ASg/ZYFiQOzlsMgAmsgAVtOZMOC3hF6KCuDFk9he4fQ0ErVDPOSu0Mc8I16zZWQusY1J
	 puyqyLmCHLalAFzJHqCrf4P/tz3FLYfvXtLFEs+hznQT0bq5NPVXF6YTBXQIa2NaA8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=puXErWbH;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E9D606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81E9D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=puXErWbH
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso1104807a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795100714; x=1795705514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=puXErWbHNgaFz9TzgduIZRfNDQy2L4ukT9nhslS023HzIv2Eyi5DIvCXVrxlJjsfjS
         AGM4Gr67Zw2PScrGViwTlR9ppMWCcf+VKVaAo8iUIB58s44bg0K3iwYMwCpuX95yb3e4
         S2xh7NB7qMaYEDeFeUP5PJ8qXct3pckI3ubZrDvzFwK8sRJRg0x4dvLTiqM371GKUQaj
         05j90po7z1Dnci91Xf5EOQMSCl0GcOsLERHJoOLEa/fMvkETMNZDmrUEFWklaAE99Bcr
         L0fSb3N/nRGKuNkM5WN26jBZE0rg1u57l5JAZDGUjfrIZerLX70ObgWuPjl/bEHnDRQJ
         5/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100714; x=1795705514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=CMwObjUDVIEeDNpqLRaCQES58p/LbuOvmg9rcPPTTlLfXVePebSlV6rdt9xS5Y9a8c
         N//7x/ZmChpfE4GO5yEGKHW6K17MMqYLvsOAYaFWZdF1ZEUUdArSfOHMXmGUW3Dgv9CV
         5enjYknjzNtITpvDhhIr290P0btkZTK78o+unBb2x/kPDna4AA6jDhWz/WnD5Qnkne3R
         8bTNArakoIpCIKc+thSUuJqitZA2x9O2tvv2ytmDLV4GnUAznH2YpSMmtQSs3AkkLsV7
         TfvMhklSoKJwdVYNQ4kEN47sPuOZikpVNeMtuABv6GGmPeGNmXfFqvGGp5Vo+rwLX9tD
         fSrQ==
X-Forwarded-Encrypted: i=1; AL+hErG551T26No34bAAXHpRJ/DnVKWLiWi7vdAh8lQsiLQMBepHPDw7p6nlv1il0qYHL2QAxTDOfRDqHrwbGrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Lk/lRxpewJrpE0schPhoLiT9xJFJFMOJc+IhpStycPMErMZFB
	xfmIK7HW6IZbbWA55zDZgikjr0uL9xU6zJxwfKeZ1CarHkb1kzon1w+w
X-Gm-Gg: AZFdTZf0Dn93hbDf6SAAsO4x6wO/lflo0hBTcBIXJlTMcUud32vLupaYr31NUxzWv6K
	+PVC7A4UQ1w3p3INsmNu/36WaXdalvQYrOjHSmULstCCpqANecgDuxyRYVl1V75vXb064WOd7mA
	df9jle1vs6kqTkUs0I09ogUO+MU2c5NNtlpo8xybagfC0E/VCwobs5oeYuT9UplQlebO+ijAkZC
	KSXHhzrYGZYluQjkr19N9d56ZPUQYdwgP0jg1TqXB+NbZ9Z3CtUBhNBJtbI86Y87WzCBKTohCoI
	hFHgHRV+JD0scjHmeco0iB1Vzbrrwj1MP9sh21mMgNyf6pP4n53jmaUfn4VWFex3zw8OwtFQY4q
	77N2eT93E55GCHMcsOuSPNvWmC7Nqcz+fiEK4Fry6oS1PypdN0Mp7xTcJqj7/VOEX1Fr9gSBPfr
	bBAjAKA+ba39KWElDZsv6AyWYYdQBqtvNYNyPHsNs13TWepdBtfgc9v8gsprxJRRM3wcw0z3C9k
	gfqMzIFObQL1gTUcgCyO62Cg+aDfd/6Kmx8jVynk3j9qfxVSJpQk8PxNMVLWdsdBZNUN/ozJ6zE
	Cv1tmOHFSqMTb9f5XrF6epFDhy57W9/JvY627m0RCwW5LERQWD5dVA==
X-Received: by 2002:a17:90b:5407:b0:3b3:b0f4:1bf6 with SMTP id 98e67ed59e1d1-3b3d074d82bmr5995161a91.22.1795100709124;
        Thu, 19 Nov 2026 07:05:09 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4028310c5sm1827475a91.3.2026.11.19.07.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:05:08 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: lars@metafoo.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: dmaengine: Check DMA submission errors
Date: Thu, 19 Nov 2026 15:04:37 +0000
Message-ID: <20261119150437.3380-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87se0xugic.wl-tiwai@suse.de>
References: <87se0xugic.wl-tiwai@suse.de>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
