Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562304;
	b=wdtEPv/sahB/EX/FIyK0gjOklaJ2Tkosr+GzZcedglvQ/gyTA7dup9YauURSPL7TPr10
	 M2VnXkIeMq8kZHFy5yLf5umVsRgHuMB642549XyDUL1UxSXE3eCTqdE9CbfzrODMpDfgR
	 MP9KE/mDrkcErZnf1Zuj4ysDIqslQpZtJl4b0d4/3VPGme2XWdiSwwTuNWUshWKb/xdXi
	 c9PIHzHN1sTc4Gk+fiHLXOC4GmaTfoCSn16NBZFtpkLUnOq7szOpxEuwcy7hgozfMr1AZ
	 zFHNeublOKeXFsb5Uq/zdzDPxYf6JDDI7DJKcd6TfwK0pItYFajYD8AxG5niquwxljw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hnvQHR4Bfj8vgJJv02cg9zan6ZOhZyTgkfEMX5BVsDg=;
	b=h3g7Sy2ecVWgRTnSX7C/G94Gw5FQpE0QSs9I6zuDKsCNFOt25HHmD6e0AANiCyRlR4ox
	 M9ZKMaN0egA/YsL0esHYC9zm2/EJ8bclDEe4cnMKBAGVD2DRL/psBGaSsJhU+0yMJW2KR
	 sDcGNTsdXGaPTz0upgE1CbjPISEw4lj/pTcTFsOx5bwepi1I60t38wk/U6COOwTqGiTYq
	 /ujr2lob/LMNtdLH03/iZn34Ya2WVXLmglrrHKoA+KeuHXwdhxfDOrNRhkAc7v0M5CohZ
	 kq6VbNytbZ5zJvFE/I/HcUhFnMTHfZmGnzEAm2w8qoMARkdM2BUvPIJTfeJiwKppMZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3Aq4g9d;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CCF606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67CCF606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3Aq4g9d
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so679475e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795562303; x=1796167103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnvQHR4Bfj8vgJJv02cg9zan6ZOhZyTgkfEMX5BVsDg=;
        b=I3Aq4g9dwsSkjc6S6FBmigKwbd2Z5Ad5XA7dl/x5cgNaGdLYOrJ5nOn/pkCvR1XP3y
         Kal6QMH+Gz0GJjxT/rxdVlrKIH+HSI9hK+wF+I67b8qG+W/B16oZZk3wqn5TFAduGbyC
         r303RwC8nEjSOvbib2cTI1k4PC4fBKj6vNraDaj6IglrIm9T2iPvjdvZagDkfnFIwVvu
         lTW6wXdSEGifyD4kh0pnVTXznN3nCyZxyyojVhMUH2+yKYunOIm5lUjvo5iuIDOGCu3g
         szLiRTfL0ct4N68VNIFZl56gbw4nrn4E5FxNtHjmQ2Z747ipIT6Fu2bdgxK0JF+1vmxH
         EC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562303; x=1796167103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hnvQHR4Bfj8vgJJv02cg9zan6ZOhZyTgkfEMX5BVsDg=;
        b=ltIRAm+N3Sm5/eKxuiGWo+j07feF9fQn3ClM5+cmLZkZXfWHSW7rUXUN42TzbELk6C
         0VpuujqUWM/xLOW/a62ofR4RdZv4VdZLWQl/GwxlqO+LBXf4ggJlJRn/zcUw/bNfcrEF
         ArHp/xRhbVw4F9MlVu+cICLE9G1KirDwUGOoHFaSZUWNfYnxcys7nABcPYIs3eC7qlJf
         fpMlE0Bb9qFv14CmkssIezR1hc5MwBVO9sqt/e1cCcLCtIddmV7qg0yV4BbCBKgoffwD
         tqiAjdDGRKIoH2k04Rr0/k6CStpaJFXPVmo56V3cfirU5Br4qL5kLupkzBdv2tl1/ZAw
         YrGQ==
