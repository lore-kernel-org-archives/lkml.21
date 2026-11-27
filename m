Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748381;
	b=P1PIxrjKRHOuB+Q0qMwBu7dkfUtDty4gkn9zc4pczq7Uu2b8r6iB0DKN1BA5r6TSfX3V
	 k+ASZ/0hsfMhKSIZ/IB8iwE3WRgOLsjyVCprzgU/a49P4/HbAeoTzkhMghu9/AsUleWP2
	 3Zeh5xMXNgTtQwU/w4NYTWBJ8Unbb2t4PyABCRl2p17t1MsePPp3XJJYJFuHhDYWJLLda
	 mVwYa9VuVDUE3EwDAmXrZxujNtubZnYoYukanR4S+JJbZ2Zy03QOF6B0LBOc4CqS4sQsp
	 1me4D7JLqqO4LRQYNWKrFAR/IjwhbNzYqZQgdgyC6KKsGmgPq4yXsX146fs2WLX1olg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748381;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=PSJbpwNYscaoPtLkKBtcM2ETmUbzMd8Ge7tSBLoV3QM=;
	b=g0ryjUt2/bI9BDctMasKJ/b1gmVv8g+Gy/7OCm7C0kOKFaLM201+wNidw+tgyR0UwrI2
	 ZoFL0m2I1Q8iPSYsthI+InRR3uYsuL4UdLa2Y4BqIJG4vBTWo9rrEmZUIhwUvIGIfoIrS
	 2PGyg9J4dxPVJNC0xu7P0Ys04amhHiK4j08QfzWYAcpDMt8yVgFLTRMDYWdFtQD9k0DeG
	 WIjOggLu8hDgj1WiKwwEnXJLZbJsJYvVj7j65cun8v8byvtcMqSY5W5sBqD8mAXLpQW0M
	 qc0QmvAabYgIMpFS/gyxrLdj6Iwp/o8xP+hXBuanSKIOIAlas/Dh77xSMI6TXwZUVvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SnXLQ49l;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440DF606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 440DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SnXLQ49l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795748380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PSJbpwNYscaoPtLkKBtcM2ETmUbzMd8Ge7tSBLoV3QM=;
	b=SnXLQ49lY+e02KYQ9Ja4E34Vo01ku/d7fThniWYGvSAUysdLjjCYLtFUjEC0lzMUf0GlTX
	XrHO7EGHj47ipH8geE2caqfY7lcx/sSx5u0VfDGCtIpZz0NCVPYQ54vRyR4vsHpyTOfw0w
	RuvplWlO3Kmr/iyDzsLbkSru4XjWoUk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-347-MoHBRTmeMZavqSdn_mSSEg-1; Fri,
 27 Nov 2026 02:59:38 +0000
X-MC-Unique: MoHBRTmeMZavqSdn_mSSEg-1
X-Mimecast-MFC-AGG-ID: MoHBRTmeMZavqSdn_mSSEg_1795748377
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CD73C1800349;
	Fri, 27 Nov 2026 02:59:36 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C52F230000E5;
	Fri, 27 Nov 2026 02:59:35 +0000 (UTC)
From: Bruno Meneguele <bmeneg@redhat.com>
To: linux-integrity@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	keyrings@vger.kernel.org,
	zohar@linux.ibm.com,
	roberto.sassu@huawei.com,
	dhowells@redhat.com,
	bauerman@linux.ibm.com,
	Bruno Meneguele <bmeneg@redhat.com>
Subject: [RFC PATCH 0/8] ima: measure modules with multiple appended signatures
Date: Thu, 26 Nov 2026 23:59:03 -0300
Message-ID: <20261127025912.1383750-1-bmeneg@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi,

This RFC presents the support for modules with multiple signatures, *and mixed
algorithms*, appended. A scenario that requires it today is the PQC transition
period where modules are signed with both, eg., ML-DSA and ECDSA.

Appraisal already handles that: pkcs7_verify() accepts the file if a trusted
signer verifies and no other signer fails (unknown keys is not considered
failure). But measurement doesn't: 'd-modsig' and the binary blacklist check
take the content digest from pkcs7_get_digest(), which fails with more than one
signer, so the file loads unmeasured.

Patches #1 and #2 (for stable) fix two PKCS#7 bugs found on the way: a failed
digest left in sig->m, and pkcs7_get_digest() returning the signed attributes
instead of the content digest. Patch #3 adds support for multiple signers on
PKCS#7 code, but IMA 'd-modsig' can't describe it, so patches #4-#7 add a
template (patch #5 standardizes how ima-modsig records ML-DSA in the same way
proposed here for its v2):

  ima-modsigv2 = d-ngv2 | n-ng | sig | d-modsig-list | modsig

'd-modsig-list' is <u32 count> x (<u32 entry_len><entry>), one 'd-modsig' entry
per signer in 'modsig' order, or "<sig algo>:" for direct data (eg. ML-DSA)
signatures:

  d-ngv2:        ima:sha256:a4fa30a9...48d3a449
  n-ng:          /test/t10-ecdsa512-mldsa65-noattr.ko
  sig:           030304...feff
  d-modsig-list: sha512:0e750939...f8c18dcb,mldsa65:
  modsig:        30820e1706092a864886f70d010702a0...

Another example with ECDSA-SHA512+RSA-SHA256 and ML-DSA-65+ML-DSA-87:

  d-modsig-list: sha512:0e750939...f8c18dcb,sha256:0ae76371...e37306f2
  d-modsig-list: mldsa65:,mldsa87:

A signer with no usable digest gets an empty entry; with none, the measurement
list entry is dropped, as with 'd-modsig'. Patch #8 blocks a file if any
signer's digest is blacklisted.

Open questions: (1) should a dropped measurement be reported more explicitly
than by its audit record? (2) a pure ML-DSA signer has no content digest to
match a 'bin:' entry; how should that fit with the 'skid:' proposal [1]?

I tested module loading in a QEMU/KVM x86_64 and kernel image kexec in a PPC64LE
LPAR with RSA, ECDSA and ML-DSA-65/87, one or two signers, mixed hash algorithms
and rejected cases (bad messageDigest, two ML-DSA signers with one bad).

Claude Opus helped read the code, review the patches and write the tests (and
this cover-letter). I reviewed and reworked every diff and I'm responsible for
all of it.

Thanks,
Bruno

[1] https://lore.kernel.org/all/20261106173149.707244-1-zohar@linux.ibm.com/


Bruno Meneguele (8):
  pkcs7: don't cache a failed digest in pkcs7_digest()
  pkcs7: return the content digest from pkcs7_get_digest()
  pkcs7: support multiple signers in pkcs7_get_digest()
  ima: get the modsig content digest of each signer
  ima: record data-signing algorithms by name in 'd-modsig'
  ima: add the 'd-modsig-list' template field
  ima: define the ima-modsigv2 template
  ima: check the digest of every modsig signer against the blacklist

 Documentation/security/IMA-templates.rst  |   8 +-
 crypto/asymmetric_keys/pkcs7_verify.c     |  83 +++++++--
 include/crypto/pkcs7.h                    |   7 +-
 security/integrity/ima/ima.h              |  15 +-
 security/integrity/ima/ima_appraise.c     |  15 +-
 security/integrity/ima/ima_modsig.c       |  48 +++--
 security/integrity/ima/ima_policy.c       |   3 +-
 security/integrity/ima/ima_template.c     |   8 +-
 security/integrity/ima/ima_template_lib.c | 208 ++++++++++++++++++----
 security/integrity/ima/ima_template_lib.h |   4 +
 10 files changed, 314 insertions(+), 85 deletions(-)

--
2.55.0

