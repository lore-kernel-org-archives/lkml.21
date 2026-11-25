Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643896;
	b=nSR+5es2ODJoF2trDGrOIR7dnN6sbhG4ff8GE0gAsRaLay8wN46gU+eZnB3aX7nTBVz6
	 KCazoAn0qs5GVhJHIy9YIdjFnoWqCYzkSu2NnO5O32BQaOoiv7xRW1zopKYSwocJrAYeA
	 1V48p6BES4o6qACxKNtcbeuwriymTXRpWMD3mp4cAdht78/exlpu8thq9QNZENz4/DTgS
	 /aMs3rjtUQqibJikPFSK4hiUOowgkmwkZV4yJUqJ7TKrGw/2XeZ7OzrZjZTw3WQMy25R9
	 r9vF6bxCaBa16e8sfSvHftyW+HCDey8iMQ0Iuh6eCt8Uv4gHWXtBXj9Y4WWb26xgaCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OOGMcpRscnB5zpQyjujbICDtzLr0MBrEJ9VDi4/JVl0=;
	b=AkcuYo6AFYeJxVzvLlQOvmCMv5u/oBt3riadQlwfzPtcXO4HqXAie3XIa8K4cHYCyg4d
	 ap+hPuuR2zUnWtWZwSIuONJ+eo/nwN72ljklxS3y0Q6VOEzejHTI4YaD9z8VA6z2GRF5j
	 j7szsTgd3qR1cPNLSA5ETL2cftaCpksJyz2e1B+j2TnfmouR8BCLwMoN5oMxPo4Cm51yl
	 KlsSfHKWuZiSOhLNZodslWvKfW+zwlfFpi+nvKju/nX9rMpVREWktnfCjK92A/KP0Z1qk
	 VTzkq9w2rDHMoseTRpYJ9sCSS5NMEkrNQhm7321Pm8CzPmfWOvff18jlSehSseq40ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yDlzHdhA;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3D4606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF3D4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yDlzHdhA
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f037bc348dso51430625ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643895; x=1796248695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOGMcpRscnB5zpQyjujbICDtzLr0MBrEJ9VDi4/JVl0=;
        b=yDlzHdhAJVGVrDiaX2oqMTi0zvNl9pb30GBAtz68OThzpfQFvs2K34+/R1Qp/LdETy
         TswJqqabd0Ont/FKq4sAX7A855/Om4XHN/j94RlzwzN6rCC9cI5Cer2ZK46iHjsuW10E
         TWz9rTOOAGWgYSHi72B5XVJjBjR4IljR5L+sRCeIgrHxLEaU7CNxYTmfVnBZrSlCE8cW
         prBZhV4PFQ4rW+HsfDERKM3ldvuoDowTbjlvZDZxgeV7tEQOgRAHcvneQNV2tmr8f1eX
         02Lk4/gMhfCw5qMl3Mh1Qz/uGdQ1aIe2qU7HxSh/6Lsa/YVE/c38RqyddL0rF3WMTq6Z
         tT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643895; x=1796248695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOGMcpRscnB5zpQyjujbICDtzLr0MBrEJ9VDi4/JVl0=;
        b=E1kkBcAgLNxkZl3wkEYYNokfjcBP3nC0/v0Uj+2h1BrSXOOX19ZtyTkJiLj0STLVD4
         p4fz5b8YGHGBTQFNReeW27iuPo56Mkwjlp2qubE88WFQTvLGV6Qrjg80OyhsvXVpmG+l
         xbyAIgEqtbBS5LcoX0fJM4QUO6CRa6Vcjm/CYYB5X/+dglt09rrexrYsfpIbThjwnOak
         W2N6uKsFIESrt32nwutIufBvz5JX6jDIUnA5X9y7JdVXhgCYDGHsh9fEsc10/xDhUSRg
         RvwsUGra1vsnw8j1ePCWFOxbFvPXvmaLggfhk7PcUsNmNZDuZJwG8A9w7kL22+bBKGzR
         9cSw==
X-Forwarded-Encrypted: i=1; AL+hErFJKfBHp7r/4zmZwxdhWL0sT8N325oEg4+YezinGQmKT9s/1E17MhkHSuc1TNgRNzZvDi0ZGJlq3ORvbWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PbS9x9AaXA2SLbw/JR1yjx6vQbTl8Xe+C6fTfd19WLUE0r2Ys
	UiytHA8r41SF0O8E6abiV6oNzjolqMiPHb4uq2lm170mSkuwiNZR0/IY
