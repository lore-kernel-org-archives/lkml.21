Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186776;
	b=zyWXf3B0nsC3hKqJY4b8yKqUdubZDtgyIVLvh4EdulL1TwM/jP2IEtg98whoPS0POESp
	 65aqpc+tug+SLjCNdummpeoKb6Fwb0OEdrWyrHULHg0pUKN/CfXv0JapGFW03lVrv4qM1
	 CqlMHTd5rwfZkOepqrDx2XkI289aV+ZlZ3hkQfMp7ObJA7jl9kF+3GVrif/tGZnm6eD4V
	 FdVpxcqc0xPi9gOY7dAJa0v6wi+BBxZ8vIb+H2H9JjZIddHGk7ZzEB7YueDkrrWpDCW6K
	 is5CtR4Hm8Iq1zauhTbIYwWiNcnIUMyQn2yOx5rfJPZGCUK804uk4ks+d5X6EhhLZ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3eU7JUxr70aXQRKZU7ZkeRq7K0s907+g8T/hNFfZDVg=;
	b=JxLg/AT+VriJjpZC4jTdo+gDoXjiQS7nB2bhXpxSkekdCG1rOolDMOSePN3vXBPPwHPV
	 g1T6emH0uK0Z7X/3Kl+lG9WrkIUcXdJx/F5kkrzpW3JeYoSF9p5UwoavP0KeuVk/vrklC
	 zlQHOQTCgPBymcgQ2PGphGfxQC9lf+InPWkekYhCZrcVx4Ydj4qttd2B3LONIMJoqWdzS
	 Asdni36eS3x09hOXf1Zzac1yhcfq3k5xklTjErlFxkAxcYcAwaz7dGzgpB8g4DwzScFvr
	 7DxGg5RF0omNm9CpFdCpcv4RdWJKFk3SLrfyt2lu1hWbTGjd3Kun5uRMcH6ISElPSqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d+WSCsrF;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED8260A3826
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ED8260A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d+WSCsrF
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f02f04a426so8005435ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186776; x=1795791576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3eU7JUxr70aXQRKZU7ZkeRq7K0s907+g8T/hNFfZDVg=;
        b=d+WSCsrF/dWLtuGfnnj5h8t3Yl4+rnTgfOdV2EgLF9EmHtEc7EINaDI7qKNbjc7lG1
         zE9nYv555oDImrohUlODnlofAr340kBPtlK1F7Wu/1DxneSV0NwHhaG4hSr4FEgQpAGJ
         bt3Aicw+ywy0FP4kUY5Yx28HkVFMLruhPmJZcsEpJGZKRz4SJ0f3wP2Xs7Njj0Ve11tf
         iebUhj86Bh1VIaqrWuYeVL3nU0RwLLW3YPD8kI8J8V0NBHA8p4ceQAIflvPSklA2R9iY
         Ia8UjGQL3cEkbnk2paP67LA8wAbk4a1bMPIo0kCmM7iPBH1PwH5zKaRzPzeVhaNJiqnU
         53/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186776; x=1795791576;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3eU7JUxr70aXQRKZU7ZkeRq7K0s907+g8T/hNFfZDVg=;
        b=h0OMt83vZMsxEldDy7ZW3ym5jIYVW9bPNynmQCKHxVAZm/YNvYTa9di8eVuMWmmnAC
         GXk6Lighxp/qQzH1LJ/mzGbVxLnnuMndYjQeUByHECK2qx9JCAOjnscvqbWisw1uKf19
         LtwSzgxuow37EyLlW3ZxeDZFKQpbUu2Bg8dElzosP3j+5MM/bwgUKgM0s6pDSFmXX+mJ
         VQKvTwYYcIQNIOiA0AyyOClQsYRTFaUOv9qV8wmknnY3wTU6d1wwh4PW2Hcgeq2FyMBM
         p0/I0pUVUA5iQZDf6IxTG5XyA/VWVuRq7On6XMQ9HoQwis1jnC5GfihNQbeXNu4l+0LB
         Fqug==
X-Forwarded-Encrypted: i=1; AL+hErEslmMew2eV457324bgVmKzI0/i1bWbtb0ggyAjsu3cHPLE5JqLhPgnHPR9n0E6uWcItJ5tmHbIfbY3m/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RW5xbEZQF27QnF39jFSC7ekdCMGl9elPS3TXhyL2OJ7el9oRu
	V1B3Q7g3OrVXnMXvc2lKsrMPM0FQg/0vqDez597Ht5LwSPus8gDtQDY9FB51SXwh2d8=
X-Gm-Gg: AZFdTZejOUAAWoVPrDBox6B4dAhJpNI0zNkJiVA4vAIiaka8E/HqKTpk0uaBWItquaY
	1B7scBs4GeEyBM2eD0uKCEJB9x3otLuP3FrRucnVCygztjXEtnKHJenbswspTh7LDCazo4MkJ/S
	4WwyM2hTGcHn+A66ykuc/cHzcwYP2J/sahO09M7V3H0Fm+EqVZlkKL/1ItEWZgyrVTjnUKc0hx7
	yQXb/xpNSfRid1XnK0Kmi+g3E0uI942ljihrhwhOzIZxf8vsoreuRvcgVhVJrbpPrinjAFnsDNi
	ls4jaZ2B/v+yZZtflSh2aR16BJvfPsfmnwN7thKD1+VpoKhpvdOlzrX+CdiLBVH8dR1ox7NeciQ
	Jvum9vYBAnh6B4QZ5XWw48+4gev6UEc8sx3AnlxIEcYS+99B4q2ekDw4hjD4WJ67W10zDJWyTiu
	x95SKMj90y7H4r/7e4JqSqJ3VE1MRTbfULZSY79PrIA+KPgF0Z6FHlaAQ0Ihx0R8AUR8YDpZ/f7
	nvTwEhNoCDaZyzksdsIBsvPuwewWSwzm68DuDrLtfm1Iqo7Kg+SZDN8rPuGtRv6akzl5O4NoaPL
	BlhP2Egkz9MS0dJrLClgOFXgOOB1C9x7TY0UVg2i2eFgC5YCV+ukTfm+jrLqyp2GB4hUKro/2ME
	SUCJLSV4xdqlNzeaTn+OHlXWzt6ePJlnUZlxR
X-Received: by 2002:a17:903:1745:b0:2f0:5b55:edf3 with SMTP id d9443c01a7336-2f05b55ee4bmr165625ad.32.1795186775567;
        Fri, 20 Nov 2026 06:59:35 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84027sm16016445ad.7.2026.11.20.06.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:59:35 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ching2048@areca.com.tw
Cc: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thenzl@redhat.com
Subject: Re: [PATCH 0/3] scsi: arcmsr: bound adapter-supplied completion indices and message lengths
Date: Fri, 20 Nov 2026 23:59:30 +0900
Message-ID: <20261120145930.3127922-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791789900.git.yhlee@isslab.korea.ac.kr>
References: <cover.1791789900.git.yhlee@isslab.korea.ac.kr>
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

On Mon, Oct 12, 2026 at 04:38:25PM +0900, Yehyeong Lee wrote:
> The arcmsr completion and message paths take several values straight
> from the DMA area the adapter writes -- a completion slot number, a
> type B completion-ring index, and an inbound message length -- and use
> them as array subscripts or copy lengths without checking them against
> [...]

This is superseded by v4:
  https://lore.kernel.org/all/20261114033810.549787-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
