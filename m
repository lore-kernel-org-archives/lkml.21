Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535093;
	b=SMOa40jQA2ZDD3wwt3remRv93bWRgqIRyish9WmOOJBEB3zwYbo3/g8F0wVhs5fK4+NJ
	 ATPQ4798irdZPTUq2c8jyN+dr9IoKitL1aweVrRqoxd+b39dn2rvO7/1ohvOE1z1cuMeu
	 9H4xbjBpW958qeEKwMos0vQOdZAY5KwZ2UYgsoXm73YnWpCN6hZxpFp+pqmEXq8xEX4qB
	 zI/t8ocvLhvmCnle0gz8SJLXskLwgqaVUd8RXYFflfPXAj4GLqKtlA0m+QKLtuF5iHIZe
	 jCvQdETA5bDk2MUm0CkOOM2SwjDosM3bF0kYmUmuOuyvfhEpjZB+2nUBzX+R3hxpGlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/xKm7gyCn60q+UftQgSFNSdwil5EY1yDb3KfSYz6nH8=;
	b=45e+KEtIvKv93MnUDumbrjHCUjx/0mEiFDNSf4MhrEkNmwjzNC6JTQLpZGLh2magXKcm
	 qs89Uv2Jf/G3pbWESak/HxOILQfQimOH0ALnZRz1+cYmZKTp13Oc6uIedcgXCPnirGaWr
	 MBXVVJYmqPRSSX3rRWzPgO3uzmMBgyt0fRVIjWig0nj6DaZBCWzFV5HRLnyUy99bwOrFe
	 0DkdHcq26OVR2j/7LCbXXbUHuriUWD0iD3I/IpMni28HI1JMdL1l5FDeQnVgzaXdqZymL
	 Tv+KVqRY2DSuHYiq5dK48oVAKtE7JX4N1dy2PwEA6BEr+3pZJdsWrDTPi+EdnJGMilQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yM06T9FU;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF01606A332
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF01606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yM06T9FU
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3acec6677so6782474c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535092; x=1796139892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xKm7gyCn60q+UftQgSFNSdwil5EY1yDb3KfSYz6nH8=;
        b=yM06T9FUoT+HauG+ah7ZlDtJE0jPh5ciWEgMIRQ+vqEic2A9PRgWPR1ZJpzFTLR/cu
         nO8CIq2Yyzr9afpjdHgu+R5hGufllaMuhwKbbPisWnTxH6l5smZ92CeQny/SPyiAq0Dg
         ypK1AgE08YrsRNdRvd697RDKE4HHSr30RCoIk1Z6+ud/0iEkbqty/zl+nggb3cfIucjj
         tKO0/EUGsxbuHGaPVQjlgzi2TQma2j+doQQzHWwdJUIL3PRs0ZLkIXKqLXzjFtkztAkS
         LC32xHBOTywJCYEaw/G2wSHD+PhB7sG2fWK+8GyZ+j8Rsp8xEIMcEY1tRVI+/4m9q9Nc
         rasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535092; x=1796139892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xKm7gyCn60q+UftQgSFNSdwil5EY1yDb3KfSYz6nH8=;
        b=gP0PWBkYQO9BizgDYsL33d1wIRqmX5uZmkgkIHMDmf6p65/ramuTNaP+Th616ovJ1n
         GZklRyyOTaulTV4YuEMGYfhwhpetB0Zhj88kWmbvsao7Jn+mH31Fw2WObMKMTFHZ22N2
         cTM0t17ZKOwMTa8V95Q350KSpumKMoHZSC67CWzRN9iKK8tgIf/MBDdeODlVqC5q9ez1
         TrGy+Fc/Q4qaUAAbM8HnERdVoWBmJYtywOfvDJOmIbU1+oaRcwl8ZTQPdAGY8Okx6EPb
         q3XvtSs/Jmfd4o0Dr37R9Np5ipaS9Jzsz1W4rgCoeO6jec4V/7k026JbGy4ORRR9Rlct
         C02w==
X-Forwarded-Encrypted: i=1; AL+hErG8tT8+VZvACHfqVmF4LelzpqhkYXVOoXZ9jHI9QOE84Qbz4rX8Ta4EIu7BeTXAciVEFyDm7f+w/xTRTGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2cZTvzIE7peAF1ElRUQfjwotdcllT7o1IJm3zqD+XdUA9F6O5
	xX4XcRPoz9HjcWQnXVr4CGr8pLJl+Army+2Kk/q9sXlgLBjAXX0UXl1p
X-Gm-Gg: AZFdTZer+bSTcbTAnlUkHotw2es54iWx8F5zr0Q1jQv+imqBTouzCs6L5QfIKnmqiIs
	RMzITDoslnYOiXciRP16SPOtnobTVMU6fiuwl0DfNymwR5Isx1GYz31Ujkr272eh81xhWPCXpXv
	j6tTdpqI3vYjtiCoYVGz01TPSVEiCBtlcXscTSZCmRrtlJRdx8HKA+3CiBskCFftMSE7Fp4CDft
	S/Y9vtxVcal1AAY/9kMWWozNAGaGJ3iFvab6KJ9MTJQrizU0AWVJLS9EL50uiRAaEMNRmlP1dCB
	45lS44qjitua4hcAjRCavdySp+B5+FCvXRZLSy9glBVeHeIZ8gUN068Fza1aykju3oD7TFYiLvF
	F3qDo97m6QpXiRv/EGdJW/4PKbP5Lt7KO4FDjRQwXf/EE+UQK5RqBJEge5+efRtRBoRnCjrwLOk
	KNMTwEALd07jISEt7ukUip2V1kkpSCYbCvfosGCS4TXTlM1gmQc1Bq6h1pEM50MRKOs88CVbcvV
	0DeLXRGlojUx/1XcZjx2Mp4D3/REndbAwFN1ApZPUio909bprtnzlzBwoDE+xrVrHpHGcCc5K5J
	Nt3I8WLznfZgQdpy1stP
X-Received: by 2002:a05:7022:7f12:b0:1b2:4f97:27d7 with SMTP id a92af1059eb24-1b55692891bmr13960347c88.36.1795535092071;
        Tue, 24 Nov 2026 07:44:52 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm58746964c88.9.2026.11.24.07.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:44:51 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v3 1/2] arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
Date: Tue, 24 Nov 2026 15:44:45 +0000
Message-ID: <20261124154446.1094507-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124154446.1094507-1-takano32@gmail.com>
References: <20261124154446.1094507-1-takano32@gmail.com>
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

The GIC-700 #2941627 row in the arm64 silicon-errata table names
ARM64_ERRATUM_2941627 in its Kconfig column, but no Kconfig symbol of
that name exists: the workaround is enabled by
gic_enable_quirk_arm64_2941627() in drivers/irqchip/irq-gic-v3.c,
reached through gic_quirks[].  Other GIC-driver workarounds without a
Kconfig symbol are recorded as "N/A", as in the NVIDIA T241-FABRIC-4
row.

Set the column to "N/A".  Only the column is wrong; the row records the
erratum and stays.

No functional change.  The change and this changelog were written with
the help of an LLM assistant (Hermes Agent); I reviewed both and am
responsible for them.

Fixes: 6fe5c68ee6a1 ("irqchip/gic-v3: Workaround for GIC-700 erratum 2941627")
Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index dc4144ac895b..5dce49a57864 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -291,7 +291,7 @@ stable kernels.
 | ARM            | MMU S3          | #3995052,       | N/A                         |
 |                |                 | #3673557        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
+| ARM            | GIC-700         | #2941627        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | SI L1           | #4311569        | ARM64_ERRATUM_4311569       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0

