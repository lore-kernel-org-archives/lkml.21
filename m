Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107833;
	b=KYX3/AOkAynQjlIzt8SwxvOtIzkAk2tX84suKklLDJAI3oVceqh3g6uZ3J3p8YDUMk9d
	 dpEbW466JdluiDxyY0tDKRCpjqTINelIrtecPn7ucJcOyMdpRAhzW4TAsGPxe4z7xpPZN
	 PSz/QqngJ46o98cRPZNUNIWA04arCZgE1ZrZXWK0KSWzUh3yKwoweTl9nDGW90KwIKRPC
	 LR5lA/2b+0TETDliIToSRUiC59SVc/2TIdRxkQBWc50FMK9tCCOCT3eSlMJoU6aBlmcHd
	 afYu7xomXnf0ENVSy/WMST2tyqGsIXKLkDw0Fo8IbUioMEYLnwpiQex57niOYehnK1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Mp3jd5Nc1bvdidRJD/nxP5M+kf6y7wjXIuXFg7ygvIQ=;
	b=q9uAyLeW1PTyrn0UdFMCNI3sUwS1Srqz3AQSBl/zd7QibKhw0QfU5iZu8cLiacN2ejU3
	 egZ2przk21of6edeag0cHI0cHCTD8UjIfU8WDs9T3MWgp54NgljPQP25aduJ5jmJdES8M
	 yMvM7cz8rAoSunOUdt1heuxUQfFm7AOYpdpiNOB/j16TTMtvadzcTDDTPu1KXje0ODmOS
	 N8dj4L2F8eeV6CEdvwEV5kK5oofYJWQ+q27norWKE4K1zmNWCKC3sPvxyNzNw8cKMYFKt
	 S4eOaNC55vI8zet+qxljZ8rd80/Tx64oay9Q0Vn+RMUkuqIf43UFgnXzm8UXzH9CaWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="L60DZUo/";
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2257606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2257606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L60DZUo/
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38355b03cb8so1725099eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107832; x=1795712632; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mp3jd5Nc1bvdidRJD/nxP5M+kf6y7wjXIuXFg7ygvIQ=;
        b=L60DZUo/47gATwoHPaDhKDCGNwSfSUe076+2yLnytjU9jVhtbFz5mQgBHHNR6dd6Jq
         ZoM12jBXw4Al4/82Y0+aDYSBt75mWlFc838l81pooNb7EtfXB0YFjkP2ps6jDoxGdVfq
         5/RCeH/MASfy9JXWLcHLqd69ck4lmwtltP77uu1NXa/9Pf33EG6TkvH6FdLfzsZogELN
         fp40rPAptVz34cQ/xEwyge96FiS19XlXil1LhG+oV2+XLz0GmAXPdQ18l/o2jNZOUKR6
         H4L2QYKRS35PwUieDpH51ypgVAvQO0oVz/semjra78bDhlkUrRTxiihqaA8ZwbelYj+Z
         QRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107832; x=1795712632;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mp3jd5Nc1bvdidRJD/nxP5M+kf6y7wjXIuXFg7ygvIQ=;
        b=juy0CCDjavoVbbRPDo3/DI7rrCAa5ICyNbxQrkqdGhDo4rAZGc7YnZuP5NmdGx7C/O
         qjDYbHpDoD3EJ1V1UsWHn0R6OZm+7q2ksC+i4AX1sWyj3fuDEEOnR3y7Mk1/wMZk9uEA
         ER+MS3j9r0x21JVKdl2TCSY09S474GpnaPRXz65ZyzyDsejBS9vQfIXvOv9rZ4punXe5
         C7PncPDLHgzzWqMxh8W6DqkNx+binVcy5npfrbakrWxzcRLsxqZmCFqYzVetDdStZkTE
         F7FcTDaiCNH8IVQC/Fv6ArkI1rlLO0OBRGNXyVkag5IIwV4uP8eBHEkcTwBL2OgYrKgW
         +yRQ==
X-Forwarded-Encrypted: i=1; AL+hErEw5mt3D+he3ePMfSWU+3AERyXl8sZq3kFBBBJSSDUw97Gwq13Ezq9hFAxYq9B4DA9IWNyOMFf5dppDLnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/r+8LeqouXlP+7SJKdnFlHZ7ro84IsXHWh5HmCja+UsjQ4YIiU
	i5AcoNFZHpwypPg5bb+RpmhTImPxifb6797QPrk9QiOwRPbnBJD24kLbUuVkIkb9ecCnM33Wtx2
	NzfnvBPZk4A==
X-Received: from dycuf3.prod.google.com ([2002:a05:7300:103:b0:383:9b3f:7909])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:6a9b:b0:367:185e:867a
 with SMTP id 5a478bee46e88-38281cf60d3mr5573598eec.38.1795107831376; Thu, 19
 Nov 2026 09:03:51 -0800 (PST)
Date: Thu, 19 Nov 2026 09:03:48 -0800
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
Message-ID: <20261119170348.1509147-1-irogers@google.com>
Subject: [PATCH] afs: Fix uninitialized count on split reply in afs_deliver_fs_get_capabilities()
From: Ian Rogers <irogers@google.com>
To: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In afs_deliver_fs_get_capabilities(), case 1 extracts the capabilities
word count into local variable count, saves it in call->count, advances
call->unmarshall to 2, and falls through to case 2 to extract the first
capabilities word.

If the RxRPC reply is split across packets such that afs_extract_data()
in case 2 returns -EAGAIN, the next delivery call enters the switch
directly at case 2 with local variable count uninitialized and passes
(count - 1) * sizeof(__be32) to afs_extract_discard(), corrupting stream
unmarshalling or hanging the call waiting for a garbage discard length.

Use call->count when computing the discard byte count in case 2.

Found by enabling Clang's -Wconditional-uninitialized on an x86_64
allyesconfig build, with AI coding assistant help to audit the warning
and prepare the fix. Build-tested with Clang; not runtime-tested against
an AFS fileserver.

Fixes: b537a3c21775 ("afs: Fix corruption in reads at fpos 2G-4G from an OpenAFS server")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 fs/afs/fsclient.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 1a3f186a6a11..7b5fb8b122ab 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -1707,7 +1707,7 @@ static int afs_deliver_fs_get_capabilities(struct afs_call *call)
 		if (ret < 0)
 			return ret;
 
-		afs_extract_discard(call, (count - 1) * sizeof(__be32));
+		afs_extract_discard(call, (call->count - 1) * sizeof(__be32));
 		call->unmarshall++;
 		fallthrough;
 
-- 
2.56.1.708.g77570a6a1d-goog

