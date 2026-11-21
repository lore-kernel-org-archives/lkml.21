Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288533;
	b=fJKAmfOdQjBsKPAvspI15m3iwFpegQ+QgN4bXfpa55pKgsKwJb93gDyDpsv7jnSMBEi3
	 ahsImNfAaJgqC6oCylxtAsjFRbvLfY2sEWftQeWy+pIBmtpld0HuIQozkb5OQFEnatypv
	 PSKU0H3ontOstYSDX5VgLOHQYJLahkait+yFRGYJcFkifcn11YZ6PStRoIN//Jd79a0Re
	 eOPz/twVauQdTIiX3t9l0YAwCbRyriui+iuhIdnWjPvEuC/WwUWWVz1ASvKApe+0DJz3n
	 k1f16cRNGYy31GNaOG3QSU6CklyiDGdYtF2ikDK3rFV63qYUVEfXG2hashrRBK9rqiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BV6eprrpmk60WsgTos/4/q2nGNAqJeHGHSNMjCSFXis=;
	b=V1XwcU2b2CaA4gVfZArRs7laofUnR0SA8AgBnqu3yNtdExdjHPGkRkBsWxWp3NhBd6q9
	 yyXhU1bVE+MoDMaJ1ksc4DsVxFpgzASik3OKt8qX+gcNFshdP0j4cphAhQbY+vfa7Fwre
	 jMWdfJpBZYEEdLysb3ghlePYvspY280zbHZwS1I2rtvQZGhao+kzB01ndLX7AaOJJ1Aiw
	 sVRmWaSF5tBIh2Qr6a5qyCas/0mB+busIl1BBfb+PkYFnDDkGmc8y5ZFGXCcElDEdIrSZ
	 A4bHUaL6ooZbjQBg+C145yxcEdrnD5pKdgtfRsevbU5LuJmlI8iivMmRfHHEQSfcpNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lrW9pljv;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B265606A331
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B265606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lrW9pljv
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a210470b49so17769785e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288531; x=1795893331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BV6eprrpmk60WsgTos/4/q2nGNAqJeHGHSNMjCSFXis=;
        b=lrW9pljvogIQJMAPD1HjzkVAE72U83bgVdExyRBkuoylxhafUbM1yINJrxAup0qRl0
         ISO2qlGwdzhO+JyXBwK2SZAr+L2vsxM7SGuHHdukzchRoteUovPxgge73Ynp7wA4k7Bc
         OlVdO3TdmQzRWoRRFaa4Snuj1ieoGCm5oCGpGC4/GeQrN8uHFP0PCzdT/pkDRqNQL6EP
         RiaKkG51p0YgoSYwA3WA1A6fb98MtZY+NHOfZaGGddfJ/HBLTaBW5jcKKPqOfX0ztwR2
         B8tgEGuEqoBq9ai1ELNiJHIXZ3oMH2LT/qzZHCgSzczI8WyaAZ5jDN3CTd5a4AHT9l9J
         3Hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288531; x=1795893331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BV6eprrpmk60WsgTos/4/q2nGNAqJeHGHSNMjCSFXis=;
        b=jSaTZTbmGjBUGCFWw9PbvPDZfFTSe1ZVevi+HW9AU1ETG1B3rMcLJeV/ZXtaNqBgzY
         Tlke59Ff91rZPJ3LoAqy9n30UbJI/Vu7HfAzaBvQkZnduEDEqe4YgF8AC1gmG0NnrVMU
         LZCF15unQKm9EyfMTRr4CwjJAO/fk+1/48+W0Je7ghV7VxjSL+yzZP6bKXLvqa+4wZBx
         GJodmCg0/AIhyKT5+yhMgO3K75zSi/bo3RjOzDqx1TL0Sqd1AybtpJ7lW067UmPoME9v
         yLjvMDAcilRIKXsRaEBw3rWRwMaNbz2O5s8504H6va0Wk2ADSfvpQSflQL3Q7etY4F+R
         IWfw==
X-Forwarded-Encrypted: i=1; AL+hErGLzon6PTcPHQEmsTigN2hyFi1FJI5JRK9MN9gALHp+KzFeNmN3UECHzPCWzZYqpkdRPpoApV0XhybSRbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DXhYQRufmwjRbai429BmO1CVQb2bXmU61LI60SS2vjh43MwP2
	ps2mlD3JBXPPvzQYvCxlTcOq5SEVlhAyzXHglO0hN4zEscR9AP1aWzz5
