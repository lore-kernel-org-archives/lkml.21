Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423092;
	b=U1xVuhJ40/FCXuFXqMnebU3vpq9KD5YgCr7taFKybUdD3mc2BBzOc/P9zUrFf66GTBqR
	 J0Du6Eq+OZz1Sf0CwldF3h9hQClUDjt8gHIzrfRaq0mMqMaGw53c0kSQuH/CwAUARn/lL
	 FJqhqBTefaEV8nWvWsXrHGRsgcvKQoOZnqUb4h9JF6Mo/TsvhjeopuB+6gf0fEEl4k26m
	 Pw08QNbT/lDJuX2/JztPbnmn/3R+MchgdzOvqD+GCuMeGbINelQTeAMCc31WIFTNFvfu1
	 wVMKIB3GVZ5ibW6IY+/u//MmG2tPtOSrPNZdJz+Bv/qAyL/pymiQ5P8mM4dmaxeVIuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423092;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=w+rD7afdzLZsy+xn6lHm0qZL7x2DifgHL8w+M+UbnJo=;
	b=HALmrnBvQqdh42pUxuDAtdUXJLRQn27wEAVoI2I4a2968MsnhOferiY1LLmOmegRmVu2
	 hnaZf7WgW16s+nEu5qXZ2YsyUeeJbTL+ZWFv2L8hHlQunbGrqjHqT+jm39jftQmPM5kqE
	 DEbarN4UkrKGRLQOxgYg56sdlWhh+jM23ELSC+gz67/2x1tGEFisvD3bVu/wh4zeiNoH2
	 YWXO9TD1o5rgNi2t2fkwifkJRgF6sP4e2vs22aGbXLvYkGqzkJQb5c8Vsg3E0DxsGnOaI
	 bxSai83dJoaEpx9SX77F4s2CClUXMzxwW7vaQ7wog6T7esNJyEGC2ssdoRxr1J8/HJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R+k3FoE6;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DBE606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7DBE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R+k3FoE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795423090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w+rD7afdzLZsy+xn6lHm0qZL7x2DifgHL8w+M+UbnJo=;
	b=R+k3FoE6sVXcmL5RY5ch/s0hyh7QL72a5ny68YL/NTOOs+PbMqDwM7G8Zi9cWtofXaL8uw
	M0nE3tEKcFXS6K6BM3x3k6VB4v9BOWOHdZwiY5S1UwViWL49jtvKMTIbBhhC99uvRquZr6
	2EWYB2GpVA+vMq9Z71IE1HU9zeQnReQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-cjO5B6rYPtSZFg9jstMiig-1; Mon,
 23 Nov 2026 08:38:05 +0000
X-MC-Unique: cjO5B6rYPtSZFg9jstMiig-1
X-Mimecast-MFC-AGG-ID: cjO5B6rYPtSZFg9jstMiig_1795423084
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BAA6F195604E;
	Mon, 23 Nov 2026 08:38:03 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2BEE13001DA7;
	Mon, 23 Nov 2026 08:38:00 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Tobias Schaffner <tobias.schaffner@siemens.com>
Subject: [PATCH] rv: Fix BTF confusion in rv.h
Date: Mon, 23 Nov 2026 09:37:08 +0100
Message-ID: <20261123083709.62502-1-gmonaco@redhat.com>
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

The private rv.h header includes directly the private ../trace.h header,
this brings a series of unneeded dependencies and, if included with
da_monitor.h, may cause failures for duplicated symbols in BTF (namely,
the events symbol).

Only import what is really necessary:
 * trace.h is necessary only in rv.c (init function)
 * the public tracepoint.h covers most uses
 * other specific headers are now needed (interrupt.h)
 * re-define RV_MODE_* as it is only private in trace

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 kernel/trace/rv/monitors/sts/sts_kunit.c | 1 +
 kernel/trace/rv/rv.c                     | 1 +
 kernel/trace/rv/rv.h                     | 6 +++---
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/rv/monitors/sts/sts_kunit.c b/kernel/trace/rv/monitors/sts/sts_kunit.c
index a07316fff091..92836adbc620 100644
--- a/kernel/trace/rv/monitors/sts/sts_kunit.c
+++ b/kernel/trace/rv/monitors/sts/sts_kunit.c
@@ -3,6 +3,7 @@
 #include <linux/rv.h>
 #include <rv/kunit.h>
 #include <trace/events/sched.h>
+#include <linux/interrupt.h>
 #include "sts_kunit.h"
 
 #if IS_REACHABLE(CONFIG_RV_MON_STS)
diff --git a/kernel/trace/rv/rv.c b/kernel/trace/rv/rv.c
index 29f155c6968b..e37f0f7c990b 100644
--- a/kernel/trace/rv/rv.c
+++ b/kernel/trace/rv/rv.c
@@ -142,6 +142,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
+#include "../trace.h"
 
 #ifdef CONFIG_RV_MON_EVENTS
 #define CREATE_TRACE_POINTS
diff --git a/kernel/trace/rv/rv.h b/kernel/trace/rv/rv.h
index 62779e6b74bd..dbcb7a3a41a8 100644
--- a/kernel/trace/rv/rv.h
+++ b/kernel/trace/rv/rv.h
@@ -9,12 +9,12 @@ struct rv_interface {
 	struct dentry		*monitors_dir;
 };
 
-#include "../trace.h"
+#include <linux/tracepoint.h>
 #include <linux/tracefs.h>
 #include <linux/rv.h>
 
-#define RV_MODE_WRITE			TRACE_MODE_WRITE
-#define RV_MODE_READ			TRACE_MODE_READ
+#define RV_MODE_WRITE			0640
+#define RV_MODE_READ			0440
 
 #define rv_create_dir			tracefs_create_dir
 #define rv_create_file			tracefs_create_file

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.1

