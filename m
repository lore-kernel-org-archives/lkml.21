Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018611;
	b=h7QaSdvkuasiRc07XzGxxU9pi9+gDzfAS++PRax60vy4Q3nFskDSxvVkeSPav7NJOcvA
	 2r1oJkvbImZPAc3duQJQINei8kM+vZqTWtdIJJS6B5mN1XXwURQiWym03Y2NUaYwRBgTJ
	 VxKsxaOfOGMnbPziYvPo/tdOGWirWTgoXJcB3DhUwjhpdZyL0KRKKyYPuyIXMQWjNBnwm
	 Wv/Asx8lZf3vjVsRQ6M0bEO25xzLxhkJzcl6rsemX6DAJxUJf18CpU9vwyw9Fugm5NQqP
	 0bIn6LVtCJCvsjDLV2oZxb7qUQCuFZcG6GGLZzIoZ1Jjf4mob0tfPjh2ewJnfhe29Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Mt1j1NeBKppdPhQUtkeyMgCerh85ZsDSz+CjHWhBd8=;
	b=09I+/oub6i/1uAHav3SQDTQJs9XV2fBUhflRLGv2045bEpNTwAtsxjSfOkHbNoB7rDqk
	 vZlPTDzDlVDobkQwq6SjMwDrjBAm9OWYHcfhenxRmp4UDThtMmbhy2xKKTw5Q8Hnc45nm
	 aTvPEcQPpPv0itJuni0lnGC7lguy14CjNrAtfbrk4QYziLlpZOqWDBJUE5vTRnnk/X4BQ
	 ITN7iGqDkCiHRA+bbNvN71ZKi+QOmnXp4w2qH25j0Pm6Px8p9Q1EBQWhBnhVkfjkgxrvI
	 zhxudzV3SYnakclh7AXFuQ780EsyCGXwVs4XB8mt/dzs+u0Y9lJFSf7XKajO7F/p9lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YF532Un7;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8A5606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB8A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YF532Un7
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3b3d12563ecso507190a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018610; x=1795623410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Mt1j1NeBKppdPhQUtkeyMgCerh85ZsDSz+CjHWhBd8=;
        b=YF532Un7EfdsWUOyRvMcMPwNcfTpF8mLMNWjr8N88MGn6ZYleGUDOqh670UiNeMiPX
         MYNTt5y3qfJwfKVC/UgqOt1Vyiwyq2V5n2U3rhIuUjz5TSLBBkgHrPc+fkxDlgr0CrpX
         z/tvtjU7YgyrObfxzp6ETdn1Kic8NC94yvGM/I1fSLpgqUKEG3FlyWYVm+WvfpOMEcEn
         mtexkcehBm4WD9RLbjeur1nf0XCnsYQDlVNyUZ0UeAr9b7DZr0Meoq3jB3p2i0ZbS3Wq
         twEUyTQfHFOV/cBfSBZu6yGiQN9pNFSqermpNvBT0URnd2fVANm2u98hFX6IIXNZA6M3
         LLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018610; x=1795623410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Mt1j1NeBKppdPhQUtkeyMgCerh85ZsDSz+CjHWhBd8=;
        b=XR85wD5/bi8E+nnLcxzgvt7iUlD8Z1X2BNXLi/JPGPz7OVJIrqJfNZEahRX813DCtX
         6jFGcY+LsRkBcePN8ZiEse1kO04mbQpX2RkhHX2pnUq1UJoXz5uIPYjc2VAmAqvbLWL8
         TIHL23RkFJl7nqrqXPAMugHWrNGUizfLPhMBLfR8b50fGoNuU1NBlbL877xaW0EBq0hM
         x+Cv2NX94xIEemA65fozy+UZS+Mmm2/H2vC8vAC2X2mMClgnQ8UE0jTPs1Z3zcpJMtSE
         f746q1EWE6tNP9ejxwIX8ruarTa8AsIAPyY1Y8elVGMwtyHM78W+sc49B2M89ZprWtp9
         IDlA==
