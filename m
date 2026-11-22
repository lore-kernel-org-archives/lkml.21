Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307725;
	b=3F9P9bf4ERnbzM0ERypTrLOAAMXdzeDXAO8fbWiXgvNRdgMYjtpFxxLm9u8TSvou4DKn
	 RciJCHNILthGpTMYg42bn5hFsEhvP+pImXybrMaWkuJ5JF8zstkVXtaJDZq3dOC/8Ux7a
	 NDuSK3n5Y1sds38CIB3g8seceZ9g37K2BPUqdht9aV3Ki+LNBug4wkRFiaHuh3KJJiXm0
	 pMaDqmNYSOCmF/eWB1B1ICO/XM8ahrXubfh/walVwUvO2w2Xk8kyanaGIsxE612Gt99gv
	 EK7la3+r311ohIy7ORlBcQe4Y71z1XurNNPTb1ousNHFYpA8C8hA9UmQJnNdOpB/0MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vxj37Hr5O+kDPLZxiNuhBV6UtfZk88fpDy0o/vxTN+c=;
	b=ck/KduNxZOcu5rKAQdofEP4OBihVVH2YVjithflSazPcD/vliqqB0qRzHfjYwb8mDA6d
	 b1evcO0H45j0cQmeXjQIJoxFxv3CALM34uce0rcxfPFZbVYUc2qbj6lHfFyKYcy0xgd/Y
	 dERopcSfXR48NfxBg9Kp49LvbEVyPStbbnmUdIqbGqolDNGW9HdXEEYEWINdc9HUXP16L
	 aau0YIgCk3VRxOsZCBmx+gl6q/EU/556xxYECAwaiatEoohdZrNlK203vA1dLs161zfMZ
	 zVp68RRotHhGhduUopPIVDmgS1EtgslluQuJM3v8A8DKy0kQ4qbUNABKmws2R4QrQqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fdPu4qdO;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E493C606A332
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E493C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fdPu4qdO
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so22492405e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795307723; x=1795912523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vxj37Hr5O+kDPLZxiNuhBV6UtfZk88fpDy0o/vxTN+c=;
        b=fdPu4qdO30qiivSx5Rj+zo0EF57i8QoJJ+6qC4p87IBxoIIY0w3HMmkr/R5iW95SCL
         1wvzqzDZxUPrmbIkMg8kpMR5WqD1OCx38a9GRbJN0+Wq0aewIYrA1e9DIbEEBU88eBEn
         +0Lq3qOoN/7PuHocdqMarDfvPrx9Di13lMiKOaV5T2kpPlOt0ZBgcW67jpGsWwBgDDBW
         6hLS4fZqC3cNC1x/0aMNBkmfJHo0jJmRhaGO2GaSYlBBosUuo9IAGHVkKXBv/fcc7zUS
         cYu4eJmCH00ZD3pCPwC1rrHs9kGWJrvDY420e9Fjh8i6UFeoTZiujBTz5JqaE+DNl/8R
         zT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795307723; x=1795912523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vxj37Hr5O+kDPLZxiNuhBV6UtfZk88fpDy0o/vxTN+c=;
        b=UUOesRDvpMUM1ujtBt5mAveMzJKjUSDJrf0+fh+y6+GIRCk+ALWo9tmIzTvgKFjv79
         JgZde4TcE7XHmP7Rb6GwZoM6niUzauQJlQRDp132/W2TDndehkdeFDtclYOkchcjxsLv
         LamrD5eh1aZ6d5QO+8A3327Vh4SMmiuMdSZqdvwzOyLLQJBOB5PwmH18VC/87/OSmI2G
         9wGlJ/CDmozbprmGhFIEfaPbYHYXQX5SnFb6TiCh8SryTyYb/yhsrH+CZduL/meZQbQc
         Y9T7d3lof+gHBHJBqrzGd3BeiPv2YyYddXnid0NU/qXgU16Y7Zp8YC8Jf6misU1xoKMR
         7VWQ==
X-Forwarded-Encrypted: i=1; AL+hErFfdd5EHc3h4J+F6ax45x/BAaaWyMvRXRcW87L7OB82mG+qnG6xafUjzyL3irsRyshLO+HrWnB4NsohnB0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AuC6VtBz4WYIOChPnwovCc3lbJeFz8osXevsdHgtXiZdrhYRf
	z1uBNXMNEYRWCeBF5V8Q7w1SPMtMsi2MHCHoXlEWwpx77IZAFDVwFeom
