Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279497;
	b=HfCVnzfq02gKn0uOWo+AUaRp6QTaJTwrSi6IV7YUtbhBRkm53PxMP44KLW68N3vCN30P
	 AIKfC6Qus35VSgteXPf8I/Nuq0W1TkIcVWfxX2AVxdW1Ke1ZzmWZ9p5b5LiD4Af43JPlD
	 kETvzvn9CvJ1RRhLo+h1ZlzD90BNZlf9j9nnqdy6sC/gsZE+W5c5SQrqClpDnj/EI7sHp
	 PSOekJgiXDUhguOe8lRPtDX3L6j5hyHgq4bGk2ZgRf9JItETle5soU/Y1/xX+uXDCwOTt
	 s8+IbA/k8ku2fT3y5psS81XOuFiNyGDSy6wuy/0LsbyI4nADICmS/C4XQZ95Nr74fpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CxqkyoWUaTTX2T9h8JesIf80SZlF7IaEiUzIJtTzDJk=;
	b=21LEn3BUYs+2M+qiYZE1hLuME5S9rn4zPm04uZ2nVkgxYv2Gv9aPaprl8kVZdUlUMJ+I
	 opB3VeLLjphPL/o3Ub5n64NQPsf0txdrsi27GXA8//1sgCVxWTg+OFGFjBDSK2LniwAa+
	 DIx1kSPs8H6Bayi0uX8oa/SPDXpxWTfwbJyLdRTFAIntEEtYDsBmYAKHypoEbGxo4KMSf
	 MQ7zqv/6Aoys96UhFey2EnXAV3f+J035TJdaPHzTgn9NicgkyU0mcQw2xYyjkcukNcSiE
	 dijabb/liqGkKDVfu1M5CJ8OoWOB4Vif66xrh2gTGNUmiTTpJ/Z/hlKde49zebTUSvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz9sT3yV;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0647606A336
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0647606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz9sT3yV
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a315ed211so2323698eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279496; x=1795884296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CxqkyoWUaTTX2T9h8JesIf80SZlF7IaEiUzIJtTzDJk=;
        b=hz9sT3yVPSsdmeXUzzQ/OVC/OtIFzaPMVXX0ckbqhQbtpL+VG+LssjROz4BSKZt9JK
         cdWDsaKEMuY1lyAqQeaN7+6CYDSclB/TsmEnXzMnrgNaz9GOzouZBF8sakyd5gXyqzsB
         Etp5/+yHAoTCBrW9dKobmkzg770jwKN9wJGyM2lEp+Y+/4mVArdhuebn5B6ahstfGnbB
         EXkoTkHe2aAKCiC7P7vcxii9Vt7ef0kwbdY714wM7sUFHW/64uwK3vDHooaZVrOiGdFL
         eUE/kVmyW9uFt6duKhmvb5w75l6UlHrGCycn3VNVmeMfHJm/TU0RT//F+qH/hDHP0HLa
         Cfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279496; x=1795884296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxqkyoWUaTTX2T9h8JesIf80SZlF7IaEiUzIJtTzDJk=;
        b=DrzWIPAVYtvnFv2seDEwkJ+szXvkZv9wcHxBDSiuny7neYE4lmKDRgitS3P8fVPIC1
         wp7D+UVzGPHaf4qzujNeo/x3XMdDEOhJ/PXC+PstsAKcUxl5eYsGCcQM4qIOAx9GQDqD
         xtHt8WRNyYe2d0CgoCB8odvA6T3rYG+lax2t+mH5fxEbDlXtmpSEfK55DUYUqG+r9GTM
         wd5KkwfBZ/XpPd3xSmETGPzUd9zww15VbYUaMJa9lgYIVD/jH9QFqCb/wUkaCui0gWGL
         JDjvfdlSCECjF490plCu92AcwXsuC4TIAhdt3ayDcsA9ms+P4YARApPfRiuuGWFUlyul
         ClCw==
