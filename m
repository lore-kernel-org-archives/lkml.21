Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685488;
	b=UOOUQtoknklZkZMlw3H2mfHZMWkH1fIlDsPXWwf/hxD5Lj8j2e4p8cN5Pqc6baRqOfaz
	 dB/YBhsXnVQP20D2/EMQwdUDpKELrL6DMC+ZGim6MBXCInvNOBlbE6kpQjdYyiuGuozHa
	 /+5enmcFPMCqU7oUR9HsQ17gSmC3ufseo8AcPziMFi7oYgNa2SkvV2FWrP2e5OO1fvDAD
	 Tlj9ZZwwV3O5jEKKdAf7aI5TiOyidstJgNUiIGkBr+12yhWSsXisRFz5Cp7jF3KdjZiU1
	 usRRf4QaNXgwC1D/cqBHv0u0wSL6NPaWXTJpk4YyA5CMbzuBIUlznlD1/RuTZVRCikw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fTfPWmjdXcR29q4OjFYAuSBZvUxhoQbc+hR0Ja7uEF4=;
	b=PPa3WGfOO2zaXGQQDW3aX1VT0lynLWt02hc+CAY9Z0WV2V3QkNM81xJx76v0ExrsKSZB
	 IGTY8fE0tZMWU5h4tedvtEfu1egQsIHN5wSifoiIxPXRj1amMXNrVGJFVxPtOlJVszTai
	 oQu4hSBOTyne5SJcipGbFpBcGnx8+L8cKyXwQq9hTjHYvBq/+nm2pPoMnmKhGnL2/JGH6
	 Fj1PBE0Lk+Lyq/fmdOhlalDMzEP6fp98M+34Q2KpXlv9QXR93j4Jq0Lc/fZTSPi+C5qGd
	 BvyKHO1gwbBTNVYXypm364wVKYg2sIXRIGIfeqFh0PieVd5hIKzBe9fV4nXWgPtu5bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AorVr+io;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16998606A6A6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16998606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AorVr+io
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so8839030a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685486; x=1796290286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTfPWmjdXcR29q4OjFYAuSBZvUxhoQbc+hR0Ja7uEF4=;
        b=AorVr+io/iVoZGf0WuIbZnbRTh8K9Mjy577xNhiHemTOtUdfqxvG8R0gxb2bruBW5w
         hAfdNq56amrf2kABnfwjiKl8uvHt1tl3DepaOUKRVq4K6KKXuk5rUoSH7TP1ib/B00pQ
         zPPvuGF1gG4crsGZZWonpt9ELxAywmeSTrQTnQvTQpCBT016ZBreEyY9Dqz+2CaR20XB
         NFXId2jK9YzyfZBFrr2gdxdF+0C6fk/XBmj9T8gIkziR8a3+Xg2+9FcOaAHQW1pXMSWa
         ZULX8qfIV8wqL1Pu7DYgCNuV0AG4PXTUK1mhCLBuHf+sg8bJigGASttHUaHI+yflse6n
         Bk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685486; x=1796290286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTfPWmjdXcR29q4OjFYAuSBZvUxhoQbc+hR0Ja7uEF4=;
        b=MLmPl1yzHHGE02QhgsrVFRgDpw04S5jUip6DYJK6mI4Bf2bZTCkjuQnBMUPhS/fXoW
         WrR4e8csXn9eHeKzvN+aNrTGcJoHzcypkrG1x4xa8tSDSRWyMCuQFHTNCrKbukp4+VwC
         qzAucVWZUJTBy+Jh9rye9qYl7V/FKO3eyjafiMum17X8I1oxSAuwsjTjresyIHCYodIH
         sGgu5cwcQ++6gODjiGcMftiNAq45b2YB/MJ5ZFFjEHhYVL+T41gDRfJJGF+UGm2zwOHi
         DAheO7arIk8sxAqABb81pLyVxI/xUN4LoNuDn5/yx8quP3NW7uoXTAsMdwGTziqiuQly
         qeOQ==
