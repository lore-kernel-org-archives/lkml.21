Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262619;
	b=0gXFlpG3fLBzNNI5zTOy8gR2Ahq9sWQDpkhcLirc/LimXeJDANS9VxbEwKUkVWddyhbQ
	 oOkJi3JoGnwZGibdbgf9x2yyYOTTayqTlbTGSAftA6LLsiTEDLlD74WDz92pJonow1SqJ
	 d131Bj5jpvgOtb+FthLz5QVaRD+u9e+FjIHOXKs7q6QexQt58ttbfDsJR80uiT4EhTAU9
	 QYcPyFY1UiTQPl8OeyTE5U+6NmuNtW5anbpRQ+MVF9snAVikh2tusSio4qv2ZgkjIec1i
	 b3iFDcex4i0J7YR/YbESTtDEVVC3gTUv4h2rIDzIwPr0sAakzPHbZrnBO0PAc+TRSwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8S5/KqNfuIt27SJJNZdfEe4DOCxa4rr3UivWTDl1Z8Y=;
	b=KoMHFaF1pWw2xujDOl1RbqUkOBIBEedu123DbTxoZjvPzbeM46jkn+3lEF3ib6KClCTc
	 PI1D3r2OniNVB9pJu7aCuKxpwNya0vi56H15dXOvWOICMEmaK6KqXqi+FQIygiy7EMZgL
	 /7cNnitylMVMLwjpeC3wYytN9H9BBGrauT//5YPk47mOHq24hBw7Kqf5LN0IUA9mjVxL4
	 hKQiF43o6/MDC8tzOoDV/S9vrWtp+4AicKJhrw9f/49omMqXxOwRKkDUd2CKalcJaAb5f
	 dvpsL7+uPKV8XoJQ/esspZg71VuN/ugGNNEVrPtg4RGXk/8UAulKcxJslH14/sW9Wpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nVihNDy8;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1578A606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1578A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nVihNDy8
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9e53d011eso14899435ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795262618; x=1795867418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8S5/KqNfuIt27SJJNZdfEe4DOCxa4rr3UivWTDl1Z8Y=;
        b=nVihNDy87HH1roi01mqOIvZ3A0P1CyQdsBF5oW+nMAaJbFW29GlWliLncjPJfM36ML
         CPLZ7TRrDufMD4vRRsQguJBPbSNNQNUPpRUnWSqwBRTetjMbfExEnvLA4xljAFDhd0KM
         uMP3keTZLAXh1xAuOXhjbdnKStCqM/X34BTLq6m8u5931YiG0SpFKL4XYwo4LlOhG2R1
         6jwtck+XLxot766E5D1oQ8Y0fCLHaXShxvoEINR1+ra0cVWVhzEsuccfFf8aG3YrSaNW
         mnGVRcvYdr7bBJPlsso4WuJLbSAU++xJyBQwyU+7ZZBu8vx+MglChEYiY7QmQ6VyMeaf
         jKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795262618; x=1795867418;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8S5/KqNfuIt27SJJNZdfEe4DOCxa4rr3UivWTDl1Z8Y=;
        b=Bf1Q6KAkqJ0dNADpfySsw5okYKiMerHzwyfhpX/yCEytY0R3rv6GWoqBk9/GNK78K/
         TBILu6WrRF+CFwVDqFM5prP1GIM873CfE/c3dEJ7l0U0UXSn4S/i9UcfWn/BibgOWAyf
         Lwo0gSR3A7p9hgBrhBkozgM+vYXUjPvtSPnFJWLjtGOC7/1ELz/iIt91XsOlSdaHYPcV
         c0Et8uUZlmSa4TrBKqFo/nPvS2OUCu3Th/rze5j1fNBJXJsZhiaTDHPvWbM2hS9LJ8pD
         1mNZ4mS6XklhKe+fXqy7nabuXOp2A3O5KerLTdtQcd3911dTJuONLW8/mu1LlXTcYfmw
         ljRQ==
X-Forwarded-Encrypted: i=1; AL+hErFFSLc+0wj14j7h6UrQk7plyFu3yZWOYVPfP/Bf85oVeBJONgn/qNHBuAbo9lT1VaAx2qvpX9Vlr9bEUGo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MQSRs++Bu6CeveBpBRQoaYEMS+jfTWFViObeuMTZusnL1YUqi
	DPjRuqLI/aYtmL5N9llUC8aN4BAMQXbgheAcoe2DWvTm3VM8pPdo9UB0
X-Gm-Gg: AZFdTZdM7mhjJ5K4NkJFmFEOWIq9iLFUKKbDpDwVtEtUtyN6a3nQgZpawJbd+paG/Lu
	yt6uYkm/qmxYpJFuZVhKAOvKqNY9gd+ELmFVAC0WfkdDdJQmnpUESCbkS0psIXSPvXnkmGW5pIW
	D+iXet6c7S47sfp2u0U/f0FsLReDf15PwCru4pwAV4a1x7gzOUnBsEJHq6MMPxC8kECYZKk/yRL
	3FB0S+TNCqHAsqB7vbrQHzvYSgYh2OLNDudlD2x06V1Y171RyjiPQbZWIIJuzhf/0V5y/qj5YhU
	tLxEkEh3KmmgcdLy7PqA1r/G3jCG1pAP8r0kb8KLWf06Abw5ek+p5QNvNZHX2q6fMIJMWk9E/2b
	UTIVbuFF3azWeZ+WSnyPvlhEYLjE/psMU//hT+AWDjIXlYk65iuaooFZ80Zg8FkFhpSjW+pYsbz
	+Rn5h91avy7c31YoltYHNk+Uf36F17Lmg5aA45SLeIR7bBTybJVfRniQlzeJ9sPK6YRWP4x3WWm
	Waf1IZrwKrXixJL8yJ1ohCBjNtI7jjb8Wk+tfwJjmIUEERCoYJSZSRKnZxLJqYXIfii/nO6jomK
	4+P2aqUJx4vSqGkecFnrkJNTNLFFN+L612EemgD8ig==
X-Received: by 2002:a17:903:2b0f:b0:2ef:d981:9576 with SMTP id d9443c01a7336-2f03f181ee6mr61370735ad.54.1795262618383;
        Sat, 21 Nov 2026 04:03:38 -0800 (PST)
Received: from [127.0.1.1] ([220.196.193.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2ab7sm25475535ad.15.2026.11.21.04.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:03:36 -0800 (PST)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: linux-trace-kernel@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>, Tomas Glozar <tglozar@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] rtla: handle SIGTERM during a run
Date: Sat, 21 Nov 2026 20:03:22 +0800
Message-ID: <328ecfadb98649f317985124b6b49bae2d356bcf.1795262546.git.chaosheng.qu.linux@gmail.com>
In-Reply-To: <cover.1795262546.git.chaosheng.qu.linux@gmail.com>
References: <cover.1795262546.git.chaosheng.qu.linux@gmail.com>
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


