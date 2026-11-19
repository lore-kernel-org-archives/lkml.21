Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096492;
	b=zMDE9et/WWMiy2osxVKdq5obT3VeCZ71ruEuOobM+0optQ0qBWxk3No2BWnoQMAMuh1B
	 N2Uoe+KJWOHK95wBWTEwGQcT2t5rmt0XPxRT51ydrqYCbiU57nPmBm4bqld17E658MhyJ
	 JKlZG4WZ41xW1uPPE01zsILKJubdFTFUS4BVlwrBWWYdv/PTptqDo6Yu80ilyaihXQvRt
	 Tvpxb9SjYPNuorMqbIsMjQh0fToIbG8aTS7gXeTk/4+wVJ+7ORbqty0stb8VK3qNJKOfA
	 umiNEG3cxbfbTtnIuN54JkccLjyz91m9M7HcB1RA5NHrAHA7I1Dhhvb6dWKrOVhMtLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fppy/ckcexGy49EMxxyWk/oBKj2HMd7yOzhiBjOklOQ=;
	b=3+oKM+rTNPj91gefVCB+z295fQZ/emgQrHpUtNtErjiSnGpO7PcX9pwuGCM9MtCHuMYd
	 xcL644dMY+HTgNsM0RNCUHzs4+HvQ6uP/G1W0D+fQ13xcc2VYmhS16CYD3TgkIdTmzyeo
	 DNUw+cfidvSZTOeX7Ys+m3CgmUtA4aNtcQbWxApw42d2/TfHXXZBpFELFHwaUOQa7ckF3
	 P+iMYJscc7he1mC7oLcfjuQuHmvmFWaXgImC4EGqZKAwXXwfRLUmu669G950qx/roB2bn
	 3NHrRdbfcl6WQtu+cbHHG4+1ldLz0pjksbtwsF54dftgeedQhM6J2s7XhnEjmSnP+Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=w3utJXtL;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED3F60A2611
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ED3F60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=w3utJXtL
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c511c0e2826so210884966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795096490; x=1795701290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fppy/ckcexGy49EMxxyWk/oBKj2HMd7yOzhiBjOklOQ=;
        b=w3utJXtLjz8WlviGNw3pKMT/CGBNJtTtd3syRAvsHEgRWi+Ay4c1Ka+9b6f+wbiEJx
         7IpjqMsocZCGnSjjoqSBYrwD9Yffb9b55gQQDz0ihTZxWkwIwJfZjEDWOzkuaDjHdT4S
         Jco1rvwu9lQHIC+W2qA84dhIdpKsMJ44GhKrMAzlY3ztooZndFXS3SaPE/w3kXMA0kID
         RR7xHoJWUQmpqX89CMDEoH2k6f+kmA0h2XC1G1vNuPxcjd9aV6swEG1BgvDyqOax+gsH
         9RbQRwM5ccTGbAGBNAMq3FC4bTa74zbqy022X0IW5gKuJUGr1hL58PJlRJgXWQh6+PYF
         RU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096490; x=1795701290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fppy/ckcexGy49EMxxyWk/oBKj2HMd7yOzhiBjOklOQ=;
        b=vLvzM2NVDtmLDo5uBFt9mI0EkpcSmgqPtNpogsBbouFW6hjm5knRVWvNaYOf/KLuBG
         QVL8Js/ZiO6FyRm9U+PBn2RrrDrWc8QXrdqssAA7+shE/ubdWYDOZu/vhh70U2LG9s1c
         gaFNOsBZCZT17S5DFuCKpGUCAAYor21MjG7JSoqFwM2y2OGhznuaaKCGcOge7IcCUNHs
         SCD14dG9zXUrO7ae6OOVdf3rFffXM3nhwKwNDL5OuZSQWuDNIJgPpf+OXglxTvLuYRO3
         HstshM5b4fU21bkiauB+eoY021u35ZJ10BYwhShbVCBd0GsAGqNVpbd2PsE9iOOHW3Qd
         DCsw==
