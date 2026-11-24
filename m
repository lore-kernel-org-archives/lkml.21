Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534181;
	b=FTIYHPdVO1YiZkVYITckByZo19dVvLOhvrhlRGiQaeZD8GOSyISt92i3prExW/BFYge8
	 RiCa/AuIkR+2ifcISuE7nkV/VoCmW/E+b4HL3GH4qhuUaulQfnrn8Nu1Nmr6XUvFp2QfF
	 BkVwiMXwk4Lzj+5u6FxcaUXVLS8/ptbb1cns0Yp+ea6Z8nI2x9wghnUIefKN3HJJM6N/W
	 r/0/TwRuY59C4D2uPBlEpla2wwpyTpmTtdUNgQq2iS611kh4va6RwN+s/bPoq06G4VZrP
	 KlRQSsADBthPklzFgPCrU7DymCWK7pVHn69uJ01IoKnLFWPUsu7/CMdILp2LTmJoUrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=4shb1Ndfu8EixOk7dCitq9WilHiHcXcrJsI5cwhdyGE=;
	b=cT7Pig5OmxAyg1XG3cVyshwngjnqHmcr+Dr4jzPV66awTeNwud4t+nRu+gI176FmzdPw
	 JajC8QrS5AwUni0pHQqLzG+wSCcQUDuMzPVF6I/FufGdjH2BzbbNL64yF6Hb7kDekGAu0
	 0HOLJ3APeODYkHZ9S44G6gyOF0LwiGfNDRHhWuglvH92cGy2VMh5VS0sd2uRnzhqdxgLV
	 gX1MJlLyuMEApj+RTOSfYE7K1PxBVS0b4EBz/qqwk5DhxpjcSwW6/L/ATEAaXuocVujEo
	 UjXxKLP9QVI2uHAH6JYUBopzreXfvOfYIMW8aI9VvC/d/DkIs/mLB5yYlo87r0uk1jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ADyFfeEz;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A05606A6B0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84A05606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ADyFfeEz
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49953abe51fso32794965e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534180; x=1796138980; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4shb1Ndfu8EixOk7dCitq9WilHiHcXcrJsI5cwhdyGE=;
        b=ADyFfeEzpBTPX9ZcPWVKZC3BWC/xoeP3c4HnIhmlUX0BAY7umvak/dLtuCR5f7B0bB
         nhtpWz0KkfDyV3cEYUsve7fnWdEsqnznLVNsFAZk7PxVWMWXH0rpQilDQSlgtK7tKf7r
         cr0NqZ5opGvquxWpHVbEdAOzVNbV8RsAqbYaMFFh65AblBRZQVS4Ux6YjeKJj96dfF9H
         Fyje/zCg2H1HCqIBu1OR6pAySBHyD4pdLLrMytaiCzPn6lLyFsFBXxBiOpZF4qHBDl1A
         ggfxLJAxFtLBIsj+7r5npfYjLGXGBisTu1SxGcSInPcUFPkXIGgqu86jx7G6MSYFGb4x
         fzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534180; x=1796138980;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4shb1Ndfu8EixOk7dCitq9WilHiHcXcrJsI5cwhdyGE=;
        b=fgOM8qNzoBkSZWTWoOQ8LsnvtCZxqYIid05gz4PJLlh1i5BM/MXynL5cVxilLhLuK1
         V4cT+AIbVTwhjk5UPE7+FMXwl+MSXI8+gFUV4R3hC2s6ojgSVlmidS8KwWWh9Tr3xWph
         pBvBqMMVqWerMKxzdxlD3rjNanM4xEogzIOTWlKLgFrhXbPPt6HXVCMoSez9WOMJopLO
         NPX8MtKJNIPKEwgc5qXaHuPhM51bA9FA0FVyCc6E8tPx0juAsfrvmZP5IS/iP4+r2TmZ
         whAg/Lu4cr2xThnSFT8/PoSlIceydW6+7OYmGgPxuLFxeJdukDhwCiNeDpq4sWQldXME
         RXyg==
X-Forwarded-Encrypted: i=1; AL+hErGBlq+05QlDEXt7k3dR+bmWDgqHUBsRReNRgrf0FkRjtefm02aU6gft0+7CxeGm4Z7rmQkfqoowDa3m/yM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zYooIKJpJ1SMTtaLzAIcQ7npMG3+J/Xkfextu4EzYklkLJCdV
	+T899T+G6jNOmp9+3BZUajDBFpDgB0dJgKfPdOyKWahiziWb5Q6bx9lsOuHDy5TAJGkRmtE17pW
	WeN3aTiJZI9GrzSQ3LEOMXg==
X-Received: from wmbh27.prod.google.com ([2002:a05:600c:a11b:b0:4bb:6a03:8800])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6092:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4bb8892bb67mr285734815e9.19.1795534179788;
 Tue, 24 Nov 2026 07:29:39 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:45 +0000
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
Message-ID: <20261124152845.2233401-22-vdonnefort@google.com>
Subject: [PATCH v9 21/21] Documentation/kernel-parameters: Add trace_remote
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

The trace_remote parameter allows configuring a trace remote on
registration. The syntax is similar to trace_instance.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 .../admin-guide/kernel-parameters.txt         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941aec..d000bd5ed61f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7848,6 +7848,25 @@ Kernel parameters
 			See also Documentation/trace/ftrace.rst "trace options"
 			section.
 
+	trace_remote=[remote-info]
+			[FTRACE] Configure a trace remote instance at boot.
+			Format: <name>[^option1[^option2...]][,event1[,event2...]]
+
+			Supported options:
+
+			dump_on_panic   - Enable dumping the trace buffer on
+					  panic.
+			dmesg           - Redirect tracing output to dmesg.
+			buf_size=<size> - Set the trace buffer size (e.g. 2M).
+			poll=<ms>       - Set the trace remote polling interval
+					  in milliseconds.
+
+			Events are a comma-separated list of events to enable.
+			If events are specified, tracing is automatically enabled.
+
+			Multiple remotes can be configured by specifying this
+			parameter multiple times.
+
 	trace_trigger=[trigger-list]
 			[FTRACE] Add an event trigger on specific events.
 			Set a trigger on top of a specific event, with an optional
-- 
2.56.1.809.ga0b61035b5-goog

