Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719112;
	b=rv7NMA9/G+9ywTsOmCUpm6TxwqP/4yi2sWaYKFFOxJxDWWyFEEXpqpJDlXaATpuANdr+
	 eDXSQYB5gsJxlc0Qdpi9q23D9lxJE5SxK4eYweAzhvi/65e/1BY91OEI9y3CkM2lRjd0b
	 Xopw4r0R8dV5nj/ORpnMl/CBo1lJRDbfbERrY/VWchvdqo8EtQVJmvNVDWSZkKBgHFedx
	 CPr2IH0513xJjb31SKDrToTWVWLZzclZIDYDWpMIQoyp15ZbCsg7qAZ891vm2e35FZF4x
	 gRoMA6K8SwwZB7+MjbF9Bcv7b9I06y5119iwDfUQPl5qfr7gBUNU7S619HrVpwjc1cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kYGOzbA1I+QklP7wQmqOkXCiyHLJXI88dbU0zIHviR0=;
	b=l/zZxfOAcBTaEVUmKnCkbLot3wuNr1vQWNySiwIWf83UUnYZn4GHlhNhpdTSsO8GVA0V
	 HF6sE26Bg27K4EIt6UsdQblmWrielOxb27VOVSrWsnhvx7ooO2hbUjWW3SnTV6TFz6zLn
	 IF2Dh7uTuqZyXm9RtMaw8+KWHoWvisriuFyYNPLG+mIKLsV3xdeMGk3WRRO2BC/Dv7mCX
	 n1QpJNsVwlsvA9Pw+oTdT+4f6cxDol0N4RaopodnztxHNpwZh4K280E+iVV6GbdyL6lQ/
	 XeOOSkynMR6gLO8EYpbDa82Xj+gaKxGovVyxKJllygzRO8oTs5ZRE1n/5MAOU18VDQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rjEesXqy;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91927606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91927606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rjEesXqy
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f05bc71e01so31105145ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795719111; x=1796323911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYGOzbA1I+QklP7wQmqOkXCiyHLJXI88dbU0zIHviR0=;
        b=rjEesXqyaZX2IbaL+2CSwNwSximxJwALLokX9JnPjN2He9FMk4oDvzgksHoI3QRjpa
         PbOPDPMItAwGKKQ09PvFw1O0Z2fbizpGJ4qnxOuTCEFzeTsApo9YxhjsNzMgoqOHk0NZ
         kBqiIMU3dgFi3mL5ZaHgBhoHHkoTMHXc7CgLHMuFbybKXeg5nOheiLOZ8iJkn2Ol/Nwd
         R9uJgPel0IJBs55SjD6TtdqLDDVDj8i53OJgPlUOLIccAZzUrsV+gYDu3srpxrQ3sdgv
         bphBLn6byam6RRpFzBijDfApfxNq9fKIMmjy6T7dqaFPvQxKNIpsDvoxj7z2tIGqdAKH
         sEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719111; x=1796323911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kYGOzbA1I+QklP7wQmqOkXCiyHLJXI88dbU0zIHviR0=;
        b=RAklsAG4JFxeG1dREwRx7RwuZOwYJWO9s0RvLgqPR10DvZC19JhkerjQs5eeAIvn63
         BOumf/4cyAQnrbxfFSwkM7LHW5lwzP6vkJINO3qbXnYfPG4HWaKj/JxbvE0jB27ExgbB
         SeRCRhRNOT3Wgr1C2uDEiijzIX436wC8gVjhzbgmdEHS6AoueOn6Um52ctwjoqPXyFJK
         /VEKQWltwIE2NuMzJW/pwiOLlYWQzp876AemTCtXIy94+M/1WOfnIoy1xsmrWj1DaOAv
         uYCS08JmbxGR858i0D+/b2YEPuogdwUjokfIwoPaQ/f4cnsSc8KR4392tHz2S8XP69MM
         s9ag==
