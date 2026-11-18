Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992965;
	b=yd1RYtvUKKYz/HvMrUiG02nxVFuJsCmhuTb7QtX0CCjfazGRDVx08d5oZMfF2eRmCOWB
	 4sRL6fgo799bllvfr6C7lc9SQTxqA7kuxuywZwhvLOlQxhGNzFYSYHpAMJ1vpqii/mU9w
	 WtjIoAW8GiAjFMeQ4la2o+M5mFxdMNpvW+AWGyrzfBGnoIeG/NhwXudA3N/Cwh7IjABYW
	 GnyWdWS6w/VcEDa65QHQ+5mZLCywXKWKD76Zdsz3Ns14Tj9pmaYpe2fXNlNVc0uv1S+YM
	 cllCq7u7mytIqhNtOoM6Rj+jTryEmsp2WMl/dkWXZitgQ4yn7dvjBd7dUObDoUQ/T8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
	b=5BG/Sa5gCm6cEUcGDi+QfOBhnIvia+dy7kNMwsTOuy7nXfayOenbFvOfg8dQWVIKiIP6
	 qflosgtYvGIYf1WFryIOuembYEfJaeL6uR6AfG740Vfr2I4K9hjQ6O5vSqJxpNwLbyW7T
	 /BDuQKawaTL1iAmqrA09krw+7/fVJ+y6Zn8n4Hql6BNnCq6jxhtNmZaPvuSVChz0UG0pK
	 7r2jiQ09jqF9j67Pl3AGVcZeTtFbilE51avOoDOcWM/wqNeJojZnyTIF004YEJo2FjnJU
	 bcnbuj7YI6S1q4IHYeCWIx5F8ftvZSMhzSwPzfzAQDI4NhXLG8al0azzSny7oQ5fgCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b="LhCHoh2/";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7459606A337
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7459606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=LhCHoh2/
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so317615f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794992963; x=1795597763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=LhCHoh2/U3GoI080JJNIQFDdPSkUALM45Sz5GOeyHK55/aH98wZNzrxhMWEDDOWe2X
         TVGmTY4fK9DUTYz/iBRdTh8w83eH5vcM+pYX4fGC3tYrK/rc/P+faf9VwELQYfp8awp5
         TeO7VL01fIXHFViPv0wuCAwacPxfbf747h9CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992963; x=1795597763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=oL0D+ZCN7e47zA097wsMgWTtm1ufoyr6NVWoYaE+Oli7csiM+0iNYMqePutvNj0KQ+
         ug58l7RHgiH9hXClM6cEab0IrD+0dis55doJHVrYNLtmWUeBTSp12wiAogYaffs9QfHr
         95SFA1rSR9oHyL2wt5CcKuxObUPTYMwN+fmnXjAbYKPCF9MW0k+9SuMd4iOfh2M0FT1J
         7+VYzhFqA+vj3mY799mEOdGAB+msON3dpYNckB98jZNkQZ9zPeaRef9+3HAxT4P/U8kn
         x2n1Zc0KQOFJUIRok/K5SIT047ubbhr+zeUwxyKze10NfK0Efi5auWs772v+lszKcIjq
         OLJA==
X-Gm-Message-State: APuU4Z93Io7Hn8WOH8i6WJhObLpTEUJwe+SDm5UZ9YBCqqJlp8wyGXAV
	QQ4C090UBZs+bpE5ux0KcuEpOKsMOdBqTugYOo30sS8zopYgALvYOToVeItBDpiOh3vbYExWS97
	jxOcW8FOzqA==
X-Gm-Gg: AYBFou0xsS+P53PG0Fh01kLy6HjWtaCdlSFnZ9tpXQXNM6IbP3udygO/KeTrjqUG/ht
	FVaBX7nsgm4UWWv7IYshoEfd9RmVtBAaBz405snEHb+wU1H6LhqT5NeJF68+d9X3thpcLPsxWoU
	owS1shC8/SHLHFX7sUnL7om//4ATT0T3G9fZSpBF23lV/17OCQfkbKHeh/TQLvc7MigpsnJW8Zt
	2zORpTPQR2kMP7sg4CgfS2j+XSizQpSWGnptqDiJy52VZIQNUHDyLDDIyJrMJLXDhBlb/toI8Et
	KtqsAiXhpq+gHU8aFmXFKdVteN3PjyCpV2kSxwBElF9QHGPyBaIubqYZbQMVypeDKWe4Yf80FMn
	hGPft+lRuQK9E+UH9ps9anTHnkX8vVX2Mq6mzvfdUlsHeasyytV91m1s5eGi/esLqxUoypM6Mg8
	scquBFtqpzejKxtvPgNxBS2E9TKRV8kv2ehGeiTzxCl3INg9X21/G8YjJQLY7Efyh0CQlg4fAu3
	aUA8CmcG3W8g3USdiHM5tGlICztSxU1xVdaRt3LCfjZxyB3ynS6HuS8fIMfROkZxe9MtV3Rh+6I
	Gbq58sKBGc4baD7AnRjW1Z62UWQNPFTysAp0fivR6ZoAaWU=
X-Received: by 2002:a05:600c:3b8b:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb7da1b581mr45003055e9.13.1794992963264;
        Wed, 18 Nov 2026 01:09:23 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm185770195e9.8.2026.11.18.01.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:09:22 -0800 (PST)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Wed, 18 Nov 2026 11:09:11 +0200
Message-ID: <20261118090914.38082-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118090914.38082-1-petko.manolov@konsulko.com>
References: <20261118090914.38082-1-petko.manolov@konsulko.com>
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

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

The imx6 parts that are used in M48 are imx6q and imx6dl, hence the
two bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..8f3a04228780 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -260,6 +260,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - draeger,imx6q-m48         # Draeger imx6q variant of M48
               - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
@@ -458,6 +459,7 @@ properties:
               - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
               - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
               - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
+              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.47.3

