Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972405;
	b=2VGsdfhfh6Rwy5w+LNMGJWYHKk26niRLxNWnho4kkYasDij9w9KNwVJtFKsGamcqlpkR
	 dOb8YFUqgqjjDuQUEdxILUu4qNu7/9CII/3epd6r+zi9Z6WF8k/PygqcHPr8VprukS+LP
	 Ee5LUaKQ77VvFXoE/86sbFpgJWVaTQKdpAL4yu7762qG2k9oLPBBv+F/l0oBonhr2O4ai
	 UmhPjhmBXa+R3d7JT4G2jEJVbvSpKw2hp7BLf1xP2IDTzfKwABPS9M+QeyuZGbcEVQ/m6
	 ig9fFwS+VLC6ej1e6Rj0awPGCnlHNVzP1JvNUkDwVuOYbWDYxxDBSJvy1WbmWTEqm3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jazbHSOeO1s+D04SmCfdJ3dJxyMlyxBweqHPXFLi7uA=;
	b=0NWn2G7as15iutUJPt57Wdqyh8aN9wK3wHfBaINTZHFYdzMIDhb+rcNwrLRMdX9ZA7N5
	 q34hsNhqPBi0lMCrMBcEouJHhpkiUNJqLZPef+lmLONIJwNnQKTC60u16b87D4yrbJeRU
	 jCpfAKeB3G3ftL8i4GqDrSkDsu26BkE4Sgnc5vw0WhTKm22ZbOtyd3OUWIp1RyvLW9X5u
	 IlA11VCEqLtfemJ//DuuMOf+aufEXG1tWRHMRhV+SPg9ggc12j6CGkHCpkJowFICObjX2
	 efGxUT+0RV0BtQy7y0dR8Rz/1UALqsLOeiQD/CwdMXMyBNW78Tp5D2WehBbbmSPigWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fBTihxqQ;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D70C606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D70C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fBTihxqQ
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-94961d90b79so74217685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794972404; x=1795577204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jazbHSOeO1s+D04SmCfdJ3dJxyMlyxBweqHPXFLi7uA=;
        b=fBTihxqQSgl80uiOYL9+huHNub7fATEQrkP631o5o5MD6dzR7LeeFyOfgtNzl0iDG/
         LEThSq3RSRInaRjJRANhxsdGQZNlsh4+zWHW5V1tsXAZGYexA0Z2EJUXpfVl9ZWX9BPi
         pq4cPE6+q7QgvYaCukS+LUOGX729vKimMVdjbf4Tv/OJ3eie7iv9RywhaiHgYZzB0e1f
         tK9bZAiUA+bBUORFt7M/Vx7kh2FTHXv9Y22jKk1fAMYfCtOOtcMwLkAtoUP73pRiAmx+
         aYZJt8ujHUBTDHTDNLx20lAaWNvWGMBYecW9JTaJDu3PyhlbplTS8KA38HiadqEIvNod
         WAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972404; x=1795577204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jazbHSOeO1s+D04SmCfdJ3dJxyMlyxBweqHPXFLi7uA=;
        b=TbfqfEMkpTF41Voir9sOUj+RJAFZnVAre6YzVilY5XsYqhOcAHCbPRkvnnRvSO6gEd
         9ozvDjlIMLEPdPAWXeeQd2RzOwXXkuDbPnAdR+PPIFdEk9+wv/y9PEKAkeU1X2TZotih
         VUyYZxZp8US0A7Ix/Q1BxllGovlKtkuwjAf2aDfLJJj9hQDEoeMgiqMy9E587vwcAePk
         9dC9OBwnOWTiUt8hV7OGOKejSYX6YnXTOfp93Jtpe6q39nYBx6llKodYwaa/CqKx086/
         8LB3/xvuSsI/+6wjM+2MtRigkzc0EalGCkPJmwE3KTIT86kbU7B8igVxIwzUnXpfHx+w
         ycug==
X-Forwarded-Encrypted: i=1; AL+hErGmpgF4RrObAOXTTMWYz7GFrpRGK3yEx5kMDuZGLuw9K+SUPNlfx9sfW2Bzwr6Kgv06p1JqQLYqFyt2KM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zXH1keV0crWjm+PdnMDKBZdy9S9fUDdRphdesAR0Dc2oXotP5
	X9/7+h+IYAbuP4r9c3u4ObxUu2vbUne1g0bpny57ivS1sem+iRJ+e5DG
