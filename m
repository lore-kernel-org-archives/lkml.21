Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081888;
	b=GZXa+JIa6rc+vce6y+jJe/b9LsAGDR5lUMY9fKjwOdws4ya+ZQM9pxb1XShPDjNug9gh
	 397SGiktaZp0cbln+cKdE820zNfB0LM99CssVSYMQtt1QYKFtJgWGBPSD+vBRrJUg/1ko
	 g6HPmtsfYBPIa0Bv1gWWIK6KdknDNU8kPTYVww6ZXRatZ3YZSh93+pct58iDNVPpLNNHL
	 v13jWsR0xqDIrHoQuwW2f8tp2JA7BaYiu/usmFQSX8CyiwSYixiL3N6Ka+uE/HE6V4git
	 BM9wQdjRsjaJy8gXvbXP8zYU+3X8P6r0CUYM8vw4j134g5kRWxywP7gVafuwp9lDOTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
	b=AzukBY+dva2tvX0cB14lvoE1S/QnQ4fYNDVKgQeKbrZU658kYkLOaF/Uhu2+3msgm6Ix
	 E2Durzt9Zt1Y6+wdWg9OghGT0RC97KBHlW177lQjSH/42ZCmNOyiokExj16hLgeKOT5KH
	 VWP4aU2GHQqPbjLHJT6v+yV8Zf4ilyuw1THonK0DegoS+iR1wevBnlWBBywT/Ync4pGbo
	 b//zqu1bq0FFdgt7BENGibmKn0lsd/w3K5Qc9fyOzZApKqD+2pLkX9sPyKSADE2wzaJTz
	 C3OBhXV1RGJJIqh2S48Ov60X16yNFj2L+PVXrLQnQyn68d9uMw3BCfsNpEX1MCxtAZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=tuT5UoBr;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6E460A262B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D6E460A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=tuT5UoBr
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so611967a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795081887; x=1795686687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=tuT5UoBraM7XADG/B+vWLbNmwJGNEmNaCzbPRSq/rt3g6pOqHbBtGLQv7O344swf8i
         m9hEtpaZN/9MqKHcbuqaHH+hQQBks9WlJ05E9e1BVwdTevrDWHUPWlhb745nVNmcB+rS
         s1Sq6aCJuYJalnpoTCtudQN169ZRKGb0qZxA0nVlyFM4U7/CIAs90tc1t2Cl6m2JvZZH
         SdmCLLRacQFAdhsKvKg9eYO4XPPJ8F7s+1Xwr9FAgLA9VlQHByko7ZkVKzBO1Bsz3jLc
         4zrq6pbkt6NZMaeUHgxPtbFH2eYoQ0qt3/Ax3C6DAaxiO/EovBzzfgu0f/zy5QMYy4Iz
         nWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081887; x=1795686687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=cjwDGTuNHLaAW/cAYH2odPyfWKVkliGUDN4ZPhJCEP6pa9jMimNIkBZcMQ8mecu39y
         MRRKIOEK9raGDRnjP2w3iV1GnRkfk5gRug7YtgD6lz/aL31D7NP/YFI2Kwis+vri7dRy
         LfWIoXc4f6TKF4jAQv+Mi6OPM6/Njp8Z3tRTcNvGF2/c0ZPTuTgKiE3rWTxBB2xDlGGQ
         edoZtB9OT7qiT9ULr9ioOcaFoApHgnaryB1o+m7swttTYwWTy0p/978Bx53lxJR3Mhj1
         sY98ZSeODMWthtkwjKf4aSGie0zFHaL7bKAyLt/1eWQAZ1oqKcCfwYCG9i3PWZuqH2rF
         epMw==
