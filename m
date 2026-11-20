Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179749;
	b=iogOSMlRmN6aILciSj2nTaxVYVUeCUWkMHjsgBbkGgbd3QH1agyUPJqBigsiEy9WFg8b
	 sTBINBNZfCYRxLey7dfKa9/hwhB5PbQPesT09TLFzRSffcTXXWNNH+h4QaMA2ZHaWpFkK
	 TIuRidSt7mlbUVStQOZYRLYZRp7j+BJvrstch9xBfAuqXb7zs2hwNb0BVGaGDVhtHehiz
	 uyj7+rK96oS74TGQDPWgbLfNCegGwpIuRcA6FxBfZONVHYKEZWCyDOLTGgwGg9SP6Wnfb
	 5MzN1LorVCtgPKoluDc5+i3X4Zg07N+CcmHf6rHbLRLBItEFF2SEcUiI6N1tgbIIe1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179749;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zosXSMk8E2XWLXkIighEobFI2PCoD2dTwvNNLer5s4o=;
	b=ish46C0AE5uBfHBOLRjx1ude0U1GSDDjke7D0HYJnf+rSuIE3P5q2NRPpzKtlYxS1Iz1
	 8cjWVUjc6hlZByIuDWGfnVdbdNQjsx7Iao5ACMr/p6R3c3/NKlDcaKueY2f25DipPLAok
	 XjEoZAdJxQEtO6Rtm1eFRm4junTGuQB1DTOEYTcEuxfXABGLDYAJT+d0Y8xm6uGu6AHe9
	 UT3RA+TeJwA8vIXooK3E0AKvApHWpR9Nx5QDgAMc40Y+gMK7S3E8OD5no6UaPIYOqb9GS
	 qvKGTwBluGiITyMfzG9cck32OsETnCBoW5mh0ufZ01asa+7+BlH0gbyRueCPBAV5f2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=TubSPzy5;
	arc=none smtp.remote-ip=203.205.221.231
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D6A606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D6A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=TubSPzy5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795179743; bh=zosXSMk8E2XWLXkIighEobFI2PCoD2dTwvNNLer5s4o=;
	h=From:To:Cc:Subject:Date;
	b=TubSPzy5zFAhIJvIrr2rN36sjDlvyLYmwv08NFu6eQ2PXD63a24lLW+uX/zE3zAnW
	 hA9O/qy9r74nV9Ko/ELBTrNH3Xey5O7depgWKlswlxMYC9SqLta3V8v9pP6ULdPJ0U
	 IM1XS8i/SQ5LyYjAvmgR8m2lVp0vHIXk/bMV0+4k=
