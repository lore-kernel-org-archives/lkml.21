Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991953;
	b=K2I2C3eiqHb04w40NFXTqfbcRQ6yjA2QFr9bthiqRNhlIM9qBCTwr7oIfMW47ug/Vsry
	 RF2u8aqafnAMgX2wY/v2mvl7d/zcplwRB99uA2YObUrwKrAKAFwrpywIvwWaJ3Ws4kBcW
	 SpVXPZqyA80c/dHEUrv+S7gVjjmq3eAi54xTAI6VVZlXP7mn1LisSU/xxhjlMpvCYPKR+
	 LDPnSCbPewshuVIFCOHSrzQRmJltrkvkzlgVYKO3yRFCXUogulTLvNzF2/5pr4V2p3XMS
	 SIHVxxmHlTSZmRU73Uecsu9dhrVyyvbCXYRs+D/7CSz3vK379U0tn1L1jR3EjAnLgVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9fo6CdS9G/7kEH45TOW7Ki1K8L4FztyBsliBvW4TqJs=;
	b=tZfe6a64JOeTWJ1p5WMQZrO6vv6BeHHRawQbXR7Pa6bbKwtUGDf7lKUxjRuXEn9B9UWE
	 lJhWDTeb6rVQ3kSxDTZVEp1hc/e20QrynLZ+69Vy5lJP8WpjFLELcxWj1OuLWuwhzL2kG
	 Gjo/CjBiIn4r305ijYdE5+hsH8bYYud7G3qzj2+smcMz1vMrW6bIcr9O6nfz2bXt2DE70
	 /pWow+lniqod+0HBTRHMcNtQSZOwLaZF+TbwmV8y+ZiXMb+7O/E87dBCTpGDNQzD0Yw/u
	 eyoppdhk1QFhfP14SQ2wKJfeoG/2y+hIXf5b4M8MDARs2LwdLk/fbB4sOYE2vhmLYSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DkCUoBWJ;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA80606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EA80606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DkCUoBWJ
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50cc8e0f84so93274266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991952; x=1795596752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9fo6CdS9G/7kEH45TOW7Ki1K8L4FztyBsliBvW4TqJs=;
        b=DkCUoBWJt3y/gJ1E7Zpqfi/meuBSFvxhHksXJ7nsEXi1iOcdBWwNel8xIeAnJ3RDmz
         3hjL55OYoCQ5OeIfGUtqi4QGUr1Kfc4UNIhJNykVVa9UrPISZh9VmehDZ9sfJ7LBdbai
         3rus+M6oZ9JYopqwWIWyJUM3svs25cCJ97ewu68RRf+EkEV6bCsFDluZehZBRHjeeNSZ
         HBhptxpOzz4hKNS8GV7A1Rdzl94fKu+b63ThkY1OTQx/Kn6n7wCvYPb1R8C58D8r84RS
         inaZMXpr11wi3dPHefZVKU32jfvedXdfQaTMQJAkcLEpeVPlMeh5GVagbL3HDIXikekP
         0qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991952; x=1795596752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9fo6CdS9G/7kEH45TOW7Ki1K8L4FztyBsliBvW4TqJs=;
        b=sBhLI6tUquv6ERuW1t30dVZmyDROQuNfH8mYr9CWrKw8404I835vgpd3kAJmvO5FLt
         qY2mJzoz8bZVYKIaTC+ih0kRKzz6vVmErlqv1PFDMrptENiFG+tUlsd/1x3IbOrFjOOc
         uYGltC48caGE6D3rofCCs69JR2sBfb+O+k4qrr/L3X/FZUNnh8AphPJBIWEYvFaNuTlP
         bOMcEqUFqiw/gh6IMnMtt9cg+MjUtN+dd4A1O4589r/Ak0AkYsR3mOKOwccbpWfX6Qe4
         HbYUN3UroI59Zl9BO7sxJfnw6P5SYXwu277FDKvH8arg5qySYDlsfAzRKl/2250Xdky0
         YBIw==
X-Forwarded-Encrypted: i=1; AL+hErEq5M8M8m/OOr529qQQI90Ynt4QfoEDeInj7BfzhG3DGi0fnvLs/34wwZhbrhdimj1mQeHd3bgIQybmvuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QuAATBphqviCdr/BXyjuQ5vz6CtVP34C9R7t0csapWARbAyjq
	Q8qfQ9FSQGiIoiE+qlfRCLc9LxJ2qSZqYD/2mWaiVmvYFmN+Ju1y6qGN
X-Gm-Gg: AYBFou2yyiA5J8dOxThlk5Ez5chGUYvuJHhF0G0fgWfRXhboMTMdYZDoT3U2Ge8hlKe
	lwbz91A2Oj2gvyOfjsLmcI9/gTPOQ3ErcGUI+2jMA34pYtJQpZAn0wx7kKm6QRo17BmHQ7N3qAz
	wkaMy8EB5kZUXLLtVRcGHmapaVHd/VynmQCoticDo4gDL7cyD6DK9zfGK+8V1b9fRr3pkRFRJ/S
	0So6lU0cXmXMmLRxuPCugONR1EY7txRU+5FsOd0aiV3FJhB1Fk1c8hYgdm1AQIuJ0JYNiepd0t4
	p6Nfl8ZwvNI+oumj/rs5EA7j2uliKeOGJJxmafIsVV0RNIZfn31DptSomixHlgZ8p10rYCbyM9X
	I2nfxTvpUQYPKrUgU2XmQzgRMIpyGYo4EbFS4kL32S2Mq80vN26aeEGEXbMJo3iVSM57vX08TBh
	NoPc9VruhNGrIg53QsSS+gcDUVpmxBDCWsIgTyayXD0+5+7AZvt8tbDxvsTGtI/BOgn0YwXWA4D
	Mse8IH6NIZ47rMsB4Ci8gNspM92YywupeHKm93ZzwWE+bhIMbkkkxn5LHo4pY/ET4luEd8eL8Hp
	BIThEyTn8kdE6qLVnpW16RBCK8Cv+d0rvFFS
X-Received: by 2002:a17:907:7f89:b0:c45:d8aa:6ae5 with SMTP id a640c23a62f3a-c510e35d64amr124870266b.42.1794991951443;
        Wed, 18 Nov 2026 00:52:31 -0800 (PST)
Received: from kernel.. ([191.40.25.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510c83f31csm71077266b.10.2026.11.18.00.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:52:31 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH v2 4/7] rcutorture: Test duplicate call_rcu_tasks_trace() callback enqueue
Date: Wed, 18 Nov 2026 16:51:44 +0800
Message-ID: <20261118085147.1668598-5-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118085147.1668598-1-kunwu.chan@gmail.com>
References: <20261118085147.1668598-1-kunwu.chan@gmail.com>
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

Enable the existing duplicate-callback test for tasks-tracing by
setting ->debug_objects.  call_rcu_tasks_trace() is implemented
in terms of call_srcu(), so the detection is provided by
__call_srcu().

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Cc: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/rcutorture.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 3dcc3d4318ad1..0e8366eb2efb5 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1315,6 +1315,7 @@ static struct rcu_torture_ops tasks_tracing_ops = {
 	.irq_capable	= 1,
 	.slow_gps	= 1,
 	.nmi_capable	= 1,
+	.debug_objects	= 1,
 	.name		= "tasks-tracing"
 };
 
-- 
2.43.0