X-Forwarded-Encrypted: i=1; AL+hErFsfmoxuhQas8MPOMVptSDbvloJLxyuv8bofELWsFDo/p5zSWmQae5RWXzDfC8b5bZTyemQegS8SRvc/QQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eV7pxkBb12M5MZQlrPdDsArUl16fKgQfpHX7ZkBxSjXyPhIe4
	EwF3ANMZ3KORk3gPMoRHojm4vnFsz/Hte/O+f6Yz7Q4FpDXREHIlDFWWI+uOp4Bq/XY=
X-Gm-Gg: AYBFou1h0FmmSB7uFk7T+NZjKaTSArLmzFP1D6VHM6OEgkG0D3wxLEp0vpqOYFlwvW1
	eNAmWDL0gTBJraMqcnCNjUXDmOqNcC0h2a2ghlnjb6CHpqMqGA7XYAUf+hkkqBP6WgZn2PrYhj7
	E/8Pw/u/OggdJfE9e/tWW1N/oam8SNDPkzEbql7JSm5Loc86odmnoFKkSanAoZuXJtZ4lmwyLtG
	Kky8VmDUNENW69SzA7a/7JKtv0cqmp/LmY72DB9m3+F4VIZtDqMFjGn3rO2NacqdcwCiIoY0Cv5
	5XPZw9ONr76ELu3B6/xZRbjtzpBCkUq2TH/Oz6FpNIUEUpN58eSHdnLKnRbVDPecW8AmFvJ8mKn
	gs+Zf0W+Xn8aKGigYBoG1VR9jh+PTNoSxkiQx8ThN+zyxXNPdFFPOROTYplyTFPNrBkHms9cnNO
	eoBdnjsbB3TrLhF5XGRbl4TlB1wJa/LpXixfPPDkWtkHnWXiap3jhpvKMXnBZbDdvJ11PD4WSJb
	eCZIHquC+S8yDl0uFFnu0IcGNzJz2l8dm8f5I2G69SPHAN3UT70hSrwK2F89L+ZX3x3rYyQRoC4
	8fVCzAhjEWh5bMytowVAqVR2P3gWa2MPFpgLmP9Cg6aGOgMJjc+2hECxmBU46v1Fx9FmR6QnFVz
	/Oz+GWfQEtjm5ltki/gNJOl0sNpB58qZqTA==
X-Received: by 2002:a17:907:3d8b:b0:c50:5005:8ecf with SMTP id a640c23a62f3a-c510e0e8be4mr548781466b.8.1795096490646;
        Thu, 19 Nov 2026 05:54:50 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4d02sm106820266b.21.2026.11.19.05.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:54:50 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 14:54:48 +0100
Subject: [PATCH v4 4/4] MAINTAINERS: add entry for AWINIC haptic driver
 family
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
Message-Id: <20261119-aw8695_haptic_fp4_driver-v4-4-9d107334bdb2@fairphone.com>
References: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
In-Reply-To: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795096488; l=946;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=vimJ88gDAgrMbKiMPhlbLbM+XfYfImQrayboZz/gmXs=;
 b=4iAQ8jRN9EaanqlLNr+Mw6FTdAkGkFADKZfYNJu5jVU+OembBmy98dT8T5qtsaAlN2MVt79oH
 Bp09DN3IME5BvmwdcoH622KkaqIrLWbMaEzyCRu7Tl61FprnnvWFwBt
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

There was never an entry added for the AW86927 driver, I will take
responsibility for my creation and maintain it alongside the other
drivers in its family.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ca1c59e1fc5928b361a63e0b7fca6e95308ab8b4..f138ef76fc5cb611fd56bf1d2bd808985a4567e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4541,6 +4541,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
 F:	drivers/video/backlight/aw99706.c
 
+AWINIC HAPTIC DRIVERS
+M:	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+F:	drivers/input/misc/aw869*.c
+
 AXENTIA ARM DEVICES
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Orphan

-- 
2.43.0

