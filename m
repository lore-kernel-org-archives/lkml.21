Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795867091;
	b=IyIsomPr1U4feCFgXWlmGVwUxlZok147F81Fe8MR8rWAyQGSguqYlBkAxrCRvjUf0pC3
	 vkWBP2zecmA5nvAPQ1BUknv5jn4wG1wh/CPOwhs4eJJBM2nWnuCkhKfKF/fBJPQXDFRTN
	 W2ARPdX3qxlox8FBGwNXQFlCl666RLs482zY/4Tw5w5ll58s2t0LtAHYrp4MtORieOh3W
	 lYUbxH8CwpaeZXSfV/SpHQgnSQjREciZAfITZPLEmhvMuUezihA6lYczhNhqVZB7gZQjh
	 rYnXGZ3Dl223XcIylAQA5oS/EUcGw118dyCEGATHJGDRPd5Gd7CqHf1Eqaa8WIyct6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795867091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FpvACcdQhl/atTKv4DKgCKM1m8xmn7nYqbBKYCKvCEU=;
	b=luVz6Lyqi/s7OVFEKIuulH7j0BzGSMy0v3cGGBI7MHkL5nL+gtPf7kHIQnPHhlC7JVgy
	 BwM3N35p1nuzuiPM1PMYNiPl+eT/XDl9ihczEJ+drXCgya8V2hZIQM2cWRs01/U1Kqy07
	 +5SIQ2vsjg1JMtNXdQneOwuqcvT4d5WFZsonvEPYxlp1HEiRm+Y2I0F9tt8fKe3BeNP9Z
	 KUsRBBctvFYQQVfaPMogZA97R8g7VRXe6Ic378L03kSkxSSqDuE5p3ySClSskBkrKdQ74
	 TtUmfqh/lPlJzO/1K3jZ52W22beqg+fkG8lxQq0MjAAVCuPUZAUFWyOe4QjZsi4s0OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="n/31V05L";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F58606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F58606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n/31V05L
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso89851805e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795867090; x=1796471890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpvACcdQhl/atTKv4DKgCKM1m8xmn7nYqbBKYCKvCEU=;
        b=n/31V05L2uonUlkRiy9GlceLTa7exdqDAIw6icIAVYpcchhzJT3Iv/qTBOIRfGtwE4
         zHR12YeRo/y4QuLqYC0z50eyUwCFavT+Bg3wCwBQhk0bNH+wO/VxLZDMn7HG6rUd209D
         JJyw7szt/O62JBBCvrwpMds/9OGeXFva/mp7UJfQDqc+O727u2gveS7v+GA8zoCiyd2d
         ADvobh7ZT5uKfH1ErqLQlDhqnL9xsjzti7XvTpJnrvDogLn0mkLXMNMypI1Fu2ZrbYTK
         lGs7+SbxXdOFmjpZ8xLJbOJOB5bqm6NV/hehomPzoU6/5zCNTVQlkIiKbPZDrnGopcUO
         5HqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795867090; x=1796471890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpvACcdQhl/atTKv4DKgCKM1m8xmn7nYqbBKYCKvCEU=;
        b=xMLsbF2BSKvC7rCvCgwGq31TX0zmz1SxnpgePY9ZoWypXnjMgdRpMhO2RllcjXq2Pc
         z2HSc1Hv30w1lVgPC91j8OLWFJeNqZR0SPjPHbry8ARdkIgQJ9Unv7vFc3cM21vs4bNH
         UvbbLffN5iaTUud3VUZedKG2EPRjw8yHQ/dxzyEEqZPqbqxmvAsmcxnd7P3VdVX9gJ1x
         9jWL36o5kW+khWSBwa+7vHZLJn1WV79H08p/hro0rrMoo4dJGC6ZptLutXy8UKMZpGLJ
         5OssBBREbWN4ozQ2o26um5bLq0t7otWXKon3PJxeDE4+R5YB4xfu98ZxGcAJWXpMocAd
         CJYQ==
