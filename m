Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369141;
	b=TUJnq86jHHZ6tngriR3HvF4z63iTd7xuwCF3qfjkYlWHIYUsrauv3h20L+zu08ra35wy
	 tP4pZgz+RcGnefArPxY0jAQzvwLP9QdyhYIzn34KWp50Qxs2VJDQhw3vNfEnmj7ZNZyNC
	 tMMRJ4rJHlYoGw6vPq2XVKaA1/GNppKBVEiHiYFplGYCGSnd3guJ8NGzqqXV4mpxDP+mI
	 SO+NCpnUZLrK6occYQcO/tIeEpiF9aEAcdRPuEasHEXYM+xe0eykhlaIPgthKOu8OWrUZ
	 06kRfYIto9SQ6HrnoeepIBIW1JSTq4bh95B6M2BCOhMAXhSng6qHr5vNS7U3TqvxXWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LlFmwfQRuK6UV6XJmGVYSVgXfF3MLqCw1TxtpepQm6U=;
	b=XimK1Dhv4iDuZOF5d8g58nTWOXpej7o+6e7Q2Qkq0tGZVxo3gZ1GrLi8xWfPoW63VgO+
	 XEILDdFJ2CF+fqTiLlPs3qnZLCMHCWttttGpl3vrXal2UElwEfx1+PbxMWzbtw6vLHAXq
	 R5M/0zhdxv2iJ5+7Fwysi3q5htjDn0+6dFORxh1iANVSFGJklLZiWQJW86dhy6wab8Uw4
	 Sgcl4fdRa8PFY+bQVDrco9Ll2T3nXfVve54vSZ3Ng8oCAXk4lxtx+ApLVJOXVbiv8c9N2
	 m4RFnZxgaoCPQ6UL4PsDw2FBdGKRnRbItPusgULnGJS5D2hhLsDwHSjHcDSKTZMJznw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tE+XF6mP;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22347606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22347606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tE+XF6mP
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385d8a00598so3392052eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369140; x=1795973940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlFmwfQRuK6UV6XJmGVYSVgXfF3MLqCw1TxtpepQm6U=;
        b=tE+XF6mPTdlzsEbRygWELR4oUHzEOkRvJxaATh0RgnDUFXddqYNSLBHoHUVz/sj7vk
         Nn+XYfktpwHIkAdvIWGKrMenBQCVOYDpESG2SzQchdxsZt+mnJ+9h26PAv/5wjfUG64/
         54Olclsom7+1lUnZL/Y544kmNla8Y1AgJyfbVj6ZtB3IR2gfxfVtce6i5zcWKqflX++k
         OnHiLek1D2ebgCEbx4N1RzL7gv6LL++lOVSxXvT+HvTq1Ihj20FA8dNgx1u0X4BEqD/K
         SVSmynCWpiDEDrJeAx76nQ+hcuWUQVD1A/YIs98IkWW9QvsxtIOROZuC7NXxQhOZzXAx
         dwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369140; x=1795973940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LlFmwfQRuK6UV6XJmGVYSVgXfF3MLqCw1TxtpepQm6U=;
        b=m6ogSwuVVyskM+WPtGHFStTEy3YVYLiex5llvT874mSr6NdhZ0hQZ+RE12pmYi15Cp
         w/mWtfTZxEhAijf5lyH2ttk4HUkcbOb1IkLgxFn+ZGqb3mR4WR5ktlrce59Blt2IoJZs
         tGYWJ/XhAGwT8VsfO6y5RUp79tenNCDS6PapWCXJgON3wF7OOKRrfB7tlcg9X95gT9Kl
         gvzNHr4N69Qzx1txKT12L7uJPOh++9a/KVwWcCp0BzI0qfvzh+5IdkPYcHV1hq3M41k7
         vHxz/bVb+6teM97Z9WeNdYJaxCsaVQLeNR2+XViH40FDdtLiXlkcf6KZnGzy/1LPDuVL
         oLAw==
X-Forwarded-Encrypted: i=1; AL+hErE4GFSdxzJq6JzXiKBbH0D3+NhA+L9Pquu6D2xuZAqKwCETqbYBvT95Kx7VoYt8Rj541OZ50/1wrpOviKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z97yHa5fhEcbmLRLscRnyB3dAGOn5zY5o6eFDLO1v5iI+n3+1bF
	PxtwNrysxAWIe6bE9Ry2Ebvhn086OxS6OvLlTN2KW6zCUL92eV0vruOr
X-Gm-Gg: AZFdTZdrFTky7+P0g9/c7FvVWJOvcanXLisUNxInXuhCDtvU3HF2X2gENrABcfpMsY8
	DmSV9gAbUB3qq1bG2hS6youwnLPt8rPgdvTJazLmDISDTzXNAzQejSuR+Pr6Jb0EPO1pUFK5YVY
	8Gc2ZvqRaJI136kPHz5GlIzHiwMj5e1zhGH4VvbWh5FPF/iXyNvb1uYSgVYHtcJBJjKf1+m7Rnz
	ynACYTxVotROsEmQZOsA9N5sSYfqFCNM/QETgYq8wEtXTy90RV+6S0TcVsA+anmeapK6YOHnNNy
	pBbpXY2Cr9gsAhZ4SvYddrdLxdVuFdGth0B5IgMIF9+8O3TTFRqpgmRiuT6aKCG9Vk9etRuIfuF
	pjWxoiJcYy6mJPqzqNrdY2Wdp8Vr4i8w7fyHzCvHXEvR6ZlNwgMd3YR0VXmNXK471kjUiqGER0s
	S1ukeeRw8qAKwol85QZz0I1QsckVZ7vsZSJuPyjgA1v9YzHqA32aCZBmRdom5fjE6ti6O1/mqBX
	57F5mf6OwKp30f2D52+BMOUqeycijce5h44TG5oQraVTxqqcCVRzs8LobGDgBmRoWZY4Djf5n3w
	ZayXifyLyEnJWuJDcJo86Z856QLf/uf6+uYGIgazyduYVSRSLQ==
X-Received: by 2002:a05:693c:42d7:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3856f84fea7mr9545686eec.16.1795369140294;
        Sun, 22 Nov 2026 09:39:00 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29097985eec.12.2026.11.22.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:59 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v3 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature trim cells
Date: Mon, 23 Nov 2026 01:38:10 +0800
Message-ID: <20261122173810.2409146-4-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122173810.2409146-1-duge1256@gmail.com>
References: <20261122173810.2409146-1-duge1256@gmail.com>
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

Add the K3 eFuse controller and NVMEM cells for the temperature
calibration data in bank 0 and bank 7.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..af1a758788ff 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1439,6 +1439,29 @@ saplic: interrupt-controller@e0804000 {
 
 		/* sec_i2c3: 0xf0614000, not available from Linux */
 
+		efuse: efuse@f0702800 {
+			compatible = "spacemit,k3-efuse";
+			reg = <0x0 0xf0702800 0x0 0x400>;
+			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				soc_rtemp_trim1: temperature-trim@1c {
+					reg = <0x1c 0x1>;
+					bits = <0 8>;
+				};
+
+				soc_rtemp_trim: temperature-trim@ea {
+					reg = <0xea 0x2>;
+					bits = <4 8>;
+				};
+			};
+		};
+
 		mimsic: interrupt-controller@f1000000 {
 			compatible = "spacemit,k3-imsics", "riscv,imsics";
 			reg = <0x0 0xf1000000 0x0 0x10000>;
-- 
2.43.0

