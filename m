Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645092;
	b=tBAYJDYtpxaIMIeRJhwG/n31tG7fKsEJb4fbdZYnuQiV1/f5iQcU4mYyhgGTsl7KtNav
	 ItQG73rJKCkp1Tvp0oeaCGd9bwmB0Kv5tN6exbZ55tcE9G/Yy1jTyu3mvJmfVI3s7NcWZ
	 EacXokojXuNt1p5Jxp1pYwt/N8fELmMLscUmr+lgojHRvttyKyYCVvwvs5Z5O1FHWxkdL
	 K43AVAlqPU7ajXWOULAUwtECuaFUfc910vXP6Pe0ZtEiHwfxfrkUHrv9ANFTZzQJm5UEx
	 8dqYlKx48WA0Xo7qX1X221WuZyJi+YSEa2z8+RZMlrpvA1YGzq/BKvymSsLWeWuf2OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tpmpzrLhm7pX+D8pjkEqrRIYRLx4SQ9n+QD2Zw1yZYQ=;
	b=ubUDd2wU9O2ZzNeQ6LTOYgkS+DaIVofsvmTSKpJyQb8B/tL9CAGYL63F6qEUtKzzTioJ
	 hiTCj1rRVBnaS6qLKksf9j7+MA5SzxrBYRZGzml4otHdhbF9h5smm233N/9Q84firbsaM
	 f/XwIvoFyc+mCOVRQjXdNNMpqOSBMxxKRm8wHjO21Mpc7XtYLHVfepAKitwaZ+8HkPxL7
	 CQCOJd3Z89Crrwog6EheC9tpwZ6cRAxE3P5d2r4blCA8lc/17a8aUKLszy3bV18/E1/74
	 pV08xjbXbt4XtE3eKLp/g7THWuNKEq1+3J14xYetTCaiChKc71A+0vr2HqMoW211TKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="X6QD4/CL";
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97BB606A695
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A97BB606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X6QD4/CL
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so6801369c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645091; x=1796249891; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpmpzrLhm7pX+D8pjkEqrRIYRLx4SQ9n+QD2Zw1yZYQ=;
        b=X6QD4/CL+hI4s1wJiONzEtOeYCVAXuEN7VBttyB7xsPV2WC12JlUn4wdwlTKHGEfY9
         kEJ/tkYvtwmuCHs4NkVt4Dv/eb3ryhoO1lE8wyFAkVO/Ja0PpcXjXPDscFmlhKQGtAMF
         Zr6rpbkLIdM04F0UW5OuJjYXSLeqx0q6+JULocbmR+m3nbeb7LLNyLsJfTCiFaDn+Z/5
         SeahyERlx9DxteptQRD92CSuaG3NDyjhWLHI2LQbfrCSldRXOgH1YBoCQ2vvQl3tH4dP
         iy484IyZvfF7s/rORaxoj4ABgaQAlzC4imeL4KAZP28k44ET03v6nXLfLoEWZmW8/FH8
         8H3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645091; x=1796249891;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpmpzrLhm7pX+D8pjkEqrRIYRLx4SQ9n+QD2Zw1yZYQ=;
        b=Hefd9eudYiufWjQi/Rjl2A8jr+2DvshuL8g1C+nLqZBiUOxdxGPMge93R5oPC/0CtL
         hhCqah+4Fv5WCY0nL9nyQhWCLv51jXThdnZmxp7cWgtlXfZ/u2MXTlfHaRsiqApNQo+V
         Gom2g+dpnWj4KvpVfvfz4DeE6C4D+mlGq8M/N18VNMlF3cFSWvn998vFYMZdUZB2CAnb
         thW6TvJX/Opo8Kgmw++Renp9SIfl3Jg0w3ECTy6VMTaL17p+3aTEEGewfRR94aNEBMwO
         OpP4PMPEPMTbu/BjuAVatKB/IRne4bCmoojPECgJqQ9Ia5NgSyzc+d1tIQBw9L7QD+1b
         CnPg==
X-Forwarded-Encrypted: i=1; AL+hErH0/oH8k/dDuM2YMcsJEtqsUTnGMoSRqBdw7SYGjG5cSYRZV/4Vge1tvp81D94KSsx2imlXiyp6k90mtSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FlZZLsczypl25ehsuqeihgRiVZMJGf+Kwo6FbbC9elUkNeROq
	uRziUIZF85CfORnG7F3AJ1J6W0r7lm2JWOPTq1Btor2YwskFlJlwTBt4K+bMACyNwnCvKaB8ymP
	vbw==
X-Received: from dleb17-n1.prod.google.com ([2002:a05:701b:4251:10b0:1a7:f7dd:f258])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6988:b0:156:6676:d0e2
 with SMTP id a92af1059eb24-1b55689f5dbmr25363930c88.10.1795645090492; Wed, 25
 Nov 2026 14:18:10 -0800 (PST)
Date: Wed, 25 Nov 2026 22:17:29 +0000
In-Reply-To: <20261125221730.1421806-1-elkin@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125221730.1421806-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221730.1421806-2-elkin@google.com>
Subject: [PATCH 1/2] afs: Guard NULL alist on restart in afs_select_vlserver()
From: Elkin Cruz <elkin@google.com>
To: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In afs_select_vlserver(), restart_from_beginning: is reached from
no_more_servers: after pick_server:, where alist and vc->alist have
already been cleared to NULL at next_server:. If an earlier VL call
received a response (vc->call_responded == true) before failing with
-ECONNRESET (setting AFS_VL_CURSOR_RETRY), vc->call_responded remains
true until another server address is selected, causing
restart_from_beginning: to dereference a NULL vc->alist.

Guard the preferred-address update and afs_put_addrlist() at
restart_from_beginning: with if (alist), matching the failed: path.

Fixes: 98f9fda2057b ("afs: Fold the afs_addr_cursor struct in")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 fs/afs/vl_rotate.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/afs/vl_rotate.c b/fs/afs/vl_rotate.c
index 6ad9688d8f4b..8381d6a35d3e 100644
--- a/fs/afs/vl_rotate.c
+++ b/fs/afs/vl_rotate.c
@@ -171,12 +171,15 @@ bool afs_select_vlserver(struct afs_vl_cursor *vc)
 
 restart_from_beginning:
 	_debug("restart");
-	if (vc->call_responded &&
-	    vc->addr_index != vc->alist->preferred &&
-	    test_bit(alist->preferred, &vc->addr_tried))
-		WRITE_ONCE(alist->preferred, vc->addr_index);
-	afs_put_addrlist(alist, afs_alist_trace_put_vlrotate_restart);
-	alist = vc->alist = NULL;
+	if (alist) {
+		if (vc->call_responded &&
+		    vc->addr_index != alist->preferred &&
+		    test_bit(alist->preferred, &vc->addr_tried))
+			WRITE_ONCE(alist->preferred, vc->addr_index);
+		afs_put_addrlist(alist, afs_alist_trace_put_vlrotate_restart);
+		vc->alist = NULL;
+		alist = NULL;
+	}
 
 	afs_put_vlserverlist(vc->cell->net, vc->server_list);
 	vc->server_list = NULL;
-- 
2.56.1.839.g22a8290db9-goog

