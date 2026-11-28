Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795867093;
	b=zx4hcfnq6BcgMkO26UYWBDT4wPurMadD6aCaJY4P01oQd6L85mpekhJczkbQjO8qcrao
	 Alr40bTuLeOQyGZIyZSv89QJ7krRUI6s8zrgB23/0WJLsHmhQD2jv6g2yMf6ZQ+V4VxHu
	 0IQbuVpaB1uAhyTR35xx8+olYsrLKqlDVv4CYWo93mk9yAi+PiLRZ01zlvfs97o+mAgGO
	 Ahk+8YL0NJVL41JbWxIE6CxHGz6vjmzGoPjvTY/TDTYtjUebHKoBrkVkVzV1QisBNjQ4E
	 owVoVXquyrQ2hP0IvwXL9Lvw0dd/KdUR/JDELtW4CSkJnEOA+x+vOIi9GQWUvuyO0ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795867093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SjPI7Jbk9ZW+2UhHnHYD7+GabroYFcfZRUftjzGrH3U=;
	b=CtJTnK+RAm4IXoTkW0akX0estvZkcFsfosFXRoYpWkLnW9sbw8hJAQEC+d3xBqem3q7V
	 z+teQmYRZQ64wa2MPccjEpwXCpWl1ICK/tTeYAKg2C6myKx8OJ+iIo1PQkej/H7iHj8xG
	 F7bu9TNthErqX5aU84prkO+5RZfpyzPEcENxVtB0mYh6HWkQkqR/C0N8L+tq7hsV6Wano
	 4/z866yKnB2wrE4wZuL8GDfthE/wUBHpmHuwgtg6mzGZ7meYoLQ9SZtRV5az7w58Sgs7H
	 bMkcAVpsk9XtHeYK6qdluVvkv5m4J8cYlBZO6po5UtZMd00SHQvu2U/EvwuUtpnC1ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEHsMOgF;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5F7606A332
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B5F7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEHsMOgF
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso82618775e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795867091; x=1796471891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SjPI7Jbk9ZW+2UhHnHYD7+GabroYFcfZRUftjzGrH3U=;
        b=oEHsMOgF2CsvvJKAvBZxSurRYX7O5jWliShMLdEHmE7x02l0YY23OjRtmSqwo1EpuS
         Y3QXLp+7LZjeWdYhbjnAGp+W6/2i/7Xj7ovV/dF3g0tlxVh9FEeHHpom0giUNGfBXkMo
         K4cSrQQfvFY+VaS0XdpnYfsWqWDYw4pqPZ6vdv+U5WqJCbcZA7pYbCZO87M+tJBDZX4m
         J/OyDPx377MZ0GhDjlP48AyWPZuOu/dQDhoUEAhkTQjjjkidTjGOZ3qUgdetETGV7v5M
         nKN5w2alyG7/YF4L3niAw7Kw8ghhL9gjQ/U0TpqWq6IL/LGgKALeInJsoYB/bsLngR29
         AxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795867091; x=1796471891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SjPI7Jbk9ZW+2UhHnHYD7+GabroYFcfZRUftjzGrH3U=;
        b=BJfANaVqySekuCeaeXehUSQ5LY7hxZ+5dR9Jzk1+gtyaoeBfkyf2/76RhMlDSv+uG1
         9ydyTOZZ4wdZYi1PrqV0q+wOVT1F0drKVPPEmlTWAdXzFFO82rOE+OdUnF7MTZVTJ4jj
         w0p0WhN6A6dp4MbeV2XhT52E6KLt01ZXkUytxitm7Vng36WpOo3aUrDYijA6GsoMrjsk
         pBd+JSP9pVNMMhuHHhCqQiNVKjVogcVdK8PAeTRpYh+edqcifBschKS8yM6ApXNGS/Gd
         1jj/vS1xol+61Sik60Lo2Vlc9Txe4Z8moGPULysNNEzDXF+zbl27MnjUkPc9gWDEr0oW
         HWGQ==
X-Forwarded-Encrypted: i=1; AL+hErHsSQY421dXqhDXNUXyRmGP6vtZoF7zWImZ2Bzi2fvGAYKX5QbMWEGXgns39T5F7M6MRjQZVqf2SqodzaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+re2YOJ5h/d0S1Ls+x6iO/sAfDm6lBrCrxaSl5LAzTa5wjPP6Z
	XLyzeg/v9HR7/Y9NIfyj0EgXFmi2WKPcHUuhXADWEUFpzrX+yqx8PzaVig/xnA==
