Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748405;
	b=A/Zs0d7w0weQsWgyj55L5ORCq+WTUQgTL9BbWVtuImHBTj25/HyOPimIJQZANSLtDHun
	 3qXxp8CXPJpvl/Z7C2S+EwXmZmgU0tj6fMo5+U6oWpdmABAVjKk9qHiu6OrfW4lpWz4T9
	 JBXIpUSKrgUZkLuA/f8Qom7da1Ootf+sl3E4JtHyUm9SBlxGKlHvEiPVy8NJCvSYuutDs
	 2UOPPiS0eQRMmXXt8koNKDC6is/ImTSFq3cC4GczCb26I/CqNSOxRxvvQBb1LlBlIKiM2
	 +KiYn0fhuUDMfW3FC1nx5F8vrAapqZf/BjlnVpDvWkH8Ueg0mPNldGzNxFkmeKgrO9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748405;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=BS+yhTYj4vK3YDb5NCzbtC6qzi+fzRiTH0kBAne+IUA=;
	b=hZ72rrvYsiu7KgqswWdOEMHsVO0T836Twr1sfv/QJO7dWou3UJKeDjXyKDJqY6vnfbeR
	 csGD5ZfeCo++MZcVSrlQWXPKgLg/YYMtJgQkNbX4gwDqMUIHdxn77MpQprIuMfwHRtBl6
	 5Goq4NzfaKvH1s+AVlGKEj6I4RyEaJgkMh3tbtCItLr5QVT+KDsAIu6QQ1ZspqmwILdXq
	 RCKtHzjKOWM5yDofAOAJkiABigPJ5NynyQDaNDG4hPLKxLUBWXvEQgNTSc5p5QOcgGbVI
	 T6M18knj6tu/NkZ4wJO3zeOsDND48FTu3fK18scLiotoltHu0uywHbFXnNo9PB9b/mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="d/eD0s/p";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7955E606A337
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7955E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d/eD0s/p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795748403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BS+yhTYj4vK3YDb5NCzbtC6qzi+fzRiTH0kBAne+IUA=;
	b=d/eD0s/p6aCJoAdCd2wIgIbZYsqpwjYsr1eQHs/7utv0fJNwGwleYI4MT6FhkYauxN/vfB
	REecVdE87lz195dPyAydrfDWV44T8FNXvWdOXtDgiVaUlo6+4yE2+vimebrMz7D9o27FaZ
	z6MbZP32ZUfIRGpv07SveoO/MJixOQs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-548-U_Vk9U-PONG2pOyhlaijlQ-1; Fri,
 27 Nov 2026 02:59:58 +0000
X-MC-Unique: U_Vk9U-PONG2pOyhlaijlQ-1
X-Mimecast-MFC-AGG-ID: U_Vk9U-PONG2pOyhlaijlQ_1795748397
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD0E9180054A;
	Fri, 27 Nov 2026 02:59:56 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3C3C31956056;
	Fri, 27 Nov 2026 02:59:56 +0000 (UTC)
From: Bruno Meneguele <bmeneg@redhat.com>
To: linux-integrity@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	keyrings@vger.kernel.org,
	zohar@linux.ibm.com,
	roberto.sassu@huawei.com,
	dhowells@redhat.com,
	bauerman@linux.ibm.com,
	Bruno Meneguele <bmeneg@redhat.com>
Subject: [RFC PATCH 7/8] ima: define the ima-modsigv2 template
Date: Thu, 26 Nov 2026 23:59:10 -0300
Message-ID: <20261127025912.1383750-8-bmeneg@redhat.com>
In-Reply-To: <20261127025912.1383750-1-bmeneg@redhat.com>
References: <20261127025912.1383750-1-bmeneg@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Add the "ima-modsigv2" template with the following format:

	d-ngv2|n-ng|sig|d-modsig-list|modsig

the counterpart of ima-modsig with support for multiple appended signatures
that records the content digest for every signer instead of just one. The
existing ima-modsig template and its 'd-modsig' field are left unchanged.

Signed-off-by: Bruno Meneguele <bmeneg@redhat.com>
---
 Documentation/security/IMA-templates.rst | 1 +
 security/integrity/ima/ima_template.c    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/security/IMA-templates.rst b/Documentation/security/IMA-templates.rst
index 161aed3da8b7..38d6d27344e2 100644
--- a/Documentation/security/IMA-templates.rst
+++ b/Documentation/security/IMA-templates.rst
@@ -99,6 +99,7 @@ Below, there is the list of defined template descriptors:
  - "ima-sigv2": its format is ``d-ngv2|n-ng|sig``;
  - "ima-buf": its format is ``d-ng|n-ng|buf``;
  - "ima-modsig": its format is ``d-ng|n-ng|sig|d-modsig|modsig``;
+ - "ima-modsigv2": its format is ``d-ngv2|n-ng|sig|d-modsig-list|modsig``;
  - "evm-sig": its format is ``d-ng|n-ng|evmsig|xattrnames|xattrlengths|xattrvalues|iuid|igid|imode``;
 
 
diff --git a/security/integrity/ima/ima_template.c b/security/integrity/ima/ima_template.c
index 584f970e553e..721af4b1828b 100644
--- a/security/integrity/ima/ima_template.c
+++ b/security/integrity/ima/ima_template.c
@@ -24,6 +24,8 @@ static struct ima_template_desc builtin_templates[] = {
 	{.name = "ima-sigv2", .fmt = "d-ngv2|n-ng|sig"},
 	{.name = "ima-buf", .fmt = "d-ng|n-ng|buf"},
 	{.name = "ima-modsig", .fmt = "d-ng|n-ng|sig|d-modsig|modsig"},
+	{.name = "ima-modsigv2",
+	 .fmt = "d-ngv2|n-ng|sig|d-modsig-list|modsig"},
 	{.name = "evm-sig",
 	 .fmt = "d-ng|n-ng|evmsig|xattrnames|xattrlengths|xattrvalues|iuid|igid|imode"},
 	{.name = "", .fmt = ""},	/* placeholder for a custom format */
-- 
2.55.0

