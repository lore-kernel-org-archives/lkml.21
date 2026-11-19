Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090227;
	b=TeJiQ5zLC4WRUbD/t5+oBB02gDP1RcBNHLmnUYROkAkb6TEd8P3fX1bCzlN+olIuBXya
	 R2iGdObqh7m4+y0AjYTGCESwokeZTtPZuvqKdA8UQ1fVXgUnGqLjoowhe2h3XyVvKtCF+
	 ITqcFMszBqInQTp8YoIEaonqKKIhLRvbFoywpVG3NOWXM6QrZDVgpZpCMrQgb+kK41+Xx
	 80xN8QcWPS95BtoHh3A3/+GUl9DBU1RdD1URmVNJrV4PBVcBsM9i8KDhTRfymJ7+ErXMk
	 9N0/8dIKkKJ5/Z0vaM969zFksrSmmLWz33hzgc7BoSTFDwSB4MvvH40Sjp9Nuowc1PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AYLDQ+yf8AHdWNChzIaxivscwK5yCyOEEBVUQLHdUIE=;
	b=sK59Qp3hdnOYTITn5oluEe0GRLXisul5BXeMWh09mSq80kWB+heBJwhDZlLWCt0kY3Il
	 0IbPh+TWew47236CjUFXHeC7M5DnDWQUnG0mQOgOIjNhuxhfy4Tqnv1/2Ang6ziHytG1s
	 qELaE8TP58hKOmNT6x1RpFIzxSXCX9Z4PN53fdUpK4t9EuWSZwCyOxKeDGKaPuwN1NKN3
	 KdmQs0DxhLMJTUFykXYJmVwBe7KAmN5p+OJpHHEGnfkjowmiNKgLRMIiPjc6sGGBpBuUo
	 eYSv4zPRwiclewi6pOSH/eaWoCOGzzV3vTfM8H1gXQmj6psFHmoYdcH7m7b5caRCUOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VEqxmkSK;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383BD606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 383BD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VEqxmkSK
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2994020eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090226; x=1795695026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYLDQ+yf8AHdWNChzIaxivscwK5yCyOEEBVUQLHdUIE=;
        b=VEqxmkSK4eWCu5l3irtVT/zW/JOHulXWxYT/po655TWF4gILDkLFKPv1BcgYrtWYq6
         NhYw6ZaLojKoN6hFsfSQjvERRHoVsJlZGzxtgS+UYf5mQzAC+zQ3wNRFk55Q2XT2sBao
         IqNO3k6dyAlfY4caVvumv02B3IzsNSuYAvym6mjWRJyFBTL6oamVCfgCauoMR2UPq/kx
         eEfy8I1Ucb1AYI2eI0Gg3yNN/LggBvxf2TO24r6Ca5d2oRXT4eecvoXQSJhkQJQyyTQY
         +8cvCYlNzWcCPfmy3eij9uBFElf10BM3WsNrVilBe33rC9y/MnA4Mop+61oSqy6EXuQ5
         17qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090226; x=1795695026;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYLDQ+yf8AHdWNChzIaxivscwK5yCyOEEBVUQLHdUIE=;
        b=xZ2xArcb9bx0zGyTty1YPbOKdRArdK35+TZ7xGc+mtqymDcZZGiLn1pWoFP9MTsxzt
         JUbwY3YlfFNcAJsSQ7rhG9D5EvtcEzBDzQpgS+zWQtfoLIip/crtrQd9LJ0ffdKyGaSG
         Sc6NuLvyag6dSXHqErcoHcK5BGlEmyl5+IVf1f1jU3l1zbtDtGyj+95yC5ls5hIr9TEG
         4TzKrtuBaaPsBTnBUAzA/4EsKIfDg2a+wetNwNTIsl1ZkWdvpt50QAEkYpnODIXlMu3U
         WmQA8sCAYD0VQwFVFIGmGMNm1tq9NjnvXiQz5xSFJ3ppgHJpmGL6/AY0GIODVVICcvI1
         wZSg==
X-Forwarded-Encrypted: i=1; AL+hErGXWVbuolKzUnlUjsynJMoNmNPrAWgePy/xeIZB1gSPEk9+Ow4hnhDF/j9vdl525e8T8b0PpGxjf4sA4E4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+weqTmiWs5FklC2LdzUkgWp6Z5aaick7Jks8NVqRalE+O4bgCR
	mC0DL9PnLKzP5U83DHDef8s79jozoL+SOGd/SiziXf5SmQQUz9Uwyzkb88W/t57ywUI=