X-Forwarded-Encrypted: i=1; AL+hErFrMWwIs1gYLDYhoKg90SQIxNEcp2o9+6bruh7Lwyxbr1Bwwfo/WiEXVan1KUEiaC4DZDwY2tLJTEtMOXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PCEfvKjGRtMeGyM12t3H5NlVi0zHC4ACj7SATpL5mx5wXaL70
	cRUfchk4zF3DLfQZvNazeaIbtuffBtFNWuo2JJmbNOw/C+VYVh9Lkrip0Xd60ErWCzw=
X-Gm-Gg: AYBFou0ak8B9qIn6ANpL4/9j7geBpJBQKqInrzM1xN5O99Sg1vQFGloBi7AP63FhywR
	0YaGN3nVsY1O9ewpcwnrH/ZzwG0A69gO69v1zVhD8/wv9eLEvZZnM3VSob/XEFd/dKnULUiiUhT
	h/sIX4OiER56N4DXnG/gDlM0uhGfVWgqC/KD6V7WiWPPe9ZicQ/LLjpxPFLehRYOOAboiK6tYUB
	H/IyzNLd3VYLeM5Y8W0K+OnS/LUTY4M8BEKlPSmlReXZzMn85T82k00xWMb4duCyNm2mwSD/fwb
	VeR76qXADSJH7yvdrMLCPh+1T8Id4FDD7c6bjZSU5G/uFSwowyEibJXDGBmfqSuXjHS7LzELTRQ
	huaThQ8Dw3ciYmBNguHrC1e3j8l68ud7yDqVVA2Lq6OwEuSIvw3LMPeIgXBc1tNXQd9nrwjm7Cl
	+kViwAGAT2DxDGMw7vGr1DRu5avg03UTBthtXD1iRl57Hk8t2mIlo59sT1RbQfx8uha+eE79XKH
	wvubZ9IohtyEauKIl8OnAk5vqWqz6EBTtZyWoX27pvfLj+jjnsWgmijsFg8SpfdaCsFgj55wfck
	I2FK5N95G/83SHYrundHrI4Gla3E2e/t8Rx7ob9VFzZOKeCDpmpXxHzgXKUC/USKeKRKzx/A4KK
	ukvSbtL8PBGc=
X-Received: by 2002:a17:907:36f:b0:c51:2497:c64a with SMTP id a640c23a62f3a-c512497d81dmr169697366b.48.1795081886833;
        Thu, 19 Nov 2026 01:51:26 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc213sm95057166b.12.2026.11.19.01.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:51:26 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 10:51:25 +0100
Subject: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-b4-dw9800k_cleanup-v4-3-df26c431595e@fairphone.com>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
In-Reply-To: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795081884; l=1266;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=mcLSV3KKUJrX2Vt1xs2+yh4YAv9r2QOuUzb8TrvhqBU=;
 b=CQYSyNjBO0Q/zSTuxeXLUaV+HvnPHo1DxvGi3LDOgBjJK0F1h6E4ABmNBlYJUC/6ZLjkTYYtZ
 +LHwZi/bm3XBFa/c3yFLbAkh37pXvffc998eC7/JZuRzWEqRvCwkvKu
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Update the node for the DW9800K for correctness.

Now we correctly select SAC3 mode and enable timing-control with the newly
updated device tree bindings.

This is a breaking change for a part that was previously functioning,
but only due to manual register writes in the driver. Now that we have
the correct documentation we are able to update everything to ensure
functionality with other devices using this part.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e2308abaea68a6b31a7e387881bf2..a657a5dcba9cdf750fab2478ca319f3a592ea295 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -665,8 +665,9 @@ camera_imx858_dw9800k: actuator@e {
 		reg = <0x0e>;
 		vdd-supply = <&vreg_afvdd_2p8>;
 
-		dongwoon,sac-mode = <1>;
-		dongwoon,vcm-prescale = <16>;
+		dongwoon,sac-mode = <3>;
+		dongwoon,vcm-prescale = <0>;
+		dongwoon,timing-control = <16>;
 	};
 
 	/* IMX858 @ 29 */

-- 
2.43.0