Received: from localhost.localdomain ([2408:8221:620:e7b0:50f0:f974:2e24:99fe])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 72984B6; Fri, 20 Nov 2026 21:01:50 +0800
X-QQ-mid: xmsmtpt1795179710tc4ka9fyz
Message-ID: <tencent_AFE15D698FFD4F18E16A6EF7CDA002D69806@qq.com>
X-QQ-XMAILINFO: MZtEYADUG4Agz2/EStJTafcQouuurzhkDNB2JDXI1PEzTsqMho6x6BbSc/eH8L
	 TpjWnMKmkgMvVRDQlpZvnvrNqhRRsG43Q0LllM/7NQBKULJUmNzvdN1mPDa2Gff5GmA74KvgzOHC
	 AP+/G/n9PB6cFbyAlzDAoN/VEEMPl41L35xr0XscbEGJTZ3fkRa3ViwMnanMOWpOGJPumClzFxkh
	 KCuOaGcECTTa+xcfXVWAy2TYaoWijUVtfuC/lFFzhiMsNlrNlHYdqdOgF7XamqVzeZM9Kk3sgfM8
	 s15yDa5NZmOkDqm7Dw/mvaFkRJS5v2X2UyTawuDVLeRweClp0K5rMTUd6JUIfzdLTe/ygmj7MnFt
	 hXda72Q42pSY+a6NuQyqniLNhKwtbx3b0unqAwBqJsSiK+lmrFqFea8DLtjkZmeyWeBC3OGu5/+q
	 jQYFfMlYdujTZXyRRHA87XkoemKX5rbLtTS8CV1Wq4uHisWDZ+ry7zBWgyOe7x/7vN/nNRgSKtvC
	 sfvajxD7fgNFC8YjEipHaQJvaa2v9G0AwdCorfdLAOrgSuDjDtJLXW8pqtJINFaNvWjGpIwtPtBs
	 fIMa6aL1aErzg7MJf5G9324lPgoWch12bKZm9TMoUk0ELATHXKtuK8Zo9d2zqntWE9vZ9mVBeYnh
	 Aok8znHmv5inc8yvEbfmEkdiFvE50yMhi3NnByJhROuoWUpi0bDCKVqCwSBUSNo9aapfDmmyq/uB
	 9cQTtAAoQkdlTNNDUEQRJQpNKznfgA+OB+EuIGAZ28Wyv0wkAx0kxBzjVnZcLApSgjF+t4MUUn3l
	 XBONg5sCz/az3b/njru99RHoweSqy4AAS2k6mAOyJ2GmoUifgOOv7Qt2r4Hn20J9lTvHGWWSrB53
	 4alD/jkMkWxFptGqWKNntvppo9VZkCRiJvv1RDH83u2Le9qb9X2WKCqOHQ8GDvAP1sTYR5TYKk5C
	 fO+cUnOZxbj9WnE1A6ZiNoP/O0Zd2Y5+MnXrgeiOqU6SuW/UsP1YzV/eqMEGEJb4EVfPS6p7tC0P
	 BUhvBYpIabHJdM+d8RdJDkrDSkK3p5KR5f5ctV0vN5YAaLJ6YN77SmKNbVMoTt9Xf9shoVYQ==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: zzz <abc0eichs@qq.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	James.Bottomley@HansenPartnership.com
Subject: [PATCH] lib/asn1_encoder: fix encoding of zero OID components
Date: Fri, 20 Nov 2026 21:00:55 +0800
X-OQ-MSGID: <20261120130140.142-1-abc0eichs@qq.com>
X-Mailer: git-send-email 2.42.0.windows.2
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

asn1_encode_oid_digit() encodes a zero component as 0x80, setting the
continuation bit on its only octet. A trailing zero therefore produces
an unterminated subidentifier, while an interior zero produces an
overlong encoding of the following component.

For example, 1.2.0 is encoded as 06 02 2a 80 instead of 06 02 2a 00.
Emit zero without the continuation bit, as required for the final
octet of a base-128 subidentifier.

OpenAI Codex was used to inspect the encoder, implement the fix, and
prepare the reproducer, regression tests and change description.

Fixes: b07067627cd5 ("lib: Add ASN.1 encoder")
Signed-off-by: zzz <abc0eichs@qq.com>
---
Prompt summary: inspect current mainline for a reproducible bug and
prepare a kernel-source fix following the Linux submission rules.

Validation:
- A local UML KUnit suite called the actual encoder with six OID
  vectors and short buffers. The original failed the zero-component
  vectors; the fixed kernel passed both subtests.
- GCC with ASan/UBSan: 45 checks of the actual source passed, covering
  zero components, base-128 boundaries and output-buffer capacities.
- OpenSSL rejected the original 1.2.0 and 1.2.0.1 encodings and decoded
  the corrected encodings successfully.
- x86_64 allnoconfig object build with W=1: no warnings.
- checkpatch --strict: clean, including the Signed-off-by tag.

The sole current in-tree caller uses a fixed, nonzero TPM OID whose
encoding is unchanged. This fixes the exported encoder's handling of
valid zero components; it does not claim an observed TPM failure.

 lib/asn1_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/asn1_encoder.c b/lib/asn1_encoder.c
index 92f35aae1..0cff56769 100644
--- a/lib/asn1_encoder.c
+++ b/lib/asn1_encoder.c
@@ -97,7 +97,7 @@ static int asn1_encode_oid_digit(unsigned char **_data, int *data_len, u32 oid)
 
 	/* quick case */
 	if (oid == 0) {
-		*data++ = 0x80;
+		*data++ = 0;
 		(*data_len)--;
 		goto out;
 	}

base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
-- 
2.42.0.windows.2