X-Gm-Gg: AZFdTZfrT/UzgvYuEUVtH6T9cD94if3zXJBCjCMx8pQKDEfjKr3X2XamP9SZ9fdZbin
	Bm/6smThoWNr9dz2in8K+YGSLnjCfICMoGmRsK7J2LQ1LwApSdzgi9nw96hrmK7wT3frdLYkUhw
	AnM9FK9cFCFsOZ34dYkFRVwAbRF27Mtw4vHEt011sadWz+udvShfKCzHfIsxf1I+VZPpfCD1iaD
	46iCkOCoci4px6WoVV8HsJQK6AZJ9Sx20YrBW33BHhWW28SVdZB/6gAiMfl58mEgMj4HY/KW4Cv
	q/hLWr5H0gRX0ddzEAG+cM8o1NKWnDkY8f1WzBqv7rzXXRA9DRGsNYPVsnF0reCuwGdmP1PSa3M
	keLAQ09Sd298r5q//HZ6gMnYLS0pRFyDJG7LdkpCyUdPKuXLpMe6bHvxmWaEl9QBE+aAy7C5kEB
	/rkEyAohsheIUgn6INwBLis4SOQxCLVc3ySq5m5TBcoX+/k7vn7c6isZs9Lt2eNl3129o4J/7tn
	I+29GAmBvc1IJy6dcuYFfTdgyyVr20DaGHQnrcUjj3iPs5iZPPxkp1zUhfaPl30iKQNmZLb8s2p
	MEf/vmQtHfWAZzg5iZ2mzslYkXT1e87RVzC7csjlBXPPUjZ4MKiQyxfB4OaGwpvaZOgY14PGJSX
	XWGDoA2xW6Gz4/kZqw2UJWhb3SSr6I58rvcPSNHlP7m+CzoLKVK759LhGkJqHXjv3pDBUXp3WzH
	IsGv/fRnwqQ/jQS370UfV8R/N3Tsz0aDPyNjvYxag1x589XyrtEmRauPG7HMSRNrsCd4YcZhhJR
	dEcyDgOJ6vlwQtW1A==
X-Received: by 2002:a05:600c:5306:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4bb887c9af4mr523131755e9.4.1795867091555;
        Sat, 28 Nov 2026 03:58:11 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-510b-18d1-bc36-7cc9.rev.sfr.net. [2a02:8434:fda5:4201:510b:18d1:bc36:7cc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm832768435e9.14.2026.11.28.03.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:58:11 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] tools/bootconfig: Export tracing state without the function graph tracer
Date: Sat, 28 Nov 2026 12:57:57 +0100
Message-ID: <e8de5737f07a1cfee7f8530b82cfeed3e963ce21.1795867077.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795867077.git.edumucelli@gmail.com>
References: <cover.1795867077.git.edumucelli@gmail.com>
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

The function graph tracer provides max_graph_depth. With that tracer
omitted, the unconditional read fails under set -e, and ftrace2bconf
exits before exporting any ordinary tracing state.

Read the depth only when tracefs provides it. Check each available
function graph filter file and keep the existing warning when an
expanded filter list is present.

Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootconfig from ftrace")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
 tools/bootconfig/scripts/ftrace2bconf.sh | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index b685dd6b070b0c..de571ec11b4392 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -45,14 +45,20 @@ emit_kv() { # key =|+= value
 }
 
 global_options() {
-	val=`cat $TRACEFS/max_graph_depth`
-	[ $val != 0 ] && emit_kv kernel.ftrace_graph_max_depth = $val
-	if grep -qv "^#" $TRACEFS/set_graph_function $TRACEFS/set_graph_notrace ; then
+	if [ -f "$TRACEFS/max_graph_depth" ]; then
+		val=$(cat "$TRACEFS/max_graph_depth")
+		[ "$val" != 0 ] && emit_kv kernel.ftrace_graph_max_depth = "$val"
+	fi
+	for filter in "$TRACEFS/set_graph_function" "$TRACEFS/set_graph_notrace"; do
+		if [ ! -f "$filter" ] || ! grep -qv "^#" "$filter"; then
+			continue
+		fi
 		cat 1>&2 << EOF
 # WARN: Cannot export kernel.ftrace_graph_filter and kernel.ftrace_graph_notrace.
 # Only the expanded function list is available.
 EOF
-	fi
+		break
+	done
 }
 
 kprobe_event_options() {
-- 
2.53.0