X-Forwarded-Encrypted: i=1; AL+hErGXKEFx9p67k9eXcB8BF4Fr1KC0KP16ziIpZJqdKHHonQePPHtRU/LZ7XGgSB13SPjwZFoY4ep1bKFqeGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T6sZuhtXs4GanmSkIXpMD4CGKtVn/ZtQz5BhrNWmeA/mwolFP
	Dyhps9p0Az8YvCckNFDxh03INZ4Co6gLrL3fDbAEdcPwjCv18HCaDPy1
X-Gm-Gg: AZFdTZfOZ6XHh9KLrBFBqNDbq5NkY/2oTaT5FDASPVG4sXnBVucDQvjbHrvc7wIS7Il
	aIpoO5wPQEjh92eiBQebtIYxDy3PtNlBBajlI32ef3hIsqD1DVg84tgCICfqCdPH4ixq5pmmVIn
	ueF33XKeidgrCiyLpg0E99jDGV7by3fE5fu0m1p5hfYn43hy9at9nwceQ2lHCt/rhqMBgzWD2Zy
	AamJ6lESqvJoo7DiBwf+szmzq/3VtlUSABdx5iQvNiETdRstTxEopsulNZefr9/fbtV2QbH4QOd
	lewc3wCygJmHGTOVf/kAG/8IRxxKePG0fnG29Oya7hSUeLSkVW+Y1MwKv/+N1910dfsc20kdKCT
	AVsCy2PsOJF713X9SSN1n6R7x/6Ry5miBPJ4gwWzr5CCnuke6GTiBxvRbYBXOJ8odsWg8CGl4Gk
	pTv2aDHC5E0FQ/V+5vJo8O+KpCZ1/9XK7SMxg8a7u2pFeC5Rwq22c3dAqnzadqbtVjv0aqoIzUL
	Uavk8KaxZVoGf+5Mw7ftWDNf8v8M+Xh/nUdISaNZi9gBBfDQvEArDwDyUn0NRwVxau24xFcurDB
	LCtB08a9QRhMmaZ52nb+QpskdDxKne93Ryll3t4wd2C7QK4=
X-Received: by 2002:a17:90b:4b86:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3b3d06a487emr3376460a91.6.1795018609907;
        Wed, 18 Nov 2026 08:16:49 -0800 (PST)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde533658e4sm256978a12.2.2026.11.18.08.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:16:49 -0800 (PST)
From: Shihuang Liu <shlomojune6@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	kuba@kernel.org,
	qmo@kernel.org,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH bpf-next v2 2/2] bpf: Reject maps without iter_seq_info in bpf_iter_attach_map
Date: Thu, 19 Nov 2026 00:16:32 +0800
Message-ID: <20261118161632.177820-2-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118161632.177820-1-shlomojune6@gmail.com>
References: <20261118161632.177820-1-shlomojune6@gmail.com>
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

bpf_iter_attach_map() checks map_type only, so an offloaded ARRAY/HASH
map can be attached to a bpf_map_elem iterator.  Offloaded maps have no
iter_seq_info, so __get_seq_info() falls back to the target's seq_info,
which is NULL for bpf_map_elem, and prepare_seq_file() dereferences it
when the iterator is opened.

Reject maps without ops->iter_seq_info.  All map types accepted here
provide it.

Fixes: d6c4503cc296 ("bpf: Implement bpf iterator for hash maps")
Link: https://lore.kernel.org/all/20261112105620.57520-1-shlomojune6@gmail.com/
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 kernel/bpf/map_iter.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/bpf/map_iter.c b/kernel/bpf/map_iter.c
index a58c148692e6c3..9e459a2d34c3aa 100644
--- a/kernel/bpf/map_iter.c
+++ b/kernel/bpf/map_iter.c
@@ -176,6 +176,10 @@ static int bpf_iter_attach_map(struct bpf_prog *prog,
 	    map->map_type != BPF_MAP_TYPE_RHASH)
 		goto put_map;
 
+	/* An offloaded map has the map_type of a host map and its own ops */
+	if (!map->ops->iter_seq_info)
+		goto put_map;
+
 	aux->map = map;
 	err = bpf_iter_map_check_prog(prog, aux);
 	if (err)
-- 
2.43.0

