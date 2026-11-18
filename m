Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996424;
	b=AZyK1pPWjkUCh6mJhLzwcwCZiG4M6qePpfUMZ1mpJP+g4GRlrYALGdXpRXmK6GWGIoYX
	 iaJ0Xn0kVlp/w6NcZISz34ANct82MuAz/JguvDy4HIU1XNzIz5FApz55bacRbyo7miXIb
	 qJ3em6hr12haUOy/kFTr3eEEC/jg7VL/pDZesyqu/5dzCJVjPU4ZUb3ZpxpS4DhCDhH2c
	 cMgJhjZI2ieEuL78v8ty57Ox4Ni4c69SzMbYixSN9ISE2tI4/goxxeK0OjGUSsfGVSve9
	 raf5H7MOvK4eKedrl7+wBrUkyzTnqgJ9Ci7t9SUC+XsK47z1lMNhK5q1IGXgES2BXKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/kO93nSsjjdF3j4npCojXQ0FzWXWJez2uUSNY9jjjOo=;
	b=AJhjgqbipBmrjY1CQLeOQwO0nYPCjxog02fwMeM//DepXEU4hzBt3ylCvHL3MAH0V+fW
	 5JZpbK5/EoEmzUzSApebFKRuSL9B+Rqrrnut/zo9ohwhzKghpdFzvlZ8vkPTef0Niougg
	 uYAGcNg0v2rfX/hR2GZIJ0Fjw/1+pGBU1teh71iWaYvU+0boYi8wlM2Dt7hUBhQ+RxS/h
	 dbXvI5oWn3Rta43D+p6izXJeDeBVD27rNESDHMzxwjH9W+Ljp8CAOaY+KgFTq8qyFz5EQ
	 ls+GNYyZ9JrsRQmh9zzXtBp2TbhmgA0YSXpsO/xWQhgwm+bDDSeurEch0Mks88Iqmug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJvt4+Tk;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D17606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D17606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJvt4+Tk
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2efddf749e5so9048255ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996423; x=1795601223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/kO93nSsjjdF3j4npCojXQ0FzWXWJez2uUSNY9jjjOo=;
        b=RJvt4+TkXdfEoie/3L8Sz6AdW2W2NbhPUqEi5fc/QS3YuAQhoBnhCvWArNfzPj/vr9
         dEUNP6nwq5fDOjbQ3p4I1HjYP/gqpkL9IVRv9WH7OUwpPvi2MBf+A9I9+Kc+EKnx1X7J
         qvRIlEKZKbxJ4/Juho8EzNUFTsp61h3EShUEII3qXovU8AHEL146BbrTo++Oacm0Lmt4
         anDatOVEhuDhPTXo0pjX54GZBSSgTeb4bMrKotsX4mdM8MTFE5oHoOKO4FbVNiej4snF
         z1U8GcE1SukrIq8dm2zdUxRG/J90/JaRP2qA8LbyekmSsBdva8vMTL2PSRGQTL/onmWL
         o9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996423; x=1795601223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kO93nSsjjdF3j4npCojXQ0FzWXWJez2uUSNY9jjjOo=;
        b=HZexrLTHoobQ+7x1AQPwzJgI3+ZfLC7sumvyN1ZfvxixsEw01x1+UcIjDf9/QIedEY
         8jMOvoelXKsbaEoICBsINuxCb9naPrWcQ8WFutzOzQb6CJJmAAnQYAXHKm+EtrO3/Dmt
         xxvR8PcKC2j2ZYNQ3W0hLaTSdCqs4zRzy0L/pblhDbQ/NgEuV1/s7HKE9JhNcHZyfJNz
         UUilRKn9H8ekCwBVwoBOLpQsK8vz46ByH5ODM4W5Gp2+3dEGwV9JAfRd1C3ygHCJYrwY
         B118/Hhr43YpEfU0sP0qreOMx9umkd24zBO36cVYZIneGGbVjrGGvPuab5S13n2btGpT
         FXdg==
X-Forwarded-Encrypted: i=1; AL+hErFXsaE+ISIK94wKi4ZX7WvDJW/bCHgqPeV+uZ6KXaWviq2E4gOalu+bgdpSXwp2rTl+9Ujek0z2USVv4cg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ytRxG+HoaWcwGZrS53ZxGCswRQzns9T0f1ZGLLozR5qgDMDEY
	s0oEeEekPbC4Y1aBaD8jNvD16SSjGwwgBBw95DyrwmF5p2mPU4m55YDzBWlNtQ==
X-Gm-Gg: AZFdTZcXviZB0cxGNcp1dztHVTh+blWLbYqRCZ71d7GtirIeOBuxSdiiOy4YXZPKUL5
	LbN7eyGUlgA4SrMplUQnUbeOJ+rMl0bLKJ4PLlV+D9HnFbR9eklNKl6T5v89GlW3ut4zrN5Tida
	rereGTuCb2pJIu9Pf6ZeOCT9kWAjgDWnDZL6U2o5KnI9aBjD5Q1fij/Hxywtlrozk1QfXjDYi9B
	fPtdJrWVU9H4wE9A8QY3wwbPehQjwZu1zP6GLZ93SKFKZ+QSr76Xa/0O112yO3bjuVRa3LWHrDx
	21fuqPMvSOpyMc2+t5yNFZ51UicZkMx7D/cvoKiSe4XMk5RU/KXgZnRXmJ/EVF2yUKKVFPZfivo
	mNzlDKogW6ZfXKWDynF0MNXXFQaBKUwv86hsKN8eSK7VHAlJhyEYnt0eQryDCyRUsJowbHgeCsn
	S230pzBzytfJ++88pRcB2ffONpwu6/H1bJlqt42ZeoyKr5tLM+79814ZW5Fce4RPsG5OJzri9m4
	1t2TSPOIGYxNMcAIOLPZ++2bNHUe/LsYcjv374shHDcZVuMepmF4v18ZDSR9v7sf+eOv7Vwqisa
	6q9Nh/f6ghwklTLj06zvuw8o6NNFUk9YGd8fNr9gbjH5Gp6XVPb+nOYQ5sUEojxpk67TUeuDX4A
	VX1WvPGMxi4P64YpHdfp8gJDg1YbLErtlMdLwvit27knA
X-Received: by 2002:a17:902:dad2:b0:2ed:520:2641 with SMTP id d9443c01a7336-2efd9bcde77mr39901635ad.31.1794996423492;
        Wed, 18 Nov 2026 02:07:03 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6215025sm10634145ad.46.2026.11.18.02.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:07:03 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	jonathan.downing@nautel.com,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: fsl: lpc3xxx-i2s: Fix error handling and DMA configuration
Date: Wed, 18 Nov 2026 17:06:29 +0700
Message-ID: <20261118100631.26658-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series simplifies error handling and fixes incorrect 
DMA depth macro usage.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: fsl: lpc3xxx-i2s: Simplify error handling
  ASoC: fsl: lpc3xxx-i2s: Fix DMA depth configuration

 sound/soc/fsl/lpc3xxx-i2s.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

-- 
2.43.0

