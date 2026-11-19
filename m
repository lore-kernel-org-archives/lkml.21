Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108166;
	b=CjKEnZw4Qbi6BBVT0JO1kAwwLuCJMtwKyoCLNrzXPVJXNzLP/ycOeTQ1aprg6aE5Q2JA
	 dDM0ijjAYO1I/uBk+N1u2kXugCgokjd9YbLftYQ4YKf7mj6mNayEruBf2KWmiHToBsXFT
	 Y+qPyHuOl/QPbvmRvavnrywdSA+X1ysADimnDzsgq9VY90sYMlo71sQzD0qQyPhfdWvUg
	 fmszdw9Vr1aeMaGOy/3SBQvL9APgW/gON//iU7p2VGFCCLPir6F7l4fQFSyhb9vHDOrtP
	 0vBejdLtSE+avQOK+c/2wH1d2x2X45pPXW4IdEwHeRBedA53/EQ2IsX7fCWiyAe/3bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9KvSqe4fcu2QYKtWaojecEyNvEdCRD/7r6L6KTVA3BY=;
	b=OAYnLdnS7XktZsJ3GnV14YqyewRcrnp72E34ATv9UhNqPrJlaIA7sGIUeYtXEiWr8L2B
	 te1bZ2DeKlXEOGKcoeDWbrn+tVURLim9Wh2OepDnfqlR3YBVtxMu8Db0vc98PHt6cGkOi
	 oHgnaZl1IfcC4ZnDKN6CDZi3s36QAAFXsFhg15oeVFs0+9WOTAwHwOiTZC2Fp9EbqG5nd
	 2WmEsk9mWHdxuHmOHRUm0qQWfTR62Os1sKVLLbLTfYk9QIU3LqvYED0Ha1hkImATHN7Do
	 z/qNP0qNvGwW1km5Q2xSQhgHHkYgydcmQQK0Bsf+zCfV8TwnyufCuC3Gphpn4bUynag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="SN/nyydJ";
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC5660A262D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BC5660A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SN/nyydJ
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1574872c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108165; x=1795712965; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KvSqe4fcu2QYKtWaojecEyNvEdCRD/7r6L6KTVA3BY=;
        b=SN/nyydJoUYPU9R4qeWA77rQv5dkMTk05II8XEmikiRHes0or+NYqwcqZOT1WQw9gL
         wyIwol4rwPKUgN46c6WjdrrVxDMpzU41+LEQOic1Pfh8G6usB5c8slvICyuqk6EV02Aq
         KAbshw0AlUNB+t1jaQ20J7v7oTpKDnsJEmnAtFXuuz3e4bUB8gfDmcP+j8bmibKCBRwK
         O49gHWJztpV4FKKxZnrXmrJHK4Eru3e4FPnndFaz1Ayrl3R7Df5FeA6epzNY6foh8q8n
         kCti/IncL2UdUypxAMQaq8d2RDXkNr4MqDVAJvAidm9esh5l9pRwu07ZtDfkNJEwEta3
         63mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108165; x=1795712965;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9KvSqe4fcu2QYKtWaojecEyNvEdCRD/7r6L6KTVA3BY=;
        b=K9sCiXf+rwrY/iWY8hITMgQxa0s7w3qGA3jmk8GA+risxn+6JyFA0AuiIvSrDjnV6X
         1MEUpnLeONxJBDuQ6HUfqzPArkGIvbGEOn8C6eNt0HHeYHr8cbblfoExqxCrzT4ScXpm
         42tjeKhzFSQD+t83InnHc9qtbbHqTxxKPLktQ4wi6r0IqWniM1Uw0ybd/hy1d9nuZAxU
         g9Ixxt+xwGam4K/aUhptuyp4OOHdpRgnVBIaaEyHqW+DuTh5V5iF+RbFL2OWxQTIv6QV
         +tvko+qDiHR/ir8bKSpt0OHzJouyUnppI0ZVmbAeHrcj79cHKUP+1piFCxWaWXqGO4tV
         xhQw==
X-Forwarded-Encrypted: i=1; AL+hErEq1VqlpMM9bZLDaeTGzpC+m4TyCnKtXBh65nJ5tsOJrfdLoa8rVhwyUyUV/hd1/MFy5Bq0BOkDlBPg7lA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AMxq6qy5Eqzk6dPtpODjFGLomgLZQluUD6Yuauaj+F+417eAq
	FHCVR06ztX3yAU0FenJCmfmWwwuHqUQkwbHFojlz1qfkBMwrD0QkrE2tqXj0DuQCo2EKX0s+O/q
	IXPTgZK6b/g==
X-Received: from dli28-n2.prod.google.com ([2002:a05:7022:29c:20b0:1b5:3561:2fe9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:e80a:b0:1b5:4b48:b9fb
 with SMTP id a92af1059eb24-1b5567c0ea6mr264480c88.5.1795108164835; Thu, 19
 Nov 2026 09:09:24 -0800 (PST)
Date: Thu, 19 Nov 2026 09:09:11 -0800
In-Reply-To: <cover.1795106967.git.irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1795106967.git.irogers@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <ae02ab481b5ce8259a22135255de5864777e37d9.1795106967.git.irogers@google.com>
Subject: [PATCH 2/2] wifi: mac80211: Return NEG_TTLM_RES_REJECT when sdata is
 not in driver
From: Ian Rogers <irogers@google.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

drv_can_neg_ttlm() returns enum ieee80211_neg_ttlm_res and initializes
res to NEG_TTLM_RES_REJECT, but returns -EIO if
!check_sdata_in_driver(sdata).

In ieee80211_process_neg_ttlm_req(), any return value other than
NEG_TTLM_RES_ACCEPT is passed to ieee80211_send_neg_ttlm_res(), where
an out-of-range -EIO value hits 'default: WARN_ON(1); return;'.

Return NEG_TTLM_RES_REJECT instead of -EIO when sdata is not in the
driver.

Found via Clang -Wimplicit-int-enum-cast on an x86_64 allyesconfig
build. Verified by building net/mac80211/mlme.o with LLVM=1 W=1
(-Werror) and -Wimplicit-int-enum-cast; not runtime-tested on MLO
hardware.

Fixes: 8f500fbc6c65 ("wifi: mac80211: process and save negotiated TID to Link mapping request")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 net/mac80211/driver-ops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index 9aefa55cbdfd..0558ba58f3fc 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -1740,7 +1740,7 @@ drv_can_neg_ttlm(struct ieee80211_local *local,
 
 	might_sleep();
 	if (!check_sdata_in_driver(sdata))
-		return -EIO;
+		return NEG_TTLM_RES_REJECT;
 
 	trace_drv_can_neg_ttlm(local, sdata, neg_ttlm);
 	if (local->ops->can_neg_ttlm)
-- 
2.56.1.708.g77570a6a1d-goog

