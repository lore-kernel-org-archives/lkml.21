Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753137;
	b=LVmG+7MawRM61uJQ2jjji6xwnil3MT4zOnrlgvRqB8kSLJamN6RDOt7wUuAMyN7r8BlH
	 1CJsIOi9xTlsBZEY0e6dyqtJjAqYz1loeFjKg8mttGLgIp/AbItWADWNI1NuhLTkkOEY7
	 JjE40/K6rjcWJG1GEQj0uysnvJP3k/g8UZqe5qbdOVXBZlCHOzrZGanHXU81WbDBzoirK
	 RUgxaadNHJSN4jaSKQmJFsfnudTvlRJ4QbQy/sfHddid1OoqPF2sDI8X9/WbNvZDwC1qV
	 GA3Ua5iVDM9V0jkcIEIHH8KzrH2Vr7blbZRf/UYfTbSAuf1FG8QsRFIve6JVjRX3how==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=93YINut3KE5OztbS+NDPfxjifdfR77qYaLTwskp1sjA=;
	b=Oq910QI6AzcAdjtrMJbE8X6V/v03LhJhq9jTSAtELQemqeHtpkkIC+UMmNjk/LRv70Qn
	 uwnJk8gyJcmwH65Z0XLR/zWVYrkXUQlHibQJuNHPaB6pq4uGZHGStbJJo1rMSNpfcQC2g
	 eSKJT1tZiHWrRN6hNOJNFRMlpERkGBzdYLCA5EV9x/1qqSS6tLa87mnRvUvQf37nAFGnK
	 jPPOnK4rFtixa05N0fcE7p1AYyHCnuBOLyzOvEtMF7A9iNc7HO2DZ65usjynvOwQ7n8eH
	 0AesBEnwijiKZOgwpaNIWTalhcdWD0azoyjuuxgBqKtLtJqBn+cOBfdRnFC6tbvN8vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZIamYWu;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22523606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22523606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZIamYWu
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b520f1604fso393838a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753136; x=1796357936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=93YINut3KE5OztbS+NDPfxjifdfR77qYaLTwskp1sjA=;
        b=KZIamYWudgLOaRsKoqqyDFI8ih6B/PwA45hiEyepNUmZ0Y8HlIe/rhfBjb7D8KUbWY
         fFuYxERH3zxGt0ZoDOi8NUzEmzLsMcttanbdG4P8Z+WnPQtgBF3fDbzbDg50Upl4XYTq
         y64ktzqAl3fqKpTZja93M2PobdoXDX0XgOkH/7grUKWf/sJFaMEG7N1BT16XNRPDnbAz
         6vdzGTiEN7su9ZgThwVOS2RGckGREbia60tiduJxWnSoiF/Igf1ObK83gO2OhEJReSCW
         C07J45Xm8yu7LaGBsGwumChXHegUmLsXEBbDd+ec2++CL/rIVgqPWYVZHhZ86u84SdGY
         2S2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753136; x=1796357936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93YINut3KE5OztbS+NDPfxjifdfR77qYaLTwskp1sjA=;
        b=SlHj68hex2A0S3ohP187q1UAE1X01w+iQ+GLbh93lmsoxYHGQCQat8kD+KVo7R0JjP
         BYxmxyrRv0lovntuCnM/WY4MN9IR7Tl34nV11hg2VtsWfi3S0/L+o6OJ1W5yGtSLdw5E
         mAaJxhaYqI9An5VLLAT6hXop3/3ELhdXmySCypO1kv+fk3+sFAINrmflmCpLmt+Jg/QO
         vKE/viTF0cJMfbhNaMUbJcjgnvMC1IrEnAvJeN/Ar9vQv4+PZtxqNWOLmUBTjBkXvrdY
         xOwhBn6ucILCgTeWdt/7kWXTqu/nTb3dQZ5wdmZL6AKJs+JChU83kCOzdD5DGDBIKo2x
         ihWg==
X-Forwarded-Encrypted: i=1; AL+hErHU4t3BEgggIok1qbRqdRtRoCPoGZJyt16hNRnjhAdMCyY429CP2bW+bXQ6KhwiaTTca243uviiDv7Jhac=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FuEkFBNJ1lBT6MWjNvLRM8JN+KMUGG6FziNjp4/dne4zyCgnY
	GtSAgrbZZWjd0uV+FvCCbke4nuKqqyDO6sbR0pzSQBc9/JG9Dx02m2Rb
X-Gm-Gg: AZFdTZfTzm2y/ZqJXRkoptJrmcKbhjHVV7nSifKZ6B4Zk0H6oF1hsursPi6yAZMqzrZ
	m3znynQX+WzyokL0tvS2xiqK9BIn1NLXsdyTorheZqFZr6IPefx5/wjzogQe8vl54STClWzyAzR
	DudwTyo99X0kHQaLmBds+f8K3dWYRld3YKllUneLg2UIl4tJHfF869iQqYH9h8hVEhp9TD5h3vD
	0IxNvrKFUMUQyinziyXQVz+AmS0VfUIIRq8vz5olwkncXHTHa+Ucx5+j3kq5eOJizugM3Q4/IC8
	BmMYpVOZ5ewTERqHLg6NyO6MkHA4Qd65390si7HrkqmYVyJ0LUyDUiuEEZrr4+m6Ug3gabwYawL
	rODh2BBQarDkxRE2DwFqAjgmZZzqRr2heOVcm9G2C7Yo2vKOTvwBcX0ek7YLV0lQIgyBUnfS74n
	HIZqOIKV/WzpDpQQQFybW3aikSNz0qZWiaJ8cEQDDAmqm0jB4fstGyiW2qGESOwknazhB6LCHSb
	2kO/lsAI6PZm4zGlhhpZaeU9qH6YVdG8hn96W0YiLuK8v5hrJqBz8yPb76fdZBv3hsoc07BtauM
	zNf0OsPE04KYpOypbQxNs4KkE6ro5Z1C0i3lMgY5hFLxakuK2Q==
X-Received: by 2002:a17:90a:e705:b0:3ab:1b1c:8a70 with SMTP id 98e67ed59e1d1-3b41c938d83mr20435234a91.38.1795753136343;
        Thu, 26 Nov 2026 20:18:56 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm36000501a91.8.2026.11.26.20.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:18:56 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: ebiggers@kernel.org,
	Jason@zx2c4.com,
	ardb@kernel.org,
	stian@itx.no
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] crypto: sparc: remove trailing whitespace from AES assembly
Date: Thu, 26 Nov 2026 22:18:53 -0600
Message-ID: <20261127041853.127855-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Remove the trailing tab after the key expansion label in
aes_asm.S.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 lib/crypto/sparc/aes_asm.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/crypto/sparc/aes_asm.S b/lib/crypto/sparc/aes_asm.S
index fd90b129972f..0ddf181f342e 100644
--- a/lib/crypto/sparc/aes_asm.S
+++ b/lib/crypto/sparc/aes_asm.S
@@ -293,7 +293,7 @@ ENTRY(aes_sparc64_key_expand)
 	ba,pt	%xcc, 80f
 	 std	%f58, [%o1 + 0xc8]
 
-1:	
+1:
 	/* 192-bit key expansion */
 	ld	[%o0 + 0x10], %f4
 	ld	[%o0 + 0x14], %f5
-- 
2.56.1

