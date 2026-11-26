Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685493;
	b=knFwLhcEq4uo201pEoL52XDRTxstwbKcv2jZun4s3GYyTLxV1KhycBUhtzqWl+vT/LWD
	 aQJLoNGWpmOSiaHKlNXWTFWycBF7ODBECMBh03mUkm4ltYiW/KkyISr311TCvw8nnOfSm
	 QjI2Sq3B9wq2bSOj4KGOXrz5BXRWQhAuIeS+kcX5vStckN2fPFwvcVrj75lzhYTZebb/N
	 TiCrfOU7t1eRtoKCSM7MgK+q/Hk759dBd0PSxRr8LVtzJB6vlpGgcbBOJnVZKadvuzPzZ
	 s42eWEAZ5EzOD/EVzKhQFI8XMtAsZ21PMETo5Tc95pTEEeAM0+2zoEDfmnifcUzd39A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lp89Z2vbQqpmCvnOyVvMZ8E+x8ZLxSlWg8zPGPjYRG0=;
	b=gawYHLKOeYH2kosqpmzicae7gWknEOSEQrg+saKtSqBXMmaVspWmKhk3PgxNNMFZBGRX
	 YGIDrsSWL7x5IGotjYIjQG2lA6ac3b1lFHLZ2+OP9JK6WVrxcD5AmxV0VDsrjK7K8QW8K
	 /E0f6Vu08WhikTbTGzjUfFilitd+KKIY2s5ifsAFZaTpjFBNYct0/xNC6w4IDoQ6geMo0
	 eEWaFOoqPTQZ6fMe38vlW61BRRArLZtmb4V5UxkxtnYF2pYA0SJR6YHfQW1ajn4IFQuUk
	 YVhsaDgnUqUqfPWtpf6/iZ1V3CCg7lafVIrRNYCnoFYhcACifIcX4T//W396bmAKUiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JVutTiHb;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0F660A260D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A0F660A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JVutTiHb
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40e30c26a4so1436614766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685491; x=1796290291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lp89Z2vbQqpmCvnOyVvMZ8E+x8ZLxSlWg8zPGPjYRG0=;
        b=JVutTiHbNuoLxsHio8HUw628/7LEpJ4ZPHcYYSWeKqStTw4lEfAgVQGSjp7LlNR+Nc
         dptCZRvR+2EVvHMOu+lmhI/lwbNYGzSFnLGw5k5wGWaGTI/yCmYMF6o59WsJvcJGd3A/
         wlKSn2kLi0wc3z8gxqepfea4cAXtZcMd2nRr6LRS5Hj/CyGw2F+Gg/uvzswfgEDB2ra4
         kb00HkgsdB9bBXwm0rfERJY5tYcPGqnl3OkRLGzULTbp529oWnb9wBJhfCCmf6dYIcNv
         ruywwk31pkUkM8AdQUEu2VfeveFghc8Lio/VDriKQXnqvh5HNIoClXatLauuYAUMDNXt
         Zcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685491; x=1796290291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lp89Z2vbQqpmCvnOyVvMZ8E+x8ZLxSlWg8zPGPjYRG0=;
        b=BdlTQiyALXkFqmYN5iuRel3wHwsuAFMenW9gW1E+ORSDko9chl6geixhU93ia6oK+/
         e/FKsR68P+ULAVXZs0BcILwlz7em/DkO9n8bU041amvkuXrDoEl3RBRuNdexK9ovx7gN
         DKjP6F8eA6d4rx5At38RkAhUJIHbhZrQkelt5mmFbEMZzmk4tRXKv2P6plBEM100Q1Zp
         Uv85c29U8l6m/joDMd2I6oAbuS5Bl9n6M9GBH+/rbIt2dQa5y6rMmOE+eXSGEe/bxHw0
         bInhHt1BVFFhwhQSqP4rYfBqIGqo1FhgvhJBSv5QwvSfQMqS3+PB0lrMZOKFtG4Obijp
         Cm/w==
X-Forwarded-Encrypted: i=1; AL+hErGdNw0YRGB1ApoVdhPTQKwh1Tg2Zi9YXUPPxx1qM7IUh8ePA4tpmZqB7fiNH5ykBPBL51k5KgxJYJC3HTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G1thTQsimOL9KWh9yaD+QcGs+y0iax1VfzxF9rfzll4tKpuB3
	VuF0f8pDvaAIKTVlUSiYMHwQ3CjRnwuUMJWWGAfl/lh7cXiDrSk2l3iT
