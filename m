Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795356637;
	b=cuv82duCawUThWn83SjRlGGe3CKNp+xuApkHkr1r/5LBa0kq5KPfd9tTue3uyvFyeE7/
	 gQTi0FW6KyUd5EvFqnyWQk41I5kD2RoWOZIt5rJGR2TUe0sweR4dKFCGAs3wcj1wzKCtN
	 kdZb2RMx1n+BEksUVTexwS/hXYvr1MDy92006J7uLbmfGCO1q99k2oDdKycKRal97EHDX
	 +S3QjP6Z4Fnd6Zpr4rWLC1+BLgQbV6SSzwZCQSH9d0YNfCO8ranS5ZzprSM8L++65t0MC
	 QhrC3IcRCIa14tEd4XPGApDXIykdBjZgkXx2l4t3o2Ti+ibG6tj5+ZpJpdDeXC7Poww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795356637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G2t3hxnV5uVy/7NIAyuXsI6XhgVjpyjdFNofy9ee7Uc=;
	b=t+re/RfoaCTANZveHFEIomXrtMn9prqSM8kWUAk2O1n5ftNCC6Z8S+UA0mBGaiS2pHQH
	 sdqFniscz7xvEhMGclsziwoS1Q7YBfFB7xbizq9QuUxH1EeU5VmsZxe/z/bPeb5uAbZkY
	 DL8jg5v3Ids2ztqLnFW56DHHD448dFK7f7FquTaXMExurALa9FiJB5ZuShSfK5uVRHHXJ
	 lybzDQZgv1nhq17WmV1a7GfxBJErjfF2CkcLnuBiB+WnyZ8rXgkxjzLvlvVF1Fos2NWp2
	 WVpBtPAFNExrGgwT+TVt75YpdhbEHtxStGKtdqUtwQPF8wYvEXaMadI2Yr9Tsk6A/OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkk1t2V9;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE3E606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EE3E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkk1t2V9
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491846221ffso1986314f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795356635; x=1795961435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2t3hxnV5uVy/7NIAyuXsI6XhgVjpyjdFNofy9ee7Uc=;
        b=fkk1t2V9Erpsz7v+sqd/JEeADrGC0TCv7P9P5QuI4HlobXL3O/Y789uxXBOSnAw+Xn
         464D2fnMU782wbYC6AOR6cpMk5+9qsaPCMTBEZjofxgPJ42BJCbYY4oZBNW5AKZzvhKm
         YqXs3MVYIpjutpTdCBhuGq+r9q9/H//RVDLjN5gzX1C6vRP0ErhaI/5JSRD70EMP844f
         4cxMGZH0bueGw7vQnmH7CwHg9jQpvdiUL10NpH8YdbrMykgM7RSVqIBewGqGTRqsIunB
         molkHf0PsOYJvLqLWnC3MAtoHXBYEdBdWxIUsIx7h+CBeKa1cJLYWfxSZvUBEc+UtV0k
         PNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795356635; x=1795961435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2t3hxnV5uVy/7NIAyuXsI6XhgVjpyjdFNofy9ee7Uc=;
        b=vzCOuV2gUwQ1gnfAHaYD4mBZiK1VQKSoxm7MWox1Jx8aPzQ57kzsn+DmA/ZBUAtwDc
         a+Yjasl8hmH9OkaqKDMHMBAfYiwI8lXkXstm4yipUudiNqD2/ZBtyYP6ZuA+xiL6Fyog
         L6m0nfLwgmpIv/tWgnVfqRsy737MLcrNWsIIQ9P7mlwoKUEwETaltFtyWkh5ftfWlTQL
         ZOaCK/icj3AVueunWmPS2gfm0DbV4HHAtPojAP0SAn+Nf7XBqkXP8KWskoKwlibvAM57
         0v54lKpfH63BFbXc64azej0rzCB+5gj1YUDHb2EZDVVCcj4KLYDvFA1C+JjbUHFAvZQp
         BHbQ==
X-Forwarded-Encrypted: i=1; AL+hErFyNeyNJoEZB8Omj+THeHo3uEX0yAtcUMXuXt3BvyBwF/LBqDZzDjZdLgQJ8zg6uu8MFtfB64WWxDfVZa0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RQG0d7JXoVC/4TSa8mcZeCTrpHo2u529QuauZzwe2fPGL91Vb
	ezthMokd2/RQn/4Dwc+o+U/yEhXjm0gzLPiU/0i8Hf1aEkfA4HYdo16eERnfCw==
