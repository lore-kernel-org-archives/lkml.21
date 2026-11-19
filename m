Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107890;
	b=xf2maVU0BiPZE+XZYu785JesQoObXv9sQjSso90z2zfDwPimYFBR8lNDTZKrI8Tb3Mm0
	 PRwC9OapS+pSQ1LQ1zwNrr2VMu0CwmZL8r8ThqsYgy3HiRxln11OhwHcvmU3M6rS6ZlOv
	 li+OR+5uiy7a+MnVHlPR6/1Aza51U5k1OAGtPi+/thS0pbsoHHytZYIL1Xuno1+rPKyfS
	 sqz5agNE+NHeGnNEABqbD61jCvXNQVNtJLnWHoFl/eXkYuqHDZNVX3JAxDrVj7URWp5Pu
	 o5phVxPBju7+jbkPiqYzHEYuT/J2g8ra5AYllScG1QXS8A/BCATiP0s5R7NiiOGt2AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=voN556T4bQ5hmnwkn1P9G0D/giCnPNELWJFN9TQLbHE=;
	b=oH6+un7QFQ0wF4wZyIkqMf8umYHXqMhhlYFZCIRCnFLvJvBtfkNcR/wk9VjsuxznM7Nq
	 npN4oxwQ5au8po4vwmEPT5EUKXc7t+9lYPFCbvc4F7UZ7ZXiGc/qcpdwQtuglc4vv3mvb
	 jFerYNfnLBnHCWTqmeleDOqW0yJ7uuygQrw9cM7TSIOpwhKxxj9s6VovLVDPo5CKXZ7Hj
	 ZoA/Oy6JkmIvv8LUmqnLrrqQHgYftWknOCnHQTIdGCzSDyqy/p1a1voofNSAXAe3mHajn
	 8DGVEXsuiaRk7chObTrDNAyKmO/j8pG8aFj0zxVRTqsgjNdzSm4d8WToHwe2XyWyCAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pTA141Zk;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6206606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6206606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pTA141Zk
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c7f887ac6bso70429b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107887; x=1795712687; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=voN556T4bQ5hmnwkn1P9G0D/giCnPNELWJFN9TQLbHE=;
        b=pTA141Zk7eTfRXZvaKXuumpIoEts4pw11FS4p4HvqPD3+hOe0AG8RSXnvA/FpOpavv
         weyEb4VVj4GhdBU25qvC+VMhMOXKlSvwM3giXDh2RXWs5SftZenaAMljg0YdArtrjNFx
         JkBr5yxFCgHBegPzlDHMO8+ftZKkkz5f3RdS+3b22HVEbd6zuEIo1nQnXxtB+6nGuTBh
         fyA1u3JAGdVa4kQ3BtW8O6pLTxc9f/ULx8qs2bQkHF49Bw0fjdx4C3kqXHHtpwJBWIqj
         aAkH+Baweu1EhGwHz9kpwaa4D5NeuUhXHTHmTJ2NH2gYZsTIVYrTFahbDzvVHTVdrEAA
         TWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107887; x=1795712687;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voN556T4bQ5hmnwkn1P9G0D/giCnPNELWJFN9TQLbHE=;
        b=MNT4MsE+7bkb+2B4D5P/tWVgd/6PZ/0UvaMCqYkzRfr+P5VMIKK9RF/vx4MrODZMp/
         OcGrb9+eRLuvlIPEiWvDjLjbA6DU0s7Z+ewNc7MPvIIU9/allHHtXqKd++dRzV4cNT87
         6AgjgvSRW97B0X0FnDduUxg3LBmWDJG1RCMKXIjqSvXfpL/WHdaBu0cpa7lhTXiz0Q/+
         wlyFyz0a1ePbDqBruLmYI/iEIVVicElIrVe56C/Ri30iZTyksnlRKBLFKCTdUbVnrKP7
         QLu5/Zn6KqyKNIzZ1tQw4vNc6xceR1579wAz4dI+m8+NPgLDuTBKoKC/9UGhlqa7Vi13
         c0kQ==
X-Forwarded-Encrypted: i=1; AL+hErEwAf+4RgAQs0VE+zevYZ62wGpsqts4aoN7COpfOeFhdIFX6kAwkA3Fg4/NUeBrI1F+UZjKQZJkbZNs8ts=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nJehvGRFJbK8TXvGAbjipTAzof88fvygf0c+r/CRix8DpONTk
	5vPNtz9f2lLxItBTYCiHawvRpHilVeQc596LB9SE8gwhSN7gSzM272aw4v6x2oDu/oRAsWvr7Nv
	mHBaO4zht7g==
X-Received: from jafo1-n2.prod.google.com ([2002:a05:6639:301:20b0:620:c289:80b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:4f0f:b0:567:c773:39ab
 with SMTP id 5614622812f47-57a0aa2ee51mr623733b6e.39.1795107887287; Thu, 19
 Nov 2026 09:04:47 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:43 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170443.1513294-1-irogers@google.com>
Subject: [PATCH] Input: ff-memless - fix 180-degree force inversion from s16
 negation overflow
From: Ian Rogers <irogers@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In ml_combine_effects(), constant-force Y component calculation negates
fixp_cos16(i) and passes it to fixp_mult(s16 a, s16 b):

  y = fixp_mult(-fixp_cos16(i), level) * gain / 0xffff;

At i = 180 degrees (direction ~ 0x8000), fixp_cos32(180) is -0x7fffffff,
and arithmetic right shift by 16 in fixp_cos16(180) produces -0x8000
(-32768). Negating -32768 in 32-bit int yields +32768, which overflows
fixp_mult()'s s16 parameter a back to -32768, inverting the Y force from
full positive (+127) to full negative (-127) right at 180 degrees.

Widen fixp_mult()'s parameters and return type from s16 to int so
+32768 scales cleanly to +0x100 without truncation overflow.

Found by enabling Clang's -Wimplicit-int-conversion-on-negation on an
x86_64 allyesconfig build, with AI coding assistant help to audit the
warning and prepare the fix. Verified with a standalone C test sweeping
0..360 degrees and Clang build; not runtime-tested on force-feedback
hardware.

Fixes: 559addc25b00 ("[media] fixp-arith: replace sin/cos table by a better precision one")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/input/ff-memless.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/ff-memless.c b/drivers/input/ff-memless.c
index d1fefd1dfc0d..ae8ff19905b6 100644
--- a/drivers/input/ff-memless.c
+++ b/drivers/input/ff-memless.c
@@ -229,10 +229,10 @@ static inline s16 fixp_new16(s16 a)
 	return ((s32)a) >> (16 - FRAC_N);
 }
 
-static inline s16 fixp_mult(s16 a, s16 b)
+static inline int fixp_mult(int a, int b)
 {
-	a = ((s32)a * 0x100) / 0x7fff;
-	return ((s32)(a * b)) >> FRAC_N;
+	a = (a * 0x100) / 0x7fff;
+	return (a * b) >> FRAC_N;
 }
 
 /*
-- 
2.56.1.708.g77570a6a1d-goog

