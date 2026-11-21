Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795250399;
	b=xSQJw2cV8f4j0W0Gwp3He9WTmTNCGwSCZDXYQHgJUrGJDRDDE1EmY3EmWgFDT2ip1vHr
	 +g/4UVaieXJsaO28Yi0H2JHK+E/SsRTu1DLFdYjMXhzYz/6C7YH58WS2L0vPLf8uKDAPM
	 L1/tj8i7ei59DJctK121kJzN2E1CvdvTKuIot/4MhovqKFnL8X1nZrmqaZFSSX+e0rw9X
	 4qLYkepr1I5oyZ/pnOlFzpXCZXA6V7m/yrQx31NngJhUEG4BnmWSOJLA8DoBX2Be/bbZF
	 GHkN6KjqT+wbg4TJ4D7vrYIkZqts3uQuSP+3Xs7fNBViF+HBLqGtSfrTkMMTbzFPOKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795250399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qnUmBWM7OQjc7vI6DcTZCPpSFxVlwkP7wP8mWeAtaQA=;
	b=pBEAopYCrtfOpOUax4HvEk8Z326bfUHkEXxIrtQQRC3DzDSCWaqT+4eyJq+CBNkjZWiB
	 rClH7cbq/y5EvC+xCIC0BE7pAfAOa16eOzI1aEnh3Fb4NA8haZz3hRkSwKS1VSnp1wZDi
	 qF92wEZayq1Xyd+orEcM856n6Ix4w/WAw8SDUsFFJPo0EGNQCDdRkL8FWatdar6IKleBr
	 RXGf8P98Q3FN3S/PvHqy0/r7Nx9uhwyTd5wKQoYdhXbXQieFGtaRKoF+htAkcl+0mcbqt
	 4R3nXjq6ROKP2f0XxhsaGmbfxIXb9jnl2crY4k2uKPDKtM/nG9wBROuN5oyCqCakFxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzKN3r2G;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DA3606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1DA3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzKN3r2G
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3869b68caecso887890eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795250398; x=1795855198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnUmBWM7OQjc7vI6DcTZCPpSFxVlwkP7wP8mWeAtaQA=;
        b=pzKN3r2Gn9fyGasRv7kFd2gYeFury8nRc9seYNJSrnxhFfm2HQZUTiEJrvROw3Szhh
         VimU+6vj0a8DG+VvRlScPCOYbFKU1IkzAGornZKdPgiCfXUA0WfYUQDbgEMTLMydttwl
         y3NO7yCZqwV29YoE8YE28y7L/d4CfyR3lc+gLIcDrOJV18IynRsjj612xZYuz6r3Jble
         duK2OYyI8r16DBu48OHh+1v2nFXk3EQxLMmXscLcr/7ftm+Yf9Mh7pjO3skaFFxpPmIE
         BWZlOTVaP62NOmcvmUx6YXHHbelnOEetJW4nMcwsIRj4k9S1qkFa6h7AZlvs1y2nlblB
         WG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795250398; x=1795855198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnUmBWM7OQjc7vI6DcTZCPpSFxVlwkP7wP8mWeAtaQA=;
        b=vcWfiUD/bSfP9BrvXezuPyp0vPDYB2P+IWj/no9HNxR9JRVk5q9Q1mRZc78qfVkjjl
         z2L+sNHw5r2lJVqEvSPXVL6j/Xvmbo0ZgzF52XPRaQUwrWWmAhveq//OclKSPoSY71th
         lLJQeD3Q3N0DFEXAXlvTH6evevG7Kx3nvvHEhvoK8jgwQDVsKvXn+3A9YFfGwnIjKQSJ
         w0R8dvZOQ9FpJw00GLbvFu+L2IVyjDmpq7aM6hYeoFRV6zE2x+z4LtIwaFTIQFvmnDB7
         z+wij3bOr5BL1mPFkYnldMxfsK7dfXg+XPlseYbY9qIiixQ2KiLOGDf4jSTQPQ1CTxGy
         Utvg==
X-Forwarded-Encrypted: i=1; AL+hErF8LNRfgskMb++D3q/Ga/o6YpHYrSmIXTemSwdKXSr7kcfewGTHsTtLX9C+vLzbWkh9hux9qT5MbkSEplI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hs4+tR9OC3A1ZXbN5lsXj2e4MUMve662MXYm6XaWOZkwqZNhE
	ZvVDQfIlzbns6+Ngb5kEYcalER210jflcwNGmagzoYM1J8ZxebtzGWfF
