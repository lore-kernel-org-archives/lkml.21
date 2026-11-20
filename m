Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191725;
	b=iobyKScMgqTSB818uaZxsOAIdrmipRsgsWfE0I6SbyWn3dAUojTTGji74aXw1wtcio/P
	 V1DNkTBRHdXYwmzKir3raVjrxLJKoNXptF6bByC6huZtf5O82f7F/+sPij4hgFcSc684m
	 sXdTGZkAi57Qfyh6K6RZIiTvmj5NSXXK7d6GXb4vLw6bhgOrhREFnr7n9Vw45zTum3TbJ
	 UoLcf7A9P3oaZ7nEm80q8iOQGlO0fVIP+VOMVMjD1ggdQRsGjJuovXZU4ldTqqIYTywCa
	 DZjulUdXVScwzT/Kmysp+ffBInbTQsYkm+RT4ZAechI2jeXDsfEvskmh6/ImGrvx0DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5NkzGCohaIVffPUmVbi8o3XwRDdCSTTELA+pml42lCM=;
	b=INE/OEpBBYkbUXvnoGpQm9FLlO1JwPppmqEwzXiRrKoZmNqxdtWnTfr0WtgGjzEceVUx
	 QBIABMxdUyEyRfpylp6ozSU+4H8MBFzVUigRKJWaP1G+SdGAhvZlEgN0plgZnaZlUYJvK
	 4YSTgFODQNvuppyUS5bNzyg1QALKNt5ncfkxRIEbG0ENhmLrDwWhmn1TNcWT72IZNAWXq
	 tZVXJm2CNbCZOarhNcwdHbhtp0/HGcAG7XXwXCMSmynt550M6H6NBLq07vlVc7LUUPBDp
	 WYa9tJzzyB1ZbNByAPjBTISRXVEs9eqOFfnPlMcJg8jl2ZTKSm5gjYkNk4g9PAM3YRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OuaOZqg7;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D400960A2616
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D400960A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OuaOZqg7
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8028565e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795191723; x=1795796523; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5NkzGCohaIVffPUmVbi8o3XwRDdCSTTELA+pml42lCM=;
        b=OuaOZqg7afbEd1aFm1dAGau1ntKt7R5Y8qC0j+YM/CILLTi/KNw8xmTK5X2PVsH6kA
         NPpBsyQS8t4uTEaFs1PADVAE9WyvYUCAsZRYpavhYC3pDFL2xW9S/tB8jJ44lr5pmZS3
         coUW8S+YXCXTrk7C52M4DOk8AD6LzNey5X76aH4EH8l22IdfGnRpeFtr6dmAPqXUU9qc
         uvRmRO2CTvqtc8wEVEQjVimdF9JNJ/hMSC3nH/arvV1R6SB9FvYXNSDX8nEU9pXZp7L/
         VoAPQaqAntnJgZIAkyUnPYIb85nLVmakiPPi1G2Z46OLjKF9J9vovakhu+ZbDxKmrEyz
         JyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191723; x=1795796523;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NkzGCohaIVffPUmVbi8o3XwRDdCSTTELA+pml42lCM=;
        b=ZSxMhFDJVCDN03FoURimZ5YQCBLMtd6dwmb35nNjw3S0G3tGpOJYlQ0OGIRYL5FR2k
         DOv1tnYyifujFl6N5K4lWYLx9yc923zflsuYRqptymptxpcHYnBN4Y9653sHq2a1MjYr
         hX0ZtbpbussHWEyh6coGoNmlEi8T5QwZF3CLj/HoJLF+clyW5k7aYLv3tjixEfGA1sxp
         B98sji9dO2Jjlw5cXsci4u6eRG+8M9XvAT390y3Mp2rY2mUCHrjGGSyZnpFxECm6vcVD
         oaG7AhF7y1Qk9Ef7J2vWGLHSRSM8XPhwT2nC/SdoLMIp/CCcH9TOnIOOJHH+IsGT5G9I
         PqiQ==