X-Forwarded-Encrypted: i=1; AL+hErGz91VZdrB76LmKedCi2Z+UR/jjYkztmw2mD1TE2IhZFHt2KABbKXnGlxircTpoxS4A7DeuOuu4ONvCDEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xK2ohNYlMlCvas9ZVJ6xHzioQY9E+/gFI0vlPowW+p67eG3Jg
	13lqCONQ4pu/DTyQRmijOS75vunQ1TDNxAVm96fX79I6K2QBoU9+6L+P
X-Gm-Gg: AZFdTZcZXQyDfzm7HHNUNUPeySRQ9yJETb2eP2MRUWti7vIzhsiVMIkMGse/jeKImq9
	MHsv+fLDCS5nTOp4Nh2B68tRO40xqsPWYZ/rSN/3n1I0BT/6G8mGdxbvGtkwtFtFC47r32w6iTC
	1atMI9A57up3yvCgnPisDjTUahvKgUpJLazpi487GH3U6WUB50gpDIECsiH31KmWVDohU/AFm8F
	dx3gn8KZmfohSlPUF+q3y/EM3H2EUOEQjiWZmwO0A+quX7in+4fHek8xaAViJeyTX7Y62MdAB8e
	AHxgdl7TINSEfRX5txgeveqMj3xjhT1dle86U8NeD1BUoKDhnr/FwtbEFPq4P6zpvNjSfbKTYlv
	9uMbPVqGAIecKBrB6tcOBQglR65IVNFxINnuTfPHK9HLmAsdNh0XNYqmXbAXZILGBYLtd9LF4Qw
	Ywn1zsT58G73wjNhRj5umfODZ8yYym80C4TQSVvfOCEBR/NC4XPCPmTf35R6FiCEqgBFiOClL78
	gzWKHyO2gxTafZoBAo1HtJx1kX2wDbNNOlnDZZ0odWJsM7sRoYoyhK/25/FM72sPZbOUT8Qw1UE
	pZohqSza6SMl28JUs0Bb46+PrWq69WvZo+LzCW5z5bIoTHABQBeYC2Jv7sJEM9ROSPiMuocpQcy
	M2jDoOzKxQeBzqzNnt0bcLS8=
X-Received: by 2002:a17:902:cf08:b0:2f0:59dd:4d07 with SMTP id d9443c01a7336-2f059dd50f7mr194323705ad.38.1795719110931;
        Thu, 26 Nov 2026 10:51:50 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm112041665ad.67.2026.11.26.10.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:51:50 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 5/7] m68k/irq: Add empty irq_eoi callback to auto/user IRQ chips
Date: Thu, 26 Nov 2026 18:51:18 +0000
Message-ID: <20261126185120.3815699-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126185120.3815699-1-visitorckw@gmail.com>
References: <20261126185120.3815699-1-visitorckw@gmail.com>
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

When an irq_chip lacks an irq_eoi callback, chained_irq_enter() falls
back to invoking chip->irq_mask(). On auto_irq_chip and user_irq_chip,
this leads to a NULL pointer dereference because autovector interrupts
are masked via the CPU SR rather than dedicated mask registers.

Add a no-op m68k_irq_eoi() callback to auto_irq_chip and user_irq_chip
so chained interrupt handlers can safely attach to these chips.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/m68k/kernel/ints.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/m68k/kernel/ints.c b/arch/m68k/kernel/ints.c
index cf2b13488476..731d04ac95bd 100644
--- a/arch/m68k/kernel/ints.c
+++ b/arch/m68k/kernel/ints.c
@@ -33,16 +33,22 @@ extern u16 user_irqvec_fixup[];
 
 static int m68k_first_user_vec;
 
+static void m68k_irq_eoi(struct irq_data *data)
+{
+}
+
 static struct irq_chip auto_irq_chip = {
 	.name		= "auto",
 	.irq_startup	= m68k_irq_startup,
 	.irq_shutdown	= m68k_irq_shutdown,
+	.irq_eoi	= m68k_irq_eoi,
 };
 
 static struct irq_chip user_irq_chip = {
 	.name		= "user",
 	.irq_startup	= m68k_irq_startup,
 	.irq_shutdown	= m68k_irq_shutdown,
+	.irq_eoi	= m68k_irq_eoi,
 };
 
 /*
-- 
2.56.1.839.g22a8290db9-goog

