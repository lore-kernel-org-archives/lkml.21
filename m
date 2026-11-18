Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999764;
	b=uagEz4glif/03wvCf3E0wUFAtgaHS44gscYLV/hNw8ebE+o1Mm7qyo+P/HgPfgpiAtkh
	 tZc4Xxz+5cvu5VmZ3P8XMRIGH9KJYQD4dIyCiauGvW/DOUxyKZRQFyCm+UUAC4IYT+FYV
	 AHuol5C27Oy+w8hZO4ngY55gwyn5vVEhNy9+rXGWOTw28YmkE1HKun0OoCZwmpSzaslsd
	 ZhqGVe9/j4k9jTt14j0FBkWrumgRl9ntpug42r1f2XnZLLd+bOfM2gPbKCnumXm8fTPvP
	 nHLrdR2IBre5/8lmVQlgVEgJY2/PjqcSgBX1XIol2PHZgJ2QNOlVZKrmHM9PQ5a576g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TNUJcoivapsKBW3NAQfMVs0W9NiOWzC1TnMHNTq8Zc0=;
	b=Fcvl6DenxNKQEn9v7iLs3ae2zWxpOH6oqPtYkBkxWTykIT8dNrKviPkM8rNjqJ0ooGzg
	 rAZ22/8N3qPV6psW90PvPy3R+YHi+BZ7kbE3rv47pkmV3UFRFDrQK8PDQbqZSgcBfqMdB
	 SasnkD1HfF/7kMbHILUd2Doy64ysRyILGaaN4zrCgM/1kjPVGjTRKMSnZGOJKv80M3BFF
	 R2w8vQak8MhOgid9uAST7QSFWzPoQ3YvWV6JCR8qxYq0HlcYjesiAaXOKVfUviL/rBcE3
	 Is49LVlKfSieAI6xa7thbpXLkiVVVslXSr0WUlB5KX+EYqRkHnBfn2DnA2X6HCSukmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvz.org;
	spf=pass smtp.mailfrom=openvz.org;
	dkim=pass header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=YeVRGcrT;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3B6606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D3B6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvz.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=YeVRGcrT
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso652284f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvz.org; s=google; t=1794999763; x=1795604563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNUJcoivapsKBW3NAQfMVs0W9NiOWzC1TnMHNTq8Zc0=;
        b=YeVRGcrT4o7IBVvHQ0a0pS8eJ8Eor2RgmVH+1CvPou+qBAZdLeY1ZvFzHDGKPBdDsW
         OX1tK0sV64OdX5Q4X1N1z52GEcapjjLk/QMVLiiiVv8ZgkhZRtAyNmEEmK4lcYO/MU+z
         5Yn8Xn26GFeUDfHtByujuMJAToZglDa8UNqtuTTFfl2r6XbIbuPhLnXk76PGxZQM/OfH
         yL1/s0FuyKLK2t6E+DXQd6zEi04AeKhm33Vlcarbf5GC2atWCLRyks/h/B+7qeqIdV7K
         Pu99eFDuzJviqcGy4wUnG0ZXt5qyQewrMi8vN88kkIdRvhhoGv9tm+AXqWMu1x/rDeXd
         klBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999763; x=1795604563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNUJcoivapsKBW3NAQfMVs0W9NiOWzC1TnMHNTq8Zc0=;
        b=L+NodBmxtlW2WlYxWwdV4q3UDAbdTX9/7Ksevdh8B0SS9ygqKgKWjPGgqtULEYYWKi
         44dptzKNvYbyyLKsACtXFvMey5k319Jc3ULunXwrAyeNaTxfDlYemfDDqXvBuLikBQsA
         aXO6jLeMztFvRqgC9s8O5nPrhCxgyRrU8TdXVzeOrSYeffR16B70//DJyArnbMK/N6Er
         IsBU6brj2VQ+eojN+rCdgL0A9XSzmi7y/8NJtP9BLufWEMVb8MzZCM0eu0+jfgAdqYXM
         DiNSB9brgXC0yazxDWI2lXuyr6Gm67rMfrKFv3bRKWIhbOekN2eMSsGR2ZO3z7ecQuqi
         tCkA==
