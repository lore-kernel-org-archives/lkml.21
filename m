Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535187;
	b=llNTTaDrLuUP1cVWndbl2+fMnAJhCSQ6f5zcekmBZICm/uREAafAnHDjF8TQyg+GNo8+
	 Xykoq6abaVXZd1JJzMcI3/KGWzC2spcrIKRqu7YCr5Z+4vT7glQg9pOX5O/bZMqqHV8EO
	 AiUkSD/mELusADIiwlYAAbLk188haAjc9RJx+BDqcxGe66UuUI9P+AmSGueloeOxep+wf
	 Z6eZ2Li8Q/bkGUeZSaXQztSgOLhauAbCVzLo/dvFSYfjFbl1Uh29ItzKNYJfcmO+QPEkm
	 IF/HN3109ZsiW+P5VxAFOn8dRRvsTgm1rHgj4vZ9s7z5+Ama+SCvNDSrwy5OXIXqJOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TGbZUVyB/p7B87G7D24DxnnI40WatEQY2ar/09q3cHo=;
	b=QgZfBA502Wj1GrlTjkCX4rDV4aG0gs5PTMAedXZXapB0r8h19zAT6eNHEvMsAC+FNx6D
	 W/liLyvnCCsIGlAqW+fS/R7rwgiNX2Pgfj+ltziq3qiOsqzBEVmZo+qpPvDut6TG8/N24
	 PGirqo3KcrKYhJfvAtEN25WUtUX76qH8QNEjKiTe3hY7QWPnxQrIHkEqqXauX073OctB8
	 7loSAgG7ar1dRQZ0Ma0AsP1hw2XN36TudeuMVLkm3ivarNaqhi3mejI4Lh4zSBBSqC4jL
	 2TlygdC2JhD1/2I+5Iqj2VXGt6/+zB9qKSI/c/0UOs/lEDOdD1ZxGd4VkeX4VtjIDXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p8O0iMrx;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3615D606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3615D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p8O0iMrx
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-483d290f398so2565396fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535186; x=1796139986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGbZUVyB/p7B87G7D24DxnnI40WatEQY2ar/09q3cHo=;
        b=p8O0iMrxNQdgG4GBFZ9mtOtkuKcgiukJPtXP5Vv9QvmEXFw9wJufMOn+1FS90ZH8y1
         l5GSAZS0xnWW/Dicn8nTabX2yMC+DZT5Av68Ym8SnB8ye7OkVs5xYdHJRf9CMSn0Gu+h
         rWVIKT7b0N2sGZd3c1V3FU0XaDDDUBt+NQpewrXNJw/v3z67RmJExMhtOPJVzfKECX1U
         /xnIKFPPyRFq2d8OGdFxCBPT8TRUMsRtWW7IrDI6Nl+D98VCOcD/MfAKkjnknJJkTfP7
         3DrfwLhqr8QoaPudw+dBwQXAbXj70Yf9yU/sA/7ToNHp9p2yVK6gys1GknOh3KjIIGEC
         xU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535186; x=1796139986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGbZUVyB/p7B87G7D24DxnnI40WatEQY2ar/09q3cHo=;
        b=NnoLpScdShCIPWaEAb9Zd/tIFjquB0GxiAVvew/1N4ncd8cr5sUk++UPaJHtGrqd32
         lJu1wS68zA7oNhTpsZ4ZRYjTBqWcSZ04Jzjc74/ErO1hiUpOF7+RtYCRW7PaiyCX0iw7
         hLZaWeO7dkKBxog/IE3qghvT/9NJkdzfbdFBiSpOmFrs+1L40BXgF8s7jZ1gdHehQlR3
         HrUmlGkzb04TCs7UNEd5XB154EZuJP5Pa9wRy28Rd4g2pECuc8dDY05w+8JuGQj2k8qW
         CpJ6qIQ3/RlUvoI+qOgrB7iQH5944GVPDSJiU3MiQeDKZ8FyZrUpBipyNL6h7bjOrQjF
         avng==
