Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196749;
	b=fULTYqzBONTHJ8OcCIuP2UGeD35y7m5kprpWf1URmntPe/yOJoYG+vlGftnaxFPumwLJ
	 yoJQUZT6wQ1ekyFe5e18HcA81wFL3kNsl/fNvHpYBLf7lj1DYS6cJ+2r/PbI4odV/VcWE
	 4X5ocTFOJOE2kx+HxPpVqeMapx8QAqfOuBxy1J35hvL8XOf+8sHl5RMB/AVa1eA3sFgu2
	 9712Ukk6Org+KbNhmlDUjdvQjRxsHpGjt043jdzRhmOYrUFYDTcnYFG0xcJATioruH6Xf
	 mYsITzrZLYpZP/43qY1bRlFtIkyE+U1RKtAXElTnFbHYUmuaMNSod1JqwJIJzHyC39A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aLqQKB4BJytG6FOI8SN765Q87Olbs6zTh7UfW+Lz9ZU=;
	b=aArFKblrf6lNOfJx0ICGLkjotXqXcY4lcNude191ys/rqdnNCjHR2WajCdBh9oG2Rw5+
	 bjwDb98ApgzlG0dMZea33rDCJOYezu9aHmQx5eGhwNWo79s1Ib+W3urDFUUETJA93d0xK
	 lRsBhzOMbcqb6V1VnxKuXDq7+uHj4wMWtOKk7EbJYxyrqZ/KeRrpxp6nPN9YDGKh0b5I3
	 1rroKAI6kITdm3l+EBzlbMJ9nFffjgS5MNEkz/G31/kIkI5x8LrtATvy8E2J6EeUOuM45
	 YNfBPk23m2PaI4yTVEErc+y6Q4EEr46EHB3JGjm1ha+VOsN4j5IZ/3Z7RIRUgLewlQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v/87VnF5";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC1E60A2627
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BC1E60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v/87VnF5
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so685559a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196748; x=1795801548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLqQKB4BJytG6FOI8SN765Q87Olbs6zTh7UfW+Lz9ZU=;
        b=v/87VnF5tXFpuu6GALzSsOrSSjXipLKN2LQSKz8JtxW5ShYYXg1ERwBmNZyo/7pJr/
         NQZT4ctWlE9rThx1XyddGk1v/DTD7iIPy1utk6xI/+YlpZDN0Bg3z0iu2wltwx+igLwZ
         G7Y9e7DTvEg1iRQsDQGh7020PIv2zJtUk9ThS/g04QRGPp00045NJnBzNRjkRRIxUsM5
         /S/v57Df1ajy5xtiipWqtnfOqa9q67ybfggt2SOfG7FAilqEA8P3ZrRZ7dSlqkQ/OwSh
         lslnb5XfmLaX+41xVcw/pOMmL7PorzPG5yQk+fSiddyHtttl7lJZqI0qX5MwkNwYLN6x
         EadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196748; x=1795801548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLqQKB4BJytG6FOI8SN765Q87Olbs6zTh7UfW+Lz9ZU=;
        b=02KBuX0Ga/QdiEENS/0mY5sMkc55TCNs0OaICz9wU342KxgCbBXMoXqOG83O0PwmUn
         QuSMjySOKhmzaUpjlGg8URhowNJlWamw9wbgnnukub4fvfW2rl1sUPUAEpZBMDZB8hvR
         VK7QDLJkDu+v2ERi3IokIlIbwM7jw4+ZZ3JbYOWjt321FD0csYHLTNcZpg9W/f1P1qMe
         77lhUKpLtBkJKD2nYpRwTILiyNfxWls8YwFEWK7W6SnbVzO2lQMZUcRryJkmp1s22V1I
         p5PAAShX8SJAbMKYNpjBf1kPM8Y7KQ2Mi2xsg2ElIHaMS50If2q+NrzhlDs1r66tr/pT
         q+cg==