X-Gm-Gg: AZFdTZeckOXvCtHAXKu123S/M13MEiDBJzTITZ4ky3OB/+oB4NCYbh4OUbuNmUYR+Tz
	MOGORIsRWGmWmmQjfSMq0vW4z1zHjhUgrTzM+pGtLYmCyehodV8/mx0panyk8dICBkdlVt3FdZW
	5me6Nyru1Ur8ni/sAmJoW/AD3seyEB65M9cNpjhnJvoGlNgf1ZgWWcxnDQpISzTcNiOwpj5YbYj
	ovJ7njSifK7bJ/D5qk1iD8qU6gws0mD0RP7qfjGkEGws/1Kd3oNqoX++e10Ju28XOxbmOIdEG6v
	ZqlNKM4CaT++N0lsZgqma7iKhIRjru6LJwEPX+P3YdeQdK9577i5vJ6BA0ACD61+nEKuW2dh5m/
	19kRUvVd0U3mjQvZwuFoGz0jA4XGc5Iu/1YimOqiL6NpseAYQ9zv3koLdgxtjrLQtgb33s/xt1A
	RyTOZIAa8YxLlX19YwJpQI/buBCl5E5DUlo8yVM0A5OhSB3rZtvksm5gjEncVzMMfdLjdQmxOgX
	dvTehkAbNT8nCv1EgTmhsOLlML9NeCbZw1M0xqdGBQ+B3kB8Uv9VGkz56vXkPyL9UcNKc3QpZTv
	pxu6zpWTDiPVbGjbHunl/OJUhHePO+rwqIjMuvTNQAHKiuxktzWlEIZ07+xmkqcEdH37qnEvCHo
	qUzm5cZ/A2HTOTVe3v2qJZZE/pQV1
X-Received: by 2002:a05:7300:3e86:b0:36e:3ebb:7ef3 with SMTP id 5a478bee46e88-38282bb5c41mr4863247eec.39.1795090226193;
        Thu, 19 Nov 2026 04:10:26 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.10.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:10:25 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	himanshu.chauhan@oss.qualcomm.com,
	conor@kernel.org,
	anup.patel@oss.qualcomm.com
Cc: clement.leger@linux.dev,
	cuiyunhui@bytedance.com,
	atish.patra@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	will@kernel.org,
	tglx@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	shuah@kernel.org,
	yuanzhu@bytedance.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangzhanpeng.jasper@bytedance.com
Subject: [PATCH v13 09/11] MAINTAINERS: add RISC-V SSE maintainers and file coverage
Date: Thu, 19 Nov 2026 20:08:33 +0800
Message-ID: <20261119120824.13969-22-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
References: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

List Zhanpeng Zhang, Himanshu Chauhan and Clément Léger as co-maintainers
for RISC-V Supervisor Software Events, with Yunhui Cui as reviewer.
Cover the architecture entry, firmware driver, PMU documentation and
selftests in a separate patch, as requested by Himanshu. Also add
coverage for RISC-V firmware drivers and the architecture selftests.

Link: https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 MAINTAINERS | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..c2d283895ef4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24060,6 +24060,7 @@ C:	irc://irc.libera.chat/riscv
 P:	Documentation/arch/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 F:	arch/riscv/
+F:	tools/testing/selftests/riscv/
 N:	riscv
 K:	riscv
 
@@ -24072,6 +24073,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 F:	drivers/iommu/riscv/
 
+RISC-V FIRMWARE DRIVERS
+M:	Conor Dooley <conor@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
+F:	drivers/firmware/riscv/
+
 RISC-V MICROCHIP SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 R:	Valentina Fernandez <valentina.fernandezalanis@microchip.com>
@@ -24128,6 +24136,7 @@ M:	Atish Patra <atish.patra@linux.dev>
 R:	Anup Patel <anup@brainfault.org>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	Documentation/arch/riscv/pmu-sse.rst
 F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
@@ -24176,6 +24185,20 @@ F:	arch/riscv/boot/dts/spacemit/
 N:	spacemit
 K:	spacemit
 
+RISC-V SUPERVISOR SOFTWARE EVENTS
+M:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
+M:	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
+M:	Clément Léger <clement.leger@linux.dev>
+R:	Yunhui Cui <cuiyunhui@bytedance.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/include/asm/sse.h
+F:	arch/riscv/kernel/sbi_sse.c
+F:	arch/riscv/kernel/sbi_sse_entry.S
+F:	drivers/firmware/riscv/riscv_sbi_sse.c
+F:	include/linux/riscv_sbi_sse.h
+F:	tools/testing/selftests/riscv/sse/
+
 RISC-V TENSTORRENT SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
 M:	Joel Stanley <jms@oss.tenstorrent.com>
-- 
2.50.1 (Apple Git-155)