X-Forwarded-Encrypted: i=1; AL+hErEEpCh0mgQDOoK8efSTHrLq3HIEa9Fh+oAXz48ICTPbtPGoMMWlyD8MYVjwVoch8DJIhzl7qoMhFboGGjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ujgLHGyDTCd2KUeX0pFBCwM1h5gitMpoDh7F0WheFc+FbEz6N
	IrClYWyzpHWwrXy1TNETP2zj5y2bBzo++V8CBUSWL0gWE1QuN3tg4RIn
X-Gm-Gg: AZFdTZcxqq+F4cCm/XETiXJydtcOe7WxQJGImLCuQ34b3usZOQtJ7wPB4/NTI6m96+S
	pGnW6s9ZMVOl6CfquGTIenXOYNcYVVNVmrHxhe3n1xocLrHTR3MewbTdLn6ublww1NKvrbFll2V
	ZRJZFSkLWBF8+5Q5AlMNI7tOX0k4TdhgwLJX1lVzuB48pcTGiKKq+2LFFvnTYwyKuQjs3hsamTn
	70eN9R0/2tUWVJSCf2Hk9NepGRXf9TndhypHRYlUd17leiseFZjbv6K4+izeoOCf+nEphoxvgWb
	sVfLbu8nKzDpBRuCUmAu2IFVli+tAnbHob2uu9Yx2iKWA1o0/0HbHL9HxYtZFusVgBK4Se01xu6
	DqC8BYLuwGls8GLd2JLJK046p3PpmzgnJ3+F/p/hBJ62ePF2Rkk0WJJR2oC7HptRRfgnPCv41Rd
	zDzqWuRwQoT411deTQ/mefjl4KRuKACdx2RrJdz+tH3oWgla9xyKBt6276et6ROIMr+23CwDjs+
	ZIsDv6zXolHeuZiU799yJ7zx3fgnsjLc2+SliGyeFxoUcY93I9s1UmatXSNh8N7QOmI3fi5gRHj
	PW3eLHwGEWQMAzyXwTWl/qzBkk4rwE1mrVGE+dVaKCTgmFyi99tnp5qYdUpmMNzCNshi+ETW9d0
	cnN1fchkwmu+vIp9eL3wzqfvSZC1YoO+4pxvi3qPaZAuTBddUHmFesyu7m9vw9n9uni4=
X-Received: by 2002:a05:6871:7bc7:b0:4a7:2bbe:4601 with SMTP id 586e51a60fabf-4bc85af4396mr12338931fac.57.1795535185954;
        Tue, 24 Nov 2026 07:46:25 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd044fc4besm12324129fac.7.2026.11.24.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:46:25 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH] ARM: keystone: Fix OF node reference leak in keystone_pm_runtime_init()
Date: Tue, 24 Nov 2026 15:46:21 +0000
Message-ID: <20261124154623.340362-2-oss.patchbox@gmail.com>
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

keystone_pm_runtime_init() calls of_find_matching_node() only to check
whether it runs on a K2HK, K2E or K2L SoC. The node it finds is
returned with its reference count raised, but the function only tests
the pointer and never drops that reference. keystone_init() calls it
once at boot, so a single reference is leaked.

The compatibles in of_keystone_table are only used on the root node,
so use of_machine_device_match(), which checks the root node without
leaving a reference behind.

Fixes: 8620d2c536dc ("ARM: keystone: fix PM domain initcall to be keystone only")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (ARM multi_v7_defconfig, W=1). I have no Keystone
board to test it on. All uses of the "ti,k2hk", "ti,k2e" and "ti,k2l"
compatibles in arch/arm/boot/dts are on the root node.

 arch/arm/mach-keystone/keystone.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/mach-keystone/keystone.c b/arch/arm/mach-keystone/keystone.c
index f63671a3024c..4e1f02a73887 100644
--- a/arch/arm/mach-keystone/keystone.c
+++ b/arch/arm/mach-keystone/keystone.c
@@ -53,10 +53,7 @@ static const struct of_device_id of_keystone_table[] = {
 
 static int __init keystone_pm_runtime_init(void)
 {
-	struct device_node *np;
-
-	np = of_find_matching_node(NULL, of_keystone_table);
-	if (!np)
+	if (!of_machine_device_match(of_keystone_table))
 		return 0;
 
 	pm_clk_add_notifier(&platform_bus_type, &platform_domain_notifier);

base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
-- 
2.56.1

