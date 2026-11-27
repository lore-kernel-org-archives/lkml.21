Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768607;
	b=TrdpFiqtZwEEj9xQ0VOU8r4BPXL1muy24RGKN08q2hpFuoFekBM/yJJ0l+VMY6NqHpUh
	 b9y1+EP1uT0UHNHnQ4l4DhvZ11bhXL6cXZ+S4tDPDQ0LYK24QXbh+WSlkDT1y7p1cDRfl
	 gRRY+0dhF5SbPQSigtTiW5He4COVYqNqCfpL1jYjX/Q5O5bv4aEa1Xfy/dp6sz5o+8MMV
	 uPtfxUio84TDI70/nMXnfPeh1LDQ5wop8O/0z7LevVjJmncwFqrMzaf6Sc3//iJFpJk9H
	 N3I/VK9mcETLDd/0eeOW/8MZshinkivjjCPdoGe0vjNA3KyvVHBPsfqePTW4q0dGaDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Db+joe8rpw399lL58pGgMb5PYNQLeC5tKwj9k0QIVOA=;
	b=LKmQ9yZTLaYwNbUyWFM1NXq6nH6jcKd5BDTBVsYJRv6U70YVE0sEJ8JXKG0o19w3Oxfx
	 OeNrNkPZBDKVJ6FAL/X56MyyjSVuKpBOBUMjws7R8PWMcAaWUjHVDy/upmKv4NBkJUUHO
	 7IpFbTHR0WIcYTdUVxIDDgG+wUbO7n1/PSO/m03RK1zWGLj0mGXKPsuBshSt6hJGA31z5
	 WfvGc6pMG/VvRhj253q9BA69CgmGEAl4AWJyGKqYddwG9p+j9/536ZBsR3aWIVJtZgenz
	 3YWiGpsCI4f/OIrY7pvI5gdN2uMhvIxd2uZv+ZGcgLPzfiZilXLPRN50ysMmjTsTcJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K914BApr;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864D2606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 864D2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K914BApr
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so50958615e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795768606; x=1796373406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Db+joe8rpw399lL58pGgMb5PYNQLeC5tKwj9k0QIVOA=;
        b=K914BAprYdabZwltvD+D7iBmXnO1hjFFIlxPoORHYa0kJgn+V9Gfb2lEm2wO0dGyAO
         x/QHMYNxJI3CxeLZ95p9nvJAEW49GeMMhPS4h71jC9i1+mWBDkQKMhEPH78JLZCocFgq
         2UxM1p7VPVmkKIowcUFcwPkU2UmVNNkniX3Zz5Zvss4U3V71UnTL+IEYXHrtWh6o9rmn
         gLd/HFpWF+3CWQKmcElu81fIFf3LmzDa3JPRwMvmTrqEcV2Oropq8YmlCno3F6TgYLnD
         /9A3Ho6Hx2WIP1ME3wn567SrYexhAqbptVPhRv6/p+AHaj7RTnltDvGz0Tn9WOiE49vk
         FOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768606; x=1796373406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Db+joe8rpw399lL58pGgMb5PYNQLeC5tKwj9k0QIVOA=;
        b=fGDz5driaofUnR5jzg86UCBdnP+haYknmPaavkGof4ySVlp/qxNauWzfNR5+4++sRZ
         z/RgH6aulWAqeZPaXcnkb/ExDLj5ebauFQ+/hyhIlJTt24qp769hbRk3bEas+hKgGdl0
         5bch2xa+xjWEUBQkspFfx/f0E1wgVM77o72Jfbua9oeHrDQuZzJ+Ltutvea2YjAKDHp9
         QcqFlRJirZvSq3ScGgCUBI0BcDuxNkn6QADpfJcLrMgxdWEXwIEtkD9QZtykPgQhb8Ej
         q15f26yILzZrgq0MjvFh7BW6YWpjlmHBZeMiiyTtBquTAQcexEVNcjm0YHTtA5736xO2
         Wesw==
X-Forwarded-Encrypted: i=1; AL+hErF/sF/GpkNOWWSV9D2423DhG3/4j1Oqx/fGSCt+YfO92O+D3tsIjxOxv1Y21H+CjtOGROTl+qWbILPj31Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z84hkwelI3bT28kv/rzvVF2khYeCMrupLHRgP6tyT13vi8l1LSv
	O/6/szEpWVefeXnNAGQJqi3tKVp1JvqNlRqMBKgGW4cfWaJOqJfKezAWsrFgtQ==
X-Gm-Gg: AZFdTZewAJIKeQhccl/JdssjD1DnOfMhlDvSwilzKf0fH39rsTzujP6EMJ0FQTckgEK
	VD42BGC9NDC9AyQLaC4NG4RQj4SoICO6wovdz7zC1TaeD0H/wJTOWGD8ZdFgksOxxELEDnqV8Vw
	OjMLkOvQUMpJF0EO8h1Xk2d+dmmyRkquzC+nid0OOhlMNOxvnAqR3UDiW/yp4945L7Eny0kpf0u
	bHB7axxDuj4dpqMxvZJS2wyI9/HeIJ4+CD0LQXhJCyHnaBd0XfmuyWBwjPZ20xmokuq2qI5PAOz
	IaUCNn4fyBwclvmtmETmAAGY1rfxOBxhdXUO+9fcjRoZU8lEt5GEuWTZ584Tv5J0FySwNsfvpT0
	P1Na5srMHJjHO/r4JL4YhVRpDHstMPGkVqktDs55ite+XXxe76CiB7LqOkBDHeVfJOykzrEwQtI
	X4aTMO0NIVxjmFINrcbo4OZ8XOq5SbVEdmQeZph9v/LkN7sBQd2t7DPppYM7p7AAM4ZM4QyqvC+
	7PhWGG4oUsfotiFJFVQKcLes4XE7blq5Y5fBx5nTXoLs7LCnkmAlkzbLQbB56jZnSVIs68aLq83
	tSL/tWFXwxMhpuGfQk7+jeJpYdt4o/BBc60wZJHs8mynBtDhjT+TLjLQbgmuCCviQBv22I8mknR
	TQTw=
X-Received: by 2002:a05:600c:820e:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb887c9936mr468832785e9.1.1795768605767;
        Fri, 27 Nov 2026 00:36:45 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:ff94:bbe1:5ba9:635a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm820464965e9.6.2026.11.27.00.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:36:45 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable RZ/G3L LVDS driver
Date: Fri, 27 Nov 2026 08:36:40 +0000
Message-ID: <20261127083642.131486-1-biju.das.au@gmail.com>
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

From: Biju Das <biju.das.jz@bp.renesas.com>

The Renesas RZ/G3L SMARC EVK uses the RZ/G3L LVDS driver.
Enable DRM_RZG3L_LVDS so the display works on this board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a22..aad8ea31c76b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1057,6 +1057,7 @@ CONFIG_DRM_PL111=m
 CONFIG_DRM_RCAR_DU=m
 CONFIG_DRM_RCAR_DW_HDMI=m
 CONFIG_DRM_RZG2L_DU=m
+CONFIG_DRM_RZG3L_LVDS=m
 CONFIG_DRM_ROCKCHIP=m
 CONFIG_ROCKCHIP_VOP2=y
 CONFIG_ROCKCHIP_ANALOGIX_DP=y
-- 
2.43.0

