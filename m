Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795232494;
	b=BXxo2kTwNGg/ca5N3Nl1/ecIpcqqM/lTw8R+uomO9uYOJsUOIc0NNG3as8VV7bZwOpIY
	 /KdB7JTpI5kasnnyBtI96FYNtaazeYgvArDW8MmqKdDIiJ0ch+xuFV6gddD6oUsPFEvN0
	 lbhW8TRe03PIiWVJxJ6I6smdMIeGjTwbMK7FOl1y/p48XpGFbTym1h8IkHkG/+qoF2kxA
	 xkSEIqYyY/2RTgeU/C3VysKMzTc8RYGmTiCUFdg1/58c50o1/aW++9I+VqZC6k9J4Iv6j
	 ZgCDmKS+42f+FTDYVXnMa7U+Kp+GYJaEr8p2E5ys+4+7MJiUJt36HqIVkil5OAJWUAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795232494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=asqkoYbz82hEaVuDlqAKtg9A95Bx0CAB6i8FMp3RVm4=;
	b=s7+sr+hjFEnLRudsegRJkqCvmt5zH51pTvty+sD8tnz16VwnxJJGVuNVHo+mOxZI+K0l
	 gGvPKGw1FSpXLQvolIGyEVvOuBFxeYoz7IT57p6BCxFY8JvW4HSx8HSks9vBYpvWYIb4O
	 E8Qd6bbkjyzbfj4bqGsDQtA7YeZAV5mjJekGAQEb38uLRf28ekdw5aPemaBPinWGTZ5e5
	 tcrX6MPH+QhvcfLewjKMC9KJvAlZeuysBa+pjuuoPmkstmj2y91bXgC6RqZS3QJCB4igP
	 IWUtX6bVTB78SQfPQryFyb9czGoxrlXjyoe/IDTP+Zz2ZKEr1AwS/ZEN/3P2ZBdBIpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vUWXUzwG;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015BE60A260F
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 015BE60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vUWXUzwG
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-382f4710a17so2585552eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795232491; x=1795837291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=asqkoYbz82hEaVuDlqAKtg9A95Bx0CAB6i8FMp3RVm4=;
        b=vUWXUzwGC52jJGg50afKqM2zklel6YGjDNeOwdOmqx9TmRTcl3qsu/SHQ8T8At7QPa
         mHVretCZV3hvh/HNzuEcDdqKIRyJXF0ZqxcqxI1X93Cd8t01NSgH2OrOaYFNckKXj9Ov
         ENJ/loseKJherYBIMmSK9mQphCJmU07AcE0VnvLH+VH3TzDPInb+ANCPnMr1bL93gBUn
         vdOL2oVPNyaWt9SAB240t70ooMfHHu8gUX7+HlsaFAUBkB5vmBUUTqpboeZHzXZz/PY5
         WLizE9CLF19BDYYuQvtOJ7lPssboOHGQu/9rWS9qt11UH84DNNKwNAWMRUX2uObft9P3
         XKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795232491; x=1795837291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asqkoYbz82hEaVuDlqAKtg9A95Bx0CAB6i8FMp3RVm4=;
        b=NEcK9b1/ZixEYCGiP3GyMhpEUZNwMGeKvU8WumDvGH8X2G/hgZPcpS2BtarBy2wjgd
         yWayld4o+8D7PLYEwkR4WgW92QexT4QiHsZm2cwsqKxbDFB3X1Ftb2JdUYFnyX0E8MAw
         G7YFKpp1wI4v+C7+pZ2D5sbAvIu9IRvkOdHBpzOzK7/uiz20lg53+FWcndZaArVUEukf
         fNqPAr600de/OPbSYN5svGyJynbNWA9kQ4oeaClHmDB3K0FxpJ0ScOun/tQ3qYqcv5dC
         lLSi8YMV/8qfQhh2Kgp0M7WSpgL8AvbTaO+2E6XaMGtm9FkzVQuqPzUWjBN4byPqEQKs
         1TDA==
X-Forwarded-Encrypted: i=1; AL+hErERcoHMMCccP8xPuwuEK+iDGMcop5A4nap8SfxAr3n7fcUFCZoeqMceRpCVC/kDEi4qCLkSZ3PQAsJrrrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fkhvo5+Zu6ODiNDg2RBCeXcYRGrrT/v1TzPYNsOeBWmpCycVF
	KGKKwNmP83bn7QptgexyE7+o/dW0TUVCqj7///AgC97euvgt/ts350m7