X-Forwarded-Encrypted: i=1; AL+hErHRNWkkf76Qz40J4ROMwDwWza0AEcFXJgT8+cGcGpe6rusdTWNV2cNtnSjAhci8Nh8oRkbjohT5ZUIRfFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LYFG7xoN4OK4tCTZT7428rlsR9hWky/FdFGLexjWnSS9w3LxV
	IN5b6vKmqTAldvqIsa4P8jY0CWGhubW7CNJcU2koc1Xmqox7hbOb/nE6
X-Gm-Gg: AZFdTZdLNavGWLYLuGA3iputAqrNYb2eOFVHEWNmx9OkK/SGlNXVZScaT9BTJwF5h1J
	vOzZNR2CDlWbHGjz4DtLUpr6XJ2G0vHu3hvWDPGPBg5HZxAuo9kMaPMc1FgpPwxncDNyzlB60wD
	hZTefFZmev1PyIr99Xu3RAuUy5voi/Lvqltch7HB7tQy1KhA+5jbVYCXcgrwSJ3MvtkTS9COIH9
	ArG3JsbggMNIT7j1o81QG+JhN7vi9DyccJCkBk/HK5986xZy8ZeoeEw1QJqaVlZm95Z9xe3uMCw
	OVW3f8xK9cfuHTKpIFI3H/l9weoGRy42JJPupMQLtEDELHShlDs+sKL9yc9UHBJ88+CH0bRtZ1f
	HNyfwsX0cXks6vjAOcfPy/qaOvqtg0D2CPGOV6OWnJW5cWtgxrQf/FXGfuXNpHJEebN2R7JD8yf
	AyvdV7x6QAHfZkgYeqixs8QmqurCWXLeHGyA6+VVBLRAqS4MPdr30jIL70qvF+uHCt01iFRYteE
	0bTgmbXWmJJxSUIlT4WZMNJCOuP/mYmTQdbsPWFhN59vwTM8JkAEHCeZglV+8BheR8LLiN/Easw
	xjg2BxrPlCkYwV730hGXRxh/+ip8qUDs6xP999L6whcEkJIB/CUHIk/CNOZsEfix0BTG2v4=
X-Received: by 2002:a17:907:3f96:b0:c50:4a70:b7f5 with SMTP id a640c23a62f3a-c51961803f5mr605032266b.17.1795685486472;
        Thu, 26 Nov 2026 01:31:26 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee82sm597090066b.66.2026.11.26.01.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:31:26 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 07/18] sparc32: skip unavailable PROM V0 console metadata
Date: Thu, 26 Nov 2026 10:30:12 +0100
Message-ID: <20261126093106.1345825-8-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126093106.1345825-1-linmag7@gmail.com>
References: <20261126093106.1345825-1-linmag7@gmail.com>
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

The factory LEON PROM has a character callback but no pv_stdout.
Skip V0 console discovery when that pointer is absent, leaving explicit
kernel console selection and other PROM versions unchanged.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/prom_32.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/sparc/kernel/prom_32.c b/arch/sparc/kernel/prom_32.c
index 804ca0b2a5b5..29da4e682acc 100644
--- a/arch/sparc/kernel/prom_32.c
+++ b/arch/sparc/kernel/prom_32.c
@@ -223,6 +223,12 @@ void __init of_console_init(void)
 	phandle node;
 	int skip, tmp, fd;
 
+	/* Legacy LEON PROMs provide output callbacks but no console metadata. */
+	if (prom_vers == PROM_V0 && !romvec->pv_stdout) {
+		pr_info("OF stdout unavailable; using kernel console selection\n");
+		return;
+	}
+
 	of_console_path = prom_early_alloc(of_console_path_sz);
 
 	switch (prom_vers) {
-- 
2.43.0