X-Gm-Gg: AZFdTZchk4QPOxTssoXpb7hwvTCm/M/dKGVymO8KbjamRr/vLkF1P2J2o8ryT3kH0FZ
	MeptNnf0sa3uSUnk7tfO2OKNQzPShDknzCp5cLZ3e9GvBN0GIeFCnYcImL0g6uxsi90FqUPC6GX
	DJgRm0oyhUK8FapTosmmZtX5GBZMM0/7+2Q7CemwZGmJ/XCTxRKlmztOMMk4uTDB46PF7eAQ+2c
	59E4M5yfa+5Q2AzzzZYeJgKyA4rgodwE3exFSMOVjiYNbLaNUf0gNhSNtuul35Gsz05y6iJuDZ8
	e8FmAGWOAQDeRvr1sxGR9+NsrHxjVcrO4xYwlsihhA+lqbCpjvyXbAxhoTapt+gFgAXUQWAH1qJ
	LjVYobsMbPEPIUl7kFvKx386RyHJ6+u6OieP6XnlyuoMUEzTmDWYp5FN6buOo0r4T05by3UoMWw
	uIGrkESLRTZlZMcK+8lq8mMTyLVw/AbShSEJyu/O4tSHf04H9wpDne41iSQyMhMQB9xfQhoE41R
	6y5SgaauhPFuL1L1Otxp5QmH2mBtRWKZaRdsM9O0yWBYoOGIVO7Ol8JkNij/rA4NWPhxQcQ+FP7
	lR+bI0wyMJqJQ1P2Gxpq5B/sGp+F9562YfbL
X-Received: by 2002:a05:600c:3508:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4bb88826921mr147640705e9.5.1795288530817;
        Sat, 21 Nov 2026 11:15:30 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm194929325e9.7.2026.11.21.11.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:15:29 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v4 0/4] wifi: rtw88: fixes around the firmware recovery
Date: Sat, 21 Nov 2026 20:15:24 +0100
Message-ID: <20261121191528.591334-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Fixes for what a firmware crash test showed on an RTL8822CE, and for
what Luka found in v2 and v3. Patch 5 of v3 is dropped, commit
3f2238709f5d ("wifi: rtw88: clear RTW_FLAG_RESTARTING on stop and start
failure") does the same.

Tested on rtw-next 0bdc579dbfc2 on an i.MX8MP board with lockdep and
kmemleak, with firmware crashes triggered from debugfs on the RTL8822CE:

- patch 1: no reserved page leaked after crashes with an AP or a
  station interface, where rtw-next leaked pages on each crash. The
  beacon update work and a WoWLAN suspend between the crash and the
  reconfiguration found the pages
- patch 2: with the firmware TX reports dropped in a test build, hostapd
  got a purged client probe as not acknowledged, with no ACK signal or
  link ID
- patch 3: with the collection held back in a test build, a client
  moved back to AUTH and deleted in that window was skipped
- patch 4: no "sleeping function called from invalid context" on a
  crash with an associated station interface

The regression tests on an RTL8822CE, an RTL8822BU, an RTL8822CU and
two RTL8821CU on both bands passed, except the 2.4 GHz beacon test of
the RTL8822CE. A neighbour AP's beacons pass our TBTT on that channel
every 157 s, and the beacon loss over 330 to 400 s is in the same
range with and without the series.

v4:
- patch 1: the pages are kept through the recovery and freed when the
  interface is added again; no port checks (Zong-Zhe Yang, Luka Gejak)
- patch 2: the TX status is cleared when a frame is queued (Luka Gejak);
  Reviewed-by dropped
- patch 3: stations without si->vif are skipped (Luka Gejak)
- patch 4: no change
- patch 5 of v3 dropped for commit 3f2238709f5d

v3:
- patch 1: no RTW_FLAG_RESTARTING test in the beacon update work; the
  page download and the page location H2C do nothing while no port is
  in use (Luka Gejak)
- patch 3: new, rtw_iterate_stas() cannot skip a station (Luka Gejak)
- patch 5: new, RTW_FLAG_RESTARTING is cleared when the device stops
  (Luka Gejak)
- patches 2 and 4: no change
- rebased on rtw-next

v2:
- patch 1: the beacon update work does nothing while
  RTW_FLAG_RESTARTING is set (Luka Gejak)
- patches 2 and 3: Reviewed-by Luka Gejak, no change
- rebased on rtw-next

v3: https://lore.kernel.org/linux-wireless/20261117171003.1840491-1-mehmet.fide@gmail.com/
v2: https://lore.kernel.org/linux-wireless/20261116072014.1142494-1-mehmet.fide@gmail.com/
v1: https://lore.kernel.org/linux-wireless/20261111213239.569224-1-mehmet.fide@gmail.com/

Mehmet Fide (4):
  wifi: rtw88: free the reserved pages of an interface on firmware
    recovery
  wifi: rtw88: report the frames purged from the TX report queue
  wifi: rtw88: do not drop stations when collecting them for an
    iteration
  wifi: rtw88: reset the stations outside of RCU on firmware recovery

 drivers/net/wireless/realtek/rtw88/mac80211.c |  8 +++++-
 drivers/net/wireless/realtek/rtw88/main.c     |  7 ++----
 drivers/net/wireless/realtek/rtw88/main.h     |  2 ++
 drivers/net/wireless/realtek/rtw88/tx.c       | 25 +++++++++++++++----
 drivers/net/wireless/realtek/rtw88/tx.h       |  1 +
 drivers/net/wireless/realtek/rtw88/util.c     | 23 ++++++-----------
 6 files changed, 39 insertions(+), 27 deletions(-)


base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
-- 
2.56.0

