Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795260755;
	b=k/Ef+Lv/fgAlgOX8SPOObwSkuJztdl0syt8dWdckf9HoMnA9dZT9HvcyxBx0Q8l9kuSH
	 WNAwTS3YCQDA06CpfNJi2LksZKP7sjU2OtbaNuBDx888Hf+Bh9vd6bl2bmR4QsRfzW98f
	 fsdi4xCGbnbVj1tRB+SFYTVyJGmFH88Hq46pFsmsB96Mm/ULf0A/DqFyAhuUTejw9j9Bb
	 IQz4T7r83Y7Fp8Gl00FkEBX06S7WYfssPZIHVS+7rBtroae1euVFfsygl5WnCKJAZY5/+
	 NA7axGXGxWcHwCNCYDMreNo4vvRvFE36xjidQ3jGeRl5WT26VH6TIj4pb77bFel/vNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8S5/KqNfuIt27SJJNZdfEe4DOCxa4rr3UivWTDl1Z8Y=;
	b=Zh+m/JE8Y0aANrnMpHvnNfW6ZKJs76uaKqIy3gm4sKht2jGNZtoJxUStPghOYJo59kis
	 NBfm9iBoGBLCfZk6U9gkaopE+3BRRI3X55XO3iEpmpYh8V+aICkFrxAtGlbYLdLiKpttd
	 VFW/6GS2WBmdLsdfLa0k+APgOUYv/+EHYItN7kIyNyRp5QxmTpv9NQjrDz6nT9ygMqWR+
	 SSZT+PCL/3I+DFJzLQulRoLzy+fLHRhDaCozTFuoXaSxTzpRzLf6r1mo4Y0NKpw1EVDVD
	 AhTa99g2+corFgEnd96+SqQyk4GwE2+Ac8A/SfrLn+SnvXZU+1btHtCtDPhxR6HWyTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PkUddhVr;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F421E606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F421E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PkUddhVr
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cddac941ed1so728633a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795260754; x=1795865554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8S5/KqNfuIt27SJJNZdfEe4DOCxa4rr3UivWTDl1Z8Y=;
        b=PkUddhVrl1K8nFVNaQ2QtEKIb42WmIKcT7K+GX5lkAdXBr3zwbFRb291hkVlXL65Ao
         Oo0CfwmA8DjRvJKGQB4ahTkPBUndK4CsLYsDSIf1FrNHynsNrhxZVk3qG45F744lB1tq
         mMnQw+hMZ8ytZmYS5syooPOWmabUwIPVxqmhQ+S6b2PKsRKuYff6VaTkrAGnvBLrUn2t
         bPjUIj8GDIPaRN9CRCHzSoPNqS2BzksOcNnL2ir6TOciivvo0ZmIyYPDU0q3Uy6OVqE3
         JadJO3tQdFUTnF1ppFGRPWnRpaidpoSZYW0+L5pFR+dr+ljh+WSUfx8HZL3JmSg7sv81
         lHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795260754; x=1795865554;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8S5/KqNfuIt27SJJNZdfEe4DOCxa4rr3UivWTDl1Z8Y=;
        b=ha82UuUsUlt/YYDUncZDVZvTcbRz3ZkkgYo3yylUPtPJN04q9FrhT3JEkVvQydfWXd
         sQ4PdwaQa7V+hUZx0A7MKkhSFXHNUTClhcBzCCTLivptX0OKOPu4pYYIS3nwLXzAUorS
         KUXIaxruSgnHtELqzyZjT13bdv4o0lXcQo2OYJzsbKWdamXNbV0goKI1H9pEq/hh5UaF
         3tY6ayckWqUEktC/nXFS6Us+qNt4ZohvM0P7b1/YBytiftCYsjt97JMoCwFqGrnIpQzU
         h0y2/FDZzB2iY+2EHeil9NVtLC9aeGW/WU0LVEpesx1cXyWloMGhc7JLo9HSzCEnzUoy
         QfYQ==
X-Forwarded-Encrypted: i=1; AL+hErHeosQXOv+Fwij2ZiRbI8kPatg+t2q+taP0QHHw8spBJT27bAEEKbpHWJxFyLv6Hs9OSB6NcO5tMHctq+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IkdKR7UAXv5lzo9ka1Az2DWcWHBD38W70aVMHHlxcLLLais5q
	0XugkKIrMJMoWk3/k9cgvxotUxBcO+hD7y6AqwQ1AmDh4e0sDB/cC8uSZn+KrQ==