X-Gm-Gg: AYBFou1pKi6xeNbWUChHAO9P6E8Q+1HEE+Oif2EREt0qfCo9suWuORLN8czZmy3kp/0
	du9vNPHEBPP+Y7R+msX/ttrWoZJgNgLSxxIatuGlz6TgfN1TK580zq1ZFzfoej8Lb6UUs3EYfFT
	6aOxGSpGstLiz7HOUTGe5IB7kBDfDSwwK7RUo2/eyfUGnx6vmwpoxqPtuKbmcHiy3SXAbOtYWOQ
	IEQNnKgOq3BWmw7nYsHzVG6vtWGK6iyER1n7pn72mub2fpFohYooqo+QPIS/FlfpPElDY+0jYFV
	07F+etOSWBEIIh11B3BaCwgrXQhYOnv/AEU4QGkakYDiws70hNPnkarE0pBzslm9mWumPzcM/Vz
	BoLm8WyO6NiJR3hoAoDafyoqLq41dX9Qx5s9aZnVD5oBU5f9zHuUjAsBbrlH3acOehVyHs8RXea
	Ebwz56kCWS3AjmtoarmyzLkhXlrKzX8zyhLnLIClQ1FsUAePwNyaqhxP11TvSYhbAOOQX3pL/bs
	5So++SgXfsjQWcewYohn9xPYtH+zO2OWi8Kt9LK0CBzsVy1VRz09R3+S67FiRhpgBmUinHwpMmn
	ylb1IgvusREe8N1LxXuvz8Nv7c8HDFZzUyPBirW+Xftv5FjCGNFs+sEMnxVwoKGdBIw32c5f3fE
	EciMik8rILo1F5dVWezdxSpHE+gGlYtX0NgBRZyCIgFEnQtT+M2ZrUepGRywfhy2f99ucKNkE
X-Received: by 2002:a05:620a:4805:b0:947:7f5e:2b63 with SMTP id af79cd13be357-949995b0531mr300152385a.34.1794972404029;
        Tue, 17 Nov 2026 19:26:44 -0800 (PST)
Received: from localhost.localdomain (c-107-3-155-154.hsd1.ca.comcast.net. [107.3.155.154])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b75dd62sm79267485a.21.2026.11.17.19.26.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 19:26:43 -0800 (PST)
From: Yifan Feng <evanfengff@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifan Feng <evanfengff@gmail.com>
Subject: [PATCH] ftrace: Do not WARN on a function probe glob that starts with '!'
Date: Tue, 17 Nov 2026 19:26:37 -0800
Message-Id: <20261118032637.80038-1-evanfengff@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
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

Removing a function probe with a second '!' in front of the glob
triggers a WARN_ON() in unregister_ftrace_function_probe_func():

  # echo '!!vfs_read:traceoff' >> set_ftrace_filter
  WARNING: kernel/trace/ftrace.c:5675 at unregister_ftrace_function_probe_func+0x662/0x870

The callback strips the first '!' and filter_parse_regex() then reports
the second one as a negated glob. This is plain bad input from user
space, so return -EINVAL without the warning.

Fixes: 23b4ff3aa479 ("ftrace: add traceon traceoff commands to enable/disable the buffers")
Signed-off-by: Yifan Feng <evanfengff@gmail.com>
---
Tested on v7.4-rc3 in QEMU: WARNING and taint before, -EINVAL only after.
Found and written with the help of an AI coding assistant.

 kernel/trace/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index c7d74b33d36d..04ea82a18601 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -5672,7 +5672,7 @@ unregister_ftrace_function_probe_func(char *glob, struct trace_array *tr,
 		func_g.len = strlen(func_g.search);
 
 		/* we do not support '!' for function probes */
-		if (WARN_ON(not))
+		if (not)
 			return -EINVAL;
 	}
 

base-commit: 7ccb044c27720d48175577080b851f047ddcfd1c
-- 
2.39.3 (Apple Git-146)