X-Gm-Gg: AZFdTZelHZxbiOAW6JP7vl3EEBxUXnKEIz8yeeLk1Z+yDRsXl2LweoVLfUwFeu9Szrd
	TVv7hfQ7snQy97ZHBzN57I8YZE7KEvIWpIPCTS7jRS8Ny9eKuXkTyrF4F8xEkLGmJc5aAH0CmL3
	40Oyn1RtKuOjXR8bSECBNITLr1Uq9hy1zfXJg6pLplEfRTDiQESoX0j4N9Rv+432WMRWZBdr7an
	9zHxEQrk+APoV+Evc43qPSOaQQFOzAgrmOE6S8iY0uDe1qdAcAjPRacxK8LwM0X2W1dDqQAW3aQ
	Mq2k8+PBcYbmkbGAJQBDVK1BSe/XfDuZOiM7o4NLOHn4zEPUAsa6vp8MK1kNcN62H1UrB8jPV2q
	aNfGXUATUWDrWcuf4f7q+FAjjKxwefTsdNGW0uMjKOH1lyjPXDbdQB4uijYSRLlZidllSXlFapR
	OU5JqX05+9a4U440AFbCyTCi/9lx7n8WE1ZYJa2ho+P0V+uIlZGpyFkEgcvgso/f5yCNnoL+rEy
	owlQsNguqB8jZPtpUVdWjOElhS3vVBib17pxa/wDjfgnXQk2eP+QfWz4I6CrUyftEJ83Nlwxq++
	wcpmMVGIEJq21BI657W+hxKg9M8JlnhinXcg37qAyGwsnCR59CAD8K1gSSmZD872JQWE2KcawVI
	OS+C3ow40jdHMAruOBCHOkBGbisUDDFkb9iTvIc5ilyqrjEmKnwoS4lxW7D/Q0Xp4ALpz87g7On
	DC0zJ9ZB7HpedIc/v79kC10kjT1xh2fB4KX63ShRrrPpzOCYGJqhbo7WkNphrcw0F8ryjRI2XmX
	678uV0db89S8/vQZg==
X-Received: by 2002:a05:600c:c168:b0:4bb:81b2:c801 with SMTP id 5b1f17b1804b1-4bb889238f1mr154507125e9.20.1795307723242;
        Sat, 21 Nov 2026 16:35:23 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-2025-a95f-1d53-595d.rev.sfr.net. [2a02:8434:fda5:4201:2025:a95f:1d53:595d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm74017825e9.5.2026.11.21.16.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:35:22 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] tools/bootconfig: Use the registered global tracing parameter names
Date: Sun, 22 Nov 2026 01:34:58 +0100
Message-ID: <fecf6e33d4f7e2ddf031526e7a1abef27e28f754.1795307698.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795307698.git.edumucelli@gmail.com>
References: <cover.1795307698.git.edumucelli@gmail.com>
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

The boot-time tracing guide lists four kernel.* keys that do not match
the parameters registered by the tracing code. For example,
ftrace2bconf.sh emits kernel.fgraph_max_depth, which bootconfig passes
as fgraph_max_depth on the kernel command line. The function-graph
tracer registers ftrace_graph_max_depth.

Use the registered names in the guide and the exporter. Teach
bconf2ftrace.sh to read those names, with the previous script keys as
fallbacks so existing replay configurations still work.

Fixes: 47781947947a ("Documentation: tracing: Add boot-time tracing document")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
 Documentation/trace/boottime-trace.rst   |  8 ++++----
 tools/bootconfig/scripts/bconf2ftrace.sh | 21 ++++++++++++++++-----
 tools/bootconfig/scripts/ftrace2bconf.sh |  5 +++--
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/Documentation/trace/boottime-trace.rst b/Documentation/trace/boottime-trace.rst
index 2c3c1fedb..68fd6152c 100644
--- a/Documentation/trace/boottime-trace.rst
+++ b/Documentation/trace/boottime-trace.rst
@@ -36,20 +36,20 @@ these options are passed as a part of kernel legacy command line.
 kernel.tp_printk
    Output trace-event data on printk buffer too.
 
