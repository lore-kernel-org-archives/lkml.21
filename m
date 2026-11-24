Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534177;
	b=pN5cKM6VRd+T48mSfTywFMhOO31z29R7hkF+3pPL721KfzKUxxUACUNS95uLjd0tjYON
	 6Q4g2BkkwLVRutrhRCuBqjEjyTYq4syt9WagWmoBwyS+YROigbtlIxijquK/a9Ed+5+c0
	 3YbgKUMY7VAX1hcclLO/A1hViZIXCMUR4czqNYU+FDkixlShloXfRk7pGC5gSUicx+nA2
	 7zJlkibtiXn6aqY2e/Qbff5G1UDUGjmDaxSVH95VUf/C3xpjO+6Gyy3w5L9RoxxGkBIvs
	 CN5Pig9fTrIy/KtgWti7MpHJ5VReyeR2pm2dv5fVoY+oZZt3luRTAFWkUWG0UMw90DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=96oumjC/jkMss3EPeYKU5AeAWESEy4tQj1abmw7mJRI=;
	b=b4i81A3QNPp0iQkbhV0g4Jrd1tpnyoIgMDnRPPx6HZjlGYlp/ktM9MH4l5Z4vp90XU9J
	 h3GMZ/5wDnOehXDilUjQreY+KSnsGtdpn5FcSXkvHarmInEjeHeTsdYzuyfa4OrqWLcDT
	 pb+sjIIjK5s9rBNNsPhiK56PQJvcE+rJZt7dyLwxN+WKHQAR5ymUlbBaw9c8mKpalKPv2
	 o8D8LIb2Uly9IPnM9jNyq00nYT2ce2P72EsSRf5J6RVAzbm84aGct7SUeqdLbSfDBTQBI
	 ZZ9YViFLk8mDoEzxjnEXTm3rvEr1As5hPA98lG4QUWDdrIZTg1xnB3y7OuG2GsSjKkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i5kl28xq;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E9F606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3E9F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i5kl28xq
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a4654add56so32258965e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534175; x=1796138975; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96oumjC/jkMss3EPeYKU5AeAWESEy4tQj1abmw7mJRI=;
        b=i5kl28xqEw6zwQ1J/meV5htbD/MMiPZrQynAwdxj0lK5uUppoSvXns+qZf/s7+1tI9
         Iq9xwh2ZuFaR16WY9RRPL7DnCP30+x9FTgITcbtcCzJgTjD7t9L48QnDWhsrnjbIlyHs
         /uncs55BAvuEm8vziLuYkfjyskfAwa71Qfl3D39mepmWfYVH/p/DjSWItp42WT3v6wui
         dPdnWiRlV0eec0lJPX5Zy97iqmdHKTilk+lhCcfH7SU7K+XwzfjYRKu12JIYS2wCOmUx
         m3J6aa3iMDQXn8SMHUbmdCZs50xEjOVEI5A2g6eyaCKBX9Oqe1os7fp+ioIYmUB7zKwx
         wnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534175; x=1796138975;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96oumjC/jkMss3EPeYKU5AeAWESEy4tQj1abmw7mJRI=;
        b=xqLhln4PsgGQ36RCewHO3vzNh/4/Gwd8Jnh3OJHSVzyTeqYUGGQSenoTKhGwC4U0tO
         VCyYH+QmFJtBU//JFDuxHfgW6W9/X5xYRoUFZCDDH7zwDqmpk/7JKSgRjSV0K//Gk+K2
         fsmw1bMzpTlGDmJYEbQdL1fquP2px9acDs+O9UPyK9NURbyrO4e62lWLcDNCBMkf77il
         2m387hrShAOHMvtiMYTiLVw6ordDzwTm3lBgYf2J7B7+XZClQSHVv4MK8dWgpqmIDi8O
         7TA7FCDEHHWO3uP3L4KtgAuJFKJll9o672BSf0zOAHzhFRx9VgPaGqJpH6EHTXT+jHLh
         E8Ng==
