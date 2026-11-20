Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202457;
	b=DvbUJDw0hWh/GQhHcUlclh4h362bAPwZ01wynFXmYlZrVtsq3F8lxOPHwQzWrLpcXpFp
	 jdPJt7H4l+EySN5TJF2nGvSVKv65O6l+njs9BWWWU7a3a+ZFsgu8BrrUgsy61xv/oOFJv
	 tTp0AtjQ6AUHgpXrb8zkNHY7E21oGu6zwTfao1csi4zfsgZJs0xEbupVNxArTl1UzvyKT
	 Ods7mlyB4YONrSx1A7UPQ15Syhc9NpajTh0qvKvq6d1gphNxztQ+ILRa9hOLhsr5YJdwf
	 H7tJw+c5krESxJjUvvKubaeNK9/Oac9PUF2ZOdJZPVK34XyFmbkXEziZ38iYAprF1vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=VoMTvxJbGh646Nyuw7EioeCVLIy7B/MUtUFhIYdjyc0=;
	b=MepuI9BxjzxhTvc8PbGG/1b5c1ul/yiSRyNl3xOH4dL3JQ/BvWMId8TVTjdQs1+RWJgb
	 SirJGTSo/WQsTGnuqwgrGwu30EYgYArq5m15ifDHc8x/fe75WKHjMvUsfmL8lgipZnqWY
	 CW1OVGNTzLzPUdhU5773SJW+gA75PMNq+se/9haLQVXx+jnesENQnjdcHlm77GaY5lRAs
	 EIb6BqlJQN9JWO/i8yuKphVEV3F9kS0PXGpfMcIqVNfxLdeGRQnfX2friqk4XOKarzVRJ
	 EUYLlQQtKNdYRl2IvXe420QGBJM+lZxFOjGTdrXxJ/bFTXgQRmz5gWFrpVDLZk/cVGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="PNy/163a";
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2B8606A6DF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2B8606A6DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PNy/163a
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1af203073e0so1389141c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202450; x=1795807250; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VoMTvxJbGh646Nyuw7EioeCVLIy7B/MUtUFhIYdjyc0=;
        b=PNy/163a2x9s3/pEbAqCm7CJck1+HdSY0I7HZUvlgOri0fLeEge0Y4GcA2rtgjhdF5
         g0HvR6bOrMu2uL6AJ/vM9D9IGQgS+6bbgYDwoEAzWyUOsnyDgmw/NKredxhQ/i6/lvOE
         lOOl/19rSLFVDfE9pJp1Sm6FhnqyXLV55l0Ok2pxoRz/B1QHr+I6IIN9dsW7JNOHLL7Z
         ki3wmDQQLHjL89Trta2nksg0+Mp8eWXvT98YZaRBRnaiuH4F5LziGDFpr2SX1MTaDlYa
         ua8kOqFv92Gl0PlBWJzHxaRKr/CyNVsDeAGtHyOIGozHTqdoM456tCeKozeY33RVARLe
         2ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202450; x=1795807250;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoMTvxJbGh646Nyuw7EioeCVLIy7B/MUtUFhIYdjyc0=;
        b=FIxj5ti0U1jpX1QGpEoVkmckkg3E30Gmse1j5cy4XqHAni5I0Gyi/TkZqMc8NJybZa
         itss0WeR84P/Csu4DbEREgFmVVq1o8BbadCj8+1se2NkEJLW6X2LUdxVN6RRICtulG4Y
         NVnZHsS8NK4bP83Ej+Tr202DneHr+qrChpapAF0UUuVcGuh18yEBlg9ln9s/GpFf7Xo8
         dZFQXjzJPaIddZZBFBicOjipripu2dNH2LW9n6YG5X9PbUprx7gdjz5tH0W6eeA+GCHZ
         84ck/oz5ozkqF4obF5sLfNKZ+ZsGht07VAMG8ecAOL/f/tDCwyU4E6c4IDmy9IDHVx/t
         Hj/w==
X-Forwarded-Encrypted: i=1; AL+hErFLj5gHA96d7rIYcJb2C7Vr7AxH8//0WJAs/8oQ7rLZyUVMoU5YKhTALNf2fGHrwjk9QqDa/Q9XS2dsiMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F31oJdvaK7RWckxpHWQuQkMAHYbdRYphNXHsRa7CjZV9KTq9G
	Jjklq5rjVpn47BX4Y2YXLyfIps9U0vvmO2L9/1hazoXXSuulhWDvo+w7yFvMJk/V+HAF0XvPOU6
	Gfg==
X-Received: from dldz14-n1.prod.google.com ([2002:a05:701b:418e:10b0:1a1:ce17:436b])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:8457:20b0:1b2:42e3:e5f0
 with SMTP id a92af1059eb24-1b55689edb4mr3489816c88.12.1795202450046; Fri, 20
 Nov 2026 11:20:50 -0800 (PST)
Date: Fri, 20 Nov 2026 19:20:31 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192031.2868216-1-elkin@google.com>
Subject: [PATCH] remoteproc: qcom_wcnss: fix NULL check on devm_ioremap_wc()
From: Elkin Cruz <elkin@google.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

devm_ioremap_wc() returns NULL on mapping failure rather than an
ERR_PTR(). Checking IS_ERR(wcnss->mem_region) lets NULL slip through as
success and would return 0 via PTR_ERR(NULL) even if triggered.

Check !wcnss->mem_region and return -ENOMEM on failure.

Fixes: f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region mapping failure")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/remoteproc/qcom_wcnss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 02f38fe29f20..abe0ab320d03 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -541,9 +541,9 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
 	wcnss->mem_phys = wcnss->mem_reloc = res.start;
 	wcnss->mem_size = resource_size(&res);
 	wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
-	if (IS_ERR(wcnss->mem_region)) {
+	if (!wcnss->mem_region) {
 		dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
-		return PTR_ERR(wcnss->mem_region);
+		return -ENOMEM;
 	}
 
 	return 0;
-- 
2.56.1.750.gf70dc682cf-goog

