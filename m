Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729493;
	b=KCRX9hnmn4q/xINHWPrLh8TD9N2sOzVWcoaWULEEHdkB/TqPg5FMnSt8UBnx3pirTOsE
	 3axcYrWtyDZVmmEa3Tn8RaOCweVu7dZs3pvb5BAv6xMnq/LAL7fZj7r//dLqUKwBoAuGT
	 IkAEaKEwjXqMgXq1pg6ysvDZ+zHsuNyigk6fjfniEI1YCnicH61070MdGdDaRw2k3F9Nu
	 j9YW1+ahR/lFF0yFeestboyIy7YZVkvSO31vKQyTUYA9LmSumpSvW2saaUBi885bf9Sc/
	 p3q3Rxor2UzFbThy1/8mnjt9Zsi5cCamxKkm72Yhqz49NNuoQ0A0qbBP3HOM9B2XwzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mLBiJ3Y98YIzDtQw/fAmF2XOq735TmDEhRo28kTS8fQ=;
	b=VfFYC0itekzdxWa3FCccje4JkxIE/GgVs1BzMsvfZbRAWVh68mhOmao1sw6A2/+ZFvDl
	 rkj8Ddw1NaKjFH4Y2cH9Z/zx9NlOTBxDpl8//RK5jyw+fPLJc1PqBtIkynpBureS5rYJ4
	 l5oS0034znHt5mXknRoZQtPECBoDMBV/6qc60UY2zQ2muqBzwzLsJk9nTVmLj+BCd1hru
	 FYmbh6R23PYToXh+vMPTnoRKD6Lr3Rx0Tpj8DdmEjMhI1NQ6+OtEtrwXL0a8/xhrRzy0v
	 08RTGoJ0XM7gtfTBUy1xEQbKR2qu93MrljdTF+9TFkACmpSlTnGTBB+IXt1fvpTsUcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FB7dSIsz;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871E560A2634
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 871E560A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FB7dSIsz
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so4677471f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729492; x=1796334292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLBiJ3Y98YIzDtQw/fAmF2XOq735TmDEhRo28kTS8fQ=;
        b=FB7dSIsz+shJ6ZMZjgVqAEfPd2FOmoK5oswNVtCB9UIK7hZM9CYTNnOiQoZ10EbmCd
         Q1rZ23s4jNGKVcAL+4tZ+ghPDI/ssNlXfHqH0Ec/nOQelkS0YVAHkcyZFCIk9aDxycEq
         BdHwm6YkIhdgMaJ9wfK7emsk8oAyZjCDAlWzC6pQ1FsK0B4PoBVUUsVZkSPhX8Q3YXW9
         hWyBFrgBkMx9OYHSCXan1mmbVRH/FL031Plni6a5G+VMhx9KGvz1W+VHPanth2H7011s
         uNvZnruVHSHpKykGkEuqmIONPfQedu0EN+ai7+kN/fGTjTgdmjcfqcxKrFoW9l1PClaK
         7jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729492; x=1796334292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLBiJ3Y98YIzDtQw/fAmF2XOq735TmDEhRo28kTS8fQ=;
        b=e+8T12ZcCORMmmsaSemB08FhZRBDTWsCDcnU0llmD52K2jAPonzhwRmbqJKESCoJV3
         ISMUvkS8IAkp7bOUzFn8Eabk1kukcbTtJXt+XxEHJhl8Pc3ZG3Krn15Te4Pj362B1/EP
         EbpyHuHPjh7Xv3DIQsZhazsy1g0tX+VsVi5RqcmUQHuYT+SjhOg1OFuOJtjHpLzp+BPj
         s0vYdHFPlSkp3t2bFY5iHUuS3o5F86+N5Q4fgFTjWZq2FDwWb53XFi4Xt+k/7NHawh9A
         6qv7WOweLPjcW+BtIHmnLffV3lIkEQuehk9zUf7KAUx18fMxQEFpvR0dqoBJRoPFLN/c
         Armg==
X-Forwarded-Encrypted: i=1; AL+hErGvPAwOL7UdKqOOM91S4k/yAJusbgPTeCYEBD+gxewuaFyR+VlI9AV/ddKUGieQu+8R3t7v+U5Wt2w2oDA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FCJFWsh4ppfmw3lhoMF8gEuDBO6EzIpiHYzWQUAU9sWy9gdPZ
	02OPdG7e3W2DiGi0EvzMxszkOr6jpyHdl4VsH+EFP7f2J5l3Xnz+Sogs
X-Gm-Gg: AZFdTZessskzjnc2NkNX+qh9YG273h+cMRBC+2Iv9jX2q4cc/gDEPsasaiLFg2cQJIS
	fu0+bvLwdk5aTZ4R9YYOgcO8pRP44wgVAruSoq6ETIqx6jn0fGHRvIKA6mJFVSc7NZVGYJoqKiM
	MQZUULH2UBEEhBOgKZnCPpbSF5s2knCJoqQ3Ebmw4572zLESWVXL6f15B6ZszxUU44EvYv3X/rG
	3NcUSB9SvyNIxvFvK7MpcDDEbwQkUUJnqIqa1M2ob200zjmc/v2RpqsOZ3DK5V9zF8h4Go6IFxD
	0y5GGQxA5Th5LHlEzbbuGk5miUZINtfLm+Hha924tfjhVcjXEJSf9K4LWcSMnCp5Rseh0+CFUNJ
	9loH4Stf86uxID0fGYoZ7fg5elm9tQ4fenRy9beoZiION9S9etUJoBd4vPldLTcIlb91r8xxWiy
	4wOYtfAUGhbyFeBQTVMZAoA6GKSjfxppgGE/TwHiaqRFA0Ktzddir+hSb3An5SHuVTAhvzc0dMi
	jaO2h4LCTJ54tShVCrPsXDl71/Kr/eo43pGGP22D9soYfqQSqKkaqUGMpG74PuMoaM+6aumfndK
	9vSSn9KvfUQ/vaQ+fwaRR1BYQOPUtQ+PXwFI9x84nhb2EgAcGgC1XPcehJUA9gfuUHvrZcozVXx
	j/bkOad9+YNNPYYsutk3rLIdn5OIfeURK/V2XZE8/UqDM+G9d4Yj6O81VfSON2qQh1RZcmfdk//
	eHmn95T7c2/VE2LXcv16xCyBvGsv6C5YTuwC/IE3ws6Wg9iMmSzGVNAHhHqb9LmMYFYv1fB3Ges
	rMqOzasDnIASG0w3QFLSQ5Mz/Qxxwm87fHZjliEgY56I2vA0SOSnzXhiOs8eaHW
X-Received: by 2002:a05:6000:2c05:b0:4a7:ed95:7c9f with SMTP id ffacd0b85a97d-4abb19c16a4mr44426780f8f.22.1795729491930;
        Thu, 26 Nov 2026 13:44:51 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] drm/sun4i: Add compatible for H616 display engine
Date: Thu, 26 Nov 2026 22:44:31 +0100
Message-ID: <20261126214433.3562326-10-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

Enable H616 display engine pipeline by adding respective compatible.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 248be5ff4f36..18cd9a993348 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -442,6 +442,7 @@ static const struct of_device_id sun4i_drv_of_table[] = {
 	{ .compatible = "allwinner,sun20i-d1-display-engine" },
 	{ .compatible = "allwinner,sun50i-a64-display-engine" },
 	{ .compatible = "allwinner,sun50i-h6-display-engine" },
+	{ .compatible = "allwinner,sun50i-h616-display-engine" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_drv_of_table);
-- 
2.43.0