X-Forwarded-Encrypted: i=1; AL+hErGjJmqOGKwUM71HjogMvUnJei0YnUtMgq3f8Oxw9fbJZiWTLZyhmkdZvuKdYfQxy62loNSPNYu6VnA8yPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UkXt8Kstpf9P5JJ/SQaxutY9i8Y2v1kE5O9u4dsqS38wp/OmY
	CEUjDD1scC1v+ERSoev6cin9AvLx+Tp5fB2ODT8IdI1EirLajMdosJuzTNyRsGf6VgpEqxIEVr0
	sDGtN+awa+tj4hb6QxvzSIA==
X-Received: from wmcn6.prod.google.com ([2002:a05:600c:c0c6:b0:4a5:9877:cd58])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a086:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4bb887c34bcmr312840635e9.2.1795534174966;
 Tue, 24 Nov 2026 07:29:34 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:41 +0000
In-Reply-To: <20261124152845.2233401-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124152845.2233401-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124152845.2233401-18-vdonnefort@google.com>
Subject: [PATCH v9 17/21] tracing/remotes: selftests: Add a test for the
 dump_on_panic tracefs file
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Exercise the newly introduced dump_on_panic tracefs file that turns on
or off the trace remote buffer dump on system panic.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 .../remotes/00hypervisor/dump_on_panic.tc     | 11 ++++
 .../ftrace/test.d/remotes/dump_on_panic.tc    | 50 +++++++++++++++++++
 .../selftests/ftrace/test.d/remotes/functions |  1 +
 3 files changed, 62 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/dump_on_panic.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/dump_on_panic.tc

diff --git a/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/dump_on_panic.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/dump_on_panic.tc
new file mode 100644
index 000000000000..1b6bf21c5d9c
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/dump_on_panic.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor trace dump_on_panic
+# requires: remotes/hypervisor/write_event remotes/hypervisor/dump_on_panic
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/dump_on_panic.tc
+
+set -e
+setup_remote "hypervisor"
+test_dump_on_panic
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/dump_on_panic.tc b/tools/testing/selftests/ftrace/test.d/remotes/dump_on_panic.tc
new file mode 100644
index 000000000000..ff5ca29fb1b5
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/dump_on_panic.tc
@@ -0,0 +1,50 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test trace remote dump_on_panic
+# requires: remotes/test remotes/test/dump_on_panic
+
+. $TEST_DIR/remotes/functions
+
+test_dump_on_panic()
+{
+    #
+    # Toggle when the buffer is loaded
+    #
+    assert_loaded
+    echo 1 > dump_on_panic
+    echo 0 > dump_on_panic
+
+    #
+    # Toggle when the buffer is unloaded
+    #
+    echo 0 > tracing_on
+    assert_unloaded
+    echo 1 > dump_on_panic
+    echo 0 > dump_on_panic
+
+    #
+    # Load and unload buffer while dump_on_panic is enabled
+    #
+    echo 0 > tracing_on
+    assert_unloaded
+
+    echo 1 > dump_on_panic
+    echo 1 > tracing_on
+    echo 0 > tracing_on
+
+    [ -z "$TRIGGER_PANIC" ] && return
+
+    echo 1 > tracing_on
+
+    for i in $(seq 1 32); do
+        echo $i > write_event
+    done
+
+    echo c > /proc/sysrq-trigger
+}
+
+if [ -z "$SOURCE_REMOTE_TEST" ]; then
+    set -e
+    setup_remote_test
+    test_dump_on_panic
+fi
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/functions b/tools/testing/selftests/ftrace/test.d/remotes/functions
index c368dea2ac4e..f0225af23714 100644
--- a/tools/testing/selftests/ftrace/test.d/remotes/functions
+++ b/tools/testing/selftests/ftrace/test.d/remotes/functions
@@ -9,6 +9,7 @@ setup_remote()
 	cd remotes/$name/
 	echo 0 > tracing_on
 	[ -f dmesg ] && echo 0 > dmesg
+	[ -f dump_on_panic ] && echo 0 > dump_on_panic
 	clear_trace
 	echo 7 > buffer_size_kb
 	echo 0 > events/enable
-- 
2.56.1.809.ga0b61035b5-goog

