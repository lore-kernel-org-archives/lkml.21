Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108165;
	b=3jIkdp3X//x1eL019ozYhbKdVg9fQAlWYY9qochyS/g/GyfMO6ZemGhZCGATqk+ZTgVD
	 /FwNgFru4mNBDNhxH1ebrqEYP3UQbYECEuzz98jjLad0k48YliNRSG/+2KZK03Kn6bc/3
	 L69ebDEc8Ov/+l+BMNPD/vMNh7JPQinOidB6H01otTve8IiKGdT9cs5t9fESjjzyGklDA
	 0mFNwSs+859UTVY6S0q6xE2JsWcrbVWv6bPNpN1Lnc/7kQ7FP2oIb0XxDfk/5m8uaRCnf
	 PO9ajhZN2JpXfosaiOySUIJXjXVE8pMQXW3iTVQt+Z1BDM2Op2jS7BnpeXMSZmvyqOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zp/eWIvAWdcJU6LCqEw8Tba2FtGF8iLEdj4AaHHxWjc=;
	b=RiOCekbEohZyUIjfz/lyKXbBEnCZO4liISQ4Ip7dTW4sQkUxO2t7ubv4YXIskuJ2reRH
	 7pMtB/nrKeF5xkycra4XFj/vZFcZCTrO+Psv0v4ZMUdB8IZTmzxLIC3srwkLCAwSH2oUA
	 LUIKpJNrf7aOEK9OaoqqcHkyWxZTs3RtaJLMSFC5tbIPIvlL5mCDNpg0MHrm7coJjWE1c
	 O7uyVPEMgwq/X0Z60hddi/7GBwMTk86SzEo/qeJ8bIoAq1+kMgtW1s3qqQwBni7yBZX0y
	 jPEsjbEG46ewwDtxfs7ytPRoQtUxnuxsN2TJq+azYTYWGl/7I4Wm7feyAx+qlb/7/4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=beGogJ1e;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A15606A635
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A15606A635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=beGogJ1e
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so1161570eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108163; x=1795712963; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zp/eWIvAWdcJU6LCqEw8Tba2FtGF8iLEdj4AaHHxWjc=;
        b=beGogJ1eaw4nnu6emf+t2c13f96pisPtSefh7XyroUPgQbZdxXySoHEwmqX8WWn4ol
         ZanlaRo8FOIzEo1m0TGGmfI/gT1hP1WtYsFImexqDipPQXmKnWskGGx/K/nJ9nyUo6yN
         qKYo8fL0vZyXe7zwBgr00Cst6VoA6NGR068MKCHBQEEp8P6sUY7apy96p3m4bi/eQln5
         JYNb41FubfrYwbQBDEz4DchOLXZcXFsF0dWnyfwVnjbdGnrJ6M8GKnCGVvke6oGeSe9A
         WfF0PdGENeaAn8BDZEOb6bTE4Ab0u6+M6KMLf2clh0heaM7OcBCHMVCmRRn8qvIeIdPG
         gLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108163; x=1795712963;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zp/eWIvAWdcJU6LCqEw8Tba2FtGF8iLEdj4AaHHxWjc=;
        b=NjLFCNG81pp5dLBYiUBDqb/0IcyP1YgtviuNaNEyFcmSjM95PgRVysV+shekfcjLzJ
         rE8voFAMqdZT9Zx3phWx31pK4TW5OLQigV0HynaF2QMqH0nfosgzcRaFkJlaYph2xjuj
         KRDAkuYxhoTq3YzE7TjSJnK6dzzisP5ZM8o1zagDblByKaUYILcTPTMNGaR9iH2ZturA
         kIjf5sccw/RXGHQWuJnaFgxFbsA6b0H5FloVOnokF/fLlTu9e8W5j7JWolXcgnIzMK7/
         vp353P4DGDQTTqGrVweNwZVN5iqpbHmmD9TUFn8CrRZj1+xULCsrHPhRpiLG27ETcMtd
         mJUw==
X-Forwarded-Encrypted: i=1; AL+hErGRfqV/Vq1DC9uH3stcqSdxWx/FNsx+J1+wrltccrnbIOY6H0RSryaIBPOOhec6HgkD20TlMXSjNqeg+cY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xitt8oa2WZPoJTjuyFtRQdZoHCfEvl9Qv+qR+5Cldg7YrPUmO
	uwDdXKJQwndWibxc2+YUcqyrIvshx0Fyz/d6yFoMhPmEAmGVoHdqyvXwKRuQMMznH2mTVWmc1uM
	Oz9eS/ZqEmA==
X-Received: from dya17.prod.google.com ([2002:a05:693c:6211:b0:36a:1f25:64f4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1403:b0:385:5297:573
 with SMTP id 5a478bee46e88-3856f25fae8mr252eec.4.1795108162235; Thu, 19 Nov
 2026 09:09:22 -0800 (PST)
Date: Thu, 19 Nov 2026 09:09:10 -0800
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
Message-ID: <97716b88b986cdfd77a6d90cd4c159a79f96b9bd.1795106967.git.irogers@google.com>
Subject: [PATCH 1/2] wifi: mac80211: Return 0 from ieee80211_reconfig_nan_offload_de()
From: Ian Rogers <irogers@google.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit 589c06e8fdee ("wifi: mac80211: add NAN local schedule support")
factored ieee80211_reconfig_nan_offload_de() out of
ieee80211_reconfig_nan() and added 'return res;' at the end without
initializing res.

When an active NAN interface with offloaded Discovery Engine has no
registered NAN functions in function_inst_ids, the drv_add_nan_func()
loop executes zero iterations and returns uninitialized stack memory
to ieee80211_reconfig_nan(), triggering spurious WARN_ON()s and
reconfig failures during hardware restart or resume. Moreover,
per-function drv_add_nan_func() errors are already handled inside the
loop via ieee80211_nan_func_terminated().

Return 0 after processing the NAN function array, restoring the
pre-589c06e8fdee behavior.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building net/mac80211/util.o with LLVM=1 W=1
(-Werror) and -Wconditional-uninitialized; not runtime-tested on NAN
hardware.

Fixes: 589c06e8fdee ("wifi: mac80211: add NAN local schedule support")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 net/mac80211/util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 44feb80274c6..9fda135dc112 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -1800,7 +1800,7 @@ ieee80211_reconfig_nan_offload_de(struct ieee80211_sub_if_data *sdata)
 	}
 
 	kfree(funcs);
-	return res;
+	return 0;
 }
 
 static int ieee80211_reconfig_nan(struct ieee80211_sub_if_data *sdata)
-- 
2.56.1.708.g77570a6a1d-goog