X-Gm-Gg: AZFdTZccucAkRq0ESFPr4CCvdLqNO3BnLh5YVb7USD4uKcAjeWVwJwLDkaxjd/6+WX0
	LkqndIjGYhCdj67jSb0ogQid1Rb5AA8wInFPW1toBKj9OA0dq5szxvR4egrcf/oftwyXVbo1iu+
	WF6vEPDUQuzMvY28i4AFxbn/kZQctAb8xUlRntesnt1YQ0C0HbeJOP4H14xL0P7I5aN0nJiTdc3
	je3NSOAlMoIavHe+psZc7CrMVuIYDpS0kTjE9UrJhirTP0BRBs+RpiC1qLfLGRKoz319KW5vP+t
	hunONwP0evtMjtGLEeOUnQh1cTMeQTKLNO4NJ7Pcy3tnhD21z9V0JraPW4WnfGDro0E+UCi1QnW
	MiKYe5h7ixjuzq+2kLqDTfF3oFsIgz5K0M771xrJvjnH/1n/jKtXZ178jSC7q6ZdQ86QrqlCPq4
	M00SDYz89j3ws6cdzblgNKqsZEpFlwY27FT2/BdO+Ee+doaNlLegBqiobr8cxBhfckI0GAmXAPP
	1KN8+EnEIXQtSftA6w8Fv4cMj2e1Riqu2yD7UDTCfnXogtR2C25aZPEkxE3IvN3yRx8TJdq6shU
	lCtG4x2qIG/92yXsDeeMnRqhnk2cvJyWtcCDnw3cekqARw==
X-Received: by 2002:a05:7300:ce8f:b0:375:7be3:1bbd with SMTP id 5a478bee46e88-38570b336f4mr4071171eec.23.1795232491106;
        Fri, 20 Nov 2026 19:41:31 -0800 (PST)
Received: from debian.prasanth ([103.177.82.216])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm20891464eec.3.2026.11.20.19.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:41:30 -0800 (PST)
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
Subject: [PATCH v3 0/2] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Sat, 21 Nov 2026 09:10:51 +0530
Message-ID: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Add an NVMEM binding and read-only access to permitted AST2600 OTP words
for userspace BMC bring-up diagnostics.

AST2600 accesses OTP through shared command and result registers, so reads
must be serialized. Earlier firmware may leave the macro in programming
mode, requiring read-mode initialization. The protected prefix can grow
during operation, requiring live protection checks. A timeout leaves
command completion uncertain, so further commands are blocked because no
safe retry sequence is documented.

Supplementary design notes:
https://github.com/prasanthp20/asrock-b650d4u-bmc-support/blob/main/docs/security/ast2600-otp-nvmem-design.md

Changes since v2:
- Explain hardware constraints; put test results below the commit separator.
- Use generic ASPEED naming and named mode-register addresses.
- Share unlock/relock helpers without mixing scoped locking and goto.
- Return EIO for unlock failure; simplify pair copying and registration.
- Drop redundant MAINTAINERS matching, zero assignments and probe readback.

Changes since v1 (introduced in v2):
- Add the separate SBC/NVMEM binding patch; rename the source and module.
- Replace double polling with one bounded poll after an initial 1-us delay.
- Initialize read mode and read CONF0 once at probe; use a fixed keepout.
- Check the live SEC54 range on each hardware read in confirmed 128-byte units.
- Simplify word copying with unaligned-safe LE stores; accept empty reads.
- Adopt scoped mutex locking and managed initialization; simplify Kconfig.

Tested on B650D4U (AST2600 A3) with upstream-based Linux 7.4-rc1:
repeated reads, cross-pair/final-pair comparisons, 40 concurrent reads and
a 12-byte ASPEED-derived reference comparison passed. The RAM boot used
the working OpenBMC DTB and initramfs. The ARM kernel build used W=1.

The selected dt_binding_check target passed using dtschema 2026.4 with a
local diagnostic-crash fix; no checks were disabled. Two unrelated TI
type diagnostics remain, with no SBC errors. Host-model range, copying
and timeout checks also passed.

AI assistance was used for driver revisions, validation tooling and patch
text, based on the downstream driver, review comments and Neal's guidance.
Hardware tests were run by the submitter.

Previous revision (v2 cover letter):
https://lore.kernel.org/all/20261120174440.123487-1-prasanth.padarthi10@gmail.com/

Patch and review history:
v1 1/1 - original OTP driver and review:
https://patchwork.ozlabs.org/project/linux-aspeed/patch/20261113034213.158390-2-prasanth.padarthi10@gmail.com/
v2 1/2 - SBC/NVMEM binding:
https://patchwork.ozlabs.org/project/linux-aspeed/patch/20261120174440.123487-2-prasanth.padarthi10@gmail.com/
v2 2/2 - revised OTP driver and review:
https://patchwork.ozlabs.org/project/linux-aspeed/patch/20261120174440.123487-3-prasanth.padarthi10@gmail.com/

ASPEED hardware clarification - Neal Liu:
https://lore.kernel.org/linux-aspeed/KL1PR0601MB3986A356BD06F98D0FF9AD5E80792@KL1PR0601MB3986.apcprd06.prod.outlook.com/

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
  nvmem: aspeed: Add read-only AST2600 OTP support

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
