Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505382;
	b=pt87LFn4Z5Gz6Wi1KzeUa2SMKMOGIJ6P3whLngPWH/vuYYdEowRz7jv/L9bg2/8yqhsX
	 5Y+Vj5z+7YLPZuM0dGkM6Zds1V524byO+9+lbO7NwhV8F4tnSaWV7e7nAA/vLozCrMo4l
	 P15FchHMpI5RZCBkqW5MEnh0/a1ZxSI6UVrcX7HAaqI7GZcOLvpZDVtGk58c0glaMxuGs
	 JeRrdhJhC152GZL3nkLb0cIgCZWymrYTaPlp2ieZZX8o+ZxJTmP6WTPoOeEdANTQEPmB5
	 tjUojOKSJLfUVPQQt+Z6RW5ktO2VnD139O2WJLNAIIiOzMj9W5I7KR433gudFQ8+wNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JGeRZHEsszBCgxvyCdNDeob7nkbYjLxhNWjrFkp+2Dk=;
	b=yy58chSVfNnv6rAqI3gDwlgexruCX93d2rm0gvmeP/2jAfvnNUW8qfIcqhaaqmoEsF7/
	 +EuAFWSFHO2qXKqp+8Y3B3JccAgl5FE3YIbBT7awkwYYN0CZ1PFaygppsVXsRuRfXRml1
	 4DtLPRk4ldoFIAxyKEhJal7+9p83ZYDoWJmdMsVYph1sVWbhY2K8ppuJD3VEBwajSAcKj
	 8TEklTsPsopjokfftU5VxSv1pgEkkBHiDXeBFwtSd671CHlIIf981tmLFhn2QwqtvdW/X
	 NXX5fJxxqvw3FP6RDCeZzyD6J3T0cy4jIdl17dbxWL1K8/BY8bN3ZXLvsmxz+eEEuEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rq1oP962;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3292606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3292606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rq1oP962
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso3001568a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505381; x=1796110181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGeRZHEsszBCgxvyCdNDeob7nkbYjLxhNWjrFkp+2Dk=;
        b=rq1oP962qlaJLZXcCqedaZtAYzK5COV2KcwuKR6KrCes8aShaceZV0w0djk0nUTrMU
         0sJMf3lH8qAsOEkzyiBfKICVEBuJIpLF1JM0kCHbxy5b9NqNy32AGVtFT//zAZAKc22u
         8CL3NnIfthfDYqNVskTGMsUAQwL4tt9Sb/O+s3y5CIVJco0UPaKqvrQ8/IKbUJmEjSD0
         REoUcLYfJFpa/tAcxMEt8M5e4+eEh06QkC09JSobaAnMfZSKo4ChwigQa3SelnyhQna4
         0gw08L2Re3foS7TsfaeY3zevnazSMu3RHhDgXvMTvbw/fF2nstvPuG0T5LpyZOMSCMpJ
         tDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505381; x=1796110181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGeRZHEsszBCgxvyCdNDeob7nkbYjLxhNWjrFkp+2Dk=;
        b=QB5Lz8lbT30u9TPYtsqzTqrv0e6DD37JVU6CpCMUro23psGk0o8b033K2D6hS49YM2
         pgsqV8YCYUyUSpC/y4R3cifyDAtm2DVVaNpfPMFCiMoGuisoNBlwYC9CV2cdN3cZWyGo
         XubbHSZepatLwgZ+ypJNHSBC30FBouRnbrMk0LSn2EzwqAYWid9Ziq2D4L5NLglVV2gf
         lcXxMB2HbXmg5M+e6oJ0Yuvs+SpIfHtLG3mi4/fNgQh6gqABCU207D68l08UoQ78ElaF
         +1EIoQdRUH9Jok7cx2dKbRyQF6qF3ayp4inToey1DVqFJzYqO8pw1x/5Hmepb7UkQ7fV
         8rPg==
X-Forwarded-Encrypted: i=1; AL+hErHEZWPAPSGHaJZEny4zLSKSb5V/hsJPNh75TLKCxOIbkLe9qBKSyQP8FsX7HH8bt5QSN4y+2XsUQAxIeUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cRQvpU6Mc+6ck+C3LgpoyfVwIj3qUtbsGLSdajOJAEInfOFuA
	6OARSNAKuTd5ZE3ZAGTY3jkB0EbBEftJaoxOl/Dwh9UeYhFD8k//DWcT
X-Gm-Gg: AZFdTZfFr6sg85XivEQwn8Mt84EaHLenTx0QBYQ3UD6hDEYqZvn5U87l4OKWsEKxyUG
	p75Lt588j4zrpr981F65Tt2lLZvPQ/JoV05tXpLzA7WLYXPBDxe3QVOkue+sLHcEc3Ya/ykwGxl
	na+DlZiZxJP+j/RkUd41DexiBaBZig7tC1lMz10nxeOpJy5BOeesrqn2T39DJnwIRfqfRjEBKvP
	aV+zR1uCd9THZsUSrGjgeK/Xq7yKGGBFv0W4VzQd4vCmQpuAMY7nmbbEyyadxXZNVyXXSwglSwE
	Zz+Ev3++J9RPU4SiIr5KFxQLBz2IEa4+HzgyhL4j9cv6VBHn/hq4/Z90dZhu+O9nPiN8HcngffA
	wb5nT1cxsuUUUzhKg6k+WTUBZ5SIG95O5Ui2O4Kt7+fxqfRKjM6n2usRZU7xR2KoYzRS4085o33
	W5W3w+LJlUPBsmIwfm5/BDuHx0SSyPIjbmQlJWnkOpuxbjv0YrwkUkFYMeMcFNT5ebYFLEvUT/C
	HRq/TLQi8Ryy6mwUnKIKwdVC1tuJ6ZxEfg5xJCh3lvguIMcpjHhdUjZtWyB13gNH2XkMTvpWxi1
	gLBI+1BKKJmvoY6D5XJ3iq2jQBA=
X-Received: by 2002:a17:90b:5346:b0:3b3:ab74:74f7 with SMTP id 98e67ed59e1d1-3b41c955bc5mr12961867a91.39.1795505381135;
        Mon, 23 Nov 2026 23:29:41 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b457a58d04sm8262361a91.0.2026.11.23.23.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:40 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
Date: Tue, 24 Nov 2026 15:29:23 +0800
Message-ID: <20261124072924.556678-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124072924.556678-1-inochiama@gmail.com>
References: <20261124072924.556678-1-inochiama@gmail.com>
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

Add eFUSE controller node for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index 88ddc8e793f6..2f9fca6bd110 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -36,6 +36,10 @@ &emmc {
 	status = "okay";
 };
 
+&efuse0 {
+	status = "okay";
+};
+
 &gmac0 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 320c4d1d08e6..9577aae08f7f 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -408,6 +408,18 @@ sd: mmc@703000b000 {
 			status = "disabled";
 		};
 
+		efuse0: efuse@7040000000 {
+			compatible = "sophgo,sg2044-efuse";
+			reg = <0x70 0x40000000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&clk CLK_GATE_EFUSE>,
+				 <&clk CLK_GATE_APB_EFUSE>;
+			clock-names = "core", "apb";
+			resets = <&rst RST_EFUSE0>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@7040005000 {
 			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
 			reg = <0x70 0x40005000 0x0 0x1000>;
-- 
2.56.1

