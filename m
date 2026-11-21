Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795250397;
	b=HqMz1LFBZnL+Gculfa37etzTZQwZYeFPhvpWRy73NtjWnerPZE9zp12wTrFz1XGwZZYU
	 5sed+AUhWW/nUxXupedPdWf+GjUCw92SUREcQ4PH4XURRMapA+F9jzLJUv+FxP41hAE84
	 Q/7eoiMLie4YdpSLFr1vtnkLaQW/pGdANSmGVZRMyfyw/T1fuNmTLtZ/BbVTfio2u0vZg
	 +gLs7v3QuipRAuvSCw8fz8uWSNoOiHx8g+DmLkYLVto5Mf0fLiGMqRE//nTzxWaVPNk8p
	 +hTubOkAmrOlWq+qMxOuuoYFhYJfeR+vaOA8vSiBiDCiLhdzLV67LM3aoctCBK7KLsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795250397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wAQ4qsK1Mx7pxpG0s5BlrPk5n0YkbGCnSR/VcQSO+vE=;
	b=H370oKxFCKnJjZphSdttMREhtm3vd135A49+16OFheyAObu6LXboomfZw8mQjG7F5XLY
	 DoQkDcKW7R02GPk4mdnMspV2yVGjbZR8Z6ekAEGhbiSFDd81nKKXEnYY9W8HIaLu3BfOK
	 CJIgggSTbZdF2cIH6Q31QdDwdplf964qkg99J9rsSbHzOTfBe/ph+YiCef/MCSeC12vXG
	 RtA/EvlM2kn3FpeVyZ5I4GtAG8zaByfSjjrtZpTtOP/ZKMrqbQb7F6+KTHVVVB/bA38Z4
	 A8iV9o+sglHDpugvIEz4ZsVLSZzIeel+qVDrVEGX6iU6wb7txAK34qGxJ9errXgn5Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucFgREx5;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B259606A331
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B259606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucFgREx5
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38431138772so2155142eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795250396; x=1795855196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAQ4qsK1Mx7pxpG0s5BlrPk5n0YkbGCnSR/VcQSO+vE=;
        b=ucFgREx5eG5Gp4dDGaFliObd3ODZT6HLUD985oyy+nHy1jRhSIa512OvGXlC8uSosx
         P3n8oqvVBjU0MsBZCDToYZ1zVyNed+c10yD+qzxP2aEj/UazFTy7rq59OEIhFitvqY4W
         XKfdrooOeY87qjKzFiRlF40ajX9YdmY8p7K2Xia0nqm+prTOEkne4EYxpFHsM5b8zQrA
         dGcmoo/63WXNzcCgURNkddcycnwcYKq8OrHVQYK/AWeyKrNk0DpzPP9Pl4QK3jqs66Fg
         1FeB8epKyHV1rGTZSIIhkLcTUk3gaaaKD3GMeCvmYQB5trrxaBA0WLWUydKFYFKJ9oKt
         Ziww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795250396; x=1795855196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAQ4qsK1Mx7pxpG0s5BlrPk5n0YkbGCnSR/VcQSO+vE=;
        b=Ee5snDEAZnjzrCL3GTcwzRFPymTCWmq4qX+oyGwO0Z5DsOJu4RpJcfyt+C9HMtoqAV
         k+8ljTYgnla71IpqPEN4iYYzoKK4+7nym2VBolhv1uRCx/+SzvrOGJd8hUaGYw309wZd
         W6O3p1K8UuuCFxM8XiG4ZclEC1h/vaJsxybplsJtyPBfjQvkm4+3WLF56NU6eLoy0BEc
         BPYwZG9WicOI/TtY3UBXH89xeHGS19Auo+bRClo288tjxXQ1xUUQQaA2zMBCvfOEpV39
         CrCCXnW7uKtuSNYPWZXzbmBTQjU8WR1nT6nBn4Cx1MTWIDQx5fgQI2e+3+/euQinuHde
         IlUw==
X-Forwarded-Encrypted: i=1; AL+hErE0Xz+qIC7L4GfnUItDKQ2CAmz9GScEDkP6cu8Eh6WcLFu96OHtOVaLH6ARFhhU1UU3BOHE/RKgDJhgwHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8igv0vYx6WYhSQL31bX4JirOl95UvwqCLyOdkP3yhMMBO/TIdQ
	fR/1xzgfSysyu3tkHDecoIJeO3zz6OC8iGHtxqNhLOx5dcJF7SFAUufl
X-Gm-Gg: AZFdTZcoPrlWckMyuRWpqR0gOL/EIsXU5b205cM383fZErAT96PyUTBZvHeNZl4QZ8W
	194PdxqhZr0MJuXy5K3FEP3GkU7YqwZ+dzxCS4StgRFSFSUFCQGV/nq5UXKVlvF2/Iwispa2ab7
	zIxnBZgoWxYZTxr7szDBjLFKn6z7fuWC/k0QKG3TVj2arCH82GCLS4yszkTZ4rAzrwL4ISkGw40
	11c2cCjFd9aT7hMNJLRRg+JyuZ5HE6P7R+1tgkmW5MPkOL36N786ibNfPpdwMeFzE4M8ZX+dHet
	HSJs+v02HnYSu5K9HjnH0mO53JGUATvcoGjuE3zqu3dVPRaNQDqDsktFm3axYh5I1wS3UFdsxbi
	nBrn3p2L756hayzvsluYG9lzyHbyt8XiikpAE1jwFllo8TudeOf2z3A6dt2kd9ei8Yz7jRzYRgZ
	6t5g132eWNLjaJdXmRhsEq67hXZMheo2BQnwx5LzcAZ52GTWQaXPM4Q2ET1XD3Alv0hAio7ijgw
	VGQVBGgh+djEuYF29qQ5dl1ga0vcv2b9ifE44o946mrtyoZLUrUG7JWL5jHjREz5q5/norleAjp
	djsG3GI3rEfUSuRw4Ttk
X-Received: by 2002:a05:7300:6da7:b0:376:77e6:a66 with SMTP id 5a478bee46e88-385704509cdmr7474745eec.16.1795250396001;
        Sat, 21 Nov 2026 00:39:56 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm14113093eec.2.2026.11.21.00.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:39:55 -0800 (PST)
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
Subject: [PATCH v2 1/2] arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
Date: Sat, 21 Nov 2026 08:39:49 +0000
Message-ID: <20261121083950.1957044-2-takano32@gmail.com>
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

The GIC-700 #2941627 entry in the arm64 silicon-errata table names
ARM64_ERRATUM_2941627 in its Kconfig column, but no Kconfig file defines
that symbol and no code refers to it.

The workaround has no Kconfig option: drivers/irqchip/irq-gic-v3.c
passes the GICD_IIDR value to gic_enable_quirks(), which compares it
against gic_quirks[]; the matching quirk,
gic_enable_quirk_arm64_2941627(), enables a static branch.  The table
already records GIC-driver workarounds that have no Kconfig symbol as
"N/A", for example the NVIDIA T241-FABRIC-4 row, whose workaround is
likewise in the GIC driver.

Set the Kconfig column to "N/A" for this row.  Leave the row in place:
only the Kconfig column is wrong, and the table should keep recording the
erratum.

No functional change; this only touches Documentation, so no build was
run.  The change and this changelog were written with the help of an LLM
assistant (Hermes Agent); I reviewed both and am responsible for them.

Fixes: 6fe5c68ee6a1 ("irqchip/gic-v3: Workaround for GIC-700 erratum 2941627")
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
index bffaa46c664b..4bb5707a880a 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -297,7 +297,7 @@ stable kernels.
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

