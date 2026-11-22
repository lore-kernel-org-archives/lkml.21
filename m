Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378490;
	b=Oi7ke/qWKUTIHNYBL/02rH9jYK1CKyUNQM+IErJzf2mEd4WOngl+7hkXhoPcLpy76A4m
	 FXLR7KYUenalLWTV5QGwFDveRh1rtMxqdKPi12hv19vHRmGz4vy2XpUHFszi3Iau5ocuH
	 9vpcrCKtwcubGckjPZDlUpus1ElMsORuVuyktuJC4kbmxXLDOQJF/h8LFKasH5rqZhZKZ
	 l3cWz5KWgqwm9Z6E9lQwXxK4/yUiYXZG2cibnax9mKHAkRmdyEsoRMMhdxVyTwR4BCGSh
	 5zU0Z3RAWQyaR2/sIpb/GpDnySx3yV/orl0tLkMOnXee2NiUXron7kabm4Xj9a/zE+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=92wTwsZt+a+f9W/sasx/pGyJEXje2AlPj8V3sVGhxus=;
	b=4sM3tLzS36/4SAFKlFOgj29ejg3zFxutIpolL9GfcNMpUxMr0GH1RvscLl1yGPmVfSOS
	 2Me2CPm/8Hb0bAzCQXXx1AE8P1maXiEq8xew7KhMhdndGh1nYHvRnNRa63lsKmdfyIaPT
	 fODzSfRBjUyYWQWZicragtA94p6B0a9gr2ZFxTSSvOQT1DNKjh7q8Y4T+U/0gbPLUgR8Y
	 ah345DMKBkaB8Mt9a8mTZy/L+ulPtB3OsDpCM4HJsDAiPfwL0ftNX5kDFOOQ3B8EuZIBy
	 R89a01FsoqahTozH0rTTwcRicTKnO7qWkABmdEo/xSu4K3Tu88mL6xusk5gHXi88x8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TDqZuRao;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8C4606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE8C4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TDqZuRao
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso3408722a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378488; x=1795983288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92wTwsZt+a+f9W/sasx/pGyJEXje2AlPj8V3sVGhxus=;
        b=TDqZuRaoquGiGZvATVP8pSlepL2t8A0gvwLUfyOmbcP10HP7Qhn1od0ZyvZde3LLJ8
         qEnIiKoKBRd3YFaXpALugXXywd+cit4w2y1wnsJ6FC9JtBKTCoEjFOImrmIJS7RnqYyL
         hctyJ3WTseAMn/0RbdoYzLF3GIHyYT/y5pgpdZv7SL8iVEFyy9M8p2wp8KAc/vanlhBy
         5um1WX0Ojr46IqnNW+3utS/Nf+h4fwGq90VhprWiOg0S9fDa8xIqtVkHKRT45HCbD1R4
         35XII89NyqHbAm1zaj04Ll3qxe822TvzczULj59a7Ku0RbsTULMJc6RvicEBa/ka658Z
         rKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378488; x=1795983288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=92wTwsZt+a+f9W/sasx/pGyJEXje2AlPj8V3sVGhxus=;
        b=RmlVG2Szo9s8tFxEdrm2G381FgmvKWfVaf+LgF3dX4zY2bD4mdAqhrH0vJJ1IR+GZg
         Mh5stvenmuBfKYtvYLYSoBY0xFCqjl18pj8BWGVoxgUX8Q92wgZ9ZJrStouJxuTZC0+j
         vWWzFJwdD3T0tvCBtGyzESI+T7q1SVnCRvZldCJi8/wKLHih4QAaPncw9O28jFm3POM3
         QNcOP5Gtky5MMvVNpZPSOU3RD8XZ7PgurnibxTqC1Axau6Yb9qojpuL7D43EQXb/99Vj
         GHwXaxD5Vcjh+/JATC7Wfh76typ/OA7V5E2QQlXxi1k0zaqxoai7fZzvJPX7iOtvpT1T
         NLxQ==