X-Forwarded-Encrypted: i=1; AL+hErFw/fw9qnmhit5IuKp65ONQTMmqiID/AEqo/SXH/qwgepx1ivOlbNtZ8QDPoipEbTL2BQGCuBkHazL1LA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CIUNdln1LSBaNEn7UXbIKbPluUkne8XBoOcUBbjeR2sFNCDMJ
	HmptLkWs0fje9Y9BksFoHC09+YbGTyx0ZY7JmNCEafGA4R+qmPpDMEakbb+RAwantKo=
X-Gm-Gg: AYBFou33eoKFKMbnY93WaFqCKfHJQdanxDNVfIH66g4sOaBBNkfQOj5Qv7pnXMR6zC0
	h73d/PB6sg+YNBxdNs8rf5e+dYZm0wDdicvI9jq8oxvSEFYeUOObyJtVHHKPBOeI7aPK+VPsCMK
	d7TTLteeCjoXBvn7s898f6PCAEXgJPXAfBusNzTqQrSTWSLMmSMW0zNqtDKi/AyZ3OWRtzGbguw
	tY6iTN1C8jkSFzpQXNNGys3+qJYBJBMG4oWx2v7EZhauZ4iIgZvaUCQ4rHUCNlC5IVLrqiQrdL/
	Ofu2Tquw7uRq6t3APTirLJoZVgqhVV/DVyX5BeukEjuJ+kV8m4wF/dUfOtl2trZSpafr3Zf1Q4s
	mBVgX9Dc9YSQx+6t+a6NoVDa4NA2ej5BbmgKvE+nDf5w7A/q8QQ06LuN6tEuWoCFhjVWClW5RlG
	4OmszY6aZlD2gTwrQIatjqe2k8oVEwhMr3cAZvVR9t1r6kqViUaruLM9asLAG/fUtwYfZGkc1j+
	aYIIcftz9KVYgjXANuoLsDwFakfM/kXIO4jETaMAHhf8aNG2SZnvibWO4CNA8rSpgbWKfgOf03y
	J/5MBPIyXeEroF+++Qq8McX+lli9/l0b1zRcT6QnrKCK/nQY
X-Received: by 2002:a05:600c:a08e:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb887c3afamr92312295e9.3.1795191723347;
        Fri, 20 Nov 2026 08:22:03 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm137854885e9.11.2026.11.20.08.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:22:02 -0800 (PST)
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
Subject: Re: [PATCH v12 10/10] MAINTAINERS: Add myself as Nuvoton MA35D1
 clock controller
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-10-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
 <20261118-perso-ma35d1-upstream-clk-v12-10-bee2c8dad4e1@bootlin.com>
Date: Fri, 20 Nov 2026 17:21:57 +0100
Message-Id: <179519171774.3795820.3121589367853881174.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=654; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=UYAuJv9SVgURGKW/pKO2M7vMHBgjYbXz0H2zRl5sLMI=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMxcufFn3NUD4mbSymcPHS9iXCz8sUe2X4GLL0RHsYf
 By1gyM6SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMJF5pYwMj9eqR/3X/nTu9Pwp
 X8wmLIr1uLFhAkNJevMtlgmutw10XRn+V89UVdsW7afy87rS+tO36nYKuB5ZLxh/zPbCkR+ztzL
 oMwEA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> I have the platform, I currently use it for my developpements and
> therefore I care about the clock controller driver and the SPI
> controller driver not being constantly broken. I would like to step up
> to help the Nuvoton team (not visible in the diff since they created
> an MA35D1 catch-all entry) in the maintaince of this driver.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

Commit log nits:
- The subject is missing a word: "Add myself as Nuvoton MA35D1 clock
  controller maintainer".
- developpements -> developments
- maintaince -> maintenance

-- 
Jerome