-kernel.dump_on_oops [= MODE]
+kernel.ftrace_dump_on_oops [= MODE]
    Dump ftrace on Oops. If MODE = 1 or omitted, dump trace buffer
    on all CPUs. If MODE = 2, dump a buffer on a CPU which kicks Oops.
 
 kernel.traceoff_on_warning
    Stop tracing if WARN_ON() occurs.
 
-kernel.fgraph_max_depth = MAX_DEPTH
+kernel.ftrace_graph_max_depth = MAX_DEPTH
    Set MAX_DEPTH to maximum depth of fgraph tracer.
 
-kernel.fgraph_filters = FILTER[, FILTER2...]
+kernel.ftrace_graph_filter = FILTER[, FILTER2...]
    Add fgraph tracing function filters.
 
-kernel.fgraph_notraces = FILTER[, FILTER2...]
+kernel.ftrace_graph_notrace = FILTER[, FILTER2...]
    Add fgraph non-tracing function filters.
 
 
diff --git a/tools/bootconfig/scripts/bconf2ftrace.sh b/tools/bootconfig/scripts/bconf2ftrace.sh
index 6a3535a2c..e7cda59d2 100755
--- a/tools/bootconfig/scripts/bconf2ftrace.sh
+++ b/tools/bootconfig/scripts/bconf2ftrace.sh
@@ -276,15 +276,26 @@ setup_instance() { # [instance]
 }
 
 # ftrace global configs (kernel.*)
-if xbc_has_key "kernel.dump_on_oops"; then
-	dump_mode=`xbc_get_val "kernel.dump_on_oops" 1`
+# Prefer the kernel parameter names and accept the old script keys as fallbacks.
+dump_key=kernel.ftrace_dump_on_oops
+xbc_has_key "$dump_key" || dump_key=kernel.dump_on_oops
+if xbc_has_key "$dump_key"; then
+	dump_mode=`xbc_get_val "$dump_key" 1`
 	[ "$dump_mode" ] && dump_mode=`eval echo $dump_mode` || dump_mode=1
 	run_cmd "echo \"$dump_mode\" > /proc/sys/kernel/ftrace_dump_on_oops"
 fi
 
-set_value_of kernel.fgraph_max_depth $TRACEFS/max_graph_depth
-set_array_of kernel.fgraph_filters $TRACEFS/set_graph_function
-set_array_of kernel.fgraph_notraces $TRACEFS/set_graph_notrace
+graph_depth_key=kernel.ftrace_graph_max_depth
+xbc_has_key "$graph_depth_key" || graph_depth_key=kernel.fgraph_max_depth
+set_value_of "$graph_depth_key" $TRACEFS/max_graph_depth
+
+graph_filter_key=kernel.ftrace_graph_filter
+xbc_has_key "$graph_filter_key" || graph_filter_key=kernel.fgraph_filters
+set_array_of "$graph_filter_key" $TRACEFS/set_graph_function
+
+graph_notrace_key=kernel.ftrace_graph_notrace
+xbc_has_key "$graph_notrace_key" || graph_notrace_key=kernel.fgraph_notraces
+set_array_of "$graph_notrace_key" $TRACEFS/set_graph_notrace
 
 # Per-instance/per-event configs
 if ! xbc_has_branch "ftrace" ; then
diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index b3c976bc9..c23e7cc8a 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -46,10 +46,11 @@ emit_kv() { # key =|+= value
 
 global_options() {
 	val=`cat $TRACEFS/max_graph_depth`
-	[ $val != 0 ] && emit_kv kernel.fgraph_max_depth = $val
+	[ $val != 0 ] && emit_kv kernel.ftrace_graph_max_depth = $val
 	if grep -qv "^#" $TRACEFS/set_graph_function $TRACEFS/set_graph_notrace ; then
 		cat 1>&2 << EOF
-# WARN: kernel.fgraph_filters and kernel.fgraph_notrace are not supported, since the wild card expression was expanded and lost from memory.
+# WARN: Cannot export kernel.ftrace_graph_filter and kernel.ftrace_graph_notrace.
+# Only the expanded function list is available.
 EOF
 	fi
 }
-- 
2.53.0