X-Gm-Gg: AZFdTZd/uVPDtqeq+SN9WKFIBiZhPEhH0dN7r8G0NwS/ie0qjWx0Q+vrXLQyDm818b9
	FboKE1ACqRd5joyFW+OJ95Blcj59xhSgA/RbgApXt0R00YUErTvuy2ze9dCVPHJSmZlN2J7BkrI
	Snst51//vQ3fOPwvQuY2RdDA4vJeC+p32OQSWXpkiLulmDDz+HTfxzgYIsRq/s5iL4uEKXw1F+t
	l9We4dumLvYcQEIMrKOC5dkwEyf8v0Up75MjkGuwNBwCS0Lg/BqW/SZT6GQ5UBBAaSZ73f8Fy9D
	tnP4t/Nm3IbueysRpd1g9MxccQv3ZO5IXhBGiGV9+8pSeQ8eOXEyNc3ZT7Ld1u4X7aFQ8p+e2OT
	h2J/RtVyaL1w5HVceTSiTNn+gSCMWNkhCpyZmLvAiuKnxEn+ZcdSaRMIvVNoWaEytBolJs7YD6M
	UY+u3OfHT2TErEDWhQyOPjMQZwXuZlzFAeGJonc9jKxnLB/hmU8cV4n4CzAPp6axoZI1su+m9F3
	nNojdRC8nKHL96plqcdHN9wg6irFz73IJoX5jWxYm1CdK9APtWGD3XXuen1lYAHWLW0VyEv8PP2
	PvveEhTjCUKzIzuoj/7OFd745/BkreeM0bFGSKPliK+IYAyUQMsOqsoAoiZNO4BFZLiSNwq7ZlC
	aGg/u6CxJ49HlM9nLThz4uy2yh7YD5DLizi4xmYr7hNs=
X-Received: by 2002:a17:903:a8b:b0:2f0:42b6:eba8 with SMTP id d9443c01a7336-2f042b6ef73mr185236595ad.27.1795643895211;
        Wed, 25 Nov 2026 13:58:15 -0800 (PST)
Received: from localhost.localdomain (74.82.221.43.16clouds.com. [74.82.221.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm91547365ad.3.2026.11.25.13.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:58:14 -0800 (PST)
From: Nikita Ivannikov <www.nextry@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Chipang Kao <chipang_kao@asus.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Ivannikov <www.nextry@gmail.com>
Subject: [PATCH 1/2] platform/asus: asus-armoury: add power limits quirk for GA403GM
Date: Thu, 26 Nov 2026 00:54:30 +0300
Message-ID: <20261125215431.120307-2-www.nextry@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125215431.120307-1-www.nextry@gmail.com>
References: <20261125215431.120307-1-www.nextry@gmail.com>
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

Add a power limits quirk entry for the ASUS ROG Zephyrus G14 (2026)
GA403GM (AMD Ryzen AI 9 465, NVIDIA GeForce RTX 5060 Laptop GPU).
Without it, asus-armoury logs "No matching power limits found for this
system" and the ppt_* and nv_* firmware attributes return -ENODEV.

No ThrottleGear XML is available for this model, so the limits are
taken from the GA403WM entry. Both are the same Zephyrus G14 chassis
(31.1 x 22.0 x 1.59 cm, 73 Wh battery) with an RTX 5060 Laptop GPU, and
ASUS specifies the same GPU power for the GA403GM: 85 W TGP plus 15 W
Dynamic Boost (100 W) in Manual mode, which matches the GA403WM
nv_tgp_max and nv_dynamic_boost_max values.

Tested on a GA403GM (BIOS GA403GM.302) running 7.3.6 with this entry
applied to the 7.3.6 asus-armoury.h: the ppt_*, nv_dynamic_boost,
nv_temp_target and nv_tgp attributes are exposed with the ranges above,
and ppt_pl1_spl=81 is rejected with -EINVAL. As on the GA403WM, PPT
writes return -EBUSY until a custom fan curve is enabled; without one,
PPT writes through the legacy asus-nb-wmi attributes are silently
ignored by the firmware, so requires_fan_curve is needed here too. With
the custom CPU fan curve enabled, PL1/PL2/PL3 values of 25/30/40 W and
80/80/80 W were accepted, and ryzenadj --info reported the matching
STAPM, slow and fast limits. The NVIDIA attributes were only read.

Signed-off-by: Nikita Ivannikov <www.nextry@gmail.com>
---
 drivers/platform/asus/asus-armoury.h | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/asus/asus-armoury.h b/drivers/platform/asus/asus-armoury.h
index 331c3bddf013..33b3014815a3 100644
--- a/drivers/platform/asus/asus-armoury.h
+++ b/drivers/platform/asus/asus-armoury.h
@@ -1395,6 +1395,38 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA403GM"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 80,
+				.nv_dynamic_boost_min = 0,
+				.nv_dynamic_boost_max = 15,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 55,
+				.nv_tgp_max = 85,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 35,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GA403UI"),
-- 
2.56.1