X-Forwarded-Encrypted: i=1; AL+hErHdMu4t8AN1o1mbepUwgMu7TWe85d4fYRbKcpIvonExgFgpSab+dQMempWOcFTMo9EfyUe48Kzyw+KjSnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+56xz0AzHyc41mdqgunrzWygToRtS3H6wciOqplZ1uJz7QsIio
	pErrTAb1kecxsWIyYuFraGuN+1KJ2X1wnRB/bLKKBeBol32BbZPYgD55
X-Gm-Gg: AZFdTZdpPqbcC/pt0zMIs3P3eH1dskSBUm7WaUYgrV7IcuU2x2v+dUhicJGdyUf0ryV
	g/L3Q51+wVlhqSRqub4y22ZyqGxnZ9h/qoUDYdrnHPwBgGQnD8N3midjBmfB2a0wp3mUc4LuAy2
	OsUadUu9M2D3yr8Sn96q1SaL9p7kUubrVaakdKbMLbtTAQ3uRm7gNPmaQx4ktqfcQQJ7dbMEHdT
	4vKwk0WxvmVcHz7gla8Q8HB1r273xvEi0FH2aml78V4rVQ5Lv98P175XfQzLxutaLpwlzzWp9pZ
	kHglRxgTaE8/Kxe0yxyBkwKQ3S3iuKBRPOvL10ra6m6JcI/tbQqnzt8OVsxn3/M74YwCKfnNfkG
	NSxPhaLvvzisne8cKUtHVjO/1eSEhqfPx8DHL5zHoYIjUdHpuEm1gZlnhfvTCVj7WauqHiNeLth
	rV0cSjMtqD5UKbeWfTOvbNP8awvbvWirj7YhBbsJfKOVl3o8GWeeLuTiNFku+IElOoB9IlbUeYx
	f6IPLQXzMgEghsCkLodE61b8yj9t54UOHmt0f8TUSupVSN/T0UK4TO8Y3DiGEJS9DtoRiTRVoB7
	WsaofJCwYl2XXN3AUwXoRtVKYLGNZABDEvmRz6dCD6opfqribr7wDuU87EqkgNwZMPkTI4+ad96
	kiI4KAr03wu005tbf0Q==
X-Received: by 2002:a05:600c:4e8e:b0:4ba:59fa:510e with SMTP id 5b1f17b1804b1-4bb8893014dmr330709015e9.23.1795562302885;
        Tue, 24 Nov 2026 15:18:22 -0800 (PST)
Received: from localhost-live.home.vlan10 (053d9243.dynamic.tele-ag.de. [5.61.146.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm554400825e9.11.2026.11.24.15.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:18:22 -0800 (PST)
From: Joshua Covington <joshuacov@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <masneyb@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joshua Covington <joshuacov@gmail.com>
Subject: [PATCH v3 3/3] clk: rp1: reset cached rates on probe
Date: Tue, 24 Nov 2026 23:17:51 +0000
Message-ID: <20261124231751.83938-4-joshuacov@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124231751.83938-1-joshuacov@gmail.com>
References: <20261124231751.83938-1-joshuacov@gmail.com>
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

The clock descriptors are static, so their cached rates survive when
RP1 is unbound and bound again. The "varsrc" clocks then report the
rate of the previous probe, and the audio PLL and I2S clocks start with
stale cached values.

Reset the cached rates before registering the clocks, so that a second
probe starts from the same state as the first.

Fixes: 6486341721a2 ("clk: rp1: Add support for clocks provided by RP1")
Signed-off-by: Joshua Covington <joshuacov@gmail.com>
---
 drivers/clk/clk-rp1.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
index 1dd276dd2b..60037b19db 100644
--- a/drivers/clk/clk-rp1.c
+++ b/drivers/clk/clk-rp1.c
@@ -2416,6 +2416,12 @@ static int rp1_clk_probe(struct platform_device *pdev)
 	clockman->onecell.num = asize;
 	hws = clockman->onecell.hws;
 
+	for (i = 0; i < asize; i++) {
+		desc = clk_desc_array[i];
+		if (desc)
+			desc->cached_rate = 0;
+	}
+
 	for (i = 0; i < asize; i++) {
 		desc = clk_desc_array[i];
 		if (desc && desc->clk_register && desc->data)
-- 
2.56.0