X-Forwarded-Encrypted: i=1; AL+hErFEGtGY6vTvFA/20oV2JOGYQFyjf8vLKUBmkFw1sYe95KbYMUQq7wFZjKlA9exJhypLWM778TdTfnpaiY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xkV8CscEvzoxPEaTCTbUmRbP8n/YiVewPTc/sPAETagRSlsLl
	kP9JQ2sFMqssX7UvacWDbJAYB3nvqefk4T7OgoVJvLZ9CxJupjP1++Xtxf6vTg==
X-Gm-Gg: AZFdTZeprAShDPCEDYFjB7c/wriiSnQsH49M7EUZcpmzbqiKrl1Zkn6WIL7/qM8Xgts
	PLqAu+Ya+W9RPZMbu+ExsvvA5xAlU6hvbezrxdASemkoW0uOanHllTvhjPjIo3C4cSk4vcrFh4A
	3IVn+NbPIKrC6Dg/QnsIIv1TjiMtx2EgBfvmujZRJ+9DTNMCL7WfqaByl3NK7GwOPYIx2A76sXC
	5B8Hi+sD4lCLSDNbvHCewUs4sYlRQvDafH9bLR3ev1kqqYc3UDfbp+fAdSgT6WaRXSglwvSkcbg
	Dj4cUri5JQlTK04rlYDcIRT6/DmewZJH/PaaawbZdvSZNi3uM5cCGxpXpBR3hIQRPsayo97duBs
	A4K2UL4LZnsNUIYutVyCEWKBEVbBrmnqtxjr0iGov8G9iKSDtv3TJC+SF7pguhew1xsB7wdd/VJ
	TIZng3Gc5MKDC36qs4dF9FRcL17eCho1+OLn0OYFZvzh3bykdeAPx2ZNTJFCywZHmYWaKchygYr
	SYCUhICvyiguyvxUTgM3zyR69KB3fw/jvyYlrxqnCeVg47Cc4eRvs1E+FJ5EbxjRFuByb5lw6jw
	Bj//NOE3+QlEqLGi0lQ0rC7jMmGUFDdfhgwX4JjYKXSclHyn+tsVIqNer9ZWU0ZNQMHLxK4EkTT
	dYpqhFGeEkpvCMKMJUCRAEjwXdfBCzyI=
X-Received: by 2002:aa7:d794:0:b0:6ac:bd53:d29a with SMTP id 4fb4d7f45d1cf-6ba37c7a764mr4696990a12.3.1795378488047;
        Sun, 22 Nov 2026 12:14:48 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/18] ARM: tegra: tegratab: Configure HDMI
Date: Sun, 22 Nov 2026 22:13:59 +0200
Message-ID: <20261122201407.23742-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

Add nodes required for HDMI support.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index cbf9b45284033..911e5e9d8a0db 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -37,6 +37,20 @@ memory@80000000 {
 	};
 
 	host1x@50000000 {
+		hdmi@54280000 {
+			status = "okay";
+
+			hdmi-supply = <&vdd_5v0_hdmi>;
+			pll-supply = <&avdd_hdmi_pll>;
+			vdd-supply = <&avdd_hdmi>;
+
+			port@0 {
+				hdmi_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+
 		dsi@54300000 {
 			status = "okay";
 
@@ -1031,6 +1045,11 @@ power-sensor@44 {
 		};
 	};
 
+	hdmi_ddc: i2c@7000c700 {
+		status = "okay";
+		clock-frequency = <100000>;
+	};
+
 	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
@@ -1323,6 +1342,10 @@ i2c-thermtrip {
 		};
 	};
 
+	hda@70030000 {
+		status = "okay";
+	};
+
 	/* Wifi */
 	sdmmc1: mmc@78000000 {
 		status = "okay";
@@ -1452,6 +1475,20 @@ clk32k_in: clock-32k {
 		#clock-cells = <0>;
 	};
 
+	connector-hdmi {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	connector-usb {
 		compatible = "usb-b-connector";
 		type = "micro";
-- 
2.53.0