X-Gm-Gg: AZFdTZcSFZJDD8xgFTQw/FjNK3JQwc+z9kv0dge4K6NPu0IfWbLwmtmSLWAMUhg/uoo
	iTS/WdmF6qT4J9yThcVFRLddRmZZf0sTWWL4WzMOBoyFyrH20kI2qzCk8OXL3r15VX7D0h1t9H1
	VW7UpQQBN2uqxR/7AcAYLMbZeiLSTuBdLx0S+xPWov6qiILB0iU+r9dkya7kdMO3osahpzH4h3b
	d49lM8c+pK1lGxYOWnJbX8G42scGqRyyos98ogz+NgOXMrmX3OZdokPAfgeJTfmosixLkwA5QPo
	5fRoFG58UM4zhHXQtNWtUH8z8OSPOOfQ7SPW3rd4gl15WC1EIrGWKUkuDMLfX4adK8OyXVcX5IM
	jN8iHCjnZbS8aPbA1ln282CpqDORqnGiJpNkWR75VHUoE7FAvL8/mh/0xfAFnETqWB4I838I61b
	eioPy5itUXOZAzlV2wdiWR0W2vWDkawDYU6RoeB8QfqzgR9lJwsvvXC9j/ESloUAPWwyWOprQ9o
	9QxA5mLEO9xRL2BPxiEbdhB79Xb10FdXMGNPMMR2k4ZVBF7jbPlLZYY+BW89jVRF8fhGUaLYY4J
	OtoQsv6ug8CQvfwXslj/ItjFvun0QjmKP7ERVz3ffaoXlw==
X-Received: by 2002:a17:90b:2cce:b0:3ac:a521:953 with SMTP id 98e67ed59e1d1-3b41c982ee6mr5452196a91.46.1795260754374;
        Sat, 21 Nov 2026 03:32:34 -0800 (PST)
Received: from [127.0.1.1] ([2408:840d:6830:46f1:7c60:7a01:9164:e1a0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm11340835a91.15.2026.11.21.03.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 03:32:33 -0800 (PST)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: linux-trace-kernel@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>, Tomas Glozar <tglozar@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] rtla: handle SIGTERM during a run
Date: Sat, 21 Nov 2026 19:31:27 +0800
Message-ID: <328ecfadb98649f317985124b6b49bae2d356bcf.1795258353.git.chaosheng.qu.linux@gmail.com>
In-Reply-To: <cover.1795258353.git.chaosheng.qu.linux@gmail.com>
References: <cover.1795258353.git.chaosheng.qu.linux@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

rtla installs a handler for SIGINT, and for SIGALRM when a duration is
given, but not for SIGTERM.  A run stopped by the system - a shutdown or
a service manager - therefore dies without going through the cleanup
path and leaves its tracefs instance behind, so the next invocation
finds the instance name in use.

Install the same handler for SIGTERM, and restore the default
disposition in unset_signals().

Fixes: 2f3172f9dd58 ("tools/rtla: Consolidate code between osnoise/timerlat and hist/top")
Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
---
 tools/tracing/rtla/src/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/tracing/rtla/src/common.c b/tools/tracing/rtla/src/common.c
index 8c7f5e75b..b86a60076 100644
--- a/tools/tracing/rtla/src/common.c
+++ b/tools/tracing/rtla/src/common.c
@@ -39,6 +39,7 @@ static void stop_trace(int sig)
 static void set_signals(struct common_params *params)
 {
 	signal(SIGINT, stop_trace);
+	signal(SIGTERM, stop_trace);
 	if (params->duration) {
 		signal(SIGALRM, stop_trace);
 		alarm(params->duration);
@@ -51,6 +52,7 @@ static void set_signals(struct common_params *params)
 static void unset_signals(struct common_params *params)
 {
 	signal(SIGINT, SIG_DFL);
+	signal(SIGTERM, SIG_DFL);
 	if (params->duration) {
 		alarm(0);
 		signal(SIGALRM, SIG_DFL);
-- 
2.43.0