X-Forwarded-Encrypted: i=1; AL+hErEiUwzxaZUkNY3VQ0HvcvFiKx78xXyzpbcTv1GUQS4YENc06aMqKPDtyIxAgRtHFnl7p5deBEDN5d2PTvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KHivA7wdqo9NgP4IQlKhkg5mknfqJl+pM126NRjb8t/Bvsf5D
	I3m5JaG3Qxj3T8bKK0yI6jNivS0Zjlt+bZWY+ZyAp85PAyOakB7syRLf
X-Gm-Gg: AZFdTZf6Jhp+ESAxmE1hNFqLavX11DHckm55HrhK+oFTUTmSX4oQKuhi8RWoPdHUAxN
	ODssjRY66uO3rlJd/V5Rc7HJZ3fO539+qloWHPq7VY+S52lBZAGXPfRbtDyzPd0NP2Y1svWcHYx
	tE+/RtU3h3j4S5XJSWxS4/Anzpi/q11rom5P+FXXis7GDTKKWvfw+iw3ZlpMLLq2XTxLfjv/rhW
	u5toA+61p/YgZDyArGXf0CVb6GmUdW4amkhxej2qaNAPBNjsoEfNWEH9HUki4KOOKqahSURdUkZ
	7AUQxGnQLSoukMCpJTaO6GZ6RscBpdnxfPceHZFitpYrX/UWcrxzPm04L4EGPYJ80TLauqy7Q1p
	sZ4xtnQegqTsQMyN51CuYMarbOh9v+HPiWBGu0/upyy2bbqOmgApGFPeIy67+QFjMSIaEWp3oW1
	KOsaGVc9rXcLTpJX/wZx9lXqCjXgHjUiBR/n2zw6WQNpSd6oMkj4UhamZmpkBgm0B8kn0OJPsky
	vKMvYFFFFcEEw/6b1lr+RZKehdlYB/q30t8m1sCNnxO+yQFb4yHR3R9AQnrmYexOZXJzFadKCqo
	2YnSUIvVRdjGf8frCeQP89sntNgcvpstA2Zk4A==
X-Received: by 2002:a05:7300:6b0a:b0:382:75b5:e77 with SMTP id 5a478bee46e88-384b4a80eeemr8320187eec.25.1795279495752;
        Sat, 21 Nov 2026 08:44:55 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:4c23:efbc:89e:50d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm18791440eec.15.2026.11.21.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:44:55 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mani@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: kaanapali: Describe the UFS MCQ registers
Date: Sun, 22 Nov 2026 01:44:53 +0900
Message-ID: <20261121164453.26-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

The UFS host on Kaanapali supports Multi-Circular Queue (MCQ) mode, but
its node only describes the standard register space, so ufshcd falls
back to the legacy single doorbell.

Describe the MCQ register region and the ITS MSI parent used for Event
Specific Interrupts (ESI). The region has the same address and size as
on Eliza, and the ITS device ID 0x60 is taken from the downstream
device tree.

On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) this more than doubles 4k
random read throughput (fio, 4 jobs, QD32): 186k to 431k IOPS on the
first run after boot.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 132577d540bf..c841a1e1e1f4 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2536,10 +2536,15 @@ ufs_mem_hc: ufs@1d84000 {
 			compatible = "qcom,kaanapali-ufshc",
 				     "qcom,ufshc",
 				     "jedec,ufs-2.0";
-			reg = <0x0 0x01d84000 0x0 0x3000>;
+			reg = <0x0 0x01d84000 0x0 0x3000>,
+			      <0x0 0x01da0000 0x0 0x15000>;
+			reg-names = "std",
+				    "mcq";
 
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
+			msi-parent = <&gic_its 0x60>;
+
 			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
 				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
 				 <&gcc GCC_UFS_PHY_AHB_CLK>,

base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.53.0

