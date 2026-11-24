Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535095;
	b=TWw6P+cGaUdOeB4cOoLiaY1aTXQrgXyeOTiCxSJeeXDV3SRUFC34jRlHw06/tHgcYHnW
	 j43TgCEnsP0c/211kERTe65ZBDXborXssVn1To7yYbzj8SVc+T6wF9Z6B8zAy1Ghf6/wF
	 AxQOLPhsvGEvNG0rHv1AH9ec4GEon60HwTpXZNyFO+dbgoNJ7BmLwDnx6se9AnDCCJKqI
	 kGx3xUUrQBIS9OPFBl6OEN9B2R7NWV+JK+UL81TR1biBj65wlULhX44qC9IJhi0u8G2ML
	 u28IlZPpOC3jCWv8Ap0A1+2MZjeycULSrwgPcO+foi3+yW54fWdr3ipPM2EpHHIGvng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9mjyaWQC6SVnzKDMu2HOf5eLMdckGl8sK2GwpVxh/TY=;
	b=icj6fhV9ldq7VRj61yGat2coTenqIQRyZWrxjNQg74d//RRHMHW2fYuy0Y3ueU+o+Oqd
	 aaSmTJYAuQbiSWzDeH+mewKmUIDQ2CULGhNvICqh5cxWYODMrBTlP3bMjfpefAg8jl2mE
	 9YOsKEexScXhtJmCU5IFWBzBJLJIxd0hz2tM9IG8cFCPn5mPOyfOlsA7swQfuSwZa1TPa
	 zPvM60LUWP+9SlEDg8bNkJkHnHVEug0Ypp8uEKZpbpjrGdRJyIuVL5G+C+nfOoNA8K6dC
	 xnDUJuoaSUoQbgwXnbIs3AD1c3MwAf3dGmy48ZHAa/VATWrF07k5BFKgrETJAkt6mVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erRhFTRI;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEB6606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CEB6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erRhFTRI
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2136801c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535094; x=1796139894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mjyaWQC6SVnzKDMu2HOf5eLMdckGl8sK2GwpVxh/TY=;
        b=erRhFTRIESVHa4MVmmAwtnkzTILgN2kxIwMcta4WCneblnsNHnLpA+4lHENubl+1EB
         NeX7cdDVjZ0UsVlhceHkgtde8Smzh/lFTINcZNjicqTzQC0yerbIUe0jbdWnTJMDcUVP
         jzroSfv4NFogn3XA4MAJLpoZtnKPtXO3IlboXK5Y1phBgw6owPga9y9eVetx1ifpAdxy
         kCSN/aiIyJT54cx76N1KyoPEOD59pOsSyHR6hz0KiuUjUN3jnSZSyFtVa2ULnEPIl+Ah
         Fq766EE64Um8UDL345C7mmI+RfopdE30K1Ish9N3Hckj3nOWVQuj1MKXh3Ela0DlkMeK
         P9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535094; x=1796139894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9mjyaWQC6SVnzKDMu2HOf5eLMdckGl8sK2GwpVxh/TY=;
        b=lwL9aFGoh3IdF5PVF7WWrV0Ian7j/X9/+t1y6tHHZDefRpogvrOirmndsigkGj+DVW
         PqdFe7ZLIIoejK5kCJxD3OAIWuvYI7wv3p6HsWEH8pSVxHyQBYWe9V92hEeH1n5Y3j3F
         jG2DMU5QvXH78gMQNkOwnSPE/E7/XOiy8C5T//CaCYbISNySyw+h+6LBP5y8sLtOsEzP
         Wl4RGVbawLeVwJn8LWe6iKm29fwYRO4JmjhQV2pA0BS2va7Ul6SbtM01gdSaLqTIvgM4
         Ykd28yG79aDw6RmxMgRODpaQnChdTLw+PWD5yuo7o4zo+3WdY7sWSv3s9TdpiBjuzXxc
         x5LQ==
X-Forwarded-Encrypted: i=1; AL+hErG6RgExYZ/7B3P3ni4JHumnk14TOYr+136oWZwVCe33g3/20F8pVXPMm0RnQViAH7Ztjgc3VbCLXUV2myI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jpsutXrvwlZiyu8LfMk4QKm2/wfInB+CzzAtpKDZ89JqZXnBJ
	8KZbpMRK1Jux4LdmLFenuTh/7xhXQys5EPshL6DfneeNAeG2uigqc2yt
X-Gm-Gg: AZFdTZdAL4dWPBNtKFXtKr8CwsQZtBSVhrdAwRe14YzAqgVMxit82QR+IhI7hlOuEXK
	Sw6BUVuo0fVbFhzLWwU/mf5j2znwKjvYGrfqGMe3loYvirap1r8bcHzxEB9nVeF/s4jrkGavq6z
	tH2dPTBs+/nyLHtnoKbyLBNY0/elbQfWvcwGo50IGxcY2YK1Bdlk+t2czCCojuPJew0n4y6niYU
	x+F7Ud4qHGVaL7OzJANYoFwzSuDIzzcAKifMsKlBZBQpuDiQ0ePyiT7/4zOHfZ0jCEvT1ION7Q8
	CP63LSm/pfmcFCq6+CKvsVNHWyOFHHWOre0zWOMHPP1IXILciAOptwco7NnGpD9MxXK7KVhMKcZ
	sR2t50x9Yw6KW3EniLmtr7reia2xf0W6eVucqYVHCiy/gnhkeo1My40bJB7JfKHQiUeGOSXcK1x
	qGAEbqJasyatv7F693x6C24P7voov2MWi1HU33+awyb4rQAtjz698vs5w1+X186ahYyBsdivahy
	sWMksC7hbRjZ9h1d7fUJVydr61vRwO9Hq3EEb1mXCuR4G1HUILd0jhgzanwwtjSARC2TI0E8PKW
	e8IdMHkUFk9VJmSna7N9SnoddwGFLrmhUBIdEovA9w==
X-Received: by 2002:a05:701b:21cd:b0:1b3:be0d:696c with SMTP id a92af1059eb24-1b5567e661emr14794229c88.1.1795535094310;
        Tue, 24 Nov 2026 07:44:54 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm58746964c88.9.2026.11.24.07.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:44:54 -0800 (PST)
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
Subject: [PATCH v3 2/2] arm64: errata: Fix Falkor E1041 Kconfig name
Date: Tue, 24 Nov 2026 15:44:46 +0000
Message-ID: <20261124154446.1094507-3-takano32@gmail.com>
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

The Falkor E1041 row in the arm64 silicon-errata table names
QCOM_FALKOR_ERRATUM_1041, but the symbol is QCOM_FALKOR_ERRATUM_E1041,
defined in arch/arm64/Kconfig and used in
arch/arm64/include/asm/assembler.h.  The E-less spelling matched the
E1003 and E1009 rows and looked consistent; QCOM_FALKOR_ERRATUM_E1041 is
the only Falkor symbol that carries the E.

Only the Kconfig column is wrong.

No functional change.  The change and this changelog were written with
the help of an LLM assistant (Hermes Agent); I reviewed both and am
responsible for them.

Fixes: 932b50c7c1c6 ("arm64: Add software workaround for Falkor erratum 1041")
Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 5dce49a57864..6e2d94a8d3c0 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -372,7 +372,7 @@ stable kernels.
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

