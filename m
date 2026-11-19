Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111617;
	b=j0nOaJxulxbb2Cpb5ueWLIinCgItbzLxxcGa7V822B6WeEw1TJfF1AuYOwyN4VOQFn/2
	 7HmzOC2yvcIb8vVwSTPAyhkN3+fbUYbzNhgbmB+/QcYwdvzv2/8nRmt3/sJLYAxOg54Zd
	 Ry2q+G/QVPZjtehdyiefBiAIgCJWWb39pwZtw6znYe6UEGKWqCGNy6d8Y/mRQd0mVP2VS
	 XgGEBhydYrrOMNGQqDv8Y8dAgYnBgMrWil9mk7NChEzrs2X8mejwgPnda+l+xduzC8oP+
	 befxbB31OKHsG1N/aWkIxylKfbiqa+SOdR92enxZ6IjDIAodiiTaBcHBWSQdkSJNW5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=u+h1+6/yXyfCQxVyWKiaA+3PG2QahTNSPc0SUKvEWjo=;
	b=IvnCFjXVaf2r1Bg8P0Yr9HFsVEojX9Uiu5dGHK8QCRzJpj43isp4/5M01OiOUqgI4tLn
	 nn+SA3R32Ze1bKss7O9XDEiIzmH1t8qjjbdfR2VcqTEDVNQZQztLmB31awgnCo3dzbSa9
	 horYRa77W/Ceu7F29F77K37seuFlW15q7+GaYCtovi9IiKkwJBFDSMNGNUr4Tj8O5je2U
	 quNHuXdmw/o/01KLWQLU2b9zEeV5QbWSc7UWi4J9rqdoZht9Hvf3pR17bk7EHVgb0pDCB
	 Pmm0NCyxe+mAFKZmXiWkOJvOqnAx2S9hxIE5pfMH6xI+HgBqkhl+3LFhNIYWRgQaYtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kr+IeXjL;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4255606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4255606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kr+IeXjL
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4b563403c7eso34998fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111616; x=1795716416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u+h1+6/yXyfCQxVyWKiaA+3PG2QahTNSPc0SUKvEWjo=;
        b=kr+IeXjL0mBaTUa+aj21FwLVGfunm89qfu2cv3XcqUyTL4kQA+iNsgAocslBB27sz4
         cXRndaC/29YZ2zxKnsC4ZTXJbaxAQxvx+QGsbTdoEx+jps8qwlxL1PiSi0kX+h10vBzH
         TfoQEOTk9I18UREBmasWDYICw3wc1IxqxszxGv5VGayCLCXKGwNPUm1HRNs/6gdsLnPH
         t5g8VhYKCj69TsUouE/bhGI8yMnxVH8OJSJhNBuDSTsA1o1Pe4QX9sbQ1bP9Y3f2QyU+
         S1XvycwarBk3+rDKuTm2zvr1LJlrg4vEy4CxdnM19TOD/IqA7EGNHMTcyvhMUl5YHqGV
         ltmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111616; x=1795716416;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+h1+6/yXyfCQxVyWKiaA+3PG2QahTNSPc0SUKvEWjo=;
        b=nblhkqIEEdJ9yJ+jg7bSDcBSz2KrxDFJLQRkg5/O58NWRNr9riPKlZrDUGQ91xoIvk
         HEgOyxsfAs2Ycf8TFiATN4tUuFcbIAXU2HoPCnX2OyRRAnr1Ck/b6MOw5z4TQb5P6UNN
         O1alQXFUZMHPIbmS/monJlPMdTrZMYv09NhnPwoLET3nOl8f91Qryh7GFfdtpipjdae6
         Oemuy1uOKy7OXVUSm/NP0ZQZEC9ukg8N/O3LGw90JXD9CLX3W2t8n43IqBnzW9LDMmif
         X1FR6zUGaYO4kWmvVKqYXhMI1HmAU7IA5mm+Uxszc/W8h1WK6FBYeO35mRf73XQmBPm7
         W1Kw==