X-Forwarded-Encrypted: i=1; AL+hErG0DFCN5cVK4Ke7BpsdQ7xvFi+XwDumX1357UAlg6TjeSXgI8HOUxYn7R7sBDbQaGGPPO2Q7RQUo/yTo7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XSBxGmTF35IBWbsZK9zrXde29ELeJhiC37WOLF02GLL8boRvX
	d3/G8sU9OAbVdzR7Xlf9FenXpY/5uxdmCKNac5TIAg1LETa29m8ZTUE7YZDF9DY7KIc=
X-Gm-Gg: AZFdTZdHRaUrg/UddeZPlHGPh+HM46LJFyX+ddwozut9VDVdju8wc7sNs8tkDPcrQmA
	yfQVHJclRiHxZt8fVMYS3SvFkbrqyonZkAgjSUbKXCmqw4PsOjDQ8AyoqpMgDdVQg0d4p5VH8QT
	089i1dfHIpADzCscYeUfQfAMHYzQEPIkvxgE9bQ3EtJN5JmDQByVtDXWXnlm8vPA9gsp2iOxbDl
	f1yP0GFHPAGP/jXw1NsTYRQud2Ns73RRWxLl0yloYISmhKfehTmwRhUcoFmMffIbluTs25IBs3y
	CVetqPZPpnyqo4ktY+esg958OY71R/luUp9xsy5ek1vb6GSNLaXZA7eYft+PIsdjJdk73CaVB6V
	VmiT0KbbINRH72DPGFcxn0zjR+KJvOT8AhOyfJEeJArvgZ1wxsa3ZtN5lPAFWEdTivgrZ3WVe5K
	jDhxv0q2U/HF6P6lI0sdQI/A5pxQH/8bwe+CkqquoS3geuF2TpAT2ihE+8NZf31wLcBsb2cr1k6
	OqnPWitlV3cCNQgDO+xR9LIWihj3kvgS1Mh1y4P+eTq7QNNsaxLOxXcljORv/2dsfKDlZoH8Mai
	G2q7tgLJdQdCdzj5rLTopAnUfdNh
X-Received: by 2002:a05:6000:29ca:b0:493:2eb8:e7d2 with SMTP id ffacd0b85a97d-4a63a98b0d3mr3226899f8f.41.1794999762580;
        Wed, 18 Nov 2026 03:02:42 -0800 (PST)
Received: from artemis.sw.ru ([2a06:5b06:b600:300:8c09:3cc3:6efa:ac1f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm3943277f8f.52.2026.11.18.03.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:02:42 -0800 (PST)
From: "Denis V. Lunev" <den@openvz.org>
To: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	dm-devel@lists.linux.dev
Cc: bmarzins@redhat.com,
	thornber@redhat.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	den@openvz.org
Subject: [PATCH 0/3] dm era: a metadata device that never comes back
Date: Wed, 18 Nov 2026 12:02:36 +0100
Message-ID: <20261118110239.2910290-1-den@openvz.org>
X-Mailer: git-send-email 2.55.0
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

We move running containers between machines without restarting them,
and their block volumes travel with them, so dm-era tells us which
blocks changed between copy passes.

About one move in three ended with the volume dead rather than moved:
the metadata broke, every commit after it failed, the target reported
"era Error", and the writes it tracked began to fail, which takes the
workload's filesystem read-only. Rebuilding the device recovers the
tracking, not the filesystem.

Three unrelated causes, all of which the kernel log blames on the
space map, which is the victim. Two need no bad luck: multipathd asks
every target that appears for its status, so one is asked exactly
while it resumes, and again while it suspends. The third is older and
wider - a transient read failure in the persistent-data library leaves
the space map short, and the next commit makes that permanent. dm-thin
and dm-cache reach it too, where it costs a transaction rather than
the device, because they can abort and dm-era cannot.

Each patch is reproduced on a kernel whose only modification is the
fix under test. Patch 3 must not be backported before patch 2, nor
before cca2c6aebe86, where the resize goes through the worker the two
would refuse.

Denis V. Lunev (3):
  dm persistent data: drop the original block only once it is copied
  dm era: refuse metadata rpcs once the target is suspended
  dm era: construct the target suspended

 drivers/md/dm-era-target.c                          | 10 +++++++++-
 drivers/md/persistent-data/dm-transaction-manager.c | 13 ++++++++-----
 2 files changed, 17 insertions(+), 6 deletions(-)

-- 
2.55.0

