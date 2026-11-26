Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698033;
	b=YYM+EFAk2pS65lVLzWZiAny8wnIaZYjE0rGObppXAxpJBIfuXypgvLtml1YwHAWz1cGD
	 js4hORWM+UKjwFQT/dtiK3Yte8FJsxt3t6/WsKpr+Y/87UJpnd3ePPqGCrvUOCltxSRfK
	 /A5g4znunRTB1hZ2X8b1PkAgIcr3yp61b3TJOHtgm0QuP+XXifzpzTHyKmeb+BccpcoYT
	 8ILGIpW73ZddI2Q2IaXOZ86mx1TxlCAQrJpZeV/qX9je4oPQLkTcm2JJC46QsMoxNjHua
	 cwItm+oPcXi9PjZmJRGecM34otU8+Pz4V+1mv5Pf7t8Gt/S5E3kprAuGkBuFEYkQp4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698033;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=fkK1uCwwzUMb2PiZqxaXOt1gFq6un0zd6u+YCXzwUoU=;
	b=MNpoky4OUQgI+U0aRe/00EarTugrFRuJt/DhU/XvvqCExD+hf/RKDuO6GK/x0cYkQGFA
	 J+5pDYb0S8GWRkFjyk5loRtkskcP3HsCC5P/yQevC+UQrcRBgH63PgUaHN/fXs9rdC1h5
	 f6y42hlnsTtpPdAgHYigs37e/EJxLCCyuYAEJcroGAju2MK3+AfcuwZsGdFSfa/Fi4GGY
	 2fQnKmtKLZPH5J76lT28u573r/bvUDwlmDo+Nlo1O7ujq2jclAGywo0kAGM1eHWcro2vI
	 oYi1rvcpQ5obye77WbjuTLAGf0F9Yr5A4PCIRxW9DGTTCMOF6hIGmoobxTRLSlka17w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WpJAO58v;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C51C606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C51C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WpJAO58v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795698031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkK1uCwwzUMb2PiZqxaXOt1gFq6un0zd6u+YCXzwUoU=;
	b=WpJAO58vwQmMTOd78Wo31OfBrc2otTt9CVC81z+9QDTNbuKCxcS/T+gBXZ/s6AdOW5DkJ0
	+9hdyELU3M7GDZPl8TNs3xE8Ce8njgExNrGZPvMEO3dV16IGzkkya9kuycASgh5IS5yH+J
	E9uqFj2LO0bMspic+nMBwjCPhtwLICQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-U5FQP9DrOD2qBgWwCmUoPw-1; Thu,
 26 Nov 2026 13:00:27 +0000
X-MC-Unique: U5FQP9DrOD2qBgWwCmUoPw-1
X-Mimecast-MFC-AGG-ID: U5FQP9DrOD2qBgWwCmUoPw_1795698025
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C2BD1800349;
	Thu, 26 Nov 2026 13:00:25 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B833E1801977;
	Thu, 26 Nov 2026 13:00:21 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Nam Cao <namcao@linutronix.de>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Wen Yang <wen.yang@linux.dev>,
	Tobias Schaffner <tobias.schaffner@siemens.com>,
	Viktor Malik <vmalik@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	John Ogness <john.ogness@linutronix.de>
Subject: [PATCH v3 02/18] tools/rv: Skip empty pid error in selftest if command failed
Date: Thu, 26 Nov 2026 13:59:48 +0100
Message-ID: <20261126130004.127155-3-gmonaco@redhat.com>
In-Reply-To: <20261126130004.127155-1-gmonaco@redhat.com>
References: <20261126130004.127155-1-gmonaco@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Some rv userspace selftests rely on the pid of the rv process to match
with the output and fail prematurely in case the pid was not found.
If the rv process failed, however, it's likely it will terminate before
catching the pid, and the test reports empty pid ignoring the error that
caused the process to fail.

Report empty pid only when the rv process succeeds and continue showing
exit code and output otherwise.

Fixes: 92f0ce552990 ("tools/rv: Add selftests")
Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 tools/verification/tests/engine.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/verification/tests/engine.sh b/tools/verification/tests/engine.sh
index cfdf2180aad8..4dad43b0b822 100644
--- a/tools/verification/tests/engine.sh
+++ b/tools/verification/tests/engine.sh
@@ -60,8 +60,9 @@ _check() {
 	failbuf=''
 	fail=0
 
-	# Suppress any other error if a needed pid is empty
-	if [ -z "$pid" ] && grep -q "\$pid" <<< "$patterns"; then
+	# Suppress any other error if a needed pid is empty and there was no other error
+	if [ -z "$pid" ] && grep -q "\$pid" <<< "$patterns" \
+		&& [ $exitcode -eq "$expected_exitcode" ]; then
 		result=''
 		failure "# Empty pid for $command"
 		return 1
-- 
2.56.1