X-Gm-Gg: AZFdTZe5a/s+L5ahZxqlCxoRIt3PsyvfWk1s8izGG7Xb5iZs9N48mLePDRPjaGlQuJQ
	ibHiX2RzHdymihmfDVw12LCQoBwFJ+cs5GtDoffcmPPdHWDSghjkqGBBKbBXVDwCSIIHNsBlAFF
	yyCNxAu3eQjtjTY2SI86FR0uNHiF/Jw1WL6EI1qW3TLa4aLCLXL//RUYPCldwEZcSfbdIz/nBUQ
	+5jcfK9vqCncu6NvNs0uCCom/iHsomvswY9e4jyAEm8XKuLlmay4rWRbuCN3oDsE5a2ynBf1seU
	UeZcCplZ8XGhYml9Y5joErjG5ZZDMYvozIg9fxrVfv44nrkyKPukY3CBZBmZHbyx9a5G0K4TWAX
	TGOjIOfY5ILG4ESHd4Kf0nfLQk/gVeqcSRgFS32Ry3GTOVsCviVJ2lyUVdNnrys5cfrCnZEg7jJ
	66eXUZSaNh2qB6j1FeXm7QeICTgzKYCwzExcZA0YiZAOh5im9SNvnNbjkmbpYxm+vAVvfAJaC91
	ERJ+Z+eVBrPqezD0CdgfYq96AqGOkB3ZRrYVAy0/Zb6Kb8rpMAcBv089Bd0pp8ivC/qUiahd8IE
	0t2ipFV0JZmKF9LLV5iN4bm0oxnSSzqFtqDDvxp3Pw==
X-Received: by 2002:a05:7300:6da7:b0:384:5885:2f81 with SMTP id 5a478bee46e88-3856c0c7c05mr7915169eec.5.1795250397903;
        Sat, 21 Nov 2026 00:39:57 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm14113093eec.2.2026.11.21.00.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:39:57 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 2/2] arm64: errata: Fix Falkor E1041 Kconfig name
Date: Sat, 21 Nov 2026 08:39:50 +0000
Message-ID: <20261121083950.1957044-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121083950.1957044-1-takano32@gmail.com>
References: <20261121083950.1957044-1-takano32@gmail.com>
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

The Falkor E1041 entry in the arm64 silicon-errata table names
QCOM_FALKOR_ERRATUM_1041, but the symbol is QCOM_FALKOR_ERRATUM_E1041: it
is defined in arch/arm64/Kconfig and used in
arch/arm64/include/asm/assembler.h.  Correct the name in the table.

The E1003 and E1009 rows name QCOM_FALKOR_ERRATUM_1003 and
QCOM_FALKOR_ERRATUM_1009; the E in the erratum ID is not part of either
symbol name, so an E-less name in the E1041 row looked consistent.
QCOM_FALKOR_ERRATUM_E1041 is the only Falkor symbol that carries the E.

The symbol in arch/arm64/Kconfig is spelled correctly; only the table
entry is wrong.

No functional change; this only touches Documentation, so no build was
run.  The change and this changelog were written with the help of an LLM
assistant (Hermes Agent); I reviewed both and am responsible for them.

Fixes: 932b50c7c1c6 ("arm64: Add software workaround for Falkor erratum 1041")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: the change is the same as in v1; only the index and hunk line
numbers moved with the rebase.  One changelog sentence is replaced in
each patch: in 1/2 v1 called the table row the tree's only record of
the erratum, but irq-gic-v3.c records it in gic_quirks[]; in 2/2 the
sentence about the symbol is reworded to name arch/arm64/Kconfig.
Both changelogs now say that no build was run.
v1: https://lore.kernel.org/all/20261106234541.1474324-1-takano32@gmail.com/
A duplicate submission went out the same night with different subjects
on 1/2 and 2/2 (20261106235616.1533003); please ignore it.

 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 4bb5707a880a..cc7bf2b6a09b 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -378,7 +378,7 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | QDF2400 ITS     | E0065           | QCOM_QDF2400_ERRATUM_0065   |
 +----------------+-----------------+-----------------+-----------------------------+
-| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_1041    |
+| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_E1041   |
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_1463225       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0

