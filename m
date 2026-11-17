Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953131;
	b=iWjHrEUMewDrmSEz5JLT2MWwHaasxwyZGUk9nyFB3j0KcchNRM0Pl1y4IsCx3wWx6oMN
	 jjZMQbdjMpiZ1WEffXwHdBuPSHHrXdh/Xljk3xnGpM2Qm903mBe767aVxWJ/OwT0YJwas
	 VV/9Xl/3f8DhhVjTFkjSMsRkt7JUCFU/Ol9cKOJld+b3aVYnu0nyU2Bh/xoBbGd6RL15O
	 UHM48noka2PsI2HRZolPHuXMo7R/FlCQtYNbY7JEvqo3in5D/k0o6mVY748LmUxvttsAX
	 02kdRkyLO8pDzSgOQ5QMsXVxWXT7eoTlaOFQm/TQAhqU0v84kJzPeienszAhNGP40+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=utFLlXnDor/9ZjvOPLwEKKvNEyzS6b8hVZG1kGb3ngo=;
	b=O+h9HhC+hwq/u77vYxnHEbu4zGwl2wCg++0rOFoTLBNS1U21H7ogOo3Lvqj1WKPbjxcZ
	 obpsRqvF8mNBz5/auTs9sMpCanU3d2qOWdvO+Kj+LoKwtn9Oxzvtf9i3R7vmOdobFELxF
	 Hw8ru2muhRkDeKRj2jGA2XsaLJp20ujDhmlSXxmcYDxbpZQPzamCZpC2amH6E2uI/nTsl
	 A3K8Ay1b3kyvqcnLRBeCpuq3SYKm6ZU4tl65K6DO7m5fseyO1H9z2754BfP5NxzTMhjhe
	 kOJNZ1U92gSBaZM/gS1zeMOEdbE7m2j9o5kvx85KJ+9ojrNHCYYoOmDgD71SmSZelrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elsk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b4u4WrEt;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95152606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95152606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b4u4WrEt
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e95f8543c9so3384905ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794953130; x=1795557930; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=utFLlXnDor/9ZjvOPLwEKKvNEyzS6b8hVZG1kGb3ngo=;
        b=b4u4WrEtUBpSL/IS2Hq3/v3UuiPOSEaswzlSd7OqS8Nncpy50xTZ8NZEuLNwGQs5I7
         N/+NUN+1wsC6LKFFMNzJSqjB72njO/wLNoN+0ldgfoJj6GbQZazglAI7lEJ4bxZjc4Ga
         vPA7h7HuNYdALdnDJDlYsZMYG4HMVUb8k263cx9Wxd8mIqHzIiEtOvqjL5t9TwQCdp3g
         oglQI3lLIGpgtXP+BzsvaJuPW4/wQ6EeKvYVh7sTWCWwsgXJMJZVcQd2fOuB3w5gWdZK
         T4C5q9me3cTNe2WlhQd2IhdTWdkooFoMJBSmRRRRmq7yfz9EVWqJe8KvUFPkRxj1vg0T
         QZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953130; x=1795557930;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utFLlXnDor/9ZjvOPLwEKKvNEyzS6b8hVZG1kGb3ngo=;
        b=qRjTGZhGZieNmC10GaUmEu5p5AjrioHlQGbTIFpSKEfVVfU9fhG7C3MnnCeTe70ycH
         t+N+z0mb7hz4BCWgPDY3aGEAV/4FXhEWn40poL5yMSoFoNJ61HxAyaBe+OpPnzrrrvLc
         C1n8tPGM2dkREKbF8TWInMxVzQr0RtG/l3ltNHJAqEbEte9tjIq04sxUA3VvrjkOrXQQ
         qa8PCwyWWBu3uJdUk6unmA8q/EfnoPyZG/yECaAd3zYx+da7ZYUw0sVD/ZxvFtyYUNXc
         9zbt5zBGu9mcFednQ87olRGfvJaD42sZEhAkNC3M7JCJXc0UUvjPHQTnPnHU1qku7eDi
         kQmA==
X-Gm-Message-State: APuU4Z/P3sgUlNq9K5ILGMBfhtgFWYg0jy1xeWicFhHGw4L3saGhb3/0
	67Qn1URccS1CgA6y9pSY/b3wfnnSG6aq4B++E2XrfC+EJ4299zCDhwyCZihnFdjtjJT7sLTTRw=
	=
X-Received: from plbju12.prod.google.com ([2002:a17:903:428c:b0:2e8:44b9:5c18])
 (user=elsk job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f650:b0:2ef:e500:3a86
 with SMTP id d9443c01a7336-2eff7402b18mr5808525ad.25.1794953129694; Tue, 17
 Nov 2026 14:05:29 -0800 (PST)
Date: Tue, 17 Nov 2026 22:05:20 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117220522.904290-1-elsk@google.com>
Subject: [PATCH] checkpatch: recognize FIXTURE_DATA() and FIXTURE_VARIANT() as types
From: HONG Yifan <elsk@google.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, HONG Yifan <elsk@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

tools/testing/selftests/kselftest_harness.h defines FIXTURE_DATA() and
FIXTURE_VARIANT() to expand to struct type specifiers
("struct _test_data_##datatype_name" and
"struct _fixture_variant_##fixture_name").

Because checkpatch.pl does not recognize these function-like macros in
$NonptrType or $NonptrTypeWithAttr, annotate_values() parses them as
function calls and tags a following '*' as a binary multiplication
operator instead of a pointer declarator.  This triggers false-positive
errors across kselftests whenever helper functions take pointers to
fixture data or variants (over 150 sites in tools/testing/selftests/),
for example on commit d2b82fa39fda ("selftests/mm: add a GUP selftest"):

  ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
  #319: FILE: tools/testing/selftests/mm/gup.c:191:
  +		FIXTURE_DATA(gup_test) *self,

Add FIXTURE_DATA(...) and FIXTURE_VARIANT(...) to $NonptrType and
$NonptrTypeWithAttr in build_types(), alongside typeof() and
__typeof__().  Valid pointer declarations and casts no longer emit false
SPACING errors, while malformed pointer placement (such as
"FIXTURE_DATA(foo)* p" or "(FIXTURE_DATA(foo)*)p") is flagged by
POINTER_LOCATION.

Signed-off-by: HONG Yifan <elsk@google.com>
---
 scripts/checkpatch.pl | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b8b64f720191..f1695f20a7d2 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1067,6 +1067,7 @@ sub build_types {
 			(?:$Modifier\s+|const\s+)*
 			(?:
 				(?:typeof|__typeof__)\s*\([^\)]*\)|
+				(?:FIXTURE_DATA|FIXTURE_VARIANT)\s*\([^\)]*\)|
 				(?:$typeTypedefs\b)|
 				(?:${all}\b)
 			)
@@ -1083,6 +1084,7 @@ sub build_types {
 			(?:$Modifier\s+|const\s+)*
 			(?:
 				(?:typeof|__typeof__)\s*\([^\)]*\)|
+				(?:FIXTURE_DATA|FIXTURE_VARIANT)\s*\([^\)]*\)|
 				(?:$typeTypedefs\b)|
 				(?:${allWithAttr}\b)
 			)
-- 
2.56.1.703.gf848ed807c-goog