X-Forwarded-Encrypted: i=1; AL+hErFA5eNLo6DXw8Z59VL4+ux84kI3qfhuNXZnq2ixrO6P45HhvmXRLrQcvvNunabAp8IRdDk0txCyfHVdSnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TH/162CxBJyPQhG0Gt2xDKjI5eEGeNAzNX2dSg/24P9v5VFuY
	I3WqsT0uesSFocoAbyTd9olQia7r2LoL0nXJh1nm+o/VSKy82nB930lI
X-Gm-Gg: AZFdTZexunJwf+ejaBmfWSO6Y9cyTKSaJVhRALRVvlAWqMbTd+0fn4IctB/v51ughUy
	bZhyDdqS1Sq4N9WeF7liK2X/cBOsTo4FJtFHy7Htu6LiqvXw87th0OkWVA3cxE9h4OED1+k8KZW
	VIAHVJNOLsesj8ti0G0dnP22O3tOGnjT6f8RQmbm1FZvlzaGXMx4vOVWNr4TIT7vyW2+6hOPgvq
	QbaC8aAUfFXPJbdmm7bp8WGa1f3RuKkdLx/Yuq8GA1btkL5RZlBYLHykthbJmjHG0onbThv+CBe
	cdRl/cnc2HKUcjAq5oI62ih1tF8I+eI8TRMVGZnXZqILEb9Qy8ABV4o15e6s2PNXRKmPEzomrvu
	NzKQqgJFf+bkMT6yqk2pGMdbvCM/q9ZrRIQOLpZ0tE1p+HjAG1GYU7BoFV2bn4rCuv3yw/d1Bnx
	3wf0tlFKk6irt8bXAdZvOZbiUtl5csSLuhAffxrQnUmEq5imz1MCqmG8FnX3ejUFDMUC+jm+5a8
	MVCBnwVGOcPIWpB+Ql0I4B6L2p7SSONdpkBTuLHBDTO+/Atfw/5fdlWpDENvIH+TzGFG6grC6Qf
	I1SPwSbFfOUit4APIhFVhZoq4xmxrz1m61wuMZXe759gRb4=
X-Received: by 2002:a17:90b:3e81:b0:3b3:fd13:683d with SMTP id 98e67ed59e1d1-3b41cb1bc6dmr2684467a91.55.1795196748255;
        Fri, 20 Nov 2026 09:45:48 -0800 (PST)
Received: from debian.prasanth ([103.177.82.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b703530sm58052a91.1.2026.11.20.09.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:45:47 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	neal_liu@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v2 0/2] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Fri, 20 Nov 2026 23:14:38 +0530
Message-ID: <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
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

Hi,

This series exposes permitted AST2600 OTP data through root-only NVMEM
for userspace diagnostics using raw offsets. It adds the SBC NVMEM
binding and a read-only driver adapted from ASPEED's downstream driver.

Changes since v1:
- Add the separate binding patch and rename the driver nvmem-aspeed-otp.
- Poll once after a 1-us delay; retain the 100-ms timeout and log failures.
- Initialize read mode once at probe and stop commands after a timeout.
- Use a fixed secure-prefix keepout and check the live SEC54 range on reads.
- Simplify copying, locking, configuration and Kconfig help.

Tested on B650D4U (AST2600 A3), OpenBMC Linux 6.18.24 and upstream-based
Linux 7.4-rc1: repeated reads, cross-pair reads and 40 reads from four
concurrent readers passed. A 12-byte range matched the saved ASPEED-derived
reference fingerprint. The 7.4-rc1 RAM boot used the working OpenBMC DTB
and initramfs and also passed the final-pair comparison. ARM zImage built
successfully.

AI assisted with driver revisions, validation tooling and patch text,
using the downstream code, review comments and Neal's hardware guidance.
Hardware tests were run by the submitter.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
  nvmem: aspeed: Add read-only AST2600 OTP support

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
