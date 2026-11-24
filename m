Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487619;
	b=mryVXzshDr6UXAvjniouyWaJ0ePRFrvyloxQpOWxDle1913q2Dx/QyeF9VeO2QEyxs55
	 u5esf7yTJHwNChWYbyzBwUVJoUWL76NOXcoN8GK6WBrxC4WKMrMkXzoaGO7jk1F/ICOp3
	 qGCa6nPqN3EvOUW3d6nehzrJ81VFxfVtP+BfX+CwagQ9+9m2HgJ5+BpmAgg/Aie0ghFwI
	 zfRiaIGsKMh8rmr6XkV44K2We0ZUKZDiv/pwwMN7Ap4z+z/XiSKFMjWOCQwA4MRFf8CWv
	 3siYtdT6cQpe5QW3p9g4TKLx1OaoukHfjbyzIWlrsEHxzj9lRph8H1sRkw+1CYTpLvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RQQttVqr/R7iBy6MzhUoFsIhHj8TNdW/zBA3gjiLRU0=;
	b=sJFj6SguNygTcgSojHuaks0YIJxYsF+iPTYGL3Jdi4pz1Lv0EBeJmE4+9EZcCzPuJXR3
	 g4JG9+KOmNl5zQu3ka9LJcea3c8SwHDcYIN+EPcD2TEZ220yKNvRwCL2+trKOIGWxpe6G
	 RWeXgcKTFuufXk4RJLir0l3II8J0C4vhUTFiYgP2OuTOizg3en259C1HEwAt26s5rdzfF
	 khajDGGl4aQwAaoRBmsxE3xQAeCLxW+rWToLfRsaWnc0ea1fffVzL+E95HpV+1aufNHGi
	 ho7hzG4/zB4sKpazy4/gxslufkUDu2tbSyjJuMaWiC4P0a+/qnrSYTc9TXl+rFQNBkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wN1Q5tPp;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7C7606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B7C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wN1Q5tPp
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so1801721a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795487618; x=1796092418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQQttVqr/R7iBy6MzhUoFsIhHj8TNdW/zBA3gjiLRU0=;
        b=wN1Q5tPpDRdN3DOfdq8rSdB5+m+y8Um4IX3GDkzYAUrrwfhoFSbzBdTmEtJDqFT4wZ
         ZWWgxFnd+w9bSslvyDt0J1e7OeJfkSbgEFClEx/HqmBQfX326yWffRxRi5Sw2DG0uDQg
         X3lmVtoynILiKMkkfWEEhMxmWXBHhSRtLC9U2kr3Wifl+w0Bn+T8UufrwPAlG3PJlAqQ
         66V+ymOAMphNjwt/jWhA9wPRKhpCj3k8LUlqSZtii148wTGHVqg/jxejLTdkAs5inCCE
         e1nOnicN+N2/EC+NB1IwX74uWIjppwHFbFGSpHA+Xe5GazU1lOL7cfeANwDKAm4GwzRi
         D27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795487618; x=1796092418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQQttVqr/R7iBy6MzhUoFsIhHj8TNdW/zBA3gjiLRU0=;
        b=ps5qoi01hT9WUdnyKuCVAleEfKmgN1lJlEK4VCO6BPZ86v+MLB3X5slTAD4fdlNJsH
         AJQWngmxSVkxU4y7EqEAS2037ljbZ2F4/zGJdXaVVFxLtkPGuXgDVPRFp7nPL6cuIhK0
         4CTXbeRLfOEV4BFCebQbsIDF1lLP3VUud9POa/WIpwdGAHca6UZ7AxM2HL3jFFCAxznj
         SqfeScQFOTEhGuIKYR2SPkVe+j+dmJSX/vKK+0oFvW5hFD/ZpjZ5pUE+E2jOyeWKDwP1
         A9XyJ0CHtKfux8A3WPBByzYRco4AilsrTfu7rw7O5Cw2XRzLJKAye5Yn0G4hO/D7TGQ5
         xT+w==
X-Forwarded-Encrypted: i=1; AL+hErFeuX74jwE1hzeChRlfJFIZeRbphclpP7XTzsmsEOQWmwNTpAT3tQEDbCsxlBn/NoSwv3OXfvBleisL4N8=@vger.kernel.org
X-Gm-Message-State: APuU4Z99YB75ihek8XhvbrXtNKkDLaFB6yZ6Fx4080yJp40qJUmtt8D/
	ARRh9ZU9N9dV7pBMDiqo0O4BYWKKj73495XQPl6/0CiDeo8+AnkGQBMJ
X-Gm-Gg: AZFdTZfO7EspSLNQOoFrVweWAEYrgPYmllg3/wVgSIxzFces1mztZgd1lCj6wLTWG/I
	WuKX/a/eB5XHOVK7ZiUWaZOPi9YmXIssDxQ/qGD+SUoIVClj93lDFcPq2MxCuX/1Arp2t4o2KAr
	KEKO0JxfIBVh4cB0tEXx5tOSxmS7Pyf7y8CtmX6lmsAe0vISEZxSgSC8AMGvKQbK852oq8fBdGZ
	zKWTF638QKpvgd8bJeS/eWx4XJIZuwk81FQApZ5Mh+o0Zkyn6D//9zojQzIPgYOcMyA6V30DGL+
	/JdC7DhzF8reOP16fLapYi/PjoV7+zD5cBE3k8uo5zA85p7ERas6XfZ43qvwO2IMp1DZp201isf
	vEAsymrFZfedprbSmOuAZH5brXG/4fH5lcuBzfk/kvR37wCUgM/bMOvnLGMUCT1e7xOP92iwX9o
	gRGVWmUxFNjll9ZE56ixLPRI5IrwKMtvLIYuKbnFZMbhD20O9DFeCwFoEoTulTUIKxUVWfJLCUO
	F9V1xsSAjC9uzsZfNu+JdzD3bWeZggmSb8mfKMQI+lWabL6mD9s9C3s6epqsCf17fp44esEars9
	02N3T8lMWJmmpy2K+AO52Fd13OtsqhIL4rOTsS3jrv3f/AV/JsB4
X-Received: by 2002:a17:90b:1644:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3b41c9a9cf7mr11736514a91.61.1795487617893;
        Mon, 23 Nov 2026 18:33:37 -0800 (PST)
Received: from fedora.lan ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde797af60dsm4709056a12.29.2026.11.23.18.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:33:37 -0800 (PST)
From: artem122novak@gmail.com
To: linux@armlinux.org.uk,
	florian.fainelli@broadcom.com
Cc: ray.jui@broadcom.com,
	scott.branden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] ARM: bcm2835: make RPCSEC_GSS_KRB5 modular
Date: Mon, 23 Nov 2026 20:33:35 -0600
Message-ID: <20261124023335.170889-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

From: Artem Novak <artem122novak@gmail.com>

Enable RPCSEC_GSS Kerberos authentication as a loadable module in
the BCM2835 defconfig.

This allows the SunRPC GSS authentication framework and Kerberos
5 support to be loaded when needed, rather than being built into
the kernel.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/configs/bcm2835_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index b469ecc36cf5..a8ae699e337b 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -187,3 +187,4 @@ CONFIG_STACK_TRACER=y
 CONFIG_SCHED_TRACER=y
 CONFIG_STRICT_DEVMEM=y
 CONFIG_TEST_KSTRTOX=y
+CONFIG_RPCSEC_GSS_KRB5=m
-- 
2.56.1