X-Forwarded-Encrypted: i=1; AL+hErETqA7Gjiwe+qpyfwKnMVgNrqkPaMVWydt2r25gHVgAIgx3j+SFGzViZo+/ZiGZQgn0aS2IrpAflSdrR64=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+Md9QuWZoDorpcGJV3pS54iXCd5IDYFGrIp98UNe60SMgHMGr
	d9AxH62x8IW1u2IIKWAJxtrXW3Sbr2CMje+09qcqgZsuuieYQnP9gT7R
X-Gm-Gg: AZFdTZcfCbqergbk4ITPUrIMXguKIStZfx9gWWH61tIxeJvraUkeLTkjE3FnibnayEL
	At5zjDo+3ZvlHAOQOaGNDxVZgWBH71u12Mry9z7UTt5inblMJkvp9Un0Aq1W96NFkcYHpFg4tGn
	3bduiiKy75vZwDuDKED6FF55vATjFw3XwKc9i8hsQanW3jQqEcpjY4MK/aFCFzv6olb+M+eKO4L
	GQi3rQnMENI1Q4vWb/9/Mmk4s478Wv/50ivL+DR2bwMFt/NHT+Cgf7wPdUUYXpWvBZBGiCPWa7z
	zhytGA6tG8B4FtRwy2Six6R0uvz9qCpwNzLcacF/LeX+KBdr6/c1Y2GtZ0ZV86T8+8dLYuOTayQ
	3+qNY7dUfUIXOJv4sXBTds4x7ThQvp3emNEn7QvK5NhbvTPwbc53qmQycovI6Cs3SlGjUG6CSOV
	AcMin/i1emzINWSlLUkJvf0K0b8zP/LAi2AlCJkC+0qFOdnbOtTSpH71fzrBLoQzm5nhGjYbpfb
	TOZh5AQi4weVVitoF9+zNXl3OskvcWJBFrG0LUCzoRbcRN6lfu4Sw9Or1Lh97Ai/MDxUfAniyjg
	9NUrykBYfdrVjwkaBm7s/Vj8+sK+5WJloiBgITh823Tj06C9pEOa11A+ebpaC3ehZ44igVazrbg
	J14TBVER7WAGIUxX0nMWmHilpj2DelolW89MXyRrUud6LT6WYOS+sVT4aA34DT4q6OaQpKmWYF6
	lwob7OhQX8clgtEqam1AySP/yLDFCyb+bToulN9B3of02KDGwz5JLEKACgk0N0NETmIxf5Y4hoP
	vkJsIfqzvz+0+yxsQ==
X-Received: by 2002:a05:600c:4504:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb888284d7mr574263115e9.31.1795867089785;
        Sat, 28 Nov 2026 03:58:09 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-510b-18d1-bc36-7cc9.rev.sfr.net. [2a02:8434:fda5:4201:510b:18d1:bc36:7cc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm832768435e9.14.2026.11.28.03.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:58:09 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] tools/bootconfig: Preserve event enable state when retrying histograms
Date: Sat, 28 Nov 2026 12:57:56 +0100
Message-ID: <eeeed6cb5248903e64f6be45de79ceb3c7f7909e.1795867077.git.edumucelli@gmail.com>
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

An event with a histogram dependency is exported after the main group
walk. On retry, GROUP_ENABLED still describes the last group in that
walk. If the last group is fully enabled, an enabled event in a mixed
group can lose its individual enable setting.

Look up the group enable state for the event being retried. Still
suppress the individual setting when all events are enabled globally or
the retried event's group is fully enabled.

Fixes: 1eaad3ac3f39 ("tools/bootconfig: Use per-group/all enable option in ftrace2bconf script")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
 tools/bootconfig/scripts/ftrace2bconf.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index f62372adbfd598..b685dd6b070b0c 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -135,6 +135,11 @@ retry_unresolved() {
 	for evdir in $unresolved; do
 		event=${evdir##*/}
 		group=${evdir%/*}; group=${group##*/}
+		GROUP_ENABLED=$ALL_ENABLED
+		if [ "$ALL_ENABLED" -eq 0 ] &&
+		   event_is_enabled "$INSTANCE/events/$group/enable"; then
+			GROUP_ENABLED=1
+		fi
 		per_event_options $evdir
 	done
 }
-- 
2.53.0