X-Forwarded-Encrypted: i=1; AL+hErFOCAZ4AUjAVAeOUyuBdCvu562de+HCNost72EZcx4dHnbZDZMQ+WG7goIJeLy+cQe8vSN30eO20mNkdV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FPCXZqJYRC8oKyHpDCtKnnG9SMtHwzYtpkGphu08TFbAHvSU6
	+8xHQjdxNw1ZuZAavLnBqxT4Qvrhcyw2o/Gg3p/LrSFvh6XSUCzUOzNO
X-Gm-Gg: AYBFou3t/m2dGmVairTC4tnuBZXJaBa2MSJWWWSLI3AHeGZ3WK3gBGTrRiA3of01qUm
	4K1H9Gu+/drz/zdfNoWGhpMbpOI9y97JqliWmQb9GXYI7EcDj9BhyFO8vExkpFxTHts4XqVWWhs
	PSmt4uHR6BROFukdySV6d4RoKtCXzAHrzt2NRqvo37hVSTTr/pCOpZ7zhukeFNG5dvA7Q8y9O5i
	K4h3xscPGiIwSKTvt+NIm2XHwMav5qJwPEn0rD+EQSo5oEElioM5N39fwn5P+IrHfEzNYvraBXC
	XHjOB9341zBVgQQ75w+lHuek/PX3mjTcvfF2Tmr5ItGP908S+hfGJaUW+SCwnCuPNZ6beb0xWe5
	vpi4DZiPItfCWDLqZPUjmu1ginx54JeLXuLuH9VE2EKm2zcU25D74QumfCb1UvtSxyoy/unUJlu
	wqjeiay0lF9J4+FDeFgMw4nNSN2pA70P33l8Lw19msyhJa5NOK4q2cgTQznt+iOxYEYSUVvzXS8
	W5/+1rkSyy+iudK6NKoWwi8W7ScYwQu8IDzkacJFY53rB3vGqGs1nBvf8wgGMtckohKdmO0FWhn
	+shfO21F09WTy+b/qmGUHdk0EFif4G2vpc2vTjj6UaMRaggLh90ea3VgmrOFRnDnX7TQvDBRpmZ
	qsg==
X-Received: by 2002:a05:6870:ac13:b0:4bb:98d6:f37c with SMTP id 586e51a60fabf-4bc81ca0dbemr415502fac.15.1795111615833;
        Thu, 19 Nov 2026 10:06:55 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5fcb19a9sm453262fac.10.2026.11.19.10.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:06:55 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: alex@sverdlin.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v3 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Thu, 19 Nov 2026 13:06:53 -0500
Message-ID: <20261118-a733-dt-v3-2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <18a78cddfc3c28c011bb5d0c566c2f307773b235.camel@sverdlin.org>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com> <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com> <18a78cddfc3c28c011bb5d0c566c2f307773b235.camel@sverdlin.org>
Content-Type: text/plain; charset="us-ascii"
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

Hi Alexander,

> Shall parts of this go below "---" as history/changelog?

Yes. In v4 I will move the dated test results below "---" and keep
the hardware rationale in the commit message.

> Do we need capacity-dmips-mhz, cpu-map and two PMUs here, similar
> to rk3588-base.dtsi? This in turn would mean ppi-partitions with
> #interrupt-cells = <4> in GIC?

The A733 manual shows one DynamIQ cluster with six Cortex-A55 cores
(0-5) and two Cortex-A76 cores (6-7) sharing L3 (section 5.1.2,
figure 5-1). Every core's PMU interrupt is PPI 7 (section 12.2.3,
table 12-1).

In v4 I will add a single-cluster cpu-map and separate
arm,cortex-a55-pmu and arm,cortex-a76-pmu nodes on PPI 7 with
ppi-partitions, and switch the GIC to #interrupt-cells = <4>, as
MT8186 does for the same six-plus-two layout.

I will leave capacity-dmips-mhz out until measured on A733. Radxa's
BSP uses 430/1024 without a stated method. In the November 18
RAM boot on Cubie A7S with the v4 DT, CPUs 0-7 were in one cluster,
with the A55 PMU on CPUs 0-5 and the A76 PMU on CPUs 6-7 counting
and receiving PPI 7 overflow interrupts on each CPU.

Thanks,
Enzo