X-Gm-Gg: AZFdTZf2n0hQ3mQknMdqZ9YeFw+xn7Bat9zFjVtiJNzUAwrh4EUwaJTqtxSzlHRYPjS
	SaoqIslhARZ+cw4ExkYhbR9ZUn6jnbxIJgjSptmLo7ibW+iRHwU5IZHsLCbD5tKprH8rnyvbiUK
	dz2ybSwdSdFmEK71GUYgqhCrhVixexQFEsVaXi1hLZ/oQxDfLtSr9Op/++kAzBzcCtPQU5pGyAX
	vurGrLTHyO6sgPGJDCyAFEs+bp5J4NIZvYfv877vEI43dpPaHs8pwR7WAEt5cFvdKkIsZJGkFR0
	iGZiOGXah0/vBe6ADfVNuwdiqk8JRcNVEq0SeYpCs+FyPogyjO+Qkxwh6K6x6wE1bzSx28GsELF
	eUAYOCVPOnlOG9gHZ4ZsjYxOxiJxkZtvf6HUCu+vTzmQd/64BxFtcTrNkGAzWZTDvhj9wu8HTj9
	GNHH8z4qZvGT3K4QFqjUY2MHrhf2lvz61BoZNuKMmTAME0oFUnTfmACDxK+3c4F0a718SqXRmFe
	qlKutjUuWor1/EuAY86OtSLC9UhHi5SHMyx7tc+4b05Od8wj4n6Xuie2cnMQ+CnCgcGauksUIJR
	+JNw+7SCaDKyJFmLOawd5C5926wcYT5EHdbVF4DhOtxELMdwUuc/YtukImgIVmJmCXyfb2ZvIvI
	aV19nB9pslGwNKWfDJTRceVicbRN7iLXOJ/m+OhiKNyTJkHrVuufMEFRpLf12VCcD8t+QzJQv8A
	hVZ72BwispEphgUKWGODve+XCfYTm1Eeeql0HEd4/51uPzd8FxZ9vIGM8s7TyI+y//gL0hgXWRz
	NLYaKye37xtngz7jA==
X-Received: by 2002:a05:6000:1a8b:b0:48d:ed0a:e064 with SMTP id ffacd0b85a97d-4abb27274dcmr17739295f8f.24.1795356635492;
        Sun, 22 Nov 2026 06:10:35 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-2025-a95f-1d53-595d.rev.sfr.net. [2a02:8434:fda5:4201:2025:a95f:1d53:595d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm17242835f8f.48.2026.11.22.06.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:10:35 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] tools/bootconfig: Reset the tracing CPU mask with --init
Date: Sun, 22 Nov 2026 15:10:24 +0100
Message-ID: <71818e9f5a5925054b04bee1a58b63c43ff02361.1795356623.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <undine-1795340207193471810-f6280e0e64aa2f7f@undined.local>
References: <undine-1795340207193471810-f6280e0e64aa2f7f@undined.local>
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

bconf2ftrace.sh --init resets tracing before replay but leaves the old
CPU mask in place. Replaying a configuration without a cpumask can then
keep CPUs excluded by an earlier session.

Read the initial mask from a temporary trace instance and restore it
during initialization. The mask comes from the replay machine. An
explicit cpumask in the configuration is applied after the reset.

Fixes: 5675fd4ef51f ("tools/bootconfig: Add --init option for bconf2ftrace.sh")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
Hi Masami,

Thanks for pointing out the portability issue. I moved the reset to
--init. It reads the default mask from a fresh trace instance, so the
replay uses the CPU mask of the machine it runs on.

I checked --init and --apply with a tracefs fixture, including a
multiword mask and an explicit mask in the input config.

Thanks,
Eduardo

Changes in v2
- Reset the CPU mask in initialize_ftrace() and preserve exporter behavior.
- Restore the replay machine's default before applying config values.

 tools/bootconfig/scripts/bconf2ftrace.sh |  2 +-
 tools/bootconfig/scripts/ftrace.sh       | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/tools/bootconfig/scripts/bconf2ftrace.sh b/tools/bootconfig/scripts/bconf2ftrace.sh
index 6a3535a2c..f105c7433 100755
--- a/tools/bootconfig/scripts/bconf2ftrace.sh
+++ b/tools/bootconfig/scripts/bconf2ftrace.sh
@@ -64,7 +64,7 @@ fi
 
 if [ x"$INIT" != x ]; then
 	. `dirname $0`/ftrace.sh
-	(cd $TRACEFS; initialize_ftrace)
+	(cd "$TRACEFS" && initialize_ftrace) || exit 1
 fi
 
 . `dirname $0`/xbc.sh
diff --git a/tools/bootconfig/scripts/ftrace.sh b/tools/bootconfig/scripts/ftrace.sh
index c2b993f8e..cf3b5b72e 100644
--- a/tools/bootconfig/scripts/ftrace.sh
+++ b/tools/bootconfig/scripts/ftrace.sh
@@ -86,10 +86,19 @@ clear_synthetic_events() { # reset all current synthetic events
     done
 }
 
+default_tracing_cpumask() (
+    # A new trace instance starts with all CPUs enabled in its mask.
+    instance=$(mktemp -d instances/bootconfig-XXXXXX) || exit 1
+    trap 'rmdir "$instance" || exit 1' EXIT
+    trap 'exit 1' HUP INT TERM
+    cat "$instance/tracing_cpumask"
+)
+
 initialize_ftrace() { # Reset ftrace to initial-state
 # As the initial state, ftrace will be set to nop tracer,
 # no events, no triggers, no filters, no function filters,
-# no probes, and tracing on.
+# no probes, all CPUs, and tracing on.
+    default_mask=$(default_tracing_cpumask) || return 1
     disable_tracing
     reset_tracer
     reset_trigger
@@ -106,5 +115,9 @@ initialize_ftrace() { # Reset ftrace to initial-state
     [ -f synthetic_events ] && echo > synthetic_events
     [ -f snapshot ] && echo 0 > snapshot
     clear_trace
+    if ! printf '%s\n' "$default_mask" > tracing_cpumask; then
+        enable_tracing
+        return 1
+    fi
     enable_tracing
 }

base-commit: 0ad31c3252d4c626a93ae6251340ef86b18342d0
-- 
2.53.0