X-Gm-Gg: AZFdTZdaCXO8U4DVf8Jdq0fB4uCJ2cwsOEUe+p4u3bpR26h7x2NW9turo7lOWFJ5KWw
	VgVM+3xTXhzF5j20XX6rxEHp7ZM1Z3MHi5Xwbt+0gfEKXD7y70zlmzwPNd4TlGUyt9+OsE8VWWR
	PW32gqxSP8UNoxs5fl3PPhO64i48dvN3r69WSGY6PbQ3hOfcxqekpDIn4R2SyXJfEM4aV0Ul2LO
	ib7TzDGx5OjB4so8r5oMPNFXDGED1sd/u1tctMKb0TAipXnbYxPEKyYEryFDDQyyrOmFRQpfr+2
	6GSbeQnn5iC2r35PAb9bpZTCjvodwkjMWaBJOLrovUQWhaxyGO3Oq1enhbLCk3tzLkjklFiEzBh
	Kr0Porib6zzRsL8ptF2nBfPtScyNj54ZLBFu2/NUFTrC6I4vpwMMZh2C2vucF0KavMr76FTF4as
	7J3LhPVePXqjBkpzhDZVfJYHJWVobyE5CWP6Z/u6C1RNoSvevvmZ2dzplhDVy+UeHeJn9UHbfQ1
	nHCgRxoyh2yX8F4KI7eJeZHMDysQiHDOwTYHxMmupJR7lsLQEPZXijLJLjYTJaCAqeFylfcynaz
	26w+jBHyFQoM2Ge26nO6WoIv9mhsjJpKcyUiWMAdBZh1g9ZS9UBkhLVJwvFUAdhNAtUQ/i7uj2v
	YLaiBrn919V//oF24
X-Received: by 2002:a17:907:e106:b0:c51:3382:8ff0 with SMTP id a640c23a62f3a-c5133829107mr1257620766b.12.1795685491348;
        Thu, 26 Nov 2026 01:31:31 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee82sm597090066b.66.2026.11.26.01.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:31:31 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 12/18] sparc32: recognize the legacy LEON firmware machine ID
Date: Thu, 26 Nov 2026 10:30:17 +0100
Message-ID: <20261126093106.1345825-13-linmag7@gmail.com>
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

Factory GR-LEON4-ITX firmware reports IDPROM type 0x31. Recognize that
legacy LEON identifier in the machine-name table. This only corrects
the diagnostic; CPU identification and IDPROM contents are unchanged.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/include/asm/machines.h | 1 +
 arch/sparc/kernel/idprom.c        | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/sparc/include/asm/machines.h b/arch/sparc/include/asm/machines.h
index 9f78f70c6f11..ee79cc8e929c 100644
--- a/arch/sparc/include/asm/machines.h
+++ b/arch/sparc/include/asm/machines.h
@@ -32,6 +32,7 @@ struct Sun_Machine_Models {
 #define SM_TYP_MASK   0x0f
 
 /* Leon machines */
+#define M_LEON2_SOC   0x01    /* Legacy LEON firmware ID */
 #define M_LEON3_SOC   0x02    /* Leon3 SoC */
 
 /* Sun4m machines, these predate the OpenBoot.  These values only mean
diff --git a/arch/sparc/kernel/idprom.c b/arch/sparc/kernel/idprom.c
index d6c46d512220..8aba9b4d4498 100644
--- a/arch/sparc/kernel/idprom.c
+++ b/arch/sparc/kernel/idprom.c
@@ -29,6 +29,8 @@ static struct idprom idprom_buffer;
  */
 static struct Sun_Machine_Models Sun_Machines[] = {
 /* First, Leon */
+{ .name = "LEON system (legacy firmware ID)",
+	.id_machtype = (M_LEON | M_LEON2_SOC) },
 { .name = "Leon3 System-on-a-Chip",  .id_machtype = (M_LEON | M_LEON3_SOC) },
 /* Finally, early Sun4m's */
 { .name = "Sun4m SparcSystem600",    .id_machtype = (SM_SUN4M | SM_4M_SS60) },
-- 
2.43.0

