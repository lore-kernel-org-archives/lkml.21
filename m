Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698102;
	b=YxAl3fuJBVkfju4i+1Gy1KxkgczY1aJ1ehJDzWXUareLYl5SRluggFlD4P6+5eE6kkK3
	 iJ3+y8JbfJNHu0nGil6z9Kq4J5B9PAYGFAqLRPJABhKMevTty5loq9RhY0VyRZNa5Kftf
	 Z8mOIDMgnGw08fDBDsPIEVdqC86LGVVpEi/h16RxpgcLGFQ+cUShOP0GhslFlIRec1fYH
	 pShTOJsiQ6Pd0buhjftSetIvdKCSTQZpKjIofW7XDz6DafAmJltZSIJUXCCv9vRILAZ0K
	 ohqYtlFuJWoxIsBmHp5AQJPunQj5Zydrw7MSKMpwUPci0wrvEO42oV+G2eg2GQqr4/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698102;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=k8Cv/59D5sljUP7KuQcbi4TP82IHvLoL6JhsgTdaF2M=;
	b=qiBgtyBYBzZhpr61WkCh+IHV6uSkZ6dEiDJotCmblGREKsls6kjxn0yD79om1LzaMryd
	 PqAi32yK/t9Af6CztJ/tBASbEWGyyEQM6k6GFbUUxCnbZAhQg9jd0GODTuQZkNzmOZwAi
	 iO12budGoS0gZTEynOAnVk3eI5AycczNDuE0xqT31C9KDvag54ZhmVH0OGkZ9Z9UNifP6
	 ubBQWkr0cI5/BtWazSJoUWSShO9nVd7GC396eEmlzPLi8pxVfWjN18iqlKCC1+pcV9Sb8
	 cMz1D/sJmF/73sdbjGOnDcpox3+UIrJFiwQsJr7fIKBB3wDElgTwoRBhZlLIDqglVRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q6E4r4Yl;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6133C606A684
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6133C606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q6E4r4Yl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795698100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8Cv/59D5sljUP7KuQcbi4TP82IHvLoL6JhsgTdaF2M=;
	b=Q6E4r4Yl690dVhY8EMcMq6CHND9JYOgrecx0v9WPwLlQWS8T4Yr7S/w0ktCLDs1BHongrV
	R7s+WL8YOr9NVRKsw14cxGLMsatYVLJz2vxK91woLi/VpcW57DCfMvGHkElA2GxssZjN40
	4PJSlQJg/1lYSNjagsk4FjPTJWsh9xY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-692-PyOkHxZiMGaCrOan8oV33A-1; Thu,
 26 Nov 2026 13:01:35 +0000
X-MC-Unique: PyOkHxZiMGaCrOan8oV33A-1
X-Mimecast-MFC-AGG-ID: PyOkHxZiMGaCrOan8oV33A_1795698093
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BEC4B1955EA9;
	Thu, 26 Nov 2026 13:01:33 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B3E32180054C;
	Thu, 26 Nov 2026 13:01:29 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Nam Cao <namcao@linutronix.de>,
	Wen Yang <wen.yang@linux.dev>,
	Tobias Schaffner <tobias.schaffner@siemens.com>,
	Viktor Malik <vmalik@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	John Ogness <john.ogness@linutronix.de>
Subject: [PATCH v3 14/18] tools/rv: Define CONFIG_X86_64 statically for BPF monitors
Date: Thu, 26 Nov 2026 14:00:00 +0100
Message-ID: <20261126130004.127155-15-gmonaco@redhat.com>
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

BPF atomic macros require CONFIG_X86_64 to determine barrier
instructions. Reading this from the system Kconfig can fail if the
configuration is missing or in an unexpected location, causing the
loading phase to fail.

Since the rv tool is compiled for the target architecture, the
architecture is known at compile-time. Define the CONFIG_X86_64 value
statically via the libbpf open options to bypass Kconfig dependency and
ensure reliable loading.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 tools/verification/rv/src/bpf_monitor.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/verification/rv/src/bpf_monitor.c b/tools/verification/rv/src/bpf_monitor.c
index 5c9c4d9b4835..1ff76a4ffb68 100644
--- a/tools/verification/rv/src/bpf_monitor.c
+++ b/tools/verification/rv/src/bpf_monitor.c
@@ -460,6 +460,12 @@ static int get_nr_cpu_ids(void)
 	return strtol(sep ? sep + 1 : buf, NULL, 10) + 1;
 }
 
+#ifdef __x86_64__
+#define X86_64 'y'
+#else
+#define X86_64 'n'
+#endif
+
 /*
  * open_bpf_monitor - open and load a BPF monitor object from a file path
  *
@@ -476,8 +482,8 @@ static struct bpf_object *open_bpf_monitor(const char *path, struct bpf_monitor_
 		return NULL;
 	}
 	/* Define statically what is known, Kconfig may not be available. */
-	snprintf(kconfig, sizeof(kconfig), "CONFIG_NR_CPUS=%d\n",
-		 nproc);
+	snprintf(kconfig, sizeof(kconfig), "CONFIG_NR_CPUS=%d\nCONFIG_X86_64=%c\n",
+		 nproc, X86_64);
 
 	LIBBPF_OPTS(bpf_object_open_opts, opts,
 		.object_name = ctx->monitor_name,
-- 
2.56.1

